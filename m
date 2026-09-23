Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D946C9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 17:30:21 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9Qml-0005ld-73; Wed, 23 Sep 2026 13:29:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9Qmj-0005kj-7N
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:29:33 -0400
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1x9Qmh-0003NG-JL
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 13:29:32 -0400
Received: by mail-pz2-x10.google.com with SMTP id
 d2e1a72fcca58-8686f46e4adso852840b3a.0
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 10:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790184570; x=1790789370; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=ziEWh6Dg+Ckid0U+Ykz1atD92kwnbf3RzQPVPp1TOUA=;
 b=aUUpa2CVaNHWWAai3SrrwRGn4O/V2WLUD73coQk/EkhJIZS7B9SJeyrJBtSyxVfDjj
 Wh08EN2y2NYiT0VdV4YFPcGWZvT+n08f+MkkIFioBdEhrw+xHJA1Ns0qw8P+Vw9F4t1K
 VzZJViiHy4pQAmCjbSzFaGpd+X+hzX7T+d/l7yYms0OVMiY1MJvG/ryqq7y8s4NePQNo
 p9hqSeaPdP/U9TmK/lquj22OvValUygf6B3dMx6eD+JEXM55a/JGgdrbF+Emufe+XcbJ
 V1wbSZdRttIIs/w6c4yiR71uGdxdop9b40CyCtT6MQm2lDlRqZIt0t8P5joSKoaMDdPb
 xf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790184570; x=1790789370;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=ziEWh6Dg+Ckid0U+Ykz1atD92kwnbf3RzQPVPp1TOUA=;
 b=sqVVyCo6xkgXU05Zgael5gryKm+69rTq5GHkLfoEwOzAzp0HVPQMjz1RKnpYUM4Jf0
 wuL8kRKjZmy97SDVtrdhC8q1ZUCAXovMiv0CnTOPEb5TA8WkfYQ2KDxtje4y8Ffv0EvP
 B3/WgmNn1UZ5EnGa64cW67ee1MLaCVWCrB4Ax20H01f1b3RAZ72vZX6V6AAmXAG8PNpX
 WMIqBLxzG1CSD7v1kkR6Xe7DJBPgGZVgrgA7W1BRgrSl/gigudsVkk/BJ2DQDkdueeuO
 IfUf9JGNxYjt/YRhpg+Of5tEfmDeYVPf7p5l0xnEg/bvKSW9r5v2ZduJuK2l9tNlNh8+
 amoA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwhH9LwMa6CLvp6JvgjQ82TiqlBuAOC0atlwnPeYoN6KLlr0RmMqUfKV8IOv1B8lY85ethfm0oO7g==@nongnu.org
X-Gm-Message-State: AFuF++lJ5RrCFS8Jlzz7swu7774XTQmNHvukWyKFDspkcgPIfgDQOMVP
 tVCVhEULVRIKIwHiSclmgYcF9wzQk8N7iqk9t/gmtrohR+r7iOAmxqHikTZUSQD0lG0=
X-Gm-Gg: AYBFou0HynmmZiGko0jY9BZtzyK2MZB/DGPBIEmXrT9HHfyKL0ZvgDSku3XCfwXZ/kZ
 g1qy7YE+XEnNtFffXqRP4BOAZZYwfhkexYdhBnKL+071ylKy1mAc5cK6AePcYOAL1p7JLLzr7x1
 m3Xcr8vuc90dd9+vJ5C9nBUeATBWIEWaXesD0Ddhq/w13dzEf094/JZT6a4+5i6WOwfflMcps8S
 njAv0C2msT/1QCE1wX/ysGRUvzsUFXshwX3ayf+qt9gfK1aeHkRAv6ZAGVqT1vdxb0HKJynkPxS
 ZZSd3C8Kt6sAJgqbOAsYGEfztt4ZiSpdV6Y0ByCixtVjz7PiYSOM5hBOkXm/SzfmqdjzCjIv62L
 rI7uFJgB+LdExoPj6YzXPiNOCV1O1IDyB/PhdJIp9OlvfeYX4tnuDT5n4RogfVPK437pJCMi2yU
 xy8Qtr7uDUBypedijVUZp1j3X95I/yoTNGKGRNqva1WA2g6PNjix4g/RXI2trzQWiettbBNxUNw
 ZFAZq3NIZwWdwEfQkDqrO8LNeEAH7Marf+8hR2c
X-Received: by 2002:a05:6a00:3c86:b0:871:2152:980e with SMTP id
 d2e1a72fcca58-87d1abb5128mr2637011b3a.23.1790184569673; 
 Wed, 23 Sep 2026 10:29:29 -0700 (PDT)
Received: from [192.168.0.4] (174-21-68-150.tukw.qwest.net. [174.21.68.150])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-87d1d4c483asm1695227b3a.21.2026.09.23.10.29.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Sep 2026 10:29:29 -0700 (PDT)
Message-ID: <70b6f5e2-44cc-4ab7-a279-ee8c5c51f43b@linaro.org>
Date: Wed, 23 Sep 2026 10:29:27 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/21] target/arm: Access halt state atomically
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20260923171116.31276-1-philmd@oss.qualcomm.com>
 <20260923171116.31276-10-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260923171116.31276-10-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:3b::10;
 envelope-from=richard.henderson@linaro.org; helo=mail-pz2-x10.google.com
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

On 9/23/26 10:11, Philippe Mathieu-Daudé wrote:
> arm_cpu_has_work() runs without the BQL held and can inspect
> halt_reason and event_register while other CPU contexts update
> them. The WFxT timer may also consume HALT_WFE asynchronously.
> 
> Use atomic accesses for the halt state, including the WFI/WFE
> and halt-exit stores. This keeps the halt/wakeup protocol
> race-free and matches the atomic state transitions used by the
> asynchronous wake-up paths.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
> v3: Dropped rth's R-b because of HELPER()s call also updated
> ---
>   target/arm/cpu.c           | 7 ++++---
>   target/arm/tcg/op_helper.c | 8 ++++----
>   2 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

