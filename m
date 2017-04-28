Received: by 10.25.0.144 with SMTP id 138csp165309lfa;
        Fri, 28 Apr 2017 05:10:21 -0700 (PDT)
X-Received: by 10.55.58.199 with SMTP id h190mr9284342qka.262.1493381421279;
        Fri, 28 Apr 2017 05:10:21 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34si5587379qtg.309.2017.04.28.05.10.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 28 Apr 2017 05:10:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d44j6-000882-PX
	for alex.bennee@linaro.org; Fri, 28 Apr 2017 08:10:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37764)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d44j3-00087t-Gq
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 08:10:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1d44j2-0007N6-Lm
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 08:10:17 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:37402)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1d44j2-0007MI-Du
	for qemu-arm@nongnu.org; Fri, 28 Apr 2017 08:10:16 -0400
Received: by mail-wm0-x22c.google.com with SMTP id m123so44830607wma.0
	for <qemu-arm@nongnu.org>; Fri, 28 Apr 2017 05:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nYwyCSEpHEPMSYyhDb+ZQDT9fUND49sYb/z0ikK9Mh4=;
	b=Z72vR32Y2ZMHxHKcfAyARj4JdvrlMqbJtGRCwldc+UXGNOx9S+Z3ciqyp0kyEI1SkM
	Al1rV8IIL9lYO8UAe5XluT6nrcd/XlqVr3lWZBFWOMkBaoNla+0Fqs0/5+LHrBltfHYy
	j5ZlMxBJbQQHOM1n1CBhwW2Wn+CLijLHqAHF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nYwyCSEpHEPMSYyhDb+ZQDT9fUND49sYb/z0ikK9Mh4=;
	b=UAZQqWjnfheBzIWWR95QrbwSEd8lwIvFoGqYwnzLXkOXqUH7CQT2QR+6nYNH4xLcDM
	gEf0PlBIbkIHMfHowrAO50BlVw2jchBw7Ba6DvW64T/GnyPaWe420CQi687rgTKpeotZ
	B0Kh1tbF77DPRQAqwU/OdCObhG24Zi1JGChetk4QO09qzSx8gqPgWIZAFJLjjy8mBb+6
	00D5gEe9jKYJsvBmbEig3H8uIEiOuNUSx7T4H3QIY6WB2LiWmazy7QkjXu2F2xO6WtOp
	TKItMkAIHx/o2zywX9Wlv1ejygU+4Q09OKeAwHj3o3jvlGwbHwfhN5H68wLySNYdAk7u
	hNMA==
X-Gm-Message-State: AN3rC/4Lm6+9i6lUp4pzKckLGySG8yYUUPk655BKobQDsjB4DUURmHV2
	AqnKuu94NWhsvju8dvGZuyIwYxN+FXWy
X-Received: by 10.28.57.138 with SMTP id g132mr5343375wma.92.1493381415033;
	Fri, 28 Apr 2017 05:10:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Fri, 28 Apr 2017 05:09:54 -0700 (PDT)
In-Reply-To: <4dbaaea9-7576-9acf-5327-b22db6f00ed2@redhat.com>
References: <1493314727-6951-1-git-send-email-wei@redhat.com>
	<CAFEAcA-KKvhspYza=8TNNuFtqzco=ChhtS6Aa5hnn8=Cb036-Q@mail.gmail.com>
	<4dbaaea9-7576-9acf-5327-b22db6f00ed2@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Apr 2017 13:09:54 +0100
Message-ID: <CAFEAcA8K9DENSPqJD2Okqjqyi7T8RhSBmhCa3ztooJK5xdcZVg@mail.gmail.com>
To: Wei Huang <wei@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2] Fix compilation dependency
 issues of CONFIG_ARM_V7M
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
X-TUID: jSaRXB0wSb5Z

On 28 April 2017 at 01:10, Wei Huang <wei@redhat.com> wrote:
> In our downstream code, we try to minimize the number of supported
> devices to reduce the maintenance effort. ARM v7M is not in the
> supported list.
>
> For most unsupported devices, we can remove them by configuring
> default-configs file, except for CONFIG_ARM_V7M=y. This is because the
> ARMv7m code in target/arm/helper.c intertwines with NVIC code. As a
> result we have to keep NVIC and SysTick in order to compile helper.c,
> which is not desirable.
>
> This patchset tries to address the problem by making NVIC and SysTick
> removable.

I think that's the wrong way to do it. If you want to not compile
in ARMv7M support then you need more ifdeffery in the target/arm
code to disable the v7M code and CPUs entirely. NVIC and systick
are required core parts of v7M CPUs and so if they are not
present then QEMU will claim to support the v7M cores but not
in fact correctly do so.

thanks
-- PMM
