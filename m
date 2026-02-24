Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2CC0F3C9AE
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 16:26:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuvEU-0003PJ-Ab; Tue, 24 Feb 2026 11:25:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuvEP-0003NK-25
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 11:25:54 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuvEL-0005hh-Ku
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 11:25:52 -0500
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b88593aa4dcso805444866b.3
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 08:25:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771950334; cv=none;
 d=google.com; s=arc-20240605;
 b=hz4jOvmCDh8vAm0c1jIh44RAriq8ixIEQl8gRyK01l7sA1F4hWMou3Lvga2LUu0qiZ
 rku+oJbNVEWX6QfcWcP/EwJNYYoYOLNJhSU+X85SqKHaOMKyGQlX+PvwSGksPZYpul3G
 36D2mSoY19CRKwmSaiVax6PnhVNbrJ9nQOmYQa0GjDECefRYognevnKob0iLBDcan3Gr
 a9iovlgMlhQTMguKVfxVjrxjOwgS0P6otsG/opMKsrPQ/i3GhFNk7KwU2XFoOzlwwbNI
 s6YswaKAfNRAxTwOaBkK6FELFqhXdd6w2Pz3+8ozML1bysc49/9+lTBxQaLQsvaXUY6L
 6T/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=LlaW/iLqxXy1/nsGtsTdVe3Q5EDwrQub1KATZa42W8g=;
 fh=DQKGvaUa1zWIpv3SFsiClZFTVGOAdthlKFXsyXaGYdg=;
 b=LjavkbtdNF0/I7UXo55YEfwwMewD0ISsv+yetlpmt1kOn6UmzJM+Zc8YddVptbpSkn
 yTyEWmpweKj4qYbEEfxLZc0Ity+ABADfGaeHlKu1lLiT/3o3ijxddCvXgS3VEWX9j1Q8
 RzyrpCg9QIznsefose2o2vriHxKGSyy8r7FTFPURPjintMu8DcuHHdfs/geseDTzjyNt
 J93lFkeIFRh0S4ihTztZ1xVsZkgLTWMrEsNuiwQtZ5irYF0O6B4GedU7SSI5ZNym/2rO
 TGprK6vGpg20/GxpuzcbtZQnFi4fWNoL8Z8uUE0WK3FyJ5wggESBS7XxsAU5AZhV/HtA
 25vw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771950334; x=1772555134; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LlaW/iLqxXy1/nsGtsTdVe3Q5EDwrQub1KATZa42W8g=;
 b=DBwGIgmnrBHPGTHeRUFGv/rf86kqBLSgQxRiSa0EX8jCYtwJMoc7WiGwiWBV1myXtm
 PRCGYUCelUKMhSUqGZl04onboXR6Hv6WLV0bUKunUq5hY0JSSVN/rS3iHteq8bp/+VeQ
 yaoRXxlPr1pGMQZCe+hltiuMQfyUHNuOgP24vKGxEYFqqTle85vUTXa875B+BvEOCoSV
 u2bcVGu1OMn8Wp9rDPUrnFcbQ/R6CHZy8S3aeGl9IrGLmnPTtmD9P04DmBNwWWTtORRZ
 x9Ds4JqZRZeiWEP2oIC2xJ5c/tBR/Y55XI/lP6hZBisUBDXxVSBWtWY6kSn4B/thCLM9
 unxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771950334; x=1772555134;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LlaW/iLqxXy1/nsGtsTdVe3Q5EDwrQub1KATZa42W8g=;
 b=cdT0Ysych3pe5rp+fB7F5unJKM7ftzcCFoHPCc7/bGXNcnikKQhCB+Pk3SN71lLVOQ
 4i0bss11R/ESaYzQIyoWymqeYocNuSjJIrXleDJ+nYUWDSBBxFvE71esZqZsblYw3q7o
 vh5oU2myoPvmrKfuf/CY7bue4GgSybaibjq0myrSc8Y5urzC4Cs5UtdiTIHKcXIg0KRU
 0CGtLv3P+RtsDP0Ausmg481fNTve3IxGCzFvgqmoX0AgZCqKiS1GUik6AsTreJ88M7tS
 SxP5sHyTnLF9fdFrSgvUTOfxu2cjO1i1o4Bvf9gOdkw8PIc2ZP3c8IJhUL0RLQ7o06QB
 S08g==
X-Gm-Message-State: AOJu0YyYkF8BSMjnkKD0TG6HR5mFOLYRQ3rdL6ySt0kpfaMFDKbQXVKp
 xjmo3nEI388WdVrpPFLM185b5s6jScY46Rz+Ni87s5Bwry+kK9rDnWh2XrMeRC9boU8/wHELUBm
 gj9T1u5z3uDUqJc8SXCVp4X7C9ctMmtYv5m/0Bh9SiQ==
X-Gm-Gg: ATEYQzwbwUY7MomS1kDn5A3sNaCorpXiXcXAvg6LETiRcIv9Mr6KzRA9p5CcECMCeft
 kowBSMiZFwfAIRD2L55tawoeHNTlsbeHZQNb9eJm5LRbYXLgE9VOeBTJyBKZYvkpYfVKqvnsWdR
 aeLiCYerQObjbCos/usub+2Xk8thOipZrfleqDuhCsOb4FXt3Yy2xJHqC3dXK8rDMN0wbEzj6Jf
 rcCSIwHL3rKw91ABlCcbc4KOqpr3xGku6c135XcurqhpVakywd+lHMhbWxU3xb8lIIkmIiL4giz
 kovHaYxyNoujL3u/OCvtokIiMnMSnmVJK60Uy+tzowRH15VMTJdA0YYn/nrCx/MFJbeU52M+K/G
 5KA==
X-Received: by 2002:a17:907:a43:b0:b83:b7c5:de2c with SMTP id
 a640c23a62f3a-b9081986379mr832729366b.10.1771950333833; Tue, 24 Feb 2026
 08:25:33 -0800 (PST)
MIME-Version: 1.0
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
 <20260202133353.2231685-6-peter.maydell@linaro.org>
 <7ffe8bf6-bd94-4f7f-aa77-274c90d1aa78@tls.msk.ru>
In-Reply-To: <7ffe8bf6-bd94-4f7f-aa77-274c90d1aa78@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Feb 2026 16:25:20 +0000
X-Gm-Features: AaiRm53MUn7Csb7YhgFkm-SftTRUdbqnL2h_ooGFYYKbzTkT98toSs7lqnz_6xg
Message-ID: <CAFEAcA-iqQnwYnKR3BLE7VO0iAOSOjcOWADFw7XGu9kLB-f8Tw@mail.gmail.com>
Subject: Re: [PATCH v3 05/15] target/arm: Don't let 'sme=on' downgrade SME
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Sat, 21 Feb 2026 at 07:19, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 02.02.2026 16:33, Peter Maydell wrote:
> > In our handling of the boolean 'sme' CPU property, we write this 0/1
> > value directly to ID_AA64PFR1_EL1.SME.  This worked when the only
> > valid values in that field were 0 (for no SME) and 1 (for SME1).
> > However, with the addition of SME2 the SME field can now also read 2.
> > This means that "-cpu max,sme=on" will result in an inconsistent set
> > of ID registers, where ID_AA64PFR1_EL1.SME claims SME1 but
> > ID_AA64SMFR0_EL1.SMEver claims SME2p1.  This isn't a valid thing to
> > report, and confuses Linux into reporting SME2 to userspace but not
> > actually enabling userspace access for it.
> >
> > Fix this bug by having arm_cpu_sme_finalize() fix up the
> > ID_AA64PFR1_EL1.SME field to match ID_AA64SMFR0.SMEver.  This means
> > the "sme" property's semantics are "off" for "no SME" and "on" for
> > "enable at whatever the default SME version this CPU provides is".
> >
> > Update the documentation to clarify what 'sve=on' and 'sme=on' do.
> > (We don't have the equivalent bug for 'sve=on' because
> > ID_AA64PFR0_EL1.SVE only has 0 and 1 as valid values, but the
> > semantics of the property are the same.)
> >
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Hi!
>
> I suppose this change makes sense for 10.0.x (LTS) series to.  There,
> since it lacks idregs conversion which happened during 10.1 development
> cycle, I had to adjust the change.
>
> The result is at
> https://gitlab.com/mjt0k/qemu/-/commit/3c1f1b8065c625040787c2c89d22d5602100aeb4
> (I kept original code fragments - using idregs - in comments).
>
> Please let me know if I should've done something different here, for
> example not picking up this change for 10.0.x :)

Thanks for the ping -- there's nothing technically wrong with your
backport and it would be harmless to have it in 10.0.x, but the
support for the SME2 feature that makes "just write 0" become a bug
only went in from the 10.1 release, so we don't need to backport
the fix any further back than that.

thanks
-- PMM

