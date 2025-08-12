Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD22C87FCB
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 12:16:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulnud-0005Hu-3F; Tue, 12 Aug 2025 08:15:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ulnuY-0005Gw-7Z
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 08:15:26 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ulnuQ-0004Fg-DU
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 08:15:25 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-24099fade34so38713345ad.0
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 05:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755000911; x=1755605711; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Bxrg56B2/1q5rYYI/G2b6ZimfDVJ2Y7Pz0uWdUj5Bg=;
 b=GVsUaD9TEisCJuuJ5Tv1ZGgMnXWcwlBtAy3VaDNqrfvWW8cNNmSmMoqD0N4gtZNZHW
 VsnVR4k1DnDRzoJZ2n6mPzyWiJ90XJLeHB9U+hooMJtbIDlSSmE0y9JBpKUDqcRAsHbL
 WURXKrGX9A2sRVKEX4dmLnQqJSCU24rA+UwU0tgxpPrNhxe0xiKNh4i/y3NsC2lVhYFS
 8GOqGVPh5KdY5W7TCUy8xgkFHlvVUUQss1U81SGJ+J/879XuR37E9QzTROEcRO+KfDiZ
 xpkNUtW9taJW1CcDeHAK1IhJFxAvJ7L28BgB+C5ROg/a+LjgKA74TLgnhziHT6PZ2QA/
 nB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755000911; x=1755605711;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Bxrg56B2/1q5rYYI/G2b6ZimfDVJ2Y7Pz0uWdUj5Bg=;
 b=d7K1QTRuNCkjHLQaQ0FwCBuJQvtqEnpnDg0z3NsyfaDOroqfqx/lm9HP0Sdd58TEg1
 BPsl1ZQBMNIa+KOFVwMVruOISeuBB6y/ECORTryl2NKPFZy+9rzwFHMzF1QkDdvs1qu/
 2v+TIW9z2JdHssw6gN3mPeijWSCIqgPhRbACwKkYKno6WaliG7XZ557UKll/GzVtsAXk
 6xgKXEXb/L3ofjd9MYQPfOy4i/mtWU/TAvdpH/0OdO7HXCUsGRZGuJZyJrTrZYWQKY3q
 oQ+9dPAPmE5lolPyj3qn6z2Db0PObfeu1Cyd5GUUiEkB7Rq493Mgd6CXtQ2uI6yMiLpM
 /L2Q==
X-Gm-Message-State: AOJu0Yy+xx3GxwQ+brWlqWPYj+nLlwPQiTCQr4+kNZnVMSFhgharqAXP
 52YoulYvNHSStbk5Buu4EX2TCd11qgkF6Axj42Ai0UmnHPAIBI77Y5uOHOixV5oez/4=
X-Gm-Gg: ASbGncvsK2VoQRqqBAaLRZzLhUFuR+pFhOHdigAcyJtoczsmVJwymyQf537b++THPGC
 Q1Z/m7QLTUWGiIzvbAkPsIf8Zr7aOx1Ugk9MB/VSYFTPyRrKEncwPiWCxXwThp+DEchvYluurfJ
 ZjGcRSq6sXtvznTsja4vekl91veRVT0gy/HSCU3jZQw8ZFruVd+ZQee3ijpuVCN+VbRS1mQz86N
 41gQoW0NZb4k/L7vzhrVZhUBhmyhi2V2EvZmR9Tlnx33sMEh4i5uE1kKMHAAuM+it/lO6iu77Ed
 oJRWx/gPGOEL9NcbE5abgqHpFl0Ag9OAssSEC4wNX6UFdE2VRBNNWyyBehHY70ZKNLKGyrwdTPq
 hVCSg8tjmY9D/NI/hRy/8OXekbNHZchnIvbPGDIXF
X-Google-Smtp-Source: AGHT+IFgEEPe1PYImXF6BdjNXMF+vuKs+96kB+FXLsF9hCy3+s8nYPHK1OoZI08fRo0TXTkFhTwKaQ==
X-Received: by 2002:a17:902:f78b:b0:240:66ff:b276 with SMTP id
 d9443c01a7336-242fc315e6amr49899765ad.31.1755000911106; 
 Tue, 12 Aug 2025 05:15:11 -0700 (PDT)
Received: from [192.168.4.112] ([168.140.255.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8976a48sm297685785ad.104.2025.08.12.05.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 05:15:10 -0700 (PDT)
Message-ID: <d7e55a44-03ef-4d13-9705-a743921138be@linaro.org>
Date: Tue, 12 Aug 2025 22:15:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/85] target/arm: Expand syndrome parameter to
 raise_exception*
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-24-richard.henderson@linaro.org>
 <3abbb8de-bbe6-4404-9714-50b487c46a8d@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <3abbb8de-bbe6-4404-9714-50b487c46a8d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On 8/12/25 16:26, Philippe Mathieu-Daudé wrote:
> On 3/8/25 01:28, Richard Henderson wrote:
>> Prepare for raising exceptions with 64-bit syndromes.
>>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/internals.h     | 6 +++---
>>   target/arm/tcg-stubs.c     | 2 +-
>>   target/arm/tcg/op_helper.c | 4 ++--
>>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> Maybe re-order with previous patch?

No.  With this order, the destination is never smaller than the source.

(1) Widen env->exception.syndrome
(2) Widen raise_exception syndrome
(3) Generate a 64-bit syndrome during translate.


r~

