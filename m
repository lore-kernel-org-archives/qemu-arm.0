Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp5088026wrs;
        Tue, 27 Aug 2019 04:10:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw1c9t1atqV5eAF9sKqrnA85hQfrK1dkrbELCkYAaBc3zK4+ZoXVqhvOty0MXhbY1SeZa00
X-Received: by 2002:a17:906:260e:: with SMTP id h14mr20484037ejc.118.1566904257818;
        Tue, 27 Aug 2019 04:10:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566904257; cv=none;
        d=google.com; s=arc-20160816;
        b=AlW4ayeJIIV1R1pMBsvl0naGcH9R8IsfM1F49fPSdKOYu4PuEIxvOWbiPFUn+KW+si
         x6fn8wXFXzDC8yND/nlzVxGi5VGs+lRP2LFw89QQty8se5KrhRPnC/b9fHpMaObX9IGz
         ZLroQxhlRnlzVUrlJszfX0q/mSUUkDTTthkB4nqPG4BBMhqczyMASK+XhVD8iLRdKDU/
         wwjK8STr5O3FFA6kvU5n/B3nAXF3n5MVsgxigyPCPMS6IYkkm14/QxnN9TjfMC/BllbU
         SVP+8YxdRqblBgdk+9jvtP82wMxJbkqA3jIM8iCeEdepNwtUHPK18qPEm7C5M6/F6bJd
         CglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JPhFgEhoCfCrfd4vD3CHiB6SDrSqBJ0vDlG9DuMZSqw=;
        b=G9d2HL3YPqlFMfXoFlY2aK0/3p3Xffsgv/rFY1Y0EZ3VoJJJfeXys4Vxgp3RDygtlZ
         +Z7lBHyZNDD3Wj1H0O0dnE8mGgDz1rp0EJurhuxeCojRiacmc7ZNl5DWrH/H3qyvzVKl
         XRQYmUDkrhdOg2dvUDZeQBrtbvEIOMCfdZ/Jf8EhRymRc7qU+6lFbwZKpZyHNEigf7mq
         B3V6diRpPCM5Mox49ckdhxtIx1x5GXWLsF1ZJm4XSbBAIkVUp1IKzyxMGtm3dTTJM8ck
         VOtSs0CTPRN9JhM/GPJTrrFauiakWRYho6ye1UkXv4V9wn7C4/CHlLmzXvqshNm4pvQt
         XZNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MuVdads8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m10si7727272edd.135.2019.08.27.04.10.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 04:10:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MuVdads8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2ZNI-0003Wc-Nh
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 07:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37991)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2ZN2-0003TF-U5
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 07:10:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2ZMy-0005Z4-2r
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 07:10:40 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:36262)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2ZMx-0005Yu-Sa
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 07:10:36 -0400
Received: by mail-oi1-x244.google.com with SMTP id n1so14605861oic.3
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 04:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JPhFgEhoCfCrfd4vD3CHiB6SDrSqBJ0vDlG9DuMZSqw=;
 b=MuVdads8OwKFlDvbHKCTJkuz+wyxYA1QkQxGCVzbjaLOqKo9sjKffdb08HmeHN8k/3
 jeg8EXhzYtH361eNWP1X3cohFSwCXt8Wp+O+jxtZMauQBXLjuAVNWPJ4vdzzS828VsVM
 NpfDsvuvnHkzonM/sg8BlA4exK0IzSmOWl6pqgM6lfgG7wzmUX77HFJkIiMHBP/29Pul
 yYi75BYyzHkIosL8tMYHbmVH1uvw6fOmjh0ZoBqSdU9oVycnVc+Foa0o5rbIJU4FpLpz
 Fsu12/sMl1hzd8JDJDT2FA7PAuSK+JeTux9YQYiPxejLPBICNlab88/cGpT4s+t+2Pn1
 owjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JPhFgEhoCfCrfd4vD3CHiB6SDrSqBJ0vDlG9DuMZSqw=;
 b=Uma1r0RvGLQdzfVy79FnrmEWCb6C0sCAgofEkdthZ1VvBt4FRnNVwI0ezrV3yiA2Bh
 k/BngCju93ZKjzBd/yrzNiysW7AKksfuUiH2CHb4eflYfgruhjDEzZuTelKtedqQoR95
 Gxqs1m6rWw0Qq68jVfjMmgFNUBLBxcc/gDcYPrl7WcmUQtN+0ZZUVBHrkps44mgs37J/
 HjyqjE6MWAF3c5/JL3Jbl+apfm8eO9ZAwkI6oFoGJ18WyeU91DND3f712vjIFAA03YEA
 kU14C8tAMQz77Qe2pPzIwwmmOwxZ5vuALqFxqG/HGG671FvFeutzDZ1NkCbp0Y05vDiT
 9oSQ==
X-Gm-Message-State: APjAAAWQzG+sEhevzlChRf7XONCBulKhglFFBJsKddmIzXBpb3fOuBmg
 l/zemDbg1XG1Dm03IXEsc5GZai71UiDefBXVRtbzAQ==
X-Received: by 2002:aca:50cb:: with SMTP id e194mr14557106oib.48.1566904235123; 
 Tue, 27 Aug 2019 04:10:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-22-richard.henderson@linaro.org>
 <CAFEAcA8saD6zkOA7-6nF5jQBMgKPLv0L3WXV2m0Y4WtHwVqWgw@mail.gmail.com>
 <CAFEAcA-PG1Jd2F-DLp7yKQest3aWqb3pv4FjUB9movDf4VgWgA@mail.gmail.com>
In-Reply-To: <CAFEAcA-PG1Jd2F-DLp7yKQest3aWqb3pv4FjUB9movDf4VgWgA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 12:10:24 +0100
Message-ID: <CAFEAcA82Y7xNbGB4BioUJ4G7kx5MT5TorF3HoRmKTqaE1eC2Qg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v2 21/68] target/arm: Convert Synchronization
 primitives
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
X-TUID: bXL/txT5w/6F

On Tue, 27 Aug 2019 at 11:46, Peter Maydell <peter.maydell@linaro.org> wrote:
> ...OK, not this specific function, as I just noticed it's the _a32
> one, but trans_STREXB(), trans_STREXH(), etc are wrong.

I did a quick grep through for places checking the 6K condition,
and I think these are the only ones that need changing:

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b4d53f3d37f..58e50f2d808 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8874,7 +8874,7 @@ static bool trans_STREXD_t32(DisasContext *s,
arg_STREX *a)

 static bool trans_STREXB(DisasContext *s, arg_STREX *a)
 {
-    if (!ENABLE_ARCH_6K) {
+    if (!ENABLE_ARCH_6K && !arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
     return op_strex(s, a, MO_8, false);
@@ -8882,7 +8882,7 @@ static bool trans_STREXB(DisasContext *s, arg_STREX *a)

 static bool trans_STREXH(DisasContext *s, arg_STREX *a)
 {
-    if (!ENABLE_ARCH_6K) {
+    if (!ENABLE_ARCH_6K && !arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
     return op_strex(s, a, MO_16, false);
@@ -9004,7 +9004,7 @@ static bool trans_LDREXD_t32(DisasContext *s,
arg_LDREX *a)

 static bool trans_LDREXB(DisasContext *s, arg_LDREX *a)
 {
-    if (!ENABLE_ARCH_6K) {
+    if (!ENABLE_ARCH_6K && !arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
     return op_ldrex(s, a, MO_8, false);
@@ -9012,7 +9012,7 @@ static bool trans_LDREXB(DisasContext *s, arg_LDREX *a)

 static bool trans_LDREXH(DisasContext *s, arg_LDREX *a)
 {
-    if (!ENABLE_ARCH_6K) {
+    if (!ENABLE_ARCH_6K && !arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
     return op_ldrex(s, a, MO_16, false);
@@ -10236,7 +10236,7 @@ static bool trans_CPS_v6m(DisasContext *s,
arg_CPS_v6m *a)

 static bool trans_CLREX(DisasContext *s, arg_CLREX *a)
 {
-    if (!ENABLE_ARCH_6K) {
+    if (!ENABLE_ARCH_6K && !arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
     gen_clrex(s);

thanks
-- PMM
