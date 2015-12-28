Received: by 10.182.158.201 with SMTP id ww9csp6973052obb;
        Mon, 28 Dec 2015 12:41:43 -0800 (PST)
X-Received: by 10.55.72.3 with SMTP id v3mr73005773qka.107.1451335303104;
        Mon, 28 Dec 2015 12:41:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g11si66345873qgd.91.2015.12.28.12.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Dec 2015 12:41:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@linaro.org
Received: from localhost ([::1]:46179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDebu-0005PV-Qx
	for alex.bennee@linaro.org; Mon, 28 Dec 2015 15:41:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDebt-0005P7-3c
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 15:41:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDebr-0006BL-HQ
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 15:41:41 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:35303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aDebr-0006B8-8z
	for qemu-arm@nongnu.org; Mon, 28 Dec 2015 15:41:39 -0500
Received: by mail-vk0-x22f.google.com with SMTP id k1so56904211vkb.2
	for <qemu-arm@nongnu.org>; Mon, 28 Dec 2015 12:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XhcLD++F3nhPeF6BiGOrMcU4cLZSaapRh8JRJLgnXe0=;
	b=HJrgqXdlkgctsiR7NYM7Fzo1rOFvFuDdDSKTQ7zLEuk3+RNJlnuQ5kZFCopJxcp0eu
	jWuf5i5uE2gdc7c9wlACyWiOylG606+UmNvqMlJ7TT5G7jifci6lg0nHDV2a3JJy3OsB
	a3DE0KtG7mW+b7gHL1FSiUObHoGmIDTbWf/Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=XhcLD++F3nhPeF6BiGOrMcU4cLZSaapRh8JRJLgnXe0=;
	b=KsPxQe9pxZtBlmhGfxFmNYJS+7sp620f6kKiFcYWMyq41OSB6goy2d0pS/Y0pc0qo+
	0Qd2xuNwk6Z5yjVikF65nYel8boJtgDGgMRntoblsdSOaT9GzlbtRYfnA0EtSgu9GbfP
	77juUJ0VGuBu17IyctK9ZCUZZwGQbj6p8OZVcZuHmxyaPAi4wB3KdtScuxu12RhIVsAM
	XIXUiKU1MTV4mRWL0sWW11INgZtcjCovJF04UsBJFIxRGIlqrQmwffP3rT5btbBAkX0n
	9T5crDbiidOHyuPiwPjbeX/8KMPXJuwp/S3Tx1Q4Jio82S95wWNULZZyOZTwvQPifRYI
	K4Fw==
X-Gm-Message-State: ALoCoQlLnFRk8PWh0cgaTGgG9i1yRY75GCssPSL8AqORGukLgngD+PrGggEECMpxVgatq+wa0Fw5OgX8qwTzpJNE0UGEo8hvccznYV9FvGChJEKp35peVd4=
X-Received: by 10.31.47.197 with SMTP id v188mr36028736vkv.6.1451335298766;
	Mon, 28 Dec 2015 12:41:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 28 Dec 2015 12:41:19 -0800 (PST)
In-Reply-To: <CAEaoPMgwvktPWr4z-qjy3chyYdkEdEGFg+P0Ood5JdOgED6-tw@mail.gmail.com>
References: <CAEaoPMgwvktPWr4z-qjy3chyYdkEdEGFg+P0Ood5JdOgED6-tw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Dec 2015 20:41:19 +0000
Message-ID: <CAFEAcA8X2f9oVNgO6sOK+TwAkuCCPH0wd1gjVe3D5hbm3TF8Dw@mail.gmail.com>
To: John Davis <davisjf@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] command line args for qemu-test image
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
X-TUID: zUov6leIbEMK

On 27 December 2015 at 23:48, John Davis <davisjf@gmail.com> wrote:
> Hello
>
> I am trying to test my build from source to see if I have a working
> qemu-system-arm build.  I pulled the test image from this page:
> http://wiki.qemu.org/Testing
>
> It has a readme in the archive which says to use this syntax
> ./qemu-system-arm -kernel zImage.integrator -initrd arm_root.img
> but when I run it I do not get a console.  The version of qemu I am using
> requires a -M option and I have  tried some of the available options
> but none work.

You want -M integratorcp.

thanks
-- PMM
