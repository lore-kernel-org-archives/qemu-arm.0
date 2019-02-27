Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp12270843wrx;
        Wed, 27 Feb 2019 06:01:26 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ibzky0+67pHCMcf05HbdR/ZKdbIJ/lWc5XcD481IkoE0gSO+cICxo2ytoLjcu/lGRzQnQ/H
X-Received: by 2002:ac8:2a7b:: with SMTP id l56mr1780919qtl.270.1551276086500;
        Wed, 27 Feb 2019 06:01:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551276086; cv=none;
        d=google.com; s=arc-20160816;
        b=gO3okkKWM3osOKDr65Fvk86NrbumaCcVj2R1d3yK1r7ZKq4RTC1Tss2B1q5Je4yNoU
         5HsQvyVqOBq7mv62hM2A2ZnLVsn/CtJU/gue6KACq+TRgArprt8yI2fNo8pUZvOSekjB
         Q04IL4Fn3WqWqiSEqYM6YZe3KTR29PFb3sxgNyQtHmUbsUv+0EoZ295E3yW429GjtnEr
         Y+anHE0bPJDGqGmTu29vdINSrj2xiQooYxz9lfmIjMSwQUYMZQ9n9+qHwaiCxiaLlCk4
         RtiGppitYfmj1MbmckRblXYtiv6FUQd86lF8AACQlu/sLLSbyR6FVeEGrQdUZ5drdS+6
         kDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=ESR8s5JYItOHIbaKBgvg+dui0S1DlX+qObLCTsmrGoY=;
        b=tNMHICssavjUgOfSYuMgND8vib6MTFTPb67c2tiUpTqWlKYlfaAKc66Y6PiKEBNIUq
         JnLYvj0ayyTLF5dC4hMiQBTbPZwAH9/5QvRuVEHrdpQXz1u24nQIMycr+4pixqisqogH
         ccbZMpo/HmwdD1yzBloCCGLdhlAePOcbqio+6GfOZ32Ic+q4mNAWgBkXccVCh3lR/83r
         N9+MTwmVQNyYuN+UNBsGTuxL9dUQdcxZN9+FAdH70DX3p5R4TEdRiDhULyiU2mg0AJJ2
         kwcFT9oUB1wMOu1oqLflbUtwaLZ8WmTNZ19vdiwCwyPrVT6AlZe0q1dzzHLY8Ep/NIzS
         K3Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mi1OWGYU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g4si5155699qki.69.2019.02.27.06.01.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Feb 2019 06:01:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mi1OWGYU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:44300 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gyzm1-0003V0-Mg
	for alex.bennee@linaro.org; Wed, 27 Feb 2019 09:01:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51072)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1gyzUp-00053S-Gf
	for qemu-devel@nongnu.org; Wed, 27 Feb 2019 08:43:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bztemail@gmail.com>) id 1gyzIx-0003x5-3i
	for qemu-devel@nongnu.org; Wed, 27 Feb 2019 08:31:25 -0500
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:35343)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <bztemail@gmail.com>)
	id 1gyzIv-0003uz-SD; Wed, 27 Feb 2019 08:31:22 -0500
Received: by mail-lj1-x241.google.com with SMTP id t13so9618332lji.2;
	Wed, 27 Feb 2019 05:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ESR8s5JYItOHIbaKBgvg+dui0S1DlX+qObLCTsmrGoY=;
	b=mi1OWGYUV8+wM53Awcxqoz4Go5sQKeKKIej+/zL/fXpYDFa+BUwY3I7UuZnyRD+D01
	8eKOAZz/AskwDVfvja5kzURxfV+j98OF+WD5Gq8K8g6CpJB1bZ/4N+x+E1MPYy4wBHq7
	LRVf2EaX9k5D18XUllRHNhrCuFRJ8bu/QLRX2Tv/gO/n9mQFRnb7uvLQ1Z1n5bxCn9LY
	/9TF2f199XLoG0zClw9biu0o478ViED4OCGUCL0kEaYP8EEDRlMSOgGy3VPD9PNRVJYG
	01gAEy//59DREk3k5h5ri1XbqfGAd7W6WOnBfasoz5R/pQf9nMJnx39YJaE2mF2g8tkU
	NduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ESR8s5JYItOHIbaKBgvg+dui0S1DlX+qObLCTsmrGoY=;
	b=pER1+No7AgT9/G4w2tJQQNIi9cIXBRzpEsTUMdscSNFhvIBjmNEYy6YkGISZWo7dDA
	K+qz3M1JHOHC3TCqg6X30+9zKQqS+E+WGWqotcP5lz+YjWsvrHsJL1GqDgHEVtVjOQ3C
	ZRoqbPlFes82CnNFaX/6iL/tfC90eZM8WnoeLGwkkCkAJIXprSe+Dn6rOCzPa/+I4mzR
	X8TA/qwKPMWzw31jdUN33XRzrZdnd3/dOB7dDQwo4X5yrE5PBIS3Cl8DyQGf4wvKTY4c
	IACpIlXW9l/JbTo8dl6W/wjssWDK2Hsn88Ld7QRapry1E6FSBENR3U7+Wy9PuCB08JOl
	7WOg==
X-Gm-Message-State: APjAAAWJM3BO/LapRW10xmtSfGzS55Yv9WIyu6Dq+0nWCSqmhmazhdc5
	nAiBMSWmPD9wmaoIPPqKS8Nb9dZIXGDBqD8JSISZcbArrB0=
X-Received: by 2002:a2e:86d2:: with SMTP id n18mr457750ljj.128.1551268466998; 
	Wed, 27 Feb 2019 03:54:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a2e:8554:0:0:0:0:0 with HTTP; Wed, 27 Feb 2019 03:54:26
	-0800 (PST)
In-Reply-To: <CAFEAcA9G73yrRvj3AdyxAi2uUBH9GPPerwi7y38oMDKw8F0B=A@mail.gmail.com>
References: <CADYoBw1HTzqTjfyDgDbP042AH1EkS1DD7Sf4um8eO7d22t4CDA@mail.gmail.com>
	<CAFEAcA9G73yrRvj3AdyxAi2uUBH9GPPerwi7y38oMDKw8F0B=A@mail.gmail.com>
From: bzt <bztemail@gmail.com>
Date: Wed, 27 Feb 2019 12:54:26 +0100
Message-ID: <CADYoBw2pm=j8QejJyC17MNye==gcyM1TgG=jN+0nGjgYJ0qkFQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::241
Subject: Re: [Qemu-devel] [PATCH] Added periodic IRQ support for
 bcm2836_control local timer
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wImQfIRJg8Kg

Hi Peter,

Thank you very much! Let me know if I need to modify anything! Btw you
should update the maintainer's list, currently it does not list you as
a reviewer :-)

I'd like to add more drivers for the bcm283[567] too, and this
question goes to Andrew Baumann mostly. I've seen implemented those
missing drivers in his repo, which aren't in the qemu mainline yet. I
don't want to reinvent the wheel, so I'm willing to fix those classes
to get them right, but I'd like to know what's wrong with them in the
first place. I'm interested in fixing the TYPE_BCM2835_POWER and
TYPE_BCM2835_ST drivers, which I know many hoppy OS developers lack
and would improve the raspi emulation experience remarkably. It would
be still a long way to boot a raspbian image, but still, a small step
towards that goal at least.

Thanks,
bzt

On 2/26/19, Peter Maydell <peter.maydell@linaro.org> wrote:
> On Tue, 26 Feb 2019 at 11:38, bzt <bztemail@gmail.com> wrote:
>>
>> Dear qemu developers,
>>
>> Honestly SubmitAPatch is a bit complicated for me, so I'm hoping I've
>> done everything right. To be sure, you can find my patch here:
>> https://github.com/bztsrc/qemu-local-timer and diff against the latest
>> github repo here:
>> https://github.com/bztsrc/qemu-local-timer/blob/patches/3.1.50.diff
>
> Thanks for the patch. You've got the most important things
> right -- patch sent as an email, and with a Signed-off-by:
> line from you. I've put this on my to-review queue, and I
> should be able to get to it within a week or so.
>
> thanks
> -- PMM
>
