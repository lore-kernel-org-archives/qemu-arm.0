Received: by 10.25.44.15 with SMTP id s15csp669871lfs;
        Fri, 21 Jul 2017 06:31:43 -0700 (PDT)
X-Received: by 10.28.45.197 with SMTP id t188mr5124962wmt.78.1500643903489;
        Fri, 21 Jul 2017 06:31:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500643903; cv=none;
        d=google.com; s=arc-20160816;
        b=MwVt85D1hs+UbEREkQPdU6OxCnKXOIDlBVtyJj4z1Lv7APVn8hka5IltaA/TUgBUuL
         vj8x9Lgf1kiPjywIEM8VWA1jVWZWWxZ6XnxRosxU9g3bjDq84LrDegKPCEtFglnWd8Kt
         5Wy07fE2tvKY4uRe6YZasiszBLQkhCknODdbvrpegr52ou9l383p98QC1a2jbt2+XYOe
         ZGoXxQGULk0oTidFHNvFyXhPeIOV8Q3UwgUGhf5WETdnCnJ7uj8Al6hrPIfuMqEzj42n
         laRgrmRWSEsm836vHyb5j0En9zuV3IsT9D529+zsN1Z662SB9+Tixb3r+unJ4jkhzqqQ
         dHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=RuHqhGp7EZB38wsOmOtIEylRSVlIPtm+JCcrcOve1TE=;
        b=knsvj93fINA8sCE1g+YktODWGYNrKAWcB+LKfuXzeo02wq62FdBvkAzSYy6Lqc29kL
         ZlJAlefndTT+zcM/Eo7mNe5FWlzDgsS75gVagDqam20bccYzpLSiO3z/qxeguM6Phd5i
         BWR45mL0jsUF1trfGxnurfQuXwISrZvcLZnX6tUXY7Bt3HWCAvAcqbVz40ntknWqTAnc
         Jlps2OxJ/zplsONwIzuUaHM7C1YheSQNJptwr7myLBhk+EOfTwrkLxf6B/Luzszt6gZg
         mF8DB779l69YHlIWIbgGgbhX4V9PYRF18x1s/fzZiCm8JEpJF+qeV7Z2I2dBE6tuYGYl
         JDzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) smtp.mailfrom=aurelien@aurel32.net
Return-Path: <aurelien@aurel32.net>
Received: from hall.aurel32.net (hall.aurel32.net. [2001:bc8:30d7:100::1])
        by mx.google.com with ESMTPS id 2si7736883wrk.112.2017.07.21.06.31.43
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jul 2017 06:31:43 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) client-ip=2001:bc8:30d7:100::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) smtp.mailfrom=aurelien@aurel32.net
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::1000])
	by hall.aurel32.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dYY1u-0002af-RP; Fri, 21 Jul 2017 15:31:42 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dYY1u-0001IM-Cq; Fri, 21 Jul 2017 15:31:42 +0200
Date: Fri, 21 Jul 2017 15:31:42 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: "Daniel P. Berrange" <berrange@redhat.com>
Cc: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 03/23] softfloat3c: dos2unix
 all files
Message-ID: <20170721133142.uy6we4kf5h6zi4mt@aurel32.net>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-4-alex.bennee@linaro.org>
 <d58f694c-cc8a-fb0f-f01c-ba1e2eebc6e1@twiddle.net>
 <1ff55ec6-b8e5-8696-7472-0ac22073ddf4@redhat.com>
 <87ziby6udk.fsf@linaro.org>
 <20170721092758.GF17693@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20170721092758.GF17693@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TUID: p+mTlW/6uvjg

On 2017-07-21 10:27, Daniel P. Berrange wrote:
> On Fri, Jul 21, 2017 at 09:56:23AM +0100, Alex Benn=E9e wrote:
> >=20
> > Thomas Huth <thuth@redhat.com> writes:
> >=20
> > > On 20.07.2017 20:59, Richard Henderson wrote:
> > >> On 07/20/2017 05:04 AM, Alex Benn=E9e wrote:
> > >>> This is a massive but mechanical patch, the result of:
> > >>>
> > >>>    (cd fpu/softfloat3c; and find . | xargs dos2unix)
> > >>>    (cd include/fpu/softfloat3c; and dos2unix *)
> > >>>
> > >>> Signed-off-by: Alex Benn=E9e<alex.bennee@linaro.org>
> > >>> ---
> > >>
> > >> Really shouldn't this have been part of the import?
> > >
> > > +1
> > > It's only a whitespace change, so please squash it in the previous pa=
tch
> > > instead. (You could mention this in the patch description that line
> > > endings have been changed to unix mode)
> >=20
> > Sure - I just wanted to be clear of the steps I took should I want to do
> > it from scratch again.
> >=20
> > One thing playing in my mind against moving to SoftFloat3c is the
> > inscrutability of the upstream. It's nice there has been a new release
> > with new features but there isn't a source repository or as far as I can
> > tell a development list. It is basically as far as I can tell a one man
> > project albeit backed by academic funding.
>=20
> This is no worse than the situation we already have with SoftFloat 2
> though is it. IOW, as long as we fully move from v2 -> v3 eventually
> (to avoid maintaining both indefinitely) we're no worse off from the
> community POV. At least v3 has the possibility to be become more
> community driven in future, where as v2 is essentially now a obsolete
> version.

It depends if we are able to get (at least part of) our changes
upstreamed. Switching to softfloat v3 is likely to be a substantial
effort, and we probably don't want to have the same discussion and do
this effort again when switching to softfloat v4. Now if we are able to
get our changes upstream, switching to softfloat v4 will be much easier.

Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
