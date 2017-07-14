Received: by 10.12.150.144 with SMTP id a16csp467805qvd;
        Thu, 13 Jul 2017 23:32:40 -0700 (PDT)
X-Received: by 10.55.192.148 with SMTP id v20mr9947888qkv.263.1500013960895;
        Thu, 13 Jul 2017 23:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500013960; cv=none;
        d=google.com; s=arc-20160816;
        b=H2l31S38hL9xDpoWr/JInIUHVTYThb50I1VvShe/EIl48zsxnegDc4G8D0NViIFgqE
         f+3SE1niFTnp7MtgjClt/tLMfOKFUNzm8TMhK0qAWMd7u2Jkki3/FPDlI26FIT3tx86P
         773l/D+Sk/2Hy2MFIuROS8VxE10DpeNacD0s36AqKPw6LFQnDF+Wx8eW8bM1OeSdDPBg
         p6vTZaG0ylxFPqUDOZfxtajn+XvFaAjC3WNC86aS2V03HiL+YJGgxYjE3sOmma//igNc
         ObzHJ9p9pEM9GlvE4+Kc+U4pBNmigw/Wpe2PuGqxeaHeA1k6QfrAsAH3s0XeKZnKxdXG
         ATwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:references
         :in-reply-to:date:to:from:message-id:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=NuOKbAhPlP3Q12aj/PAilnNB1xTvVZ1a3MChCTJJIf8=;
        b=dtp96G9mpkeH+NT0p8l/hHFQPB5O6oNV0CqWXen3oVybcrO3sz9yhdOgNzKwz0TIk7
         NHbilZFDsV8hMAx8IC39mCebV4wyjKfRUdIy7HBPcN9B2kRSUaeZBgPHszaU0wGhW2PB
         3DlGyrAkngZ0nSh+H6QXJqnmpIv+uOCqJHXpo9LRe+0e7cwWVjzdqwE3lK0jzmQzBo++
         A3LzSi6wME707wYq25CNBS6gpY0IYAcAnxuadvKmMO7KR/9C1ucYAU7M9Poore8DwIz2
         LomS1xbBJYgDqwydKVW7NjGsoJXixR/9XRuN6WRAPharuLX0B9PagJ6iDGKAk72DZ+pD
         1Stg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@aj.id.au header.b=lDRVBSZE;
       dkim=fail header.i=@messagingengine.com header.b=n3O0APU8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k48si7181420qtc.198.2017.07.13.23.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 13 Jul 2017 23:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@aj.id.au header.b=lDRVBSZE;
       dkim=fail header.i=@messagingengine.com header.b=n3O0APU8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:35795 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dVu9W-0007yz-JV
	for alex.bennee@linaro.org; Fri, 14 Jul 2017 02:32:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45050)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dVtxs-0005m1-L5
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 02:20:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew@aj.id.au>) id 1dVtxp-00046r-Do
	for qemu-arm@nongnu.org; Fri, 14 Jul 2017 02:20:36 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44929)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <andrew@aj.id.au>)
	id 1dVtxo-00046V-So; Fri, 14 Jul 2017 02:20:33 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id D0A7B20BDC;
	Fri, 14 Jul 2017 02:20:30 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Fri, 14 Jul 2017 02:20:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=NuOKbAhPlP3Q12aj/PAilnNB1xTvVZ1a3MChCTJJI
	f8=; b=lDRVBSZEy7EocwuT72A3g+hnvBV3P0u8H4pKd0tDpj4jpmF217Pgu/DbC
	rBVVz0CeXar0aqY9w/7s1DIE0Nrm9xw3YTzZr8HyXaD2OsM24yDK7IzodkVzjGTe
	C/w1hkXi2dLD5qtxFYNf0Y7YQk4Jxmp4KcCY4UDq2ytpYDytR7eG9XtHiEfEDBQx
	K5igJBfx01LiNxgfkJCfn8j1EIyOzH1zpqRrx1qP58UiMTGrhXlVVdKtOqllaBOi
	QdSNKy+5/HY0iGq6v8VnLDWWt4A/ugiahe4MeBxt3MUZrSMYTVhuX0Aab6l8E/7Q
	7F28eaUrkkQFUqQm0ttR3Y+CxNLuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-sender
	:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=NuOKbAhPlP3Q12aj/P
	AilnNB1xTvVZ1a3MChCTJJIf8=; b=n3O0APU8wlseNh5FcOi3s7G1It7DyaOQFw
	i5qlaxtLcRB290FfIa0rkVl7bmibMWElAxDC1ifTWrQKCQQGwgfD8HEswEdOVF51
	/Fxln4zjeFEKRo817kaXnlFKcJkuM9PX4Ys4JcMF+0UsjBsRQvkkrlEw/BXK1cEN
	T0Ylb9LwOfmkdrU4VTH+/xbdOiLgKDGYhhuL4Q0c8vW/t1LlHK6jgpsempIdyZ7Y
	nNWs6DB6wYMTE6pWShYg3jYXn1RontshuiyICZm2g7uhtyocAwfn5zpf3m0VvDjO
	bWIFyR/OKwAEVfH+2IkqU/zqmbwLnig34SXYrbXtlTiSEJoaNcZw==
X-ME-Sender: <xms:rmJoWZi3Nv-jrCX688jC38ZaSASS5nt4PkCA-_CSbiosj8DSJRn93Q>
X-Sasl-enc: nCjTRfeSpdfeklM/kIJfa7WqbdDxKFa7UVEVTXHVJDc3 1500013230
Received: from keelia (unknown [203.0.153.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 4511F7E2B6;
	Fri, 14 Jul 2017 02:20:28 -0400 (EDT)
Message-ID: <1500013222.7221.1.camel@aj.id.au>
From: Andrew Jeffery <andrew@aj.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Date: Fri, 14 Jul 2017 15:50:22 +0930
In-Reply-To: <cd1aba90-176f-9ec6-3e2b-d1135156a96d@redhat.com>
References: <20170630030058.28943-1-andrew@aj.id.au>
	<cd1aba90-176f-9ec6-3e2b-d1135156a96d@redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-2UB3BkSyBZB/ABeTxBvo"
X-Mailer: Evolution 3.22.6-1ubuntu1 
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.25
Subject: Re: [Qemu-arm] [RFC PATCH 1/1] memory: Support unaligned accesses
 on aligned-only models
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: f4bug@amsat.org, qemu-arm@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9o1C7QEI4Dfz


--=-2UB3BkSyBZB/ABeTxBvo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo,

Thanks for taking a look!

On Thu, 2017-07-13 at 14:05 +0200, Paolo Bonzini wrote:
> On 30/06/2017 05:00, Andrew Jeffery wrote:
> > This RFC patch stems from a discussion on a patch for an ADC model[1] w=
here it
> > was pointed out that I should be able to use the .impl member of
> > MemoryRegionOps to constrain how my read() and write() callbacks where =
invoked.
> >=20
> > I tried Phil's suggested approach and found I got reads of size 4, but =
with an
> > address that was not 4-byte aligned.
> >=20
> > Looking at the source for access_with_adjusted_size() lead to the comme=
nt
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0/* FIXME: support unaligned access? */
> >=20
> > which at least suggests that the implementation isn't complete.
> >=20
> > So, this patch is a quick and incomplete attempt at resolving the issue=
 to see
> > whether I'm on the right track or way off in the weeds.
> >=20
> > I've lightly tested it with the ADC model mentioned above, and it appea=
rs to do
> > the right thing (I changed the values generated by the ADC to distingui=
sh
> > between the lower and upper 16 bits).
>=20
> I think the idea is okay.
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0access_addr[0] =3D align_down(addr, access_siz=
e);
> > +=C2=A0=C2=A0=C2=A0=C2=A0access_addr[1] =3D align_up(addr + size, acces=
s_size);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (cur =3D access_ad=
dr[0]; cur < access_addr[1]; cur +=3D access_size) {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0uint64_t mask_bounds[2];
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0mask_bounds[0] =3D MAX(addr, cur) - cur;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0mask_bounds[1] =3D
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0MIN(addr + size, align_up(cur + 1, access_size))=
 - cur;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0access_mask =3D (-1ULL << mask_bounds[0] * 8) &
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0(-1ULL >> (64 - mask_bounds[1] * 8));
>=20
> Please use MAKE_64BIT_MASK.

Okay.

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0r |=3D access(mr, cur, &access_value, access_size,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(MAX(addr, cur) - addr), access_mask=
, attrs);
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0/* XXX: Can't do this hack for writes */
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0access_value >>=3D mask_bounds[0] * 8;
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> Can you subtract access_addr[0] from mask_bounds[0] and mask_bounds[1]
> (instead of cur) to remove the need for this right shift?

I haven't looked at the patch since I sent it. Given you think the idea
 of the patch is okay I'll get back to working on it and think about
this.

Cheers,

Andrew

>=20
> Thanks,
>=20
> Paolo
--=-2UB3BkSyBZB/ABeTxBvo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZaGKmAAoJEJ0dnzgO5LT5k6IP/0tbvIBFL0okRlpM9nhRRC+N
qYUPBmgY7NVBQ2ihkPuHU5iW0OHdB/jul1Ztzo2FT8IDSzavclvIerU2k/LqJtnP
Et8CFqoW4nFfk2cyhOM0JtdFqr6auFL75tbZxnG6bZq1kqluyHkZAtG4CvmfYQRE
yBw8lEpLrKOUdVTobEEkJUUziUibHOyrSFoVBihU7t42lZO3SV8BV2061qtiJxeM
SKZXjaDf1O4PvLUtk+nbL7jMZ4+u5c78R6c+jdSlTDSB79L1rIRsA3pLu6HMGm3K
dOeRmtH2Oq2WeDlm+uBxhCNcMirEu0m1Bgee1rI+MieNgkFr0UgLW944u2oYYEe+
G8Touj2TRuldY8anD9mEnxm4ZzLaHxM37KETI24CGvAsCiwJXtxxXYpFyLJF7VyO
/SoOAkegLGKTIA2S1fNaJmFcGCzwUugT3WchsQ9XQRSO7F6i22Aw3At+WzrdVzf8
Jh2N9bVxnF8YsnmBzA+ot1XZCvetcfw6RMfgCNcPcn0gg1qGc5UGt6UE6ec+cGh3
Tc7/mx/qt9cWfRVYsGTNo3fyP5279Pngxxm+ggYWLKDC7Yb9YebZLLz/zbbjwoHo
W210K8Zh6TihlXGPbvfkxRvqGDBAEX0oWQy4FNmqzcvzkObFx6TmycN6+ji/XDWn
jJkfNb1fd5INENcOwhZK
=TKBj
-----END PGP SIGNATURE-----

--=-2UB3BkSyBZB/ABeTxBvo--

