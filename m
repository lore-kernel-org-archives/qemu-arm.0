Received: by 10.25.208.211 with SMTP id h202csp640579lfg;
        Thu, 18 Feb 2016 06:32:03 -0800 (PST)
X-Received: by 10.140.107.70 with SMTP id g64mr9099944qgf.75.1455805923307;
        Thu, 18 Feb 2016 06:32:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 207si8215538qhw.106.2016.02.18.06.32.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Feb 2016 06:32:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:41801 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aWPcg-0003XM-SA
	for alex.bennee@linaro.org; Thu, 18 Feb 2016 09:32:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWPce-0003Wp-7m
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 09:32:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWPca-00076T-8X
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 09:32:00 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:34369)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aWPca-00076O-3c
	for qemu-arm@nongnu.org; Thu, 18 Feb 2016 09:31:56 -0500
Received: by mail-vk0-x22f.google.com with SMTP id e185so45657337vkb.1
	for <qemu-arm@nongnu.org>; Thu, 18 Feb 2016 06:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=k2mOT1HtIBW+1RYNmsQaVQUryt2r1P/EVfokqzIdYUc=;
	b=ClJDylXCAAF9Dtq9rMD90zrM189DTcT+7WaahUXhqn8zPlte9IJXj+i4WdkRsbyZE5
	Lf/hQzDuU5pXZZTAgOvCfJAKNZaFR6Y1W1x1y8eQOWPxzNKle+FPZ0ZOuzoEyD/jUISl
	Ty0API8/0/BCyZtmA+JdnQwlLsEj/1xi5bECY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=k2mOT1HtIBW+1RYNmsQaVQUryt2r1P/EVfokqzIdYUc=;
	b=eWbtqolYfK47T24bJvSH9pHnpjxkbhSGQShUVtBuWbr7UA31lAGmjqg11czb5iDOOy
	FB/Di0LP+HN89EydSOb8JqvSbUJNtGJHac+NwOYWLI6lONhLzAhZwh8ASyLTfiYLF1Qd
	b+2REtTxxCBr+RXsKydzpAe9RAg5pMoNFJfhtcWQIvh937a44ynS1fKyOQO1gOmq1w+o
	8lKqUqrlAA51W5INDfLgGnhho45eTUz34BHGjZMIJDyd+vjTzYF7q6RvIsvpDKR2Ko+L
	CHdckz7bZ2ZItZvFypRVz75TmJZSj8+MeVIrJcERAN3470mwZaHCqrrSSI7qJP1Xqo4H
	88OA==
X-Gm-Message-State: AG10YOT2GSF5j4keqwAFV9U2rKr3xk7VlBQRpsk6d1WfIDzxupAodX550I+4WWrc/vJlI1KlVFgb6wPYC2g2Cqat
X-Received: by 10.31.52.147 with SMTP id b141mr6301817vka.82.1455805915409;
	Thu, 18 Feb 2016 06:31:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 18 Feb 2016 06:31:35 -0800 (PST)
In-Reply-To: <1455805567.632258470@f6.my.com>
References: <1455621027-13927-1-git-send-email-zxq_yx_007@163.com>
	<1455621027-13927-3-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA8PSnrnu3o9dJWK3RwrSiq64qjFOqw3gz0Vr_YEXM3Oyg@mail.gmail.com>
	<1455805567.632258470@f6.my.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Feb 2016 14:31:35 +0000
Message-ID: <CAFEAcA_BLf0CtQCRSu60NntRgud7aJ+kQjfQgKAQFJ-dSXhz0Q@mail.gmail.com>
To: xiaoqiang zhao <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: Evgeny Voevodin <e.voevodin@samsung.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH v3 12/16] hw/timer: QOM'ify pl031
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
X-TUID: 8UBbnJFxMp/J

On 18 February 2016 at 14:26,  <zxq_yx_007@163.com> wrote:
> Thanks Peter!
> Sorry for that=EF=BC=81I will correct this in next version. I also have o=
ne
> question=EF=BC=9AWhy the patch I have sent to this list does not have a t=
itle begin
> with "[Qemu-devel]" ?

It depends entirely which copy you see. For example the list
archive's copy does:
https://lists.nongnu.org/archive/html/qemu-devel/2016-02/msg03400.html

If your mail client sees the copy that went via the mailing list
server first, that's the subject you'll see. If it sees some other
copy first (perhaps you were personally cc'd on the mail, or if
you sent the mail yourself there's the copy you actually sent)
then it won't have the subject tag. If it was sent to several
mailing lists then you might first see the copy from one of the
other lists with that list's tag.

(PS: please don't top-post list email.)

thanks
-- PMM
