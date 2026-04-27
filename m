Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F351AFF8868
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 20:50:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHSuF-0005M8-2a; Mon, 27 Apr 2026 16:50:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSu2-0005Gi-EE
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:50:04 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wHSty-0008JB-UI
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 16:50:01 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4891b0786beso76678025e9.1
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 13:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777322997; x=1777927797; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=K9LQMhbq3UafJT/gSRJmDPNRrwYwFOmC8pKvQuYGvac=;
 b=ljWI9TEbZr9FZwmBlGq4XmlzlsJ502CLphZI0jNiAl1M8cgz4W344QGxF5x33LdJpL
 gtYfUFvZX+10DuudIVv2FB9pDFyXFmXYiL0xPAL2ENW48tG5IN3YfkMPgNrPegzNzP7T
 0J2Bpwqi6/Qb62HdXXsZVoVbhBWGmIj/7vFHFE5GZxpSoqc0SBMgSA3R/XOxDWLQBdDn
 VKkpOwYNbyc6ewDvjp48gU6R8CyZdcAjOwf9IUJYzGFE0Ocg6hMiTeTo63E+J28g16Qa
 k0imIqqia0UVRKUs5zLSP+abkVCAlN6PgfGSQuHeo5wzfQeuNMWkK2RbxQpg4LsKk3t6
 c9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777322997; x=1777927797;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K9LQMhbq3UafJT/gSRJmDPNRrwYwFOmC8pKvQuYGvac=;
 b=jVs9ktAZR5rsb2NE9yv0tC8bxquPiVPaOjb9514FT4//iCyt8hAgfSesdM1N3v6+D0
 i2hR13Ebgc/04twn69kJ3WRGKsf2TwQd8Symk51b4aDQB4jtwI2Azy0bNK3V3qwwOauu
 dY3LgEsVQLz17TkTUDqsmz2NxpNtiOz996Yx3BmwOPTEQQNYzgbIk080zINPhCQZnfpY
 YFuNQUgGSV4MVH9kyOih8p8gxHidgerFkuBQf5RsyHKfsRUDyS8R/mGT0R+sr3inb2+4
 EiD1VUO3VSYiThOZ2plgLODO3uXMQoF1fkKDrAHOobnFnH85iQBGiqo1tAJz7tpWjecR
 GJeQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ99DsKYP8TrYK2nCIz2/1e8fjt7WG9ws01H+SWuHTdrxPygHjiZ5euzdJXbFSlqiO08foeMhugNNw==@nongnu.org
X-Gm-Message-State: AOJu0Ywd3gmb1q99gEHUId7gzR5WxzLd+rlx111eZMHJ72PkcY/reBHW
 qXwUQL14fJ+ZvdX15f6GFEMC0Gqb/dVVtWrFw+40hLA0ho8nWEbwjvoBmG56KGLoXYU=
X-Gm-Gg: AeBDieuz1jnxmzS9BebwDdTdiW1sUPWSlmZoHtTa5qRw20qaFm4Bytf5YLjswTbdkyz
 NKYBDcnahjN97QvIKoKnoB/cih2ZiZTLJFgGimlC7mJCPb3UeI6p5kNSusV392BCxNO2N2PjTDH
 hxKDmB3P2PTcJc3vHVvg7q+D7xUqgUNryBc5DOu0yO7YuQC1aDiZF+1HzY0SNXWsVMgGIKJUWEO
 PXzTl3cz2yopbni8iI2i4wU23JgqNJRgLNnmMlBPiuhbl7ijjJi/16M1ITzX//KXyQNZ0Iehs37
 j7LlZrB3nB2Y1fhLxFDeCltGJ3/Dh0l9Mld9Z04bdu2qR190V5gGYPyu4fjqiWwVnK2DUSljHZb
 Dl2qhFch8r03Ygs7Q8tefFvgoIp1cVkvjJoDREBLyNDVDDm9J0fkvF92frWY7JxE/wjzrIxGdgb
 PXq9jnU8pgEYY4nakunR+8jo3FbbHIvPJ39oL9EQFxzZ9/OsltphCZqC6gM0hAPhH0AHkSLAn+o
 v8/
X-Received: by 2002:a05:600c:8b52:b0:488:a882:c7 with SMTP id
 5b1f17b1804b1-48a77b1a4aemr3298595e9.25.1777322997325; 
 Mon, 27 Apr 2026 13:49:57 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a77449ce5sm6328845e9.0.2026.04.27.13.49.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2026 13:49:56 -0700 (PDT)
Message-ID: <2143ed51-4076-45f5-aea1-9e43fbb0ae77@linaro.org>
Date: Mon, 27 Apr 2026 22:49:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 33/41] hw/arm/sbsa-ref: free unrealized flash devices on
 finalization
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
Cc: armbru@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <leif.lindholm@oss.qualcomm.com>, qemu-arm@nongnu.org
References: <20260427-qom-tests-v1-0-c413f3605311@redhat.com>
 <20260427-qom-tests-v1-33-c413f3605311@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260427-qom-tests-v1-33-c413f3605311@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 27/4/26 21:42, Marc-André Lureau wrote:
> Flash devices are created with qdev_new() in instance_init and added as
> children, but the initial reference from qdev_new() is only dropped by
> sysbus_realize_and_unref() during machine init. When the machine object
> is destroyed before realization (e.g. during qtest device introspection),
> the flash devices leak.

Hmm PFlashCFI01 is opaque, OK.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Fixes: e9fdf453240e ("hw/arm: Add arm SBSA reference machine, devices part")
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   hw/arm/sbsa-ref.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

