Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp32519eje;
        Tue, 13 Feb 2024 02:12:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUovHfH9g5rByZ5jMMfWHsAhwEzoxVkpj/eefdtVmWAZ1qVIXSwv/6HSzw19McKAOXlkggGC8vffQHiDggA8Ji3/WyOnG7r
X-Google-Smtp-Source: AGHT+IEIbkBoMw9w6MmnHLktejnZ95asN164BFmm63b/sqBuozEeB6eWbCE3QwTCc2aSnCHIPo1k
X-Received: by 2002:a0c:dd06:0:b0:68c:ab0f:910 with SMTP id u6-20020a0cdd06000000b0068cab0f0910mr8908436qvk.55.1707819139226;
        Tue, 13 Feb 2024 02:12:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707819139; cv=none;
        d=google.com; s=arc-20160816;
        b=GGaQLYllr2PAbhQgYad8S8ciEghvtJU5kqonYsUerhCDoSd5MCzGJnD4NwymzAFGZ9
         NkyFThzJD1lvacLx/awDsc8Vt2yXH++xu35Q2V8PqARqb8DSijhSdtPb+1C+32K1cF1o
         1o9E3e5B5usaNIv0gdwgHI+s7yZHRdvx1nfIT/GfVmSwD+SJjS/qBKibjornkbgUmE6A
         zYcYwniuUuGPX0wVJ9L1MHC4uY2lML9lN0DL3H6VuFETZ72WM2GTikAQgHXS3JeBk0is
         tYMeWKlsTbU1oKwogGaDwHBg8ll6XM3OPSOVKdKB4imjm6oCNSA2MoE/6ANSMFqLfFuD
         0ocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=htnnSTLoM7N/Ufhhy3JyZXlXtlk0RMVbMMfrtQIZwvE=;
        fh=wIhHT+hEwGgjXwezOVNxLRWY1TKGIbnBO8ABNeUAK2g=;
        b=XeaoowtQGRVnYv5hkewACsZPeHj9dMcecmy4omFhobZUMD8BkD7zURth1J8WeDZYn9
         BWepMQb7LEw91NFcfFEP27Slqy5uBkLtNEjvjYRWIHUfe801qNXjHzpae852hgT96BSl
         rVJurLD9krh3TECU4wXdEhZwcfsZQRw7HB5yfbEqEjw29lbhSvEroAlJl3WQ67tEkIam
         2l+ilwE4bHtkDJ421gX1aLs5P7e8OPSNcTGc8cU9KafL3LuAXowwYWxfoCZpwrtirYJg
         K3qBC6PghmxaYpi1XZjLCXJsLVBBFEf/Wq/K7yJD48ONR/7B3v/uCaeW9TDMKYPc7bfF
         VewQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=F462h7Od;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
X-Forwarded-Encrypted: i=1; AJvYcCWmb4fzppj+AwpwnNLJnxP9TorAoN9nImrAkIhmEvWx8MiqSttws8kUbXlU9OcWMsl95YPOA+04jVcWNnmXiwvPbnCaJeDK
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj26-20020a056214529a00b0068cb700a2efsi2466403qvb.497.2024.02.13.02.12.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 02:12:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=F462h7Od;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZplq-0004Ld-SC; Tue, 13 Feb 2024 05:12:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1rZplp-0004L7-EY
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 05:12:09 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1rZpln-0005sJ-Hk
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 05:12:09 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-410cf70a057so34185e9.0
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 02:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1707819125; x=1708423925; darn=nongnu.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=htnnSTLoM7N/Ufhhy3JyZXlXtlk0RMVbMMfrtQIZwvE=;
 b=F462h7OdVuPI4S9nR6PWxHGmgIzAF042kk/t/n00m1aeWRIDfeyrioj8lMmPDX0Gcq
 ZvjgXEfbWf+mKiRa0OOFlzbzmbAvXfsa3xls1MGYEMBpdNaPsXVQzs/op9Gsd0hT0YMd
 HJV9INSB/mcLLzFMA92qQhwstycNo4Q/cyWv3JBXWRkNoV3hP0ic68+RQtIVosj7mAli
 ysclMPtYLttmrwfEcL8H0wrCNW83zjv8F5s7xNZ9n9wZqhrY3y0vfOCeOtdkYbGRT5aK
 SuF8+r848HpJN6FojZCQZ3J5QOYfRmlEXzFJOf2KcTdPwFp4gWlBVUsvJJoQVVVTCaE0
 t9Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707819125; x=1708423925;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=htnnSTLoM7N/Ufhhy3JyZXlXtlk0RMVbMMfrtQIZwvE=;
 b=QKvASQkEo4q6xn2Fqt7HUdTvPioghtrakwnqptpQ4GsGltNG7sGfWW8FaCI/GBjw3C
 d7WO/8xc+hr5JS5wOAz+YOR3R5rvb+tAfTvbQJXLASgzWapHfLn2kzfzsDE2E7sEhMUs
 vDI8JfMYf78Cid9oXI+2s/3MnOd/2dRss1dl3GD8OYUAyu4K1cuuV0i4foERzRqnfXzk
 QYwjOUAjNs9ivb8/uVBz1oPH6x6BhIcWsdXRbKDr7g2/hLg/IxMrm8WDlher5miir8cf
 HlwJBqskO1H/+5EN3lN8gGPdNzHNgxr66jucSsETIMZepd5WPLD1f7wpLuQQBuTzFRgj
 4lLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVloW+UTfj9D0qOWghrq09nBbEb7sUSlDLyfeXhW4QCRUOfoDOjrowQbKz2GRW7O46IFdjB5B82ub0s8FTeea5gz53j
X-Gm-Message-State: AOJu0YypUgg6DQ/MPUhCeDXFUNI0wWhmnbOKdj8l/GRW+P9vHeEUaTr1
 J6NlgD71rtxkMhlp7oLyoA8tWcX39ROebxViWfpB1AnQSe1vn3oaCygKZXmb4g==
X-Received: by 2002:a05:600c:34c4:b0:410:c55a:e75f with SMTP id
 d4-20020a05600c34c400b00410c55ae75fmr72576wmq.1.1707819125275; 
 Tue, 13 Feb 2024 02:12:05 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWZhxLt5giJzvVa1GChlN1wGVkARBElajrFkkePYA1/4/pWuaNvrKej7GRPVAAAW3fj751Q8AEUURNHjxcbX3LbgUvViG/mnxNBXuukncZtFfr+oRnnSbrCtKrV48Hsq5s/8BfCy0yJpNOlrjFS5+8Tq6SqkWW5r91ewdiLqStBR/XzMn2Sk6rGW1bsMt1GyFs=
Received: from google.com (185.83.140.34.bc.googleusercontent.com.
 [34.140.83.185]) by smtp.gmail.com with ESMTPSA id
 v5-20020a5d59c5000000b0033b8305ffe2sm4605707wry.87.2024.02.13.02.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 02:12:04 -0800 (PST)
Date: Tue, 13 Feb 2024 10:12:01 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>
Subject: Re: [PATCH v2] hw/arm/smmuv3: add support for stage 1 access fault
Message-ID: <ZctAcd2fo85g_GMK@google.com>
References: <20240213082211.3330400-1-luc.michel@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240213082211.3330400-1-luc.michel@amd.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, FSL_HELO_FAKE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wlQleQE5oEEi

Hi Luc,

On Tue, Feb 13, 2024 at 09:22:11AM +0100, Luc Michel wrote:
> An access fault is raised when the Access Flag is not set in the
> looked-up PTE and the AFFD field is not set in the corresponding context
> descriptor. This was already implemented for stage 2. Implement it for
> stage 1 as well.
> 

I noticed the same thing when writing PTW for stage-2, I don’t think there is
any reason this is not supported for stage-1, as SMMUv3.0-HTTU* are not
supported any SW broken will be due to an existing SW bug.

Reviewed-by: Mostafa Saleh <smostafa@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>


> Signed-off-by: Luc Michel <luc.michel@amd.com>
> ---
> 
> v2: drop erroneous submodule modification
> 
> ---
> 
>  hw/arm/smmuv3-internal.h     |  1 +
>  include/hw/arm/smmu-common.h |  1 +
>  hw/arm/smmu-common.c         | 10 ++++++++++
>  hw/arm/smmuv3.c              |  1 +
>  4 files changed, 13 insertions(+)
> 
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index e987bc4686b..e4dd11e1e62 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -622,10 +622,11 @@ static inline int pa_range(STE *ste)
>  #define CD_TSZ(x, sel)   extract32((x)->word[0], (16 * (sel)) + 0, 6)
>  #define CD_TG(x, sel)    extract32((x)->word[0], (16 * (sel)) + 6, 2)
>  #define CD_EPD(x, sel)   extract32((x)->word[0], (16 * (sel)) + 14, 1)
>  #define CD_ENDI(x)       extract32((x)->word[0], 15, 1)
>  #define CD_IPS(x)        extract32((x)->word[1], 0 , 3)
> +#define CD_AFFD(x)       extract32((x)->word[1], 3 , 1)
>  #define CD_TBI(x)        extract32((x)->word[1], 6 , 2)
>  #define CD_HD(x)         extract32((x)->word[1], 10 , 1)
>  #define CD_HA(x)         extract32((x)->word[1], 11 , 1)
>  #define CD_S(x)          extract32((x)->word[1], 12, 1)
>  #define CD_R(x)          extract32((x)->word[1], 13, 1)
> diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> index fd8d772da11..5ec2e6c1a43 100644
> --- a/include/hw/arm/smmu-common.h
> +++ b/include/hw/arm/smmu-common.h
> @@ -90,10 +90,11 @@ typedef struct SMMUTransCfg {
>      /* Shared fields between stage-1 and stage-2. */
>      int stage;                 /* translation stage */
>      bool disabled;             /* smmu is disabled */
>      bool bypassed;             /* translation is bypassed */
>      bool aborted;              /* translation is aborted */
> +    bool affd;                 /* AF fault disable */
>      uint32_t iotlb_hits;       /* counts IOTLB hits */
>      uint32_t iotlb_misses;     /* counts IOTLB misses*/
>      /* Used by stage-1 only. */
>      bool aa64;                 /* arch64 or aarch32 translation table */
>      bool record_faults;        /* record fault events */
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 9a8ac45431a..09ff72e55f5 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -362,10 +362,20 @@ static int smmu_ptw_64_s1(SMMUTransCfg *cfg,
>                                          &block_size);
>              trace_smmu_ptw_block_pte(stage, level, baseaddr,
>                                       pte_addr, pte, iova, gpa,
>                                       block_size >> 20);
>          }
> +
> +        /*
> +         * If AFFD and PTE.AF are 0 => fault. (5.4. Context Descriptor)
> +         * An Access fault takes priority over a Permission fault.
> +         */
> +        if (!PTE_AF(pte) && !cfg->affd) {
> +            info->type = SMMU_PTW_ERR_ACCESS;
> +            goto error;
> +        }
> +
>          ap = PTE_AP(pte);
>          if (is_permission_fault(ap, perm)) {
>              info->type = SMMU_PTW_ERR_PERMISSION;
>              goto error;
>          }
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 68eeef3e1d4..c416b8c0030 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -682,10 +682,11 @@ static int decode_cd(SMMUTransCfg *cfg, CD *cd, SMMUEventInfo *event)
>  
>      cfg->oas = oas2bits(CD_IPS(cd));
>      cfg->oas = MIN(oas2bits(SMMU_IDR5_OAS), cfg->oas);
>      cfg->tbi = CD_TBI(cd);
>      cfg->asid = CD_ASID(cd);
> +    cfg->affd = CD_AFFD(cd);
>  
>      trace_smmuv3_decode_cd(cfg->oas);
>  
>      /* decode data dependent on TT */
>      for (i = 0; i <= 1; i++) {
> -- 
> 2.39.2

Thanks,
Mostafa
