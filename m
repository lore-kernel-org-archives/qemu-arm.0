Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A58FFA1FD7
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 16:54:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFaqV-0000TW-9G; Wed, 22 Apr 2026 12:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFaqR-0000SP-Sb
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 12:54:36 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFaqO-0001QS-HV
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 12:54:35 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-48a563e4ef7so22182135e9.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 09:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776876869; x=1777481669; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/R4JUxI0x5y7vpWyLyEyIuZWveMbmO6xl4uXL6GDrQI=;
 b=wgnsCJsWa1daneXefXVheV5SiNd78lgsN3PVGHJvO1hNvBPicYcG2J2tUllV8XPIQI
 XIG21eFZZekBz8Mtw0eILLg0HKiw5P3bsPsR8ZwO4pWBB/j8dZT3dOLmf0bYGVBBU5SL
 uLLYzfpi9D0GZqGqQv7Y7Pm2oXGm6lPhKm6dihKnd0/rV1W4syFVXDronUqXlStoyc7O
 BkwhnkFX1hnq10Yb1xdRJZ0wAC5LQdBNRAeOZ5yAyQIKPrW5bl+N/Jiv3PGSeH0U7hzb
 NiBw4DU2947/Q01++WPoBWEgzfKNAFAMBFoBI1hJT3eB3nVUHmi8FsfXPslZ2HB4b0VB
 IyCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776876869; x=1777481669;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/R4JUxI0x5y7vpWyLyEyIuZWveMbmO6xl4uXL6GDrQI=;
 b=SDLO3H+yaSJv6YtKtDrplM0cgLO4mUQ8z/BQo2qHTh33szQnHOJBxncZvyAXrYhrD5
 gRoJVyjYePJufnU21U1AIajENtT+lm5tvpSdTTtvnL5+7NnAbjX8LP7yuSvwy1VRc1v/
 /vZl/kvVbgL7EjOhaueW3Pz60fZENzVVzjZY+3wrPuNcnl0s7rSj6PTgGOgJ/l69dfyb
 sON+Y/Lo88ImvYpwQ5Fca+fEYMd7qUIq20NvtdZvYDULABehUAADBmjETBovGc3LOVjL
 SU0x79Gd/+pEBBiNKOJDBPP0r9aJr+h2xCJAZHMOvXGSA6b+Fgf6VBNBxxhgLq7D4Fai
 BlhA==
X-Forwarded-Encrypted: i=1;
 AFNElJ94yLuZ21TDwQOd1AVMn4aRHOTa1LDbIJgKL3N3CRn7Zm6GB1JgfB+O92MlsZtyZO5gvRrcyG7QAQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx143kxrRcqAEjgHf83TZPB4A/i0LvbuKhRj/WQJAI/qA5DGyRd
 a6CH/kzN47afnRCuDZ7pbDdbaeuGUE+/Ap8Y6lOaqeO4rMyZl6LCP0gjutipQJh9Wn0=
X-Gm-Gg: AeBDieuwe98uTONp9EGJ4ffLG91k+D9BxXmplOhvnIo878Po5KLx6yfU3DugF7cmhD9
 rEyEXFaYx+h2/TTg+VHFStRE2eLLIPz2PZj0xrchGnPshS6e5OLuNvWqTpzSYJz4AN/QScgt8U2
 j1mTOjp8tnDfAFtCW1hfwD9GN6Rddmk5MnBSzMhVEkbjgiqZuUvAGjit5rXWY/XBa9gZu4P9UkM
 PEAN4qlV9zSel4vVOv0eI7IUoJp/JhOMwhhBMHvwRyrUpFRAgXOPHihXWGKvNOWEy6WA7yOb2Nr
 FuoN/3Rof0nlDKHM4uYn6rXZwnHV2gorCUhMyCWMfzrP6WMOsPHtRptHWDg3EzjSyFoBlfp0bNP
 g1aHq6ddTNIghSH+tdTB0mdIVUPJdzI7wzHpUaznRr12JdQ47g1Zbwa+vQo3tADCcJvjLVfRX/9
 5FviAKak9E8U5DrSwlyKw9FbpQ3TTmhMZc7gNSL6Enm3/4j+w8PtbYWDkwToZl/EeqfiDrpyk1J
 2lYbh6aiKhUHIA=
X-Received: by 2002:a05:600c:3546:b0:48a:5546:61a1 with SMTP id
 5b1f17b1804b1-48a554663d4mr123234745e9.15.1776876869171; 
 Wed, 22 Apr 2026 09:54:29 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb7a0c13sm145632745e9.21.2026.04.22.09.54.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 09:54:28 -0700 (PDT)
Message-ID: <c7d5c311-d010-400d-a2d5-3fb355cc5326@linaro.org>
Date: Wed, 22 Apr 2026 18:54:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/32] target/arm: migrate fault syndromes to
 registerfields
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mohamed Mediouni <mohamed@unpredictable.fr>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
 <20260422125250.1303100-11-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260422125250.1303100-11-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

On 22/4/26 14:52, Alex Bennée wrote:
> Migrate syn_insn_abort and syn_data_abort_* to the registerfields API.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>    - use !is_16bit directly
> ---
>   target/arm/syndrome.h | 87 ++++++++++++++++++++++++++++++++++++-------
>   1 file changed, 74 insertions(+), 13 deletions(-)

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>


