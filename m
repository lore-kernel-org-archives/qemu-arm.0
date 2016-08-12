Received: by 10.25.21.156 with SMTP id 28csp199892lfv;
        Fri, 12 Aug 2016 07:59:18 -0700 (PDT)
X-Received: by 10.237.43.162 with SMTP id e31mr18329047qtd.110.1471013958432;
        Fri, 12 Aug 2016 07:59:18 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q21si3494148qkh.336.2016.08.12.07.59.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Aug 2016 07:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52626 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bYDvZ-0002NA-T9
	for alex.bennee@linaro.org; Fri, 12 Aug 2016 10:59:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDWm-0006sg-0g
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:33:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDWk-00050p-1B
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:33:39 -0400
Received: from mail-ua0-x22f.google.com ([2607:f8b0:400c:c08::22f]:34175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bYDWj-00050h-T6
	for qemu-devel@nongnu.org; Fri, 12 Aug 2016 10:33:37 -0400
Received: by mail-ua0-x22f.google.com with SMTP id k90so44703828uak.1
	for <qemu-devel@nongnu.org>; Fri, 12 Aug 2016 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=p+lrrw7PzkHA81BwRrjaRm/6lDSfUSlHredNhkKIT/Y=;
	b=IXh4JgQN42JzIdhjOSdMUzuUde9lXJtb67/eAfTTHZeMEsK5LUu2TqhJZZpe4tfkTx
	HuEH4+rNwkRZQQ79mncB9Tvh4u+nZnJ2FzoqASjrN7rQq0IpYXvR6F2QzoY5noLSduBD
	I3EkrnVtHCJ8yHSOz6G/XDLR0H1WtQhkl6lWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=p+lrrw7PzkHA81BwRrjaRm/6lDSfUSlHredNhkKIT/Y=;
	b=UXGXAQx/qzhQtap5NQZ8v4Ojgd20p5wfdlwWu0Q8EqEbSn7Xb62gagjJ59CGEKmV0I
	hJ8fl40yhL1eZ5ovQkdlpIND4WnXcD5V/L7z+drqzXJ8ZMt2c8DRJeYAIbsddu37y5zg
	Ll2KLvH9NQ1dw27onryZUysf7o1zi1KvDSjB0kt6jhfdHA1uqL+1+x2alH9f5T4g9jch
	I7IlLk6pVuyeExjWx1HBQv/q4ovfeeZ5JdALFHuoyhM2uk02mk5rziD+murW6BOecwZQ
	1O7jzaep4qxBUb5QDT7uDZu49Up5JOHEDGEGoE7bs39GQGAzmTWyTv82OXaABuZ7p7aN
	ACrg==
X-Gm-Message-State: AEkoouswW1Bc5FXwzfAjcn+bUIXoWC1XPOvFfFEqnWtcauuC1aEKZetk+4Ey8AqGxoFBps4aJYNcFf9sbTr1z3XY
X-Received: by 10.159.32.66 with SMTP id 60mr3747875uam.125.1470993768561;
	Fri, 12 Aug 2016 02:22:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.150.17 with HTTP; Fri, 12 Aug 2016 02:22:28 -0700 (PDT)
In-Reply-To: <a51aea17-b72b-bdef-0b41-ddbfbf8f2626@kaod.org>
References: <1470158147-16378-1-git-send-email-clg@kaod.org>
	<CAFEAcA_sa3eJx5WtZzkxYKsKkrT3OmyhXH46U+a7VaJJBdODwQ@mail.gmail.com>
	<a51aea17-b72b-bdef-0b41-ddbfbf8f2626@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Aug 2016 10:22:28 +0100
Message-ID: <CAFEAcA8o77Z0K-Cv+gW23p=5OV7RkboPxiDwrDZhoMvm3fMvLQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22f
Subject: Re: [Qemu-devel] [PATCH v3 00/10] arm: add ast2500 support
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: F+w9A4fmo1mf

On 12 August 2016 at 09:38, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 08/11/2016 12:47 PM, Peter Maydell wrote:
>> On 2 August 2016 at 18:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>>     On the AST2500, I am still having a little issue under uboot which
>>>     sets the vbar doing :
>>>
>>>         mcr     p15, 0, r0, c12, c0, 0  /* Set VBAR */
>>>
>>>     and this is trapped as an undefined instruction by qemu.
>>>
>>>     Looking at hw/arm/helper.c, the VBAR register seems to be defined
>>>     only for feature ARM_FEATURE_V7 (v7_cp_reginfo). The AST2500 SoC
>>>     uses a arm1176 which defines ARM_FEATURE_EL3 which gives us a
>>>     VBAR_EL3.  According to th specs, the arm1176jzf-s has a Vector
>>>     Base Address Register. So am I missing something in the board
>>>     definition or is uboot being too optimistic on the cpu features ?
>>>     This is confusing for me, some direction would be welcomed :)
>>
>> This looks like a bug in helper.c -- we originally added the VBAR
>> definition as a bit of a hack since it's only supposed to exist
>> in CPUs with the security extensions and at the time we didn't
>> implement those at all. It should definitely exist in the 1176
>> too, so we should move the definition around somewhere so it does.
>> (The 1176 is the only non-v7 CPU with security extensions support,
>> which is why it got missed I suspect.)
>
> OK. I will give it a try in a standalone patch. Is there a scenario
> I could use to catch possible regression on other cpus ?

I don't have any test cases to hand that I know use VBAR, no.

thanks
-- PMM
