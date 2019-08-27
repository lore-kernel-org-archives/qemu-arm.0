Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4971508wrs;
        Tue, 27 Aug 2019 02:09:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx6bnMOaoLpqNirC2uGIO3lDDJrrR48fA/CHYM+yL3dCCpah3ZLr4SVcvAVM/q9fWxXKD9C
X-Received: by 2002:ac8:134c:: with SMTP id f12mr21232630qtj.75.1566896998808;
        Tue, 27 Aug 2019 02:09:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566896998; cv=none;
        d=google.com; s=arc-20160816;
        b=xhhjZyHw3OxAar0tz4I8w5JafWbaxCLtKJJxQYaRa4/vvA5If802b8HBMvtleIlIVq
         kQEGqsZ5M7wRFoXqXZg51r3dtBnWKm1sRLZ1bcm9koOMz8uM0WlfTL0/W6iWBJWYtvMN
         SMgDJyRs/RTDYQYPO+W6r7PyFK3ahPps+FYM4tjmAvXjUPfVm2p8oe/JynwVNQSWWBg/
         /Yonwt0086u9Y7qdNNYg9VmU1yC28x8eCrtZK0aR2oI/ZKyfczHlPqCGkoN6z+WKt9+U
         30TQE+/mXdGmf6P+y8F2AKYs62qq86u1kvpbu5DtuM6nEsiU8dd3bP5Ytxi3aSx+lt4S
         A5Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1EWzAyIKULK5KhKTiy84VfjQK0O/wqhL/kLuA3rc5CQ=;
        b=AHP+HCkr4FdVefhUvL93vMTJ9dsaSqnluC/7MEHHR/SKhHfge8coeBCXoFeGAsEaxG
         DJWScxRSzn9TMeKkxurt5fu2FBz+m0iIKughiv1ALogVL1MYC69eqDMtlHX9sbIr5yQ7
         m8YATMe5dbmP+bM1QEcX+n4qZzPIh11a1vjmCGg1bvx1d9U6V2PR72IShgp8mDj9XvVc
         b34xBSTDeS/agZs72YuGrCKjqXMPJnrvGYQdwaNic2MepgfMzDhory2cGTlfmNa3k8CB
         Zj3k7TQkrLHasfmMXZwVo6EihT88NfnMedU1vFht+sU5kxfReWb6+JImguVI6G/LwF+F
         uUIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q4YUWOOt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t14si9455390qkm.0.2019.08.27.02.09.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 02:09:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q4YUWOOt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2XUE-0005JE-64
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 05:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2XU4-0005IN-2L
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:09:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2XU2-00057V-Vq
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:09:47 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33377)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2XU2-000575-Qg
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:09:46 -0400
Received: by mail-ot1-x341.google.com with SMTP id p23so13811275oto.0
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 02:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1EWzAyIKULK5KhKTiy84VfjQK0O/wqhL/kLuA3rc5CQ=;
 b=Q4YUWOOtUe1EzhbaovL27cKlTWizNJYuP0lvqyyW8einsmRSbQQLfFvZbRYZNHxc5L
 StXNfGBSYpeTy0Rr7gMkY4DQ1ICYx4b6qK18aUK1LnNr8BWZH5jQOWew3Gmzv+Z7pI+o
 srynq13RYWXuGsu/qdSJhdtI55op3W3z7xCgSr8VFND1lrAZSoCxf0CxnBuevDUCRH7z
 S/onNiaa2+Kc8sTk/Q+GX+moMTdFbFdKlEydttjztGnT4/ILyQhfVNhRU2V8Av7ysAkH
 QUnMBzUScXpFn70zEdUsM72LgGqrZD9/b5oakSn9z5Js6OM0UnZA+J0iK1vivJWxoXAC
 yiBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1EWzAyIKULK5KhKTiy84VfjQK0O/wqhL/kLuA3rc5CQ=;
 b=m+nRT8lymqIJZnAn9GNigQHjRAcP7ZDOlmnauQPqqwRyt/2r/6lgAderndXWzBkV+Z
 mnY2S2gpsRFKPhdq29gbI5kAmr93LeQeVOg9FwEg0b26QVCrXaKtOVeiXUIfbS/PH3eT
 5IbCoItGtChIZOCfFALZkXB++ckjLoVljAJXMjf79+qZMSjrYNmm/SkFQvoEkE2guEYH
 W/VPxiif3+4v5vOC9S9Gu1ipdzpsH0oz2cWqa6iM4X/YLdM+kTK0ku1tFNSCXlVDnme1
 FNy9qWiIe1mGQIW5KJUw42yDoBLu6kPpZEn9p0LLOuhbsp8OW7ShXzNfOWrB/hIFrore
 SlZw==
X-Gm-Message-State: APjAAAUUqpvJWPkEz4reOH+aiVwPSSFKdR506pcZYdVymVUSqEl8ICu1
 Tgse1iarQ5pW3bkWLf4R6KWVpIxPgzXcnvwd/9bHyw==
X-Received: by 2002:a9d:5e11:: with SMTP id d17mr8101541oti.135.1566896985947; 
 Tue, 27 Aug 2019 02:09:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-64-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-64-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 10:09:34 +0100
Message-ID: <CAFEAcA_0QCVTzyDcSHLg0Ce9Z2S+CQMikWxGZAvVt2D1o7gizA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v2 63/68] target/arm: Convert T16,
 shift immediate
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
X-TUID: tEebSJp0LXq7

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 26 ++------------------------
>  target/arm/t16.decode  |  8 ++++++++
>  2 files changed, 10 insertions(+), 24 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
