Received: by 10.25.44.15 with SMTP id s15csp663227lfs;
        Fri, 21 Jul 2017 06:25:35 -0700 (PDT)
X-Received: by 10.223.128.177 with SMTP id 46mr9978952wrl.150.1500643535350;
        Fri, 21 Jul 2017 06:25:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500643535; cv=none;
        d=google.com; s=arc-20160816;
        b=BtV1+q88o+rzIu0rZvbcf5Oo6R6HVSy9rVnNUjHSpijoS8u5w5UvuUT2nGNZz3n/Sv
         volT/Ns+sxjzdHOmDxjKjDuqOxPlfvmViwzWZdUJifVjO/ydaS2mrsPDcTnIhvwnhy9r
         RIGoZHRa2UK6Oy48uRg+nCUc+d8ycfpYDe4WBEjfKDuaWMfWZPHekSWOxw0+NEUAUiG8
         +qT28Uq/xQtDaxEnJO4sbpIQM15h9rj4ZYs1oqFi5dAQgK7ZdAGL5q8ec3nRmW4PWKNx
         sHsRloyIs9csT60nFXekTAqbR3ncK6mkF3oM4atokZZDCK3OEk1LZE56awqCjPpZBzWt
         Cn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=9dcCKCpwfzSGk7yMi9tMTVEnScerJDWz+CaBF79tNEI=;
        b=u76jDpX0Cw3+j5+i5sZVZ0K1vi8G30FQIBD2jVDMvxsiZ7YPEv+t5+K/i5AvRwa+Iq
         PJQHSvowVRDRKEWfPvMHqOz1C914Y0DxhrhEF3+uIB/KwqnK8jLl6Q9joyZNnZLwgbMW
         Iaby+n/Y4/kOLw9doP6asbOA/K9iDlEB2EKgZFWzhtB9frtVON7U/tnVz4hkwvSgdmK/
         crHp8th4LVikbH7HcDUQewNKQ73i3ma+F+OyFPLFm9+hCW0E+n3Mfy8CLOKwv3MxsQdo
         /+8ccpwkUWR4cNygWKgRwkBIocYxy59ZIVdt3rUfDDrZKfkPK0uo/k1h8Hrrrub/w38E
         IWFg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) smtp.mailfrom=aurelien@aurel32.net
Return-Path: <aurelien@aurel32.net>
Received: from hall.aurel32.net (hall.aurel32.net. [2001:bc8:30d7:100::1])
        by mx.google.com with ESMTPS id 60si4454833wrq.87.2017.07.21.06.25.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jul 2017 06:25:35 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) client-ip=2001:bc8:30d7:100::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) smtp.mailfrom=aurelien@aurel32.net
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::1000])
	by hall.aurel32.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dYXvz-0002Ip-1P; Fri, 21 Jul 2017 15:25:35 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dYXvy-0001GO-KJ; Fri, 21 Jul 2017 15:25:34 +0200
Date: Fri, 21 Jul 2017 15:25:34 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 05/23] softfloat3c: initial
 build machinery
Message-ID: <20170721132534.s3zjgwbdn7y6oknv@aurel32.net>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-6-alex.bennee@linaro.org>
 <71a11f23-39e7-d89a-36d5-2870ed76d940@twiddle.net>
 <87y3ri6sou.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87y3ri6sou.fsf@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TUID: FoARbJZbF21b

On 2017-07-21 10:32, Alex Benn=E9e wrote:
>=20
> Richard Henderson <rth@twiddle.net> writes:
>=20
> > On 07/20/2017 05:04 AM, Alex Benn=E9e wrote:
> >> +# so they can still be linked when needed. We build these files surpr=
essing so of the normal CFLAGS.
> >
> > "surpressing so" -> "suppressing some"
> >
> > Do we gain any confidence for our still supported but less tested
> > 32-bit hosts (all of which do support a 64-bit type) by dropping the
> > FAST_INT64 distinction?
>=20
> I guess so. Certainly I can cross-compile aarch64-softmmu on armhf
> defining all the:
>=20
>   softfloat3_fastint64=3D"yes"
>   softfloat3_fastdiv32to16=3D"yes"
>   softfloat3_fastdiv64to32=3D"yes"
>=20
> without any issue. I guess it might mean our 32 bit guests might run
> slightly slower but none of our FP is fast anyway.
>=20
> There is also a slight intermingling in the build setup between the
> FASTINT64 and the specialisation even though there are for different
> things.
>=20
> The 8086 code basically makes NaN propagation match old x86 whereas SSE
> is the more recent and more IEEE like SSE behaviour. See section 5 of:
>=20
>   http://www.jhauser.us/arithmetic/SoftFloat-3c/doc/SoftFloat-source.html
>=20
> I suspect what we should have here are specialisation for each of our
> guests. We do something similar in the softfloat2a code in it's
> specialise header. Maybe we should rename 8086-SSE to default and then
> create a specialisation for each guest that needs it?

For the sNaN is 0 or 1 specialisation we actually need to be able to
select this at runtime, as we have implemented it in the QEMU softfloat
version.

Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
