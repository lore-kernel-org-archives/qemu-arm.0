Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2405694ejb;
        Mon, 20 Feb 2023 08:03:07 -0800 (PST)
X-Google-Smtp-Source: AK7set/8ACqxpKXpKlYEdxVkPUDue9pVBVK7ntBm/shHNLTrOfnhEiw5ABQW33vPnxgpexWKNSW0
X-Received: by 2002:a05:7508:3043:b0:4c:cf92:76f7 with SMTP id x3-20020a057508304300b0004ccf9276f7mr44579gbx.11.1676908986719;
        Mon, 20 Feb 2023 08:03:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676908986; cv=none;
        d=google.com; s=arc-20160816;
        b=wBLmYgJcc9rI2ns3cKxcdc7KrlURzIonkEZsjRAdBCX3+iiYc5RZpp3MUBu99KSui+
         OQQRGHY+3WCHWVlQUyTTMOTcjoX5I2yEcswr+b3fltwOSVZc9eZCHNhgBg/aws6fkUgG
         0YCuweKaSNKbMiX72FwX2O8kXUDJN+cIjHfYD+KmmZXi/Ci876NTIg7tjP+z7NTM55ed
         Td9wydv/oA12biNzh6hejk7y/VwTYOdf/8k5PDHhaRVlHisVNg3wjaRU2Z8AcckIM8er
         u5kOqHN4KqrAdl9XlM766wh8sXSJuOdBS1S+RyYUNL4kBTPbgAaNB5QvY3sZQIrdy4cP
         koYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9eVLBNRtv9eIjAA1E7znGixjnNU7FxMCnxup4oagjgQ=;
        b=okfH0WiLlQYbiXNUgBdlcX2tT5WPz8NFBKrA51AXF5xiW/6TTyhhRBTrjr+Skpxq2f
         OEMSVRQtCeRjGwl8kWBtsSqik0q5f2ZjP0bDVLw8WBylhUJGrYibrQMEkAwAlVThDXy7
         ywBEdR5o+kbfcbl9ozdxQ+Wq1pozi9FHER9IOM8aXHJ7IrBVMJmhxiJXXq+3eFGnReEj
         bZkgMnmGtyZfGIRDTHjRGN5v8PI4KCer+Fzj8HFHD5WqVx5L1nh0JWJ6osW1a00/bSoJ
         PcCGNPRFyJxC3gd6CVv35IOWuhNjCOFzB9VeLfHSzZydGEBA7h+9jzIwapsJ6FBqVTfF
         9ofA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ke0kaQQx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 78-20020a370651000000b006fc2467a95esi9748711qkg.337.2023.02.20.08.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 08:03:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ke0kaQQx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU8d2-0003Jd-CV; Mon, 20 Feb 2023 11:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8d1-0003FL-2K
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:02:59 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU8cz-00066C-4L
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:02:58 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 na9-20020a17090b4c0900b0023058bbd7b2so1805934pjb.0
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 08:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9eVLBNRtv9eIjAA1E7znGixjnNU7FxMCnxup4oagjgQ=;
 b=ke0kaQQxqC3gaygsqY2woATUUf3cAEl3WYkiYskhElHugwVoHrmcphXg402AZtglQE
 0lWc8H/WpnwpVCc/6R8V+WmWpxszrc9K8QyEFtnKKSvIUbvnKwXB+IvUCMDtSK8K5w1u
 +JgUYjsZvJ7h2yAbZjp65FK6hZhy7t4Dz1nSthhz6Y/4UvAByMnAfLiMDu4RfDKJ0TcR
 IYGyfbXXB2vHlR7asu6agYQIFFZTTtaDgFnGhTu2/INRbxqTVo427nYiWq5q5bCvXKLk
 J7OATC6e2T6k6N+JgRqDfeAf1SHqlX6pnGNH0ErAewMUAksXVfWuZ9H1OlR1gn84EI+Z
 2yIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9eVLBNRtv9eIjAA1E7znGixjnNU7FxMCnxup4oagjgQ=;
 b=h0QBja/h6ep7ydXq+R4s/5wRa5CIfcNVoWItwIK5wVoVj3E/W82Djy8Yg70QyMJPRD
 ia10iveLSHFWOIFwjTX1zkq5NEeEbg8aY8BYBujIYjFZ5gus7zy/hTwBZ1DM5NfLprIh
 8ZU8k6POJ79tz24aYv6GAgzJ9TESd9j8WLZSPeiCzlsVetHVWKBndduUBamSBJ8GLZIm
 v8gXRmbdqBL1uSpjZwApTdnG76gcj8DN5ed8ON6D+PMmd3HQr7QKjkDyPE32FIXy5zWh
 9d/0zwK7F46fgn4XkvZuxhjP7oynCYXrEsKxLa4CgBEX1gZ9Gd1NVB5UBI3kjVEEqtDX
 nr6A==
X-Gm-Message-State: AO0yUKXklXcd+wWvHWtdBXCLEiuxrTvayeQiaG6G9pG7Quif21xMH9ZH
 jwtBMul7mg1yZlsUL1znpP3/3b5zx2bcx7Jhag+XOQ==
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr988864pjb.92.1676908975465; Mon, 20 Feb
 2023 08:02:55 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-15-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:02:44 +0000
Message-ID: <CAFEAcA96L2V0dvnrygnr00PsKkAcko30h+RCKUMcAJGv0utH4A@mail.gmail.com>
Subject: Re: [PATCH 14/14] target/arm: Support reading m-profile system
 registers from gdb
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zDiB0tPCjZZL

On Tue, 14 Feb 2023 at 16:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: David Reiss <dreiss@meta.com>
>
> Follows a fairly similar pattern to the existing special register
> debug support.  Only reading is implemented, but it should be
> possible to implement writes.
>
> Signed-off-by: David Reiss <dreiss@meta.com>
> [rth: Split out from two other patches;
>  Use an enumeration to locally number the registers.
>  Use a structure to list and control runtime visibility.
>  Handle security extension with the same code.]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h     |   1 +
>  target/arm/gdbstub.c | 169 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 170 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index c9f768f945..536e60d48c 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -867,6 +867,7 @@ struct ArchCPU {
>
>      DynamicGDBXMLInfo dyn_sysreg_xml;
>      DynamicGDBXMLInfo dyn_svereg_xml;
> +    DynamicGDBXMLInfo dyn_m_systemreg_xml;
>
>      /* Timers used by the generic (architected) timer */
>      QEMUTimer *gt_timer[NUM_GTIMERS];
> diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
> index 062c8d447a..a8848c7fee 100644
> --- a/target/arm/gdbstub.c
> +++ b/target/arm/gdbstub.c
> @@ -322,6 +322,167 @@ static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
>      return cpu->dyn_sysreg_xml.num;
>  }
>
> +enum {
> +    M_SYSREG_MSP        = 0,
> +    M_SYSREG_PSP        = 1,
> +    M_SYSREG_PRIMASK    = 2,
> +    M_SYSREG_CONTROL    = 3,
> +    M_SYSREG_BASEPRI    = 4,
> +    M_SYSREG_FAULTMASK  = 5,
> +    M_SYSREG_MSPLIM     = 6,
> +    M_SYSREG_PSPLIM     = 7,
> +    M_SYSREG_REG_MASK   = 7,
> +
> +    /*
> +     * NOTE: MSP, PSP, MSPLIM, PSPLIM technically don't exist if the
> +     * secure extension is present (replaced by MSP_S, MSP_NS, et al).
> +     * However, the MRS instruction is still allowed to read from MSP and PSP,
> +     * and will return the value associated with the current security state.

What's "don't exist" based on here? Architecturally MSPLIM, PSPLIM etc
are banked registers; MRS/MSR let you access the one for the current
security state, and (if you are Secure) the one for the NS state.

> +     * We replicate this behavior for the convenience of users, who will see
> +     * GDB behave similarly to their assembly code, even if they are oblivious
> +     * to the security extension.
> +     */
> +    M_SYSREG_CURRENT    = 0 << 3,
> +    M_SYSREG_NONSECURE  = 1 << 3,
> +    M_SYSREG_SECURE     = 2 << 3,
> +    M_SYSREG_MODE_MASK  = 3 << 3,
> +};
> +

> +static int arm_gen_dynamic_m_systemreg_xml(CPUState *cs, int base_reg)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    GString *s = g_string_new(NULL);
> +    int i, ret;
> +
> +    g_string_printf(s, "<?xml version=\"1.0\"?>");
> +    g_string_append_printf(s, "<!DOCTYPE target SYSTEM \"gdb-target.dtd\">");
> +    g_string_append_printf(s, "<feature name=\"org.gnu.gdb.arm.m-system\">\n");

Half of these need to be in org.gnu.gdb.arm.secext.
These aren't our own XML features we're making up (if they
were then they would be in org.qemu.something), so we should
follow the existing precedent about what registers go in them.

thanks
-- PMM
