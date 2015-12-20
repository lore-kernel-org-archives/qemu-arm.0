Received: by 10.182.158.201 with SMTP id ww9csp2324019obb;
        Sun, 20 Dec 2015 10:25:12 -0800 (PST)
X-Received: by 10.55.40.153 with SMTP id o25mr19618762qko.93.1450635912816;
        Sun, 20 Dec 2015 10:25:12 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 89si26238607qgi.63.2015.12.20.10.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Dec 2015 10:25:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41602 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAifQ-0003LM-Ga
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 13:25:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAifN-0003FJ-Jp
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 13:25:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAifM-0002u0-Th
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 13:25:09 -0500
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:34428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAifK-0002sZ-T0; Sun, 20 Dec 2015 13:25:07 -0500
Received: by mail-wm0-x236.google.com with SMTP id l126so43699916wml.1;
	Sun, 20 Dec 2015 10:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sklu1F+F2UdlKBYtjeZ+PbENqV88BXyuWDbrWUA8Q8k=;
	b=jtP+jlkNe2QlSARdz7qKqCJt/7kgzB2ffC2/lxZ3cjoaC0AJH2PJnL0/NnLmOMRAVB
	i4BrDKKwdgM0o/9ZqYLOD6h/Li0gzsU2Ln8KYLRMY3KpMsXtitvu7EJdm7rStOKc1R2S
	M+F4ZZU+Qcl8ihvnWBmzwfiT9CnmaGIkqrMHFDwHgibEhRznn5B8//1d4nnn0JNcMd7s
	xaxrKamlRfxxjyWeQJM9WtJF/7a4g94g/dfgu/goin0BkJtnw3igYMoa6i7Sp2q86rkd
	YsAt5cC1p/vQUyY8lpilwg1vhRhPYJYLsmwwiXiOMs6VL8G9AX4aUm6WDADMu5Y43HE5
	mjhA==
MIME-Version: 1.0
X-Received: by 10.28.150.201 with SMTP id y192mr14971797wmd.15.1450635906180; 
	Sun, 20 Dec 2015 10:25:06 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Sun, 20 Dec 2015 10:25:06 -0800 (PST)
In-Reply-To: <CAFEAcA838426jFf5ksRQFFD4kMzOMS-jtk2pTRrF4tiV38YXEA@mail.gmail.com>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-3-git-send-email-peter.maydell@linaro.org>
	<20151219213603.GC4164@pcrost-box>
	<CAFEAcA838426jFf5ksRQFFD4kMzOMS-jtk2pTRrF4tiV38YXEA@mail.gmail.com>
Date: Sun, 20 Dec 2015 10:25:06 -0800
Message-ID: <CAPokK=o-pVTg31zjz0AXBcwZ7rJDn-sh0axgXcf-WH=mOW0L3g@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::236
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
X-TUID: d4sxCLgsnpAf

On Sun, Dec 20, 2015 at 9:07 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 19 December 2015 at 21:36, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> On Fri, Dec 11, 2015 at 04:37:03PM +0000, Peter Maydell wrote:
>>> Turn the SD card into a QOM device.
>>> This conversion only changes the device itself; the various
>>> functions which are effectively methods on the device are not
>>> touched at this point.
>
>>> +#define TYPE_SD "sd"
>>
>> Can we get "card" in there? I think unqualified SD should be usable
>> to refer to the bus standard.
>
> Sure. I don't have strong opinions on any of the type names
> in this series, and I was wondering about sticking 'card' in.
> "sdcard" or "sd-card" ?
>

I think "sd-card"

Regards,
Peter

> thanks
> -- PMM
