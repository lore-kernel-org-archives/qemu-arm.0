Received: by 10.25.0.144 with SMTP id 138csp817663lfa;
        Mon, 10 Apr 2017 04:35:39 -0700 (PDT)
X-Received: by 10.55.99.78 with SMTP id x75mr9516073qkb.12.1491824139745;
        Mon, 10 Apr 2017 04:35:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q50si13206449qtc.311.2017.04.10.04.35.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Apr 2017 04:35:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cxXbd-0008GC-2J
	for alex.bennee@linaro.org; Mon, 10 Apr 2017 07:35:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxXbV-0008Em-2N
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 07:35:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxXbU-0000oj-2B
	for qemu-arm@nongnu.org; Mon, 10 Apr 2017 07:35:29 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:32831)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cxXbP-0000nm-CM; Mon, 10 Apr 2017 07:35:23 -0400
Received: by mail-qt0-x243.google.com with SMTP id c45so9945379qtb.0;
	Mon, 10 Apr 2017 04:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Sw5RrT/2uP7owUxBbKRKwYqrLZGCYcH7a2IQG3xlhC0=;
	b=WY9IOs9ark6XO1dMxgBxGLfF6GBBWkZTMrEb0CsCIeD20+7l0hvYyz2BlK8RxeI6SL
	81nm/mXA3ejJzQAb+Jgzl6pOtXKXznMpo2bnWAQdT/yvTyBsWd19G9wsxOTSHhhFsq7S
	v943vaCRR/+y/unxy/jMi+X4qEybBnv63PJfBvg/BAhJGRPTr5XFv+pn3Yz9Ukk65mzk
	cQg9SUW9dkhM+PevUBawh0lNUwPD/uu2sXMc0YDpip8iYn7A5QN8MoGU/IVPfQtGuopN
	bgbVJAvtX2cyC7vxNmsbjFtplbZR7LYCTAvF1bzD96Hy24iy6jKbKkAFQpqbSqy60psy
	YN+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Sw5RrT/2uP7owUxBbKRKwYqrLZGCYcH7a2IQG3xlhC0=;
	b=k/X6XHx7W5CoAwfJTrdpq+Y5LEFvUVkMBup4HHy4mhxYQZHiY7UT7WacyJbYTxrUl+
	X/GUgoDwQ5+aflv6JyqnOOJTrieZY+mQmMZv2/xfcmG9GSXSOWxOj35DN5mGzrUdHd05
	QwBLG/PjTux4yFWnQYt2PO5esEznzLEnjdYRL5xFE1m0nQODslJGqkJEyaMeFOVMg/Qr
	jwoUjRMiTgovS7EOrvSNQTG97kM8sDPsSkuSo6fKLCNFIsuYdXgoUxP2gd7uP5fhZqT2
	iLam4p7ZhRDtcezxwfccNAdBH2YMbDAsigkljGtV1NSwBvmX9QvyI+yPkTtYg8u2anvn
	QExA==
X-Gm-Message-State: AFeK/H0w8sm/Ty6KZWiUQvsvF9oylMGH+VeX32GaEH9GsJgwdbhix7aqw6nQmqDRELoj9Q==
X-Received: by 10.200.38.132 with SMTP id 4mr54072476qto.91.1491824120819;
	Mon, 10 Apr 2017 04:35:20 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	e127sm8572251qkb.36.2017.04.10.04.35.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Apr 2017 04:35:19 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1491821097-5647-1-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <00c1e3ee-63fe-92e7-b5ca-1c7e08a59089@amsat.org>
Date: Mon, 10 Apr 2017 08:35:17 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491821097-5647-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-arm] [PATCH] arm: Move excnames[] array into
 arm_log_exceptions()
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WP45o2+LQCwy

On 04/10/2017 07:44 AM, Peter Maydell wrote:
> The excnames[] array is defined in internals.h because we used
> to use it from two different source files for handling logging
> of AArch32 and AArch64 exception entry. Refactoring means that
> it's now used only in arm_log_exception() in helper.c, so move
> the array into that function.
>
> Suggested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.h       |  2 +-
>  target/arm/internals.h | 23 -----------------------
>  target/arm/helper.c    | 19 +++++++++++++++++++
>  3 files changed, 20 insertions(+), 24 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index e6f05e2..ab86943 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -58,7 +58,7 @@
>  #define EXCP_SEMIHOST       16   /* semihosting call */
>  #define EXCP_NOCP           17   /* v7M NOCP UsageFault */
>  #define EXCP_INVSTATE       18   /* v7M INVSTATE UsageFault */
> -/* NB: new EXCP_ defines should be added to the excnames[] array too */
> +/* NB: add new EXCP_ defines to the array in arm_log_exception() too */
>
>  #define ARMV7M_EXCP_RESET   1
>  #define ARMV7M_EXCP_NMI     2
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 97ca034..1f6efef 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -51,29 +51,6 @@ static inline bool excp_is_internal(int excp)
>          || excp == EXCP_SEMIHOST;
>  }
>
> -/* Exception names for debug logging; note that not all of these
> - * precisely correspond to architectural exceptions.
> - */
> -static const char * const excnames[] = {
> -    [EXCP_UDEF] = "Undefined Instruction",
> -    [EXCP_SWI] = "SVC",
> -    [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
> -    [EXCP_DATA_ABORT] = "Data Abort",
> -    [EXCP_IRQ] = "IRQ",
> -    [EXCP_FIQ] = "FIQ",
> -    [EXCP_BKPT] = "Breakpoint",
> -    [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
> -    [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
> -    [EXCP_HVC] = "Hypervisor Call",
> -    [EXCP_HYP_TRAP] = "Hypervisor Trap",
> -    [EXCP_SMC] = "Secure Monitor Call",
> -    [EXCP_VIRQ] = "Virtual IRQ",
> -    [EXCP_VFIQ] = "Virtual FIQ",
> -    [EXCP_SEMIHOST] = "Semihosting call",
> -    [EXCP_NOCP] = "v7M NOCP UsageFault",
> -    [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
> -};
> -
>  /* Scale factor for generic timers, ie number of ns per tick.
>   * This gives a 62.5MHz timer.
>   */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 8cb7a94..8a3e448 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6271,6 +6271,25 @@ static void arm_log_exception(int idx)
>  {
>      if (qemu_loglevel_mask(CPU_LOG_INT)) {
>          const char *exc = NULL;
> +        static const char * const excnames[] = {
> +            [EXCP_UDEF] = "Undefined Instruction",
> +            [EXCP_SWI] = "SVC",
> +            [EXCP_PREFETCH_ABORT] = "Prefetch Abort",
> +            [EXCP_DATA_ABORT] = "Data Abort",
> +            [EXCP_IRQ] = "IRQ",
> +            [EXCP_FIQ] = "FIQ",
> +            [EXCP_BKPT] = "Breakpoint",
> +            [EXCP_EXCEPTION_EXIT] = "QEMU v7M exception exit",
> +            [EXCP_KERNEL_TRAP] = "QEMU intercept of kernel commpage",
> +            [EXCP_HVC] = "Hypervisor Call",
> +            [EXCP_HYP_TRAP] = "Hypervisor Trap",
> +            [EXCP_SMC] = "Secure Monitor Call",
> +            [EXCP_VIRQ] = "Virtual IRQ",
> +            [EXCP_VFIQ] = "Virtual FIQ",
> +            [EXCP_SEMIHOST] = "Semihosting call",
> +            [EXCP_NOCP] = "v7M NOCP UsageFault",
> +            [EXCP_INVSTATE] = "v7M INVSTATE UsageFault",
> +        };
>
>          if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
>              exc = excnames[idx];
>
