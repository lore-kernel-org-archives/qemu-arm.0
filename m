Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A2BCA5FF0
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:24:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfqt-00013Z-5q; Mon, 05 Oct 2026 06:23:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xDfpj-0006DA-DJ
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:22:13 -0400
Received: from mail-yx2-x0c.google.com ([2607:f8b0:4864:41::c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xDfph-0001SR-TG
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:22:11 -0400
Received: by mail-yx2-x0c.google.com with SMTP id
 00721157ae682-8ab445ac183so13332387b3.3
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791195728; cv=none;
 d=google.com; s=arc-20260327;
 b=QPMlh4i3J37PcwKLhq5paTrAYyoap6TEExeyw3RZrdM02xaOBPmMr/1WQ7GVScTYSy
 Ne9mIgh7vHUgpNEpem9vzqfHnZomNIgLOQRz72o8CL7XT+U+X0nebNT8ARIWhsBxme7M
 nLXgPb7Ni1X/DHNsLuVD9UvFWrXhwdqUb9d6SiVivMp8RFjEa5ThHw0tQEdZgmnWy0Ox
 qkwBPS4NXLlhAsMaHkcIzH6aqwnuUxVn35D8CHFi18dRw8mHsN3R/sEi8kzVTSImeZc/
 Y9uW0zkokaznkBIAA0+KHYz8l7rb7rdPaxb+Pdfj1LFcei4IGS2xB1jevXhA1oYIidi7
 escw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=sqWtUnPJUFRrz3Q7YgFC/UguLabWTP65yRRQnW0kLBI=;
 fh=clHTOD46OX3M5se3UvNKEUeyNxhw10nr0xh1zIExp4E=;
 b=RWvTXmFCflK8U/jiKw4XNaei91faRl6JBnvcpxQh93D0stKF6fHX4Ok/8zSkq03U5H
 m0IQdgaAP+1szdzko2LbyigK/ljmfJI4dTZdvdTFj9NlByq3zsx3y+NMCtnn0lz07Rwj
 AvK8AKs59yPmLH1833AHIw63w1Dl+qrXbNRBfz677UKZOz6UnKptmcYgRhk13BZFNegl
 P52gTduadRLdhdS4lFbRQh0gjng14e5hdc8Eu0+3Hab6j2HxuiDgh06whFZWHD2GkX8z
 nQfKsF+yhNFvNx6TQqRvaIC0Iv9kyUKrRfcCMY61NJoFVk/ETHoiOTVvvh9pnAoUXsFE
 e0OA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791195728; x=1791800528; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=sqWtUnPJUFRrz3Q7YgFC/UguLabWTP65yRRQnW0kLBI=;
 b=Gi801J2lhW/f9GWR44wTD1Ro8mMRbEFt6ZK5Obyy5V/qBNLb4SoDv4fy8+1fY2Jar/
 j+yOGzKSluacsnCditlbO1/+1eaAtY0U25pSHNDBFI/Xgbc1SJS3jANz735mz4JIFFqv
 m6UmCVERDT9N21RuU9MGXguOhfAZm3BkJYeRnD0Mm28jStH7Aost1EjBvUvgqk9liH1r
 6ngVBJH1g8lXYR8Ej8XZwXqPnn6Ua6jeQb4CS0wC9KJifJ7W3Y+mcjRkQv3q8ZbTIOYt
 b+xiZQf49b9KguKrIxJhq7cn8nSH0Cqg1vjey0LqzcNyNeO+r37M2xaMxnBJhFhO68mu
 fPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195728; x=1791800528;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=sqWtUnPJUFRrz3Q7YgFC/UguLabWTP65yRRQnW0kLBI=;
 b=0Xn73sW4gfq4OHumOrS5lF1HtDHU+/0ZSgmUDZhwDLM3xim01xf2J8EuoxUoMbxkkb
 O0BTs5+Xd4Q2so7vQ5FSNsNplh/++dOVv63JTM0p7ld+sDOMr6NXwgAEtLuhBPLdKJSd
 BmNaOeZuNwQZYIwNTfnrqOBSlN4TDzMiDNoB1AxEyp4+srEj+TL50UclGQ9gXjy02CTI
 u4CCVogk/dXE3dNVS57vrmWxGzyKyYEH/mj/gHrVe/tpX0RSYaljN8V8+pRO5sUlWHmq
 shF3krnakYvUTMilMaDHBTPC5b7vz5Jraqz07yboKhFSXTSGXQE0ncXNyQhxeZwwoU1G
 9+ow==
X-Forwarded-Encrypted: i=1;
 AKwUvBybjIVBHblgNtMZYV/LyX7GhVypV18rp22AFyOhQD0Uuqbs/WhQP8AROL7/tj2qREYBWTQTBgBmyA==@nongnu.org
X-Gm-Message-State: AFq9FYIKoEsaCn6ZjKSWuGytglYKuX1iJMKGKJ5IPuuj9uwzR0ksn+GV
 5UxrvSk+IZ8Re2bmz8XsgbAlk6RrGGtma0UBFK0SDJuP44kohwZfsnvtAEs/Yf1+7E0990mMsPX
 Q2b1vfgU0GL371W26zyldiJHd50mk4M5S7b3Xz0GMnQ==
X-Gm-Gg: AYBFou10KagjSbhkDk3a6K7SXPUIWhlh3hLVwETgUECxF/q/cfaYENrMFZIlqx723Q1
 UypaIUCNP4mH5oRcuL5I+0eZXf+nD7yDRF9D9WHzpuU+oT+OYLcWUt+/sz5len8VfdaUjGfAi3j
 jQucBaLnVNJAonkXnTkevyHtEib34FGVuIpCNUGX6tkOQIQ2t9RzFBQN36Fm+MIZfpV/RQO+pYj
 oqASMG4P/l2UjzoP0Usn1oVhkmNxyOm9G+06dPCqc+WCkFDs81e5/Div+H94oC3+5ZsbybfQokw
 +mLQUGOXYbsxN81Lt+2aZqwuT3+5hQUQgEMA3w1le3vBzpKtTD8yh7hDpB4t8C3g2IBSdkiHPSA
 aKtlbfSZh+iBmADUpO03XLOo8ct0OroAnqsCEg8s=
X-Received: by 2002:a05:690c:e0d0:20b0:87d:b776:c659 with SMTP id
 00721157ae682-8ae392b69fbmr32255737b3.11.1791195728187; Mon, 05 Oct 2026
 03:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20261005101800.10821-1-shentey@gmail.com>
 <20261005101800.10821-3-shentey@gmail.com>
In-Reply-To: <20261005101800.10821-3-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Oct 2026 11:21:56 +0100
X-Gm-Features: AclHuK82AhiTED4Taf48DHXN3-rU8axogLreps_k5XYFoTPGqJkm_1q9xHVTNTk
Message-ID: <CAFEAcA-agZs6r50+grUT22CFRKARwU9Ad9nPY7EOs_scN7aV+w@mail.gmail.com>
Subject: Re: [PATCH v3 02/31] hw/watchdog/wdt_imx2: Fix handling of write one
 once WCR bits
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org, 
 Bin Meng <bin.meng@processmission.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

On Mon, 5 Oct 2026 at 11:18, Bernhard Beschow <shentey@gmail.com> wrote:
>
> In locked state, the WDE and WDT bits of the WCR register are one and
> need to be preserved when written. At the moment, the logic is reversed
> such that all but the locked bits are preserved in locked state. Fix
> that.
>
> Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog
> support")
> cc: qemu-stable
> Reported-by: Bin Meng <bin.meng@processmission.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

