Received: by 10.25.0.6 with SMTP id 6csp877809lfa;
        Thu, 1 Jun 2017 09:32:13 -0700 (PDT)
X-Received: by 10.200.34.132 with SMTP id f4mr2904341qta.183.1496334733195;
        Thu, 01 Jun 2017 09:32:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496334733; cv=none;
        d=google.com; s=arc-20160816;
        b=e+tFIMJ5K5dIZlMfJRN5MF7eBdhPM2tPNndLoD6alG7TXxj813E/TyVPk2/dzyMTaZ
         Nvko5gJ9+SHJK8czj2jtq8Mw1yEab6VkfJJ+hy1pSWEmZnfJBAHaxkzyPHuUvl9NtqUT
         VV6r0Ys0ElURmNiGS5J3YMzBfilfZIDT5glm+Kr+v9/pwrJ7AwTIT2gbSWz0F5G6fbI9
         1YY88pF868+5AU/CKuvmsg6C8Hy7vBmqDlqV7/VWAIPdaSWGvb7yEKkOijwLxyNCim2F
         KUfiPFLVBpSEc0zdYW2JCoQGlRcrn06o60ZSkJrEhJ+LvGnsu8j9sjtcKRTBTM0RCEo5
         1/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=fsO5xwpaXF8D4YY0ps0ffK8Ih7NCLP6+NW8gpmDYlpY=;
        b=C9kOB0IYNhbKGVrbrORDf5aI0s2G34j18Frhx+aFOqT/KZng5YqAnGHHmozsByHLmS
         YwUfIcyRhBewls6qal4JBgpDcwz9z0hD2BfHnBaY7TBdRvUi104pjSTXGTxfJvWi79WF
         uzm/zCLNtsvVf+bQqbrHpOs+iih+nSLwMLym+K2I/gLqqvFaeMcccnFl0gjVd1pVd/ti
         bNc14768Fn8ZELcxeKjFaE7zLy+zAuOFOauu5lQZA+gO0NJdQKRkdpzD2hf3acfa9O/W
         wz76Aq0DWpf72tR1MtTtNv1naYkFahzizdHH5VNOzufsy6YxBzOI2T/D4mBfXgiDhxcT
         XKFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f24si20266807qtf.317.2017.06.01.09.32.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Jun 2017 09:32:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGT18-0006xZ-M0
	for alex.bennee@linaro.org; Thu, 01 Jun 2017 12:32:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51419)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGT13-0006xF-57
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 12:32:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dGT12-0005ID-4v
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 12:32:05 -0400
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:36890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dGT11-0005I4-Uo
	for qemu-arm@nongnu.org; Thu, 01 Jun 2017 12:32:04 -0400
Received: by mail-wm0-x22b.google.com with SMTP id d127so67187614wmf.0
	for <qemu-arm@nongnu.org>; Thu, 01 Jun 2017 09:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fsO5xwpaXF8D4YY0ps0ffK8Ih7NCLP6+NW8gpmDYlpY=;
	b=H5krO0UKbAulMcjUD0sLVTuzo29VjoyxI22mpsco+T7TweasIpBdKMeQdNHL6/6N9L
	+xR/fdLL7L4WmucMro2K7iUuj6cKIQT8nNbB/QK2/u+dK/An4TaVuB9Mez2IyekH7RkI
	ZbmeaA2kUGq+Fy+mTUINO93mnKedLoYmJVTQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fsO5xwpaXF8D4YY0ps0ffK8Ih7NCLP6+NW8gpmDYlpY=;
	b=uU29G/lEdP/J0/0URpuwihn6UQdXnE51IGF//6Bjy3NjyCZma2rwYLGEk/AXDcU7F4
	a4I+UkCkw27JReQ6BTTHyUZ7TMOBw4ZyqzVNtXMNLOamgqwMdQoSefUCiAIZDMY3t47L
	RprUmE1mjAzG3ep6e64znYzFpPCk7xAAM4Dup7UM77b1oPsV8CMgzkkDlNNLnnJlOKkQ
	ikScbLTtlubxuCXaQAgMQoHhW2fnnvyg8OLaC4hhv12Vf/dpi0p40A8kMc08HNoT3UxJ
	trgXFwl3VKWVvWzW00qqQ2w9ypE3mR7y1fakuN5Y4z1CvpYPk9kRfH34BRh6izT+miuK
	CVxw==
X-Gm-Message-State: AODbwcAkCaWtMNkk9vvXenXUf1tzDn6J2kWesNEtyPf2Bxm0+18PAQNe
	X2EFo84Xv4zwuGpghCt87aVJoSNZwLIl
X-Received: by 10.223.150.139 with SMTP id u11mr1924421wrb.195.1496334722692; 
	Thu, 01 Jun 2017 09:32:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.178.66 with HTTP; Thu, 1 Jun 2017 09:31:41 -0700 (PDT)
In-Reply-To: <CAJKOXPebX4GFh06NmAfkt3Vt5D-xwbeJ3UPA-Z+vMc8BtQZcZw@mail.gmail.com>
References: <20170521152949.15338-1-krzk@kernel.org>
	<CAFEAcA8qYBAgHWPGdSTry7Rmt1Ai9gmKXdKs+f_x_jQU0+7c5Q@mail.gmail.com>
	<CAJKOXPebX4GFh06NmAfkt3Vt5D-xwbeJ3UPA-Z+vMc8BtQZcZw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Jun 2017 17:31:41 +0100
Message-ID: <CAFEAcA8Q8-U9aocQgbUTt2WP4S9Tj_K_iXZuP08x9Ck0LszS3Q@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-arm] [PATCH v3 00/11] hw: arm: exynos: Bring up secondary
 CPU, QOM-ify Soc, other improvements
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0k51dPXf4jQV

On 31 May 2017 at 09:58, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Tue, May 30, 2017 at 2:04 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> So is this a regression compared to our current model? I was
>> under the impression from the previous thread that it was,
>> which is why I didn't apply that patchset.
>
> It depends how wide understanding of regression you have. :)
> 1. Before this patch, second CPU could not boot. System was usable but
> worked on only one CPU.
> 2. Before this patch, kernel's IRQ work is broken. None of IRQ work
> are executed which is mostly visible during poweroff - system hangs on
> syncing IRQ works.
> 3. With this patch, second CPU boots and IRQ works properly (so
> poweroff is possible).
> 4. However with this patch, Linux kernel with cpuidle enabled (which
> is also included in many kernel defconfigs), the system is very
> unresponsive.
>
> So overall... a lot of things were broken already. This patches fixes
> them... but breaks different thing.

It sounds like it breaks a key thing, ie "boot a single cpu kernel
built from a defconfig", though. That's a regression I'd rather
not have. If there's a subset of these patches which don't break
that I'm happy to take those. Otherwise we need to investigate
and fix whatever the problem is that causes that unresponsiveness
before we can apply them.

thanks
-- PMM
