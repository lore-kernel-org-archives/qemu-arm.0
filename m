Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5992917lfp;
        Tue, 11 Feb 2020 22:26:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxjgJ11YzfAlL1S9GUyJdVu1J1egrgBJLFHPliNNSYcuTsW9lSA9oNLGbBhNB2Ile9LUb1e
X-Received: by 2002:a05:620a:13c3:: with SMTP id g3mr4107379qkl.391.1581488762072;
        Tue, 11 Feb 2020 22:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581488762; cv=none;
        d=google.com; s=arc-20160816;
        b=UmbutS3ubnoQzOrFD2lNBx6Ra9CQTNrxbJHeReQwaXJAAK7JYZAj1jfgIbMSKgkS+8
         4jqhMDuI6C2ecSdWhhs0Ygpex5ey9TGX26T+n7LNeCuezvWN5lRUH9cLPJhMAmGsULDl
         tZyt/gir6JInMI844MedZwlSi4TAf+uH8i7cCwC9rnBqbSF+x52r6NYPv2SbM4dEg52y
         W3GybAve5cOQcHgx2oeVzKjAWOrtsbFPmkQ9+ty0v2fAXWmDTnJu8h68LYuJ+33nfuD8
         uJlaeQ+y2GOu0WOqEDXqVBaF1YCuEPZSh0eHfImOAsOsp9fQwDI/EV66ZsB2BuiBkRx/
         wzpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ndUT+/kQINm3qcHXNXOuj5Qj1ZbOZaD0onWWkUdggqY=;
        b=1IapTrHbce8t34uFk6M6H76KCtpln1QzteDPFPYQgkNJs9Aa0j5t7fjcgtQ5+McWfb
         k2S9R+rBz0SWX9lTidaGLFHvuDwDFnS//AI02a020ZZZZwfqSEocx+9xJYhpIxZpEtVb
         CVv4hx4XzH2GSPqkVk1xC00PBU6fmRBi5ButTPqSeqDF/JKLCUxEscx0k0n0XGnxMZOL
         KuJzDjwnBQ3+LXEV2/79nneMWHtEMgvQs9T1kGgwBB5vxUTiIudCiJREQQZTUt0dnpWG
         /I4X5s+QC4sBm6G2f2UoL10HGSYcMrzraIK9W+VfKi4u9jxSVCisaN7MRkoOSiyy5SWs
         /kPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HYRcFdB8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d26si3007353qko.68.2020.02.11.22.26.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 22:26:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HYRcFdB8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1lTF-000123-J0
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 01:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46696)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j1lSL-0000I0-Cg
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 01:25:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j1lSK-0005q8-9c
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 01:25:05 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57719
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j1lSJ-0005ph-TY
 for qemu-devel@nongnu.org; Wed, 12 Feb 2020 01:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581488703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ndUT+/kQINm3qcHXNXOuj5Qj1ZbOZaD0onWWkUdggqY=;
 b=HYRcFdB8Ik+hu9LIfu9kBppGPWqg6tLMFTEsNmWzHzFMkzMCl09RKA2ukvpk0nYU+AuAWQ
 eO5JBTXIYxpYKtFButtX6tUTWbYTY8pYBDxq52dRkiljhpZ2lXiVvWdH9yurWyXrJ6fDzJ
 WNATi+TOgMydTP6tOmosFG7cqZ0bM30=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-IK57eM5iPXSisvVlbiSZJQ-1; Wed, 12 Feb 2020 01:24:59 -0500
Received: by mail-wm1-f72.google.com with SMTP id y24so515573wmj.8
 for <qemu-devel@nongnu.org>; Tue, 11 Feb 2020 22:24:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Uxsb7XWermw4YfwIHhLhX3tUt8nn8dENUJahmiOnF4Y=;
 b=hY/uKoo877t6Mw/56bWu6jRYxyfoiMPYtENrrxwkPONAACQlXRnxMWyfi2wIytladb
 REWt1oNRhWpviIdVsPjGCS/mA0V/alGO3xNNoVLkQdL6sjO/rPABrUqgd9m9w2y/othM
 Kb1ByuBVFeSr0/fDSl0YEnw650uAEvIPbhtt20v8c9j+axTtoiMgdU0vFh3/6tjwM3qT
 l7tAuIjIK6jlMozWVBv9vk/149VXzE8xqB/O1M2cCZ2PMAYFZI5yXyiHpd0CVYb8kvnP
 b5WhkfgXqaTYOQfNARJY3fqp2KkIrCcgJTp3Tje/uWiftZaJJTBSXoVgKRV80PiMO4kF
 xuEw==
X-Gm-Message-State: APjAAAUgf+EHp5Bk2UPiyQmT7XDV53gi9olm6twd46g6xGBKBvnrzfFM
 2WaMcpOv4RiKmZdvYnwoL61pltGFxPcs34r2+qZTiy9a8qfRqBMOqzs9kzDkD890vAblrznd0ii
 DX+h81XAo3NUL0EI=
X-Received: by 2002:a7b:c450:: with SMTP id l16mr10094489wmi.166.1581488698678; 
 Tue, 11 Feb 2020 22:24:58 -0800 (PST)
X-Received: by 2002:a7b:c450:: with SMTP id l16mr10094464wmi.166.1581488698452; 
 Tue, 11 Feb 2020 22:24:58 -0800 (PST)
Received: from [192.168.1.35] (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id f1sm8326653wro.85.2020.02.11.22.24.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 22:24:57 -0800 (PST)
Subject: Re: [PATCH 03/13] target/arm: Define and use any_predinv isar_feature
 test
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4950a751-cd2d-8f00-1714-0003bd60d915@redhat.com>
Date: Wed, 12 Feb 2020 07:24:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-4-peter.maydell@linaro.org>
Content-Language: en-US
X-MC-Unique: IK57eM5iPXSisvVlbiSZJQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wDDK982XvvU3

On 2/11/20 6:37 PM, Peter Maydell wrote:
> Instead of open-coding "ARM_FEATURE_AARCH64 ? aa64_predinv: aa32_predinv"=
,
> define and use an any_predinv isar_feature test function.
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h    | 5 +++++
>   target/arm/helper.c | 9 +--------
>   2 files changed, 6 insertions(+), 8 deletions(-)
>=20
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index ac4b7950166..b1f3ecfd942 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3719,6 +3719,11 @@ static inline bool isar_feature_any_fp16(const ARM=
ISARegisters *id)
>       return isar_feature_aa64_fp16(id) || isar_feature_aa32_fp16_arith(i=
d);
>   }
>  =20
> +static inline bool isar_feature_any_predinv(const ARMISARegisters *id)
> +{
> +    return isar_feature_aa64_predinv(id) || isar_feature_aa32_predinv(id=
);
> +}
> +
>   /*
>    * Forward to the above feature tests given an ARMCPU pointer.
>    */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ddfd0183d98..bf083c369fc 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7116,14 +7116,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>   #endif /*CONFIG_USER_ONLY*/
>   #endif
>  =20
> -    /*
> -     * While all v8.0 cpus support aarch64, QEMU does have configuration=
s
> -     * that do not set ID_AA64ISAR1, e.g. user-only qemu-arm -cpu max,
> -     * which will set ID_ISAR6.
> -     */
> -    if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)
> -        ? cpu_isar_feature(aa64_predinv, cpu)
> -        : cpu_isar_feature(aa32_predinv, cpu)) {
> +    if (cpu_isar_feature(any_predinv, cpu)) {

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>           define_arm_cp_regs(cpu, predinv_reginfo);
>       }
>   }
>=20

