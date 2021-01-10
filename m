Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp1905877lfq;
        Sun, 10 Jan 2021 03:17:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy0XNnw1HHjvjR5G+BqbKxqcLk5GwuKP46pOYa231yIoZxaA1hgrSPgr1Df1vkl4TkeRbsh
X-Received: by 2002:a25:44d7:: with SMTP id r206mr17441423yba.323.1610277423266;
        Sun, 10 Jan 2021 03:17:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610277423; cv=none;
        d=google.com; s=arc-20160816;
        b=Gsxe6XgHYisZUgOcFz8nYmlyWgOgTM/f3dkvOBCRgqG0UZSHQVZLXLkQeR1UNW3HTB
         Obdt1AvMsZc52quJqt0qHiKLNPehOGc28NUqMBDeW9GyVdi9aJKeVdX6t2+W4Yd6u9iw
         Ek2MlkjDbMwfONYC9AfyA4kEqQTRSEV2rQ9AW9Osof+nFZJFbsK/C4BVccBq/76rcAOA
         CkVGo7IB6Byq0fMGJMlXAkk/eTAEEVtYy+zW2cYbesjEQMhB5ThdlhbQTYb6FuOWM7pe
         OqtmDoXJfH5nTjYvBNe+vQxfbTpg+y2q5kl+bUvDTI4ECYebXrbCPE8fpraAk5MG1RwM
         UdFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=i5toWxa+Bct64DrGqhY4wcp40g07cf1OYL4IixF/BgA=;
        b=dDb/dmXfExry9TMeRvcXnR2vxOQhAmuVpw3drVx/aSSh0tR9jaqPm75ET/V8Y9Zo7e
         586jzEmfZv/671Xd+unlc2kRs8+zkvQDN9QPhItJwZ5SUWlkhZIG/f2nhzVJn0jlcIbs
         c2EoGrqilYdiydpvhVyy4mfRcxYXFbE9jSWtA9V0GMeRl+Vwjcwwk2QD9yd9tKwNs3Rs
         5bU7T+2UgngswooQAbKUtQLO4DtWvmZ3Cm9Jkpum6nR8bnWuFscOFvXHKdA3LugEyLdr
         p1cgnBUlaQZ3Ein8BlSFJKpdqrN/xtpfR43f9ff8VXe8uqklCw+FWfhsV3SfG/4llXuf
         Zsgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E3wsVnBX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x14si15950876ybl.25.2021.01.10.03.17.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Jan 2021 03:17:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=E3wsVnBX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kyYiU-00025h-Kd
	for alex.bennee@linaro.org; Sun, 10 Jan 2021 06:17:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyYhz-00024q-7i; Sun, 10 Jan 2021 06:16:31 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kyYhv-0005nD-Ls; Sun, 10 Jan 2021 06:16:28 -0500
Received: by mail-wr1-x431.google.com with SMTP id i9so13419725wrc.4;
 Sun, 10 Jan 2021 03:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=i5toWxa+Bct64DrGqhY4wcp40g07cf1OYL4IixF/BgA=;
 b=E3wsVnBXwUcn2UOHA3/sbRwnm54GOi8OUjc9eljCRIhI41rJfDjnsWxngs9tyIwm5j
 fkbLZ0NaVB1bUrYsAgLyuIgdqrAsXuJNtHwqDyGzZXnbUbC3aaT3kl1h1nYGCEaYcM0k
 0mlHLdQIi28i5rWoCYuRhSHWdiuXLmLmyuWAZQ4LkqUOWHws7nQBu7PWf/B1btWac5h9
 /gu0kd3cAbX2vHyxA5pwWtuFVovAu8BeOY5T3HhlE2ZGGO5AZrgJbKPE07EKAFVbqNkS
 jhAut1VxtAMSWu4cM8Tf+NfWFlpW8l3C04IlhVUXuxVfxwLXuziKLxtZWWi/xhIWCO/A
 wFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i5toWxa+Bct64DrGqhY4wcp40g07cf1OYL4IixF/BgA=;
 b=fYFAxf1cU7KjtwHuszZNworj6YeJ7Q4otZVzfdFj/OOAN/sB74ZU5g4YHXw39MAlw6
 4A2CAkGVj0KdYzwFGFHSclOBBpVbVd+hT3AZEvd+mMMKRhLBKXx0K5YG9pJvcM060b15
 7KDmuA3tkmgqti7vf156AixKuyj4euyf1GeSCnftw/GYlzZezQYXeYPjAkqsxGv7ZHNg
 ZX//utwUB9DkYvXR9eiMvwqjg0maZjhBDFXOMEwcko3dBSIhiJEA3Rs73UOhk16su+7a
 kdPvVcEwT6may+A1L7MW35jNPr/q2+dFwiwXyVX2KJTL33U36yRNs0GHcE18pvzFRECf
 KImg==
X-Gm-Message-State: AOAM531wuBRAmY62tglwpE8UGWzcICrvlOJwhw9feGT7kOTbSxmenrDB
 odHlfd6cP1sSsxAkaTK6jx4=
X-Received: by 2002:adf:fb52:: with SMTP id c18mr11614862wrs.186.1610277385521; 
 Sun, 10 Jan 2021 03:16:25 -0800 (PST)
Received: from [192.168.1.36] (129.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.129])
 by smtp.gmail.com with ESMTPSA id r7sm17937812wmh.2.2021.01.10.03.16.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 10 Jan 2021 03:16:24 -0800 (PST)
Subject: Re: [PATCH v4 3/6] hw/ssi: imx_spi: Disable chip selects when
 controller is disabled
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210110081429.10126-1-bmeng.cn@gmail.com>
 <20210110081429.10126-4-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <36530f58-0aa7-b861-fbd5-6a41a0cd3a76@amsat.org>
Date: Sun, 10 Jan 2021 12:16:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210110081429.10126-4-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.255,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Xuzhou Cheng <xuzhou.cheng@windriver.com>,
 Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F1OR2HRpvKxd

On 1/10/21 9:14 AM, Bin Meng wrote:
> From: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> 
> When a write to ECSPI_CONREG register to disable the SPI controller,
> imx_spi_reset() is called to reset the controller, but chip select
> lines should have been disabled, otherwise the state machine of any
> devices (e.g.: SPI flashes) connected to the SPI master is stuck to
> its last state and responds incorrectly to any follow-up commands.
> 
> Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
> - Move the chip selects disable out of imx_spi_reset()
> 
> Changes in v2:
> - Fix the "Fixes" tag in the commit message
> 
>  hw/ssi/imx_spi.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
