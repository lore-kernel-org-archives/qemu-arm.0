Received: by 10.80.163.71 with SMTP id 65csp2119203edn;
        Tue, 4 Oct 2016 06:38:04 -0700 (PDT)
X-Received: by 10.200.34.50 with SMTP id o47mr3701307qto.66.1475588284357;
        Tue, 04 Oct 2016 06:38:04 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o91si24734572qtd.75.2016.10.04.06.38.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Oct 2016 06:38:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1brPv1-0005UX-Mt
	for alex.bennee@linaro.org; Tue, 04 Oct 2016 09:38:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1brPqA-0001fp-6f
	for qemu-devel@nongnu.org; Tue, 04 Oct 2016 09:33:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1brPq5-0001Mv-JO
	for qemu-devel@nongnu.org; Tue, 04 Oct 2016 09:33:02 -0400
Received: from mail-ua0-x22b.google.com ([2607:f8b0:400c:c08::22b]:36042)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1brPq5-0001MK-FZ
	for qemu-devel@nongnu.org; Tue, 04 Oct 2016 09:32:57 -0400
Received: by mail-ua0-x22b.google.com with SMTP id r64so15727253uar.3
	for <qemu-devel@nongnu.org>; Tue, 04 Oct 2016 06:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jTfi49PsC1eJUr3Q3SLe241ZwZFBfoxtdxeJ2JMbXBQ=;
	b=XzMvb+HF5EYf9ugRJZlDncdVhhoO9wiqrF+3pHwLachcwapgqlHYxxOb2iUWvqbQ/n
	UY0qQz0rMbVktfnCAOMV9z9BGB8adkdAT2roqsBVl97YI17+EfB7wT7PtdjvT6trCYEo
	DucM1nTLZEBKP3RbOo/6g306FMAN3HqbxHsOg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jTfi49PsC1eJUr3Q3SLe241ZwZFBfoxtdxeJ2JMbXBQ=;
	b=XzhI1B/7F8oiI2S+/dw6CtWWbyJjpiU1GOwdzrTUJVgX6Gdb3l72+GzUeeMZtn9193
	1ENHoOEbSuS4XY2Bj8oKPSRx4qNwIFGHCD56YjeqX/G+b/muK0ePJYVVuuJ36f1aMwsk
	LVNEj1+FfoT7yURpbnlm7blgwez7ui3GDm/T1DfF2AcfnHmDJRYpFKdhZZfmxUEoBvjr
	IObkuCFZo8NDAW0vgMptaWYESvoQLoO1S8p1WJF6q1wHuKrx0H2eBUa0Gg2VW/2Q7bmO
	ru9BcDY9VfOXyp2GJQqSFAKZhUEL+AI9BguWcWhmRRYELSllKflfvyWY3Ad//Z2EUdkS
	BTEg==
X-Gm-Message-State: AA6/9RmkJmXKpxz4JY/UjGeqVvjYWjsshGcCfhs5goJoDcrUAgj681ZHJh8rF85XzOZCEUpkbmEjaw9oLwsn7alX
X-Received: by 10.176.84.149 with SMTP id p21mr2212083uaa.42.1475587977020;
	Tue, 04 Oct 2016 06:32:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Tue, 4 Oct 2016 06:32:36 -0700 (PDT)
In-Reply-To: <1474641676-25017-1-git-send-email-drjones@redhat.com>
References: <1474641676-25017-1-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Oct 2016 14:32:36 +0100
Message-ID: <CAFEAcA-98_+mdZO-YKW-_Or5=v4vDGS6NgHHmBX5i3a2pPQ0Tg@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22b
Subject: Re: [Qemu-devel] [PATCH] hw/arm/virt: add 2.8 machine type
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
Cc: Wei Huang <wei@redhat.com>, Eric Auger <eric.auger@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9xLe/zZp6hOy

On 23 September 2016 at 15:41, Andrew Jones <drjones@redhat.com> wrote:
> Signed-off-by: Andrew Jones <drjones@redhat.com>
>
> ---
>
> This will conflict with Wei's PMU property series (which is why I
> asked him to add it to that series...), but anyway, it'll be a minor
> resolution to make.
> ---

There wasn't a textual conflict but it (slightly belatedly)
occured to me that perhaps the "support KVM GICv3 ITS" patches
which went in to master in the same pullreq as this might
need some tweaks so the ITS doesn't get used in the 2.7
machine. Would you or Eric A like to have a look?

thanks
-- PMM
