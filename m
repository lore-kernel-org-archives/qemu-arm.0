Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3944261wrt;
        Mon, 4 Feb 2019 11:38:22 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY+jQYrwljd6Hlhd4YeH2kVZaN0cQYmBJ+WgPPlnrBvyzvdh2YT2GaFKiKaGHQGxywtTV5M
X-Received: by 2002:a81:3757:: with SMTP id e84mr962255ywa.380.1549309102901;
        Mon, 04 Feb 2019 11:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549309102; cv=none;
        d=google.com; s=arc-20160816;
        b=qZyEDaju1E4q7SKA1wWaLCdZhTG1tE8xzkouUnRxa5hkMvSgO+aqEL4DBVGaQkx2Kl
         QX/5njgCqhTpAYYfKhdPwuQsl0h48xsFgHHnypm9dMaVmdj/EeoE9POgKudhBXbNWzb/
         ZMSzbBWg1BzRMTLd+pQC5g34W1mDNBy2SvVCf93dy+Rupx6G+vViaqoCkEuS7DFY4qUj
         IBgYpsWa8Go8qtb6Men0dxlYYMPiA8PIrjE9KfMCWoY07RIYwGG02PmIxF8WWLce0lZb
         JcsBvy73XhelHiek5sn3NRcU7iqtfR27htZ2IDr3MwJ4OgPnCCxBL7BUZ4U13PphUQI6
         ptng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UjPiOhHL+Z5660Jy6wUjG/eTOGeYN78mVHEgxjVh2EQ=;
        b=jW8Q1MLrLHGEtRYUkSlGHYlx349WuTcWlRRzeWvp9sIkVuIxuLGu+LFCJACL+r9yrF
         3V/iA1Jki+mw0imrvgOPHHBwRRvxgqZtZY9H2DW4s4+Miqkc8vd7Zff19vP81Njvh0s+
         YkdJGg+I2d+YQcz/0+Ztl0+tipHdNVw30Rph2nzlKWKk7se/wf2hNtX7QklPhB9T0JTa
         dbw9TYg1pC6MbJBhODa2s0vNMVQXBe22kc7+MK/K4Yevk4wDNX3rSOIGka/1Z0eMSw4K
         3n5LdnNHz0mTuShPFHFmbivDGin2XhXDZ/20RjpNDWGnsQ7e68W9drSz8GXkXZhxxajX
         ZdKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g7QNVcr5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t185si606704ybf.403.2019.02.04.11.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Feb 2019 11:38:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=g7QNVcr5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:48232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gqk4U-0005uB-Ch
	for alex.bennee@linaro.org; Mon, 04 Feb 2019 14:38:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1gqjpi-0002Ef-Sg
	for qemu-devel@nongnu.org; Mon, 04 Feb 2019 14:23:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent.desnogues@gmail.com>) id 1gqjph-0007Im-NG
	for qemu-devel@nongnu.org; Mon, 04 Feb 2019 14:23:06 -0500
Received: from mail-it1-x144.google.com ([2607:f8b0:4864:20::144]:33754)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
	id 1gqjpd-00078V-Kg; Mon, 04 Feb 2019 14:23:01 -0500
Received: by mail-it1-x144.google.com with SMTP id m8so12368791itk.0;
	Mon, 04 Feb 2019 11:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UjPiOhHL+Z5660Jy6wUjG/eTOGeYN78mVHEgxjVh2EQ=;
	b=g7QNVcr508t32yuUPbGqMP0rrTDIx2zDSn4nf5o+gTFKMg3GH1YvDQJG1BH9Jypb0S
	c/qmNddCBnqtq2/51XEoo6dQDTHf8oMuNU+vqrUI7r0JJI+VIcDZQE0x+Cpz8JtlcYSl
	7IVHGt1HoIeoT3e9StPLekVr8YDyn8urbZM+bKZNb+yZKUtSJvJjPe8XBIf8iloB1Tbo
	EEzk5V2zGf17VDWVzwe6GQFO5cvIdMvA6gK6M2Q0aml1aFe8pYvsW9ZtStVcgE/ojd/W
	PHk033jWieIvMpj0Ud/peZvs+L71+ifsdIge3zYFPrqp+43fGrBKmFqkUjKi9yKAVzk/
	oR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UjPiOhHL+Z5660Jy6wUjG/eTOGeYN78mVHEgxjVh2EQ=;
	b=lazwlbBAJVfS2WSyQSZQNgLe/ePIkPiBCKE2pyksR5UV5pn82FtG4XiCVFS4bRm8Jb
	qYG5cd0bCw+UjJd0/M2JJORdY7y0jjBHloQJAbFhvZrM/4m3ooN7F1hGDTt1NKngbqHx
	R+61DyxcBAdWvwwMzlesucuMX517vxpqZNLcab856dxKXZkmk5/kRXEuaWEVLqDbu9Vg
	8RUR7Iep+eQnOvIOHj0XnUL443ukalpxtWQNhP8MffElfzc4gsfvu9rJkiX1HvJHl4+W
	8yiHVK80I3DIE4k8fgR8cgcHWlNc69eQzGiqhx0OCJFwrx3qK3qXjzWA03FA0idGGPQi
	FhOw==
X-Gm-Message-State: AHQUAuZC0bC5isAI0VFnaiNfT+dWcx6EyHwvFuMJivAFSdXJ3Kr3e7MT
	H1QaNXwwxNOi0lqxzy764XcpVBP4p/QSk34No1E=
X-Received: by 2002:a05:660c:fd2:: with SMTP id m18mr564069itn.1.1549308172630;
	Mon, 04 Feb 2019 11:22:52 -0800 (PST)
MIME-Version: 1.0
References: <20181211151945.29137-1-aaron@os.amperecomputing.com>
	<20181211151945.29137-11-aaron@os.amperecomputing.com>
In-Reply-To: <20181211151945.29137-11-aaron@os.amperecomputing.com>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 4 Feb 2019 20:22:41 +0100
Message-ID: <CABoDooPMwWR3TXxAqzoByeyuaReVmV0NFpWCJr897QL6r7n_nw@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::144
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v10 10/14] target/arm: Finish
 implementation of PM[X]EVCNTR and PM[X]EVTYPER
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ndPpuG9pJ0s6

Hello,

On Tue, Dec 11, 2018 at 4:25 PM Aaron Lindsay
<aaron@os.amperecomputing.com> wrote:
>
> Add arrays to hold the registers, the definitions themselves, access
> functions, and logic to reset counters when PMCR.P is set. Update
> filtering code to support counters other than PMCCNTR. Support migration
> with raw read/write functions.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    |   3 +
>  target/arm/helper.c | 296 +++++++++++++++++++++++++++++++++++++++++---
>  2 files changed, 282 insertions(+), 17 deletions(-)
[...]
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index fd2923f033..1b851d1689 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
[...]
> @@ -5301,6 +5526,43 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          };
>          define_one_arm_cp_reg(cpu, &pmcr);
>          define_one_arm_cp_reg(cpu, &pmcr64);
> +        for (i = 0; i < pmcrn; i++) {
> +            char *pmevcntr_name = g_strdup_printf("PMEVCNTR%d", i);
> +            char *pmevcntr_el0_name = g_strdup_printf("PMEVCNTR%d_EL0", i);
> +            char *pmevtyper_name = g_strdup_printf("PMEVTYPER%d", i);
> +            char *pmevtyper_el0_name = g_strdup_printf("PMEVTYPER%d_EL0", i);
> +            ARMCPRegInfo pmev_regs[] = {
> +                { .name = pmevcntr_name, .cp = 15, .crn = 15,
> +                  .crm = 8 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
> +                  .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
> +                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
> +                  .accessfn = pmreg_access },
> +                { .name = pmevcntr_el0_name, .state = ARM_CP_STATE_AA64,
> +                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 8 | (3 & (i >> 3)),
> +                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
> +                  .type = ARM_CP_IO,
> +                  .readfn = pmevcntr_readfn, .writefn = pmevcntr_writefn,
> +                  .raw_readfn = pmevcntr_rawread,
> +                  .raw_writefn = pmevcntr_rawwrite },
> +                { .name = pmevtyper_name, .cp = 15, .crn = 15,
> +                  .crm = 12 | (3 & (i >> 3)), .opc1 = 0, .opc2 = i & 7,
> +                  .access = PL0_RW, .type = ARM_CP_IO | ARM_CP_ALIAS,
> +                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
> +                  .accessfn = pmreg_access },
> +                { .name = pmevtyper_el0_name, .state = ARM_CP_STATE_AA64,
> +                  .opc0 = 3, .opc1 = 3, .crn = 15, .crm = 12 | (3 & (i >> 3)),

Looking at ARM documentation, I think the value for crn should be 14
for PMEVCNTR<n>_EL0 and PMEVTYPER<n>_EL0.

Thanks,

Laurent

> +                  .opc2 = i & 7, .access = PL0_RW, .accessfn = pmreg_access,
> +                  .type = ARM_CP_IO,
> +                  .readfn = pmevtyper_readfn, .writefn = pmevtyper_writefn,
> +                  .raw_writefn = pmevtyper_rawwrite },
> +                REGINFO_SENTINEL
> +            };
> +            define_arm_cp_regs(cpu, pmev_regs);
> +            g_free(pmevcntr_name);
> +            g_free(pmevcntr_el0_name);
> +            g_free(pmevtyper_name);
> +            g_free(pmevtyper_el0_name);
> +        }
>  #endif
>          ARMCPRegInfo clidr = {
>              .name = "CLIDR", .state = ARM_CP_STATE_BOTH,
> --
> 2.19.2
>
>
