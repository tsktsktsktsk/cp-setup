#include <templates/init>

template<int MOD> struct mint {
	int v; explicit operator int() const {return v;}
	mint():v(0) {}
	mint(ll _v) {v=int((-MOD<_v&&_v<MOD)?_v:_v%MOD);if(v<0)v+=MOD;}
	mint& operator+=(const mint& o) {if((v+=o.v)>=MOD)v-=MOD;return *this;}
	mint& operator-=(const mint& o) {if((v-=o.v)<0)v+=MOD;return *this;}
	mint& operator*=(const mint& o) {v=int((ll)v*o.v%MOD);return *this;}
	mint& operator/=(const mint& o) {return (*this)*=inv(o);}
	mint operator-() const {return mint(-v);}
	mint& operator++() {return *this+=1;}
	mint& operator--() {return *this-=1;}
	bool operator==(const mint& o) const {return v==o.v;}
	friend bool operator!=(const mint& a, const mint& b) {return !(a==b);}
	friend bool operator<(const mint& a, const mint& b) {return a.v<b.v;}
	friend mint operator+(mint a, const mint& b) {return a+=b;}
	friend mint operator-(mint a, const mint& b) {return a-=b;}
	friend mint operator*(mint a, const mint& b) {return a*=b;}
	friend mint operator/(mint a, const mint& b) {return a/=b;}
	friend mint exp(mint a, ll p) {mint ans=1;assert(p>=0);for(;p;p/=2,a*=a)if(p&1)ans*=a;return ans;}
	friend mint inv(const mint& a) {assert(a.v!=0);return exp(a,MOD-2);}
	friend istream& operator>>(istream& in, mint& a) {return in>>a.v;}
	friend ostream& operator<<(ostream& out, mint a) {return out<<a.v;}
};

typedef mint<mod> mi;
typedef vector<mi> vmi;
typedef pair<mi,mi> pmi;
typedef vector<pmi> vpmi;

vector<vmi> scmb; 
void genComb(int SZ) {
	scmb.assign(SZ,vmi(SZ)); scmb[0][0] = 1;
	rep(i,1,SZ) rep(j,i+1) 
		scmb[i][j] = scmb[i-1][j]+(j?scmb[i-1][j-1]:0);
}
