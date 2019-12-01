Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp11831062lfc;
        Sun, 1 Dec 2019 12:05:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqxV3si2IMTQyxVEtGwlMYTs6c7R4tOvVq6QwQDbCyXpDfpFhQp/dlh8ZwpNgvBRqZ7HQI3w
X-Received: by 2002:ac8:2a1d:: with SMTP id k29mr64950849qtk.336.1575230730666;
        Sun, 01 Dec 2019 12:05:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575230730; cv=none;
        d=google.com; s=arc-20160816;
        b=ZLfAXEOJ39x+5Ha2wMEP0XsItJJ1uDoLJ/ag3HR4Am/ypnkE10RScL0TOP4vQSyeyY
         SL7HnmcxpXNaJzYvSIRvW+ESvue+gkCCFAedhSXWXWGRvX9o1CJPXUyMHDfM0FPZLlRN
         0quoLhNTwZcqHhe+22wBqraXM8Gn47TIuSvI7dQAjvf8uMQS70IEoHW00tWsh1igSs82
         n0F8ZI9bfKWeO3ypNRiYqHB99Urc7WS1a1hA3dlrR9bOG1on6BH7D2pnOJ6TeliMVfiz
         vgyfu1m2dkXnqgH+1jmEKhqhn+YDy1XI2Jney7SkfieooPHww9j2XGbYX9os3Dr4LF92
         pz+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=UAwPekFTr0zSt8L8C9rqmPE84AtpGq/R59iL4ReHvec=;
        b=LAdYxfRHDSMe7oQOGXKXscK4CIYlTO1pdewFyuUusRzgZGh4GZoQ6vL04c41azSpDI
         ZOyX6kvnQObDzq1mtPny57W2t0KGLKCTQ+A9Dp2DwW6sZIoG92QXcnwux6T+1NQTR7zM
         vC+dZ6aJUCG8mG04brTEiVhdDOUytXJqC/SewW5dhjzBmzavitDmfN3Ns6P9iWPXKc5c
         W1eusvq+JfYD99gs6bSCxKP0FTtEcIyMYSmK6l0XK4euHMDDs6Q1M0Zh53yeJlNjhLbl
         3axtWzFZZIPjyo1aw3lq/KqQs3KbdHDcTBQv/D8bcbcDiclGRpoyiZ95eBWALWbF7KRv
         GYGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AVH8kMzQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id 15si4863290qkc.20.2019.12.01.12.05.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Dec 2019 12:05:30 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AVH8kMzQ;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575230730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UAwPekFTr0zSt8L8C9rqmPE84AtpGq/R59iL4ReHvec=;
	b=AVH8kMzQHMaIeXbH2yLp2O5IKGpT25+seOQqhtXWVeGE6kaAvu959lJVyM8sIpePmzNId1
	OLnYo5ea0rihOM+HkdxQV3y/yHnX7IoQH1VAUVDAKM623p56ZyyAVGkYagY/Anwf71OxQx
	1gSI6VPmlcERf/SW2blZa8UmDZvtUZI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-sS4ERs1WMyai8mDvLBt1Aw-1; Sun, 01 Dec 2019 15:05:25 -0500
Received: by mail-wr1-f69.google.com with SMTP id q12so19258906wrr.3
        for <alex.bennee@linaro.org>; Sun, 01 Dec 2019 12:05:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=97MGpVaieoX303Tm+4vRdy/8QxsLoEaL3T7bA7CwLAI=;
        b=QdOjQa4F0ySU7ueqH1mSICgPLq/uncV5jbsVwY1SxtRyPlNkSK8KjYFhtEt+dCBzWv
         bwdrj7jei+PXSiluxHLYesHMfi2ehiAt9AzZkFYqOt3IJnUaWkMUU1Ppos+C7+Pfta3P
         6ETKj6FDucgbeSHO5+n2CWb4cBy2uw9ZnoTCtSL7WI0pXrD7vEP7p4XsUUQCD8CKUq0c
         Mnl+KEgGafu9Py7VTqoy4NbKBCpbAD+BhQSIn52PW3AzJ8bztA2gDLrh+0/GisFm56Sd
         PNKgw/UHqFt8MV3nvETdWGiZtJvZf8c7c6FmcHLs8nEc84TeZR7JPW9nkNmVT1HE4BUv
         aIog==
X-Gm-Message-State: APjAAAVFRxeuuvsATV3p+5Kp9yGnAuGhGSKbiyu5AWpEQ1Is2TsiFpcd
	DdMknNI2yeXXp+/vLfPRvfGNON6qQbauGgr40FmgHjKkD+IVJ/L6UefS3XI5HbGcFxuWuSvIe/r
	SSDobuqJBJFKONLuY
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr17016403wrt.70.1575230724436;
        Sun, 01 Dec 2019 12:05:24 -0800 (PST)
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr17016390wrt.70.1575230724270;
        Sun, 01 Dec 2019 12:05:24 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [10.101.1.81] ([176.12.107.132])
        by smtp.gmail.com with ESMTPSA id x17sm15198809wrt.74.2019.12.01.12.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2019 12:05:23 -0800 (PST)
Subject: Re: [PATCH v2 06/14] target/arm: use gdb_get_reg helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: damien.hedde@greensocs.com, Peter Maydell <peter.maydell@linaro.org>,
 luis.machado@linaro.org, richard.henderson@linaro.org,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, alan.hayward@arm.com
References: <20191130084602.10818-1-alex.bennee@linaro.org>
 <20191130084602.10818-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <987465d3-3b13-e675-9622-c13e2d5205c2@redhat.com>
Date: Sun, 1 Dec 2019 21:05:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191130084602.10818-7-alex.bennee@linaro.org>
Content-Language: en-US
X-MC-Unique: sS4ERs1WMyai8mDvLBt1Aw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: SOic9lLJ6vaq

On 11/30/19 9:45 AM, Alex Benn=C3=A9e wrote:
> This is cleaner than poking memory directly and will make later
> clean-ups easier.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>=20
> ---
> v2
>    - make sure we pass hi/lo correctly as quads are stored in LE order
> ---
>   target/arm/helper.c | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)
>=20
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 0bf8f53d4b8..0ac950d6c71 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -105,21 +105,17 @@ static int aarch64_fpu_gdb_get_reg(CPUARMState *env=
, uint8_t *buf, int reg)
>   {
>       switch (reg) {
>       case 0 ... 31:
> -        /* 128 bit FP register */
> -        {
> -            uint64_t *q =3D aa64_vfp_qreg(env, reg);
> -            stq_le_p(buf, q[0]);
> -            stq_le_p(buf + 8, q[1]);
> -            return 16;
> -        }
> +    {
> +        /* 128 bit FP register - quads are in LE order */

Oh, this was always wrong on BE :(

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> +        uint64_t *q =3D aa64_vfp_qreg(env, reg);
> +        return gdb_get_reg128(buf, q[1], q[0]);
> +    }
>       case 32:
>           /* FPSR */
> -        stl_p(buf, vfp_get_fpsr(env));
> -        return 4;
> +        return gdb_get_reg32(buf, vfp_get_fpsr(env));
>       case 33:
>           /* FPCR */
> -        stl_p(buf, vfp_get_fpcr(env));
> -        return 4;
> +        return gdb_get_reg32(buf,vfp_get_fpcr(env));
>       default:
>           return 0;
>       }
>=20
