Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B040CA0EE4
	for <qemu-arm@archiver.kernel.org>; Mon, 18 Aug 2025 06:18:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1untCH-0002Ns-UV; Mon, 18 Aug 2025 02:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1untC9-0002Hi-8L
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 02:18:13 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1untC6-0007R5-KL
 for qemu-arm@nongnu.org; Mon, 18 Aug 2025 02:18:12 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-45a1b0cbbbaso25480905e9.3
 for <qemu-arm@nongnu.org>; Sun, 17 Aug 2025 23:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755497889; x=1756102689; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hQjPiFK/NCUlRDJasVDm1+ZRRFRuqMOgLkBCbpILOhw=;
 b=V7uwvsZX6YHZy275k/RS+VPW+5opuVAd01BsI/Lfrhn1W02JmuTgWXQyIwP4HL9jSy
 j5mUnvi8S5Md3lRiTrLbG8/2liWOx0Upp2DCt3oHHy1Nv4XRWQ0F3Pd2CWXUX66i/JK8
 8jECm7eNGA69pdFAshAj1/atrk5z+Bx6Gt4gJsGj3b2mMGCmPX4euis3eMsBxtYD6koA
 wT+UPk7PQWEo66Hiu81/vp7I73LTRxmKrG6oF+r+0szNE/mr/HOtFHTBQPyNNn+M5g4K
 oI+YjBNTvjJBfgYjLOpd4Hza+3lIobAe7HKCTh5CktfBQkXrBIlw9+leY04Ha2QqMh3t
 hKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755497889; x=1756102689;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hQjPiFK/NCUlRDJasVDm1+ZRRFRuqMOgLkBCbpILOhw=;
 b=o8ihDRL3ajw6s8TYmu+g6yfcaBvcrE2Qwb+Ob8MDcH3rDf3gqVZ69sg9XwQGLmScjo
 /9uTL/XE/lkHAp6BE2e0DOyhI/K64vfsDsqsIAViPzowSseqou57VZeS+/zDXqHflnaz
 rMBpi3iPzlmu12ktDNWx9MwJqnNTKdnxwvAY+rqGv72OElh6RX3aXJ3l19XljOK4ePkW
 Iljs7B+VwNuEAb0SzJJoGTXHS/i1Xo6EBaPoaV5AsYqEiiIxygHBNULotoNUJ0pj5rFp
 4VQNNCUJSj1xsFPUoOVYcPX4cyPA8hkHVgLu5Sz9XNr5qjp1pvCJTOWkohGHEr1jboEy
 5/oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUCJzzAfVhiE231a3K+1YCoczKnTv+kxfQ0NrmWiJhOoOKS4au6AOXnfnsLg+aeFl61xN7r+Y3kA==@nongnu.org
X-Gm-Message-State: AOJu0YzhgFJN1ediMgWvR36OBXH0Gs63m8sdO8PQBOrq2pSFEkkTwpC9
 h9XVPmUTJ+58KdwA1SWtzZvFIimr2NtReNCZlsNXDwpynn94HfgpWc8aMOn7zu4wz84=
X-Gm-Gg: ASbGncuNNnP9eG0qM2rmk+06NuZF+W1P2484wjMqGlYzGXP1tVuPazBHgzRiVgtwtla
 J6NDic6IIxTa129eZLdyxa1ESTsVMo23ppSbjRfhBY0cFgwmHKDZzPz+dhNz/qFC/Yx+oyBLOYL
 JgJ601p4OMZc8y2NP69Fe9DCm162qbuaNLAMCExWFyAgNlCBmARBHbNzitOGIRqxWEQAFpoRYVY
 XZZUOiD7aaNhyuh2opJ4h7zLm1InnWzw2DVIk1sVde/FMWmPQLOIJYLZacnY2KANatsKbSUZ7De
 doyYcW3dHlItewY1rnqhCmnYHSF1IL4a64rfbNhkGNgVK0xy0Kjz8yn3Fv+DT2gPLP5pCPBN4u8
 CJRqmIdu5ubjdHWRdfrdqoAZbGfzk747AhOkui6Yak+xxlMcktNSpb+/Ug/CPm4PaCQ==
X-Google-Smtp-Source: AGHT+IFbkhviztC1XRHSdB/uBbBenBHTlWdqcJVjykGBGW4AomZdE5cJsMOHNcpbJd+bfcQrlc+CwA==
X-Received: by 2002:a05:600c:3b20:b0:459:e06b:afbd with SMTP id
 5b1f17b1804b1-45a2185e958mr81252675e9.29.1755497888829; 
 Sun, 17 Aug 2025 23:18:08 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1fe2c019sm138401305e9.17.2025.08.17.23.18.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Aug 2025 23:18:08 -0700 (PDT)
Message-ID: <b4e7a5ba-fc67-44a2-b662-927e14cae5f2@linaro.org>
Date: Mon, 18 Aug 2025 08:18:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] target/arm/hvf: Sort the cpreg_indexes array
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mads@ynddal.dk, agraf@csgraf.de, qemu-arm@nongnu.org
References: <20250818041354.2393041-1-richard.henderson@linaro.org>
 <20250818041354.2393041-8-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250818041354.2393041-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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

On 18/8/25 06:13, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/hvf/hvf.c | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


