Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp6026948njd;
        Mon, 28 Apr 2025 08:00:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDkmXsCIMqHpMu1vxJxnJyA5q8LlxF1jxYOBPY/W1vhjHyDw/MiaiL0k84wEsfiAMcJ+jdyvfK331ssA==@linaro.org
X-Google-Smtp-Source: AGHT+IGQc3yI983M78yAC3JfOVtDKnhKHy/x290j6dvaHCzH+spqiwdeBXtt54FgydkSeZEDyklI
X-Received: by 2002:a05:620a:1d08:b0:7c7:b5e1:4e45 with SMTP id af79cd13be357-7c966863c81mr1890094285a.9.1745852451231;
        Mon, 28 Apr 2025 08:00:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745852451; cv=none;
        d=google.com; s=arc-20240605;
        b=U8jkS7T2OKU/eIxm8k3nIXvofvmsuhlbKpf23zIPcA9Q3SEmIScLoJj3ZDA0/s47UZ
         66MRisNk51CEg1FXEu10I2ZLD1aY1Dw5YrslgnK+XK0AuyqV4qpzfRMNtRsWMteeaPSV
         FlVzHbzWoqJLxhYxVpSi7UNwNorVCDNX60CHk2Io3DdYioCrRonrNkxe73Pe/PKkm/QJ
         xIKkekK0hTCM1/m4KrUPAV9ZSOD4bA74T5pumbZbfYE4VFaFL9ttDsjVgcsw8LfzcADu
         TWI4xkFoEC8vASH3Rx1cxeH/p1pnBaCtSQ387aw5h3aZrossfNPup2/upp0H+TpdG9aZ
         qFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=7qA395V+p03JJCI9RzbiUA0Mpr2jT+o20HFJBypSJJA=;
        fh=6NHpw0bw8ISSid3Es/FvqpIDmSK+l2vMkWRx6NNqNRQ=;
        b=fq+BUmqKE0DcRLE+7OtEL4ts4LJd5k5COFpFW0XUs68cpDko2cqQJw2qpdaZyIFBnb
         Gv028LOfQFM/z5reBNPhUclvpkWT+z0j3sa4l4HxQ0sQzfdCvB47BPfJbg4yLhCjMDzI
         Fn7UgZKrW4mcCZ+zAYLVQeh+rXt1q9qa6Y0cjbvZVIvgKYPgB1BQRmL9yGdMZC+A81jA
         OTuMTqGCf41mzLS6og3EDIj9PhkscXfQe5lytqg2b6FQRUDl+IYzPDr9rfn30TbA4ktv
         /M1x4RArLDV72Ez89c96C2dJBzYZBt950B87/F+iZBWO4mkMpeZImsIc+tynj3nsYSUI
         9A9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PDMOCAYH;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c958ea2847si1033499285a.400.2025.04.28.08.00.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 08:00:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PDMOCAYH;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745852450;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qA395V+p03JJCI9RzbiUA0Mpr2jT+o20HFJBypSJJA=;
	b=PDMOCAYHWEyxOCCQKaKeWRBFP8Xz4TOLYn4MLmrjZJSBiSRV7yui4sVNQTuZx/qGzsRHoX
	8l4dNZZ+yGkOCFcnVayOcFz86jA+ztzFEVqWpAZyYkB1f4Scf6HFJ6eL/ri/ARb+4yONp6
	uSBPNJzu483WmV2az3UA7CbSBN6C/aM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-KZoKRYgXOFeTq1j6BQW_VQ-1; Mon, 28 Apr 2025 11:00:47 -0400
X-MC-Unique: KZoKRYgXOFeTq1j6BQW_VQ-1
X-Mimecast-MFC-AGG-ID: KZoKRYgXOFeTq1j6BQW_VQ_1745852446
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf446681cso28299385e9.1
        for <alex.bennee@linaro.org>; Mon, 28 Apr 2025 08:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745852446; x=1746457246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7qA395V+p03JJCI9RzbiUA0Mpr2jT+o20HFJBypSJJA=;
        b=AIIA6pRIXZBqQYHtiUl2IW8Cd1Wrd3nj34T/XiM5jbGRDS68ErwVdDqJbyk4S5iPgY
         X0/TZpUiQbKDT/dnbJ0GosyeQdcy+kXb8xlZ2LHYatszf0EcUQ7iDwQ/VLLW6bihRGCs
         1aXz7rNKo3VyjhNx7FbJSc2RYnIfoFfbff7p4cY/ZihlmqbodYBiwyniKxG5OKOn8Kq6
         tl0m8BB3IPSFJTDlb6AVWp45SXdg5OIJJMlqSJu7BFny3XIJLp6bw0hUPN27Hdqf0y+3
         p67Axwz0rq4zsx6IJjlqBULizQxYZTqE3P37YRgvYy4L5VJWcyV+U0IF35WF8jXGjdb4
         EnMA==
X-Forwarded-Encrypted: i=1; AJvYcCWVgqyAz0mzOzFhYcfUqcqcj0qdg+32YCND3HrCTnpop20JQx6yWqeMpr+ZvRpOC2BwXI4eitv0tUKAVg==@linaro.org
X-Gm-Message-State: AOJu0YzdmMWsgpPyCW6Iha/Z/claQcNN8h7NDnHlBmWzB3GvRtKAou27
	kl1wkLyMvJN98LM9o+4Og8ESN3hs1bmHeiiXx5mg1iCKWR7vpFrAp9/w2ybl0F91zIXYr1Hu6Ht
	HOFgrGxI6SaSvy2XZ2KRwV4XygQHFfzi4Dttxme0hobE3N0Ni9Eq0aw==
X-Gm-Gg: ASbGncuiRLfFNnHMhC6epo8A1UXQ4Or3TDQpyefDKluj26m3dlmw7Hue0ba33OTxLHz
	PlkHhv1nuqxUepAOxwqeZQYnRvu1ICirWFY8zTYRfqooC5Az2pvAXja5GOcA8Pv6mhpyJi3Aa+6
	a5awaIXJnCm+fFVEdJfbwzCUljYgG1DHUKz4bbQqH6Kt8SQLI9BrhhjnwET2Du2XUGlA4wpArOk
	svd/PVy9GSm7ekXQDpY6Kp92hbci6AePLxiCjy20mAb3yE+EGgSbkeZ9S8ujIGg1hqRfqEXuplb
	Bu9alfrrro/t2N0VWEW05ff1jHtaUFHyuDEkVUONiD1WPCU1omldKymfFpo=
X-Received: by 2002:a05:600c:a41:b0:43a:ed4d:716c with SMTP id 5b1f17b1804b1-440a669b441mr89159875e9.22.1745852445512;
        Mon, 28 Apr 2025 08:00:45 -0700 (PDT)
X-Received: by 2002:a05:600c:a41:b0:43a:ed4d:716c with SMTP id 5b1f17b1804b1-440a669b441mr89158105e9.22.1745852443405;
        Mon, 28 Apr 2025 08:00:43 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2ac079sm159503105e9.18.2025.04.28.08.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 08:00:42 -0700 (PDT)
Message-ID: <e6e39967-06f9-4abd-a313-c47e1f794930@redhat.com>
Date: Mon, 28 Apr 2025 17:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH for-10.1 v5 03/13] arm/cpu: Store aa64isar1/2 into the
 idregs array
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
 <20250409144304.912325-4-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250409144304.912325-4-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -X4HpXlYHogiQtYF70Q9-CrNORaxp1zi5mWnw9SOf9o_1745852446
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: vMKyPWbMPqjA



On 4/9/25 4:42 PM, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/cpu-features.h | 44 +++++++++++++++++++--------------------
>  target/arm/cpu.c          | 12 ++++-------
>  target/arm/cpu.h          |  2 --
>  target/arm/cpu64.c        |  9 ++++----
>  target/arm/helper.c       |  4 ++--
>  target/arm/hvf/hvf.c      |  2 +-
>  target/arm/kvm.c          |  6 ++----
>  target/arm/tcg/cpu64.c    | 24 ++++++++++-----------
>  8 files changed, 48 insertions(+), 55 deletions(-)
>
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 779bcd1abb36..37946d759375 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -467,17 +467,17 @@ static inline bool isar_feature_aa64_tlbios(const ARMISARegisters *id)
>  
>  static inline bool isar_feature_aa64_jscvt(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, JSCVT) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, JSCVT) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_fcma(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, FCMA) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, FCMA) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_xs(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, XS) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, XS) != 0;
>  }
>  
>  /*
> @@ -501,9 +501,9 @@ isar_feature_pauth_feature(const ARMISARegisters *id)
>       * Architecturally, only one of {APA,API,APA3} may be active (non-zero)
>       * and the other two must be zero.  Thus we may avoid conditionals.
>       */
> -    return (FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) |
> -            FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, API) |
> -            FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3));
> +    return (FIELD_EX64_IDREG(id, ID_AA64ISAR1, APA) |
> +            FIELD_EX64_IDREG(id, ID_AA64ISAR1, API) |
> +            FIELD_EX64_IDREG(id, ID_AA64ISAR2, APA3));
>  }
>  
>  static inline bool isar_feature_aa64_pauth(const ARMISARegisters *id)
> @@ -521,7 +521,7 @@ static inline bool isar_feature_aa64_pauth_qarma5(const ARMISARegisters *id)
>       * Return true if pauth is enabled with the architected QARMA5 algorithm.
>       * QEMU will always enable or disable both APA and GPA.
>       */
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, APA) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_pauth_qarma3(const ARMISARegisters *id)
> @@ -530,77 +530,77 @@ static inline bool isar_feature_aa64_pauth_qarma3(const ARMISARegisters *id)
>       * Return true if pauth is enabled with the architected QARMA3 algorithm.
>       * QEMU will always enable or disable both APA3 and GPA3.
>       */
> -    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, APA3) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, APA3) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sb(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SB) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, SB) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_predinv(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SPECRES) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, SPECRES) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_frint(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, FRINTTS) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, FRINTTS) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_dcpop(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, DPB) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_dcpodp(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) >= 2;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, DPB) >= 2;
>  }
>  
>  static inline bool isar_feature_aa64_bf16(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, BF16) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, BF16) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_ebf16(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, BF16) > 1;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, BF16) > 1;
>  }
>  
>  static inline bool isar_feature_aa64_rcpc_8_3(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, LRCPC) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_rcpc_8_4(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, LRCPC) >= 2;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, LRCPC) >= 2;
>  }
>  
>  static inline bool isar_feature_aa64_i8mm(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, I8MM) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR1, I8MM) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_wfxt(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, WFXT) >= 2;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, WFXT) >= 2;
>  }
>  
>  static inline bool isar_feature_aa64_hbc(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, BC) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, BC) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_mops(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, MOPS);
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, MOPS);
>  }
>  
>  static inline bool isar_feature_aa64_rpres(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar2, ID_AA64ISAR2, RPRES);
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR2, RPRES);
>  }
>  
>  static inline bool isar_feature_aa64_fp_simd(const ARMISARegisters *id)
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 750a4e957cb2..f8783eff1d41 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2129,9 +2129,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          uint64_t t;
>          uint32_t u;
>  
> -        t = cpu->isar.id_aa64isar1;
> -        t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 0);
> -        cpu->isar.id_aa64isar1 = t;
> +        FIELD_DP64_IDREG(isar, ID_AA64ISAR1, JSCVT, 0);
>  
>          t = cpu->isar.id_aa64pfr0;
>          t = FIELD_DP64(t, ID_AA64PFR0, FP, 0xf);
> @@ -2184,11 +2182,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          t = FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
>          SET_IDREG(isar, ID_AA64ISAR0, t);
>  
> -        t = cpu->isar.id_aa64isar1;
> +        t = GET_IDREG(isar, ID_AA64ISAR1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
>          t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 0);
>          t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 0);
> -        cpu->isar.id_aa64isar1 = t;
> +        SET_IDREG(isar, ID_AA64ISAR1, t);
>  
>          t = cpu->isar.id_aa64pfr0;
>          t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 0xf);
> @@ -2228,9 +2226,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>  
>          FIELD_DP64_IDREG(isar, ID_AA64ISAR0, FHM, 0);
>  
> -        t = cpu->isar.id_aa64isar1;
> -        t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 0);
> -        cpu->isar.id_aa64isar1 = t;
> +        FIELD_DP64_IDREG(isar, ID_AA64ISAR1, FRINTTS, 0);
>  
>          u = cpu->isar.mvfr0;
>          u = FIELD_DP32(u, MVFR0, SIMDREG, 0);
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 57d00da0a927..4a143bc64b27 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1097,8 +1097,6 @@ struct ArchCPU {
>          uint32_t dbgdidr;
>          uint32_t dbgdevid;
>          uint32_t dbgdevid1;
> -        uint64_t id_aa64isar1;
> -        uint64_t id_aa64isar2;
>          uint64_t id_aa64pfr0;
>          uint64_t id_aa64pfr1;
>          uint64_t id_aa64mmfr0;
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index c781efeb7cef..b914f2ed58b5 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -502,6 +502,7 @@ void aarch64_add_sme_properties(Object *obj)
>  void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
>  {
>      ARMPauthFeature features = cpu_isar_feature(pauth_feature, cpu);
> +    ARMISARegisters *isar = &cpu->isar;
>      uint64_t isar1, isar2;
>  
>      /*
> @@ -512,13 +513,13 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
>       *
>       * Begin by disabling all fields.
>       */
> -    isar1 = cpu->isar.id_aa64isar1;
> +    isar1 = GET_IDREG(isar, ID_AA64ISAR1);
>      isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, APA, 0);
>      isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPA, 0);
>      isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, API, 0);
>      isar1 = FIELD_DP64(isar1, ID_AA64ISAR1, GPI, 0);
>  
> -    isar2 = cpu->isar.id_aa64isar2;
> +    isar2 = GET_IDREG(isar, ID_AA64ISAR2);
>      isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, APA3, 0);
>      isar2 = FIELD_DP64(isar2, ID_AA64ISAR2, GPA3, 0);
>  
> @@ -580,8 +581,8 @@ void arm_cpu_pauth_finalize(ARMCPU *cpu, Error **errp)
>          }
>      }
>  
> -    cpu->isar.id_aa64isar1 = isar1;
> -    cpu->isar.id_aa64isar2 = isar2;
> +    SET_IDREG(isar, ID_AA64ISAR1, isar1);
> +    SET_IDREG(isar, ID_AA64ISAR2, isar2);
>  }
>  
>  static const Property arm_cpu_pauth_property =
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8062e5190425..548e51e82a8e 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8006,12 +8006,12 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 1,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .accessfn = access_aa64_tid3,
> -              .resetvalue = cpu->isar.id_aa64isar1 },
> +              .resetvalue = GET_IDREG(isar, ID_AA64ISAR1)},
>              { .name = "ID_AA64ISAR2_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 2,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .accessfn = access_aa64_tid3,
> -              .resetvalue = cpu->isar.id_aa64isar2 },
> +              .resetvalue = GET_IDREG(isar, ID_AA64ISAR2)},
>              { .name = "ID_AA64ISAR3_EL1_RESERVED", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 3,
>                .access = PL1_R, .type = ARM_CP_CONST,
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 0213702ef094..8d6852fd7a52 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -867,7 +867,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
>          { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
>          { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.idregs[ID_AA64ISAR0_EL1_IDX] },
> -        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
> +        { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.idregs[ID_AA64ISAR1_EL1_IDX] },
>          /* Add ID_AA64ISAR2_EL1 here when HVF supports it */
>          { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
>          { HV_SYS_REG_ID_AA64MMFR1_EL1, &host_isar.id_aa64mmfr1 },
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index d187df80f077..e8992348b27f 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -362,10 +362,8 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
>                                ARM64_SYS_REG(3, 0, 0, 5, 1));
>          err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR0_EL1_IDX);
> -        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
> -                              ARM64_SYS_REG(3, 0, 0, 6, 1));
> -        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar2,
> -                              ARM64_SYS_REG(3, 0, 0, 6, 2));
> +        err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR1_EL1_IDX);
> +        err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR2_EL1_IDX);
>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr0,
>                                ARM64_SYS_REG(3, 0, 0, 7, 0));
>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64mmfr1,
Nit: same here. Later you might send a simplification patch doing
s/fdarray[2]/fd

Otherwise looks good after another reading

Eric
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index f31bb9ceaac9..f62e62595d8b 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -68,7 +68,7 @@ static void aarch64_a35_initfn(Object *obj)
>      cpu->isar.id_aa64dfr0 = 0x10305106;
>      cpu->isar.id_aa64dfr1 = 0;
>      SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
> -    cpu->isar.id_aa64isar1 = 0;
> +    SET_IDREG(isar, ID_AA64ISAR1, 0);
>      cpu->isar.id_aa64mmfr0 = 0x00101122;
>      cpu->isar.id_aa64mmfr1 = 0;
>      cpu->clidr = 0x0a200023;
> @@ -224,7 +224,7 @@ static void aarch64_a55_initfn(Object *obj)
>      cpu->dcz_blocksize = 4; /* 64 bytes */
>      cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
>      SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
> -    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
> +    SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
>      cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
>      cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
>      cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
> @@ -357,7 +357,7 @@ static void aarch64_a76_initfn(Object *obj)
>      cpu->dcz_blocksize = 4;
>      cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
>      SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
> -    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
> +    SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
>      cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
>      cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
>      cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
> @@ -437,7 +437,7 @@ static void aarch64_a64fx_initfn(Object *obj)
>      cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
>      cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
>      SET_IDREG(isar, ID_AA64ISAR0, 0x0000000010211120);
> -    cpu->isar.id_aa64isar1 = 0x0000000000010001;
> +    SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000010001);
>      SET_IDREG(isar, ID_AA64ZFR0, 0x0000000000000000);
>      cpu->clidr = 0x0000000080000023;
>      /* 64KB L1 dcache */
> @@ -605,7 +605,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
>      cpu->dcz_blocksize = 4;
>      cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
>      SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
> -    cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
> +    SET_IDREG(isar, ID_AA64ISAR1, 0x0000000000100001ull);
>      cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
>      cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
>      cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
> @@ -684,7 +684,7 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
>      cpu->isar.id_aa64dfr0  = 0x000001f210305519ull;
>      cpu->isar.id_aa64dfr1 = 0x00000000;
>      SET_IDREG(isar, ID_AA64ISAR0, 0x1011111110212120ull); /* with FEAT_RNG */
> -    cpu->isar.id_aa64isar1 = 0x0011100001211032ull;
> +    SET_IDREG(isar, ID_AA64ISAR1, 0x0011000001211032ull);
>      cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
>      cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
>      cpu->isar.id_aa64mmfr2 = 0x0220011102101011ull;
> @@ -933,7 +933,7 @@ static void aarch64_a710_initfn(Object *obj)
>      cpu->id_aa64afr0       = 0;
>      cpu->id_aa64afr1       = 0;
>      SET_IDREG(isar, ID_AA64ISAR0, 0x0221111110212120ull); /* with Crypto */
> -    cpu->isar.id_aa64isar1 = 0x0010111101211052ull;
> +    SET_IDREG(isar, ID_AA64ISAR1, 0x0010111101211052ull);
>      cpu->isar.id_aa64mmfr0 = 0x0000022200101122ull;
>      cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
>      cpu->isar.id_aa64mmfr2 = 0x1221011110101011ull;
> @@ -1035,7 +1035,7 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
>      cpu->id_aa64afr0       = 0;
>      cpu->id_aa64afr1       = 0;
>      SET_IDREG(isar, ID_AA64ISAR0, 0x1221111110212120ull); /* with Crypto and FEAT_RNG */
> -    cpu->isar.id_aa64isar1 = 0x0011111101211052ull;
> +    SET_IDREG(isar, ID_AA64ISAR1, 0x0011111101211052ull);
>      cpu->isar.id_aa64mmfr0 = 0x0000022200101125ull;
>      cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
>      cpu->isar.id_aa64mmfr2 = 0x1221011112101011ull;
> @@ -1160,7 +1160,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>      t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);     /* FEAT_RNG */
>      SET_IDREG(isar, ID_AA64ISAR0, t);
>  
> -    t = cpu->isar.id_aa64isar1;
> +    t = GET_IDREG(isar, ID_AA64ISAR1);
>      t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* FEAT_DPB2 */
>      t = FIELD_DP64(t, ID_AA64ISAR1, APA, PauthFeat_FPACCOMBINED);
>      t = FIELD_DP64(t, ID_AA64ISAR1, API, 1);
> @@ -1174,14 +1174,14 @@ void aarch64_max_tcg_initfn(Object *obj)
>      t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
>      t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
>      t = FIELD_DP64(t, ID_AA64ISAR1, XS, 1);       /* FEAT_XS */
> -    cpu->isar.id_aa64isar1 = t;
> +    SET_IDREG(isar, ID_AA64ISAR1, t);
>  
> -    t = cpu->isar.id_aa64isar2;
> +    t = GET_IDREG(isar, ID_AA64ISAR2);
>      t = FIELD_DP64(t, ID_AA64ISAR2, RPRES, 1);    /* FEAT_RPRES */
>      t = FIELD_DP64(t, ID_AA64ISAR2, MOPS, 1);     /* FEAT_MOPS */
>      t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
>      t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
> -    cpu->isar.id_aa64isar2 = t;
> +    SET_IDREG(isar, ID_AA64ISAR2, t);
>  
>      t = cpu->isar.id_aa64pfr0;
>      t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
