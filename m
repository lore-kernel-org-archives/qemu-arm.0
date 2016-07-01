Received: by 10.25.21.96 with SMTP id l93csp392764lfi;
        Fri, 1 Jul 2016 10:01:06 -0700 (PDT)
X-Received: by 10.237.55.168 with SMTP id j37mr33738744qtb.102.1467392466661;
        Fri, 01 Jul 2016 10:01:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b193si2854924qkg.291.2016.07.01.10.01.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jul 2016 10:01:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bJ1oQ-0007Xo-32
	for alex.bennee@linaro.org; Fri, 01 Jul 2016 13:01:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ1nn-0006x4-OK
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 13:00:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ1nm-0004tq-Ga
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 13:00:27 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34917)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bJ1nm-0004tf-1V
	for qemu-arm@nongnu.org; Fri, 01 Jul 2016 13:00:26 -0400
Received: by mail-vk0-x236.google.com with SMTP id u68so118206522vkf.2
	for <qemu-arm@nongnu.org>; Fri, 01 Jul 2016 10:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LDm6/kYEKR01Vs6chtN7fZ01sD9qyxbJVDe8VUMBNI0=;
	b=TPAiC5ek7eWeQ/KSFuIAdmldsAP7RYx/UnIVtpLkGrosbepbp7Kw/f/rN+11uWUxnv
	3C5d35aUlLnOJ4dZI32k0AlrFmgEtH+tirbOAySBCposj1WCT/QP1buSBXOnynyW8gKE
	nd5q+l74C5Rt6ve8UxUsixsBT8qfC1TRdviDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LDm6/kYEKR01Vs6chtN7fZ01sD9qyxbJVDe8VUMBNI0=;
	b=az5bb4jbIGNg1hkkPEvmn9axq8zUDm6ZyoZOvEQc7b28A9g4KV93uxkvf663Fs+RqA
	B9mS0aNrxdOX/i6qfurmVGKYiED+8ztXlyQpY19900/xtPnyOKvHUE/IzsgCD/af9lLu
	ESdzjo/Q0b70RcpYmFQgcbvemJT2wKpum0aQ68sTaUEjFBFi2utkoPbV0ofFZ0gGMiBk
	My31sR7FoOnOmdpNAHQsKdI0DiPuW+w0ZDvWuNEnlugGjMgY97ojhu9KK++VtFQR5phq
	7hW4LzURI2ed2sVk5wHeKOve618SfYqDHH4e0W0SSjLIy9csARRhxLCIl+vuGhLbAuCx
	Lydw==
X-Gm-Message-State: ALyK8tK3NbIsfik82taWyiv33RSY8orL/pdfydKGGnLpsBtFO/DMHiDvig5j7j0R0tWdt0bV1gWPKnCZ7XoI6am+
X-Received: by 10.31.188.80 with SMTP id m77mr9704938vkf.30.1467392425236;
	Fri, 01 Jul 2016 10:00:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Fri, 1 Jul 2016 10:00:05 -0700 (PDT)
In-Reply-To: <d63ffd58-7006-5eb1-bbfa-fa62fb1797be@kaod.org>
References: <1467138270-32481-1-git-send-email-clg@kaod.org>
	<1467138270-32481-8-git-send-email-clg@kaod.org>
	<CAFEAcA_8+XubTSH2sstoyoXi6s1DkZySckyUqrt0BGiMALC4+Q@mail.gmail.com>
	<d63ffd58-7006-5eb1-bbfa-fa62fb1797be@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Jul 2016 18:00:05 +0100
Message-ID: <CAFEAcA-pbJYuHOGSfDWKG+pVLWX3G9ETh+5QkQ9Shsn6aBVtqw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-arm] [PATCH v5 7/9] ast2400: add SPI flash slaves
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
Cc: Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CXVGz0MOXeDJ

On 1 July 2016 at 17:44, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> I have some extra patches to use a rom device and boot from flash0.
> That is for next week.

We're in softfreeze now, so really I should stop
taking non-bugfix patches, though for a new board
with missing stuff that prevents boot there's a little
flexibility.

thanks
-- PMM
