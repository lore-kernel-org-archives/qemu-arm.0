Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1881070lfk;
        Sun, 30 Jan 2022 15:38:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywQ7LC6nrTsGw9D2oXFAqUwF9qmMrfkBaASCnHoGyhgMD3hmQVHKJtdIyNO8uqNYjPfGNm
X-Received: by 2002:a25:dec2:: with SMTP id v185mr16851693ybg.696.1643585893247;
        Sun, 30 Jan 2022 15:38:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643585893; cv=none;
        d=google.com; s=arc-20160816;
        b=ychcq2feZgl8tmSueNpXNmiAnOUReR3VPNat0aJiCOvMWOZ0+4hoPTWuA3LfDQA9qW
         FLiHwm09YG4JorkhCkscmexfACdlcfBclekM4P0RCP1+lE3YyO1Ne9Yi5BP3+FmpVepx
         zCfYBk3mu7y23kxdEpN2gzgK1Ug9PZwyIVnDJEl2fvTTJfAo43ul5nIyb6llc8t1cfN6
         aHED3wlOM5Y9JZ6lgGi5jXc3BnniTox4QCoMHh1PBCL27N9evnqflBZf4FlFfZWBy+k1
         DxF4JwVqpxhpKmoSTwZDm2Rz5DfeteOtG4jmCBtlgODnRoFcp31hyUqnzu+hjvE7D9lE
         ClBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=s9bIJLNUpPoq79eH17lAzZdKKu9Cv/QIgQCZ23rVwC4=;
        b=yTyrSoP9mONt9lUbD006n4G3+zp4BukVZ9KGvN/yTqyJFFisH7Gk9aGEUKlV+ysxdT
         YvwlRav9CF17poKVgD17S4ZshJcsHf0DhIIiztP1pj6SfXv/R9KX55sNFdtrRz8huAVO
         5bngYeZJZk2F+jGlQNA1s2nK+CLj+tAPFu3jZfErcX1fZut/jFALMMLoIlZskL9AW6CP
         qfbr58jAwM/D9YjwxmPbcXBZb+C7LH1vttil7EbUt3VM5TRAgfFWnmTTH3XhHKWxABey
         DpUwSfPZ2BL+ZndJwJW2wdzWSaXrbGbn/dy/mik/SaQZfTBITUfq5RWZlV0erdervgz3
         2Eqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=CbkfbBgc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x8si6359100ybn.548.2022.01.30.15.38.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 30 Jan 2022 15:38:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=CbkfbBgc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:39094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nEJls-0006Z3-Ml
	for alex.bennee@linaro.org; Sun, 30 Jan 2022 18:38:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJlV-0006Ws-9E; Sun, 30 Jan 2022 18:37:49 -0500
Received: from [2a00:1450:4864:20::433] (port=45578
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nEJlT-0004Be-R9; Sun, 30 Jan 2022 18:37:48 -0500
Received: by mail-wr1-x433.google.com with SMTP id m14so21781500wrg.12;
 Sun, 30 Jan 2022 15:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s9bIJLNUpPoq79eH17lAzZdKKu9Cv/QIgQCZ23rVwC4=;
 b=CbkfbBgcF1hOGWhwpXStloKdBsc40n92kZD94ffWfW6WISIVisIrgbV7fqExYuhh1J
 4y221hBMV2Y3zF3mJsf+3xP/RXbaYoAwKooHH2aXZDEQprbj3+m/fnkdMmu/WaC3n/cA
 62oA2nY2yLRYH3RxCQXaeSiZbGzhS1uwCbydGopxizqdl0+DthtZK+BSP0AOIwkwfcqW
 XIBlPQOrih5LaqssEm1R2UgPUwHPFhpRW/N4RjfolYKa/8qu2ft7G7hz2r854YicCUra
 msogUAlz2TCz649gKU2adkGseCYINuwhomDIjn2Gzp9FHcUuzM4oPBZGF7+34uiDGjQJ
 yRqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s9bIJLNUpPoq79eH17lAzZdKKu9Cv/QIgQCZ23rVwC4=;
 b=iYzQVgrDZbvFzpadPUS4UbfBShmjSv3V4a/MxCWHSZCzpTmkyM1VHny25gBrYDqhu/
 VbRua/sFJgcZLespBov2nSh0jSc3p3EF4DOKO0chi45jLpDnMWA4YahAGYF1kZXATflh
 juIfdLfqGIKAmp/6nAAci7fytNL6epm9obx3kQh9UHC7iQwqK23L39hgjKMP5CXg+L1G
 r71A9pPEgKkL+Zu9nRasKpucasF+dC58w2vLedYTRg9xB1yaWWZVUkCBx4iYAp+vIQAS
 mSaJEQEgqEPiAqm/gBJCrsAi1m74ZcPpTfrxiRiEmVX1WJmMZkhZgPJCvaL9Trefzics
 3pNA==
X-Gm-Message-State: AOAM533mNQdrbrtp+wI0RF85bjiyNBPWj+E6YsQWio9NggH3g4f8/mG5
 04i5vaJUaYmeXvBvtC3+TR0=
X-Received: by 2002:adf:ef47:: with SMTP id c7mr15164427wrp.330.1643585848544; 
 Sun, 30 Jan 2022 15:37:28 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q2sm4335287wrw.14.2022.01.30.15.37.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 15:37:28 -0800 (PST)
Message-ID: <402fc70a-6b1e-5f5c-8013-e5b88c143438@amsat.org>
Date: Mon, 31 Jan 2022 00:37:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH v1 1/6] hw/arm/xlnx-zynqmp: Add unimplemented SERDES area
Content-Language: en-US
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-2-edgar.iglesias@gmail.com>
In-Reply-To: <20220130231206.34035-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-arm@nongnu.org>
X-TUID: wdekvzu878PZ

On 31/1/22 00:12, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add unimplemented SERDES area.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>   include/hw/arm/xlnx-zynqmp.h | 2 +-
>   hw/arm/xlnx-zynqmp.c         | 4 ++++
>   2 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
