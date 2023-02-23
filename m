Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp934908ejc;
        Thu, 23 Feb 2023 09:23:12 -0800 (PST)
X-Google-Smtp-Source: AK7set+CBbZBBYAO18KyeYAv6FRAyF/aBOYVrzJ5V3/s0ijQOrdeAGT0qbBwSX/bsez38B2zcrX4
X-Received: by 2002:ac8:570a:0:b0:3bf:a88d:9c21 with SMTP id 10-20020ac8570a000000b003bfa88d9c21mr13420562qtw.50.1677172991993;
        Thu, 23 Feb 2023 09:23:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677172991; cv=none;
        d=google.com; s=arc-20160816;
        b=kH6X7jN6em2+CVm0hDSc80d2FVSEHk/c02MT3eCcgASGdWXOzyMbCpDfMrqVUPg+Bd
         010ciezlgsXHqNau1HvvTS7wieRRkpL3CrfBgDorm51qhPuUn1Ps+CkWFLtWTvPxwmUB
         poO6OOmTjSriWVDSSKheV1T6OlQXL5PZyp1SynTsSyHWnog50OJ+yH6liMxGdj8p6/VT
         Xxxhwgq629m/clmSq8PqzHeJgxlVlEMkpjsx1/k+2ic/3VLYZQvqLQNQ1w6/4vSd7tbx
         z4M9NHgAuXWthpmeXuOrm7HERNcQIJ1+NJBZtAWfJ16b+HiqOWPkPirXuxPor+u42xkd
         VibA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=H8MKTFApAT/Q1sRn9j5XRsAqf09x/WAziGPKsVxwhFs=;
        b=Vmfh6qg7JcogpgrNSbZUQ83sdWoQ72Zhd+/aWFE6f7oGaOzSD6NOkiNzamIP3dir1m
         OA5cuScD8Qo0d/abyg+wtfsqTHp2jWd554J2uPPv3fsIJU2Ftrme1xkN4/zJdkLpVVX1
         L/okZNE9tL5f3AxrCIZSei+7kvW9rR+KTDsxU+KdKcNBVrpr1g6nQ0ASNk3M9ILFIAIS
         xJhUJHmpMUwcZ7yvgFp1LYQapiqXYwoRgeXGYmRJmCzRWzOqQnSWCjJBoT9Btj/AyP9d
         Cq0/n222jLz9Udmu78HB6S+Qi5bTbM9XPGRJu3noBrAPJj9Cr+nkAWPWABn2tBCYnCHx
         UjUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uV3oG5Bd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a05622a138f00b003adaead7c33si4275960qtk.727.2023.02.23.09.23.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 09:23:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uV3oG5Bd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVFIq-0005s4-4c; Thu, 23 Feb 2023 12:22:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVFIo-0005oy-D7
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 12:22:42 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVFIm-0007Gi-IW
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 12:22:42 -0500
Received: by mail-pl1-x62c.google.com with SMTP id e9so8803264plh.2
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 09:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=H8MKTFApAT/Q1sRn9j5XRsAqf09x/WAziGPKsVxwhFs=;
 b=uV3oG5BdBS+QfHdGZ+0rw+gtx7r1y31q+C3YFMbx3x2nAnjovo+2vQuMLEFWZ/83s8
 etGNe4I2RN3+Ff6ZDBRu+WOXr0qUSKQTboBwGKox+/XaK7odbjhw/LfOa0lgRNSiZ7/Y
 qFPYC/sBlWvNHsAob2+Uvm+Ul2Fa++YUxBBvMu6w55epG4OAZhrYfavhegIsX8r07qJq
 k5UIoj8JLf9AuLgK999A/SPASVEQLkhdaf+qvcpPsb8K5JuxZipYMKZtueuhCAM7STJn
 iJstuwilu18FMsurt39KkP90T5kKzx34DCp0m7YPnhQTShUPagLn+/xjC6SebngndIWb
 rBMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=H8MKTFApAT/Q1sRn9j5XRsAqf09x/WAziGPKsVxwhFs=;
 b=uoK+zk8xrq47EZ6Hx5Mu3gLRF5O3Ca/ICGuUjBpTiy1H3n52QAanSmP9ewX6DImCTl
 k5av/oOlz6VdP7d3fSJa16enU6ss/uBsnJaTmKcVtSdIbKbAxnr5d0XZtakEMfoz6ke1
 UKSEfivv3A65Tu5IYyld/Up8LE8p37D2PTq+J/or/Dl0fr+hFY1XD18pFaigU4NcGjim
 bkFCS61beVJfCzLPs14Cg2FSnURXukQ/FOPtQbMl5l86NIJ+IJ4PFxUB7tYYY8o2e6gp
 GR2fs5NEW2v9SyMHHpLGllDutI5NUjn5M5PC0Y1d0FefOiN5F6rOXUk9K9t7MZrqe7yS
 6EEw==
X-Gm-Message-State: AO0yUKVz1kNfNZivbVJ9zQ0osi3nmdpYu5ByhS/ceCPcY42wCbJdQPQ5
 1+ewbuAEGWM9T6fZBUEB1AZ+ZrFz/EeT5FyO4hjocA==
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1316094pjb.137.1677172958729; Thu, 23
 Feb 2023 09:22:38 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-17-richard.henderson@linaro.org>
 <CAFEAcA_6_Om4hGBB5=pFVRzOiE-PndYU9TAFGRj1s7=s9-C0qQ@mail.gmail.com>
 <835a509d-caa4-9cf7-88f5-d7f3705dd646@linaro.org>
In-Reply-To: <835a509d-caa4-9cf7-88f5-d7f3705dd646@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 17:22:27 +0000
Message-ID: <CAFEAcA-nAdnugbDPgwAknALzSzjN5nhrvVYjuBKuShEqJrZxKw@mail.gmail.com>
Subject: Re: [PATCH v1 16/19] target/arm: Relax ordered/atomic alignment
 checks for LSE2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
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
X-TUID: 5rT3PHx0f2b7

On Thu, 23 Feb 2023 at 17:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/23/23 06:49, Peter Maydell wrote:
> > On Thu, 16 Feb 2023 at 03:09, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> FEAT_LSE2 only requires that atomic operations not cross a
> >> 16-byte boundary.  Ordered operations may be completely
> >> unaligned if SCTLR.nAA is set.
> >>
> >> Because this alignment check is so special, do it by hand.
> >> Make sure not to keep TCG temps live across the branch.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >
> >
> >> +static void check_lse2_align(DisasContext *s, int rn, int imm,
> >> +                             bool is_write, MemOp mop)
> >> +{
> >> +    TCGv_i32 tmp;
> >> +    TCGv_i64 addr;
> >> +    TCGLabel *over_label;
> >> +    MMUAccessType type;
> >> +    int mmu_idx;
> >> +
> >> +    tmp = tcg_temp_new_i32();
> >> +    tcg_gen_extrl_i64_i32(tmp, cpu_reg_sp(s, rn));
> >> +    tcg_gen_addi_i32(tmp, tmp, imm & 15);
> >> +    tcg_gen_andi_i32(tmp, tmp, 15);
> >> +    tcg_gen_addi_i32(tmp, tmp, memop_size(mop));
> >> +
> >> +    over_label = gen_new_label();
> >> +    tcg_gen_brcond_i32(TCG_COND_LEU, tmp, tcg_constant_i32(16), over_label);
> >
> > This brcond ends the basic block and destroys the content
> > of TCG temporaries, which is bad because some of the
> > callsites have set some of those up before calling this
> > function (eg gen_compare_and_swap() has called cpu_reg()
> > which might have created and initialized a temporary
> > for xZR).
>
> xzr uses tcg_constant_i64(), which has no lifetime issues.

Hmm? cpu_reg() calls new_tmp_a64_zero() calls new_tmp_a64()
calls tcg_temp_new_i64(). What am I missing ?

> I've cc'd you on a patch set that fixes all the temporary lifetime stuff.
>
> v1: https://patchew.org/QEMU/20230130205935.1157347-1-richard.henderson@linaro.org/
> v2: https://patchew.org/QEMU/20230222232715.15034-1-richard.henderson@linaro.org/

Cool!

thanks
-- PMM
