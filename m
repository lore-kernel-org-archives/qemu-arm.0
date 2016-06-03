Received: by 10.25.27.66 with SMTP id b63csp286640lfb;
        Fri, 3 Jun 2016 07:38:03 -0700 (PDT)
X-Received: by 10.140.28.8 with SMTP id 8mr3276899qgy.91.1464964683553;
        Fri, 03 Jun 2016 07:38:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 82si3669722qhu.0.2016.06.03.07.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 07:38:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8qEd-0007oD-1i
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 10:38:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8qEZ-0007nu-Tc
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 10:38:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8qEY-0005ka-0c
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 10:37:58 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:34802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8qEX-0005kS-Nw
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 10:37:57 -0400
Received: by mail-vk0-x232.google.com with SMTP id c189so117174642vkb.1
	for <qemu-arm@nongnu.org>; Fri, 03 Jun 2016 07:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lI38fZQbD7INiR3T8h4d1dWCPVR62KJRZQEtDC6jZ9o=;
	b=jEkaeLE5CclIMddjDnWCBgx847E5f8Purf77Zbj2WkK7xWX9zF6aa112vcU9gCxyKo
	FiiodMFYeFq7gKD9pXG0IP58rBwR3GDTnM11w+zlVRf6hzrPapGGZPQ8qd3bu7tILTWo
	0rNOJAQqCDPB/jIuG1skep3ZzUbvRxo9fl69M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lI38fZQbD7INiR3T8h4d1dWCPVR62KJRZQEtDC6jZ9o=;
	b=L8kJWOGoXjhPjPxGPPJLPzf0Sy3fwQY0XUKSuoeDkDaW5ivzmIk+elCVD43zNBgygw
	1ryUQbWd5WRWiK3B4qZ4ye6IeGYjn6NAhI6w7sgDQiGtC+P27ANoDaoGVRJmafZFwRSj
	bje/wNH0U3kH5DhOCAS7dVgMUDrztjRJwQq9HDkiiJwWgDkT1xRsw4BLRTvCnPZwrfsk
	OKg04SovgN1pNdMsaMbZuGLUT1f/KZU7TZFpldSA9kAh+gZELrxcrZ3+XLqPTiZ9nsFl
	O0iDyhJLJ6yNZeU+zET/QZpRidGmfR0LdEawL2K5Cc/oj4kPze6ebkZHK/Nf/0oIVPWx
	+4mA==
X-Gm-Message-State: ALyK8tKMGygpCFgUenr13cjJWhDUZNITojW4KPflcOK0n0gebHqDeQWaMxO81i+7aCUWuUsQuLRImKtlvOJuKs72
X-Received: by 10.31.142.202 with SMTP id q193mr1885422vkd.37.1464964677282;
	Fri, 03 Jun 2016 07:37:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Fri, 3 Jun 2016 07:37:37 -0700 (PDT)
In-Reply-To: <AM2PR04MB0739ED319596E29E8018D8EA84590@AM2PR04MB0739.eurprd04.prod.outlook.com>
References: <1464870382-385-1-git-send-email-bogdan.purcareata@nxp.com>
	<1464870382-385-3-git-send-email-bogdan.purcareata@nxp.com>
	<CAFEAcA9yTmT+5zDYJjmLDvxmdOiEfAxKxjCYuYKfOwUrft1Drg@mail.gmail.com>
	<AM2PR04MB0739ED319596E29E8018D8EA84590@AM2PR04MB0739.eurprd04.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jun 2016 15:37:37 +0100
Message-ID: <CAFEAcA9Q5NOy5u5Y8Sa4nE43WkzgQFi0BrdMwtyUcQ-WXO_EAA@mail.gmail.com>
To: Mihai Claudiu Caraman <mike.caraman@nxp.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] arm/virt: Mark pcie
 controller node as dma-coherent
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
Cc: Eric Auger <eric.auger@linaro.org>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Bogdan Purcareata <bogdan.purcareata@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GOHFwjrlUIfA

On 3 June 2016 at 15:22, Mihai Claudiu Caraman <mike.caraman@nxp.com> wrote:
> In particular for virtual and emulated devices the host CPU behaves
> as a DMA coherent 'device'. This should have been stated in patch
> description.

Wouldn't that imply that we should just always have the "dma-coherent"
property set, and we don't need to do any of the messing around looking
at the host sysfs ?

thanks
-- PMM
