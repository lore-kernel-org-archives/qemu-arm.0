Received: by 10.25.77.65 with SMTP id a62csp325614lfb;
        Fri, 27 Jan 2017 08:51:38 -0800 (PST)
X-Received: by 10.55.105.131 with SMTP id e125mr9380569qkc.174.1485535898395;
        Fri, 27 Jan 2017 08:51:38 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y64si3913214qkb.48.2017.01.27.08.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Jan 2017 08:51:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46767 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cX9kN-0000rG-Lj
	for alex.bennee@linaro.org; Fri, 27 Jan 2017 11:51:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cX9kG-0000oy-0N
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 11:51:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cX9kF-0006Xy-9a
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 11:51:28 -0500
Received: from mail-ua0-x22c.google.com ([2607:f8b0:400c:c08::22c]:34589)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cX9kF-0006Xp-5B
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 11:51:27 -0500
Received: by mail-ua0-x22c.google.com with SMTP id 35so209159609uak.1
	for <qemu-arm@nongnu.org>; Fri, 27 Jan 2017 08:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GTrztlmUae7VkWRgROy3WAd9lViA2cCWDs7NfAWPMNc=;
	b=PMEVYhG5/IM++Hl3cwmrVCy3CrULyYzbaA5dzT5qpFLWrLBQ7XxAn1vLBSpLkuyPzV
	OpWxRjpCei2IkhYRB98LFB1lrl9NYhYA5gOuGlbn1lYnhvdojaZtpS0OKWng/4ugnuuw
	b7RtRf+4gTkmmwCTGUGWJ+PvB0BN0jWmO2rx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GTrztlmUae7VkWRgROy3WAd9lViA2cCWDs7NfAWPMNc=;
	b=nrRHgo2EOYPTs1HnH4FjWSL0afG1naYVIreaqFZPgqPpNpM4nsHBzzJb2yshMs4clF
	oHG6wH+NqOxLFXirTudnYR3bcdIs7xLTZxDhLin+yqw568QYJrwhzo/Btr3G7WLiMAIl
	12IDRq6R+FHkYo7Dln3RhmXPh2YOpPtoMCuZnbEbrTAnC3JPcbrWwyBQPcruqrGn0aQO
	Y2SC9nKO+aBsEFh8KlifnmsxwhocXniDX5mpOLWWcWwdypUevyGaoJ7VkUmVpFpIdycf
	udwcsnIYmkijDThH5dfaKWReB6J2UrsZuOI9cPEDBSd4yYswfEi4NlBXx77Ie8yV0UpK
	IdDA==
X-Gm-Message-State: AIkVDXLn5M95UB1ECsFIlrmmwd1YeXd/GF0ZZkG6n/48sGQEhpFLVicqbRTcgoVQQ1tBBtaoiQiLAT1ch4Egk+Ak
X-Received: by 10.159.56.146 with SMTP id t18mr4996529uaf.137.1485535886536;
	Fri, 27 Jan 2017 08:51:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.205.2 with HTTP; Fri, 27 Jan 2017 08:51:06 -0800 (PST)
In-Reply-To: <1485534415-20887-2-git-send-email-mst@redhat.com>
References: <1485534415-20887-1-git-send-email-mst@redhat.com>
	<1485534415-20887-2-git-send-email-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Jan 2017 16:51:06 +0000
Message-ID: <CAFEAcA9RMUyM9RXTk5cyLJPCsujABujj2CfdyOm6uQN3EbjgAA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22c
Subject: Re: [Qemu-arm] [PATCH 2/3] arm: add trailing ; after MISMATCH_CHECK
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
X-TUID: +70K7JhwEHF9

On 27 January 2017 at 16:27, Michael S. Tsirkin <mst@redhat.com> wrote:
> Macro calls without a trailing ; look weird in C, this works as a side
> effect of how QEMU_BUILD_BUG_ON is implemented. Fix this up.
>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  target/arm/kvm-consts.h | 96 ++++++++++++++++++++++++-------------------------
>  1 file changed, 48 insertions(+), 48 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
