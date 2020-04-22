Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp909027lfm;
        Wed, 22 Apr 2020 10:42:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypKnvQUTVpikgbIE8FP+th85DW7V9Ve6MRAv6UdxTiVXqHwR/uK0wbajhegV6lyk11YLZmRg
X-Received: by 2002:a5b:483:: with SMTP id n3mr36751440ybp.519.1587577325346;
        Wed, 22 Apr 2020 10:42:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587577321; cv=none;
        d=google.com; s=arc-20160816;
        b=grgrx9omc+oCkjdE9huHUpEobTynl/A5WQu/ne5FgyFfk5aYpDDBK7m5w7lB8v16fG
         gMY5LdMWFJY+/UhLql7TlAjuRM7XSwM4yt/mW15bhrPYUjRz7gqn1Dfuu8xhS57vGWq6
         zYW3aC0s56YXfZWZMtVIP9MNZ0vrtQOKKHxEgVWmVC5iafNbgshdSYR8y08K4z95YmQi
         tQg46l/Kii2VGPffbT6woubtAI5Rks5cCc5DazjY/zlzVwmqy+kwrgaiww7mQTZEeqmh
         XBgud7Bmst4CyhAoqlh9U6u19pnzqp1VD4043jScLTjVsrgYMtYDwMj360AvwSx2b8A4
         f7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=xR/a9qaruUfJuiiFbCuVugQkA7BqOfxP5EkzMf4OK7g=;
        b=VD0cDPZcezDEJ7KhiT8p6Hv4rYGcCKApVFWC3w5YBirkR9ViFcxxGkyy7diu3imt6t
         MK+rxa+KpOJi6jQ0PQec0BLiUt5yVUqOYlE13udPANuvKFtJwvrT8J2Rp1ggQDbB2AS5
         ktCKt581fbD+gU80eU7PNWtP513jmhaIg+8If7ylbVdw9dJ+t4jOSQxSMsKmgF7Aj+Cw
         OtwKQ9AmzK2TY6oD+JZnLMDLu3D1GYXfsjeopqfr+dXWz6NxDWVdRNwF1XndCHPgTXOt
         Avgk18h1gU/BWvCbbCFTlbw4ic+0NAUIIe427qrwFbqGB8kpgBVYUtdMDUi0qV2217zS
         5QgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cH/2/vGt";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id r6si5068089ybs.236.2020.04.22.10.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Apr 2020 10:42:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cH/2/vGt";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587577320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xR/a9qaruUfJuiiFbCuVugQkA7BqOfxP5EkzMf4OK7g=;
	b=cH/2/vGtrN/pWRjAYm0VH1It2CUsgTkePfvKN+z46T4zeu+oBYL3cH3kpsStzMiolH4dn4
	IujgM2gUwyXZHn/n+ZbsBXMdSDfU3c0tID/FwQbmvJnSjXwJe4oE99wSmroofgYxdfdofa
	lr3/8qomWPIxe9VSN2VmTgggNkKsZBw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-Q1EsdpkyPvSMYoR-Ao8Uxw-1; Wed, 22 Apr 2020 13:41:59 -0400
X-MC-Unique: Q1EsdpkyPvSMYoR-Ao8Uxw-1
Received: by mail-wr1-f70.google.com with SMTP id x15so1438583wrn.0
        for <alex.bennee@linaro.org>; Wed, 22 Apr 2020 10:41:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MLyp6M4wXApkbzk5EE/B0GR90m25YAmskER309AY+Es=;
        b=dPSF4lVXO+7GesvbUv9TL2b3gNsvpr1FfCn+PgFBEZsEXY1MoHnZ0DjbZd+C6dZuun
         s59ZJ4giQYBpdW1/1pI0PLFe07M3nIXP2hAoXpL6deh6YwlPF/yfetXg5Ix8/9x5HJh3
         iqAj8yNVKHu4s92qkG1QFT+4A6Wr/slYyQU82Acrd18TWfggueajUjdwSI/qAjt9Z25T
         MvC4iE/c9EB1zst+H82A9l7lBTOxlWkPY6CXzRpvRK3nbFatlvCs7x6WurCQnkB3uWlN
         awU8vOOb1seFgmQX23ixoosphn7YXFanqDIaGE4n+h/mMS0sNCWzo+EpdT24yEWBYu4q
         KrOQ==
X-Gm-Message-State: AGi0PuYOflEZGGFHzccvCNnJhYR8lO7hS5ULEAny8Rduf4C2LRiQmrvG
	kyd/b9R1BZelXdexf56+7ZtrFABKgILvWnJ/j1uAWprygTWbhEk2yf7a+CtSiX9rDSWHW2juV+J
	fl2vmdvuxizkbx9xc
X-Received: by 2002:a7b:c759:: with SMTP id w25mr12807794wmk.68.1587577317870;
        Wed, 22 Apr 2020 10:41:57 -0700 (PDT)
X-Received: by 2002:a7b:c759:: with SMTP id w25mr12807777wmk.68.1587577317663;
        Wed, 22 Apr 2020 10:41:57 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net. [83.42.57.116])
        by smtp.gmail.com with ESMTPSA id j68sm9165649wrj.32.2020.04.22.10.41.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 10:41:57 -0700 (PDT)
Subject: Re: [PATCH for-5.0?] target/arm: Fix ID_MMFR4 value on AArch64 'max'
 CPU
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20200422124501.28015-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b6dd8d4a-ec38-84c5-eb94-cf25bfa4cf4a@redhat.com>
Date: Wed, 22 Apr 2020 19:41:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200422124501.28015-1-peter.maydell@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 0am7C5+iNxfm

On 4/22/20 2:45 PM, Peter Maydell wrote:
> In commit 41a4bf1feab098da4cd the added code to set the CNP
> field in ID_MMFR4 for the AArch64 'max' CPU had a typo
> where it used the wrong variable name, resulting in ID_MMFR4
> fields AC2, XNX and LSM being wrong. Fix the typo.
>=20
> Fixes: 41a4bf1feab098da4cd
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>

Nice testing/catch Laurent!

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> maybe 5.0 just because it's so trivial. I dunno...
>=20
> There's also an error where we use the uint32_t u variable
> to update the 64-bit ID_AA64DFR0 register, but that's harmless
> because as it happens the top 32 bits of that register are
> all zeroes anyway, so we can just fix that in 5.1.
>=20
>   target/arm/cpu64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 62d36f9e8d3..95d0c8c101a 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -705,7 +705,7 @@ static void aarch64_max_initfn(Object *obj)
>           u =3D cpu->isar.id_mmfr4;
>           u =3D FIELD_DP32(u, ID_MMFR4, HPDS, 1); /* AA32HPD */
>           u =3D FIELD_DP32(u, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
> -        u =3D FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
> +        u =3D FIELD_DP32(u, ID_MMFR4, CNP, 1); /* TTCNP */
>           cpu->isar.id_mmfr4 =3D u;
>  =20
>           u =3D cpu->isar.id_aa64dfr0;
>=20
