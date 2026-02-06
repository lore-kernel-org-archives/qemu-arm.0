Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453F3EB28C7
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Feb 2026 05:43:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1voEd2-0001sZ-Vh; Fri, 06 Feb 2026 00:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1voEd1-0001sJ-5y
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 00:43:39 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1voEcz-0000SC-6P
 for qemu-arm@nongnu.org; Fri, 06 Feb 2026 00:43:38 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-82318702afbso273019b3a.1
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 21:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770356615; x=1770961415; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gVaME0RIU2LILpNcHWzi9c4VVpcIV05WY4A4Fu9U0Jo=;
 b=rwH8n1jbro+0zcifaWPUeoKBIz4XDXPYpgcU0RGDZaAH6C6zekI1z4dSNkdoO+yi8b
 s1/CfoUeH6+QAn7WFmh3ZdYM3oyM2X7yazv9IlJS2bjVmFS0ZiIvTShBd7+Qd+NMm57j
 J6+LgyJERwfrGjA/r3Vui1b4iF8xtM0gZeZKLecse5yTFzqeSWFC+ztsLbbYgG9b2xu2
 nF2guY7+eCkrVS841Ed54tkbWtpOragZEmvos3WyRsXh3epYu+UDULZGp8rvYRA4XQqr
 1wXuur5tYXXoNGB9BZ1VWpCe+QE/S5dyXZ8i98hcXUjfqcHLw159nSCND5ItMvt+6sEw
 hj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770356615; x=1770961415;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gVaME0RIU2LILpNcHWzi9c4VVpcIV05WY4A4Fu9U0Jo=;
 b=BkGidlybS1vky0ueekiIrNLzbZjO5ERVmjHRrU7qHkv+H91lwfHoVrkvTejoSwvY8I
 nVaRfxrrpWHPO5887TEl6OnprFlGrK01Z+VbXTUYOdWXrZ84SKcBTkI9ZvRhV62FwWgQ
 miWw2KJz2a8ougGTVFqXGLzOOqrPEOpT7c3lHxPE8tgpJBKbVgDBzsPo/YBnBtWQdMWb
 7GrCG+JYl8YQxVGHiM4e4mH6q7YQaaWb93GdfUycShR4Tak+trF2yQQrFC0HNtg6LF84
 Xl/Gb8n1gZMF3q+KHEK41y+V2mAGnaJoHqnDXMhdyqOplzP1JDDHyEVp2QTJZ6HztNtZ
 +7ow==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8w+o+DTkjWXlGuIbYQdJJutlClWCwizRggzfZBEu9GXbB6Zhk4ieTF2mTSJhA3eLDrm6P/Nc38Q==@nongnu.org
X-Gm-Message-State: AOJu0YxwAVTgdz6qFRzg1Od3s79govYfCekloyjoQoE4uGTISu7/OBlt
 EAlt0c3aCo+DNPj/Pr1cFvqc+THklYZCZfyvn0CiGxx5pTs9j0D79WqejdiOdAkFeNs=
X-Gm-Gg: AZuq6aKmexPCrIm4IG2NDNp2n8hcioyrQW9AidSzsaR/M1eT9X2AdVjarrHOyncFjSL
 0S9Ewe46VU5Sp9d22Hi9D7BOAgIsCVI4vZUWlUVUCGoLvm3A2Tqs2OillQ3LaX1mngTPxNHAV3L
 msaWf3axSAE92c7kx7XcFSboZb2PM685Unu9KEjb1truXARHOP5QqJVCSbBjWR8bfeFAz5drzaz
 d1nixEPG2sdC3wpzfHfrGaqhFIckWGDnM52l72gzIRsAox2Hqs9D3vdaBovRZ+8BgguG73iSdJH
 TmhDNNFcXfsGHajPxXCxuv2DOZuePeRzZhVQP2IQuDt6ntND7wIfDV6ccGaqgmPFjIbn8uFi+f+
 cYwkVuYBqK6SlKzuEqoVA3QR31o5o6xzNaSWDvV4o/kGOxCpMSO+6G98KNNP2fVyTaE9j1izGJf
 ZxtICEzqgRRPXUXKO9ByY3uxw5SUkc0abbZCLrxHZPOCLy/iN/UFmWkJVAND7e9rRaAETF9499D
 dnszfg6mKiNe75PkZlJA2WE4AAdDAFlXEX8ayQ/DQc=
X-Received: by 2002:a05:6a00:71c2:b0:81f:57a1:68f with SMTP id
 d2e1a72fcca58-82441753cc9mr1096947b3a.47.1770356615373; 
 Thu, 05 Feb 2026 21:43:35 -0800 (PST)
Received: from ?IPV6:2401:d002:dc0f:2100:1ced:e57b:71bf:567a?
 (bg30dhzpdc341w7g29yn.ip6.superloop.au.
 [2401:d002:dc0f:2100:1ced:e57b:71bf:567a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-824490442cfsm402040b3a.16.2026.02.05.21.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Feb 2026 21:43:34 -0800 (PST)
Message-ID: <ec74a8be-da67-49a6-ae93-7b9471563a8b@linaro.org>
Date: Fri, 6 Feb 2026 15:43:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/15] target/arm/tcg: Correct SVE/SME BF16 checks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
 <20260202133353.2231685-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260202133353.2231685-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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

On 2/2/26 23:33, Peter Maydell wrote:
> As with I8MM, the BF16 field of ID_AA64ZFR0_EL1 is set when the
> CPU implements FEAT_BF16 and either FEAT_SVE or FEAT_SME, so
> we need to have separate checks for "(SVE || SME) && BF16"
> and "SVE && BF16". Follow the same pattern as with I8MM:
> 
>   * aa64_sve_sme_bf16 means (SVE || SME) && BF16
>   * aa64_sve_bf16 means (SVE && BF16)
> 
> BFMMLA is the only SVE BF16 insn that isn't in SME.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu-features.h      |  7 ++++++-
>   target/arm/tcg/translate-sve.c | 16 ++++++++--------
>   2 files changed, 14 insertions(+), 9 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

