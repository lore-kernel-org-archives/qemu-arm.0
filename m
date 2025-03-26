Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp3470291njc;
        Wed, 26 Mar 2025 10:19:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzSJ0TTXpPY2J/x22yoQDU2bIM9PTBll4HnN0+ZW9uvvuObbITqjFdd6MkCLS4JcV3Jv54i3+2O6RD3g==@linaro.org
X-Google-Smtp-Source: AGHT+IFuzHTgQp87V/kVnNIoWDgMDGm7LFfVJlzGlSNw/WmK64GDtnOmh9+8M05AqhDjH+Z5/mXf
X-Received: by 2002:a05:622a:4c8a:b0:472:133f:93ae with SMTP id d75a77b69052e-4776e1df032mr8099501cf.48.1743009562755;
        Wed, 26 Mar 2025 10:19:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743009562; cv=none;
        d=google.com; s=arc-20240605;
        b=hCvqgLZhU8i5iTxb4EsYC8raPR0jcfYMPxHE+CMO0dk1UeqkFt66fvnCGK/DCeSpxs
         l8PooC/SdJp70Ah6bUHp53iMoaXtq7LONBQaR2aiD87xB5QJ9Ky1fDXlhVxRHNZ5SDNt
         X6MwtosTTKg/2EvCIZlYBlcnGCgtaiyE7tTdgRa7UHWB4Y9OruxWzEZUDOu3kEI672LS
         8e9rGxCBsO4WweW+MEfEMz7j8IJtwBDxkyewS40bPIqwve2crvQiAaB6X+SBT6lHraMQ
         CRdYmZh0J4sjNZS2gKxa3wKlwwJymzAyNuftG2wsa3/HdG9ndTKNcG8mn/mMwfMiN0ve
         Hg0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7XQvP7jLQwf9arWb8bPTYpUe/xSLVt/wBVX3CSaM1Wc=;
        fh=DID8Q7vAaICFGZjd/oWhj/eusmp3Kxh0+YUkdD/P37s=;
        b=OjZAmTOo8zZNZgRUopejBs/yQcL4kwvxTlxOBNprlaZ98rkkFUuugN/TtygmSSiuvu
         WESYPXaU6G33Ao4upQQT+yPG0nKSXV32L8Hquv/Jh5BhXZTQD+62JGDPUlZiOoMtMyFY
         O1quh3XxgRiF1VRmpWPdbkYXnyeoFNHeT6wa7QAseqaQnnWLOSRO7GbBAIXiqjmgX1mJ
         80dZlxWGAV1Hu0n2fvjnZhfZCtq8wd78ur3PaanTvqXg8pCxiT4t3hPU+W8xNe3yeIup
         5PS8O4x9o6gCieo4mKF7osMvekWCkEAuvcF9jTloT3gHC9rYHegCqmtPf3thr5EjQHqx
         38Cw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CK8EuMh/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4775d798dd6si25986621cf.237.2025.03.26.10.19.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Mar 2025 10:19:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CK8EuMh/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1txUPB-0000Xe-FI; Wed, 26 Mar 2025 13:19:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txUP9-0000WR-68
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 13:19:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1txUP5-0002b4-DB
 for qemu-arm@nongnu.org; Wed, 26 Mar 2025 13:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743009537;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XQvP7jLQwf9arWb8bPTYpUe/xSLVt/wBVX3CSaM1Wc=;
 b=CK8EuMh/RT10Qf7qUD9Udrf7I/TFGP6hlTieA2+LRiV+NFilkKOUzNogABsd3ZpmjI43yQ
 PbAEkfsDwGqVKt/IQf7S1vZMyzj9VIZAzWVcrEeBIK98XtbYhUgItlaumhK+tYsBF3G1pf
 SU+eU4oDt1628bS4G8szL3SEuCLQISs=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-SJUbLLJoPdG_uAe3yHW8GQ-1; Wed, 26 Mar 2025 13:18:54 -0400
X-MC-Unique: SJUbLLJoPdG_uAe3yHW8GQ-1
X-Mimecast-MFC-AGG-ID: SJUbLLJoPdG_uAe3yHW8GQ_1743009533
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43935e09897so535125e9.1
 for <qemu-arm@nongnu.org>; Wed, 26 Mar 2025 10:18:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743009533; x=1743614333;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7XQvP7jLQwf9arWb8bPTYpUe/xSLVt/wBVX3CSaM1Wc=;
 b=h0YXwuwzr0VjS6UMadVTsOMkBhx0mrTkkUOcJTev8eRWEn46baO1HjQhg3zdMoNaT7
 S6yIMS0eNfwrjUT40AVDG7hdE3qsQzhGmNS2bT4bW6xSgqJqW/X8FAXi/DNiUDIKupPa
 UUnCLlXCSmlS3jkhMbGEkbj3ZCI1ZkHnnIokjdSz/Xs/a/s1D39rbUaZFi/O+nJk8FaJ
 jHsHJ+3dz63gT6GorA3RnxWp9vyKYbOgVQKuTPBaROAuhVQ0c9J8EihwScsoRS52T6Ec
 is79yjX8lBavBswim4wnJxVp6gI9Ffj51I+1UBEPkzIyku8AKTXz/sAdOIsa7xANLNKO
 /7dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZwZSLwrHpuRAAfSAHbXiD31sphrulIKQaT74BRUhnB+htjpO8vVQSa5QHX5udrp4UHgNNGvbxEg==@nongnu.org
X-Gm-Message-State: AOJu0Yxg5jLAZWsJ7+st1qi7U2/W74/LLu4LUb9+IyjKDp4e1ktlRgxb
 yAH1uIPyqNvQiLQf4gduI4IsmNle7WaLP+aWyMCiu8il953HH0QSje6WqeYird2952NTpgvxyQA
 pBb+LlO5/LC1dnFE+muZ0/FUHtA4k8lE+dBI7kPKBYEu5sQ0K9g==
X-Gm-Gg: ASbGncseVE4LbeLh3M7Pa0tc/I2YloaSZ4VYicF1QMuRxXoqoVyeFpB3IbaFTg/GNqM
 LtqVDXJ+EvzaaC991ay5SwCf9xhDUjDNMek+AzhKYo8V32ritUPcsmIbGXcSGc2er1Xe8/UglW6
 1VCXAeJZlSCqMG8tgkFU4u5xVj1UxUjp7H18/VJgvPuP7XnuBuWxm8hvDrS2rRdATwR3pfzpbGv
 v/6G3secOpp90RbIhk8nixQ2iA0CedQpx9gPGT9T0qC74tEHrWrno+6Xdou+n7k+jxoISoZ1YXO
 31Hwh73wK06NwlFRtkiOCdp8aBxXf2AgijHiCNR9yZjD7rE8ubRDBGI0PqhwvJk=
X-Received: by 2002:a05:600c:4f56:b0:43c:fe15:41c9 with SMTP id
 5b1f17b1804b1-43d84f94798mr2688975e9.9.1743009532623; 
 Wed, 26 Mar 2025 10:18:52 -0700 (PDT)
X-Received: by 2002:a05:600c:4f56:b0:43c:fe15:41c9 with SMTP id
 5b1f17b1804b1-43d84f94798mr2688675e9.9.1743009532124; 
 Wed, 26 Mar 2025 10:18:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39abfc2115asm11386319f8f.4.2025.03.26.10.18.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 10:18:51 -0700 (PDT)
Message-ID: <477323cb-12d3-484c-8ad9-61229ede3efe@redhat.com>
Date: Wed, 26 Mar 2025 18:18:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 17/20] hw/arm/smmuv3: Check idr registers for
 STE_S1CDMAX and STE_S1STALLD
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, linuxarm@huawei.com,
 wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
 jonathan.cameron@huawei.com, zhangfei.gao@linaro.org
References: <20250311141045.66620-1-shameerali.kolothum.thodi@huawei.com>
 <20250311141045.66620-18-shameerali.kolothum.thodi@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250311141045.66620-18-shameerali.kolothum.thodi@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fKYsFFMvoXEtccoWwni0IZMmV3A4NOZesNBkXjnNvfw_1743009533
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: D8fHS5of5bqk

Hi,

On 3/11/25 3:10 PM, Shameer Kolothum wrote:
> From: Nicolin Chen <nicolinc@nvidia.com>
>
> With nested translation, the underlying HW could support those two fields.
> Allow them according to the updated idr registers after the hw_info ioctl.
s/idr/IDR
>
> When substreams are enabled (S1CDMax != 0), S1DSS field determines
> the behavior of a transaction.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/smmuv3-internal.h |  1 +
>  hw/arm/smmuv3.c          | 15 +++++++++++++--
>  2 files changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index 546f8faac0..530284a9c0 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -612,6 +612,7 @@ static inline void smmuv3_accel_install_nested_ste(SMMUDevice *sdev, int sid)
>  
>  #define STE_S1FMT(x)       extract32((x)->word[0], 4 , 2)
>  #define STE_S1CDMAX(x)     extract32((x)->word[1], 27, 5)
> +#define STE_S1DSS(x)       extract32((x)->word[2], 0,  2)
>  #define STE_S1STALLD(x)    extract32((x)->word[2], 27, 1)
>  #define STE_EATS(x)        extract32((x)->word[2], 28, 2)
>  #define STE_STRW(x)        extract32((x)->word[2], 30, 2)
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index e0f225d0df..e8a6c50056 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -561,6 +561,16 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>  
>      decode_ste_config(cfg, config);
>  
> +      /* S1DSS.Terminate is same as Config.abort for default stream */

S1DSS. Termination

> +    if (STE_CFG_S1_ENABLED(config) && STE_S1DSS(ste) == 0) {
> +        cfg->aborted = true;
The spec says:
"
When substreams are enabled (STE.S1CDMax != 0), this field determines
the behavior of a transaction or
translation request that arrives without an associated substream:
"
So I understand you should also check STE.S1CDMax. Also how do we check
that the incoming transacrion arrives without a substream?

In general shouldn't we add the support of subtreams in the emulated
code too?

the spec also says that in that case you should record a
F_STREAM_DISABLED event.

> +    }
> +
> +    /* S1DSS.Bypass is same as Config.bypass for default stream */
S1DSS. Bypass
> +    if (STE_CFG_S1_ENABLED(config) && STE_S1DSS(ste) == 0x1) {
> +        cfg->bypassed = true;
> +    }
> +
>      if (cfg->aborted || cfg->bypassed) {
>          return 0;
>      }
> @@ -598,13 +608,14 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
>          }
>      }
>  
> -    if (STE_S1CDMAX(ste) != 0) {
> +    if (!FIELD_EX32(s->idr[1], IDR1, SSIDSIZE) && STE_S1CDMAX(ste) != 0) {
>          qemu_log_mask(LOG_UNIMP,
>                        "SMMUv3 does not support multiple context descriptors yet\n");
the log message should be different because it becomes a guest error:
qemu_log_mask(LOG_GUEST_ERROR, "invalid S1CDMAX as SSIDSIZE==0") or
something alike

>          goto bad_ste;
>      }
>  
> -    if (STE_S1STALLD(ste)) {
> +    /* STALL_MODEL being 0b01 means "stall is not supported" */
> +    if ((FIELD_EX32(s->idr[0], IDR0, STALL_MODEL) & 0x1) && STE_S1STALLD(ste)) {
>          qemu_log_mask(LOG_UNIMP,
>                        "SMMUv3 S1 stalling fault model not allowed yet\n");
same here.

Again I think we need to understand the consequence of having a more
comprehensive support of SSID. This also holds with old the IDR fields
that may be inherited from the HW and we don't support yet in the
emulation code

Thanks

Eric
>          goto bad_ste;

