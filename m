Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EB3CD0421
	for <qemu-arm@archiver.kernel.org>; Tue,  6 Jan 2026 05:26:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vczZg-0005Uw-4C; Tue, 06 Jan 2026 00:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vczZe-0005Uf-Ut
 for qemu-arm@nongnu.org; Tue, 06 Jan 2026 00:25:43 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vczZd-0007Hu-9I
 for qemu-arm@nongnu.org; Tue, 06 Jan 2026 00:25:42 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2a1388cdac3so5328125ad.0
 for <qemu-arm@nongnu.org>; Mon, 05 Jan 2026 21:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767677140; x=1768281940; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OagJyw204oOcrZ3boHqyagBPaZ+eBts0fowwxGClcUo=;
 b=VjLJzHrfHiaEcnnCALA1NZdhya58D+2AnjFPLIlQ1m/nvuqKQoKxbTSe6XY8t0G2lI
 ko8eM0CAlKhL2Nwwi0kUGkPkTruYSnhQh052FezR8ZZ+ykQnRAMWHsMH8DLJL4hrFwjD
 jALlleH1C8AwZXrHjSTZrMCj7gA1nXzOKD9RaAFxSbRT8TD4gkT/W+0H5eJcGLsRbQi+
 h0PAXHbhmlFS7ZiMgewLgaO6VVDB9U1Ubykp3J/FiqTLTPpytMVVYKjfM/1eVMLCz21D
 wo7tULeQ86yxjiy3C+oDa6U+QD/FzVv4kkLqJWCHYC+yYI2fFuVdgvPqOlIaYKyeTV/+
 itnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767677140; x=1768281940;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OagJyw204oOcrZ3boHqyagBPaZ+eBts0fowwxGClcUo=;
 b=PiuqHt1vW7vn/B1vpJJzrNy3oGaX9F5XGwRY6slpRC+s8erlbAYVxL+K4qO6fNvSbH
 z8DE79aMOxMcVd8bkyy4aeCCd+a5xoAQ9aQ6n6KDnI9XakOSduS/2KWymM2ttCf8GdSg
 9yhURtq4d7tZHJZh5+NQJANBiEtflIOcLL0AYtpr9tpKgmwZqPPYAP8UCB2bVarXzEwA
 dpbKeH677JEbHZsPwkBAUbixb8gukXlfJP7SrreIWywOxBE/XBxfKqn04o/Rwe6g0r36
 kSxLPQPBMdEOvShzsOzP9zuym0Qefo8bQCfEiS7bFVovC0d/lS1zgVFgW+1Vo3/Z05Ly
 /1FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVT5sejbCjv83eVbgC8g6z4UkyBOajVl1lCgvHYfFFvckDLi9WfgU5/bRxx5hn9JM+HBqNF4NHWMw==@nongnu.org
X-Gm-Message-State: AOJu0YyC+/Shv8k3LoS/pB/RD69vPrnxLKORrfwFLDPXernhr6Qhwa6I
 j85w1Q0OwORAj/qc30I3PmT5+flL4MV8YeNjmk4LkmEUxmjGVrxpdZhpAkWCFqcgw/KhmEeniZ/
 hEE9X/Bg=
X-Gm-Gg: AY/fxX4Iwtx0B8UL+qGKieU708M4bbZXL7en79uCE5omKnYBxulaueAAOZTMRYvARuV
 JvkaPHq7xn/r9JAUjaMk85TTevP0zZQ2Mr6A25zviozdHJ0SbB7pNiceplI8houEgTzWQuXmj7I
 3v8aDAyCHvdLvaK2DQoqzH5Ojbk6QB4IwjbPZOYpe/6Lbw7SsgyKsPbZchgy2LzJrAv5QBVh15E
 S4EgdaUt+oZRTx3TAdPL9crKEctFcwNsA0x9/tT/XgfhH85jIKLcUyM/PZcMzvr1/owWHgne3bC
 y/w9AZKwaJ7mKsj6lVGFSpr0lRIMvEtflEaS7UJDJz2ne21erQe/WL11Rqw40En4Vs4wmgE+ARX
 3to6K+JqkQp/hlOYO5OegXNGZxJsWBa6HJgLsllu5nEiPnesO9NPTb1o5CdN9N0nPvMjJPVO3C2
 Ae0aq+iCjDmeJsigL5KrzdsciKmHBiNQ==
X-Google-Smtp-Source: AGHT+IHMoQArOgOcd3HvdbkaScaTxW8IzpTJsi4ern51FMAMQDEw+SUZ9D4Su7MM9cAoQWJpJL2xPA==
X-Received: by 2002:a17:903:950:b0:290:ac36:2ed6 with SMTP id
 d9443c01a7336-2a3e2d5b815mr21229995ad.14.1767677139587; 
 Mon, 05 Jan 2026 21:25:39 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c47390sm8624125ad.25.2026.01.05.21.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 21:25:39 -0800 (PST)
Message-ID: <3647fe54-7a2a-4ec3-ade5-2cbb23e395aa@linaro.org>
Date: Tue, 6 Jan 2026 16:25:35 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/36] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260105125613.622667-1-clg@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260105125613.622667-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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

On 1/5/26 23:55, Cédric Le Goater wrote:
> The following changes since commit 159107e390609f71b78268a4888563dcdce6ac65:
> 
>    Merge tag 'pull-hex-20260102' ofhttps://github.com/quic/qemu into staging (2026-01-05 07:35:40 +1100)
> 
> are available in the Git repository at:
> 
>    https://github.com/legoater/qemu/ tags/pull-aspeed-20260105
> 
> for you to fetch changes up to 9cbd8ee7f67fceee51d3c993a282e5adc397b6b9:
> 
>    hw/i2c/aspeed: Fix wrong I2CC_DMA_LEN when I2CM_DMA_TX/RX_ADDR set first (2026-01-05 10:38:02 +0100)
> 
> ----------------------------------------------------------------
> aspeed queue:
> 
> * Removed the ast2700-a0 SoC and ast2700a0-evb machine.
> * Added SGPIO support to the ast2700 SoC, including unit tests.
> * Added several FRU EEPROMs to the Catalina board.
> * Added support for the new AST1060 SoC and ast1060-evb machine,
>    including functional tests.
> * Fixed the silicon revision ID register for AST2600 and AST1030 SoCs.
> * Added an SFDP table for a Winbond flash chip.
> * Updated documentation for Aspeed boards.

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/11.0 as appropriate.

r~

