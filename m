Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78F0606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 12:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rxbvcvWA
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMP9t-0002Ml-Pg; Thu, 29 Oct 2026 08:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP9r-0002Lo-8s
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 08:23:03 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xMP9p-00016w-Ma
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 08:23:02 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 006d021491bc7-6df5e315bd1so1487956eaf.2
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793276580; x=1793881380; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Y+y/ky5dwzEGW2bjtHs8iNoSQngyrtGr3W8HCpbUL7g=;
 b=rxbvcvWAwudSGg+iwm02kdl5JmJYHRlPwiUgdGzW52UdZSBjGt/AtHdBh5pdu6LlFg
 WJmB+a5z+xIS+5pLTPkSWm/43S2o8iYtulIYZnSawaowBIkyi4J6nTUaw015CZ3UVygk
 ukXz70hFCaXJi92Z3edkwRNbDqebiL/SmCN3/JUzrR2CDgdHElCduGvxBj2TT7dMQX0Q
 cXl081XLxGGIuXE95br42nnBtuk4CLY8E9rcmGtTwSnFYOdX0TvJvw5VhbqFeV7Aoecw
 uMZOj+zZXjvNlagVhdW3y6ZyELxz+UhKQeqMt9umi47Y51r3yuXiBajP4QZ3oeiRo2CX
 q9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793276580; x=1793881380;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Y+y/ky5dwzEGW2bjtHs8iNoSQngyrtGr3W8HCpbUL7g=;
 b=FE0X+/2eYurtbLF1wnNsZJiUopf/0HCh4xB6C1f+gpSyf/RVwlx4wo2QuEwrmf34lF
 6S9SQTvDyTUeyEED61WCyVT1dngEJmEFWNrhYaIRHmJicL696gG+uwnpjvxr5KOq8WPd
 DIyBOn65iqUSnPZai+JdGmNszUbj/dH9rMqQMOnVoz9mLS2AxYI8CXWuMaeuOeBpFyVJ
 L5uQgfAIyxsKNqIQogeHn1wyAzhLzOXFKqEkkR6JHwDsCslp/1QyeI+4K7bmoV/5Jy73
 kDS1Bb1Yed+RVi/iXSWxbJlAof5EgENpbMuzhn7BQu7JSPpthMZmJUdRzSyEApT8p9zX
 TSig==
X-Forwarded-Encrypted: i=1;
 AKwUvBx7dV6itDfWIeRl9VVMa6Rv2tYA6U8W63Z3RKZccA34//io+oGul3ha/eXCZ/xUmHizUY0C2P/shg==@nongnu.org
X-Gm-Message-State: AFq9FYIYlb/uo2lOzS5CZBPus3lUsMwBAKU+zXs9xoY9RJ7kJPpgBjNZ
 QHBuJXsC+An7pdXBfDageWF2c7LFHm9fhj38npa6Eu57HPqb5qgQdGXHGOkheWuv+58=
X-Gm-Gg: AYBFou024efyAvzaXvrqiGpQckMtUMIHcBjUVhYLtFZVjjUai+i6iKzkxA/VzgOw3fd
 R65oKbm9Q81sGQvY0o/m6O1E4kbYJlnduN6yvmdaVT2IxM1rxPvAY4xM5J9WWcWUKzt2cwoRKh9
 io3XyQfgtbamPb+Fwuwv1U2pdHphALsX4K2yLv7kkDOxpC00Hyg/cpUh1QNnc9e6NeKB4BMG8m0
 k36Brcg1nmAFLGvAEcxW9ccjAjUhY/XLYXo0GVFJVfO/jqlsODkk9oduueB0vaufm0r338qAShN
 uR8PwHBNZVQQsmanVMfHg5NIdbhvgcBBuEgCpCnwNwDMYzqcq2iK/XPi4n0H+NQIC7vOgCNu2Ix
 92yvAhat78w2H6T83TIGGeI+YV4phQjd7vqVCTUg4VnlxPrJ0FXD6oioJlN1aB/t+JNV5q6ZlUG
 PPneBcDIOgAM6b4bplkCsfqD+P0NtKI4cpOmMT7gz8AeIgtQdbxc+Y1AJTkxSs8pVZuAUxdzY9a
 YFLnESuxSOIrk6c1HXr5OV4pPo6kaMTGzS5BLSqN/H84n/ERg9XeBFiXIVXg6QL0pGjl99DgUR0
 P3VmDrwUEUuN2ELzo9jRJgc8QFTAPoTIdi6bK8aos1qEsi+hgoU3JPTKchw/Bd0xEQ==
X-Received: by 2002:a05:6820:f00b:b0:6e0:fb60:d5c1 with SMTP id
 006d021491bc7-713eef427a9mr3000823eaf.11.1793276580204; 
 Thu, 29 Oct 2026 05:23:00 -0700 (PDT)
Received: from [192.168.129.53] ([50.233.235.3])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a8b77abffcsm4949251fac.4.2026.10.29.05.22.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2026 05:22:59 -0700 (PDT)
Message-ID: <261d3c31-e08f-4bb4-99a6-cdb01cdc5171@linaro.org>
Date: Thu, 29 Oct 2026 07:22:57 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] tests/tcg/aarch64: Add vector immediate regression
 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, qemu-arm@nongnu.org
References: <20261028143330.6518-1-philmd@oss.qualcomm.com>
 <20261028143330.6518-7-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261028143330.6518-7-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2c.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/28/26 09:33, Philippe Mathieu-Daudé wrote:
> Run SVE/AdvSIMD immediate operations after an operation
> of another element size, at every SVE vector length,
> against scalar references.
> 
> Catches backends encoding the replicated constant or
> using a stale element size, as tcg/riscv64 did.
> 
> AI-used-for: Regression tests
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   tests/tcg/aarch64/sve-vec-imm.c | 233 ++++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/meson.build   |   1 +
>   2 files changed, 234 insertions(+)
>   create mode 100644 tests/tcg/aarch64/sve-vec-imm.c

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

