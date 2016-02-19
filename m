Received: by 10.25.208.211 with SMTP id h202csp1103943lfg;
        Fri, 19 Feb 2016 03:37:56 -0800 (PST)
X-Received: by 10.55.54.201 with SMTP id d192mr14846704qka.23.1455881876345;
        Fri, 19 Feb 2016 03:37:56 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x76si13859096qhx.79.2016.02.19.03.37.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 03:37:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:51212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWjNj-00027L-UL
	for alex.bennee@linaro.org; Fri, 19 Feb 2016 06:37:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWjNi-00025k-5R
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 06:37:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWjNh-0006fU-91
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 06:37:54 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:33377)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWjNh-0006f6-5D
	for qemu-arm@nongnu.org; Fri, 19 Feb 2016 06:37:53 -0500
Received: by mail-vk0-x22d.google.com with SMTP id k196so72079024vka.0
	for <qemu-arm@nongnu.org>; Fri, 19 Feb 2016 03:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=c5ZKF4WWrc93waCpR7wck/PyfeLDLPnWiWZrbfcLpTU=;
	b=Fd5r8IXc9EA/gIvZAJnQbUkJ3q91B4d0q0gsbq6iJFGelGgp4FRbaUFL5oq+vcsjDJ
	Cnb9pTBN0m+O1UXlZKQ9QzX2ROdvtKzmulQlGSRdbUv1bmwtuWEUNrYusNxi3XPavpc1
	Os84dOqsrmGNXO9Mtz48jjI9ZHR+8p9FFAG7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=c5ZKF4WWrc93waCpR7wck/PyfeLDLPnWiWZrbfcLpTU=;
	b=P8otHc8nO50qQVBQ8KwaKnZyMk1/ykshDn2MzVmg1Hv9MtQ4uaEgYNdkarvQdd78mN
	V76CFsEVYTQjf0ZUcQdMptOlQqgd3JzV08h/H9UQmqZZZNYfzqPCy6w2KjnkAuXC9+KF
	rSoiIMuf1f2Dlf0ux06/jevC7GxSsKhW6EP7S5VaX+MAvG/IUWiYiwFfzzUOzIMN6MvV
	k6wG1Xzmfgfu41tVGUTMHDhzv2rxxyXRi2tDPfn9FOckr/55vsX2/+k3VXMer/bEj5q9
	S83+jwDftXoCuIOC4eZF26o0yeM/BSrck1P6Mi266n7R21gfPEf8kv04Qdkh+k6R0G10
	7Oug==
X-Gm-Message-State: AG10YORGoACG6MnjeGo9PKC4uH7QpiIXhHE/tVFj+6y8Do6v7bOAYJuD+T7sK+AuIyY1MSBj/U9+KJMLPfN20Y5h
X-Received: by 10.31.107.194 with SMTP id k63mr9223317vki.27.1455881871538;
	Fri, 19 Feb 2016 03:37:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Fri, 19 Feb 2016 03:37:32 -0800 (PST)
In-Reply-To: <56C6F63A.9060907@163.com>
References: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
	<1455621027-13927-7-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA98eqLbA863L-t3y7wFFO8eiXgZZvaSge0e6cUTu8S0-A@mail.gmail.com>
	<56C6F63A.9060907@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Feb 2016 11:37:32 +0000
Message-ID: <CAFEAcA8JOM_qVG0_T_GvhCmyjHR5fWBRh9hUn1Oi9j=mKpw92g@mail.gmail.com>
To: hitmoon <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: Evgeny Voevodin <e.voevodin@samsung.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v3 16/16] hw/timer: QOM'ify tusb6010
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
X-TUID: 5LUyY7+C0FCc

On 19 February 2016 at 11:02, hitmoon <zxq_yx_007@163.com> wrote:
> Hi: peter
> After some debug, I found
>
>  s->musb = musb_init(dev, 1);
>
> must be called in SysBus' init. Otherwise it will break the
>  "/arm/device/introspect/concrete" check test.

Mmm, I thought this might be related to the MUSB code.
I think this device cannot be converted properly to current
QOM standards until the MUSB code which it relies on has
been converted first.

(Also, tusb6010 is a USB controller so it shouldn't be in
hw/timer in the first place...)

thanks
-- PMM
