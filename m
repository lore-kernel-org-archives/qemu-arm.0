Received: by 10.25.221.202 with SMTP id w71csp810881lfi;
        Thu, 3 Aug 2017 08:48:33 -0700 (PDT)
X-Received: by 10.200.41.247 with SMTP id 52mr2709154qtt.0.1501775312972;
        Thu, 03 Aug 2017 08:48:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501775312; cv=none;
        d=google.com; s=arc-20160816;
        b=rGtUhVF212t5TbwZZzDS0UWftGZ/XtrCxlActodvLc5AcmrzaHTkdvPIgEnZBdY+Hn
         l7JGofs2EbPnzA+MvKLKFnW64ODZyEbhwmYv7UeENfCEy1twHt5sMK8ywMF5DRWV+bi7
         F1PfQrDp8mI2Xg20x3ro/jt2Xp5fXQ6Hvvc/7BBqJ/9ZCOpp7ai7b6i24smUMzPdudjQ
         FrfEOZGy2W1poaY9Poqldd4/SiAY2FrXZ4KXUmFIiQU+yhPwi+5bfAgBZMlFg7GQVnO3
         rK+6MK4Dqv8j7dYomaM0PWS2Jz3PvYdmqH149sJaKI7SEhgNsTCSAM8KUyw4bsafnEhZ
         IK/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=By+ktitLBlYVzyXwXh0VQbCZw/jIYlHESOXkyjqTLlU=;
        b=gYJep9QsEw5KN3VdQ34TroTOPyFi7perw6BB5AXXrfxQaSj9yNvfqymi111ys0tNec
         ePX61relNG8kh769bsmUE/8+xkNxojDHvaBDPkh6L/mrr9yhFpCPHnuB4fcNMvpkYgyp
         sjnPBicyvM9EisLnJddx3ALUJVv/9F28/5cCYZ/J1+kN6ODhZ7iRyfB+WlVBldOJS+Hg
         RlLTwOV9+todObFB9FD1/CjUU/d07fSYLEWmEoOVuuaWUBSegP5KcKCoH4vcD68kYBE4
         +qY3q3Qh/ARFf2x8GRqjXOXgAE4CwzkCtGOWTQpI40JS8Mr6EFaxAaInqW3U4pCllOdn
         YEcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.b=OTQ8CfjN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v43si31815458qtv.60.2017.08.03.08.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Aug 2017 08:48:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.b=OTQ8CfjN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ddIMQ-0005ZR-AC
	for alex.bennee@linaro.org; Thu, 03 Aug 2017 11:48:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddIMG-0005Yu-4G
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:48:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1ddIMC-0002FL-7u
	for qemu-arm@nongnu.org; Thu, 03 Aug 2017 11:48:20 -0400
Received: from mail-lf0-x244.google.com ([2a00:1450:4010:c07::244]:36689)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1ddIMC-0002D7-05; Thu, 03 Aug 2017 11:48:16 -0400
Received: by mail-lf0-x244.google.com with SMTP id t128so1208187lff.3;
	Thu, 03 Aug 2017 08:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=By+ktitLBlYVzyXwXh0VQbCZw/jIYlHESOXkyjqTLlU=;
	b=OTQ8CfjN5tkToat7a5RgH8/2mkhHwmqk5NvNABv2mMLQk/oOeOvEZccBQN3qY8TkOq
	j5rXbpFMytoLG/s+Keu/y1FCNA7n/HQeQKWTGbILrwEc1oIk59SjYl3G5BECghqKvG3X
	5wLGg+BjvxjYJrvqM7SnY8/KekEb9r0UQvK3mxoSuYUTdSFwx9H2Ak1npEKCJuXjo8Ge
	7Gf1twuSs99d1KXwOO7tYLd7sHdMkJRA7nbtex6mk50jpFgrE6vKIoyyWybrFTC33tDF
	cI0TwWFLFZK+4w6n+obWcISVd/9GjtIrR8TylBpjcSHFvPYSqIGhLNPVaRk07C1RudY2
	qvxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=By+ktitLBlYVzyXwXh0VQbCZw/jIYlHESOXkyjqTLlU=;
	b=p3FbK+EXGK2RMH+RtcHFDMFqwxtVccj9G4bXdlnjfAvvunvX2kX2sG/JNMVpXFXE83
	p5poZWbuKLrH6OLEgZTehV2RqMSxb7efsdrbXjPs//eBPHhzkI4CC5NQ8prYp8e5tVlK
	LQLy7WUgtlrj5h+/uvjSKldvqnXydlFDj4393EsBzLGUNh6brGkbkJCFV1r19V9HAdR8
	seXwohYROpMY4jM6W2SBLAH2Czgto0pHu9M7GFM/KdhWcw38wBs87kN8IN6cYeD7QPvl
	GwU3NECwE2MagWxAOjG9USuX961xHOuUg6avgCopa8Y6nnw22I2i1EcDsqL4djFPx+RT
	h/Yw==
X-Gm-Message-State: AHYfb5jtNpvnCWnbkcUqcW7vDUOpwj3ypTwId3jTQkqqEukRep1g3qO5
	EV3gshuhXGksOw==
X-Received: by 10.25.79.4 with SMTP id d4mr819667lfb.138.1501775294480;
	Thu, 03 Aug 2017 08:48:14 -0700 (PDT)
Received: from gmail.com (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id 79sm464312ljf.8.2017.08.03.08.48.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Aug 2017 08:48:13 -0700 (PDT)
Date: Thu, 3 Aug 2017 17:48:13 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170803154813.GS4859@toto>
References: <1501692241-23310-1-git-send-email-peter.maydell@linaro.org>
	<1501692241-23310-12-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1501692241-23310-12-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::244
Subject: Re: [Qemu-arm] [PATCH 11/15] target/arm: Make arm_cpu_dump_state()
 handle the M-profile XPSR
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2ksPcB+05+S8

On Wed, Aug 02, 2017 at 05:43:57PM +0100, Peter Maydell wrote:
> Make the arm_cpu_dump_state() debug logging handle the M-profile XPSR
> rather than assuming it's an A-profile CPSR.  On M profile the PSR
> line of a register dump will now look like this:
> 
> XPSR=41000000 -Z-- T priv-thread
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  target/arm/translate.c | 58 ++++++++++++++++++++++++++++++++++----------------
>  1 file changed, 40 insertions(+), 18 deletions(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 3c14cb0..e52a6d7 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -12215,8 +12215,6 @@ void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
>      ARMCPU *cpu = ARM_CPU(cs);
>      CPUARMState *env = &cpu->env;
>      int i;
> -    uint32_t psr;
> -    const char *ns_status;
>  
>      if (is_a64(env)) {
>          aarch64_cpu_dump_state(cs, f, cpu_fprintf, flags);
> @@ -12230,24 +12228,48 @@ void arm_cpu_dump_state(CPUState *cs, FILE *f, fprintf_function cpu_fprintf,
>          else
>              cpu_fprintf(f, " ");
>      }
> -    psr = cpsr_read(env);
>  
> -    if (arm_feature(env, ARM_FEATURE_EL3) &&
> -        (psr & CPSR_M) != ARM_CPU_MODE_MON) {
> -        ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
> +    if (arm_feature(env, ARM_FEATURE_M)) {
> +        uint32_t xpsr = xpsr_read(env);
> +        const char *mode;
> +
> +        if (xpsr & XPSR_EXCP) {
> +            mode = "handler";
> +        } else {
> +            if (env->v7m.control & R_V7M_CONTROL_NPRIV_MASK) {
> +                mode = "unpriv-thread";
> +            } else {
> +                mode = "priv-thread";
> +            }
> +        }
> +
> +        cpu_fprintf(f, "XPSR=%08x %c%c%c%c %c %s\n",
> +                    xpsr,
> +                    xpsr & XPSR_N ? 'N' : '-',
> +                    xpsr & XPSR_Z ? 'Z' : '-',
> +                    xpsr & XPSR_C ? 'C' : '-',
> +                    xpsr & XPSR_V ? 'V' : '-',
> +                    xpsr & XPSR_T ? 'T' : 'A',
> +                    mode);
>      } else {
> -        ns_status = "";
> -    }
> -
> -    cpu_fprintf(f, "PSR=%08x %c%c%c%c %c %s%s%d\n",
> -                psr,
> -                psr & (1 << 31) ? 'N' : '-',
> -                psr & (1 << 30) ? 'Z' : '-',
> -                psr & (1 << 29) ? 'C' : '-',
> -                psr & (1 << 28) ? 'V' : '-',
> -                psr & CPSR_T ? 'T' : 'A',
> -                ns_status,
> -                cpu_mode_names[psr & 0xf], (psr & 0x10) ? 32 : 26);
> +        uint32_t psr = cpsr_read(env);
> +        const char *ns_status = "";
> +
> +        if (arm_feature(env, ARM_FEATURE_EL3) &&
> +            (psr & CPSR_M) != ARM_CPU_MODE_MON) {
> +            ns_status = env->cp15.scr_el3 & SCR_NS ? "NS " : "S ";
> +        }
> +
> +        cpu_fprintf(f, "PSR=%08x %c%c%c%c %c %s%s%d\n",
> +                    psr,
> +                    psr & CPSR_N ? 'N' : '-',
> +                    psr & CPSR_Z ? 'Z' : '-',
> +                    psr & CPSR_C ? 'C' : '-',
> +                    psr & CPSR_V ? 'V' : '-',
> +                    psr & CPSR_T ? 'T' : 'A',
> +                    ns_status,
> +                    cpu_mode_names[psr & 0xf], (psr & 0x10) ? 32 : 26);
> +    }
>  
>      if (flags & CPU_DUMP_FPU) {
>          int numvfpregs = 0;
> -- 
> 2.7.4
> 
> 
