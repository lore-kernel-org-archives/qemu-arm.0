Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4777332ejc;
        Mon, 6 Mar 2023 07:25:47 -0800 (PST)
X-Google-Smtp-Source: AK7set8SPQvbOmikuYcIdcHKfqRnk/HA0/CDE+0gmuM+3nYcv/cSfyp6p7PIaFy/pqYxY4jXuQW2
X-Received: by 2002:ac8:5c82:0:b0:3bd:ad1:49c with SMTP id r2-20020ac85c82000000b003bd0ad1049cmr15762340qta.24.1678116347709;
        Mon, 06 Mar 2023 07:25:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678116347; cv=none;
        d=google.com; s=arc-20160816;
        b=UtWQMsBGvTlgrET02bVlgg8bMT21paJsSFLp18dkxDhJ9EwPs+kh9c+msSELAOqkzQ
         6hbp0JWH8GhhfT0VK5t5VM3+d17IXVmqbbgvLa8W3ZX/bLtelm1LOwHTYKUaT0YVfqe7
         ao7ZBsnIoGMEawc4AOs79mRnQe8Pwu7XFJ/HltfL8eobu8URS/vKj613EtOt3X7Vxjrx
         Xcjv2W7gbPs5bNKrqvDkFtOZBTTASULFyA7AGdA/ntgLXdxKOLBIpcRSmZK9UInYJ23Q
         IX03GFl16Uks/dEmTzp7fSuegtqqRA/kclwlSggXzKfIyCCS9JdAqLEZOvEcK2tNkpGG
         0sIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AC6n4hE/acDWMcNUaPxU3ltggUE/RGR0BGPoFG0XiHA=;
        b=OE9XRyP7wvCjWmYr+oekxjjSbcLu8Tg0gO2GqZHhxSZAZF849L5s6gWar9uGDNR2Pm
         guPAC4er0ozYPC8bACF/C6798sDBratbhDb/3fEEzGyIBn2HmODp2D5Vm/pbdzz04NOx
         yojfFvqgrPRBsBWh+bxd1bYpT17svuwK3WIhbPcMKWrLhfpDipRoyqf98FoUbJ/+JnFo
         aaXVeqmSKUAULFWP5Dkcb0MJkodHgKiq/reG4UHDOWYP00394B0f5g1TBCT1v66zh6Mk
         i+kjXeJ6/0SFybusxsbSznAIMj4cyGun+wTMXldGoqTnr2K1R8oneCTBOMIVk27xk0fx
         dYKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HHj1p+7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d3-20020a05622a15c300b003bfeb30c27bsi7324852qty.245.2023.03.06.07.25.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 07:25:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HHj1p+7c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZCiE-0000TR-IC; Mon, 06 Mar 2023 10:25:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCiC-0000NI-Kx
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:25:16 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCi9-0008WF-Ko
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 10:25:16 -0500
Received: by mail-wr1-x42a.google.com with SMTP id q16so9231962wrw.2
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 07:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AC6n4hE/acDWMcNUaPxU3ltggUE/RGR0BGPoFG0XiHA=;
 b=HHj1p+7ctKespZDf7N6NI/XJ9kpthhGy2j2GODy4E4pLVXhntSsyMgOgsAw17/Wnb4
 2+Fm+J+mTCjKddHk9ZNs22HNC6EZGTao/xnUCUm52GvDPS75D/5kQI2GVvlSyflSQzye
 3GRdGC40otNkaj41uI378RVsyze2ioC0LWFWVGKula/eAzoyBbwMYg/fMXcIMby4Yj8b
 oy5nRHL4Hos0gycDrkUn1kYjjVAalnjeNAaX6qNQMVoqO1DfPf0+k+mj1rtUCJpH8vzz
 2HhZlf8qI8XGDF73C5y9wDRuS8EzM26+HaoOopGdiqKFmOiggi9Qeth16WE2znD0nmAu
 nVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AC6n4hE/acDWMcNUaPxU3ltggUE/RGR0BGPoFG0XiHA=;
 b=jY2KNfkb3jWfsNawOiaf63Y+YsFFqtZiepfnYbzflQsdxORmSFcp3BD4ImtMnFcBvm
 gDAuWnLBsqPzuDXdcGHUJciIrLpZb8DUAK0KBZFKJBc4gyEjMOGXgaUYDx23atMlgqJ2
 CmZMHwff5LLZNJttnfik2D4rTMDOTFcPAg1wOH0kV1N95yEXpfBPXW5IgHamKCK8R6Vn
 0BGoNuWZhahwJV7LARO8tA/HNsKtc7ACzgGLBvC83pPJi9zHnjl+U1pBjYSxOWN3kwDf
 3xIQzErCSXSJg7yeclnWLfS9LKSG3Wqs8Jzgp+wCHD3Z4PlRdG/v4YWww9SRu+FkmNMv
 so9g==
X-Gm-Message-State: AO0yUKWZCex6m4m5/tbAzhrMZys7nyraOZOhvrmIQtOWB/gJVSN2wxLy
 j7aucKYrX0JD4fcdBNk9KC3mSg==
X-Received: by 2002:adf:f70d:0:b0:2c7:1d97:bdcb with SMTP id
 r13-20020adff70d000000b002c71d97bdcbmr7252655wrp.36.1678116311968; 
 Mon, 06 Mar 2023 07:25:11 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 x17-20020adfdcd1000000b002c5804b6afasm10355817wrm.67.2023.03.06.07.25.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:25:11 -0800 (PST)
Message-ID: <0d252671-2f96-4071-2b7b-4a53965143bc@linaro.org>
Date: Mon, 6 Mar 2023 16:25:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 60/70] target/tricore: Drop some temp initialization
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-61-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-61-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: y76M5Q4PI0xx

On 27/2/23 06:42, Richard Henderson wrote:
> The temp variables here are always set afterward;
> the initialization with a constant was discarded.

Since commit b00aa8ecbc, 2015. Shouldn't this had hit
the CONFIG_DEBUG_TCG temp leak guard?

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/translate.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


