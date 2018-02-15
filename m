Received: by 10.28.71.27 with SMTP id u27csp2955508wma;
        Thu, 15 Feb 2018 10:07:32 -0800 (PST)
X-Google-Smtp-Source: AH8x2256UHHG7ecZxUiRfrIp9tTcaeateYyQGZOA8KUOYfcykLX5D7bZYjJdK7ZzQPyfafgXhU9s
X-Received: by 10.37.205.10 with SMTP id d10mr2697490ybf.439.1518718052080;
        Thu, 15 Feb 2018 10:07:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518718052; cv=none;
        d=google.com; s=arc-20160816;
        b=H5NZlrPk8aRYvl0g/R3GoOANJ9IJh2WW9jR6tuUNIVen1zahssAaKxlwpCq3jhp8LS
         EOOGgaY7GWo4++2j8+qm3JcN4hEJbkbHUBGe+XYj/FnWoTbhrJ0AfIwV360jlO+bSrXJ
         i3gIeg6r/27UlrK+ZWlrZUoaiw4lIU/q+T+Zrh7xhjqp5DBSTMh04WA6b+CAhqT7ppMk
         484o/wT9edKGa9NW9ykEDpObOttAfmCJVxeSdVkfAaid1DTcGa42t5rH9fqTdhu2oe0q
         1Bx+WerYWLy64HkGk5XXzWM+Rz4p4WZWIHtoHtgpVRlO+VRPY4EauqMf6iyoG5cXk8W8
         Awfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=aWW0JiMOnRqk8ESvEMZxNdh79qzsUu8WN9lfb4WiyJM=;
        b=R1Xc7EGWx6mW2nccYnNQDmvKWggkcESMzxsFBOqACh6+ziTW5hrDq0eAPVgqBP2oNf
         4IrkWX7AT1mf1+VrP8Ng/bGPl0rJFewI4Ms8i3+u2We5u28rvv3m8eQvkyXfptzO8v8o
         sPrfA6iC+8tPYfNMyVxYML454FkyFjKG2TTm/pqtIItOMViFPsYpE3bLoYV3jrkIkFl9
         9wKFtmakbyYU5ZYs+Xh/0OUhBkRuHO5hHFKkoZQmNVYOpjykcatZUkGkmR8LGAEyu/YF
         qjtFProR/x9iH1W4Vv2oeOxLig4r1JxLXwnK1NlLv7xMojwTRqnwOAKLOjH7Zgsdfp1R
         Zn8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SPrZWbNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x1si2806300ywl.535.2018.02.15.10.07.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 10:07:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SPrZWbNk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emNwR-0000oe-Ea
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 13:07:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1emNwG-0000mS-1n
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 13:07:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1emNwF-0004KF-0y
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 13:07:20 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34205)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1emNwE-0004Jv-Rz
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 13:07:18 -0500
Received: by mail-oi0-x241.google.com with SMTP id y16so462719oie.1
	for <qemu-arm@nongnu.org>; Thu, 15 Feb 2018 10:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aWW0JiMOnRqk8ESvEMZxNdh79qzsUu8WN9lfb4WiyJM=;
	b=SPrZWbNkB4Ppfat2fFOzJ1W3Gwm5Oy/nqma+xBvQGanUZF2B2beqM7Q2J6Etc9B0nM
	OgMB4tCIhMSJitzK/0QhLssdL0CsmC3cUMznEi0pkzHolfPh+6lu7/qtivO41lnakpd/
	57TCcY6DFYFigO5GGDfa8GPW2ct1nnM5FwFIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aWW0JiMOnRqk8ESvEMZxNdh79qzsUu8WN9lfb4WiyJM=;
	b=Rzqi1o/sktoxLJqGgR0FnpkwNjGiKWTxz3uCD5KNo7jnyCqj2BNN6uyMaAu85qVvP0
	NhJhltqYthsKjAy2nTatM6jpTiwQRjRKIdKJtIwLrncqcKd7l9/ikSYqCxnuaGmWUzPq
	h34/X05BVhtltMyGx6m+/ff1eFOB8KOdz3lrhpAbBevWmbrnAsyUNsAO5P5MKHgTtKEV
	SfTcDDMvo+Lqha5WEuuWeLlVvLaZnpdyphrWVDklJc4piY9TlcfkKRcATslNocL1cr2z
	Qc/hjcX4f6zAVJ/h8XwYUllDCkJn5jiac+N/5fK6BPWeIxFvYRUkj8L1bH4OdesG/9SK
	A84w==
X-Gm-Message-State: APf1xPArcxcBSgnPR8R08VM9cnma/a1sV9AsmiSTSeXpX02dBcy+ezTN
	YZ7dkMpU3KOPH21756yFduvnsgre+odhcTDDpIgnhSSs
X-Received: by 10.202.179.65 with SMTP id c62mr2431719oif.8.1518718037859;
	Thu, 15 Feb 2018 10:07:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.18.136 with HTTP; Thu, 15 Feb 2018 10:06:57 -0800 (PST)
In-Reply-To: <20180215175707.15491-3-peter.maydell@linaro.org>
References: <20180215175707.15491-1-peter.maydell@linaro.org>
	<20180215175707.15491-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Feb 2018 18:06:57 +0000
Message-ID: <CAFEAcA_UWVgwEsTq2Tebn+yL5Ckd_7_S_wUvsKMDZfEHxr9stQ@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/arm/boot: Honour CPU's
 address space for image loads
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RUl5Zs8B/Wbu

On 15 February 2018 at 17:57, Peter Maydell <peter.maydell@linaro.org> wrote:
> Instead of loading kernels, device trees, and the like to
> the system address space, use the CPU's address space. This
> is important if we're trying to load the file to memory or
> via an alias memory region that is provided by an SoC
> object and thus not mapped into the system address space.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/boot.c | 119 +++++++++++++++++++++++++++++++++++++---------------------
>  1 file changed, 76 insertions(+), 43 deletions(-)
>
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index 9b174b982c..0eac655c98 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -35,6 +35,25 @@
>  #define ARM64_TEXT_OFFSET_OFFSET    8
>  #define ARM64_MAGIC_OFFSET          56
>
> +static AddressSpace *arm_boot_addressspace(ARMCPU *cpu,
> +                                           const struct arm_boot_info *info)
> +{
> +    /* Return the address space to use for bootloader reads and writes.
> +     * We prefer the secure address space if the CPU has it and we're
> +     * going to boot the guest into it.
> +     */
> +    int asidx;
> +    CPUState *cs = CPU(cpu);
> +
> +    if (arm_feature(&cpu->env, ARM_FEATURE_EL3) && info->secure_boot) {
> +        asidx = ARMASIdx_S;
> +    } else {
> +        asidx = ARMASIdx_NS;
> +    }
> +
> +    return cpu_get_address_space(cs, asidx);
> +}
> +
>  typedef enum {
>      FIXUP_NONE = 0,     /* do nothing */
>      FIXUP_TERMINATOR,   /* end of insns */
> @@ -124,7 +143,8 @@ static const ARMInsnFixup smpboot[] = {
>  };
>
>  static void write_bootloader(const char *name, hwaddr addr,
> -                             const ARMInsnFixup *insns, uint32_t *fixupcontext)
> +                             const ARMInsnFixup *insns, uint32_t *fixupcontext,
> +                             AddressSpace *as)
>  {
>      /* Fix up the specified bootloader fragment and write it into
>       * guest memory using rom_add_blob_fixed(). fixupcontext is
> @@ -163,7 +183,7 @@ static void write_bootloader(const char *name, hwaddr addr,
>          code[i] = tswap32(insn);
>      }
>
> -    rom_add_blob_fixed(name, code, len * sizeof(uint32_t), addr);
> +    rom_add_blob_fixed_as(name, code, len * sizeof(uint32_t), addr, as);
>
>      g_free(code);
>  }
> @@ -172,6 +192,7 @@ static void default_write_secondary(ARMCPU *cpu,
>                                      const struct arm_boot_info *info)
>  {
>      uint32_t fixupcontext[FIXUP_MAX];
> +    AddressSpace *as = CPU(cpu)->as;

Oops. This should be
    AddressSpace *as = arm_boot_addressspace(cpu, info);

>      fixupcontext[FIXUP_GIC_CPU_IF] = info->gic_cpu_if_addr;
>      fixupcontext[FIXUP_BOOTREG] = info->smp_bootreg_addr;
> @@ -182,13 +203,14 @@ static void default_write_secondary(ARMCPU *cpu,
>      }
>
>      write_bootloader("smpboot", info->smp_loader_start,
> -                     smpboot, fixupcontext);
> +                     smpboot, fixupcontext, as);
>  }
>
>  void arm_write_secure_board_setup_dummy_smc(ARMCPU *cpu,
>                                              const struct arm_boot_info *info,
>                                              hwaddr mvbar_addr)
>  {
> +    AddressSpace *as = CPU(cpu)->as;

...and so should this.

thanks
-- PMM
