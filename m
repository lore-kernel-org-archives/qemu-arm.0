Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp380796lfm;
        Tue, 18 May 2021 05:49:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTdI/6wmETnRCnoJvP7O8hbwTPnc9ICZ2Xql3ao33ME8PY/WAwJ6QRLF1PjARrC6dbtJIG
X-Received: by 2002:a05:6e02:1b07:: with SMTP id i7mr4365606ilv.121.1621342141406;
        Tue, 18 May 2021 05:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621342141; cv=none;
        d=google.com; s=arc-20160816;
        b=rzYRd2R41hoQn3ixylC98RW/gm0mYvm41bqIQJaNsXhF42vuVmHyfYLWSkynsslRF1
         vW4+HGlJAOYnZl2GY3uFnEGwi1epQjcDOke2jeRkeDhSwzxrZFWlWnuFBLDexExrcnkt
         ljGAl/GN7NVZC7Kv1VMskZxBilAgSdpe96aV8fk3l2dQY8eUOtyJHndW+KQfZcHitSne
         7g7C3qsGVnwXlJeh9AEW2L4G491GR0VWPtBsxOXZMhu+EEVK1LzW4p+IydKTx9Ex+lEZ
         OE5bf7cq4cR3rM8uXV5VB5Evv+K6i+Pw/vVVcSf4CL1xbw1zp4QciVPAJDN+CNCzVdky
         xUAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WzQQio6Z4cv2fZfJqaRuin61fcb4DAUKxWnvz/TufR8=;
        b=LWK6UNLsv7X3dHD1E7W38SHPCieihIi7lYBGd+m6qzpFOLFmwbaAnph+c6lxDewna2
         DcZU+mzzoBLPNLxnU0jf43AmN6mqVneQfDuChVWHWsWnnnrX2QSrEHIsmguTqvX0/X7w
         emzRKGJ2CvUJ3Kv1Nbwi7SfSi4hnwcboUGhFmJ9aS1YwuCjAUiADXI9C+H0eF5Ubf/j9
         bbMgj1iPZaiAv06ne4aQ06YBkFDtHBlNdOxarXjT+vnKp4DwMCzCngzhJUpZTVGIrtmP
         lba+iJHXiMkzhmLzwzMqK8jgkndIwIaBoE1cwvejAmKRTUKcvLql66a9Bu53bULzA+h9
         z6gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NqIkZp2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y3si4456679jat.97.2021.05.18.05.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 05:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NqIkZp2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liz9g-00051n-NW
	for alex.bennee@linaro.org; Tue, 18 May 2021 08:49:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liz8N-0001uK-99
 for qemu-arm@nongnu.org; Tue, 18 May 2021 08:47:39 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:35555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1liz8L-0007Mr-JQ
 for qemu-arm@nongnu.org; Tue, 18 May 2021 08:47:39 -0400
Received: by mail-ed1-x52d.google.com with SMTP id di13so10971377edb.2
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WzQQio6Z4cv2fZfJqaRuin61fcb4DAUKxWnvz/TufR8=;
 b=NqIkZp2+FZ0lPsfrarmz8OJfOp8y21eROQnp3sA4Y5J23oeDhq6y/BWspCDoiuuzrE
 ELJZpHMBPJwoZXlvWsja9aJ7WvOHr5+4ObNKRaGTkhx6b4JMZhB3H45brEPlaC+j4PRQ
 uV2JDyKlpbvmQP3DwNvQWj29DhTcijuQmxpv8pvHlzuf7sNNJYSyEwFVjTsV0MFyJSEf
 gDMUznuvqsYWy7gCIc7AHdo8eAAeaN+m7qlOug/uH8Rlk+SsH7c0XHhpvUvwC4ap3qbV
 BW2me6OUkffujDUd2O4MLSIU7t8ugSMZoSv28solzp0WjjGPGQtX0j5FxvTYQAv+CJd4
 xtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WzQQio6Z4cv2fZfJqaRuin61fcb4DAUKxWnvz/TufR8=;
 b=NeKqZJTDiYwE6Uvel8Q/uZ66X1TK/HuN2+flkHR8N9jy8q4bbhdxfaDG9w2UnIH25o
 nzhlTwKyWqNqfofVsSyWAw3ZDrRwD3wXXUvwxkiwfs6BpKSAH72fc1Q7pUkD9l08LZLR
 MhTy3xm8YFDqVXjj+mzAnXQROZrKOp1N3M+cFAY4RzR7RulkvX0GudHJtggGZN4tb54T
 2WPHptebvQbISZ3LIMEaeQ4/w1tTJkM00d6FX2CtXyLgJU56id8EiVvT73sRXsPCPKzd
 zgu71u+u/7/foLl1TxUb8Hqys0q20a4H5MgyobredTp0UNrE7KDYb+g/eaQtX/ljS8Kl
 qiFw==
X-Gm-Message-State: AOAM531Xm94UpVi9nYyIUyp9A7UOq7XeCqGA9ud0z8XiguEzPguM1Xy2
 c0a12ZkeG1x63oJRiDTjqiUFumQFMhfoiUyvT6FWcA==
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr6934865edv.204.1621342056042; 
 Tue, 18 May 2021 05:47:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
 <20210416235928.1631788-12-richard.henderson@linaro.org>
In-Reply-To: <20210416235928.1631788-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 13:47:19 +0100
Message-ID: <CAFEAcA_YZe6xMfMFek-KEh8j3zO-AiquM3epyFET3R6XPDAjkQ@mail.gmail.com>
Subject: Re: [PATCH v1 11/11] target/arm: Enable BFloat16 extensions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AOXtDQC1stBp

On Sat, 17 Apr 2021 at 01:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu64.c   | 3 +++
>  target/arm/cpu_tcg.c | 1 +
>  2 files changed, 4 insertions(+)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 379f90fab8..db4f48edcf 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -660,6 +660,7 @@ static void aarch64_max_initfn(Object *obj)
>          t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
> +        t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
>          t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
>          t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
> @@ -707,6 +708,7 @@ static void aarch64_max_initfn(Object *obj)
>          t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
>          t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
>          t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
> +        t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);
>          t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
>          t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
>          t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
> @@ -730,6 +732,7 @@ static void aarch64_max_initfn(Object *obj)
>          u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
>          u = FIELD_DP32(u, ID_ISAR6, SB, 1);
>          u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
> +        u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
>          u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
>          cpu->isar.id_isar6 = u;
>
> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
> index 046e476f65..b2463cf109 100644
> --- a/target/arm/cpu_tcg.c
> +++ b/target/arm/cpu_tcg.c
> @@ -968,6 +968,7 @@ static void arm_max_initfn(Object *obj)
>          t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
>          t = FIELD_DP32(t, ID_ISAR6, SB, 1);
>          t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
> +        t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
>          cpu->isar.id_isar6 = t;
>
>          t = cpu->isar.mvfr1;

Same query as with SVE: do we need to clear these in the "!has_vfp"
and "!has_neon" handling code in arm_cpu_realizefn() ?

thanks
-- PMM
