Received: by 10.25.159.19 with SMTP id i19csp1607519lfe;
        Mon, 8 Feb 2016 15:45:43 -0800 (PST)
X-Received: by 10.140.18.114 with SMTP id 105mr37754312qge.41.1454975143217;
        Mon, 08 Feb 2016 15:45:43 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d65si32951453qga.76.2016.02.08.15.45.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 15:45:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:49937 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSvV0-0007X7-8Y
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 18:45:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aSvUx-0007Vo-Rq
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 18:45:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aSvUw-0002EH-TL
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 18:45:39 -0500
Received: from mail-ob0-x244.google.com ([2607:f8b0:4003:c01::244]:33812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aSvUu-0002Dq-W7; Mon, 08 Feb 2016 18:45:37 -0500
Received: by mail-ob0-x244.google.com with SMTP id x5so8921364obg.1;
	Mon, 08 Feb 2016 15:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=2Jd5WhZQIFGjxVvFS8ox5Kpt2wT6TwBHXixlhXIMvNs=;
	b=mommvndHAk8bj+7ScVEdSmzKrU04fKAQGRtvHh0TEEglm2NWboZCyhVoX1wWMswSxu
	qZUrrJiIEeka2JUFl9TlEsKyBJIJXpcEr/yvgLwB7y+SdtFyABq5gFYpxxtqdwJjUcuw
	f8xetJcQ6TDeHY3jayworTTDPI62eEonyYa0P458zzLMxk51z1Ntvr6dv5MuK5DjWuT/
	M3T33NmEQGBC/cvWReLHpAU/IrUmR1MyuUne57Dq6t0bk9xs1E7J5kWwYbX0nxg9bL2h
	fW5vB0LipR0g13Q+DKy7klPML43PJWjWbjzPO54zsi/7ZW2An0V8B55ORV/okrRaNxtu
	lEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=2Jd5WhZQIFGjxVvFS8ox5Kpt2wT6TwBHXixlhXIMvNs=;
	b=jwDdPQYzXwOyPVX8lu+hcvy93O6qdQn9Jg9hf7ziFTsdPO6ZBJLRToOzQvaBk0Tacc
	/f8mJgrpQQs6rC2+jm2fMcESWjrCdKHSZ+VxRBAH9Bc/K856OXad/kOzcznHDEBeONzx
	uMc0lvKQ9Qz3ZJqRJGTDuSzgThcBXLW5gDHMYPGkTos1fspilbPKyT6Peyd743cvrddm
	PJ2AgNib0CIPQh5XhGfHoRc23cMi0x7GWNPY9C4/QClSUN07wqpF/c+ve896F8MUt24H
	4Cg7X/T7VsTm6WGhupl7Igo4IiN6UC2NJPm2HxgxfSm17YDvhMaQirx+vs2eHouCt/lN
	rE8g==
X-Gm-Message-State: AG10YOR8M/V3HSgQQ8G3j7g7Ud65t0UJA0VojdQJ9UXOYeipjPgg6yqOHWuH0HSqeyENUz3rwKysc0XpKJ5V/g==
X-Received: by 10.182.86.98 with SMTP id o2mr12204910obz.27.1454975136434;
	Mon, 08 Feb 2016 15:45:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Mon, 8 Feb 2016 15:45:07 -0800 (PST)
In-Reply-To: <CAFEAcA9Mr8MstvOT+takGJG9T9+jdMiBdcm5HxmU49SoMzFDwg@mail.gmail.com>
References: <1453479402-14870-1-git-send-email-peter.maydell@linaro.org>
	<1453479402-14870-5-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKMMphHzbnxRDQHkH-=v5Ap_V3XfarKicF9h-Na5H1MZHQ@mail.gmail.com>
	<CAFEAcA9Mr8MstvOT+takGJG9T9+jdMiBdcm5HxmU49SoMzFDwg@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 8 Feb 2016 15:45:07 -0800
X-Google-Sender-Auth: oeq4NGjyEkFcjU32UXoMcKhpGcE
Message-ID: <CAKmqyKMDrc+is2TbZqhgTdJX62mZeUG9jkNnmuxTacpMSZ9NHA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::244
Cc: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Kevin O'Connor <kevin@koconnor.net>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 04/10] hw/sd: Add QOM bus
 which SD cards plug in to
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
X-TUID: PUfw+KWRekvO

On Mon, Feb 8, 2016 at 3:37 PM, Peter Maydell <peter.maydell@linaro.org> wr=
ote:
> On 8 February 2016 at 23:24, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> This patch doesn't compile and neither does anything after this. I get
>> the following errors:
>>
>> In file included from hw/sd/sd.c:35:0:
>> /work/alistai/master-qemu/include/hw/sd/sd.h:81:5: error: unknown type
>> name =E2=80=98DeviceClass=E2=80=99
>>      DeviceClass parent_class;
>>      ^
>> /work/alistai/master-qemu/include/hw/sd/sd.h:99:14: error: field
>> =E2=80=98qbus=E2=80=99 has incomplete type
>>      BusState qbus;
>>               ^
>> /work/alistai/master-qemu/include/hw/sd/sd.h:104:14: error: field
>> =E2=80=98parent_class=E2=80=99 has incomplete type
>>      BusClass parent_class;
>>               ^
>> /work/alistai/master-qemu/rules.mak:57: recipe for target 'hw/sd/sd.o' f=
ailed
>> make: *** [hw/sd/sd.o] Error 1
>> make: *** Waiting for unfinished jobs....
>
> Weird. Maybe something's changed in include/ since I sent the series
> so we're no longer getting qdev.h implicitly pulled in by some other
> header.

I did rebase the patches ontop of the latest master, so that might be it.

>
> Does adding #include "hw/qdev.h" before the sd.h include in
> sd.c fix this?

Yeah, that fixes it.

Thanks,

Alistair

>
> thanks
> -- PMM
>
