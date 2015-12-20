Received: by 10.182.158.201 with SMTP id ww9csp2294111obb;
        Sun, 20 Dec 2015 09:08:00 -0800 (PST)
X-Received: by 10.55.77.206 with SMTP id a197mr19129398qkb.43.1450631280868;
        Sun, 20 Dec 2015 09:08:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n66si20706130qkh.14.2015.12.20.09.08.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Dec 2015 09:08:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:41391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAhSi-0003wV-ET
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 12:08:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42656)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhSg-0003uL-V6
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 12:07:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhSg-0004tn-7X
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 12:07:58 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33814)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhSg-0004tg-2k
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 12:07:58 -0500
Received: by mail-vk0-x22a.google.com with SMTP id j66so89817646vkg.1
	for <qemu-arm@nongnu.org>; Sun, 20 Dec 2015 09:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=9EcPCVkKA6wzRzHXvlj1dA1dakYznNZh01BcRpJNXHY=;
	b=LMYZe/vd2z3tkmuzIXfP8/6Qtjn7+tIJ3gVsx/xnwKouYjqtWNRKDLlDvS8kUOCW0d
	9s1SvVfFGDCYaQYBTuHV+QXo/Wk2O6abuP5CT5slmhw2X9vL8El7CXUhzAZzFaMI4iwL
	iMtvHpuKhyT/ONi76R/dt1Yb7Na0AhKA4dNlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=9EcPCVkKA6wzRzHXvlj1dA1dakYznNZh01BcRpJNXHY=;
	b=jq4Dd28hCojPnIjGM2FqFR4t5/tXa3IOAaBAR3oaxUqRECqy9tbYyQJ009gQLAy5v3
	iCjduOjkNxChw5JWoBw3Ajc4QmewqyiITgHXieTgzR4iYV0wNpWO5yJFhXAuNn21ZIpv
	dIEArITxor9tDHq2i1+pqb6MSX0OedradLtI5T5DA1aPbwtD2DRTzJ3zr/x6Zx/WzztC
	xEYUsGSxCUtMYnACUp3ijBCQLGkEh0dfLbGCSQgl/lRApBtyEJ/1wWB6FvIWBpgPHACQ
	gxI6q0TTlzWSYnHHQHWjRrh2ZIRLWhjrE+zbbzM3vl+XiBY4XhLMzSHma8RD0Kxdd+Ul
	QWSg==
X-Gm-Message-State: ALoCoQkkaGiwxjvXEWcVO2u7MrdBv3a1qgS7FOyIrPA0Nliim9IXfYQ4tpteMBEYJI/wVtmDrEKiTugOkGzFGyq7rS/5dSjupD3PEc/mEUXLgx7zxMka3+4=
X-Received: by 10.31.107.138 with SMTP id k10mr8922116vki.27.1450631277448;
	Sun, 20 Dec 2015 09:07:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Sun, 20 Dec 2015 09:07:37 -0800 (PST)
In-Reply-To: <20151219213603.GC4164@pcrost-box>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-3-git-send-email-peter.maydell@linaro.org>
	<20151219213603.GC4164@pcrost-box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Dec 2015 17:07:37 +0000
Message-ID: <CAFEAcA838426jFf5ksRQFFD4kMzOMS-jtk2pTRrF4tiV38YXEA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Kevin O'Connor <kevin@koconnor.net>, Markus Armbruster <armbru@redhat.com>,
	Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 02/10] hw/sd/sd.c: QOMify
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
X-TUID: 471ylXC4rcZ/

On 19 December 2015 at 21:36, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Fri, Dec 11, 2015 at 04:37:03PM +0000, Peter Maydell wrote:
>> Turn the SD card into a QOM device.
>> This conversion only changes the device itself; the various
>> functions which are effectively methods on the device are not
>> touched at this point.

>> +#define TYPE_SD "sd"
>
> Can we get "card" in there? I think unqualified SD should be usable
> to refer to the bus standard.

Sure. I don't have strong opinions on any of the type names
in this series, and I was wondering about sticking 'card' in.
"sdcard" or "sd-card" ?

thanks
-- PMM
