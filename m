Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp175422ejo;
        Thu, 4 Jan 2024 08:04:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGa3eHEdacS+RfRGR8QhLxrIaH+rCX6KLUBFOaKKTrWqSPbLKay4houM1w0ND1q7rw0r6Gc
X-Received: by 2002:ae9:e64d:0:b0:781:e65e:4d34 with SMTP id x13-20020ae9e64d000000b00781e65e4d34mr825603qkl.140.1704384262615;
        Thu, 04 Jan 2024 08:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704384262; cv=none;
        d=google.com; s=arc-20160816;
        b=blOsi8slBm6l0FRE67Xdx1Ks0MemuIFYcXbrV23R6Xj1W2hbK4JjVV0O9XENKGsvIT
         cdk5LOB7Nn55PYFpiKzeY3fCSyzNJXF/ehjfBpnKBvEH036lDMaBUtY3hgAvSYfyUrvc
         Ezi37egsCnOnEV5EkrgzV0VmG8MtzDQ1gm4McsPGs2DtcETWn8bGALYIls/hh35V6Uul
         Jq5Nq31EPg0nsX9vkq1Mm0nhbnMC8bcdf0+PjJZgXoN4G8iXHvyBCXqd0xBzr6tRTklr
         3zX/WUezoDqlBF0Lw8QE27UTCg4EUNzEOXvr97NRN+TmunaHKW1XqKmw2yUGzBSoD9TJ
         exZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wbj9XQjH4wjaQmwUCu7Uppgeic/eprNUAiwgWhRgsuM=;
        fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
        b=kXWkz0TS6tPB6dvqaQKF6xIK6U34QdiB6+uDjS7Bj9T1cL9aOG5FgrYl4aN+C3UMpk
         MYU0kcWHMLbnkrR0bkoy/geOr+qZePb1j0furM+Ps85L0jGmfbcyzNWWsFjkxtXSxrDr
         3G378qlJ/dfrN9mQFAIr/w+Bm+PCrGghD/B7HjqbVYJGIJ3e17F3cFhpHYRf/gv5IQeD
         YlTcnyTShmssLVuG7+TaPGI60AhK3Mi7roOYhRxOmu8JT1unpbKmnJgCq+mL2Q3Ip3hI
         z73CgKv7Er7Qs0Q96r2vyKnRnOrQvHK05KdqMNrIXfjSLN6gz6UwzCYNiDFhuhF0edTB
         z9ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aeyi/vMt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj5-20020a05620a190500b007815e618cb3si17677026qkb.174.2024.01.04.08.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 08:04:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="aeyi/vMt";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLQCR-0003OO-C2; Thu, 04 Jan 2024 11:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLQCP-0003O0-ST
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 11:04:02 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLQCN-0007AM-Rt
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 11:04:01 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-556ea884968so813793a12.3
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 08:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704384237; x=1704989037; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wbj9XQjH4wjaQmwUCu7Uppgeic/eprNUAiwgWhRgsuM=;
 b=aeyi/vMtQiLxW1EuHx0q1Vl7K7CZ0RNQkAByriRYW0V5YZbvpq1MrURd1AmJEMtA54
 RciNskCCAGyvfr4f30rXh1Ds3CxEIO4pNHpRpqQ5MajioF4vfvsRRAXd8PNyQorfFkQU
 nw8ROCenhte8WyYvRw6sDKhI4OK5C14dmWmJl9VpNDLyoGaR3YdxUyHFxizOhDkO3Ul6
 URy8Fuxwld7eIa22lFa9vBW1RKROGq/Hfa+KaUWaSkcwZGcA989juHYDnsUIErmm2tIe
 7xpGKVG3vTU7fy7zQIzKogBiGm/WzsDmhomSNzMl9OZ3niisGrm9A6jFk1E2FfiAthhM
 E8mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704384237; x=1704989037;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wbj9XQjH4wjaQmwUCu7Uppgeic/eprNUAiwgWhRgsuM=;
 b=xG+Kff9mIj473GShHdg2/kVC1xiLECOIxVBtnAlmoVWT8ozD0MDxUQpFmSUHPUr8SL
 7FDKkhNksGjUBoGqYHSgBox6CWKUKHAILDi1LsPGN6Py1Bu3REckIzKyF708BG59Nf13
 FHObTeYx2GMvdqvT0Et5Tw//D7eYsVtmVkTIQUE2hNI93NT/OOHQtoFTEM5iGrwALi7c
 dlh5WA59kkxw4pge210pDRO74MGY1nuwQNguZsiT0QIfWFFBQ04fop8jXdjBN97u2fUL
 hTdnVNupTO+ekncSPohaxCCL/M3OaEx8yyu8/d954nQX3LpTyB7gUba8hTvQsmM5Hvmp
 GcMQ==
X-Gm-Message-State: AOJu0Yyz8HAA3oLx7oHzQQ/T8K+QlWSMLdNbKMdMW3CfyZeHwRDvowHw
 YtRlQwJHywffFM0CPz8qpcAuxJDdKmJA+/DqwBxU+EXaREgoCA==
X-Received: by 2002:a50:d59a:0:b0:554:3ba8:6896 with SMTP id
 v26-20020a50d59a000000b005543ba86896mr542553edi.79.1704384237519; Thu, 04 Jan
 2024 08:03:57 -0800 (PST)
MIME-Version: 1.0
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-25-peter.maydell@linaro.org>
 <cd9c4cc1-be3b-49d4-a049-c8157a9cae03@linaro.org>
In-Reply-To: <cd9c4cc1-be3b-49d4-a049-c8157a9cae03@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jan 2024 16:03:46 +0000
Message-ID: <CAFEAcA96cVE+upOzMow-qiH-S-fWKKMYj6FuhhvGn1jWc7EVxQ@mail.gmail.com>
Subject: Re: [PATCH 24/35] target/arm: Handle FEAT_NV2 changes to when
 SPSR_EL1.M reports EL2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: djI/LbAMB3Qs

On Wed, 27 Dec 2023 at 23:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/18/23 22:32, Peter Maydell wrote:
> > With FEAT_NV2, the condition for when SPSR_EL1.M should report that
> > an exception was taken from EL2 changes.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/arm/helper.c | 16 ++++++++++++----
> >   1 file changed, 12 insertions(+), 4 deletions(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 45444360f95..38e16c2f8a5 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -11405,10 +11405,18 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
> >           aarch64_save_sp(env, arm_current_el(env));
> >           env->elr_el[new_el] = env->pc;
> >
> > -        if (cur_el == 1 && new_el == 1 &&
> > -            ((arm_hcr_el2_eff(env) & (HCR_NV | HCR_NV1)) == HCR_NV)) {
> > -            /* I_ZJRNN: report EL2 in the SPSR by setting M[3:2] to 0b10 */
> > -            old_mode = deposit32(old_mode, 2, 2, 2);
> > +        if (cur_el == 1 && new_el == 1) {
> > +            uint64_t hcr = arm_hcr_el2_eff(env);
> > +            if ((hcr & (HCR_NV | HCR_NV1 | HCR_NV2)) == HCR_NV ||
> > +                (hcr & (HCR_NV | HCR_NV2)) == (HCR_NV | HCR_NV2)) {
>
> Maybe clearer as
>
>         if ((hcr & HCR_NV) && ((hcr & HCR_NV2) || !(hcr & HCR_NV1)))
>
> ?

I dunno; I went back and forth a bit on how to write this, but
I think what I have is a little closer to how the Arm ARM
defines it (as separate FEAT_NV vs FEAT_NV2 conditions). At any rate,
I don't think your suggestion sufficiently better to do the
work to make the change :-)

-- PMM
