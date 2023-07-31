Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2215872ejb;
        Mon, 31 Jul 2023 07:31:54 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGYk5OjbBDj+rEM6/rO+K66Llqch8I0n0TliYh3C14Pw1EHWZXKRPd4IRI8IRT82wKzEGz7
X-Received: by 2002:a05:6808:2a59:b0:3a7:17b6:3501 with SMTP id fa25-20020a0568082a5900b003a717b63501mr6051347oib.23.1690813914643;
        Mon, 31 Jul 2023 07:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690813914; cv=none;
        d=google.com; s=arc-20160816;
        b=tyWHySwVpCROq0q3m/vjHZt/DmNwkZdjOvH9YxOaNHVEufMiAtMs1sL1afVAl8Zaz0
         brcPy7L+yNvjsrpwUzcun9u6hC4Gxp0k3Iso3UcQDKQGecDJhMoe5bLR5PWUmVrtd6zv
         ADp9U0bEZkRXHIXyXpsl26SAnxsUW0owngWFfyQALrCus3oq5ZGkzXtspl3wrn7zkREB
         O2l7n/WyVhuNOWqeP8pVjI7ae5niM5NQt1d1RNf0tvlck0lKy4x0/doaheAr+N4ynUYl
         s2ZKb/RRasIirWvKhfFifWWZbkj6r6Vo31fxxGrV0+DRYgwSXs8AEm0iiuDU5Ag4nm37
         HEXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3HySA3W+K1+tfTye0CohDBSCFD3dSPCVOaxmgIA/hsE=;
        fh=yiPsqyf7KBOryhDtE6f2DyvFmbOCnAEEkILwtbwiaqg=;
        b=rU62jk1db5yZnMffeoXnCBnBYhEK6W/NSqIbPvZLvjE6hFQ+1iQwamu1UxO8zzwPRy
         YVaRkta19wffqumr/hrEmruAt+hq0OLm91JdIM0DIKFShhd+qyFYtjsjduaq61yNPn7l
         uFe8GrtjSBN5r0FHvU6X2BITdr83i63qlkqMFcSdb0NECr/bKBYiKyIp0WuSbA0LSnsk
         MQJP1mxkvV73bJMyEsftgM8YWHYE+ORIvep6Dk6lC/5vV2kpUMhxZNhc1R8doMt7Tqog
         Rd46MyvXIkscKG8rUhFonaU6qjNQpJeFViZqNCy13YHVSh15BN4j6v9Fp7fne0lz4e07
         ZClw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AzZo+uKt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12-20020a05620a448c00b007608c82b593si2317231qkp.215.2023.07.31.07.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 07:31:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AzZo+uKt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQTvY-0008Rx-Da; Mon, 31 Jul 2023 10:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQTvW-0008Re-Qn
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 10:31:14 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qQTvV-0002Eb-73
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 10:31:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-31763b2c5a4so4758345f8f.3
 for <qemu-arm@nongnu.org>; Mon, 31 Jul 2023 07:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690813871; x=1691418671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3HySA3W+K1+tfTye0CohDBSCFD3dSPCVOaxmgIA/hsE=;
 b=AzZo+uKtrjQ0CXM+n0MEdKhLSCOFQggQ5amnEedqOAa9PAKPO+EW+xzBWFgaY7D+Lz
 xIKecPSUjNBqcgONGfoaH5ZykEzXARDDzvgbmlP2JrbYmYy7F6ifiC4e27EgbrgUikC4
 isuT84K9koWUsNqzULZKfY75j/juah3+nkKY2F8OejEZUwdwTz0zW8jPfhyFNiFKeUvy
 DQ92gjnmmMUroo0WJjBGNPZ4CGswuISvQdv4U8edGkCd1n5nNVka7qtGHyrV89QjtKvQ
 AbJ5qQTY1gtrUzepFh1WFjlLWVWN7lz96Dxc6oNbGswI4D/cmW0BNth2eI97IxH81d66
 xMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690813871; x=1691418671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3HySA3W+K1+tfTye0CohDBSCFD3dSPCVOaxmgIA/hsE=;
 b=DCvJHL9DL1rhGg68pYmLWPnp9o/ZUV3VRMmxhkzMxWUf/RyddtaV99YwrT1Df4fd3M
 f5JDtc8DuGob5Ky9I19j8Jt2YPhq7sn+ysRjAD5KcT/ZNUN9qIVPY4JH//b8E7CeXEji
 G24PEiE2SiIiPUPbwxx36Hprhy04XShIdLvvoY3O9Kk88vQsH/6dzWnW0aBigg8UdkJ9
 pX0lrKtLTMY3za/jSm15HxBQarDrlFcmx/gUdtia4fiulTax2bCi945Xnl0HlMMF4mGr
 93wshm/b2HRecWPzk+7sXM/XFqot5uw5NUNicKDlgJPGxyZisYQ+WGsB+2KbraOvHACm
 p27w==
X-Gm-Message-State: ABy/qLaU3CA7VnPGPOIiFh3DnQRYI6Fh7++3dZ3ODiCRltEVMBKZ6LYY
 VWjK30na3xZuAz0oJIsqmPVHFw==
X-Received: by 2002:adf:e98e:0:b0:317:5c82:10c2 with SMTP id
 h14-20020adfe98e000000b003175c8210c2mr9258242wrm.59.1690813871265; 
 Mon, 31 Jul 2023 07:31:11 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.198.42])
 by smtp.gmail.com with ESMTPSA id
 l11-20020adfe9cb000000b00314329f7d8asm13256202wrn.29.2023.07.31.07.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 07:31:10 -0700 (PDT)
Message-ID: <95b7fe87-0a0d-7182-7706-e119769d4d59@linaro.org>
Date: Mon, 31 Jul 2023 16:31:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/5] Refactor i.MX6UL processor code
Content-Language: en-US
To: Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
References: <cover.1690663106.git.jcd@tribudubois.net>
 <6795fbc55daf5bdf196bf98f1ff8ac1891fe5a1e.1690663106.git.jcd@tribudubois.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6795fbc55daf5bdf196bf98f1ff8ac1891fe5a1e.1690663106.git.jcd@tribudubois.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.101,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: /UTkBHkv1EAc

Hi Jean-Christophe,

On 29/7/23 23:17, Jean-Christophe Dubois wrote:
> * Add Addr and size definition for all i.MX6UL devices in i.MX6UL header file.
> * Use those newly defined named constants whenever possible.
> * Standardize the way we init a familly of unimplemented devices
>    - SAI
>    - PWM (add missing PWM instances)
>    - CAN
> * Add/rework few comments
> 
> Signed-off-by: Jean-Christophe Dubois <jcd@tribudubois.net>
> ---
>   hw/arm/fsl-imx6ul.c         | 149 ++++++++++++++++++++++++------------
>   include/hw/arm/fsl-imx6ul.h | 149 +++++++++++++++++++++++++++++++++---
>   2 files changed, 239 insertions(+), 59 deletions(-)


>   enum FslIMX6ULMemoryMap {
>       FSL_IMX6UL_MMDC_ADDR            = 0x80000000,
> -    FSL_IMX6UL_MMDC_SIZE            = 2 * 1024 * 1024 * 1024UL,
> +    FSL_IMX6UL_MMDC_SIZE            = (2 * 1024 * 1024 * 1024UL),
>   
>       FSL_IMX6UL_QSPI1_MEM_ADDR       = 0x60000000,
> +    FSL_IMX6UL_QSPI1_MEM_SIZE       = (256 * 1024 * 1024UL),
> +
>       FSL_IMX6UL_EIM_ALIAS_ADDR       = 0x58000000,
> +    FSL_IMX6UL_EIM_ALIAS_SIZE       = (128 * 1024 * 1024UL),
> +
>       FSL_IMX6UL_EIM_CS_ADDR          = 0x50000000,
> +    FSL_IMX6UL_EIM_CS_SIZE          = (128 * 1024 * 1024UL),
> +
>       FSL_IMX6UL_AES_ENCRYPT_ADDR     = 0x10000000,
> +    FSL_IMX6UL_AES_ENCRYPT_SIZE     = (1024 * 1024UL),
> +
>       FSL_IMX6UL_QSPI1_RX_ADDR        = 0x0C000000,
> +    FSL_IMX6UL_QSPI1_RX_SIZE        = (32 * 1024 * 1024UL),

Please use the KiB / MiB definitions from "qemu/units.h" (the
resulting code is easier to read. No need for parenthesis.
