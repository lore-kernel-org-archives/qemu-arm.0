Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39496C44501
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Jul 2026 13:48:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wiBaC-00079z-N5; Fri, 10 Jul 2026 09:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wiBa7-00078g-Mh
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 09:47:58 -0400
Received: from mail-yx1-xb131.google.com ([2607:f8b0:4864:20::b131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wiBa5-0000hr-OV
 for qemu-arm@nongnu.org; Fri, 10 Jul 2026 09:47:55 -0400
Received: by mail-yx1-xb131.google.com with SMTP id
 956f58d0204a3-6649ffb1d01so1408786d50.1
 for <qemu-arm@nongnu.org>; Fri, 10 Jul 2026 06:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783691272; cv=none;
 d=google.com; s=arc-20260327;
 b=MhGuCvtSdILoGaBDolHxgnFHCn1VK5TkMc+osjmAxvmVPo2EifuvWr/8G/nDB0Xn2a
 VX0voyq7wF/OoG7WnDh2k3Btoiut9+FxAQDao6XO+vyXCoN49tAZsOh5OdGlmaBYKe27
 ZrbqLXIzBTPaOEPXnk3qPgM+nnW1/PpxSOP8l1dhgxviu5mWpppbGlCIhd3mPp+YJ52k
 RCAvZMJrlmC4KZJA65gqc3bPwi79un8aYRXAfbZLgiz2/d0H7NqmIyWLjcaJwzLVkyWj
 xBXyQk8A6Jf+0uADfy9MJGiKXyuZSjTV+BrDyKDm+S3NaJeL/odQfVOud2+hswto0qgb
 oatw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=noV3pNFHSvC73WlAIdd6Ur3Bp1y+Ncl85Yg+rP6ZOwU=;
 fh=l4gXE0oI1A+p9z9q/ixuJuA7KJ67Tkd84zY50IiVZ8o=;
 b=DzG82xMvbDsg0uMEE5g3eaU7VwG78teQoKAxRSK2rPv/BUlHtXOYStlf3FcvgUVGf9
 A1pX5wCz50iKE4d7rGBNO2XuALX/c6Tikt2WZz0BJ+se9YAB+rK5GUwdZt65qb2IPbXq
 7DqhXRsBllGT0JjpIZ6kf4o1BTV0lWJlJtERtCddz4Cj5fwu2DPFSqhHItjtnrSNknwz
 WO9G7QA1ZzoUVIB5z3Ixkxzlj9rMaEgnP0WoxY6VZCvYpFoWkTb/bAee7kqblH2RXJL+
 snX1IcaL+J8u8ahqPTWZwLwwlZOCO2svUp6HgguMj4lrqX2PdZthZPAm6M3CxHoo1k0B
 mVBQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783691272; x=1784296072; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=noV3pNFHSvC73WlAIdd6Ur3Bp1y+Ncl85Yg+rP6ZOwU=;
 b=uSF7dwX+WULVqwevbS+eg2MhETrypPXkf1XHBLbEFVBVnABkQ0kjykDX/sMEKEftGj
 YuSZUG3L3yBzu0fQ2Ar3WJSI2J808OpCSXGTEiiGaBZX5fctM7gaJlbfCTIQh/Wja0Gc
 QjrAE/pvIDdVm3wKDELIOEhX3LCizaEYX+63d1isIu8kuS1r3GB4mo9bWe58uW5xz7eg
 qurmuYdavH1CyllQNgKO7alRz32etjqTFGQ3bYVuKGmNXwMl10eQFGxCz6lAH9QQEXnP
 k+awK+mD5I4I6Ojdq3ZA2D8srhVC/586Ru8LYqGsWW1NMIdUSToOSXf/hKdRGY7sEMfG
 4EEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691272; x=1784296072;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=noV3pNFHSvC73WlAIdd6Ur3Bp1y+Ncl85Yg+rP6ZOwU=;
 b=sSUcLGYHIc9toYuOzul32Egl0+OCS84w5G1rVSb2TMaTvAncPp24bSgYJmTZEWS69m
 dCqTz1+LFFDIcYsAf7+6nqZe6Rhn9G7/y4pNnHUk5kso7m0dbB1MPhM8KzUSAJ6Armah
 woVRDtyUcwNeKHOkXaPcxAYTuaMRr/rCPTDK7T2Lvcll2CVQVDLeem6mfrOBDSa0F+eB
 ose1wcDLoIklG/8zJNdqWG4n2dEyWK5t0dZt4XO9qxUgVUrNTuDhHixvHvJxpNDv4Uyy
 jPzqBjhjrH+CDrrw+5/AQHp/mMRITSAn6XI8tmxsfeCazZZxW4rwChLuNNoHCvBn/78j
 LC6g==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqz1NCn/wXNtEHKwjZfj2ioLfGdfSEZ3tbWaI0bOUiRrz1xRJgPYgBoIBwa1Hqe2XEQQ8dvPDoQDA==@nongnu.org
X-Gm-Message-State: AOJu0YzPgcXsACQ6gW3p5xiV36iEwUQUbkl09dT5NUNwqbXEUzJa8wEB
 7rQJUWqH40h4n6GsZGKiFzxmMV0fGZXVcrRqSDMH1tbYgpttp8gq4qIT23tofgG2LwnoCdR8lhV
 52vP7trHoJC8vDhGxPqrP0lOr63cEuM2/mkbyLhyOq5AhaeO2nKrZuuuk5g==
X-Gm-Gg: AfdE7cm+ZDz8btUapH4P8QxC4HmbHFUqq9oNpit4GIyzarKbIDfNDs5mkWH4URsGeib
 NEww/xfzKYhCSA64QcKWflMz4k5wLD/loVA0fmTLCvmlnD6SiB8h+djI3Rpt5kY2wVDuaUznFqH
 pUZD3fnY4k0ADBHGeKtQ1zi0vdISmocNNojwoNZIEa1JLMB6MsSTjeT1xdE1m1p8KOnrbrRTwD1
 hPTLcGyPv7aE6qFI8SE2PpDVs5Hs/NUju5TyaK7Efa5SVGzkXILi1iYgq5ZaGr9MDSQwREpRjPi
 UmsHhViHGNnuWOcH6vJfVaby9y2H+eB6jcjiZiaKKpPZ2f5HErkABDSx
X-Received: by 2002:a05:690e:450a:20b0:667:b04d:c0e5 with SMTP id
 956f58d0204a3-667b04dd1e2mr5433957d50.27.1783691272048; Fri, 10 Jul 2026
 06:47:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260618-jmac-gpc3b-v3-0-353e546067e7@linaro.org>
 <20260618-jmac-gpc3b-v3-4-353e546067e7@linaro.org>
 <CAFEAcA_M0Z770FApDyhNcYaP89JP3Q8MDj5bMjYKSpmONYrr7A@mail.gmail.com>
 <alDq8uq0QsaH2LLN@linaro.org>
In-Reply-To: <alDq8uq0QsaH2LLN@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jul 2026 14:47:40 +0100
X-Gm-Features: AVVi8Cfn4HPBklRmCDG1fU4MYRQxwm8MQQwZY9ht7w2AvWcb-P9ep9uAl_sylkU
Message-ID: <CAFEAcA-bzToSzzmOQ1z_oCDtWEHdyZmWxDRQPgBC42s5V429Xg@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] target/arm/cpu-features.h: x-rme now means GPC3
To: Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb131.google.com
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

On Fri, 10 Jul 2026 at 13:52, Jim MacArthur <jim.macarthur@linaro.org> wrote:
>
> On Mon, Jun 29, 2026 at 01:00:05PM +0100, Peter Maydell wrote:
> > On Thu, 18 Jun 2026 at 17:33, Jim MacArthur <jim.macarthur@linaro.org> wrote:
> > >
> > > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> > > Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> > > ---
> > >  target/arm/tcg/cpu64.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> > > index f7a920a202..75c2027900 100644
> > > --- a/target/arm/tcg/cpu64.c
> > > +++ b/target/arm/tcg/cpu64.c
> > > @@ -159,8 +159,8 @@ static void cpu_arm_set_rme(Object *obj, bool value, Error **errp)
> > >  {
> > >      ARMCPU *cpu = ARM_CPU(obj);
> > >
> > > -    /* Enable FEAT_RME_GPC2 */
> > > -    FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, RME, value ? 2 : 0);
> > > +    /* Enable FEAT_RME_GPC3 */
> > > +    FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, RME, value ? 3 : 0);
> > >  }
> >
> > Just noticed this, but does this mean we should now list
> > FEAT_RME_GPC3 in docs/system/arm/emulation.rst ?
> > (If so, we can fix that as a followup patch.)
> >
>
> Looking at this again, we don't currently implement the APAS instruction which is a necessary part of FEAT_RME_GPC3, so probably shouldn't advertise that in the documentation yet.
> I'm unsure how to handle this instruction at the moment; it might be that we can simply decode it and ignore it, in which case I can easily make up another patch to complete FEAT_RME_GPC3, but if not I'll need to seek further advice

If we don't think we've finished implementing the feature, we probably
ideally shouldn't advertise it in the ID registers either, but given
that this is an x- feature we can be more lenient there I guess.

-- PMM

