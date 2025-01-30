Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp62314njb;
        Thu, 30 Jan 2025 14:14:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV0/nFmM2OLjozCKo+GwMg3KvuWBeD1KRBlIsBx8tteAEiAH2PZhKmcMq7iwH/T+G5s85b7q5i8gyqPQA==@linaro.org
X-Google-Smtp-Source: AGHT+IExPosKYN/zo3ijG92/nqoOnGuOXFC0MekCDjjeHJBalA0Uw2eWbuLIg2BWonWXsrokAJGh
X-Received: by 2002:a05:622a:1a85:b0:467:8836:e003 with SMTP id d75a77b69052e-46fd0b800ddmr160300461cf.41.1738275283109;
        Thu, 30 Jan 2025 14:14:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738275283; cv=none;
        d=google.com; s=arc-20240605;
        b=UzSSyAZM7irHQbKKwiQ57GJ9jahlqvgkwh109MuuS8YNoft2Lpf8sPqgrcUXVf7mka
         RSkfKueDdpIZBH/Pk+1Y4rZlRh46D88U+2QOO+TbBlSq8R72OWoJD52+29BgubitowbY
         ngXrxVHlUjJKwu/psiRcn1S3nVx6jevd01uGpYfV9FUgdHpRpCPJYhPD/CMigzkwytO7
         cdSBx0rtBhKnUKxgeam8OGHkUXkI8+NSTkPGFxyizhui3QOgSMy4/OR8/0/7U/hhHm+h
         w0jYPQroa9qF7kazhocVAQjUbEP85+s1XJUcZLRND9qYyPpPee5h0xXtOCSnVgzkt+ZG
         r5yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=jdohv2h58n1LGauybYg54TJbRxP8v4XIJS7aqofxpsI=;
        fh=Xaqi5sUz4paMgDzC2tYY3DQJmXC/ziskQASsJE67X/w=;
        b=lbgXSPxEMxc1ZyaIE1Xf2Ux5QLSkzG7GkyMlCvzILAujTQ90FzRBUFqrtlo2RXY0t3
         yekNNpVBXhoVjO5UlzB3kaBbDKukzHqo41xDrHEq+ZSXCoGbQ+BH46Ulqg18M6Y2anXL
         HVp5UtGUVLFuj5ZUS1CQA/sHSlZ8R6h9PSK203e5yjd7FyN5Vxa3Zr4RA04/8KTiPWTM
         9CjNsQFppC9YiPD/VfLrfs3l6lY7tbcix4RDHrDpIELLOn7p5PakCLzMPZ2VYW6fuut1
         3FKajBA6PsaizRh/SiJdPq+DcbMFGZgtQX+lMGsiVzMi2zdICQp2BazgxdR/9J2/YXNE
         Gukw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tWGPb+s7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0ac070si25576921cf.19.2025.01.30.14.14.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2025 14:14:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tWGPb+s7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdcnh-0002Wo-DK; Thu, 30 Jan 2025 17:14:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcnX-0002UX-6i
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:14:07 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tdcnU-0007Co-Qq
 for qemu-arm@nongnu.org; Thu, 30 Jan 2025 17:14:06 -0500
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso808951f8f.3
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2025 14:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738275243; x=1738880043; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jdohv2h58n1LGauybYg54TJbRxP8v4XIJS7aqofxpsI=;
 b=tWGPb+s7KV6z9c6u8JQGb+D5JXFR8T8oqrAvemHPE09ZEed2Ab3JEFu3qU32/2PA2U
 qaB3YunH7ZQxcV3sz6QBtcCFxZQdanwGVFico78zJieTTaiCSwGki/Ow0rEU4goZhz2e
 n5BeFmzE5EEbXa7j6tsGQtAQ4Yx3aajinCiCvELxKzbKU4YH5V3Dzfm2uwL7uguwmXrk
 oUJtf/BBKhoKHq+vgS8aJp9WeUvO1sHGRe0Gy8fKpUH4809HWADkvAx9kaiEJ1lS2GQR
 lxxTmV+1SZWUqtcYxD+ipBiaW66c0w6kpgQw++WB0LBLEYTpvk0pOYIL4W6reGD+2NWP
 8v2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738275243; x=1738880043;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jdohv2h58n1LGauybYg54TJbRxP8v4XIJS7aqofxpsI=;
 b=HEE7SR7uH+AN16nZkewcEpymWywyhyYKmPNLGAT5Mjgsr/+NP4gC6Ce88f/+6vVEFK
 lXmOt5kiqzouPdKgt2r9UAg8FHWvcxZLzZlfMXEWzU3GPimiGllRXF2ZaL0lVQW2Xqd/
 /hJzHUnBMGoDWcFacHAVSkiQeDX6TCKlT2Vk3BR26Q3FnZu8UVYAlddnDx4GHPSpGDay
 zlGE2FmRepR6YnmklEEtOKKl+iE52JvHPdyLnJDZSKPIvZHo3gR9tEMnKPz0YNrv5Yvd
 WuMpXXLzYc8DsFz1oU0mqKEqtDjHzu7ydyITzk3DbkXUdZQ08kyy+2xDhMldFPdb5BeF
 TMHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWlH3dDjw0w+P+1XHLDtz4XYZtZhFXCVD2FFoYDvTdELmYeFF4778e02vF3uDWIcTcWdUfGsHIQ8A==@nongnu.org
X-Gm-Message-State: AOJu0YxLrU7vvFN1A8bqvUpmymalZfszoJlNGzLv7RXSh+JNeep0XXJr
 PgrJv9XuZ/J7eewSkZjHqs2XE3tsZYFV+bcLXFqAPFvdjeKrUF9QqEUKl9mKsNA=
X-Gm-Gg: ASbGncvURgmx2X9Wp3cOdwDBBF244vPdnLaGlcr/OsRCKTXXTMMEInjyDPA9e1JVVht
 L/0pi+gXEjcVcmBOpO5ldo9J//ZXPTJrG5JlpStpqT1EKlFGKluvU8Vr1ZvmKvcgD8ZZgV/itws
 hB/K7WgcXdXwrmeJmypMlDHFJBl0XGy3TLp6wQQQYXdGf8e1lWzos/PQeD0ythiGHHkSVWs2xoi
 hs90V6YsVWF/7HuBjIEztSomd7qNjW9mVHa48bssGVegAoEiR96Wn/Rv0yvhnL50QzvZ05eh97H
 XD7UI5CXEgUPCWq6XClFQG5rFVwxjkLyCAcEXyEUlLyC73YtpQz3cmd+MrI=
X-Received: by 2002:a05:6000:1864:b0:38a:a037:a517 with SMTP id
 ffacd0b85a97d-38c51960307mr7494435f8f.19.1738275243039; 
 Thu, 30 Jan 2025 14:14:03 -0800 (PST)
Received: from [192.168.69.198] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cfa2fsm3138520f8f.91.2025.01.30.14.14.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 14:14:01 -0800 (PST)
Message-ID: <6b847b2d-dab4-438b-9e2b-e06985bed2f0@linaro.org>
Date: Thu, 30 Jan 2025 23:14:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] hw/sd/omap_mmc: Remove unused coverswitch qemu_irq
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
 <20250128104519.3981448-8-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250128104519.3981448-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: i3dvwXDkkevH

On 28/1/25 11:45, Peter Maydell wrote:
> The coverswitch qemu_irq is never connected to anything, and the only thing
> we do with it is set it in omap_mmc_reset(). Remove it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/sd/omap_mmc.c | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
> index dacbea13aad..07d47421bc8 100644
> --- a/hw/sd/omap_mmc.c
> +++ b/hw/sd/omap_mmc.c
> @@ -35,7 +35,6 @@ typedef struct OMAPMMCState {
>       qemu_irq irq;
>       qemu_irq dma_tx_gpio;
>       qemu_irq dma_rx_gpio;
> -    qemu_irq coverswitch;
>       MemoryRegion iomem;
>       omap_clk clk;
>       uint16_t last_cmd;
> @@ -325,7 +324,6 @@ static void omap_mmc_reset(OMAPMMCState *host)
>       host->transfer = 0;
>       host->cdet_wakeup = 0;
>       host->cdet_enable = 0;
> -    qemu_set_irq(host->coverswitch, host->cdet_state);

OMAPMMCState::cdet_state is now unused:

-- >8 --
diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index d31456ad236..031a6f0d333 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -71,3 +71,2 @@ typedef struct OMAPMMCState {
      int cdet_enable;
-    int cdet_state;
      qemu_irq cdet;
---

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

