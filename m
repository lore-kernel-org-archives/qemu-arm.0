Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3461211lfo;
        Wed, 16 Mar 2022 01:24:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL4uhuA2e9QFO+bfGxsF7rQ/sPo3lZ5u0q2ThzXRXhwFqMSxUu8hoazsQ5c6A49SlyaiaG
X-Received: by 2002:aa7:86c6:0:b0:4fa:46d:6005 with SMTP id h6-20020aa786c6000000b004fa046d6005mr5710361pfo.86.1647419040812;
        Wed, 16 Mar 2022 01:24:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647419040; cv=none;
        d=google.com; s=arc-20160816;
        b=HWD8z3HjObMkuJ3+JvvrrJp/BljAHMK5oGl5Djd8bery0xULMdEKRE+5cGK2zKCw7X
         f0fzdtY2vkcROSvI32CFXIsAfwtrnVW5aMYjk8EVxjkmTD3GwL0jCOsqlCaJuONLFYbi
         rw0J9GVwsBgUMf/JsokeAygcFbH6YBSZBWd/t5yY6u50A/N1U8J4FLUIkZ0uOGYTrzwX
         rO+2P2GT6nlaxBYb4qZW1ckkDyCJvyYJn2OaeJkqvo05wI1bV+u9ZyfR9d2/vwK6Cyyl
         aHNKsqbyn6Yp01AJ0RSpNmxy2h7+4y9ihvRcDvxoFrAXzxkx3Yxdn41/CXzO6eBNtjx5
         CglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from;
        bh=hQ6WWXmGqnRbVTu4vp4yhZ9pDn9ckNIZ6Kq3DHpAFv8=;
        b=llk+JMjwhCscdbupOC0RwYLG1vhyC9eeZgQOSuAW27N137XKnw5XbcM3KWj+5hOzeN
         XvLeRm8brhMiBWkm0USLsHFIkJM0UOdrau2hJpBYc+NGWrFoE0H0uFN+KM4FWEdHhx+y
         eLtTUf6J7Rv45VEYCgh4gS6Zu3c5SK8nu8JmEl8fq1I0FjihKgoUs7rN29ZkCc6h3IIB
         iNyK3Q9r/vbLzOYeieEHelAalJzHsbUMByDr5TPOKICK3U+o/fEx8e8fklwOeLkMIpAY
         4qKHGKkT3S5u83SasqOYIBYotZX7FCxJIL5/SXPEFLfAzFicnNPLxAy/NoYpdsWj6xXZ
         jUXA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of michael@ellerman.id.au designates 150.107.74.76 as permitted sender) smtp.mailfrom=michael@ellerman.id.au
Return-Path: <michael@ellerman.id.au>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id d190-20020a6368c7000000b00380494b840fsi1298900pgc.101.2022.03.16.01.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 01:24:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of michael@ellerman.id.au designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of michael@ellerman.id.au designates 150.107.74.76 as permitted sender) smtp.mailfrom=michael@ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4KJNbG0r1Wz4xc4;
	Wed, 16 Mar 2022 19:23:54 +1100 (AEDT)
From: Michael Ellerman <michael@ellerman.id.au>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, qemu-arm@nongnu.org, richard.henderson@linaro.org,
 sw@weilnetz.de, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aaron Larson
 <alarson@ddci.com>, Andreas =?utf-8?Q?F=C3=A4rber?=
 <andreas.faerber@web.de>, Jason Wang
 <jasowang@redhat.com>
Subject: Re: [PATCH  v1 5/8] mailmap/gitdm: more fixes for bad tags and authors
In-Reply-To: <20220315121251.2280317-6-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
 <20220315121251.2280317-6-alex.bennee@linaro.org>
Date: Wed, 16 Mar 2022 19:23:50 +1100
Message-ID: <87y21a2tm1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: wI9XpVUXuuiX

Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> I was running some historical tags for the last 10 years and got the
> following warnings:
>
>   git log --use-mailmap --numstat --since "June 2010" | ~/src/gitdm.git/g=
itdm -n -l 5
>   alarson@ddci.com is an author name, probably not what you want
>   bad utf-8 ('utf-8' codec can't decode byte 0xe4 in position 552: invali=
d continuation byte) in patchm skipping
>   bad utf-8 ('utf-8' codec can't decode byte 0xe4 in position 342: invali=
d continuation byte) in patchm skipping
>   michael@ozlabs.org  is an author name, probably not what you want
>   Oops...funky email nicta.com.au
>   bad utf-8 ('utf-8' codec can't decode byte 0xe9 in position 232: invali=
d continuation byte) in patchm skipping
>   Oops...funky email andreas.faerber
>   Grabbing changesets...done
>   Processed 76422 csets from 1902 developers
>
> The following fixes try and alleviate that although I still get a
> warning for Aaron which I think is from 9743cd5736.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Acked-by: Aaron Larson <alarson@ddci.com>
> Cc: Andreas F=C3=A4rber <andreas.faerber@web.de>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael Ellerman <michael@ellerman.id.au>
>
> ---
> v2
>   - added Aaron's acked by
>   - dropped Peter Chubb from CC (bouncing emails)
>   - used Michaels preferred coding email

Thanks.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
