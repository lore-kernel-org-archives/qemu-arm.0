Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF0EF8E4A7
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 06:15:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDcU2-0005Eh-32; Fri, 17 Apr 2026 02:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcU0-0005DL-NE
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:15:16 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDcTy-0004cm-Mf
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 02:15:16 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48896199cbaso2964135e9.1
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 23:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776406512; x=1777011312; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GukCC62Ain8Ts8PFPTvU58zWf7+hRlJKZxr9+ckB/+4=;
 b=MBJnYiSd1cz33Ar0hO+jZ0VhwLqvTB8mKnOCANXKEX7ZUjEfCzB4M6vSWwuqqs9zxb
 RL59+XuITwQZ3LVyz7B/cgUFhB6nEgGicdZXM8arY5EzGq8pbvt2QYjlEfMHwpYpL+g2
 MnP1e8w1YM7Pj+NiIp9S2a5oTnBKq+Yr77cqc14kz7FRHTa5oqLabTonaCfTmaRCUBrT
 y/BwY6wfUNY6IAAx9egqmxpJSC66S2yPBPTVRIXHUkUR01csu2hM8ObwfuBGfg7rrUji
 vLvwAWq8OAi55lSVILQOYHdiRRsQ9JcrbWIT0cQIzZzmL4HpsJj8ta7tOUH5i8BPuU1K
 Cx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776406512; x=1777011312;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GukCC62Ain8Ts8PFPTvU58zWf7+hRlJKZxr9+ckB/+4=;
 b=XiwWGtFH3WJUEaFbpYPv522gGnlj9YbM3pnBhcXh1fWjWSlMGSTtacRAIMBT96x4nJ
 QuSQiR6GiRwdWg02Gq7gHXawbhzUcA92TebrzSSDqzB/vnzA9pG/FItH9qIQd0fRnnUL
 rga9+k7gwYeKO/omgpQ/QOrDbDRnpgetwhsPXGGrwV6cd5jG0BX2LrLPFfcf78LENX8j
 XInTYnh7j+0OPRCz8wUcQ0oo8i6QNypsd0mdkmc2NGcVTZ9dxFmZ04PN4xOA2XZ27swH
 /ZmFu9xWPmC2PQ23zKBXsMjftJdmdrSY0ifsL1ACrTdnyGJLz1xVnYIpjlD7ZNvkrCHo
 7k/w==
X-Forwarded-Encrypted: i=1;
 AFNElJ9/4orl1db+mg3OSFDNnEk9ZSR+UI3E7UkH1f8iRmgm0PIf2wfIwZWTXFXrv+p8cRdnvNd96wBYRg==@nongnu.org
X-Gm-Message-State: AOJu0YyRfzRglPYYQcK/+yjqiZuE8oGz8fc8SafIMXxU7t/Mjw4az4YL
 N7iUlhTA6J7mYqdUg/j32MQnh81MpCvvhKQ2FAEsychqQ9Yl3yIBWw4SMSvo2NHPMXs=
X-Gm-Gg: AeBDietUq++ibt8W+Cpdpb16wwzoLWZGXXBs162lN4fdsiNOoayqS5XvoVraQKlG8iS
 kNjy09WmH7ECgv96BtWjzjqGGuxoatE3RJpUQar9v1cdhxMQP3f/e1UsbSepTo+jjcw+Nt9zbMl
 gSGUCcWMwDdyTRb/TPPUcddfhVZSoORVRLX0HjgfdS1sP1IKkZShVMSuVTRLLGqIAmYzSDxkcS6
 ItV33mcBkXZQ3K75D1nAXynxIh4GbIT8w6LY+gz9z8wMThzeSerGKWk7H7AbsyOof8OTOoE8DBE
 vMXOZXeG9srS8gufNFdnJVgafF81SGxvfRolmy5xChFCDgosuMTswc7aGZf7beXod3whO3nRtnu
 Lp+vaC7O4ZRbXncmbRz2vvGxVyw3iom7ClNBx2NkTeukIUF3ePeGLLz/OOgrFAbTxCa2Q3uzaih
 pDEjIGlcM4VlUp3xWyQuUu/TtvD5HqMfzuHFEAGGQQ9Q046FbjdP5mJR/RV2esAWqkYKGdLw0zs
 ugba64hC5jmVlI=
X-Received: by 2002:a05:600c:c09c:b0:485:3423:727d with SMTP id
 5b1f17b1804b1-488fb78c1efmr13889525e9.26.1776406512400; 
 Thu, 16 Apr 2026 23:15:12 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb6e16b3sm12758585e9.0.2026.04.16.23.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 23:15:11 -0700 (PDT)
Message-ID: <a42e034b-3a70-4e8f-96c8-9fd70db06400@linaro.org>
Date: Fri, 17 Apr 2026 08:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/17] hw/usb/hcd-ehci: Implement 64-bit iTD descriptor
 addressing
Content-Language: en-US
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: Troy Lee <troy_lee@aspeedtech.com>, "flwu@google.com" <flwu@google.com>,
 "nabihestefan@google.com" <nabihestefan@google.com>
References: <20260416014928.1279360-1-jamin_lin@aspeedtech.com>
 <20260416014928.1279360-12-jamin_lin@aspeedtech.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260416014928.1279360-12-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 16/4/26 03:49, Jamin Lin wrote:
> EHCI supports 64-bit control data structure addressing when the
> 64-bit Addressing Capability bit in HCCPARAMS is set. In that mode,
> the CTRLDSSEGMENT register provides the upper 32 bits that are
> concatenated with 32-bit link pointer values to form full 64-bit
> descriptor addresses (EHCI 1.0, section 2.3.5 and Appendix B).
> 
> iTD link pointers are stored as 32-bit values and must be expanded
> to full 64-bit descriptor addresses when 64-bit mode is enabled.
> Update the iTD traversal path to use ehci_get_desc_addr() when
> following link pointers.
> 
> Appendix B also defines high dword fields for iTD buffer pointers.
> Add bufptr_hi[7] to EHCIitd and use ehci_get_buf_addr() to construct
> full 64-bit buffer addresses from bufptr[] and bufptr_hi[] fields
> when processing isochronous transfers. This allows buffers above
> 4GB to be handled correctly.
> 
> When 64-bit capability is disabled, descriptor and buffer addresses
> remain 32-bit and existing behaviour is unchanged.
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   hw/usb/hcd-ehci.h | 1 +
>   hw/usb/hcd-ehci.c | 9 ++++++---
>   2 files changed, 7 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

