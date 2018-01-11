Received: by 10.28.173.206 with SMTP id w197csp844024wme;
        Thu, 11 Jan 2018 10:21:18 -0800 (PST)
X-Google-Smtp-Source: ACJfBouL/O74R6H8xAMpsE0MkB6f+2qhsfzl4emRW2BW3c6A5cHG6/az/bxP67XkRBZW7BVbyjxM
X-Received: by 10.129.85.3 with SMTP id j3mr13493535ywb.351.1515694878356;
        Thu, 11 Jan 2018 10:21:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515694878; cv=none;
        d=google.com; s=arc-20160816;
        b=Aw4fRKIzlFVE4gHampsy6T+Fofm65ebNub181y7vOtw6X782KL4sJci4qp51h8E1K/
         ct1NuQPbz0kadSPZwKJTEqccRcy6w1Ak9zYIUaTX2YkDTJAkQjIDvPw/tdW5kViTQc2K
         0oohOpyj6rPkV0vF3CIZ12HjbVbQI8oGERjT0ujHCxhVU9hCzziKRfBXkfYwspa9QBC8
         I7+MQzV1VSGscWMCMn+h4/ObNRvTwHGnI/E2cDY847b6GeisPwwKOql4V9b9e1N+DUBG
         +ruMgJcq4HXXN7+zdpOT2VPWyRdTFAMeoXh0LjiXGTHHxQEoCDWUPlvncOozGg4wMLMn
         q7sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=pNhw5WLhAMHjJmO1JRBIZg5vBxfsdn37RulOwNNsM7g=;
        b=Rea+POLu42UYLvIv1PSncT+ojdE/Vd9WXyKwknKhnX4op7SzuCCkNtctFRpAnVCH7X
         WsRntFZLuxD+mvqiGvzLhTFGNfESO3lpgWvuqzqXE4eb0YR/8XNt+dYZ5+/rMcu4e/wJ
         9pN9M9cLGJn+KMkwmX30a9RJFZ+51YTj9uOrgY0VuLpooFi3210NcWaXlMX4y9zjUNag
         7euc764On8/muIfKzURR/2owbkjXtVUbpwMiD66Cw16+0pSfmKXHkjFYLzCa9QTVat//
         fsV+6ghOHENwPbYe5qpCGb6rVSHIRpr4RNhLw47CmoeZLeGE8iJQW0seV75I9b6O3iZR
         R+rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GYwoW8c7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y6si124500ybm.662.2018.01.11.10.21.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Jan 2018 10:21:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GYwoW8c7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60613 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eZhTZ-0000ZL-Pj
	for alex.bennee@linaro.org; Thu, 11 Jan 2018 13:21:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45647)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhTB-0000XP-Lb
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 13:20:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eZhTA-00033q-RA
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 13:20:53 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:44809)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eZhTA-00033S-La
	for qemu-devel@nongnu.org; Thu, 11 Jan 2018 13:20:52 -0500
Received: by mail-oi0-x242.google.com with SMTP id g128so2232780oib.11
	for <qemu-devel@nongnu.org>; Thu, 11 Jan 2018 10:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pNhw5WLhAMHjJmO1JRBIZg5vBxfsdn37RulOwNNsM7g=;
	b=GYwoW8c7ZchetKEkP2O/wb77IgMLTPVE2To5QKBb/2Zkm/kM7ZeArInj2o5UudABAQ
	GDVWkrIHfR+ITA+h9WMIXSniRfNI83kamd6rv3O8HOxZ3+agE0672cPVNyjFfwhmm6eM
	q4xvOCiyQ19Q+SQ+1VbUXqP9EVoRnQciyI96s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pNhw5WLhAMHjJmO1JRBIZg5vBxfsdn37RulOwNNsM7g=;
	b=Nu01O44s+SHLG05LxYXIAl2n0xWGp6NTMRaYPeewmPYH+Opr+HdESRFT50OpQ+LhW1
	s1nHnQ2sn7++Tm/J8r+NKjQ3GnyVOSr9sZ7iZSZmLS3CoNQ4Tm2S5APKxa97InUHqG7N
	ld3sYf80/0ZEcIZEwP7ImzqFxjkJjBwoV1hDYDm+iSu908K2O0sHwTR8ufISHWg+vsx7
	Y+A/ZwXHWGsbSYz+kzJc5mnrC/wYIUueMisq3L36yO1q+nFeuPjtzqkfRwe+VpjVqxBP
	YsEWJU4+Yt72/FoneqzMcNw0mMReeCsz2GeGkdMHjRyvPr2+KZlc+fZXFtQQO5vsXVlY
	LHhw==
X-Gm-Message-State: AKwxyteLAoncAOCF3fTwd5s6foIDRC4A57knnQZXQJsP7GXBqLp+Yxqj
	INan+3FdqgKNXAb4LItZ9kHMkfeX1b8RhIvKEwZnug==
X-Received: by 10.202.192.69 with SMTP id q66mr4878582oif.305.1515694851868;
	Thu, 11 Jan 2018 10:20:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Thu, 11 Jan 2018 10:20:31 -0800 (PST)
In-Reply-To: <20171218174552.18871-3-richard.henderson@linaro.org>
References: <20171218174552.18871-1-richard.henderson@linaro.org>
	<20171218174552.18871-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jan 2018 18:20:31 +0000
Message-ID: <CAFEAcA9igMy9u0WdTBvJWms1G4Cd2m0QXUucJeXCJ1Uo=7OAMw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-devel] [PATCH 02/23] target/arm: Add SVE decode skeleton
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F029QxirtotY

On 18 December 2017 at 17:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Including only 4, as-yet unimplemented, instruction patterns
> so that the whole thing compiles.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.h | 111 +++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-a64.c |  91 +++++++------------------------------
>  target/arm/translate-sve.c |  48 ++++++++++++++++++++
>  .gitignore                 |   1 +
>  target/arm/Makefile.objs   |  11 +++++
>  target/arm/sve.def         |  45 ++++++++++++++++++
>  6 files changed, 233 insertions(+), 74 deletions(-)
>  create mode 100644 target/arm/translate-a64.h
>  create mode 100644 target/arm/translate-sve.c
>  create mode 100644 target/arm/sve.def

This will be easier to review if you split the stuff that's
purely code motion from the .c file to the .h into its own
patch.


> diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
> index c2d32988f9..d1ca1f799b 100644
> --- a/target/arm/Makefile.objs
> +++ b/target/arm/Makefile.objs
> @@ -10,3 +10,14 @@ obj-y += gdbstub.o
>  obj-$(TARGET_AARCH64) += cpu64.o translate-a64.o helper-a64.o gdbstub64.o
>  obj-y += crypto_helper.o
>  obj-$(CONFIG_SOFTMMU) += arm-powerctl.o
> +
> +DECODETREE = $(SRC_PATH)/scripts/decodetree.py
> +
> +target/arm/decode-sve.inc.c: $(SRC_PATH)/target/arm/sve.def $(DECODETREE)
> +       $(call quiet-command,\
> +         $(PYTHON) $(DECODETREE) -o $@ --decode disas_sve \
> +               $(SRC_PATH)/target/arm/sve.def || rm -f $@, \
> +               "GEN", $@)
> +
> +target/arm/translate-sve.o: target/arm/decode-sve.inc.c
> +obj-$(TARGET_AARCH64) += translate-sve.o

If we're serious about the idea that this decoder script is
general purpose, we should have a rules.mak rune for
generally invoking it to create a decode-foo.inc.c from a foo.def.

thanks
-- PMM
