Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33155CA1001
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 17:33:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usOeO-0008HC-FD; Sat, 30 Aug 2025 12:42:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkpH-0006mb-Un
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 18:10:36 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1urkpF-0005Wo-PH
 for qemu-arm@nongnu.org; Thu, 28 Aug 2025 18:10:35 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45b7da4101fso2632165e9.3
 for <qemu-arm@nongnu.org>; Thu, 28 Aug 2025 15:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756419032; x=1757023832; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4IgyS4bdUdJEXom4nT0B8vFEDGGCP198DulKAudY4JM=;
 b=h07LdAOCELZFnR7Eq4HZtIErdMdAV2NuhlINLzm2Y+QmqaE1QKeJWAbx0Jd2Vzejqm
 Dn3zAX0Ifjc0/+JJ2ICToyA28byxum7P1FLWJAFEgKuWq1OsD6yYNEqCIvp1LMbHI79M
 YyKQPo8pFL/SqeHzJ6nJJQpcCJ43AdRmxWolDOkixsSs9baORSpJeFJTBHNaQVnCeIG8
 3h4zWXm7wR4uq17ONzS55T+hjYp12CUNyCoLSXxYvg6o2Gm+4c7L55TiriNPOQuZagLj
 y/XJwhAcKoP2YJk5JfiZVqOZ5xruJ41CUcH3d4kHwV1BZZp/3Aj1lABkAXY1WsqNLLOt
 WvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756419032; x=1757023832;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4IgyS4bdUdJEXom4nT0B8vFEDGGCP198DulKAudY4JM=;
 b=fk3n8CQpT85D+H/li7e+tDTIOmQ5SHBvbybzSrbyn4RqmQp53Sd9tuRWFpqTxXwScR
 aFfssYrPiZVhZZf1k4tTMpW/JboQ6aL/oQIixOpC5SipgBH6gcJVvPsd3VRxxpB0Bvn1
 TEGBjTGu8ch316Ye7LFeNNLrN2X/B/jHj21Blv+omREH7mJntNsUUwb46TDPjUBU+JZT
 JBTsmDRO5+cGRsXtDV1q1VVW+0XKuebO3uQMVVLGz+wzY7k0fOxjyvzjB1o3UXFNsPj0
 f1CSTQrqoS9XU2gPRY9mUeR/rLOFAvji5DLaJYO9zhkBmZd1Te01oeXNMFno8q6WKuhz
 RYgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD4YEltm5V1MFLI/0gNe7tlQNT2+D54NWuxfpODGE9yyc8ZvL7ttjNGsL0NtF9CEWonANcW77tag==@nongnu.org
X-Gm-Message-State: AOJu0Yy/6iG/d2BZiNpL824vbxpMFSW/wU5H6gGqwxyXPWZINUsOze6W
 QGRe9OCjhH7+BfefG4LDng4RHtiOIrV3QianhgnERlmphaBIj8/WGgfEQFdPBLsZV3U=
X-Gm-Gg: ASbGncuwuSxLvO9pjCEL502px71AHdK010jMDPdfERzivNbW6Cx2T/qhPK3QImL0uZm
 6/9xPTYEOfxVW9WmqPNNirwE+EO6fFb1fZRg4pIrlZSlIpfRF60VGlmwpuzEn+GGXbEqIy/exPJ
 zs9ZXctu3OhbGHbq1a7hrwlIHIz9T29dUvZRft/BNqGskDiy0NUHZ9xq2yjNyXdVjI0tI4V7yMn
 YFz1Go0Ydgup+JeX3vYiItgfNlbhGAUcPczgoCvy8iIN6e1jXBx2j6Y8sloPcnOQfcS0/+zZK5z
 wKLKhpOGSeL9x7vIrYh2Pin/A0FVujmx1UWs6d09eUrpGJIImHONTAWr2DQXbHGT8wgcAzaq3EW
 /JHplQG5DZOGOH9qRmtw2xH6IP0xVPasiJ/4l2L+tLOofHT+BPHn8hu+RAryw9G9ZWYD48ScpVM
 jz
X-Google-Smtp-Source: AGHT+IHScl1KSy8c6rgO/fZq1i52I8Tb+tOJ0kvl4c72DlD6QicoGVNLCVHONIw9rIcPPOjYu4mJTA==
X-Received: by 2002:a05:6000:2508:b0:3c7:df1d:3d9 with SMTP id
 ffacd0b85a97d-3c7df1d0518mr13968837f8f.39.1756419031814; 
 Thu, 28 Aug 2025 15:10:31 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf346811b3sm794670f8f.63.2025.08.28.15.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 15:10:31 -0700 (PDT)
Message-ID: <5ae93843-0059-4077-8158-6fd272f2e10d@linaro.org>
Date: Fri, 29 Aug 2025 00:10:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/47] hw/arm/xlnx-versal: VersalMap: add support for
 OR'ed IRQs
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250822151614.187856-1-luc.michel@amd.com>
 <20250822151614.187856-13-luc.michel@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250822151614.187856-13-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

On 22/8/25 17:15, Luc Michel wrote:
> Improve the IRQ index in the VersalMap structure to turn it into a
> descriptor:
>     - the lower 16 bits still represent the IRQ index
>     - bit 18 is used to indicate a shared IRQ connected to a OR gate
>     - bits 19 to 22 indicate the index on the OR gate.
> 
> This allows to share an IRQ among multiple devices. An OR gate is
> created to connect the devices to the actual IRQ pin.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
> ---
>   hw/arm/xlnx-versal.c | 63 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 62 insertions(+), 1 deletion(-)

Nice.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


