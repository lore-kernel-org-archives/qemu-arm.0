Received: by 10.182.158.201 with SMTP id ww9csp2295496obb;
        Sun, 20 Dec 2015 09:10:59 -0800 (PST)
X-Received: by 10.140.226.198 with SMTP id w189mr20539145qhb.83.1450631459340;
        Sun, 20 Dec 2015 09:10:59 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f189si25940566qhe.127.2015.12.20.09.10.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Dec 2015 09:10:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:41408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAhVa-0005dw-Vr
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 12:10:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhV2-0005LV-C2
	for qemu-devel@nongnu.org; Sun, 20 Dec 2015 12:10:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhV1-0005Ww-8v
	for qemu-devel@nongnu.org; Sun, 20 Dec 2015 12:10:24 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33963)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhV1-0005Wb-5R
	for qemu-devel@nongnu.org; Sun, 20 Dec 2015 12:10:23 -0500
Received: by mail-vk0-x232.google.com with SMTP id j66so89833191vkg.1
	for <qemu-devel@nongnu.org>; Sun, 20 Dec 2015 09:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ZIkq3qqk4+IjrYu+CjHkoXnScyrZSj3KSGaJs9knFoc=;
	b=kw4StKWbrg7BLKzjk04b65ragcv4x+vlQNrKAcPmTXeFPuUrDSrU0gcsvxwC47oBbK
	Fl/XvhmLcrJfAjpCRJ1jgLL/GqBUn/9oSmuuI5/YBiFyReEUb5+4sK87xMKk1JS0Uonl
	dHaDBHDFACWDCCt7VPkN8OIUb4wrY2jznZCW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ZIkq3qqk4+IjrYu+CjHkoXnScyrZSj3KSGaJs9knFoc=;
	b=Yozsr51ECo2FpNtRlV537wvcH51JmxMq21Klxy1JTWJjOe72uwx/cwUpjllABjFBjs
	xvbQZDnebrtcflUDD8p4zqYOSFSUx0LqsFeYUj0m2k+Ikx2OndvrrbAID8ucMWdHv4JX
	bBLEtR/vCgL8UNIPtznoFCQU78CD8d4+C09bWaXlHEh5TVR8LVgi+MYNiznlYmOP/JmI
	d6Od3dZz6TK7OzK81E0gsy3HVLjlu2Hv6W4vXAuUg+bVxmg6CQ0t4qsrOljX5i7XAMLy
	jN35wkMM2rH4UpjQMi7HTC0aJcSSl4r0MN3zbFYVWl0AGGlP7br4AycmgHMwB0MdcbIH
	u6dg==
X-Gm-Message-State: ALoCoQn51KyVPGRW87iRLnmhiE//IjN1NnEZsXMI6cFSVTHxnzddIesGpGF9WzY/LKl0xndjlzTy1yMUbuRyJIz3WXNTnqNRLsxAu2zG6Xh8Z6cZMphKZxA=
X-Received: by 10.31.13.205 with SMTP id 196mr9565866vkn.37.1450631422808;
	Sun, 20 Dec 2015 09:10:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Sun, 20 Dec 2015 09:10:03 -0800 (PST)
In-Reply-To: <20151219213830.GE4164@pcrost-box>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-5-git-send-email-peter.maydell@linaro.org>
	<20151219213830.GE4164@pcrost-box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Dec 2015 17:10:03 +0000
Message-ID: <CAFEAcA8MKt-dJU5p=w_jOLv4+dFXtHaCHps=51=9ZM49wXesjw@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: Kevin O'Connor <kevin@koconnor.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 04/10] hw/sd: Add QOM bus which SD cards
	plug in to
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CQVqKJ81YduU

On 19 December 2015 at 21:38, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Fri, Dec 11, 2015 at 04:37:05PM +0000, Peter Maydell wrote:
>> +bool sdbus_get_inserted(SDBus *sdbus)
>> +{
>> +    SDState *card = get_card(sdbus);
>> +
>> +    if (card) {
>> +        SDClass *sc = SD_GET_CLASS(card);
>> +
>> +        return sc->get_inserted(card);
>> +    }
>> +
>> +    return false;
>> +}
>
> This I am not sure about. Realistically, the card has no self
> awareness of its ejection state so it can't be polled for "are
> you there". The card insertion switch is implemented as a
> physical switch on the slot itself and a property of the bus.
>
> The absence on presence of a device should determine this, making me
> think this should return !!card.
>
> Unfortunately, we have the case of the block UI being able to trigger a
> card ejection from underneath the bus level. But since the SD card is already
> using qdev_get_parent_bus() the removal from the bus can be managed at the
> card level.

For user-level back compat I think we need to retain "might have
an sdcard object with no block backend, and that means
'no-card-present'". This is both for the user facing
monitor commands to manipulate the sd card, and also
for the not-yet-QOMified controllers, which will always
create an sdcard object even if there's no block backend
(which should continue to mean "no card").

thanks
-- PMM
