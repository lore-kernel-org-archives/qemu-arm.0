Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2175604ejb;
        Wed, 21 Feb 2024 13:23:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUS8XV8GP91tHnEJSIgvPSb1Y3SrQbX56YrGvPufSncvlzW0/+qNcPoB5zu/6XNkxyi6EkasWbpmEOldaEUUMGibpSvbZ4R
X-Google-Smtp-Source: AGHT+IGZ9tbMto8eiN3ArfAm+ZFAcbX8BNVIh3V82yWhqcwoJR3aRQ8jZYPIPewNSN22y0E2+gCe
X-Received: by 2002:a05:620a:4691:b0:787:9300:d4f8 with SMTP id bq17-20020a05620a469100b007879300d4f8mr1952861qkb.5.1708550587728;
        Wed, 21 Feb 2024 13:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708550587; cv=none;
        d=google.com; s=arc-20160816;
        b=CayQl+MS3pd05vkbH6eXtlBN4s3RLnFABpSCFCMeg+lpvhNBoNerpQSu8RQ+pvBLdh
         6KN5LLY8fT0OkUQl9uox1/B0iqGRPpAp7ODcZw2aAEIh7/wGsp85S65XyVqY6QcPYurC
         JA+P+OTp9FCch+f7MeWzeM1CtU3T4EB0zN62ISjtDy3oX0gZuKRCwxL5fAq/Xlzpk7k4
         m5rwVv5mjQzzONDQdS9IT75RUvaYn2H+Fx5ljdkS8mv691moDZu7aNov3Bc+4jv522zW
         G9hVCLXFszixg8NQbxT6gJt8o7rr9MprwAHLJn2s1Zn94VPDzBKw0AMxktCy44BS2w8g
         lauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=sLfZpWFmUrIxb5MFBtRdJN/JWNE9nzn+dX12WPG4KxI=;
        fh=GawiptvJb7o9bGga/mMyyBFf/OAZE8PqwxJmwb9VAD0=;
        b=MYywxDt22gxJns6uYB9+PaCBQS4MyUil7TGqtyNTkJ9qqblyVkC5ATjXRCK3H/1Y8+
         8p0QfLUTzlyQb2D1y6mN4IpPw1ld3DDuRee+hpu7eEetlHgO5MNbZuGK8BkIEjRwkN8R
         GTRRy3LWlMcEc4e8pn0GTD8sJlqID9zcoPoVmszLrG71cDQSwwM37ZfI3zUm4QEY82F1
         xr6eyJPLvhBRw0MkxF6E6vpeGqfXkstaBhFLxdUxLu6jWRyKut6+8yo3m4xTiwRrFPXG
         +2i1wsdDqg4fvhb0P0Qz+gOU9B+dpQoa0qcOAxd2Hy/aijDwQqyBbBl6AzcJhQWayZUx
         w60w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lzYjsa60;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dz19-20020a05620a2b9300b0078763dd50dcsi9222369qkb.28.2024.02.21.13.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:23:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lzYjsa60;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcu3N-0007Ol-BE; Wed, 21 Feb 2024 16:22:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcu3B-0007Hz-HM
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 16:22:46 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rcu2f-0002Io-Ty
 for qemu-devel@nongnu.org; Wed, 21 Feb 2024 16:22:42 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 98e67ed59e1d1-2909978624eso4334564a91.1
 for <qemu-devel@nongnu.org>; Wed, 21 Feb 2024 13:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708550530; x=1709155330; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sLfZpWFmUrIxb5MFBtRdJN/JWNE9nzn+dX12WPG4KxI=;
 b=lzYjsa60cCkFh28fJujbx1TDThUo+vvrKBqhjunc+I1+fb1SHjycuSx9ihdYrEYmPd
 Jndzwn5xlnIsHtJcqRjWuPOa0ETtt8NKq3Pq+KxY6IK2CHaoPUNHArnAy/7ZhjaHQSVt
 4SuRm0kYooHl3VxZaIrryOlmMdJ6Jz+c6dt/n6t9NY8bSIE6MNCZa/gk+evxngRrckNp
 SuWM0zoDuCsNmmY09r6/vYw2ZGsSAmMUKc0kvIGnDbTW4+QRKoENE8pZwke8BH9kKDmg
 PFL/NLna0dy817kcvdtJHkNAYX8Dl+baAhu8ETWacYXgrBuNqRQCDHUJVZva5FU7cQKn
 7n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550530; x=1709155330;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sLfZpWFmUrIxb5MFBtRdJN/JWNE9nzn+dX12WPG4KxI=;
 b=AQJdbTuJpBmhkxzALpcftMu8E6ReBTwJPg7eSfKInHi4+nR+d0+Zcd6XxX8dD00uyS
 1DufIloaHWJwIB1M2AU66XvAdZYAhNnlbjQUt6VCIcPQJWZ6ZsmwqYD4XurEoa6enHeI
 Pxr8BI7n1RghehQdPSxXEg8M41aCN08oSovlFaPHiEYgPufJt20iYAJKTfm9OJidju3B
 BSOGWfazbpRWbHxnIikcL0FGKRn/C93FS7ryb6v+ukCyYBUvmzv00IFZbnHCUTjtwhWO
 DGMrWo+LWMCSd4IR2+SES7A2I6L7wSN4csvstgNe5Uef6/0tzncotB+KNE34svSGHJux
 eJlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXEIETywH33cdTRtfd51O9+WsZ8Y0w4eyKKs44K2KfC+BCQtrJQJf9wKAnb1aRfJwt5zT5TZXDvfL5SPJbFG3d2glTgC0c=
X-Gm-Message-State: AOJu0YzBX+Zo97fCUvfNq5dsKysYD8HpgTbUL1a+HYn9mZAEWMRJzRzH
 22v5mtGfsU+zoyNViw9q6xpvwE6gjJIsY3XcTlc7NqHN8nz7auG5CIXllXj0doM=
X-Received: by 2002:a17:90b:f0a:b0:299:ecd0:483b with SMTP id
 br10-20020a17090b0f0a00b00299ecd0483bmr5420927pjb.10.1708550530139; 
 Wed, 21 Feb 2024 13:22:10 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com.
 [173.197.98.125]) by smtp.gmail.com with ESMTPSA id
 pt5-20020a17090b3d0500b002994f848bc9sm2342212pjb.43.2024.02.21.13.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Feb 2024 13:22:09 -0800 (PST)
Message-ID: <c6271668-1bee-4ff4-9a9c-5fe6acee4937@linaro.org>
Date: Wed, 21 Feb 2024 11:22:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 01/22] target/arm: Add FEAT_NMI to max
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, peter.maydell@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 wangyanan55@huawei.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
 <20240221130823.677762-2-ruanjinjie@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240221130823.677762-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: E14TVgYiPHWv

On 2/21/24 03:08, Jinjie Ruan via wrote:
> Enable FEAT_NMI on the 'max' CPU.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   docs/system/arm/emulation.rst | 1 +
>   target/arm/tcg/cpu64.c        | 1 +
>   2 files changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

However, this patch must be sorted last, after all support for FEAT_NMI is present.


r~

> 
> diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
> index f67aea2d83..91baf7ad69 100644
> --- a/docs/system/arm/emulation.rst
> +++ b/docs/system/arm/emulation.rst
> @@ -63,6 +63,7 @@ the following architecture extensions:
>   - FEAT_MTE (Memory Tagging Extension)
>   - FEAT_MTE2 (Memory Tagging Extension)
>   - FEAT_MTE3 (MTE Asymmetric Fault Handling)
> +- FEAT_NMI (Non-maskable Interrupt)
>   - FEAT_NV (Nested Virtualization)
>   - FEAT_NV2 (Enhanced nested virtualization support)
>   - FEAT_PACIMP (Pointer authentication - IMPLEMENTATION DEFINED algorithm)
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 5fba2c0f04..60f0dcd799 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1175,6 +1175,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>       t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
>       t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
>       t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
> +    t = FIELD_DP64(t, ID_AA64PFR1, NMI, 1);       /* FEAT_NMI */
>       cpu->isar.id_aa64pfr1 = t;
>   
>       t = cpu->isar.id_aa64mmfr0;

