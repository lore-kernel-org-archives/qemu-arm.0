Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1617852lfq;
        Sat, 9 Jan 2021 15:46:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpBlrD5Zk55BA8XRMwRJq2YjXyMFzVh2xOTsDXQfKOlptVrPYBXTvh4GFiJXryY+ggJIY+
X-Received: by 2002:a25:da89:: with SMTP id n131mr15490216ybf.67.1610235968833;
        Sat, 09 Jan 2021 15:46:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610235968; cv=none;
        d=google.com; s=arc-20160816;
        b=E6MhcP1RkCc8vR852FwxC9SHuOPwCJUA1KnFU9BpFRfhr0XOTOTctlrD//Me07BlFW
         BMEYzhRKoLFzTUtC6K7AWgiKOyR6zH7mGh/Ccjkt1SHSTRNSUF7vd4PYuTsnlBDd9+el
         iDNCsl87qa7/j3Exz95duy6GuiJKqatHRdflvSxyEvfuXWlnG12z1OmBUfhHxgfdOUH3
         ipyzuAUy9UiDqh7RHPwLbF1ntIbL8zTEszDbIKotFsNALk98DRl6YaANqMPg+T6e9rNX
         2xzU/CiMArubYfizAMeI9RE0B0XtbxNZSl2CMHodUUgjy3Qg986v0etXMhQScqP+gMd1
         DSkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=I0bhdjWcxmFuZogU0y/NYMm6U6toxyEVThjZP/+f6wE=;
        b=mLe593xqPSgjhmpxq+xzJIT+TqsOpBQt9JU/2DS4MLsZDshdHIvqqWBLaVCnKjwNKb
         QEH5Z0Mo9DyWomtjjp1KhAjRPVhDT9BD0mHZThOK8/xbjQtFV55h/OlD1bLhzax0G5/l
         54NnbQUiaWfap9VYnhgs7Kld5cCta0BsFdDkVc7f6EHYNbSyEZZDAXAW0weEHyR2ifJ0
         6LLsOtz559R5FYpHfDHq/T3Yqebdrue9Emv9p4VVuQNFPV++GPEcibrTFAnLSOIKxBqj
         1QqPQmS0CZflEGPMz93s6J0ksXZBkMwcuUyd4a0WJSB04sk8+eW2E5Lzhr92qGzCM+6G
         49CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uyx+XXsg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7si13597544ybm.214.2021.01.09.15.46.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Jan 2021 15:46:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uyx+XXsg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyNvs-0000B3-8p
	for alex.bennee@linaro.org; Sat, 09 Jan 2021 18:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNvT-00008h-0m; Sat, 09 Jan 2021 18:45:43 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyNvR-0007iM-I0; Sat, 09 Jan 2021 18:45:42 -0500
Received: by mail-wm1-x332.google.com with SMTP id e25so11579610wme.0;
 Sat, 09 Jan 2021 15:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I0bhdjWcxmFuZogU0y/NYMm6U6toxyEVThjZP/+f6wE=;
 b=uyx+XXsgotMrzrXjSvdisVZIimxuj3sy+ZSK+FAlNLYg6KspMmRs3dMnzYjeq5Qu9a
 d7XPmYBkHuI9eGCbtbOiHb9j27RCMlyeWiQ5J06BdyXzO0m7jJxXIbG10jNU6i91whnf
 Bwty1hOY19k6hKCgybdX6IHQmRq8Mod8xZNjM4DKMyJnhF7w5wjQ6e7kRXCVrCH2CFO7
 TeVhALjikG6ECcmPlqis1ey4+/Tx644i7DWJm586ucQFrOCMtud2BCCTa3eQfGr4jne3
 6XhGQSRDYkXrckD7pQBo7o7JDjzkSCFw06wflq1WqpuX1hqTunuidvI+h6C5TcKfKC6d
 oaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I0bhdjWcxmFuZogU0y/NYMm6U6toxyEVThjZP/+f6wE=;
 b=FFDCOYyX9sxdk5oog4XUtN2Ji4lsgWeN98RWwa5p6yXBBiqtDx1Y3vNajNi2sjNiq4
 iCHg++/6+yfERyD35HF11zSOMMsjcnkXZipU0GhCZJ6YXHQyQEh6egyLBPzjGy/GNsBc
 nP2pgqXx4r5ziJDYYaY6bFf/Zs6jBsFatZQaGGhMEUasK7ibObh3yTt9NyYo0rv+QYNY
 iwu0HZjhckCYOHiS78gkjwLzHUQF5dQyqrl39JBu6N/g7fIjUnnopn9oP4PMxdlMLkfV
 5Syg/pNpGw3bCYRzaIDSv49s/tSFfvTlAkf/R4tfeTlD8iOcKMTuL6aZ3K7uyTEopPDN
 m2aQ==
X-Gm-Message-State: AOAM533Mlaq3TXYaYq33ccGIHHSrV63L0DdBq82dZbQT3N6mJOuxfacx
 R4S2zxToQCuJqy1kdzflHlE=
X-Received: by 2002:a1c:f604:: with SMTP id w4mr8917025wmc.39.1610235939994;
 Sat, 09 Jan 2021 15:45:39 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id z6sm19028484wrw.58.2021.01.09.15.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Jan 2021 15:45:39 -0800 (PST)
Subject: Re: [PATCH v3 1/6] hw/ssi: imx_spi: Use a macro for number of chip
 selects supported
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210109123545.12001-1-bmeng.cn@gmail.com>
 <20210109123545.12001-2-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <95e18158-ea7b-8bf2-690b-41f1fb459863@amsat.org>
Date: Sun, 10 Jan 2021 00:45:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210109123545.12001-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WrI2qwDNOsth

On 1/9/21 1:35 PM, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> Avoid using a magic number (4) everywhere for the number of chip
> selects supported.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> ---
> 
> (no changes since v1)
> 
>  include/hw/ssi/imx_spi.h | 5 ++++-
>  hw/ssi/imx_spi.c         | 4 ++--
>  2 files changed, 6 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
