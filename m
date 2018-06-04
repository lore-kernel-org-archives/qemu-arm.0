Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp878272wrq;
        Mon, 4 Jun 2018 10:36:56 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJZ3JcVXlZWtaJAjXj++AKiCLipcdj4oJJcXXxdfUKf8FkKk4vQZ+Mhp+WrR9L0oF9rj1tN
X-Received: by 2002:a37:1a1d:: with SMTP id a29-v6mr19890142qka.426.1528133816702;
        Mon, 04 Jun 2018 10:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528133816; cv=none;
        d=google.com; s=arc-20160816;
        b=CW6Xe6qOXGEGoz4KbZVmLsOO4KVmY6wAp5Ac7spgrRhz6v/BFIPlT42IU2+cMaQfQU
         qOT4My1Z3H74xYPhUZRq0FU7FXTMelzfS7xX/k7CmCyFNPCukDpSkYhp7Ce3axVJUd7g
         DoIjLRNAlL6niwG575EAdXo5U9zcvRg6TZYO8K/MsJNBgQmsJQxJMGeP0mABvEvHAyWI
         wNxp8/GTKX4udIHklIJvpyL89GJvmnGPPdyRPiFNHxIQSptZpQh151LbS5svcK8vERl7
         /2zVo+fP4PKj0V7j/RqShiJkkhVSxXDJIWoClEh3JzwdTCqiN6UWi/Rg24jW6oW+iK0+
         ZsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=cIRklwnJWdU9a5mTM+zpLYwblNoBY4nD0nM5kTqho/U=;
        b=RdPr3rxU0GGcE/E/n9ZguuUBdRs9v/n+xpqMXwQ/C+VHGANxLgjWgDEvk/QZpguAsq
         CzHV6Rk+zf7H//wRxybCVwiSm1787kujCyYKrMEvhnjcpdumqGZHFqF+suJFlCm8Qi6o
         vtAoI5Sf7K7DEMwvWhZ7903ZHIMcFkfw4Fu7qGUjct94F4ZgEufS9VaIHm8ugrBbsyj5
         /f2pESQxSqUbp4j+Zl4CV4hmKuGlKJdjckBH0Qrh8DfVa92X21Hfr4bsvcFKTG21NmGu
         43j28l11bxhPlW4rhv4gWsf8Lu6PXixd9WNxVDlp42dko0/bWWhXLrSSnP6Y4wu8M22G
         jmow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WWfKJV9/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f6-v6si2581857qvf.25.2018.06.04.10.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Jun 2018 10:36:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WWfKJV9/;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41236 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPtPc-000780-8X
	for alex.bennee@linaro.org; Mon, 04 Jun 2018 13:36:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPtPT-00077m-QM
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 13:36:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fPtPT-0007ax-1s
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 13:36:47 -0400
Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231]:33769)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fPtPS-0007aF-Ns
	for qemu-arm@nongnu.org; Mon, 04 Jun 2018 13:36:46 -0400
Received: by mail-oi0-x231.google.com with SMTP id k5-v6so29169237oiw.0
	for <qemu-arm@nongnu.org>; Mon, 04 Jun 2018 10:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cIRklwnJWdU9a5mTM+zpLYwblNoBY4nD0nM5kTqho/U=;
	b=WWfKJV9/IiL0RnZtqbUR5dh9LGrFcAt2Jmew6viqatajJ6uOU6UhY+Wqo1UlZkJho2
	CUJSsQTWJcdl69Qh6Qbtla3IoBbEDYAodfXleiq7IzJcHA7B/RnSjA5A8pvpC9cmHCvl
	NfAm58veFvW98WzOyhXV8Lkp7lU314obIVLAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cIRklwnJWdU9a5mTM+zpLYwblNoBY4nD0nM5kTqho/U=;
	b=rJuHfh17zqytOjMyJTVKKN+xC8hjXaGh8VybVJ5V9Ww2Ydj0dG/Ow0xL+kUkMef/rN
	aTg07LAGjq/FD9CjTwgcch0pDWD3w2A4wHqMdwtRFuH6w4YxAg0Z/+MFAOAoPHpagPIo
	XwZiLVoc9weQ97CfsrWDfBz1yEkymW1lM8ZLlqj5clEi9rbirZukF//7krxVkZRODwoz
	ENEWTDBvEvjvRvkOmzEa31NfgOf869Kw4nfh71CGgNOIvOn+wHaH6NAgmsp1o8eFGdOB
	goQQFqdB6P3s7hGFJcg+oCJFNrl6JEKpyc41KOC4oCWfifPdnZGuvt8jF/P5OJjg5onN
	tT7A==
X-Gm-Message-State: APt69E2YKkyo+8ELszsQR8NXO5rmlSVBhZwAb8Uu7DgbPKhcfQLpoquk
	dIcumNnlllLYm/wQYgIzsde/rTgTdekF1hCiR+Nd0A==
X-Received: by 2002:aca:4384:: with SMTP id
	q126-v6mr11682783oia.164.1528133805893; 
	Mon, 04 Jun 2018 10:36:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 10:36:25 -0700 (PDT)
In-Reply-To: <20180530180120.13355-13-richard.henderson@linaro.org>
References: <20180530180120.13355-1-richard.henderson@linaro.org>
	<20180530180120.13355-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jun 2018 18:36:25 +0100
Message-ID: <CAFEAcA-LSPY-_6SwH-Rx1tcK7DGE0PX0xVYVt_SwtChKuxTKLg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::231
Subject: Re: [Qemu-arm] [PATCH v3b 12/18] target/arm: Implement SVE Integer
 Compare - Immediate Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EB2pI/1DFApN

On 30 May 2018 at 19:01, Richard Henderson <richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    | 44 +++++++++++++++++++
>  target/arm/sve_helper.c    | 88 ++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 66 ++++++++++++++++++++++++++++
>  target/arm/sve.decode      | 23 ++++++++++
>  4 files changed, 221 insertions(+)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
