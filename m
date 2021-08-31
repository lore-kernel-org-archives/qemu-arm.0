Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4565607lfb;
        Mon, 30 Aug 2021 17:52:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxuocd+Dg8kaTs9zZWKUi/CtZEfK0EE4nBoydl6LJrN4MBdQXIRHj98D1NgqoaURhhYirm
X-Received: by 2002:a05:6e02:214e:: with SMTP id d14mr18495631ilv.142.1630371142339;
        Mon, 30 Aug 2021 17:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630371142; cv=none;
        d=google.com; s=arc-20160816;
        b=CtN9zPtb0b06ehYBrc8mQNGrtBpQmlUP5ofVmRXWi5nKG4yphdhTRaAZnhXClQ6S7Z
         zaU9CHI/H4Cczjtk+Gakf9xD2bX5OI7p4TTPxCF15BNvEB+Aitocywxpay0qOLsKpDKs
         d1OOFqfpb4u3gv5a9Sbe22JXsGimJFLH2xJxP8mT0tByu8WhI0RQMhVnFAKZa6EXxrhp
         /y3vTNa7MCL6Ycar0sp+eoXjJNlVnSjmjqocwLxOXeFN4KPqb5xtYEz0WL2d/JoySG9w
         +1SWA+umor3+I/a7x02W+g6HcOvY59RhXR4b1VGBCNJPcgiFcLwrQrR0O1L+4e0JqTns
         h2PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=JgJjst53AtZuC7koPWhczIjKsd9hZFao7BUvzqv9P9Q=;
        b=EJLH+E6gJ682iHIMnMjr8rN0HiKMhiFTnjnZ0Se4OGLuK+9ONnKJ5Dq2GWG2dV/xW5
         sPbtRLKIvzq7z61RkTakYCX/v7msr1nImiQ35Mzh78yerrK+rsqnzPfibBQAhBZ8+Qya
         SonzVeV0v9+borDWP8vSNIQkd/gy0cJpxie0MhegnQ+WChqzfxCAGResqn39bicQmp/Z
         DCHPg+ONaIKrWalp05dRWWcLxgo84XJ62yqerTEpp+UZW85O8B032n1O5OW0AX7YC6zt
         B6oDylE3hNbaxhZ3rFlU/NIoF5it1cl1FjNEYRAq/KvF4lnzxmIXziuuMQMurjSx5n6h
         Ocog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=iSzOJgRP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8si15735527jar.122.2021.08.30.17.52.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Aug 2021 17:52:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=k20201202 header.b=iSzOJgRP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:60386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mKs0j-0006EV-JU
	for alex.bennee@linaro.org; Mon, 30 Aug 2021 20:52:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>)
 id 1mKs0G-0005qv-C7; Mon, 30 Aug 2021 20:51:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:38246)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nathan@kernel.org>)
 id 1mKs0E-0000FP-1z; Mon, 30 Aug 2021 20:51:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51BFE60FE6;
 Tue, 31 Aug 2021 00:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630371106;
 bh=5b6KMByTq/cAx5d95U9mOsUwqM/LJsTDakbM6Mc4Zms=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iSzOJgRPLQSA6KglLfZ15BUNpcQ5UFgobdTPoU3sSgi9MUL0d3hm2b2Wk4WWLFE1j
 9MKpl1JHznFvhSDlF06lu0+RANfULrwdKAe/32/DLBrl7p2cfMRO0RA3/OBqtScl/S
 Ph9AbJizsRKQTs7iwLo1IdHDe/WTRlGhE9iJia/lSELoklWOEqL7Od2JyTf2S48L5V
 sVliygSqXSoBnzOX6XkRJIfIj5QDzq4YFyJ4omrxsZDZpX07Wg3ZdYmDfMrCXBVPXD
 /uZyzPUINtHnGuCNFwEOZsXsmTgLWRoiyQRbvKbtwNT6e9IBkmr6aBJeSyass8QRHz
 gCRuC1+1SVdsQ==
Date: Mon, 30 Aug 2021 17:51:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 17/31] target/arm: Enforce alignment for LDM/STM
Message-ID: <YS19IBEGrIUnUT2p@Ryzen-9-3900X.localdomain>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
 <20210419202257.161730-18-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210419202257.161730-18-richard.henderson@linaro.org>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=nathan@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 llvm@lists.linux.dev, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OXLpz1RUzCK8

Hi Richard,

On Mon, Apr 19, 2021 at 01:22:43PM -0700, Richard Henderson wrote:
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 29fbbb84b2..f58ac4f018 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7868,7 +7868,7 @@ static bool op_stm(DisasContext *s, arg_ldst_block *a, int min_n)
>          } else {
>              tmp = load_reg(s, i);
>          }
> -        gen_aa32_st32(s, tmp, addr, mem_idx);
> +        gen_aa32_st_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
>          tcg_temp_free_i32(tmp);
>  
>          /* No need to add after the last transfer.  */
> @@ -7943,7 +7943,7 @@ static bool do_ldm(DisasContext *s, arg_ldst_block *a, int min_n)
>          }
>  
>          tmp = tcg_temp_new_i32();
> -        gen_aa32_ld32u(s, tmp, addr, mem_idx);
> +        gen_aa32_ld_i32(s, tmp, addr, mem_idx, MO_UL | MO_ALIGN);
>          if (user) {
>              tmp2 = tcg_const_i32(i);
>              gen_helper_set_user_reg(cpu_env, tmp2, tmp);
> -- 
> 2.25.1

I just bisected a boot hang with an LLVM-built multi_v7_defconfig +
CONFIG_THUMB2_KERNEL=y kernel down to this commit. I do not see the same
hang when the kernel is compiled with GCC 11.2.0 and binutils 2.37 nor
do I see a hang with multi_v7_defconfig by itself. Is there something
that LLVM is doing wrong when compiling/assembling/linking the kernel or
is there something wrong/too aggressive with this commit? I can
reproduce this with current QEMU HEAD (ad22d05833).

My QEMU invocation is:

$ qemu-system-arm \
    -append "console=ttyAMA0 earlycon" \
    -display none \
    -initrd rootfs.cpio \
    -kernel zImage \
    -M virt \
    -m 512m \
    -nodefaults \
    -no-reboot \
    -serial mon:stdio

and the rootfs.cpio and zImage files can be found here:

https://github.com/nathanchance/bug-files/tree/15c1fd6e44622a3c27823d2c5c3083dfc7246146/qemu-2e1f39e29bf9a6b28eaee9fc0949aab50dbad94a

Cheers,
Nathan
