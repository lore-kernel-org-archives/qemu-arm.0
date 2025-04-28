Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp6094833njd;
        Mon, 28 Apr 2025 09:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUEu66lIrfAnnGcAUoY+MnbXnYnVHP0tRK7V1LVRLxw3xjDTh+cJIlLIc1s9R2HH3c+0zzOAK3XI8AGbw==@linaro.org
X-Google-Smtp-Source: AGHT+IHAX4Xwa2mtWaFIZsOLqfbvpH8u3DMUE2bsXT+RE0Axi5mhJVwKD6vblCtz8YZGWyKM97GS
X-Received: by 2002:a05:620a:28d3:b0:7c5:5791:122b with SMTP id af79cd13be357-7c9668c833dmr1501643985a.37.1745858291038;
        Mon, 28 Apr 2025 09:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745858291; cv=none;
        d=google.com; s=arc-20240605;
        b=fW9oFtY8Es2DDnxLQbS6FSi6Fk5mlDI7pRbFpBErwiQjMVecD5x1Nzd47iqAbGcc/m
         nvuBIS3w7PivRd2lbs9CCOEb0/l648tbAcmIyEg1nyL7Qi2u1N1pcdvgmh2h94LmRbTW
         xFV28RY/c3iPZdNRVb5V9op+lGg3NFCMia9sbjO0v7GcHkVKzRQ2lqCPO+hVEV9KWQaL
         ni0/FRhhZHXeYq/lbb90t3nypYwAEAdJzldj10R7BEZXrh3nKPH7J0SjStdxdgNcI7BH
         GRGXh00FvOTmG+AaaQV7RRwQU0S42dV8hxXWUplP2a9qn4xND8ikjuXsPBlouDh1LIqY
         0PIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=dLeMmLBitMva57crvjAkV/QU3JbwDt0mhgNiT6DPem0=;
        fh=gw8k/sHFt4ycKGQp1GmOI2UlmZ5iZbFMN2IEqyZuSwU=;
        b=cvYepJH9mRKVAR0VCSzQoB1vsu/sPzWMMvhHyCLZhA2ORB3dnvrq2kmpdfl4PeebUe
         1gjktcHI8Q4j0QL3RIILC2a1RR4cMJyPI9DJh+pmwPelUabM2wyt43UUl80k0HOl4zs3
         SJ+bSEmbnImiVZZzAvlqTg6RieASF/z76ogToFctJ3mthKvP4i3NvACPAshbXulXxAtU
         FI3aTz0pprqELgtznqY14sNtzeTPm2TmykRQPL6F3CroW1P5EB6gBfrxSSfCNiNtfpMo
         KplwYekB5jy62naKpCxN3Rl0hfAWl1lS9KrtgXkJVfGDAjklw1zHuLGu1pKM2Kcg2uTC
         Vurg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eSfhlYSW;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c958ea24f9si1067901285a.359.2025.04.28.09.38.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 09:38:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eSfhlYSW;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745858290;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLeMmLBitMva57crvjAkV/QU3JbwDt0mhgNiT6DPem0=;
	b=eSfhlYSWt9rZIKmIhXoyXkzN5WpniKodgE/3d6LWl0RT8bo8f5LU5IFNzQOf+kQcBlCC5Y
	/26pw4kKz5BG6rYcPAgauMT53SI/CjDwmuKH9EAIsRj1DlmJ0luXRkgaO7732gZYCp7Z0O
	KwWEqYHoBWsf9Er9cvASRcNACzlbGO8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-h3FyB3IkNBKnuRHV-AmMxQ-1; Mon, 28 Apr 2025 12:38:09 -0400
X-MC-Unique: h3FyB3IkNBKnuRHV-AmMxQ-1
X-Mimecast-MFC-AGG-ID: h3FyB3IkNBKnuRHV-AmMxQ_1745858288
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf446681cso28979545e9.1
        for <alex.bennee@linaro.org>; Mon, 28 Apr 2025 09:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745858288; x=1746463088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLeMmLBitMva57crvjAkV/QU3JbwDt0mhgNiT6DPem0=;
        b=PWMwmqIvLr0Plf9uc8aWxF8Wzypd97eZotd7Whnv9v1qMj/NtRCf9BRmq/xMNcT12F
         mpJYEsFyzk6vdD1jy13vhxiFVYTDDz7oQnmVMyfsEAIExB+QxifpeiuANAGXWwidjjTR
         qFVXUuZ13McGIOHbXYS1KKKtOl+H7jOGSjBiSiPq6f8+RL+UW7zAkeKZM3F7BReXhSDa
         /1cHFcgwiexqeldKWSRioSFbM6rHrS52pWedPR46FhupL3taXwyzT3T/ChGoT9Pf5SGt
         oDccIyc//BeRb+eNC5W8dlvlUlKE4ebwOWgV6d/kFfZyQ2H+t7gO/CpHv0Q1dPPjPXHp
         WZWA==
X-Forwarded-Encrypted: i=1; AJvYcCWUmKYww5vAJIsa6Y2Ztn6ebBCPw8KHEqGTSMykiRPrnHFeMudufbDToErCRRIRmem7Yn/s8hVMvdQgXw==@linaro.org
X-Gm-Message-State: AOJu0YxDpllYwapZfOo3xLDrkxuz5Ouq8kJo2Xm/T66rl8nxymrgEW6X
	BH//rNOEba/1fZ/yu/l8F7fheIncypM0qWOM/OgwUIuGYvZ0CM4yOkeiYMFTNqFnl0Eu5VwDums
	KuCe4/yEm0fijX1L+gppDxbuTXahEm/4NU9gqz2U0BJ3UiZOHjaq5hQ==
X-Gm-Gg: ASbGncusRFAHLP+/zSr7bogt+B8aMp8Hjw8n98nPR5DrBmPdLhK59mP7aCHzleioOmg
	p2cSzgWnWhcPtNQt4UDM+Wtitrb21K3jZWdfeKuEO11ckL9vg9pkAG70CufG+5MX73+8QrEOgtX
	dMw9TG35xW5yfzYViZ3XMghEG+zmL/ilIEfUvWVbni1e3WhuTYRBCHh6bu5kjta2BBILgppJxoD
	m6AYpymFgO6azQJEcfcT6IuauSTOxg0Uk/GCXgiQ0UrHNx5M8PpLpzQj+zZqPlIXHfYlALnSR3W
	eXxT/B867kQUHXVrYgtGRjXWuySyRlU4n3pmQ18Y7v08j3WYW2bRzHO8HOg=
X-Received: by 2002:a05:600c:348b:b0:43d:54a:221c with SMTP id 5b1f17b1804b1-441ac861d66mr21075e9.18.1745858288299;
        Mon, 28 Apr 2025 09:38:08 -0700 (PDT)
X-Received: by 2002:a05:600c:348b:b0:43d:54a:221c with SMTP id 5b1f17b1804b1-441ac861d66mr20685e9.18.1745858287840;
        Mon, 28 Apr 2025 09:38:07 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a531dc6csm128148625e9.24.2025.04.28.09.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 09:38:07 -0700 (PDT)
Message-ID: <4218aec4-473e-44cc-9d9b-999e6c9e160b@redhat.com>
Date: Mon, 28 Apr 2025 18:38:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH for-10.1 v5 13/13] arm/cpu: switch to a generated
 cpu-sysregs.h.inc
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 agraf@csgraf.de
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
References: <20250409144304.912325-1-cohuck@redhat.com>
 <20250409144304.912325-14-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250409144304.912325-14-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sch2wmgHrG-bKD5HVkkpq8eC9-hVwyMhQtHf8P42H78_1745858288
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 6/nddU3+3KmY



On 4/9/25 4:43 PM, Cornelia Huck wrote:
> Generated against Linux 6.14-rc1.
>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  target/arm/cpu-sysregs.h.inc | 43 +++++++++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 13 deletions(-)
>
> diff --git a/target/arm/cpu-sysregs.h.inc b/target/arm/cpu-sysregs.h.inc
> index 6c9f9981cc5d..02aae133eb67 100644
> --- a/target/arm/cpu-sysregs.h.inc
> +++ b/target/arm/cpu-sysregs.h.inc
> @@ -1,18 +1,8 @@
> -DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
> -DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
> -DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
> -DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
> -DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
> -DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
> -DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
> -DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
> -DEF(ID_AA64MMFR0_EL1, 3, 0, 0, 7, 0)
> -DEF(ID_AA64MMFR1_EL1, 3, 0, 0, 7, 1)
> -DEF(ID_AA64MMFR2_EL1, 3, 0, 0, 7, 2)
> -DEF(ID_AA64MMFR3_EL1, 3, 0, 0, 7, 3)
> +
>  DEF(ID_PFR0_EL1, 3, 0, 0, 1, 0)
>  DEF(ID_PFR1_EL1, 3, 0, 0, 1, 1)
>  DEF(ID_DFR0_EL1, 3, 0, 0, 1, 2)
> +DEF(ID_AFR0_EL1, 3, 0, 0, 1, 3)
>  DEF(ID_MMFR0_EL1, 3, 0, 0, 1, 4)
>  DEF(ID_MMFR1_EL1, 3, 0, 0, 1, 5)
>  DEF(ID_MMFR2_EL1, 3, 0, 0, 1, 6)
> @@ -23,13 +13,40 @@ DEF(ID_ISAR2_EL1, 3, 0, 0, 2, 2)
>  DEF(ID_ISAR3_EL1, 3, 0, 0, 2, 3)
>  DEF(ID_ISAR4_EL1, 3, 0, 0, 2, 4)
>  DEF(ID_ISAR5_EL1, 3, 0, 0, 2, 5)
> -DEF(ID_MMFR4_EL1, 3, 0, 0, 2, 6)
>  DEF(ID_ISAR6_EL1, 3, 0, 0, 2, 7)
> +DEF(ID_MMFR4_EL1, 3, 0, 0, 2, 6)
>  DEF(MVFR0_EL1, 3, 0, 0, 3, 0)
>  DEF(MVFR1_EL1, 3, 0, 0, 3, 1)
>  DEF(MVFR2_EL1, 3, 0, 0, 3, 2)
>  DEF(ID_PFR2_EL1, 3, 0, 0, 3, 4)
>  DEF(ID_DFR1_EL1, 3, 0, 0, 3, 5)
>  DEF(ID_MMFR5_EL1, 3, 0, 0, 3, 6)
> +DEF(ID_AA64PFR0_EL1, 3, 0, 0, 4, 0)
> +DEF(ID_AA64PFR1_EL1, 3, 0, 0, 4, 1)
> +DEF(ID_AA64PFR2_EL1, 3, 0, 0, 4, 2)
>  DEF(ID_AA64ZFR0_EL1, 3, 0, 0, 4, 4)
> +DEF(ID_AA64SMFR0_EL1, 3, 0, 0, 4, 5)
> +DEF(ID_AA64FPFR0_EL1, 3, 0, 0, 4, 7)
> +DEF(ID_AA64DFR0_EL1, 3, 0, 0, 5, 0)
> +DEF(ID_AA64DFR1_EL1, 3, 0, 0, 5, 1)
> +DEF(ID_AA64DFR2_EL1, 3, 0, 0, 5, 2)
> +DEF(ID_AA64AFR0_EL1, 3, 0, 0, 5, 4)
> +DEF(ID_AA64AFR1_EL1, 3, 0, 0, 5, 5)
> +DEF(ID_AA64ISAR0_EL1, 3, 0, 0, 6, 0)
> +DEF(ID_AA64ISAR1_EL1, 3, 0, 0, 6, 1)
> +DEF(ID_AA64ISAR2_EL1, 3, 0, 0, 6, 2)
> +DEF(ID_AA64ISAR3_EL1, 3, 0, 0, 6, 3)
> +DEF(ID_AA64MMFR0_EL1, 3, 0, 0, 7, 0)
> +DEF(ID_AA64MMFR1_EL1, 3, 0, 0, 7, 1)
> +DEF(ID_AA64MMFR2_EL1, 3, 0, 0, 7, 2)
> +DEF(ID_AA64MMFR3_EL1, 3, 0, 0, 7, 3)
> +DEF(ID_AA64MMFR4_EL1, 3, 0, 0, 7, 4)
> +DEF(CCSIDR_EL1, 3, 1, 0, 0, 0)
> +DEF(CLIDR_EL1, 3, 1, 0, 0, 1)
> +DEF(CCSIDR2_EL1, 3, 1, 0, 0, 2)
> +DEF(GMID_EL1, 3, 1, 0, 0, 4)
> +DEF(SMIDR_EL1, 3, 1, 0, 0, 6)
> +DEF(CSSELR_EL1, 3, 2, 0, 0, 0)
>  DEF(CTR_EL0, 3, 3, 0, 0, 1)
> +DEF(DCZID_EL0, 3, 3, 0, 0, 7)
> +
