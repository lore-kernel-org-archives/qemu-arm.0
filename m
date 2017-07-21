Received: by 10.25.44.15 with SMTP id s15csp659070lfs;
        Fri, 21 Jul 2017 06:21:42 -0700 (PDT)
X-Received: by 10.223.128.177 with SMTP id 46mr9969852wrl.150.1500643302052;
        Fri, 21 Jul 2017 06:21:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500643302; cv=none;
        d=google.com; s=arc-20160816;
        b=z1sTifmwd9pdqLq/CBg/dQxQX5YRToxLNTMvl+8oPlIjNoA97ud832OOd9SvheZfMW
         Bgv1d8TIhsTqDvdk+aYj6EPnTrT1P+3MyND0DK6rd0ACNhr5asgH4M3Onb1FTslARrSB
         gExbPh4yZck6rGimgjDx9SJ0XJ1IsmaqLIFTimvImYknQLJfyMWRxEb/l+Im93InHamr
         cuhuopPowL2tThaP/j+LNzQAODzlR5VAqHT7cO57u30iaPCJn/ayUt+7/RkcywMY8OXM
         z4ScspYRn8cbaRI6muS1lNSFwstWLfOSxvUalYN2rqhDtGLfp+P3J1xM4kg3I8wBH/oR
         ly1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=nLTTK/OPtG3C7w+1eTYHZs/iltHYMu+3/h9EKv5kp1M=;
        b=zo0I1921Pj0VjnmjnooY1nCOIj5tMaJeG0rmD6XLabA9ZeEV47LOd9SyjOgZShY8Ry
         2c9t2gtca2xnYnl49O8sTa3N/eNW73bFm8gty2TvbqQD33oERpHagKbRNTAvl0yYYcyq
         Q9HUyHuytJENaPb6ZWlaWs6z3NjQibFzNOm7XWCYMKOqcgy4wh3bahozpwBpayyl4tbM
         Ffdd806DH7dc+YLxcEafcGB1LaUIvJPEORLsDOe7nL+yuFpPndytbcO/pgbDkhxVzEq+
         tzwVmwfcgVFRJ6pQkdZ5tGoID+w0+t6LlVpoCMabOQqG24WxREXXRxwbPFcLwQQbwmpF
         9SXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) smtp.mailfrom=aurelien@aurel32.net
Return-Path: <aurelien@aurel32.net>
Received: from hall.aurel32.net (hall.aurel32.net. [2001:bc8:30d7:100::1])
        by mx.google.com with ESMTPS id m9si5206726wrb.367.2017.07.21.06.21.41
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jul 2017 06:21:41 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) client-ip=2001:bc8:30d7:100::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of aurelien@aurel32.net designates 2001:bc8:30d7:100::1 as permitted sender) smtp.mailfrom=aurelien@aurel32.net
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::1000])
	by hall.aurel32.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dYXsC-0002CO-Sj; Fri, 21 Jul 2017 15:21:40 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.89)
	(envelope-from <aurelien@aurel32.net>)
	id 1dYXsC-0001FI-7w; Fri, 21 Jul 2017 15:21:40 +0200
Date: Fri, 21 Jul 2017 15:21:40 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Alex =?iso-8859-15?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] [RFC PATCH for 2.11 12/23]
 target/arm/translate-a64.c: add FP16 FAGCT to AdvSIMD 3 Same
Message-ID: <20170721132140.xy2uqronprhzjiga@aurel32.net>
References: <20170720150426.12393-1-alex.bennee@linaro.org>
 <20170720150426.12393-13-alex.bennee@linaro.org>
 <4d6ac494-d606-ebaf-6498-7c526467ac62@twiddle.net>
 <87tw266rm3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87tw266rm3.fsf@linaro.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-TUID: DMucN+1XKG3D

On 2017-07-21 10:56, Alex Benn=E9e wrote:
>=20
> Richard Henderson <rth@twiddle.net> writes:
>=20
> > On 07/20/2017 05:04 AM, Alex Benn=E9e wrote:
> >> +static softfloat_flags softfloat_mapping_table[] =3D {
> >> +    { float_flag_inexact  , softfloat_flag_inexact },
> >> +    { float_flag_underflow, softfloat_flag_underflow },
> >> +    { float_flag_overflow , softfloat_flag_overflow },
> >> +    { float_flag_invalid  , softfloat_flag_invalid },
> >> +};
> >> +/* FIXME: 2a has no infinite flag */
> >> +
> >> +static uint8_t sync_softfloat_flags_from_2a(float_status *flags2a)
> >> +{
> >> +    uint8_t flags =3D flags2a->float_exception_flags;
> >> +    int i;
> >> +    if (flags) {
> >> +        for (i =3D 0; i < ARRAY_SIZE(softfloat_mapping_table); i++) {
> >> +            struct softfloat_flags *map =3D &softfloat_mapping_table[=
i];
> >> +            if (flags & map->float2a_flag) {
> >> +                softfloat_raiseFlags(map->float3c_flag);
> >> +            }
> >> +        }
> >> +    } else {
> >> +        softfloat_exceptionFlags =3D 0;
> >> +    }
> >> +
> >> +    return softfloat_exceptionFlags;
> >> +}
> >> +
> >
> > For conversions like this IMO it's better to make the compiler do the
> > work. C.f. target/alpha/fpu_helper.c and CONVERT_BIT.
>=20
> Cool, I'll look at that.
>=20
> > BTW, I think these TLS variables that softfloat3a are using are going
> > to be a real problem.  It's one thing to do it temporarily like you
> > are here, coordinating between 2a and 3c, but later, when the front
> > end is fully converted?  That's just nonsense.
>=20
> Wouldn't the other option to be to drop float_status out of the guests
> CPUEnv and grab it from the TLS variable instead? Of course all guests
> would need to be MTTCG enabled for that to work.

As said in another email, some architectures actually use more than one
float_status. We therefore need to implement a solution like the one
proposed by Richard.

Aurelien

--=20
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
