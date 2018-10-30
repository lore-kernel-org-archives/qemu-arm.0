Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp5630709wro;
        Tue, 30 Oct 2018 07:07:43 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dbF5oaiGHlfVuMzHas2QgGq19/bp17BCk34iIMlNga3vUVW9+sKZrwY43Puj31rrvH56Gv
X-Received: by 2002:a0c:f648:: with SMTP id s8mr2235582qvm.122.1540908463388;
        Tue, 30 Oct 2018 07:07:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540908463; cv=none;
        d=google.com; s=arc-20160816;
        b=Fw0o0XO1YwrT8vaXiA3op6iEhnjMBT1ppt8bdz4YAotLjqRwiWKiiplG8GV3XIGNjS
         4vlbx8l9XPXj/WT2KpP3bTLgu6QGfZV7CfyDHH0oEiPfItEvg446xPqqLv+amlkRaM1V
         ec2OgbbJgOloYHViDPwz+lvpQPgMHo1tXiMl7m2CGOiIdjZHnEUvTAeceeLxv0+9kStN
         DwJE1zAQ1jcV4R/TAEO9AvZVWhFV4pQIzGj0clkY42qLtHgUdM5bOMo98TH5lZ0n5n5Q
         WlDJEsiYkPeZztUGwmm2STMddd4rLSjElXAQub7NWmCOAlYO3oKglizNUUDWcPqBKgUc
         kIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=Y2vN2Ua0ciXBIwtA10W7sq+t6TUsUI2StkUIK2LLozA=;
        b=aph98eMGRPrpb0UsqLnhj8lJsnArjS+EFJsl30h/zSg5y7iXEPtKgMCfffQcye8wpL
         T7m4ak0Fw1bK6pRz2jz8YG34pm5yjK4wcUQoX5yZcSLY01uEGwjpUwCYHule0jVHJuu9
         5eGr4E7T7brxSfuWT1aDabeDi0ipwRNyWZGHzH5UBE+uQ2wMGoJH1Q/AHrNALRxQChk1
         VJxbYNe2I+eqhH3ZqTb174KPZTtijlXEV1aqVz+okw6r8x7WYp32e/hNb3FpGkRn1/TJ
         bBZKnAIcFnrH2vsLn8hxgwO7FEZwHeO+XkvCSA4gwAP0R/qAMi8RYbgqwUzl3d9q7vzL
         DxTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hYuPzebL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 35si3049826qvm.133.2018.10.30.07.07.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Oct 2018 07:07:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hYuPzebL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHUgI-0000FV-Ij
	for alex.bennee@linaro.org; Tue, 30 Oct 2018 10:07:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHUg4-0000EW-LS
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 10:07:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gHUfz-0000ye-Rn
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 10:07:26 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35210)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gHUfy-0000wf-LE
	for qemu-arm@nongnu.org; Tue, 30 Oct 2018 10:07:23 -0400
Received: by mail-ot1-x342.google.com with SMTP id 14so11203376oth.2
	for <qemu-arm@nongnu.org>; Tue, 30 Oct 2018 07:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Y2vN2Ua0ciXBIwtA10W7sq+t6TUsUI2StkUIK2LLozA=;
	b=hYuPzebLGSLu1R/tl71BOaZmgpYFIzqroE4XrqsLvoGgQ7iuPKz34QgyxCVkgmmC+z
	pkJyMcZKNB6xstyc4cNunAR+YbltaiW5tUrxNnMTJ4W/QJkeWu3i1yrwKBRLO8FS1sFE
	MW0VfLLeQOw2zRq9a4e6wvZGf/HUvAaHFS1WI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Y2vN2Ua0ciXBIwtA10W7sq+t6TUsUI2StkUIK2LLozA=;
	b=K5itySnPbB23TM17MdH+lysLdIBBs/mzyrWZY2FHbMuYgkdrOEeodE0uP0eFHq+1y8
	RVmLenWj2/GuV06T+Rmo/hi+j12WEDTJ8tlqu2EiR3EcwtSVIWAhdsFP5SNjkVGRXF19
	i8pXI79WLmggleZpOOK3T+cjMi8HgA0Lde0FDbkMZlDDRbdwEF8NdQ0sFDSTafGQgXLK
	wSwjI1oyIBYZbp9eFrUVBQvZdVPaTN/ZYfwshBsrcMm0R7maNhJVi9O/KAUYAIIFIkf8
	+GAAYxCOKxv6jiVAaM66nZp6mUoka3ST+IyZVhFsPufB6/6q/KLimIB0HgKzoHGhJm4d
	jRAQ==
X-Gm-Message-State: AGRZ1gJBjt1M0WBNpKb6E3fJ9N/IfDNrYp20T7Mv8yTE68QDTlor9mFK
	Uaa8WVftBmkZtkKTVm02iHNseLla7ZOko9cB4rbiKg==
X-Received: by 2002:a9d:2377:: with SMTP id k52mr11618642otd.238.1540908440373;
	Tue, 30 Oct 2018 07:07:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 30 Oct 2018 07:06:59
	-0700 (PDT)
In-Reply-To: <20181030114048.21527-3-philmd@redhat.com>
References: <20181030114048.21527-1-philmd@redhat.com>
	<20181030114048.21527-3-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Oct 2018 14:06:59 +0000
Message-ID: <CAFEAcA-4_fn19H9aCio4QKikdMBv_oicgWNrThCXshNJ3HOnig@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v2 2/2] arm: exynos4: Add dma support for
 smdkc210
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QWAf9FnXGdai

On 30 October 2018 at 11:40, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> From: Guenter Roeck <linux@roeck-us.net>
>
> QEMU already supports pl330. Instantiate it for smdkc210.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> [PMD: Do not set default qdev properties]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/exynos4_boards.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)

>  static void exynos4_boards_init_ram(Exynos4BoardState *s,
>                                      MemoryRegion *system_mem,
>                                      unsigned long ram_size)
> @@ -171,6 +187,14 @@ static void smdkc210_init(MachineState *machine)
>
>      lan9215_init(SMDK_LAN9118_BASE_ADDR,
>              qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(37, 1)]=
));
> +
> +    pl330_init(SMDK_PL330_BASE0_ADDR,
> +            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(35, 1)]=
), 32);
> +    pl330_init(SMDK_PL330_BASE1_ADDR,
> +            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(36, 1)]=
), 32);
> +    pl330_init(SMDK_PL330_BASE2_ADDR,
> +            qemu_irq_invert(s->soc->irq_table[exynos4210_get_irq(34, 1)]=
), 1);
> +
>      arm_load_kernel(ARM_CPU(first_cpu), &exynos4_board_binfo);
>  }

Are the PL330s really on the board and not part of the SoC? The
layout of the dts files in the kernel suggests they're in the
SoC, in which case they would belong in hw/arm/exynos4210.c.

thanks
-- PMM
