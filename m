Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp370800ejq;
        Fri, 5 May 2023 05:15:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ46Y5lyGgTk9jGGjUqvJRHhNVTVlEeGkrc8RjLOmEmyAtlsq6Un1ntWsrOez8ntNhElFQwn
X-Received: by 2002:ac8:7fc6:0:b0:3bf:bb1f:3c2b with SMTP id b6-20020ac87fc6000000b003bfbb1f3c2bmr2157568qtk.6.1683288909695;
        Fri, 05 May 2023 05:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683288909; cv=none;
        d=google.com; s=arc-20160816;
        b=iyqn4qn66+mx6ukjYirXM+dzb8s38xVPY0rKZB6LLNZtsEFEJm0BH88hnQzRr8VS3R
         IEbguYKzjb/83BvM+vxISqysIS0cQDKhKTo25T0LfGs9jTlzx00gDQhohZoLcNAgts3F
         84lFB84GTqVTK2gO6sYzUDzrcH0/y9cIumP/ybd4iAVYzy++X1+g2h0+/AOXtHnoiEDU
         0NcOxZE+Z/8yDmLKf//H1DiKYFQPEPx2zpebEboXZ/Vv+tobFJFD3twcw+VuYY6UT8lK
         Vpvam5Yr4aThH0F2oTTxzuqGIjg8MEHEJwdiwsxvgWE+uEIwiHv9/YY9aOzL0wTeOzwG
         bc3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GZkLd0wmL1n/GDwwG3Amj5HH4HRqlcHjx9jRhfq04ks=;
        b=PrOIL8rhtjwKDFM2SZdp/Um6bgUXDJ4TxYz+jxJxterXn86V74fBq9WMCnJxr++qBm
         9R4Qao6s7QYtwrykr8dLXDQZCuIJAidCNpVIDWaqqPPpnXU0nTIsYJK3IpN+FbLQX4pc
         W0xswg6WRlVqWSkw0GXxO0NAJE//+JNyQDJBIK2lh3YRNrA+WIHZh3Ub0b4OAL1nlt9q
         NkQSSC9U5OFTjQcQrB2SMr7/N0m+G+z791J8QvofwOsXnNarGSBvpa45zT4LSncua3bO
         YTrlktVehvlNBq04dezWbblvjexe3YHFOWovNjaUhX+szi7OwHnI44YXh2j2UaCRoM1r
         aG7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFEMtSoj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020ac85882000000b003ef4fa5b230si504250qta.588.2023.05.05.05.15.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DFEMtSoj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puuKY-00075s-Qd; Fri, 05 May 2023 08:14:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuKX-00075L-Bw
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:14:33 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuKV-00070r-1S
 for qemu-devel@nongnu.org; Fri, 05 May 2023 08:14:33 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-50bc1612940so3277246a12.2
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 05:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683288869; x=1685880869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GZkLd0wmL1n/GDwwG3Amj5HH4HRqlcHjx9jRhfq04ks=;
 b=DFEMtSojedDiM3Nr1/ourhRXl469kJtwx5O0lL59AGDaflhPf2cwdPGtGpm/6bt/8p
 XZFVCaKAn10KM/Prz2yJiRpIxRma4YD3bAGVjh/V+sV8VRRut5RVLHtmFrc2wEH9dlKs
 bVWv+C5Zv1SG2Uadu1ZPNkzdmfxSOdDWknVZo/o87NnRa2Ci3q+goH3yNt9qcR01u+cH
 mDFRuCPU6zSo3H7VLiNWZFXQwhX45lDc4YI0iYwkdqF6cSQihxZeVHCChfbs4WiFzFPw
 CEKn1ogznIEFTqc6UZiD9aona4D6VhxCzov2AoZ/AmqwmaygtFBsNGdOLdguhXGvpbeC
 CDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683288869; x=1685880869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GZkLd0wmL1n/GDwwG3Amj5HH4HRqlcHjx9jRhfq04ks=;
 b=UIAQstnW4Kiq87kiuywgijijwsxK7ABsdFxy1GiZCoUuaQA9pIsJ12XeSN68NtMlR/
 UP5K/pyzCWav5cviKuXLZ3A9Wsah+YNJSpJBA3hT9qCNqqj0hSvITch0LVpuiNZ4KaYE
 VVQuA6lBFaotuIbRFjxq+zTPATsU4/nqp+bbYRXiq0PI5jQ9mIyIWoAYj0TvGyv/VdNG
 ZipdN0oyWrIS0lIghFIPFwdHgKqy5CBpu45wJSjy9s4AjVMTpSO9qf64XUHwjF4Aok9Z
 Yq7rC73ioB/Gbj/CWVSgvsjFpHgya6LamwE5rz61U0mj9tvwgCkFMiFI0r9VfP5HB513
 xtcw==
X-Gm-Message-State: AC+VfDypUW0W9rZ7tNedbaDleugUMuKqG8ePucqMUZFzdVh+hvETFhXs
 sNj1dzYcUQBqryKiXPcJ2EM3jQJdumzWYor948jpDZRYBxNNe1fA
X-Received: by 2002:aa7:dd4e:0:b0:50b:fc7f:b281 with SMTP id
 o14-20020aa7dd4e000000b0050bfc7fb281mr1135065edw.1.1683288869317; Fri, 05 May
 2023 05:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-27-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:14:18 +0100
Message-ID: <CAFEAcA_i+XxebX2m448iA-XdbBuN1w0VsEwhAQkP_yQvqnjNhQ@mail.gmail.com>
Subject: Re: [PATCH v4 26/57] tcg/arm: Adjust constraints on qemu_ld/st
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 2HLFtoo1ztRm

On Wed, 3 May 2023 at 08:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Always reserve r3 for tlb softmmu lookup.  Fix a bug in user-only
> ALL_QLDST_REGS, in that r14 is clobbered by the BLNE that leads
> to the misaligned trap.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

>  /*
> - * r0-r2 will be overwritten when reading the tlb entry (softmmu only)
> - * and r0-r1 doing the byte swapping, so don't use these.
> - * r3 is removed for softmmu to avoid clashes with helper arguments.
> + * r0-r3 will be overwritten when reading the tlb entry (softmmu only);
> + * r14 will be overwritten by the BLNE branching to the slow path.
>   */
>  #ifdef CONFIG_SOFTMMU
> -#define ALL_QLOAD_REGS \
> +#define ALL_QLDST_REGS \
>      (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
>                            (1 << TCG_REG_R2) | (1 << TCG_REG_R3) | \
>                            (1 << TCG_REG_R14)))
> -#define ALL_QSTORE_REGS \
> -    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1) | \
> -                          (1 << TCG_REG_R2) | (1 << TCG_REG_R14) | \
> -                          ((TARGET_LONG_BITS == 64) << TCG_REG_R3)))
>  #else
> -#define ALL_QLOAD_REGS   ALL_GENERAL_REGS
> -#define ALL_QSTORE_REGS \
> -    (ALL_GENERAL_REGS & ~((1 << TCG_REG_R0) | (1 << TCG_REG_R1)))
> +#define ALL_QLDST_REGS   (ALL_GENERAL_REGS & ~(1 << TCG_REG_R14))
>  #endif

Why is it OK not to remove r0 and r1 from this any more ?
The commit message doesn't say anything about this bit of the change.

-- PMM
