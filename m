Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1326000lfa;
        Mon, 12 Oct 2020 12:57:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhSPMYvOL0g7GejVzg6GzYEQ4LWwF1WItpEO01ZQBxRPR/iyehSw41C1TCP36MI6TwFxNq
X-Received: by 2002:a25:dd03:: with SMTP id u3mr35128197ybg.497.1602532626791;
        Mon, 12 Oct 2020 12:57:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602532626; cv=none;
        d=google.com; s=arc-20160816;
        b=z9REcxcuR+HviehJLkZAJAdsxkJf8vEsPkrcVWdoqzE5aaZ718oPTSum4+bAseZrmG
         Ml3xXg8/SZWjMdCPYtPSEF4s1JsjvX3c3jmTz91PrcQyLXmR9n+7r69vf475OhdqMEz6
         wMywyMxDs5Uzw7kwWDbm7IDshvMgY3kvMbE0QdH61g2FvDpkWJ12CvgeCNamMpbpEYVD
         jOyJb0fP4c2BR+kzjArwe53Tv73q6blNafpgjVLE8L1/2Iii+l8Wv1UqqzbpNiBPwcYk
         cWJwLlUoBrI/gLMBGjysWr8Pt212jrhmHn5l8V239RrjaGICPBfd2pbVCpuGlCkJoKWY
         WbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v5etaDJNkqSqjPrSQFI0iDavDx4rNRv/5D8BugcNJek=;
        b=x0NURTe73nY7FNpq+IhUHlhBd7z9Ov8eZyP598jRcFTCEneLUxYKOSI4zuq6vA0rp9
         fTV+i3sFtjLawMD933yObvMz5s0s9/X7wOBCWwXxZzWEWVKwhI2lN69JSLLDdv2+kqKy
         ISTHpp70WS+JK8QZZL33H7Nhhfdz+smxmU6XQPziO/y3vvd9dgaRmd3mAa0TtesMxmAJ
         QuL7uWW+gYNC3OKIhxssL2py7oqNUbTtM9FH8rBV/ury0rg3OlH3EIKBw8cZiw3xfND7
         mrZJE4scvkDjkX8qC+W9h/tEdmL/3NkR9l8NWoHrXpjcL4fWisvuN0lWGGTgJVmbGeAf
         Ou1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T9p4+Cks;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si15086586ybp.470.2020.10.12.12.57.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 12:57:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=T9p4+Cks;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kS3wQ-0005vy-5X
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 15:57:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kS3wE-0005vm-84
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 15:56:54 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:40469)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kS3wB-0006gn-Qr
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 15:56:53 -0400
Received: by mail-ed1-x543.google.com with SMTP id p13so18346415edi.7
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 12:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v5etaDJNkqSqjPrSQFI0iDavDx4rNRv/5D8BugcNJek=;
 b=T9p4+Cks4CoZNHt4dMGwQVrSndKQKk1WRpTUD/fuuJRjmcd429tPrhBkPs0o5oDZhw
 RK2fKp68TVLH3oW+kLgudi4qrOzH/MfBTTyG6kbhsJiQcG0xROmryHC8OnH7QV0Vpoqd
 zqafuc9bIGcqpfn7HEPDCvchaX4BYuwuw4hF+fISxG9oqOAxH994jcN+l+7cC/DgMeKP
 W7D1yRIBj6wV5giNqEwzCbX1sI86mVYHZ573IQkkBj+9fSYvxp107Ij/V1ppnS7+8jER
 085OJoPD9/X/EBfhUUSNYIYMhwQJoIBxLhg5oCDEYM9dLYBSVA4mruyhd7fGXVoOW4Iu
 y+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v5etaDJNkqSqjPrSQFI0iDavDx4rNRv/5D8BugcNJek=;
 b=JM85AgGbS3Jy1FngnaiXwhMoBx6HBcNByvt0pWR1DFhD0sRLInt697o5ztGJAG65JC
 4BrhVeZ+SNHXcLj/R1ZFlSUGGgnGurZZ44Bq6NMItl9gHtnoyGa7KgquXFLY9DdFHwD9
 hZov4wdwwVkhgsLjFL1LffGBknNXKqx86ip+/67js2rpQyjqtmVAtuJcNk1rHwPYWlj9
 Qk1FF/AkuvoZNGaU9SbFU0gQ9ysKI44UaSbB//FXDn9yEbd05JM67Q0AcTUMQkswVkSY
 dprUK/eKH2n+t0qAnuhiI30/UF5OjICcG1lHm5tKwx5lf839XVpem+Wk5W5uAkpg7EVY
 OLTQ==
X-Gm-Message-State: AOAM531RXm8WciMbx5VstRbsh1TcFWkhD9c41vLnsWTfHMmEjZX9Es07
 m8bj37VD6miaSipNwir5Q6IqeRR6yD190zdTgj4hiWaCNBzt6RBA
X-Received: by 2002:aa7:c7d7:: with SMTP id o23mr15892793eds.44.1602532609709; 
 Mon, 12 Oct 2020 12:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-8-peter.maydell@linaro.org>
In-Reply-To: <20201012153746.9996-8-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Oct 2020 20:56:38 +0100
Message-ID: <CAFEAcA_MN4pzkWV65+2VtUgMdayf6pa-RCLXiomCsntF+38hNQ@mail.gmail.com>
Subject: Re: [PATCH 07/10] target/arm: Implement v8.1M low-overhead-loop
 instructions
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IERmxXlU94Sw

On Mon, 12 Oct 2020 at 16:37, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> v8.1M's "low-overhead-loop" extension has three instructions
> for looping:
>  * DLS (start of a do-loop)
>  * WLS (start of a while-loop)
>  * LE (end of a loop)
>
> +static bool trans_WLS(DisasContext *s, arg_WLS *a)
> +{
> +    /* M-profile low-overhead while-loop start */
> +    TCGv_i32 tmp;
> +    TCGLabel *nextlabel;
> +
> +    if (!dc_isar_feature(aa32_lob, s)) {
> +        return false;
> +    }
> +    if (a->rn == 13 || a->rn == 15) {
> +        /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
> +        return false;
> +    }
> +
> +    nextlabel = gen_new_label();
> +    tcg_gen_brcondi_i32(TCG_COND_NE, cpu_R[a->rn], 0, nextlabel);
> +    gen_jmp(s, read_pc(s) + a->imm);
> +
> +    gen_set_label(nextlabel);
> +    tmp = load_reg(s, a->rn);
> +    store_reg(s, 14, tmp);
> +    gen_jmp(s, s->base.pc_next);
> +    return true;
> +}

This turns out not to work, because gen_jmp() always generates
a goto-tb for tb exit 0, and we hit the assert() that exit 0
was not used twice. Here's a fixup to fold into this patch:

--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2490,17 +2490,23 @@ static void gen_goto_tb(DisasContext *s, int
n, target_ulong dest)
     s->base.is_jmp = DISAS_NORETURN;
 }

-static inline void gen_jmp (DisasContext *s, uint32_t dest)
+/* Jump, specifying which TB number to use if we gen_goto_tb() */
+static inline void gen_jmp_tb(DisasContext *s, uint32_t dest, int tbno)
 {
     if (unlikely(is_singlestepping(s))) {
         /* An indirect jump so that we still trigger the debug exception.  */
         gen_set_pc_im(s, dest);
         s->base.is_jmp = DISAS_JUMP;
     } else {
-        gen_goto_tb(s, 0, dest);
+        gen_goto_tb(s, tbno, dest);
     }
 }

+static inline void gen_jmp(DisasContext *s, uint32_t dest)
+{
+    gen_jmp_tb(s, dest, 0);
+}
+
 static inline void gen_mulxy(TCGv_i32 t0, TCGv_i32 t1, int x, int y)
 {
     if (x)
@@ -8023,7 +8029,16 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
         /* CONSTRAINED UNPREDICTABLE: we choose to UNDEF */
         return false;
     }
-
+    if (s->condexec_mask) {
+        /*
+         * WLS in an IT block is CONSTRAINED UNPREDICTABLE;
+         * we choose to UNDEF, because otherwise our use of
+         * gen_goto_tb(1) would clash with the use of TB exit 1
+         * in the dc->condjmp condition-failed codepath in
+         * arm_tr_tb_stop() and we'd get an assertion.
+         */
+        return false;
+    }
     nextlabel = gen_new_label();
     tcg_gen_brcondi_i32(TCG_COND_NE, cpu_R[a->rn], 0, nextlabel);
     gen_jmp(s, read_pc(s) + a->imm);
@@ -8031,7 +8046,7 @@ static bool trans_WLS(DisasContext *s, arg_WLS *a)
     gen_set_label(nextlabel);
     tmp = load_reg(s, a->rn);
     store_reg(s, 14, tmp);
-    gen_jmp(s, s->base.pc_next);
+    gen_jmp_tb(s, s->base.pc_next, 1);
     return true;
 }

thanks
-- PMM
