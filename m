Received: by 10.80.163.71 with SMTP id 65csp421123edn;
        Thu, 29 Sep 2016 09:26:51 -0700 (PDT)
X-Received: by 10.55.53.207 with SMTP id c198mr2497014qka.254.1475166410996;
        Thu, 29 Sep 2016 09:26:50 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k192si9258688qke.306.2016.09.29.09.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Sep 2016 09:26:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39204 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bpeAc-0005dI-De
	for alex.bennee@linaro.org; Thu, 29 Sep 2016 12:26:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpdt9-0005Wm-QP
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 12:08:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpdt7-0008Nr-HI
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 12:08:46 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:36547)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bpdt6-0008Mw-Nw
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 12:08:45 -0400
Received: by mail-vk0-x234.google.com with SMTP id y190so47841166vkd.3
	for <qemu-arm@nongnu.org>; Thu, 29 Sep 2016 09:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wveneCdCraUAo3ArWczAvLHqsa8ufpYXQcj92/Qda+E=;
	b=GsD+c1lv1RJplbmMkwpwNSK4uJ1efkVt0fAgiRtrSPUZR8rccibkq1Xw9ptNVoDYWI
	LCYS5az8RGC7wnIuewN22lUNVX+Q3KrHWvKxaMHM8iF93mbRM3soKH41CH8lVayJwfsK
	YwpGAupxHl4Hvqw8RZyHW+GWwHzG42U55WgAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wveneCdCraUAo3ArWczAvLHqsa8ufpYXQcj92/Qda+E=;
	b=Httj4C0EX2WHyjYMYmXp73drdMZy/K3tPlyvk7a1uRGRUk5N3ZuTQkJQXQUKL0iQfJ
	I2P8KLkbYn2Ks4NROdc/GHviCWDVUmRu/lGRbNMFtm4mxZDh9ef8rN4Gxt5MxD9VHVm0
	umu2qUEs3SoWZgNmt9dk3ZxPskbsqBjrJQmI/ARu/cjMg+zPqknWuyNsA/2GAlqN5mHF
	IYwDPU/LcPCtvhpFhmmZQPcjCCbnjvK81Zx4uKUI00ppRp4jI0BeoKqFZbpfdJttjwNZ
	a6ne/HzM3C4qCqtUoUrKYKpW8OlIPwfCZLcGvAA06PVXEAaQJJkh1Wd/Nzw6aHnWk+DS
	iqUg==
X-Gm-Message-State: AA6/9RlmHmxIoMMDpS9de8IbZl639vZOrHleazXWOoZmLhwYFJXwXpNH22bzTrw2c/qjHj4YzFNV1pnRZEP0fc8d
X-Received: by 10.31.92.21 with SMTP id q21mr1453519vkb.170.1475165324308;
	Thu, 29 Sep 2016 09:08:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 29 Sep 2016 09:08:23 -0700 (PDT)
In-Reply-To: <1474633117-5227-1-git-send-email-thuth@redhat.com>
References: <1474633117-5227-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2016 09:08:23 -0700
Message-ID: <CAFEAcA9Ng0dikY=bwebUVz0AJTtm7GCYkcigXRhD9rMhXzZabw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-arm] [PATCH] MAINTAINERS: Add some ARM related files to
 the corresponding sections
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IB6CcKleefuV

On 23 September 2016 at 05:18, Thomas Huth <thuth@redhat.com> wrote:
> The file hw/misc/arm_integrator_debug.c seems to belong to Integrator
> CP, and hw/cpu/realview_mpcore.c and hw/misc/arm_sysctl.c seem to
> belong to Real View.

arm_sysctl is also used in the Versatile PB and Vexpress boards;
it's not specific to realview.

thanks
-- PMM
