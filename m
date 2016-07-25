Received: by 10.25.21.156 with SMTP id 28csp1284251lfv;
        Mon, 25 Jul 2016 10:19:33 -0700 (PDT)
X-Received: by 10.55.76.201 with SMTP id z192mr24051885qka.182.1469467172917;
        Mon, 25 Jul 2016 10:19:32 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c34si18482032qkh.144.2016.07.25.10.19.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 10:19:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33659 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRjXQ-0001BX-C0
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 13:19:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRjXK-0001A6-RD
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 13:19:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRjXJ-0007Qd-Nl
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 13:19:26 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:36406)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRjXJ-0007QT-Jl
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 13:19:25 -0400
Received: by mail-vk0-x22a.google.com with SMTP id n129so207241431vke.3
	for <qemu-arm@nongnu.org>; Mon, 25 Jul 2016 10:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=0HTjdDFV7KPIYeQyYDFpMeingUuVDwRO7qhHLvZbabs=;
	b=FwZuRIpGNZdw2jYcZokD6CHp9D5/t2WYM4Hjc7Xpur8L+mdIQQivMlFFy0LjfxxVtP
	TYdFabdDDKlB0ZgVidbBDJ/HDpZiDQiB7I8z+61YTvDCXAYxlA3e+spHro1jsC72P5Ly
	9zNSfLemqpO9+yO7t2HRQyLadR1dInr8WzgT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=0HTjdDFV7KPIYeQyYDFpMeingUuVDwRO7qhHLvZbabs=;
	b=itfeCPyrcVPJ/jf7k2jwKbB1g69Qf2YMWKeN9fNJsBlNt9sBRKZF9pPe7lHftOIVZT
	//ujgmAaZUUmW84UW6umV5ZJSoXiD7xjODWgUhbPx0BVNluU3RF/TiUXKdTGBxfQofaE
	9BxleBSdL0aUY9xKoQ7BhuQAO6flmjVIPomyJRj/2xDuj8skqAVeFhg06edzlI0VIRr+
	Qg8WvhyjbkyphurhP1D93urnz4klBYbCDq/klT0Anxm2beRIr3Dhl5XmYeeVp7LbYDow
	wppBPlXfaPysSIOqy1v4So8hj4kexBrbMJDsc9od/FzaRtk9IOiXXhZIUjR0k3ez/Py1
	XzNw==
X-Gm-Message-State: AEkoousCBvhm1JfcUqeGKEoGmWmCEytOn6mS+jo8p+t8pgN3C6rPlqWU/myAnUflC2Fo+Lq65MJsERrWZk3eCMwn
X-Received: by 10.159.40.67 with SMTP id c61mr8946709uac.82.1469467165236;
	Mon, 25 Jul 2016 10:19:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 25 Jul 2016 10:19:05 -0700 (PDT)
In-Reply-To: <1469466558-10964-1-git-send-email-clg@kaod.org>
References: <1469466558-10964-1-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2016 18:19:05 +0100
Message-ID: <CAFEAcA8rVBWn4vcJ6aJDvFKTPFet7jUQ-VRXSa1aE7fcA8cFgQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Subject: Re: [Qemu-arm] [PATCH v3] ast2400: add a memory controller device
 model
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kUh9rzHlbc11

On 25 July 2016 at 18:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The uboot in the previous release of the SDK was using a hardcoded
> value for memory size. This is not true anymore, the value is now
> retrieved from the memory controller.
>
> Below is a model for this device, only supporting unlock and
> configuration. Without it, we endup running a guest with 64MB, which
> is a bit low nowdays. It uses a 'silicon-rev' property and ram_size to
> build a default value. Some bits should be linked to SCU strapping
> registers but it seems a bit complex to add for the current need.
>
> The model is ready for the AST2500 SOC.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Thanks. I have put this in my "for-next-release" mail folder
so it ought to go out in a pull request once we've got
2.7 out. If it fails to show up please ping me to remind me
to clear out that folder :-)

-- PMM
