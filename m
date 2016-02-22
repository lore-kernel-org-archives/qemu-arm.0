Received: by 10.25.208.211 with SMTP id h202csp1115690lfg;
        Mon, 22 Feb 2016 03:03:48 -0800 (PST)
X-Received: by 10.55.74.86 with SMTP id x83mr33177639qka.89.1456139028444;
        Mon, 22 Feb 2016 03:03:48 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d201si29085577qkb.37.2016.02.22.03.03.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 03:03:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:48463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXoHL-0003T8-NO
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 06:03:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aXoGy-0003BJ-H7
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 06:03:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aXoGx-0007I5-M5
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 06:03:24 -0500
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:34610)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aXoGx-0007HV-Hb
	for qemu-devel@nongnu.org; Mon, 22 Feb 2016 06:03:23 -0500
Received: by mail-vk0-x229.google.com with SMTP id e185so125729797vkb.1
	for <qemu-devel@nongnu.org>; Mon, 22 Feb 2016 03:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=QteGnEcB3hXcnpWoaKSPivy+PfZPnsxmy1bjdwO2FOo=;
	b=POjUuGDL8GMoXiH0hR9Yapvth6/phqp8NcT92EV8rgfHGGrWfjtQi3j1Hc14yymRC0
	gg6SyWcCupss2xg5EuNCGdIf5vz2+GX+67NciyJRJdP/o29KQampnKMw1WwRY2pWJgOA
	8dVUdnhxhRAu1DkBj1X+gwpG7rGbf/nETyxn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=QteGnEcB3hXcnpWoaKSPivy+PfZPnsxmy1bjdwO2FOo=;
	b=JGg1vx7y81WcTDaVKxkWo1Lx53beOG+E4vg1v7/vhCdHVx4hOiGCaykU3JHPDRmJOs
	WEsVX0I0gDVDLiwoCQvJ+AmbD/Uzu5HkVT91MgVn9iuEN29wCmnmyelxQCJ8cHAiKn4o
	CSsXSxZneIdWobYTor5Qx+bEbWjdrBNI639IdEt+xPGkZzaAUNg9BuaxTeJaBxXT+5lW
	YLAJynrEybj+raa5MMLx/aBCOy5WHHnSVMAYFZQ04tOPS3ghwuV0mU7zSx3ocPJSzm3V
	pjgmEkqdTVHkz7VsAuDjRtO8i7WD4uUzUjJcOEwcpzxrGKgNFI+kTGFyrxgdNNyFlsyg
	njqA==
X-Gm-Message-State: AG10YOSdgI9QJ7eS9BmtNleaF/MwOEkB07mc6hy1O2t4Xft9piRRP2yM5wj/eBNNNTLNmRqgNtJZn252DqQ/THoG
X-Received: by 10.31.107.194 with SMTP id k63mr20090356vki.27.1456139001939;
	Mon, 22 Feb 2016 03:03:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 22 Feb 2016 03:03:02 -0800 (PST)
In-Reply-To: <56CAE2DB.3080702@163.com>
References: <1456132310-4826-1-git-send-email-zxq_yx_007@163.com>
	<CAFEAcA-sDDj=kKmQnru0nfrjuHSjD8KDzO-PWGd0ia3GMZrEdg@mail.gmail.com>
	<56CAE2DB.3080702@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Feb 2016 11:03:02 +0000
Message-ID: <CAFEAcA-nbrRN7ecP9G4O-bj=K-NtKoOQXpxGygKMPgxpgxQvBA@mail.gmail.com>
To: hitmoon <zxq_yx_007@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::229
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-devel] [PATCH v4 5/9] hw/timer: QOM'ify m48txx_sysbus
	(pass 2)
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
X-TUID: 0EhRdhoyumbT

On 22 February 2016 at 10:28, hitmoon <zxq_yx_007@163.com> wrote:
> =E5=9C=A8 2016=E5=B9=B402=E6=9C=8822=E6=97=A5 17:24, Peter Maydell =E5=86=
=99=E9=81=93:
>> Just noticed this won't work as it is -- the vmstate
>> struct is for the M48t59State*, but the ISA and
>> Sysbus wrappers have their own structs which are
>> what the dc->vmsd will be wanting to operate on.
>> You'd need extra VMState structs I think and
>> somebody who knows migration better than me to say
>> whether that is a migration compat break.

> It seems that the old code also use the same vmstate structure. Maybe it'=
s a
> common structure which will not be used at the same time.

The old code passes vmstate_register() a pointer to the
M48t59State, and so the offsets in the vmstate line up correctly
with the fields it wants to access. If you use dc->vmsd then the
pointer that is (implicitly) used is the pointer to the device
structure itself, which is not the same address as the
M48t59State embedded inside that struct.

You'd basically need to have extra VMState structures for the
devices themselves which just said "inside this M48txxISAState
is an M48t59State", and "inside this M48txxSysBusState is a
M48t59State" and referred to the existing vmstate for the
M48t59State.

thanks
-- PMM
