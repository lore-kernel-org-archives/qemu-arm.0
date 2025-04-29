Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp383517njm;
        Tue, 29 Apr 2025 09:27:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2UfKVnDalAKPpWQQSSe+O60Z/tkT7p8FFYdmBtOrAROC9uyXrFqKiJd2HMOHdCy1FBiprN5oTS64AsQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGLbPsHfRFjzqjWOUViXfUrsZshZlYmC9f3uF3mp/An0qIP/oQ1HiVFiOCONIiQvTpaxrkt
X-Received: by 2002:a05:6902:461a:b0:e72:8c6a:f464 with SMTP id 3f1490d57ef6-e73510e676cmr5219349276.24.1745944034404;
        Tue, 29 Apr 2025 09:27:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745944034; cv=none;
        d=google.com; s=arc-20240605;
        b=J5mt0uRDzRSdmAAb+JUCzqSjM31lBDytvxXtDIHXfto421Lq9MsujaXKrmGn1CYu+1
         nmw3suxfm6IPTOsm+XpE2wg/g9VQ9AbFTBSQ0rDVhlQgK/1345MbUnngaPe4cFVMhm0N
         bTg93ozM0AdZNN1REC53/jqqN3aFqtSJrbxIXaCNwbD+KNqx/7HwZL0YO9UriIhumK5w
         C6IkkVKzOqMRd+0h6fWFhDiBNaJLyPJQIxgF3NMSNAjBodiEzXJMmgmI0lbv5zFfjXxZ
         aUkIzFqfGpLqFwh0apV1drVMUAvLgdeFCpPFsJ/R7NsiB/HnCMKA417EP8E+OLj+beLJ
         AXAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=l50atMCuK0a/t6+OSsjycsY+3SVS0yqhWVsTT+GbMRY=;
        fh=+M2lTtOLhYH52pAT7ApTUazaJ+QWK7MG45Sbhj6ZNXM=;
        b=bmWZ81wwpKwE1nSX1eaGkACXGlfe3qiUzBC/d8MuCrUp+Wqsfjam2LkVXtZTkjxPT6
         +rII9CXfA+GEctZtOb8i7d3lVY0BwylVPwInwiKMvRZeV2Mk+j9uxyddhS0DmsR3M1ZG
         YQPep0YTmRQV609f+XABzoecWS4TKIx++FM+rjC6jU2e0XAx5BltNOmVyTo7G3Alccny
         C9kt8MFMAdHjuC9gy4+BdaMQm4qDsLONQjbJTX8Hhffot1rNv8p3010IstdNLcVwhaMW
         6Emu1dtpk++To3lGZEBsx5aMLnTwzWce87bpglwOzgnTiqDJlFMy/I9O2QstH6Q21kiv
         XpNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hodh21gH;
       spf=pass (google.com: domain of sebott@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=sebott@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <sebott@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e7303ed4d6csi10158029276.509.2025.04.29.09.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 09:27:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of sebott@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hodh21gH;
       spf=pass (google.com: domain of sebott@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=sebott@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745944034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l50atMCuK0a/t6+OSsjycsY+3SVS0yqhWVsTT+GbMRY=;
	b=hodh21gHXwz0/EQmvEK6feMN9jSKcRW9hDEVgxTjTSTmjOR/hnf4T40Rgi4s5QBXAkzz7U
	tSvNt5HgeOepS5tcgy/1FKR80p+H2xy8tSOt4eAKIng/XUndojuwSyDUCXIpg5E8ipeGto
	Kjf8CXARCI/m84+vKV1CqRhWB4+HmAI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-oNhl9dLAMS24EXNgusH46w-1; Tue, 29 Apr 2025 12:27:12 -0400
X-MC-Unique: oNhl9dLAMS24EXNgusH46w-1
X-Mimecast-MFC-AGG-ID: oNhl9dLAMS24EXNgusH46w_1745944031
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so35363595e9.2
        for <alex.bennee@linaro.org>; Tue, 29 Apr 2025 09:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944031; x=1746548831;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l50atMCuK0a/t6+OSsjycsY+3SVS0yqhWVsTT+GbMRY=;
        b=h4bjTd5S9370vOFVGq7gMg4j0n+hBvic2etyej9iocS2llkgCLIrGigYj9T4hAEPZk
         JKTw5OWH7WJxs1XVmXfOSYGOHkPOKmea62oqY5HdBBNoxiSwaqAMpBP1T4jiOssHIgFL
         cjlXkF1PDgz+DuOvjr/ZYNVioEHbxfRQqF3ZK52EU4UnBDbmWv7q/O3zrsfe4u5P27Bw
         S1Im2DMiOf92lFBMKGxfCDPmGEdw234oUELj8UQqzOFv1yb2Kx5/43pQU/rXuG4mhBNB
         eFcH+zwB+6KwNMCM8rwbJOIYcSaOe2lTQye0K4lgvpuLgIPKmYV1+ITV5oNzq7ymQwb5
         rOWg==
X-Forwarded-Encrypted: i=1; AJvYcCUcooLbQqcEajIoUNXpeFoci5S04TchKp8B5dE8FcTy0q8FnPDUVXIeCYfJ+PZsk4NZCukmE8nYNxSFQA==@linaro.org
X-Gm-Message-State: AOJu0Yw3UT2+piVeg8dlL5dYY5e7hQd72z9zs2UkVIq88yv4OJC857k/
	SC7OPj+pPnY1A6iOe4vLt5GkEO04P2m63CjV3bTP5dswRB6MGNFyFLdaT/lKLvbLlLpCQFHBqIJ
	CXS4GianN3qQHi0HCUte7ECgnLGigf01ibQqyYPhC+wML8LWcpRdysA==
X-Gm-Gg: ASbGncvhI3fX1C6iDIRRO7Xkvm98MT4e6LF7vVSjJk7vKG3vZHtdRke/WFF8O1K2hWt
	j9CDeWeiBVMuUIyGhvkIBmRZgG/wQIqg+H5h4UW6AXIoKPmj5lFevH+q4dsjNaNIxwe967Sbtg9
	/mgEbCFV2oAwlikS9T/ZaRuheXaRAqXrUJQtPy6CsF6SVFi11725//Yfptjib7K5FSW9J987Nng
	MabC0f7jMR+ejTEEne9WVEJdHMXCH3S1bBYpBMS9DloNKREfv+qBoqr1RNwwBJTmQpbNLwbKlRS
	JnD08NMSeK5c+MDL0Fe5++KXr995xokEhsS2gWaKmbd2XMc4YyXn5lPN0p9k
X-Received: by 2002:a05:600c:4f8f:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-440ab7aececmr117307605e9.8.1745944031424;
        Tue, 29 Apr 2025 09:27:11 -0700 (PDT)
X-Received: by 2002:a05:600c:4f8f:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-440ab7aececmr117307275e9.8.1745944031090;
        Tue, 29 Apr 2025 09:27:11 -0700 (PDT)
Return-Path: <sebott@redhat.com>
Received: from rh (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a53044b3sm160787565e9.15.2025.04.29.09.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 09:27:10 -0700 (PDT)
Date: Tue, 29 Apr 2025 18:27:09 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
    qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org, 
    richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org, 
    oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com, 
    armbru@redhat.com, berrange@redhat.com, abologna@redhat.com, 
    jdenemar@redhat.com, agraf@csgraf.de, shahuang@redhat.com, 
    mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 05/10] arm/cpu: accessors for writable id registers
In-Reply-To: <20250414163849.321857-6-cohuck@redhat.com>
Message-ID: <bebefcad-d9db-a2b7-ab69-8eed34b9e63d@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com> <20250414163849.321857-6-cohuck@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iYfNpD5AQMLoaquFI-GxUFd3uWIRVAX2Mjc6lZgiGu4_1745944031
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-TUID: 4Vl98dUZBtua

On Mon, 14 Apr 2025, Cornelia Huck wrote:
> Also add conversion between the different indices.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> target/arm/cpu.h | 18 ++++++++++++++++++
> 1 file changed, 18 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index bbee7ff2414a..775a8aebc5d3 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -876,6 +876,13 @@ typedef struct IdRegMap {
>     uint64_t regs[NR_ID_REGS];
> } IdRegMap;
>
> +#define ARM_FEATURE_ID_RANGE_IDX(op0, op1, crn, crm, op2)               \
> +        ({                                                              \
> +                __u64 __op1 = (op1) & 3;                                \
> +                __op1 -= (__op1 == 3);                                  \
> +                (__op1 << 6 | ((crm) & 7) << 3 | (op2));                \
> +        })
> +
> /* REG is ID_XXX */
> #define FIELD_DP64_IDREG(ISAR, REG, FIELD, VALUE)                       \
>     ({                                                                  \
> @@ -923,6 +930,17 @@ typedef struct IdRegMap {
>         i_->idregs[REG ## _EL1_IDX];                                    \
>     })
>
> +#define GET_IDREG_WRITABLE(MAP, REG)                                  \
> +    ({                                                                \
> +    const IdRegMap *m_ = (MAP);                                       \
> +    int index = ARM_FEATURE_ID_RANGE_IDX((sysreg >> 14) & 0x0000c000, \
> +                                         (sysreg >> 11) & 0x00003800, \
> +                                         (sysreg >> 7) & 0x00000780,  \
> +                                         (sysreg >> 3) & 0x00000078,  \
> +                                         sysreg & 0x00000007);        \
> +    m_->regs[index];                                                  \
> +    })
> +

s/sysreg/REG/

Also GET_IDREG_WRITABLE doesn't seem to be used in this series.

Sebastian
