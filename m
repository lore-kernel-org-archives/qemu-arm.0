Received: by 10.28.4.212 with SMTP id 203csp2067080wme;
        Thu, 3 May 2018 09:00:12 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrwYiXrwceyGwJtYVgwD9kmB0pClNRLRyNAnhsoAZ7/h7z8yQxwA4/s4fnehi2bcelptZ5T
X-Received: by 10.55.169.83 with SMTP id s80mr19132744qke.157.1525363212004;
        Thu, 03 May 2018 09:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525363211; cv=none;
        d=google.com; s=arc-20160816;
        b=SzZz6AaP2XjAZPBC1XhKC6xVFSUGVCm8nfB0WSZxO7t6Qtl3gomz2/loI7QRHiOi35
         DCBqX1lfUOPXLQiDgoP4eGp1EYYs4kYFO4VBQrY29nIpOk86wFvf+E80EWCUqLt4t3LW
         DpqQ1ywYi571ik5DB13mUCvmUFS2JVyhwj7NN7ycA5WuFxifBEqGENiIKWjiULEtJC1N
         la3TlGFcH6HinNTC9iyit2zEGEde98fEN5I9iNsE0Z5UPJlUIRxAVo9TrNjxly5ta+uW
         jZb3f2qbRqw1NMfuPe49dfflmoEv22wsbDlJVDy/UkY1NQeBHKL9eRL25s6bBMW1assK
         XhaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qOwsGiaGeWERiNP74Fq2ZeknYr7CK1kWTHC4c+y4Sro=;
        b=tOXYcmN3S6RWr+FewVivJBiU3zvwFIYu+rEu/ZysueD4vqBr41vwdpOY1+GZYNKWqi
         Gdy0fGiNWsgNdaugS+2RoCGeOKVcgb6w+gBXuaHm1Ce3G4RFSOEsjcYhR/VJCtwaJ7RY
         M7Jeo/PZGfLN5kymskcmQ0XaV0cXM0l2dAwk+3V/XsbVyNUwFetDTEJneBOS/iKFYG1C
         kA9f3M+/pcPSHfuGzAYkoCyHoPAHYIRzExdu1hcqqy1LXJztbQnsEjWSLyI4HRBaS5n5
         1Tqfnw1m2ureL/ff8LCGxWecSDw8l59kEMvelL6k1Hd+4lRvWr32SmSEATvmV+xyyARK
         t7Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WEyyYbsx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q46-v6si3021982qtb.16.2018.05.03.09.00.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 09:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=WEyyYbsx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57419 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEGeR-0000HJ-Bs
	for alex.bennee@linaro.org; Thu, 03 May 2018 12:00:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fEGdj-0008UZ-8u
	for qemu-devel@nongnu.org; Thu, 03 May 2018 11:59:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fEGdi-0000If-Bm
	for qemu-devel@nongnu.org; Thu, 03 May 2018 11:59:27 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:43948)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fEGdi-0000IE-4G; Thu, 03 May 2018 11:59:26 -0400
Received: by mail-lf0-x241.google.com with SMTP id g12-v6so26732891lfb.10;
	Thu, 03 May 2018 08:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qOwsGiaGeWERiNP74Fq2ZeknYr7CK1kWTHC4c+y4Sro=;
	b=WEyyYbsxwe+Lfo/ScJ+tsVuI3r8PcWj+15iyAEC1PRkgbuFbbqelhYhDxihRwvnvKr
	xE0YtKLnFhL9vUUi4vhRiTeOWdf+Gv+IvZwPSwQlq6Bwt1DS3NxbyBQqvqV2ewwVnqyJ
	VAPmVfiZ0fBPZgaGcnlmENn6T7gyUElXzSibpUsqRMuyFxZJshQUi2QKdspIWW4tZ2ju
	JRXZtBXZRW0NbWUsMFnq+ax4ahkwxL7bBYfjr0LVJA+Ez1JJvo0rHT/Ge2/VXDEnrQ5O
	v8BairnZQ8bV2bJBfYesU8GaZ5kKzjMTULIVGZlML8+kFkBgPkVXxgjOJvCSQCuYAvSH
	uxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qOwsGiaGeWERiNP74Fq2ZeknYr7CK1kWTHC4c+y4Sro=;
	b=dHsSuyB9xVU0O3PlG64kH0kgyFEdCU09MzXkKNecQgeSAZnqoCa77E6uaOXL/13Acx
	7Nfb6Pm3S6/Cvedv2joAC3bhc0RYjbLldFNQ2tyd3rxmrV6NRsEsKJMZd5FiY1NDy9vz
	VZjNTFJrQEbTI7SAzLn9dwnYCDUglLg7SuZqP5/JOjP1VHDf7PgguCBlH+MpYwq1NVVa
	9jQiJqttHisVBvEt+zftflTLFTGBt+tymAtRx/OaxizRXW6CbRo44008wfFvVg2tc01b
	qRXJ7oW0h+L4KIIy2JGQ9zPi3OlgUoFu9ZcdLP5kzSj8jMyyjb4eNn0oqUIBiMbPPj2H
	KftQ==
X-Gm-Message-State: ALQs6tC522wvAitdIG0L4TXaKuPLcS1bzca7lyVX1SFF3v0y+256IZr1
	y6BoNRm7AcOeljzyvdNvCW2b+44Hf3e08iU5w+c=
X-Received: by 2002:a2e:300c:: with SMTP id
	w12-v6mr10155688ljw.98.1525363164703; 
	Thu, 03 May 2018 08:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20180503115620.10596-1-edgar.iglesias@gmail.com>
	<20180503115620.10596-2-edgar.iglesias@gmail.com>
In-Reply-To: <20180503115620.10596-2-edgar.iglesias@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 03 May 2018 15:58:58 +0000
Message-ID: <CAKmqyKPqbSg4S0WWpsW+zWEwKt9_unhz7j6h=ausRui2nd0uEg@mail.gmail.com>
To: Edgar Iglesias <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-devel] [PATCH v1 1/2] target-arm: Add the Cortex-R5F
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cyEOto3ybqbL

On Thu, May 3, 2018 at 4:58 AM Edgar E. Iglesias <edgar.iglesias@gmail.com>
wrote:

> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

> Add the Cortex-R5F with the optional FPU enabled.

> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   target/arm/cpu.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index d175c5e94f..7a7035c037 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1341,6 +1341,14 @@ static void cortex_r5_initfn(Object *obj)
>       define_arm_cp_regs(cpu, cortexr5_cp_reginfo);
>   }

> +static void cortex_r5f_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cortex_r5_initfn(obj);
> +    set_feature(&cpu->env, ARM_FEATURE_VFP3);
> +}
> +
>   static const ARMCPRegInfo cortexa8_cp_reginfo[] = {
>       { .name = "L2LOCKDOWN", .cp = 15, .crn = 9, .crm = 0, .opc1 = 1,
.opc2 = 0,
>         .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
> @@ -1801,6 +1809,7 @@ static const ARMCPUInfo arm_cpus[] = {
>       { .name = "cortex-m33",  .initfn = cortex_m33_initfn,
>                                .class_init = arm_v7m_class_init },
>       { .name = "cortex-r5",   .initfn = cortex_r5_initfn },
> +    { .name = "cortex-r5f",  .initfn = cortex_r5f_initfn },
>       { .name = "cortex-a7",   .initfn = cortex_a7_initfn },
>       { .name = "cortex-a8",   .initfn = cortex_a8_initfn },
>       { .name = "cortex-a9",   .initfn = cortex_a9_initfn },
> --
> 2.14.1
