Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp6022027njd;
        Mon, 28 Apr 2025 07:52:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4jOb26XadqE9BdiSw0JRSoTHEAA4BUrgCgP2o5PrOXH/6uW3RN2jnDWXAI3ZthUOZQIXVzNW+fnaZuw==@linaro.org
X-Google-Smtp-Source: AGHT+IEnoLXDqG7DHz5HDCojhH8gu0FalJsVezBpgOn6uDr9koiv+o+ZpMydxVJWT7jxnDBGUbCp
X-Received: by 2002:a17:90b:4f45:b0:2f9:c56b:6ec8 with SMTP id 98e67ed59e1d1-309f7ddea32mr18183736a91.10.1745851928969;
        Mon, 28 Apr 2025 07:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745851928; cv=none;
        d=google.com; s=arc-20240605;
        b=fdtHdv8zvcYUu3WYUVgBAmvrNrGPgWrYTwop8jXXbDUXMaTnJi/b0w3D4mhkGjPIK+
         f9ZknpH60DKyiFx58N+qBwcxGmKPg1VdhpvFhLDYbqbIfAZNmpHNRabTaZGnqyt4Rwkw
         jM+U3UKeEzVUoq0/kz3FrN5aBWlMhfAZtR1dl6MN1f9zny5vM5QN553hRJEA/K5tmABS
         Gm5SeMMTj/caX691st3ijdMgJwhit4iJWPLZy8euHK2PQ7nhRe1KpA2JcVc+6uQJIz1a
         7Zn1dcPArh0r+j7AZb9Z3t3mWYdfYybcjW9jr5s6bkwp+6IxIn/kiZ8uem2ciTMLGoCE
         TmzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=j/npAyFpB4wLxaPnRXXmqyb2DxiGXMZDPBaubKDl9vo=;
        fh=YQPMyTHh8Z8DNCCirEsaTJcVhoSf+flLLQ9RGt/ZFHg=;
        b=a+Wf2OFiXcr2FHoDaiU63DEsO/auWcM7qA+oBhBlY1DHi94jfvHmgplfCDKqImtGs+
         WcEYEMx9Q1lJQN+UsTA5SMIST0RxZUlCZOQK793Z0BEUN4xOb/s2glZfeapvQFRktjk/
         EkGI3C7rEOLwSgyUleCRRoxEyZ9Gnthmf78hFeKX5qLSSPn1KJa3U6+/usGg7NUnVNgw
         d6H+mMErXZyf6Xx9YjKwYUFZEBgSqszTDfO+nb/dpcRWYRnbXImrZWKtSDSk75boRa2K
         trWaqxemwYZhglfH6pGAh2G5+EidxKDdNgNf99e394UJj5/dm1sEOBCj/R1SgaBndCbH
         /H8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UNsExGDJ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d9443c01a7336-22db4fdb419si135153225ad.302.2025.04.28.07.52.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 07:52:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UNsExGDJ;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745851927;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/npAyFpB4wLxaPnRXXmqyb2DxiGXMZDPBaubKDl9vo=;
	b=UNsExGDJ/wY3vr0PAGtvPUSYsEI/QTtxgqYU5rtDgHn3JlTVYug8fF3UAs+iMWC6hVdgo6
	GwUgNizZRasN/BcST/QKwBI5TN82urNvmlcxc47h0wsQq2zDHDYZuoJLWXM5cKAwtYhbbH
	EqhAh1uVxEma79bylo2YMp/NE/JMnc8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-MYYEwYe9PTKoXwW7r-25Qw-1; Mon, 28 Apr 2025 10:52:06 -0400
X-MC-Unique: MYYEwYe9PTKoXwW7r-25Qw-1
X-Mimecast-MFC-AGG-ID: MYYEwYe9PTKoXwW7r-25Qw_1745851925
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39143311936so1635457f8f.0
        for <alex.bennee@linaro.org>; Mon, 28 Apr 2025 07:52:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745851925; x=1746456725;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/npAyFpB4wLxaPnRXXmqyb2DxiGXMZDPBaubKDl9vo=;
        b=El41LapwXn1M3cLR7b3Gq139p8RhiZ2wC4jOakzztYKLZ5o6ASeXd6wkfVo9uylZlG
         VcQ6S8TDKlNGWgKXZShSMnytq9TYRTKghpM/TLiQOSEZq+LeytfdUX/xaEYocHU5GR57
         XqRa7By2U67YhL1Y4I7co3CRwFqp03VCxvMD2WNQVVXeOHO2yd/0Wuo8yl0wNelNS+YP
         6Vl00DILkx7HbLvaj8UWqNDdH3MQg9uSBkGd9CDmEicR8nrG8Ai4GC1/HYwTUpbQVgBc
         EzOJ5VPL31K1XzVwsXllxFnlyzqkGEusaaMKqGLZpSDuUULWbER6qprcuTVl/fkY8ep2
         WUsw==
X-Forwarded-Encrypted: i=1; AJvYcCUBuOVMGvq17dskrKBIw5tIIjZmNImQ4n3E3456vdUCkNV68hO9ZnEI0MOgm9YbK7ROz6WlsFbCoEvs6w==@linaro.org
X-Gm-Message-State: AOJu0YyKHrpNgzhbVk8B9VIFWHC3VhNaj3SQdIW/Xl8ptPEkQTtX2Cec
	njDYsfkQTz5+V/NrST2icenRYb81U6UfKJXl+dxPPjo6Y4wPTlzKHJuNo5g1RjWdYZCAzIVo8Pu
	xW2W3Dlv0jF6vWROmok0GRRc+8LpcB1+gJeg2krsxpoZ9xwTqbpeVDA==
X-Gm-Gg: ASbGncuYr0qqQwQaoGCvHwxkc+iKiJPmD0kfQg1kg8Hea5y7OAkzxU2ikfOM9P7gZFP
	HrR2rhn3FRDVD4JFMrQUADrSJVwq7IbqAtHxPybxa04p7jtmzqs2mil2eNwbn63TwsB7DYVJv3p
	9z/zHUZFJM4UiPcKztKkacPshddlrgMVAiLPpjesGVND7tfF2HluNLXpmK71eOy2kes+7wJ46Up
	1zAuWDGeHEhJs6lQ8F1P+oD5suiferrMsXqheTp94YdHrA5Q2IjkhYFl3OfSl5sIOxFwdfnpzWt
	W4pbxtBBYswWJML8DMXkDK7AMhXa9t3TEY6yeIK/HlxsVBwNjhBs4UlFVm0=
X-Received: by 2002:a05:6000:250c:b0:3a0:88c7:47d with SMTP id ffacd0b85a97d-3a088c70487mr397401f8f.38.1745851924808;
        Mon, 28 Apr 2025 07:52:04 -0700 (PDT)
X-Received: by 2002:a05:6000:250c:b0:3a0:88c7:47d with SMTP id ffacd0b85a97d-3a088c70487mr397368f8f.38.1745851924206;
        Mon, 28 Apr 2025 07:52:04 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbf030sm11307378f8f.46.2025.04.28.07.52.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 07:52:03 -0700 (PDT)
Message-ID: <470349f3-2539-4099-8958-980480459345@redhat.com>
Date: Mon, 28 Apr 2025 16:52:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH for-10.1 v5 02/13] arm/cpu: Store aa64isar0/aa64zfr0 into
 the idregs arrays
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
 <20250409144304.912325-3-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250409144304.912325-3-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mdDANOb8RVEUx_InaNUiVqzmFU2DK9LZEyOjoBMoj-E_1745851925
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: VrD0HFzAHQ/I

Hi Connie,

On 4/9/25 4:42 PM, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> Also add kvm add accessors for storing host features into idregs.
nit: add kvm add?
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/cpu-features.h | 57 ++++++++++++++++++++-------------------
>  target/arm/cpu-sysregs.h  |  4 +++
>  target/arm/cpu.c          | 10 +++----
>  target/arm/cpu.h          |  2 --
>  target/arm/cpu64.c        |  8 +++---
>  target/arm/helper.c       |  6 +++--
>  target/arm/hvf/hvf.c      |  3 ++-
>  target/arm/kvm.c          | 30 ++++++++++++++++++---
>  target/arm/tcg/cpu64.c    | 44 ++++++++++++++++++------------
>  9 files changed, 101 insertions(+), 63 deletions(-)
>
> diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
> index 525e4cee12f6..779bcd1abb36 100644
> --- a/target/arm/cpu-features.h
> +++ b/target/arm/cpu-features.h
> @@ -22,6 +22,7 @@
>  
>  #include "hw/registerfields.h"
>  #include "qemu/host-utils.h"
> +#include "cpu-sysregs.h"
>  
>  /*
>   * Naming convention for isar_feature functions:
> @@ -376,92 +377,92 @@ static inline bool isar_feature_aa32_doublelock(const ARMISARegisters *id)
>   */
>  static inline bool isar_feature_aa64_aes(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, AES) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, AES) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_pmull(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, AES) > 1;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, AES) > 1;
>  }
>  
>  static inline bool isar_feature_aa64_sha1(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, SHA1) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, SHA1) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sha256(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, SHA2) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, SHA2) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sha512(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, SHA2) > 1;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, SHA2) > 1;
>  }
>  
>  static inline bool isar_feature_aa64_crc32(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, CRC32) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, CRC32) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_atomics(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, ATOMIC) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, ATOMIC) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_rdm(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, RDM) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, RDM) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sha3(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, SHA3) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, SHA3) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sm3(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, SM3) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, SM3) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sm4(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, SM4) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, SM4) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_dp(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, DP) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, DP) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_fhm(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, FHM) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, FHM) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_condm_4(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TS) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, TS) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_condm_5(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TS) >= 2;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, TS) >= 2;
>  }
>  
>  static inline bool isar_feature_aa64_rndr(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, RNDR) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, RNDR) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_tlbirange(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) == 2;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, TLB) == 2;
>  }
>  
>  static inline bool isar_feature_aa64_tlbios(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64isar0, ID_AA64ISAR0, TLB) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ISAR0, TLB) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_jscvt(const ARMISARegisters *id)
> @@ -927,52 +928,52 @@ static inline bool isar_feature_aa64_doublelock(const ARMISARegisters *id)
>  
>  static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SVEVER) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sve2_aes(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, AES) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sve2_pmull128(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, AES) >= 2;
> +    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, AES) >= 2;
>  }
>  
>  static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, BITPERM) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sve_bf16(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BFLOAT16) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, BFLOAT16) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sve2_sha3(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SHA3) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SHA3) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sve2_sm4(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SM4) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, SM4) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sve_i8mm(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, I8MM) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, I8MM) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sve_f32mm(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F32MM) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, F32MM) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sve_f64mm(const ARMISARegisters *id)
>  {
> -    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, F64MM) != 0;
> +    return FIELD_EX64_IDREG(id, ID_AA64ZFR0, F64MM) != 0;
>  }
>  
>  static inline bool isar_feature_aa64_sme_f64f64(const ARMISARegisters *id)
> diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
> index 7877a3b06a8e..e89a1105904c 100644
> --- a/target/arm/cpu-sysregs.h
> +++ b/target/arm/cpu-sysregs.h
> @@ -39,4 +39,8 @@ extern const uint32_t id_register_sysreg[NUM_ID_IDX];
>  
>  int get_sysreg_idx(ARMSysRegs sysreg);
>  
> +#ifdef CONFIG_KVM
> +uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg);
> +#endif
> +
>  #endif /* ARM_CPU_SYSREGS_H */
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 01786ac7879c..750a4e957cb2 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1968,6 +1968,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>  {
>      CPUState *cs = CPU(dev);
>      ARMCPU *cpu = ARM_CPU(dev);
> +    ARMISARegisters *isar = &cpu->isar;
>      ARMCPUClass *acc = ARM_CPU_GET_CLASS(dev);
>      CPUARMState *env = &cpu->env;
>      Error *local_err = NULL;
> @@ -2173,7 +2174,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>  
>          unset_feature(env, ARM_FEATURE_NEON);
>  
> -        t = cpu->isar.id_aa64isar0;
> +        t = GET_IDREG(isar, ID_AA64ISAR0);
>          t = FIELD_DP64(t, ID_AA64ISAR0, AES, 0);
>          t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 0);
>          t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 0);
> @@ -2181,7 +2182,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 0);
>          t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 0);
>          t = FIELD_DP64(t, ID_AA64ISAR0, DP, 0);
> -        cpu->isar.id_aa64isar0 = t;
> +        SET_IDREG(isar, ID_AA64ISAR0, t);
>  
>          t = cpu->isar.id_aa64isar1;
>          t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
> @@ -2223,12 +2224,9 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      }
>  
>      if (!cpu->has_neon && !cpu->has_vfp) {
> -        uint64_t t;
>          uint32_t u;
>  
> -        t = cpu->isar.id_aa64isar0;
> -        t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 0);
> -        cpu->isar.id_aa64isar0 = t;
> +        FIELD_DP64_IDREG(isar, ID_AA64ISAR0, FHM, 0);
>  
>          t = cpu->isar.id_aa64isar1;
>          t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 0);
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 5048c85b188c..57d00da0a927 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1097,7 +1097,6 @@ struct ArchCPU {
>          uint32_t dbgdidr;
>          uint32_t dbgdevid;
>          uint32_t dbgdevid1;
> -        uint64_t id_aa64isar0;
>          uint64_t id_aa64isar1;
>          uint64_t id_aa64isar2;
>          uint64_t id_aa64pfr0;
> @@ -1108,7 +1107,6 @@ struct ArchCPU {
>          uint64_t id_aa64mmfr3;
>          uint64_t id_aa64dfr0;
>          uint64_t id_aa64dfr1;
> -        uint64_t id_aa64zfr0;
>          uint64_t id_aa64smfr0;
>          uint64_t reset_pmcr_el0;
>          uint64_t idregs[NUM_ID_IDX];
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 62eff5375c19..c781efeb7cef 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -136,7 +136,7 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>               * SVE is disabled and so are all vector lengths.  Good.
>               * Disable all SVE extensions as well.
>               */
> -            cpu->isar.id_aa64zfr0 = 0;
> +            SET_IDREG(&cpu->isar, ID_AA64ZFR0, 0);
>              return;
>          }
>  
> @@ -639,6 +639,7 @@ void arm_cpu_lpa2_finalize(ARMCPU *cpu, Error **errp)
>  static void aarch64_a57_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    ARMISARegisters *isar = &cpu->isar;
>  
>      cpu->dtb_compatible = "arm,cortex-a57";
>      set_feature(&cpu->env, ARM_FEATURE_V8);
> @@ -676,7 +677,7 @@ static void aarch64_a57_initfn(Object *obj)
>      cpu->isar.id_isar6 = 0;
>      cpu->isar.id_aa64pfr0 = 0x00002222;
>      cpu->isar.id_aa64dfr0 = 0x10305106;
> -    cpu->isar.id_aa64isar0 = 0x00011120;
> +    SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
>      cpu->isar.id_aa64mmfr0 = 0x00001124;
>      cpu->isar.dbgdidr = 0x3516d000;
>      cpu->isar.dbgdevid = 0x01110f13;
> @@ -700,6 +701,7 @@ static void aarch64_a57_initfn(Object *obj)
>  static void aarch64_a53_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    ARMISARegisters *isar = &cpu->isar;
>  
>      cpu->dtb_compatible = "arm,cortex-a53";
>      set_feature(&cpu->env, ARM_FEATURE_V8);
> @@ -737,7 +739,7 @@ static void aarch64_a53_initfn(Object *obj)
>      cpu->isar.id_isar6 = 0;
>      cpu->isar.id_aa64pfr0 = 0x00002222;
>      cpu->isar.id_aa64dfr0 = 0x10305106;
> -    cpu->isar.id_aa64isar0 = 0x00011120;
> +    SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
>      cpu->isar.id_aa64mmfr0 = 0x00001122; /* 40 bit physical addr */
>      cpu->isar.dbgdidr = 0x3516d000;
>      cpu->isar.dbgdevid = 0x00110f13;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index bb445e30cd15..8062e5190425 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7750,6 +7750,8 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>  {
>      /* Register all the coprocessor registers based on feature bits */
>      CPUARMState *env = &cpu->env;
> +    ARMISARegisters *isar = &cpu->isar;
> +
>      if (arm_feature(env, ARM_FEATURE_M)) {
>          /* M profile has no coprocessor registers */
>          return;
> @@ -7939,7 +7941,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 4,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .accessfn = access_aa64_tid3,
> -              .resetvalue = cpu->isar.id_aa64zfr0 },
> +              .resetvalue = GET_IDREG(isar, ID_AA64ZFR0)},
>              { .name = "ID_AA64SMFR0_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 4, .opc2 = 5,
>                .access = PL1_R, .type = ARM_CP_CONST,
> @@ -7999,7 +8001,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 0,
>                .access = PL1_R, .type = ARM_CP_CONST,
>                .accessfn = access_aa64_tid3,
> -              .resetvalue = cpu->isar.id_aa64isar0 },
> +              .resetvalue = GET_IDREG(isar, ID_AA64ISAR0)},
>              { .name = "ID_AA64ISAR1_EL1", .state = ARM_CP_STATE_AA64,
>                .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 6, .opc2 = 1,
>                .access = PL1_R, .type = ARM_CP_CONST,
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 2439af63a05a..0213702ef094 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -19,6 +19,7 @@
>  #include "system/hw_accel.h"
>  #include "hvf_arm.h"
>  #include "cpregs.h"
> +#include "cpu-sysregs.h"
>  
>  #include <mach/mach_time.h>
>  
> @@ -865,7 +866,7 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>          { HV_SYS_REG_ID_AA64PFR1_EL1, &host_isar.id_aa64pfr1 },
>          { HV_SYS_REG_ID_AA64DFR0_EL1, &host_isar.id_aa64dfr0 },
>          { HV_SYS_REG_ID_AA64DFR1_EL1, &host_isar.id_aa64dfr1 },
> -        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.id_aa64isar0 },
> +        { HV_SYS_REG_ID_AA64ISAR0_EL1, &host_isar.idregs[ID_AA64ISAR0_EL1_IDX] },
>          { HV_SYS_REG_ID_AA64ISAR1_EL1, &host_isar.id_aa64isar1 },
>          /* Add ID_AA64ISAR2_EL1 here when HVF supports it */
>          { HV_SYS_REG_ID_AA64MMFR0_EL1, &host_isar.id_aa64mmfr0 },
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index da30bdbb2349..d187df80f077 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -26,6 +26,7 @@
>  #include "system/kvm_int.h"
>  #include "kvm_arm.h"
>  #include "cpu.h"
> +#include "cpu-sysregs.h"
>  #include "trace.h"
>  #include "internals.h"
>  #include "hw/pci/pci.h"
> @@ -246,6 +247,28 @@ static bool kvm_arm_pauth_supported(void)
>              kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
>  }
>  
> +
> +uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg)
> +{
> +    return ARM64_SYS_REG((sysreg & CP_REG_ARM64_SYSREG_OP0_MASK) >> CP_REG_ARM64_SYSREG_OP0_SHIFT,
> +                         (sysreg & CP_REG_ARM64_SYSREG_OP1_MASK) >> CP_REG_ARM64_SYSREG_OP1_SHIFT,
> +                         (sysreg & CP_REG_ARM64_SYSREG_CRN_MASK) >> CP_REG_ARM64_SYSREG_CRN_SHIFT,
> +                         (sysreg & CP_REG_ARM64_SYSREG_CRM_MASK) >> CP_REG_ARM64_SYSREG_CRM_SHIFT,
> +                         (sysreg & CP_REG_ARM64_SYSREG_OP2_MASK) >> CP_REG_ARM64_SYSREG_OP2_SHIFT);
> +}
> +
> +/* read a sysreg value and store it in the idregs */
> +static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf, ARMIDRegisterIdx index)
> +{
> +    uint64_t *reg;
> +    int ret;
> +
> +    reg = &ahcf->isar.idregs[index];
> +    ret = read_sys_reg64(fd, reg,
> +                         idregs_sysreg_to_kvm_reg(id_register_sysreg[index]));
> +    return ret;
> +}
> +
>  static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>  {
>      /* Identify the feature bits corresponding to the host CPU, and
> @@ -306,6 +329,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>  
>      ahcf->target = init.target;
>      ahcf->dtb_compatible = "arm,arm-v8";
> +    int fd = fdarray[2];
>  
>      err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
>                           ARM64_SYS_REG(3, 0, 0, 4, 0));
> @@ -337,8 +361,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>                                ARM64_SYS_REG(3, 0, 0, 5, 0));
>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
>                                ARM64_SYS_REG(3, 0, 0, 5, 1));
> -        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar0,
while at it you could add use fd in this other calls instead of
fdarray[2]. But this can be done later.
> -                              ARM64_SYS_REG(3, 0, 0, 6, 0));
> +        err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR0_EL1_IDX);
>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
>                                ARM64_SYS_REG(3, 0, 0, 6, 1));
>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar2,
> @@ -447,8 +470,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>               * enabled SVE support, which resulted in an error rather than RAZ.
>               * So only read the register if we set KVM_ARM_VCPU_SVE above.
>               */
> -            err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64zfr0,
> -                                  ARM64_SYS_REG(3, 0, 0, 4, 4));
> +            err |= get_host_cpu_reg(fd, ahcf, ID_AA64ZFR0_EL1_IDX);
>          }
>      }
>  
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 29ab0ac79da9..f31bb9ceaac9 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -32,6 +32,7 @@
>  static void aarch64_a35_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    ARMISARegisters *isar = &cpu->isar;
>  
>      cpu->dtb_compatible = "arm,cortex-a35";
>      set_feature(&cpu->env, ARM_FEATURE_V8);
> @@ -66,7 +67,7 @@ static void aarch64_a35_initfn(Object *obj)
>      cpu->isar.id_aa64pfr1 = 0;
>      cpu->isar.id_aa64dfr0 = 0x10305106;
>      cpu->isar.id_aa64dfr1 = 0;
> -    cpu->isar.id_aa64isar0 = 0x00011120;
> +    SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
>      cpu->isar.id_aa64isar1 = 0;
>      cpu->isar.id_aa64mmfr0 = 0x00101122;
>      cpu->isar.id_aa64mmfr1 = 0;
> @@ -204,6 +205,7 @@ static const Property arm_cpu_lpa2_property =
>  static void aarch64_a55_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    ARMISARegisters *isar = &cpu->isar;
>  
>      cpu->dtb_compatible = "arm,cortex-a55";
>      set_feature(&cpu->env, ARM_FEATURE_V8);
> @@ -221,7 +223,7 @@ static void aarch64_a55_initfn(Object *obj)
>      cpu->ctr = 0x84448004; /* L1Ip = VIPT */
>      cpu->dcz_blocksize = 4; /* 64 bytes */
>      cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
> -    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
> +    SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
>      cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
>      cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
>      cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
> @@ -276,6 +278,7 @@ static void aarch64_a55_initfn(Object *obj)
>  static void aarch64_a72_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    ARMISARegisters *isar = &cpu->isar;
>  
>      cpu->dtb_compatible = "arm,cortex-a72";
>      set_feature(&cpu->env, ARM_FEATURE_V8);
> @@ -311,7 +314,7 @@ static void aarch64_a72_initfn(Object *obj)
>      cpu->isar.id_isar5 = 0x00011121;
>      cpu->isar.id_aa64pfr0 = 0x00002222;
>      cpu->isar.id_aa64dfr0 = 0x10305106;
> -    cpu->isar.id_aa64isar0 = 0x00011120;
> +    SET_IDREG(isar, ID_AA64ISAR0, 0x00011120);
>      cpu->isar.id_aa64mmfr0 = 0x00001124;
>      cpu->isar.dbgdidr = 0x3516d000;
>      cpu->isar.dbgdevid = 0x01110f13;
> @@ -335,6 +338,7 @@ static void aarch64_a72_initfn(Object *obj)
>  static void aarch64_a76_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    ARMISARegisters *isar = &cpu->isar;
>  
>      cpu->dtb_compatible = "arm,cortex-a76";
>      set_feature(&cpu->env, ARM_FEATURE_V8);
> @@ -352,7 +356,7 @@ static void aarch64_a76_initfn(Object *obj)
>      cpu->ctr = 0x8444C004;
>      cpu->dcz_blocksize = 4;
>      cpu->isar.id_aa64dfr0  = 0x0000000010305408ull;
> -    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
> +    SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
>      cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
>      cpu->isar.id_aa64mmfr0 = 0x0000000000101122ull;
>      cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
> @@ -408,6 +412,7 @@ static void aarch64_a76_initfn(Object *obj)
>  static void aarch64_a64fx_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    ARMISARegisters *isar = &cpu->isar;
>  
>      cpu->dtb_compatible = "arm,a64fx";
>      set_feature(&cpu->env, ARM_FEATURE_V8);
> @@ -431,9 +436,9 @@ static void aarch64_a64fx_initfn(Object *obj)
>      cpu->isar.id_aa64mmfr0 = 0x0000000000001122;
>      cpu->isar.id_aa64mmfr1 = 0x0000000011212100;
>      cpu->isar.id_aa64mmfr2 = 0x0000000000001011;
> -    cpu->isar.id_aa64isar0 = 0x0000000010211120;
> +    SET_IDREG(isar, ID_AA64ISAR0, 0x0000000010211120);
>      cpu->isar.id_aa64isar1 = 0x0000000000010001;
> -    cpu->isar.id_aa64zfr0 = 0x0000000000000000;
> +    SET_IDREG(isar, ID_AA64ZFR0, 0x0000000000000000);
>      cpu->clidr = 0x0000000080000023;
>      /* 64KB L1 dcache */
>      cpu->ccsidr[0] = make_ccsidr(CCSIDR_FORMAT_LEGACY, 4, 256, 64 * KiB, 7);
> @@ -581,6 +586,7 @@ static void define_neoverse_v1_cp_reginfo(ARMCPU *cpu)
>  static void aarch64_neoverse_n1_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    ARMISARegisters *isar = &cpu->isar;
>  
>      cpu->dtb_compatible = "arm,neoverse-n1";
>      set_feature(&cpu->env, ARM_FEATURE_V8);
> @@ -598,7 +604,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
>      cpu->ctr = 0x8444c004;
>      cpu->dcz_blocksize = 4;
>      cpu->isar.id_aa64dfr0  = 0x0000000110305408ull;
> -    cpu->isar.id_aa64isar0 = 0x0000100010211120ull;
> +    SET_IDREG(isar, ID_AA64ISAR0, 0x0000100010211120ull);
>      cpu->isar.id_aa64isar1 = 0x0000000000100001ull;
>      cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
>      cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
> @@ -656,6 +662,7 @@ static void aarch64_neoverse_n1_initfn(Object *obj)
>  static void aarch64_neoverse_v1_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    ARMISARegisters *isar = &cpu->isar;
>  
>      cpu->dtb_compatible = "arm,neoverse-v1";
>      set_feature(&cpu->env, ARM_FEATURE_V8);
> @@ -676,7 +683,7 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
>      cpu->id_aa64afr1 = 0x00000000;
>      cpu->isar.id_aa64dfr0  = 0x000001f210305519ull;
>      cpu->isar.id_aa64dfr1 = 0x00000000;
> -    cpu->isar.id_aa64isar0 = 0x1011111110212120ull; /* with FEAT_RNG */
> +    SET_IDREG(isar, ID_AA64ISAR0, 0x1011111110212120ull); /* with FEAT_RNG */
>      cpu->isar.id_aa64isar1 = 0x0011100001211032ull;
>      cpu->isar.id_aa64mmfr0 = 0x0000000000101125ull;
>      cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
> @@ -735,7 +742,7 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
>      cpu->isar.mvfr2 = 0x00000043;
>  
>      /* From 3.7.5 ID_AA64ZFR0_EL1 */
> -    cpu->isar.id_aa64zfr0 = 0x0000100000100000;
> +    SET_IDREG(isar, ID_AA64ZFR0, 0x0000100000100000);
>      cpu->sve_vq.supported = (1 << 0)  /* 128bit */
>                              | (1 << 1);  /* 256bit */
>  
> @@ -882,6 +889,7 @@ static const ARMCPRegInfo cortex_a710_cp_reginfo[] = {
>  static void aarch64_a710_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    ARMISARegisters *isar = &cpu->isar;
>  
>      cpu->dtb_compatible = "arm,cortex-a710";
>      set_feature(&cpu->env, ARM_FEATURE_V8);
> @@ -919,12 +927,12 @@ static void aarch64_a710_initfn(Object *obj)
>      cpu->isar.id_pfr2  = 0x00000011;
>      cpu->isar.id_aa64pfr0  = 0x1201111120111112ull; /* GIC filled in later */
>      cpu->isar.id_aa64pfr1  = 0x0000000000000221ull;
> -    cpu->isar.id_aa64zfr0  = 0x0000110100110021ull; /* with Crypto */
> +    SET_IDREG(isar, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
>      cpu->isar.id_aa64dfr0  = 0x000011f010305619ull;
>      cpu->isar.id_aa64dfr1  = 0;
>      cpu->id_aa64afr0       = 0;
>      cpu->id_aa64afr1       = 0;
> -    cpu->isar.id_aa64isar0 = 0x0221111110212120ull; /* with Crypto */
> +    SET_IDREG(isar, ID_AA64ISAR0, 0x0221111110212120ull); /* with Crypto */
>      cpu->isar.id_aa64isar1 = 0x0010111101211052ull;
>      cpu->isar.id_aa64mmfr0 = 0x0000022200101122ull;
>      cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
> @@ -983,6 +991,7 @@ static const ARMCPRegInfo neoverse_n2_cp_reginfo[] = {
>  static void aarch64_neoverse_n2_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    ARMISARegisters *isar = &cpu->isar;
>  
>      cpu->dtb_compatible = "arm,neoverse-n2";
>      set_feature(&cpu->env, ARM_FEATURE_V8);
> @@ -1020,12 +1029,12 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
>      cpu->isar.id_pfr2  = 0x00000011;
>      cpu->isar.id_aa64pfr0  = 0x1201111120111112ull; /* GIC filled in later */
>      cpu->isar.id_aa64pfr1  = 0x0000000000000221ull;
> -    cpu->isar.id_aa64zfr0  = 0x0000110100110021ull; /* with Crypto */
> +    SET_IDREG(isar, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
>      cpu->isar.id_aa64dfr0  = 0x000011f210305619ull;
>      cpu->isar.id_aa64dfr1  = 0;
>      cpu->id_aa64afr0       = 0;
>      cpu->id_aa64afr1       = 0;
> -    cpu->isar.id_aa64isar0 = 0x1221111110212120ull; /* with Crypto and FEAT_RNG */
> +    SET_IDREG(isar, ID_AA64ISAR0, 0x1221111110212120ull); /* with Crypto and FEAT_RNG */
>      cpu->isar.id_aa64isar1 = 0x0011111101211052ull;
>      cpu->isar.id_aa64mmfr0 = 0x0000022200101125ull;
>      cpu->isar.id_aa64mmfr1 = 0x0000000010212122ull;
> @@ -1083,6 +1092,7 @@ static void aarch64_neoverse_n2_initfn(Object *obj)
>  void aarch64_max_tcg_initfn(Object *obj)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
> +    ARMISARegisters *isar = &cpu->isar;
>      uint64_t t;
>      uint32_t u;
>  
> @@ -1133,7 +1143,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>      t = FIELD_DP64(t, CTR_EL0, DIC, 1);
>      cpu->ctr = t;
>  
> -    t = cpu->isar.id_aa64isar0;
> +    t = GET_IDREG(isar, ID_AA64ISAR0);
>      t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
>      t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
>      t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2);     /* FEAT_SHA512 */
> @@ -1148,7 +1158,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>      t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2);       /* FEAT_FlagM2 */
>      t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);      /* FEAT_TLBIRANGE */
>      t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);     /* FEAT_RNG */
> -    cpu->isar.id_aa64isar0 = t;
> +    SET_IDREG(isar, ID_AA64ISAR0, t);
>  
>      t = cpu->isar.id_aa64isar1;
>      t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* FEAT_DPB2 */
> @@ -1244,7 +1254,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>      t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
>      cpu->isar.id_aa64mmfr3 = t;
>  
> -    t = cpu->isar.id_aa64zfr0;
> +    t = GET_IDREG(isar, ID_AA64ZFR0);
>      t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
>      t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);       /* FEAT_SVE_PMULL128 */
>      t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);   /* FEAT_SVE_BitPerm */
> @@ -1254,7 +1264,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>      t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);      /* FEAT_I8MM */
>      t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);     /* FEAT_F32MM */
>      t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);     /* FEAT_F64MM */
> -    cpu->isar.id_aa64zfr0 = t;
> +    SET_IDREG(isar, ID_AA64ZFR0, t);
>  
>      t = cpu->isar.id_aa64dfr0;
>      t = FIELD_DP64(t, ID_AA64DFR0, DEBUGVER, 10); /* FEAT_Debugv8p8 */
Thanks

Eric
