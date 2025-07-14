Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A44DC83F1B
	for <qemu-arm@archiver.kernel.org>; Mon, 14 Jul 2025 10:31:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ubGSx-0007Hn-Dp; Mon, 14 Jul 2025 06:31:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubGS8-000708-QK
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 06:30:35 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ubGS4-00050G-Cq
 for qemu-arm@nongnu.org; Mon, 14 Jul 2025 06:30:31 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-711a3dda147so42613387b3.2
 for <qemu-arm@nongnu.org>; Mon, 14 Jul 2025 03:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752489025; x=1753093825; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RHFJzzPUS+Gs190sJ8Y1X0wq++eR9FYpLgnW758cBt4=;
 b=BEoFo1lI1zOCML1z26gkJVWoJXu3AQ4vm6zKp2Ak1BmVbQGyjQqF6D/AQmqZ67/C9+
 kkiziSlX7UsXvha1Xxn3LPQdwcuUr01WCX8JYtWNkBKJFyDwVhoFu1fY2CHigfvRCHOA
 EXmEwxwjZXP9hCfVpV4jfTwJcveNIE+qX1+iHOuSoc1qTC0Z66BwEB+oNqYMGEMt934z
 YA2gU8wc5gOi0zovOX8cXAeZ9Wu4vDzpdafKHxKHfY9X4SUYU8Y0s6zNfqWprxTkhOfl
 ka7qfKENiFECncIFyPI7IHVuZPoZxhZgsEnash070nfIMmMF6MTHQvYmOxrAoNq2qzX4
 nVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752489025; x=1753093825;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RHFJzzPUS+Gs190sJ8Y1X0wq++eR9FYpLgnW758cBt4=;
 b=lGH/60uZ9M9kPuWW9OevcTqXoLRaJtCkmhdAxKktze7WNMSoKqHCqzHcwzvPolHuBn
 9BdTC0IwrAN5gwWjEQgUJm5d526V5bO+nhC12nYghRNP8m4mfWUbSB/7Cv3LZ9h7kzka
 h8zgiqJC8hwS212H5cOp1BXGsdsaMmp1Bgj+wWkP0Y7KHVpHYUN+nf4Z7RIC3rM+mcAc
 OSwgLHTDjIqjFyvhLw3AW09tpJZ2gl1TeW/bflSXyFrlkwRynClsa+3fFCudSY2ROsiV
 hI25AklhuzaV4XzvNUHOCPvKrGFeeINmZ/bBUhpRzt0bSCBLSn7icr/GKuWUwdcKLmYF
 FZBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAl+EOLdpw20SW6k/uaBXvZVyYri9ux8LSUDdwsabBqTy+3et+5Nhe8PqULObL9uW/P+SDNm9bTg==@nongnu.org
X-Gm-Message-State: AOJu0YyCzqfTBEmeq0EASK45YPXikaqLwn3rren8DsJY2aoPr64iuTEK
 zO5OZ+aGSWpVp1B92JEctSJ7PuSgv5e0r2k10asBNEJvz020dOrHJgyVPB6U5uM7N2uBgWIMlYm
 gqwKdwjj/9WzZZNPmG+aCt3W1x8XjiSDbpuCPqlod9Q==
X-Gm-Gg: ASbGnctfe7T+qIbwgCJTqWIi1gVCLLczM0p4HfWGHHtsvwSIRtMmVYDzhceUNvhh9mt
 7RKw0wpdGboUMJDrny1YSTxrWAnYCwa5W/bUjqltzXxBPVjX59MGjGV+ba2Ah0rwRJDOIRoVLgf
 oYUPNXG6we+T07gx64gbSn98mn2YN89H+Iy4h+2fD72RLcigc/UZNWFr8KwPCkzZlLyVfjhFPQw
 lRLMolQ
X-Google-Smtp-Source: AGHT+IF/1PZQfyNKUKY9/JKK21GzNep90DtLeukMklB5HyBuYzxgU5Bpg9CdMcpMgby1Q3hKTblp+RVHUoLP9yWzpmk=
X-Received: by 2002:a05:690c:6e8c:b0:70e:326:6aeb with SMTP id
 00721157ae682-717d5d79352mr202330897b3.10.1752489025356; Mon, 14 Jul 2025
 03:30:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250708221438.347643-1-vacha.bhavsar@oss.qualcomm.com>
In-Reply-To: <20250708221438.347643-1-vacha.bhavsar@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jul 2025 11:30:14 +0100
X-Gm-Features: Ac12FXxuip6fbIRFmyr9PkajDrZf9InpSwHdpc2BYKgN-cpb0_7NfOsEFvTD02I
Message-ID: <CAFEAcA926Tur8wSvSyMQYJ6XXdiU9mNJZ=weW5x67sJJhjvBtA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Added support for SME register exposure to GDB
To: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, 8 Jul 2025 at 23:14, Vacha Bhavsar
<vacha.bhavsar@oss.qualcomm.com> wrote:
>
> The QEMU GDB stub does not expose the ZA storage SME register to GDB via
> the remote serial protocol, which can be a useful functionality to debug SME
> code. To provide this functionality in Aarch64 target, this patch registers the
> SME register set with the GDB stub. To do so, this patch implements the
> aarch64_gdb_get_sme_reg() and aarch64_gdb_set_sme_reg() functions to
> specify how to get and set the SME registers, and the
> arm_gen_dynamic_smereg_feature() function to generate the target
> description in XML format to indicate the target architecture supports SME.
> Finally, this patch includes a dyn_smereg_feature structure to hold this
> GDB XML description of the SME registers for each CPU.
>
> Signed-off-by: Vacha Bhavsar <vacha.bhavsar@oss.qualcomm.com>



> +int aarch64_gdb_set_sme_reg(CPUState *cs, uint8_t *buf, int reg)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +
> +    /* The first 32 registers are the zregs */
> +    switch (reg) {
> +    /* The first 32 registers are the zregs */

You don't need the same comment twice, and it also doesn't
look like it makes sense here, because the zregs are
SVE regs, not SME regs.

> +    case 0:
> +    {
> +        /* cannot set svg via gdbstub */
> +        return 0;
> +    }
> +    case 1:
> +        env->svcr = *buf & 0x03;

This will update env->svcr but won't have the correct effects
on the CPU (e.g. zeroing the ZA storage); I think you need to
call aarch64_set_svcr() here. Also you've declared
SVCR in the XML as a 64-bit register, so you should read it out
of the buffer as a 64-bit value, not short-cut by reading just
one byte.

> +        return 8;
> +    case 2:
> +        int vq, len = 0;
> +        int svl = cpu->sve_max_vq * 16;
> +        uint64_t *p = (uint64_t *) buf;

I know this is what the existing SVE code does, but does
this really do the right thing on a big-endian host ?

> +        for (int i = 0; i < svl; i++) {
> +            for (vq = 0; vq < cpu->sve_max_vq; vq++) {
> +                env->za_state.za[i].d[vq * 2 + 1] = *p++;
> +                env->za_state.za[i].d[vq * 2] = *p++;
> +                len += 16;
> +            }
> +        }
> +        return len;
> +    default:
> +        /* gdbstub asked for something out our range */

"out of"

> +        break;
> +    }
> +
> +    return 0;
> +}

(PS: I would consider this close enough to being a bugfix to be
OK with putting it into 10.1 in the first rc cycle or so even
if it misses softfreeze.)

thanks
-- PMM

