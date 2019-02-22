Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7204828wrx;
        Fri, 22 Feb 2019 09:37:18 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ib1PYgCKFSExI2cRgoPsZpvSWYsZW1qTYGeb8vWXQa8ouf8mLD7nDG0QZDxZ/P54P+rbbPw
X-Received: by 2002:a25:3783:: with SMTP id e125mr4256591yba.339.1550857038317;
        Fri, 22 Feb 2019 09:37:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550857038; cv=none;
        d=google.com; s=arc-20160816;
        b=zoQCex+XOYKJRV2PA0BUfLOi9d/TNTI1Oyh25QDYspfdTu0Xy+5ob7a2AmXzxa9Z+s
         wl9hmxSSPlNIbgLwHsirOJQpIlccXurfoU4y/7PcZ71bYXYsiiIw8e5rsgEFYjHPDT1s
         QTwsRawOTibFdp5DM7DQ0lfooVkKuHoohvXXK5sfxUFPS8ghZtQBi0eN7TCQ9JcHbB8D
         YT/zWdysLqBN29DYv9fMvGNvBrP67RHo9D5/NHDoshkso//w1cMuqjQtCt5/PSnnMa9v
         CEWawYJBTsCvT5Ld8co/pIzdI0AkjX+FbjR1TUmpqWjjuqyPgJR6xDzZ4/JPijT62sAE
         lk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8esmt5AbMXZqHWlBSlu1Ql14BbhcJOxiy4g5pfksAI8=;
        b=FWu7DBEsiHJ6NSbQX7Malyd0ZDsvDrBvfg/GYJieQjOZNOwpQGLXaierEkQvzvG/1v
         zUfeEtkpnICDTtIkfG6gnFoKcOt2F3y/qgIvVFJtn6ZVH1qODqM5PfYyy59m/FnmquqT
         sMJSPKVvc+LJoSzhU+ecqCMcNcYyEtoZIFK4MtNjLYq8GPCkL/QR2ZVaeJ2PRlOKl1Sr
         bKiPu3QCFp2Ffzn6H83Jz4EMebxXrPD2eXaygc9LWsAPSd/FSs+Ms+HEW+N4ybxwN3YG
         FHyUhID0Z3uXceLPgcoKSFg+a5SEPR8wdZmAj5LDJiPNd/DjcRM0RRRQ7Y/Hpm+W5/5C
         SrZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MAkoMAcM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 189si1187941ybi.121.2019.02.22.09.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 09:37:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MAkoMAcM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54780 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxElB-0007OJ-Qo
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 12:37:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gxEkz-0007MV-Od
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 12:37:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gxEky-0006jB-Hj
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 12:37:05 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35059)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gxEky-0006Os-09
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 12:37:04 -0500
Received: by mail-oi1-x244.google.com with SMTP id u128so2354055oie.2
	for <qemu-arm@nongnu.org>; Fri, 22 Feb 2019 09:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8esmt5AbMXZqHWlBSlu1Ql14BbhcJOxiy4g5pfksAI8=;
	b=MAkoMAcMZdFKDhQEWUp11NlYUw1ECBy/CsHXTiJAlH4opm1Ro5dsFJRMVf3HFcfFIK
	6hw5Q4e90pBO8yH6HpwSfZO8BkQ1Fn6Rgld8rCMiMFl/k2uoy46mtI3iBNibhqFnHRRk
	sNOYW1jR6OR8WX+fvOMFY+gTXcoXUBilloIxSHSQcKZmHAfsW/h9eSWNbmbWsaI7s9L0
	adnikOCeAD1LKKpvvMW+p590CPjTv6/+sBD2x1Nl/525YnbXXifbNRWSUgS9BzdmKnoR
	mtQ8mG+770MwISn3EEfG+wtuKOOAmqa2o7TXZ7Tccu0AyVMqHLBe5zhY3zjES0/0Xrja
	NXNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8esmt5AbMXZqHWlBSlu1Ql14BbhcJOxiy4g5pfksAI8=;
	b=anvjSEwfKjRlz+2XSTRwTRdkOPuqdNcKNjIZrRV4ZWN4W3v7GttWb4tNcKN2mH0yGJ
	Al/qnHF8p7uMoQrn6VAyRipZS1Cbc22MPAA0eTJyIFTSdgCdfYUjcPmyA/9/VGmLABdv
	I3ZyAGfowajkYDpRSyTlUeZV1B/56DdYpmfEEkTCzSEyoSuKXQ5HRf5sIY6+oHFLT/ZH
	ubS7Ehj6RzNSdRgIRhSXBVVID7loTfGchdIaIMFDfeNYgQnt7OkwloEmi0wgdXb2mRwI
	NJDR/gukIB96vEw+S9NXnib9qdo5VMtALGCugscnI36j7vLwEX2BfGb9MEaviQG7kD7G
	npRw==
X-Gm-Message-State: AHQUAuZudSh867QLJdgfKbtb+M/AobmS3mdjGQAVZF5U/qWvDCmXspNw
	jTTg2ZAmPalamATu94TdA1zMKw0QFqz6DNrAyHyClEix
X-Received: by 2002:aca:ab11:: with SMTP id u17mr3291326oie.98.1550857000632; 
	Fri, 22 Feb 2019 09:36:40 -0800 (PST)
MIME-Version: 1.0
References: <20190222170936.13268-1-peter.maydell@linaro.org>
	<20190222170936.13268-3-peter.maydell@linaro.org>
In-Reply-To: <20190222170936.13268-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Feb 2019 17:36:29 +0000
Message-ID: <CAFEAcA-YCosZjWEiLC6cc8Z7rfOUQMLYZJX48MKOYuZNQQVR_A@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH 2/2] target/arm: Gate "miscellaneous FP"
 insns by ID register field
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nnzatc7Drt9A

On Fri, 22 Feb 2019 at 17:09, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> There is a set of VFP instructions which we implement in
> disas_vfp_v8_insn() and gate on the ARM_FEATURE_V8 bit.
> These were all first introduced in v8 for A-profile, but in
> M-profile they appeared in v7M. Gate them on the MVFR2
> FPMisc field instead, and rename the function appropriately.

> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index b7702fb49f7..af8f9e669b8 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -3357,7 +3357,7 @@ static const uint8_t fp_decode_rm[] = {
>      FPROUNDING_NEGINF,
>  };
>
> -static int disas_vfp_v8_insn(DisasContext *s, uint32_t insn)
> +static int disas_vfp_misc_insn(DisasContext *s, uint32_t insn)
>  {
>      uint32_t rd, rn, rm, dp = extract32(insn, 8, 1);
>

Oops, I forgot to commit this part of the change:

@@ -3361,10 +3361,6 @@ static int disas_vfp_misc_insn(DisasContext *s,
uint32_t insn)
 {
     uint32_t rd, rn, rm, dp = extract32(insn, 8, 1);

-    if (!arm_dc_feature(s, ARM_FEATURE_V8)) {
-        return 1;
-    }
-
     if (dp) {
         VFP_DREG_D(rd, insn);
         VFP_DREG_N(rn, insn);

thanks
-- PMM
