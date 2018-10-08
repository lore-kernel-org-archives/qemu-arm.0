Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3436516wrt;
        Mon, 8 Oct 2018 06:11:08 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62FZ+kmX0Sh2E+ASEVcZ3QRLjIxg5mA+Uv+JGAqOZKop8cqWPxGbfe0vvSuolVzq+1owkEN
X-Received: by 2002:a37:9081:: with SMTP id s123-v6mr17680050qkd.164.1539004267913;
        Mon, 08 Oct 2018 06:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539004267; cv=none;
        d=google.com; s=arc-20160816;
        b=GhOOYotpZuNgH5XENFID6FMJmQ0GvMnagOxEzaq3NkFZ2AFBXHJ3GMEbLGtYd28XcQ
         OUa1dZzUZHTrsQX5/9N4tc4Guyygl+b/Y074BGOgnyplpTJPshmbtuK2KvraLZJIweOT
         lNSUrtsd3wwHl2RLGtqzl1BgVOfn3s8zEpw7DUtd+yrjpkdTlipU89Fv4eMJ4ZR9BIIA
         s9grvlSKqHJ8T7PE12nQ0h0yKlaHYrNXh8pGxHtNXAGq+76Hf3USvvqJc8ciziulR6Fd
         kFqRfBSmqQbbM7MpusMasa1KoRyVw7Cu4yAVZSRJC/VCi+lraJqlpY5HeGgZkhcS5rtD
         p3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=ySIf8AcIGkL1E8aTsaKZFXZWcbNgef5rDcwTOQ2RaHc=;
        b=ndkKfi913X9N/ECwAVjAenszsroSwop0Y9qTzSiOC8m7lKsVa6TGOk+6lLHbSKvQIb
         Sooqd7hVO/IqYaNsfQlmWqJkJaWE6hQTJK4A+FgQPvHF2YyfZxbuH1TyJ4ucVvYdj1BV
         Cf2up7D/Y7F1fCcP3rZYrhkId+brsenpTY9rSZsZvzKkgipnlz6N+M3UAFt6/E9MNUiQ
         a0IMxp5VVB2Gz59bpGWCEPuzu3oA0pcgA4BSxAqSjy4MXfvagN8G6dukXMrQXlu2206H
         05Ra+GUpbt1vMJXOE3/yBPqq4uvsS1uOSC+At7E9lTOcY1ZOp9rL7N5cTuFfJcDMrrQf
         OwFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e9K7q/Is";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n83-v6si2190487qkl.142.2018.10.08.06.11.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Oct 2018 06:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="e9K7q/Is";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46188 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9VJT-0005gf-Cr
	for alex.bennee@linaro.org; Mon, 08 Oct 2018 09:11:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9VJE-0005gT-Bz
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 09:10:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9VJD-0001ke-EA
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 09:10:52 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37606)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g9VJD-0001iw-4c
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 09:10:51 -0400
Received: by mail-ot1-x343.google.com with SMTP id o14so4012093oth.4
	for <qemu-arm@nongnu.org>; Mon, 08 Oct 2018 06:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ySIf8AcIGkL1E8aTsaKZFXZWcbNgef5rDcwTOQ2RaHc=;
	b=e9K7q/IsLfdW6zGDlbtfkWYPczi5FtscexcOHCcY173J4yuW970EVm2B4mDYlcGbkp
	LiHF0WdWdcURgeVAbcCKSX8W8AoUwuILOfgMxucZTUvl8/pxtWDyP/7xAEg3fQMKZSK6
	aXUew6myFFJtXYpWq30akrk/15jfQlKOvEFwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ySIf8AcIGkL1E8aTsaKZFXZWcbNgef5rDcwTOQ2RaHc=;
	b=RQmj7HSFIxrSlx3mlXH766Fnw4Jk4bLZE2oYS5j4e0PrcQB7uAZ5dAkdRmN1E8mjCX
	ZNw1bKx0ordFnlZqIkOcezxWc/JOULqPyY8TqvWxljrEGJ52T8/AxwaOfl66n50XmsM/
	8PdWoQ5JcY7BOqaMCUM8YK4DZl30sFyxqb2uMgEbH1PvnEFM+NrMi6osY2R/GiervitB
	S4VYb9twTGPBSZvZltv9fX840ZdL7lEM3vYHkTWHkPMdqErgdUsQBJmfdIIoS6tBqRTe
	e7xe0MRL5oN0W0rO0os/3nT2a47C7wEcpD1JaEp8TpLSY6IOcJIt9fCfonl6uCSw5ExL
	JcBQ==
X-Gm-Message-State: ABuFfoj4/xlSTtnrMZLTQZvFz1KvPM7+v+PWYV5HmJzWWb17TU6aXenA
	VFGA4Rbw3eP6u4W4EzSnZRm4kmTk51Eptkqb0/l55A==
X-Received: by 2002:a9d:2377:: with SMTP id k52mr14012829otd.238.1539004250307;
	Mon, 08 Oct 2018 06:10:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Mon, 8 Oct 2018 06:10:29 -0700 (PDT)
In-Reply-To: <1538579266-8389-11-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-11-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Oct 2018 14:10:29 +0100
Message-ID: <CAFEAcA9b4O4HrMwNTgbZ7JYdO=S3dnzC8ayabBEpKY5=DyBMog@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v1 10/12] target/arm: Add the Cortex-A72
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M9ZXWMgqZ941

On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add the ARM Cortex-A72.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target/arm/cpu64.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 800bff7..02e500b 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -218,6 +218,64 @@ static void aarch64_a53_initfn(Object *obj)
>      define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);
>  }
>
> +static void aarch64_a72_initfn(Object *obj)
> +{
> +    ARMCPU *cpu = ARM_CPU(obj);
> +
> +    cpu->dtb_compatible = "arm,cortex-a72";
> +    set_feature(&cpu->env, ARM_FEATURE_V8);
> +    set_feature(&cpu->env, ARM_FEATURE_VFP4);
> +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> +    set_feature(&cpu->env, ARM_FEATURE_CBAR_RO);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_AES);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_SHA1);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_SHA256);
> +    set_feature(&cpu->env, ARM_FEATURE_V8_PMULL);
> +    set_feature(&cpu->env, ARM_FEATURE_CRC);
> +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> +    set_feature(&cpu->env, ARM_FEATURE_EL3);

No ARM_FEATURE_PMU ?

> +    cpu->midr = 0x410fd083;
> +    cpu->revidr = 0x00000000;
> +    cpu->reset_fpsid = 0x41034080;
> +    cpu->mvfr0 = 0x10110222;
> +    cpu->mvfr1 = 0x12111111;
> +    cpu->mvfr2 = 0x00000043;
> +    cpu->ctr = 0x8444c004;
> +    cpu->reset_sctlr = 0x00c50838;

Do you happen to have the hardware to hand to check what the
top 4 bits of the reset value of SCTLR_ELx are? I think they
should be 0x3 -- the Arm ARM says that [29:28] are RES1 (as
does the A72 TRM, though its top level summary table lists
0x00c50838 as the reset value for some of the SCTLR_ELx.)

QEMU may have the wrong value for A53/A57 here too, I suspect.

> +    cpu->id_pfr0 = 0x00000131;
> +    cpu->id_pfr1 = 0x00011011;
> +    cpu->id_dfr0 = 0x03010066;
> +    cpu->id_afr0 = 0x00000000;
> +    cpu->id_mmfr0 = 0x10201105;
> +    cpu->id_mmfr1 = 0x40000000;
> +    cpu->id_mmfr2 = 0x01260000;
> +    cpu->id_mmfr3 = 0x02102211;
> +    cpu->id_isar0 = 0x02101110;
> +    cpu->id_isar1 = 0x13112111;
> +    cpu->id_isar2 = 0x21232042;
> +    cpu->id_isar3 = 0x01112131;
> +    cpu->id_isar4 = 0x00011142;
> +    cpu->id_isar5 = 0x00011121;
> +    cpu->id_aa64pfr0 = 0x00002222;
> +    cpu->id_aa64dfr0 = 0x10305106;
> +    cpu->pmceid0 = 0x00000000;
> +    cpu->pmceid1 = 0x00000000;
> +    cpu->id_aa64isar0 = 0x00011120;
> +    cpu->id_aa64mmfr0 = 0x00001124;
> +    cpu->dbgdidr = 0x3516d000;
> +    cpu->clidr = 0x0a200023;
> +    cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
> +    cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
> +    cpu->ccsidr[2] = 0x707fe07a; /* 1MB L2 cache */
> +    cpu->dcz_blocksize = 4; /* 64 bytes */
> +    cpu->gic_num_lrs = 4;
> +    cpu->gic_vpribits = 5;
> +    cpu->gic_vprebits = 5;
> +    define_arm_cp_regs(cpu, cortex_a57_a53_cp_reginfo);

The impdef registers do seem to be basically the same as
the A53/A57. The function name is now a bit inaccurate,
though, but I don't have a good idea for a better name.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
