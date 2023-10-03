Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1770787ejb;
        Mon, 2 Oct 2023 23:23:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWNR/U7zzM7tKcpazWEbtOAn7WB4dyLKidcg1Fegh1pUtZY1XSTnWDO792FnfSdZ/+JV8Z
X-Received: by 2002:a05:620a:4551:b0:76c:a673:5271 with SMTP id u17-20020a05620a455100b0076ca6735271mr19395454qkp.24.1696314222353;
        Mon, 02 Oct 2023 23:23:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696314222; cv=none;
        d=google.com; s=arc-20160816;
        b=sNP8z4Ps72dj0IwSYxsFqUZP5NvAroxqO2y0pchOjJO6+KuNY//L55CeZVJ72QTW//
         i61PyZZNMLCC3aLmnxA1yuznpMndJ5zSyvyaxLz58UI9/Yqn0jSQOgoN9jPz76F/u/Y9
         REdKVu2T2BBhcIBB+3aTWWyfFiJmiMMS3//MNYDmJ5p23kWbCZkW8/tlKqidXMPnKn4k
         p8UKbyjCTYENg+koA8sFYkd3X8USTCzajxv+VrOyG7+uN05ryJi3wQ/rS1jzz2+7TZzU
         p5JS0oIcGYUBfqyIDR0zzX8t124HMtf3JyKsbnGpPa9tQWMvCpXGF+FTRKLIRau1zVjJ
         I7Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=yNPCrajTh57Jjbi/jtn+1FxXShjLbKmdOEGxNykJkZQ=;
        fh=3DSafzGqh4PjVCLNt7uHMRJlad1iPnH4/WPCiw/w/9I=;
        b=f8vrb3m1hVSnSt0hiS3enCKNOXLi4URCiNalWe5lrPKsNHVBUdzdqMbVwaXCkQ9JNh
         W/l0CIE4ogE8gjY0okU/IPkSNoCNSA0S04NUm2tku9tDDCDNq+tiSDY8juJSoKG+TTsM
         GbmFWrGlKYflSBJtlOcAsHzjD3Gpj5UNxWVz0vqB0Lq0vF2F/Zzf680IbMRV3WXj71+V
         Q4iEFDEv18KtMBJ4/mib7J8/5IK4xr3MvCJWzNH9Or6ggJXdpSIF3ssNsMxyJNrgLmsE
         OSLgI21w1O8Nuv5yzzT5JLc0repPpDhORfhzGmFZ8cDJ01FTdhCr+OHLfD0d/jvaThWT
         ArPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UsqjcRbD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rr5-20020a05620a678500b0076da008f6ccsi236547qkn.288.2023.10.02.23.23.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Oct 2023 23:23:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UsqjcRbD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qnYoU-0005gU-A2; Tue, 03 Oct 2023 02:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnYoS-0005fe-1t
 for qemu-arm@nongnu.org; Tue, 03 Oct 2023 02:23:20 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qnYoQ-0000t1-H5
 for qemu-arm@nongnu.org; Tue, 03 Oct 2023 02:23:19 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4064876e8b8so5633025e9.0
 for <qemu-arm@nongnu.org>; Mon, 02 Oct 2023 23:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696314196; x=1696918996; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yNPCrajTh57Jjbi/jtn+1FxXShjLbKmdOEGxNykJkZQ=;
 b=UsqjcRbDvdclwTBrsbYs0fDhu2UJ7EG97WiVwr4eru7ic3UF6qRQlYpFuBtjNrKEgD
 Wt9fFhONLwY4h69bt/CniQO1dtM7rWIjELuhxa7tA1OTgpbcgiCXo1VwmdmFegGXV9ur
 csmxyz9CELXShmFJ7kGDzT5uugmLg/Bj8LK168vnmAMpCL6bIpI8oic16QD7Cmikbw0O
 WSNbyeAVuV3v4JGPg3xwwc3QJIYFPYwy9nZjjU8m3IncBF0QY3iyAPR6HZCvGyIY99yq
 cxT86xdUajl5gpcQuHH/lM7jxFKYOchzMMXbKO2SUeUeha4uOw5bCcNMXY9LA4NEGu1O
 SNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696314196; x=1696918996;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yNPCrajTh57Jjbi/jtn+1FxXShjLbKmdOEGxNykJkZQ=;
 b=wxFqAJ6tW/2rrR6R4OweRxQQocnKFCR1YDiE7ZACBnx2zt3KMOZXhbPDvQKSprVm2I
 R4U+4mEo1kS/1yI0fH3QSqPiGkqTf8dIDrpad1Y/mM2D5NAORETJ/NJu2J1rs8r1WhMV
 TjnL9nz6mo2JmfdidIGaB2m3+uLJ+ryHzzhP3KEMUjcu6rywddUZHcwVNBTxN1+u97xz
 DtEiLQBLMdx/wwfTivEDej8y0Xk91PFbGgwYBe6h+5Unq7OJLRAGW86/jfTct0eOAbav
 pWscdl5sPL8tAR9+Cb7C/BFDaoGUfu6g2S2UWXQb9xL+bGSR01hz6sS8AXFawH/7D66d
 +XqQ==
X-Gm-Message-State: AOJu0YwFAz7m9RfGVNJY8DwbPxaVLvaOZdqV05IPKSwgslDiFd4mYB+z
 NSHzUfhFJxC1g0tY+fUHMO5Jtw==
X-Received: by 2002:a5d:6986:0:b0:320:b24:4361 with SMTP id
 g6-20020a5d6986000000b003200b244361mr11629310wru.34.1696314195987; 
 Mon, 02 Oct 2023 23:23:15 -0700 (PDT)
Received: from [192.168.69.115] (176-131-222-246.abo.bbox.fr.
 [176.131.222.246]) by smtp.gmail.com with ESMTPSA id
 da4-20020a056000196400b003279518f51dsm750608wrb.2.2023.10.02.23.23.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Oct 2023 23:23:15 -0700 (PDT)
Message-ID: <06cd7690-adb6-e9ff-abf7-21c8c05efc2c@linaro.org>
Date: Tue, 3 Oct 2023 08:23:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH] xlnx-bbram: hw/nvram: Remove deprecated device reset
To: Tong Ho <tong.ho@amd.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, edgar.iglesias@gmail.com,
 peter.maydell@linaro.org
References: <20231003052345.199725-1-tong.ho@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231003052345.199725-1-tong.ho@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.321,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: NAFHM5glisnz

Hi Tong,

On 3/10/23 07:23, Tong Ho wrote:
> This change implements the ResettableClass interface for the device.
> 
> Signed-off-by: Tong Ho <tong.ho@amd.com>
> ---
>   hw/nvram/xlnx-bbram.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Since you did this one, do you mind updating the other Xilinx devices?

$ git grep -F -- '->reset = ' hw/*/*xlnx*
hw/display/xlnx_dp.c:1399:    dc->reset = xlnx_dp_reset;
hw/dma/xlnx-zdma.c:827:    dc->reset = zdma_reset;
hw/dma/xlnx-zynq-devcfg.c:387:    dc->reset = xlnx_zynq_devcfg_reset;
hw/dma/xlnx_csu_dma.c:714:    dc->reset = xlnx_csu_dma_reset;
hw/dma/xlnx_dpdma.c:601:    dc->reset = xlnx_dpdma_reset;
hw/intc/xlnx-pmu-iomod-intc.c:539:    dc->reset = xlnx_pmu_io_intc_reset;
hw/intc/xlnx-zynqmp-ipi.c:362:    dc->reset = xlnx_zynqmp_ipi_reset;
hw/misc/xlnx-versal-cfu.c:498:    dc->reset = cfu_apb_reset;
hw/nvram/xlnx-bbram.c:526:    dc->reset = bbram_ctrl_reset;
hw/nvram/xlnx-versal-efuse-ctrl.c:753:    dc->reset = efuse_ctrl_reset;
hw/nvram/xlnx-zynqmp-efuse.c:841:    dc->reset = zynqmp_efuse_reset;
hw/rtc/xlnx-zynqmp-rtc.c:258:    dc->reset = rtc_reset;
hw/ssi/xlnx-versal-ospi.c:1833:    dc->reset = xlnx_versal_ospi_reset;
