Received: by 10.25.21.96 with SMTP id l93csp2460897lfi;
        Wed, 22 Jun 2016 06:08:54 -0700 (PDT)
X-Received: by 10.55.133.6 with SMTP id h6mr38034331qkd.82.1466600934208;
        Wed, 22 Jun 2016 06:08:54 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n74si6148250qki.31.2016.06.22.06.08.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 06:08:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58141 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFhtl-0000eI-K4
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 09:08:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51722)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bFhME-0004FL-9O
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:34:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bFhM4-0004Ho-1M
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:34:13 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:36264)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bFhM3-0004Hh-Ts
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:34:03 -0400
Received: by mail-vk0-x236.google.com with SMTP id u64so59803411vkf.3
	for <qemu-devel@nongnu.org>; Wed, 22 Jun 2016 05:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uDz8p/5pb0i5I+NKdN2v9V8OgdV0kyskNO/JJHMrCVw=;
	b=CENUzU6+J5nHhMccPaQgpg4sem7qajEkQPLNMVcQaZJk9uZUhLDmPT6o74ExvPEJtc
	e4b8DVkmojMqwQsFMBqnb4Uhk6W0xQpy3RVah9UOXwzwgreVLUY5rpChJCW5cye+naZg
	4alK/DHW2/NYseQsvnh3a1w8vJdN3qHjGAox0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uDz8p/5pb0i5I+NKdN2v9V8OgdV0kyskNO/JJHMrCVw=;
	b=SmdBBaMVfjT6AsO3OIBQuAjE5WQa+dnN2o0gj888z/Va3m+HfbBx7QdFY6pKFXfS7F
	NeyQS0YRqjxsyOdpYCyqSYvB02CMpn08STHgXnVJfqofbTm0CgkbbaDw7xfV4cYDp++v
	eaNcqBzMI1FhThxAd/OZJ2N7eLc+Lv14s+6dqp61Un5WH/EoGBff5EyHI+Zu/96/5ciN
	nSKRYbXBa51MVbRlxyChZ5WCaUamEcvMFIJTvo1dd+RnB15d166bs/dTY49ZRyKi/+8G
	rYfKjsyjSpdopv3P0qPa/g1mZf/F8cmkfIX9VbyjeCv7ekIqoFxiBE+P5loVm8oZMe4j
	9rZw==
X-Gm-Message-State: ALyK8tJPqEg955FuJa3G4jbZzi+DSistaIErLSs6oaOPOloFHYkDRJZBf2j5SkFtjlKDN9i3jg8MqpoJFvOau1xf
X-Received: by 10.159.55.235 with SMTP id q98mr12006615uaq.83.1466598843395;
	Wed, 22 Jun 2016 05:34:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.68.228 with HTTP; Wed, 22 Jun 2016 05:34:02 -0700 (PDT)
In-Reply-To: <CAFEAcA_SRt+uDMy=bAqktW=cGErYkMiAsNGBT7Jbyd1KRGtjxA@mail.gmail.com>
References: <CAN76PtRzf2qAwkMi9PMCUCaUha+6EpFnA_TiBB_oWLVFEQ8yyw@mail.gmail.com>
	<CAFEAcA_SRt+uDMy=bAqktW=cGErYkMiAsNGBT7Jbyd1KRGtjxA@mail.gmail.com>
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Wed, 22 Jun 2016 20:34:02 +0800
Message-ID: <CAN76PtRjHq3NPetkobdT_e5O=OvuJ=Q+q+WKHggHo-ShfQAGCg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] Question about a qemu Aarch64 error when adding
 several SCSI disks
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
X-TUID: dtoNRKSLtK15

Hi Peter,
   Should I use the newest version v 2.6.0 ?

On 22 June 2016 at 20:04, Peter Maydell <peter.maydell@linaro.org> wrote:

> On 22 June 2016 at 12:51, Kevin Zhao <kevin.zhao@linaro.org> wrote:
> > Hi All,
> >        Greetings from Linaro. This is Kevin from Linaro, and recently I
> > have met a problem of qemu-system-aarch64 when I am working on
> virt-manager.
> >        I have reported a bug here:
> > https://bugs.launchpad.net/qemu/+bug/1594239
> >
> >        It's mainly bout adding several SCSI disks to Aarch64 guests.
> >        If you have a moment, pls kindly give some advice about
> this.Thanks
>
> Can you reproduce the bug with a newer version of QEMU?
>
> thanks
> -- PMM
>
