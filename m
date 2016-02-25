Received: by 10.25.208.211 with SMTP id h202csp2853382lfg;
        Thu, 25 Feb 2016 06:56:30 -0800 (PST)
X-Received: by 10.140.42.39 with SMTP id b36mr55863560qga.4.1456412190682;
        Thu, 25 Feb 2016 06:56:30 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m22si8370899qki.19.2016.02.25.06.56.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Feb 2016 06:56:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:43763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYxLC-0004kJ-96
	for alex.bennee@linaro.org; Thu, 25 Feb 2016 09:56:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34831)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYxL9-0004jn-TT
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 09:56:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYxL9-0006BD-4C
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 09:56:27 -0500
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:33099)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYxL8-0006Aw-W3
	for qemu-arm@nongnu.org; Thu, 25 Feb 2016 09:56:27 -0500
Received: by mail-vk0-x22e.google.com with SMTP id k196so50030079vka.0
	for <qemu-arm@nongnu.org>; Thu, 25 Feb 2016 06:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TfinFLuAgB2EFN9OPzCicgmdgwVaYRQAMKhdRRo8Wfc=;
	b=DSzEVimUj4CA4MsTSJvUAf0vBatPDYNrtXEm+yizh9N9Rki9g2rEJVSykBeSkurg7m
	9kjl3cYo4WJGvAIqcgnwJZ+pCxNZ+GTxQqLqJO3UWZZWITm4THMNE1BnFCpVyjPoa1H/
	2F+0Rq9fc7icIZ/NuWh9aY1/FJJhTSM5gP+B0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TfinFLuAgB2EFN9OPzCicgmdgwVaYRQAMKhdRRo8Wfc=;
	b=RFmC+ZvqIWvb42Q84SBqQVoevHhXVOUNiGWEOz3eV/dgdzfPWliRvc7/rssC+gpBYN
	g0Hmj97JQn4eMM2b67y2wgo4w9KyqqZcdZAftEJZKUF2jPHHxZAxYLyJzlefC4Akrxq6
	aKUOuHWfOI29QeOH8JYZEk7l7+Nv72s3NoYiI60ZSceUBFULdCq/jAS1OAAXzBaQq6t5
	Ue0FlHNyYIC5niZp0mXRkxGeumr4oy/2sPzm8G1a8g/yapzzJ4/3hYc4vCbs3luh1Htn
	GxWcHUeHxNspk+pyZ0oWcHzV/Tch4zGFV/vlcZd4GoCT41gK8qByhi7Ul9u02BgE3x8j
	YcBA==
X-Gm-Message-State: AG10YOQ1V0K9oW5Fn76YwVCHjpEXnS8t+mDyE4UlPYHkOv5vGzlbhoG6XqBNJAy0BeNR43zRF4xyLEImHyM2zrSr
X-Received: by 10.31.1.6 with SMTP id 6mr32612371vkb.139.1456412186512; Thu,
	25 Feb 2016 06:56:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 25 Feb 2016 06:56:07 -0800 (PST)
In-Reply-To: <1456399324-24259-1-git-send-email-thuth@redhat.com>
References: <1456399324-24259-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Feb 2016 14:56:07 +0000
Message-ID: <CAFEAcA-J8yHkZ-N46UbtDiXX-uyM-mutNmqM26tfbUKOWzZkTQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: Evgeny Voevodin <e.voevodin@samsung.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Peter Chubb <peter.chubb@nicta.com.au>,
	Dmitry Solodkiy <d.solodkiy@samsung.com>,
	Maksim Kozlov <m.kozlov@samsung.com>, Andrew Zaborowski <balrogg@gmail.com>
Subject: Re: [Qemu-arm] [PATCH] MAINTAINERS: Add some missing ARM related
	header files
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: gWT2GUwVGdFX

On 25 February 2016 at 11:22, Thomas Huth <thuth@redhat.com> wrote:
> Some header files in the include/hw/arm/ directory can be assigned
> to entries in the MAINTAINERS file.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 4 ++++
>  1 file changed, 4 insertions(+)




Applied to target-arm.next, thanks.

-- PMM
