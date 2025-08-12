Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A50CA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 06:11:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uliEK-0004De-JE; Tue, 12 Aug 2025 02:11:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliEI-0004DB-SO
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:11:27 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliE8-0003cQ-Oc
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:11:26 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-458bece40fcso26009005e9.3
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 23:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754979071; x=1755583871; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jZxFXwyVAxGG1bnmMAUvDfFmztF63vJO613iY8PdoSU=;
 b=VFCaTLoZOaPkSTKiIGngkcPeLGyfaGIEK5M193BUObZhIUGv5zUkt5w5VbOmFL7cek
 FUO8RAikrNiRDZPQYNKl/KxTh20XsDQo5sLP/WWUCrh8nXmdeP8uPzkjPErqbpj20nN4
 5IbakqsOXjWHSHtINRIdOryXVNXpjhEekgv/askdWZKzf7Upm3w0Er1bQIzx/lVPC/K6
 gYaixHhZprZvQ2W0YpE/5bbx4J2NTXY1mbKmB6EjsTl8M4Rvk5dgREePEPnNX0gFevHN
 2/+d0anM+TR7tDaDJoeZIq+7dyncg5a9d6t45s/Tahy/ZdAOY4pdVRmQSem1RjxSIjNv
 EBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754979071; x=1755583871;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jZxFXwyVAxGG1bnmMAUvDfFmztF63vJO613iY8PdoSU=;
 b=lleXrTnrDaIRmeHQ9ZoDBsGhVacmiAePCq9VXuAmZ48imafkjnt40OzimbRtTVEsid
 ddk5035LYg/gGxHWOWC8SrS9mlj9PhNTitHeWkhIr4FwpIsM//YTzoZtzTmmBaa1i0fe
 lIppFqDK5Gk58Vu+5Z7uam1/IRxL9fSZf3q1ezSz2I9kZ6S1a7/dyvits/bMTocr5Ls4
 +Ty+Y16iK4s8oo7UqQt7/jVYB8XNFXObzkhuNIqALxPSQkkabAPN3lBjdI1L8NofiCo1
 zi46t2r0QJRoo8LWxZSOkfT73FDD/qk5jagxOpvBTcRxIt2T3ywCjn2SaHWM+oJl1Yra
 WRxw==
X-Gm-Message-State: AOJu0Ywu1ZXj7nov+I/ZkWL4Ovw8N7WlQq1zwxIyXi06cbKZks98Sgwm
 4/UL3CIOU9ypTyz1ufWiCgNzMU/uf6HzMxQ77IdDcyfsKTYItcsqewwYtX9Ar0wcyHaf1eaEh72
 NCWu3
X-Gm-Gg: ASbGncvWk5XP1DI6b0J9FLfajIEFs6NphbJDz+6EZp75ZbA+1uXphOSUG9XXvHiJiuB
 CzcMmc2H9d6GtNLozhAJyyIhc8FiCZxK9p2elq3hHwgX+yBS5t8oTbIjpf9MlyuI9DPUJPqPO93
 iNXdu0EgBi04P5McvVa+tfx7sUnKou6zMPysbWUR54tZbPRVaLOIsmq8Y9zJhIRnylvinSpUxnd
 gL5ZoAOZ5PLmLtCWTQGDFn8vL4ukaVDOnda0F24gw9APq8h4MXBQhXvn/suCeu9WyW651Zz2avm
 aJIgHlzXbOkoYoDMA90m5gPDo2ki27raVvGnfB0r1B9VhVtHWlojcSZYJQtz4fh7O50oBKatN2T
 dMHuA1XNjsb+zLp/QINuCdYJdf/V9hFoMjdrdnKyXn9i+1GQjE9bJApxtkfp8gWP9/MqVU3wNNr
 VV
X-Google-Smtp-Source: AGHT+IGfe4sc30IPzDEb4NhPDkNnFSGJss9O+bDu53mu/wcQGZhp8157yjM8U1HWHlYL3OPh9DlQnQ==
X-Received: by 2002:a05:600c:45cc:b0:456:fc1:c286 with SMTP id
 5b1f17b1804b1-45a10b9bec7mr16601695e9.1.1754979071038; 
 Mon, 11 Aug 2025 23:11:11 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e58542f3sm279837095e9.10.2025.08.11.23.11.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:11:10 -0700 (PDT)
Message-ID: <0a422178-d251-4d28-b355-c617b588d486@linaro.org>
Date: Tue, 12 Aug 2025 08:11:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 50/85] target/arm: Expand pstate to 64 bits
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-51-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250802232953.413294-51-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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

On 3/8/25 01:29, Richard Henderson wrote:
> The ARM now defines 36 bits in SPSR_ELx in aarch64 mode, so
> it's time to bite the bullet and extend PSTATE to match.
> 
> Most changes are straightforward, adjusting printf formats,
> changing local variable types.  More complex is migration,
> where to maintain backward compatibility a new pstate64
> record is introduced, and only when one of the extensions
> that sets bits 32-35 are active.
> 
> The fate of gdbstub is left undecided for the moment.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/cpu.h            |  8 +++---
>   target/arm/tcg/translate.h  | 20 ++++++-------
>   target/arm/cpu.c            |  6 ++--
>   target/arm/gdbstub64.c      |  1 +
>   target/arm/helper.c         | 11 ++++----
>   target/arm/machine.c        | 56 +++++++++++++++++++++++++++++++++++++
>   target/arm/tcg/helper-a64.c |  2 +-
>   7 files changed, 81 insertions(+), 23 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 98360b70b8..7769c4ae3c 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -268,7 +268,7 @@ typedef struct CPUArchState {
>       uint64_t xregs[32];
>       uint64_t pc;
>       /* PSTATE isn't an architectural register for ARMv8. However, it is
> -     * convenient for us to assemble the underlying state into a 32 bit format
> +     * convenient for us to assemble the underlying state into a 64 bit format
>        * identical to the architectural format used for the SPSR. (This is also
>        * what the Linux kernel's 'pstate' field in signal handlers and KVM's
>        * 'pstate' register are.) Of the PSTATE bits:
> @@ -280,7 +280,7 @@ typedef struct CPUArchState {
>        *  SM and ZA are kept in env->svcr
>        *  all other bits are stored in their correct places in env->pstate
>        */
> -    uint32_t pstate;
> +    uint64_t pstate;
>       bool aarch64; /* True if CPU is in aarch64 state; inverse of PSTATE.nRW */
>       bool thumb;   /* True if CPU is in thumb mode; cpsr[5] */


> diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
> index 64ee9b3b56..3cef47281a 100644
> --- a/target/arm/gdbstub64.c
> +++ b/target/arm/gdbstub64.c
> @@ -47,6 +47,7 @@ int aarch64_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
>       case 32:
>           return gdb_get_reg64(mem_buf, env->pc);
>       case 33:
> +        /* pstate is now a 64-bit value; can we simply adjust the xml? */

Please add a similar comment in aarch64_cpu_gdb_write_register(),
to not forget to update the returned value (4 -> 8) when XML gets
adjusted.

>           return gdb_get_reg32(mem_buf, pstate_read(env));
>       }
>       /* Unknown register.  */


