Received: by 2002:a17:505:6015:b0:1be9:327d:8ee3 with SMTP id us21csp300487njc;
        Thu, 5 Jun 2025 07:47:38 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUS1ILx4YENmt2oInpCqycNbBThGW5qCBLx3fAnYMV4Zp93sgxDZ4m0N2SJwE2LRwOc2jyZufXjoOgYeQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGncV3lMoPJFNoSnpB1mGl0QayCwauSfjkr0J2HR5mMweEi6NvZ1IrYql3YmCPeSrFUjHij
X-Received: by 2002:a05:6122:2a06:b0:520:64ea:c479 with SMTP id 71dfb90a1353d-530c738fb3cmr5844109e0c.10.1749134858381;
        Thu, 05 Jun 2025 07:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749134858; cv=none;
        d=google.com; s=arc-20240605;
        b=MQrZttDWqnUNUxwGfbAGywVVmPie9SuNIOSNz+TBuo6LxRLk9qj6QeLLDysgvuFzdn
         /H5MIBM/fIadCZWkKm08+0ZNP/bE82CuI/KyHrGxKuyYdFjauyhnDWR5LO7yDdBphZAB
         GAdPEXY8lEDNQbq9R31haBMp0ySAQZAtQE1bH5+kja2ry8FgcBERV0tTZqGhHTDw2Dvc
         H5C6wHkzSax8WXnO4+AoyrjytWHm+6diRrPiJzC0UN0q44TYZahbZxQ8qalKFzSsT6wu
         lBKdbg1dHxgSUMhFSNfafJVEDoIwAAI+8z2D/QPtvgAUwB6YDoE4xqcXPo7OZn5HMeQu
         hUmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=yPYCLM8pAN7C74E4v3iESVSdHeZjLAEBg/qIHEQDtBc=;
        fh=nQTRk4IWvEfal7zAzPxgBBi6lQXClRpuEoh98t3ecOA=;
        b=CKdXyjirm7+6NNFBbeqpSlFYibqMroijV7zx/xkaSS061q2AjoOf2lkfBIvlyIB50v
         KTSXGVGk1IeN3lc9QjqUNWsYZjFm2FroJBxfAHMkIqVddevtAijeoCnI42FQ3DmRx1Rz
         uUml5lwDllU/Xjk1nCGFdbbJFOHF6E6PgcKk5Cos3wyBABrjGXgieFgYHfXUXXLBvlq2
         47R5dHkPGsZuGaIBX1xU8ITjGEgd9RAPqcpfcNf52UtMqOiTL3oCl15sCyA8mssc3Ui4
         Rp8g4UXAEHDo5BS3qp4nZOCe5/00Y8drDsabyn5iGA8rttBbTCsC/n//C+qJSPMbZC/K
         x+CQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y5wELfpQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4e64e9e5a1csi5812269137.227.2025.06.05.07.47.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Jun 2025 07:47:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Y5wELfpQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uNBsC-0005Z8-0z; Thu, 05 Jun 2025 10:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uNBsA-0005Yr-DU
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 10:47:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uNBs8-0000dD-Qi
 for qemu-arm@nongnu.org; Thu, 05 Jun 2025 10:47:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1749134831;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yPYCLM8pAN7C74E4v3iESVSdHeZjLAEBg/qIHEQDtBc=;
 b=Y5wELfpQg3qHJCUN7pENQ+lYGLuFzII1lEeKIyMPMrTbhgNPAauDoP1Rt05/mxYWPUN3P4
 dYrrN+ncKQ1sX9hafR9OF6R+XDre2pWRpBeazVVYzwHpqY9GQ8NlvAlnXWQyuvPDlzoRWS
 YpLHsH4XmS6MGPuWhZHssNDt2x9RBBQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-S_16vW_5PJiLxHamrZ4f9w-1; Thu, 05 Jun 2025 10:47:10 -0400
X-MC-Unique: S_16vW_5PJiLxHamrZ4f9w-1
X-Mimecast-MFC-AGG-ID: S_16vW_5PJiLxHamrZ4f9w_1749134829
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43eea5a5d80so5038255e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Jun 2025 07:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749134829; x=1749739629;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yPYCLM8pAN7C74E4v3iESVSdHeZjLAEBg/qIHEQDtBc=;
 b=L9DiUE7TVhDb7ofaerLqkVayvTV+I7zoGfxL8F6wOTnUmFziPORdiMhahatJHlZvDB
 5KoShctupg91+Nh3SSEgBPiTq7ZIXu/AY7+Gh7MwC9j/KbtKMjFDaesBLl/llIne0y8R
 A78peWXS83Uz5HvPl3kBN7HmQC/0vGszzJb+uRwvK+pJ83OXqLeTFvHNOs4mPPWDAzPF
 Gt6WRtfMxvEEMfiNX26auvczxoM8aDrPQ//iS5vpzaVIrYIfWsnUv/55B6lF28W8VKSw
 jibpLLfC3etzGr5jcfkTnI1VeYZDFpJAJv+MLT3uQR9Oap2DrM9lFC3RHE4a6U0AsTHd
 D2bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlH2RQvWcg8wbu150AMO2FeaYUbAhWKzAV6hH9Al4wd50+H7uvt55UzRkcrnV8tZ+nQe4gpq5T9A==@nongnu.org
X-Gm-Message-State: AOJu0YzWkyspVbXUOm+12j36nM9es310B9gPrYyYznGXnY0NhT9/2ZMV
 ZjpllNWAvwT7BIu/HBvhIS+cZPqa5AQaWNAi/PeIO1nrnK2P8kRgNjZFd1MU8NVUEhtF70BEQHS
 vtKZYOBEN7hRilThhxbJ2c3sUEJ8JznA+9OdkI6g1phG5QQrL/ZkJZw==
X-Gm-Gg: ASbGncuxrxzyvlcr0Laq7Lnfmv8Jj82+WH+r7Je3GNysJ4BDR2tRNPkiDUyj7U8cB+j
 QNNTzYNUiEfXKEtLAQmmGaP7xToYd3d4FBZkRjO0TealAIC5fI4cd1D/3wF6iFQMhGpE2eyT/Dy
 OMWzU+ivAwEPxtTO3PvcKwk42uVwExFnCQtD6AWokKH7htFoBo4WxEWvQG/zRx4NH+HJnNxYF58
 WNCmSEkHegz6nkek37sDsLfewU7hkD02WezZahmlSV68d1WeQ2YaxsWIOC53EXnWRTEMcitzooU
 mANiqABHpgjS+NdODAx7gguNOQ5nVZbVBKTsxCluB9iCszBNItkD6apK2os=
X-Received: by 2002:a5d:5f85:0:b0:3a4:f90c:31e3 with SMTP id
 ffacd0b85a97d-3a51d961747mr5500376f8f.31.1749134828732; 
 Thu, 05 Jun 2025 07:47:08 -0700 (PDT)
X-Received: by 2002:a5d:5f85:0:b0:3a4:f90c:31e3 with SMTP id
 ffacd0b85a97d-3a51d961747mr5500348f8f.31.1749134828334; 
 Thu, 05 Jun 2025 07:47:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-451f99196efsm27015635e9.28.2025.06.05.07.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 07:47:07 -0700 (PDT)
Message-ID: <ac3db5f0-d3e9-4c8a-ba8c-1c691d99ec99@redhat.com>
Date: Thu, 5 Jun 2025 16:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/smmuv3: Fix incorrect reserved mask for SMMU CR0
 register
To: taotang2025@gmail.com, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20250605022640.598308-1-taotang2025@gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250605022640.598308-1-taotang2025@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aazwbr-yN9FUVXb4MaVxCwKJCNLvlYetG8Lhkzorbl8_1749134829
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.132,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: aglc/c9JJFpi

Hi,

On 6/5/25 4:26 AM, taotang2025@gmail.com wrote:
> From: Tao Tang <taotang2025@gmail.com>
>
> The current definition of the SMMU_CR0_RESERVED mask is incorrect.
> It mistakenly treats bit 10 (DPT_WALK_EN) as a reserved bit while
> treating bit 9 (RES0) as an implemented bit.
>
> According to the SMMU architecture specification, the layout for CR0 is:
> | 31:11| RES0           |
> | 10   | DPT_WALK_EN    |
> | 9    | RES0           |
> | 8:6  | VMW            |
> | 5    | RES0           |
> | 4    | ATSCHK         |
> | 3    | CMDQEN         |
> | 2    | EVENTQEN       |
> | 1    | PRIQEN         |
> | 0    | SMMUEN         |
>
> Signed-off-by: Tao Tang <taotang2025@gmail.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks!

Eric

> ---
>  hw/arm/smmuv3-internal.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index b6b7399347..42ac77e654 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -120,7 +120,7 @@ REG32(CR0,                 0x20)
>      FIELD(CR0, EVENTQEN,      2, 1)
>      FIELD(CR0, CMDQEN,        3, 1)
>  
> -#define SMMU_CR0_RESERVED 0xFFFFFC20
> +#define SMMU_CR0_RESERVED 0xFFFFFA20
>  
>  REG32(CR0ACK,              0x24)
>  REG32(CR1,                 0x28)

