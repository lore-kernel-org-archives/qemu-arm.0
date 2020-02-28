Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp855988lfg;
        Fri, 28 Feb 2020 08:26:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqxdkSemkrbMpo4hQ86ox3taIPuDlwXq4o7LpPjIXQo4kSkx9cxd6oMODnxZ/VJ4wPTRGvWx
X-Received: by 2002:a05:620a:954:: with SMTP id w20mr5034756qkw.135.1582907177243;
        Fri, 28 Feb 2020 08:26:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582907177; cv=none;
        d=google.com; s=arc-20160816;
        b=sMmy0QyAxFxEXfGmA7UgC0humNlKbeCn80lTh284tWYnbY5fh+pnsVubb6mdWWUQ80
         U9HoQwgpAaX6UIyxx8vsAY75e6NC3wR3Vqc3nmLqFNhd3iIHMIEVGOAc5ZAoNxhKI6DR
         gudcjeZeu6bveyEo+E1mWMWf0ESlUYS/GFY3Pn6k+GsG1oZ9HYTtDvMAXvJxa2TekmwI
         GXk9xvXbvYJ0afGbiz1nTKP7Lq7249lD6PgseA5ACCeOjIOQqqZ+XFj/H2yMYfBCE8Xz
         qogit5Ivv1xX7N2NxeVOCM2Xy12sFxanfqIDMzofwJ/a4o5XegJYV0pLM3Jqrl8VdhEX
         RmiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VGCuSvfY75g5sc3ElLCBkrQCQ48WR1jelO0mTBxqlUI=;
        b=08XjxF0yv8Xea5Gl7gF/zstBKAS9wssuKFSAjLxjPnGM5EFqN2JzKF78HMrIUOw9+G
         Ay3DdkByzH9kyXxC5/4W1LhLX35lhXnuWdNmIWF/kSLacAk7loZiOZ2zk1QgOP8WC9zX
         66MVnxXe+dgU4x0ycieF5TF3KfqUFR11h1R/ojfprovD8/1rApYdwWNa7ihYyCVqOqPb
         bqe11za9R81oc5WJ5Glzrm4xmru40Xr2SooPGg0gdByThm+Ot8pyH94c9fdxx/VMZUSK
         YPfNvxsoP1rugEgETfmy5jjaQvZCYSop6VE3yPGSEhdySaBO7d2WffWPCqvxq/03emrj
         ZDjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=trBAFcd3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x33si1686159qtc.180.2020.02.28.08.26.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 08:26:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=trBAFcd3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7iSu-0008Bt-DE
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 11:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iSk-00089p-Kp
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:26:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7iSj-0007vX-O1
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:26:06 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:45784)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7iSj-0007v8-JQ
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 11:26:05 -0500
Received: by mail-ot1-x343.google.com with SMTP id 59so3058763otp.12
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 08:26:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VGCuSvfY75g5sc3ElLCBkrQCQ48WR1jelO0mTBxqlUI=;
 b=trBAFcd3VDgehG4PbOpE670xY092wQp7jyS4QcN5fkQbUU5SJ7gfdnK88AtyvJxb2J
 GRpyBKrjHKAYq+b+ClJ6n35RNfmwCMfno9eZ/UFeaQuGi5JO50wBDIVGgU/rTBYE/S2F
 CRLHp1GxxNHGh/mgZZHajhz13dqIeRWgYkGozzmBqnfdJjToUzLKF6rrf41oKJ/DbKYF
 ObPApkoknwxBtAV+osI+iT7vzR8qB+zK2sDAx8wId6MsPbEz6tbIYf9Izd3k/wkzTIEI
 2czuPr25iIluEXvq96T9HrLf4SPKEM9uidIDJf9sKgTya4l8cY2kEKfuNytB3c0P/dx6
 Ig/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VGCuSvfY75g5sc3ElLCBkrQCQ48WR1jelO0mTBxqlUI=;
 b=jUwGDS6BMWmNExVR+UgcRxgq8OnTlOkAO55Plk0yhykPRjHHeldGZmHW2g5nLeIFFc
 Fu5gPGHaRz9Gdd7WWwDtGQ0qxjTTRZL1Izlpa/ZiWSFWnepVg7PdRCmbriywTRLZ7TRo
 d3Qkwb4MrEi7GwdRv+TvivzRpTnUhABIZLzxwfMpeVNpY7ngWHZYoJ5dX0LfO+0nNxL3
 ncaTfblE7P9Oqt7Z6bIYIXdna5xT6Op1tZqTdvXMUQO6ZFvNJ/yYIC+gSNpMfuUanegO
 QvcZ983lzXemSoCqxhryoCa5rqCsIGUHzgGKqro+JiYkpUF/27g1wixUaOU7m+vVOjIo
 i3CA==
X-Gm-Message-State: APjAAAU26nB6U91tqJti+PQZN2qP0/udcE38TgW74lyEmH/X2D+Vtxv/
 /DwT9Fsyar+xBVQCcrXR+mCLw6givKn4ziDUPZ7nDA==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr3774515otq.97.1582907165009; 
 Fri, 28 Feb 2020 08:26:05 -0800 (PST)
MIME-Version: 1.0
References: <20200225180831.26078-1-richard.henderson@linaro.org>
 <20200225180831.26078-7-richard.henderson@linaro.org>
In-Reply-To: <20200225180831.26078-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Feb 2020 16:25:54 +0000
Message-ID: <CAFEAcA_8yawDBorweYE1vQ-eqwnQJrUVWJrFCE44hH0gT3YWUQ@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] target/arm: Honor the HCR_EL2.TPU bit
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
X-TUID: /XSFzyg0z/XF

On Tue, 25 Feb 2020 at 18:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This bit traps EL1 access to cache maintenance insns that operate
> to the point of unification.  There are no longer any references to
> plain aa64_cacheop_access, so remove it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v4: Fix el0 fallthru (pmm).
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
