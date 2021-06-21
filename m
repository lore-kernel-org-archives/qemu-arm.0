Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp2063130lfg;
        Mon, 21 Jun 2021 06:29:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwiki1qrgXcK0wOkdqxjr7d03HPyI7sgAdQFg2ZAV8y3FX5mC5+MgUdcLyWxnIJQFy1Y+M5
X-Received: by 2002:a05:651c:1043:: with SMTP id x3mr20133090ljm.342.1624282189774;
        Mon, 21 Jun 2021 06:29:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624282189; cv=none;
        d=google.com; s=arc-20160816;
        b=eYVwTS9hge2gjRRZrsCa/NBLUzbzCiKtDMkLHoTyeGwGzGA1JqcweEEmcOdY8oKa/D
         l5+fe8k8cEtO28F8TiZeY0kDQJWd9GvrdVz8CegY08XDYfsgrJgaJXofLTaRT4DLvqZn
         HwOOMzIqfsFBmcMNMGL6l8cZm+kcGTU+hu+XHywGZQEO2nLdHwMAJwhz+FOiPlu18u8N
         eIm71mGRnjhew22CQ5H2kMWdmccBPkwfwIXnh95rpZmDG+Q1mkTDtqk4RzXWyYq7Zly9
         f5JnY4uUTKGPK2NMG42cN2okA7YFLcRB45gGOLrDhk7RVYDmwbKb+3Csrxz8c3uEI8wu
         L8Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lHpPzrIcM8jjrNm0G0OJk0rMZOh+1o4vGe83nlS1eiY=;
        b=KEpcVxLIYe4URSzsAO4XMeehcMiV+GaixmMhw5104BSUR2wWWZuQwSeuvRs8tXvTU+
         8bJomkaNG+xL1K7u84q1WmUbB9iXGuDarOaDmHpaNs3glv4QKPQCNidLbkS/Xspj2ZC5
         2lN0DnnRZoEXTd5AJ1yXd3P0vRzkklSadmsgMpfiHsyC44m50mqLWJDdMqtPI6u6X7Tp
         rKAZOWkLG5PBQp52oo8lkjJaj+6YXzwNLdwsuIqEHzQaulm1fGMcUGrsDdiBjyi1B0yv
         c2eAyU6rZIyk3mzAPUl3sAumOrG7dAFUBYqKDbOJ4kCooT5XpP65lRwjgolQa6efnGy4
         Tsyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kyGm0Nb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s14si9531435ljj.472.2021.06.21.06.29.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jun 2021 06:29:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kyGm0Nb8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvJzn-0003kO-PD
	for alex.bennee@linaro.org; Mon, 21 Jun 2021 09:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvJze-0003gJ-0w
 for qemu-arm@nongnu.org; Mon, 21 Jun 2021 09:29:38 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:34747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvJza-00083j-DY
 for qemu-arm@nongnu.org; Mon, 21 Jun 2021 09:29:37 -0400
Received: by mail-ed1-x531.google.com with SMTP id i5so1514528eds.1
 for <qemu-arm@nongnu.org>; Mon, 21 Jun 2021 06:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lHpPzrIcM8jjrNm0G0OJk0rMZOh+1o4vGe83nlS1eiY=;
 b=kyGm0Nb8jZLTSdVF6x8CDbimchezec5C5X9ZpZvkIQYUPybhWOzQbYc2kP6QGatnKb
 HVcrcT2WMYOK0A4Qy80lCV9Imtxs+mn2aGCTxXS/CzZHvtKdiFlabzgm5wR471DfHSfS
 ZSCPIagTg7m5BZOdkGeS1aqx/dNgMdA6Lup3POXJhNgs2OojuWBqgh+wtX3i13RSA6kX
 zRp31YCUIC+zHhwmZovPIjfHhWPPMeG1A91AQBFDn8vvUyHSLtAntbstWQR5RMwvQZKv
 YTNrv85LoHmgN6YIIOD7EnnAEM9X38C4jlxZIa0mVNh3VoDvq2hb3fH5z1UqccZRze8y
 vkvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lHpPzrIcM8jjrNm0G0OJk0rMZOh+1o4vGe83nlS1eiY=;
 b=lNCkRT2IdrXUjPMzsn8i3ncA85REMdi6tgctD80vnii8frY/TPmMVm+0ke/rnFSOfL
 m0QrGcCpcB1i2BWbhKdNYd/6KIznj8lzI/UuiL0MYFFXgHeKlBX8MR8MdubQLE8bnYbQ
 F+tLWuxEspZIH/rR+t7bz20dCgUVBKKPH9y3SLWQhHuIUgd1ll3ydjvbCLkBhbUAQxrl
 2bSp9yZbDytVjKOUJJ/7MNwzwbfhza2UzQg0EWKVqJyx6SBB1sSl1nGFJFCHnampGl2x
 l3FbNWMjDwmJjV74q1ObtkZmh/vQkUxFEPufVi+WOU85mmAyOLZ5T0N9g/hC+iHdu4sg
 9aAw==
X-Gm-Message-State: AOAM533b33UWzW49qXlWA5vmWdDDtQfyQ8eciqPtwIdtWh77jTkV1bip
 NDFporrE40vQjFP1SPmpsugkRYS2M489/GZ43X4SMt1WKrjFxLHD
X-Received: by 2002:a05:6402:748:: with SMTP id
 p8mr18981586edy.251.1624282172638; 
 Mon, 21 Jun 2021 06:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210617121628.20116-1-peter.maydell@linaro.org>
 <20210617121628.20116-4-peter.maydell@linaro.org>
In-Reply-To: <20210617121628.20116-4-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 14:28:56 +0100
Message-ID: <CAFEAcA_HT=f8CN9j5rw2gL9pboiia1dzNcaNtikymuT3DRJiWg@mail.gmail.com>
Subject: Re: [PATCH v3 03/44] target/arm: Implement MVE VCLZ
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OT4tIkrYN1ko

On Thu, 17 Jun 2021 at 13:16, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Implement the MVE VCLZ insn (and the necessary machinery
> for MVE 1-input vector ops).
>
> Note that for non-load instructions predication is always performed
> at a byte level granularity regardless of element size (R_ZLSJ),
> and so the masking logic here differs from that used in the VLDR
> and VSTR helpers.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +#define DO_1OP(OP, ESIZE, TYPE, FN)                                     \
> +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, void *vm)         \
> +    {                                                                   \
> +        TYPE *d = vd, *m = vm;                                          \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned e;                                                     \
> +        unsigned const esize = sizeof(TYPE);                            \
> +        for (e = 0; e < 16 / esize; e++, mask >>= esize) {              \
> +            mergemask(&d[H##ESIZE(e)], FN(m[H##ESIZE(e)]), mask);       \
> +        }                                                               \
> +        mve_advance_vpt(env);                                           \
> +    }

Just noticed I didn't quite get the refactoring from "use sizeof(TYPE)"
to "take ESIZE" right here, so we currently do both (correct behaviour,
but oddly written). I'm going to squash in this trivial fixup:

--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -265,8 +265,7 @@ static inline void unknown_mergemask_type(void *d,
uint64_t r, uint16_t mask)
         TYPE *d = vd, *m = vm;                                          \
         uint16_t mask = mve_element_mask(env);                          \
         unsigned e;                                                     \
-        unsigned const esize = sizeof(TYPE);                            \
-        for (e = 0; e < 16 / esize; e++, mask >>= esize) {              \
+        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
             mergemask(&d[H##ESIZE(e)], FN(m[H##ESIZE(e)]), mask);       \
         }                                                               \
         mve_advance_vpt(env);                                           \

thanks
-- PMM
