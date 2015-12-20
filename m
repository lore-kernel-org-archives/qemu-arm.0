Received: by 10.182.158.201 with SMTP id ww9csp2374173obb;
        Sun, 20 Dec 2015 12:51:51 -0800 (PST)
X-Received: by 10.55.221.21 with SMTP id n21mr9778876qki.5.1450644711723;
        Sun, 20 Dec 2015 12:51:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r206si26559790qhc.33.2015.12.20.12.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Dec 2015 12:51:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41962 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAkxL-0003lJ-HC
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 15:51:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAkxI-0003fw-QE
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 15:51:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAkxH-0000b6-Mt
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 15:51:48 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:37308)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAkxC-0000Yw-JU; Sun, 20 Dec 2015 15:51:42 -0500
Received: by mail-wm0-x235.google.com with SMTP id p187so46085727wmp.0;
	Sun, 20 Dec 2015 12:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MMXPGKXQ4fJpkdfWNGMr2FK+pgSVXjqS+MQpxhi7JWw=;
	b=himxIUnzHItx2SGNknSAgJ5LCOqsPfrDQzTl82RDIL3uygBuNeopOPyCyaLvVPIQhE
	TS7w5T08rTmy8HQmBI380euROCQ6nyC6XlrVt8Wvdd3q1UXIUdwmknZ3O0nb00YfAgD5
	3HPO8IZo4VZ2nyWI1J1rFmZqGboJHc89k+zlM/ujQ7cB/GI0vG83V3ZT3NcXBkEkGWHZ
	Evq56Z/Mv5wIYDWJFOPLVyxkLA9oKgGu/Iotz1FNAX9MTaFsiNbuRB16YURfZaoh2an3
	F4Vimhx5SFKb3SVH0jBRSe4utWkqka9G+AUHvnAS9F6hywYPYhETsaf+w+4ib8iFQKqU
	cvNw==
MIME-Version: 1.0
X-Received: by 10.28.133.4 with SMTP id h4mr15228989wmd.59.1450644701856; Sun,
	20 Dec 2015 12:51:41 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Sun, 20 Dec 2015 12:51:41 -0800 (PST)
In-Reply-To: <CAFEAcA8MKt-dJU5p=w_jOLv4+dFXtHaCHps=51=9ZM49wXesjw@mail.gmail.com>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-5-git-send-email-peter.maydell@linaro.org>
	<20151219213830.GE4164@pcrost-box>
	<CAFEAcA8MKt-dJU5p=w_jOLv4+dFXtHaCHps=51=9ZM49wXesjw@mail.gmail.com>
Date: Sun, 20 Dec 2015 12:51:41 -0800
Message-ID: <CAPokK=pPvPxLu3fkkz7qA9gahG1Sm2cWJYBYeDgw6A1Q2bfjeQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Cc: Kevin O'Connor <kevin@koconnor.net>, Markus Armbruster <armbru@redhat.com>,
	Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 04/10] hw/sd: Add QOM bus which SD cards plug
	in to
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
X-TUID: dm8Fz/oEzP7/

On Sun, Dec 20, 2015 at 9:10 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 19 December 2015 at 21:38, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> On Fri, Dec 11, 2015 at 04:37:05PM +0000, Peter Maydell wrote:
>>> +bool sdbus_get_inserted(SDBus *sdbus)
>>> +{
>>> +    SDState *card = get_card(sdbus);
>>> +
>>> +    if (card) {
>>> +        SDClass *sc = SD_GET_CLASS(card);
>>> +
>>> +        return sc->get_inserted(card);
>>> +    }
>>> +
>>> +    return false;
>>> +}
>>
>> This I am not sure about. Realistically, the card has no self
>> awareness of its ejection state so it can't be polled for "are
>> you there". The card insertion switch is implemented as a
>> physical switch on the slot itself and a property of the bus.
>>
>> The absence on presence of a device should determine this, making me
>> think this should return !!card.
>>
>> Unfortunately, we have the case of the block UI being able to trigger a
>> card ejection from underneath the bus level. But since the SD card is already
>> using qdev_get_parent_bus() the removal from the bus can be managed at the
>> card level.
>
> For user-level back compat I think we need to retain "might have
> an sdcard object with no block backend, and that means
> 'no-card-present'". This is both for the user facing
> monitor commands to manipulate the sd card, and also

What are the user-facing monitor commands? I tried using "change" and
"eject", but they don't seem to work for SD, due to the tray being
closed. Has this ever worked in a way that is user manipulatable for
SD or is it just to handle the case of unconditional SD card creation
(with the card never hotplugging over the system lifetime)?

Test case below. Using ep108 with a backendless drive (-drive if=sd).

$ dd if=/dev/zero of=./sd0file bs=16M count=1
1+0 records in
1+0 records out
16777216 bytes (17 MB) copied, 0.170586 s, 98.4 MB/s
$ dd if=/dev/zero of=./sd1file bs=16M count=1
1+0 records in
1+0 records out
16777216 bytes (17 MB) copied, 0.183836 s, 91.3 MB/s
$ ./aarch64-softmmu/qemu-system-aarch64 -M xlnx-ep108 -S -kernel
/dev/null -sd sd0file -drive if=sd -nographic
WARNING: Image format was not specified for 'sd0file' and probing guessed raw.
         Automatically detecting the format is dangerous for raw
images, write operations on block 0 will be restricted.
         Specify the 'raw' format explicitly to remove the restrictions.
QEMU 2.5.50 monitor - type 'help' for more information
(qemu) info block
sd0 (#block197): sd0file (raw)
    Removable device: not locked, tray closed
    Cache mode:       writeback

sd1: [not inserted]
    Removable device: not locked, tray closed

ide1-cd0: [not inserted]
    Removable device: not locked, tray closed

floppy0: [not inserted]
    Removable device: not locked, tray closed
(qemu) change sd1 sd1file raw
Tray of device 'sd1' is not open
(qemu) eject -f sd1
Tray of device 'sd1' is not open
(qemu) info block
sd0 (#block197): sd0file (raw)
    Removable device: not locked, tray closed
    Cache mode:       writeback

sd1: [not inserted]
    Removable device: not locked, tray closed

ide1-cd0: [not inserted]
    Removable device: not locked, tray closed

floppy0: [not inserted]
    Removable device: not locked, tray closed
(qemu)

Regards,
Peter

> for the not-yet-QOMified controllers, which will always
> create an sdcard object even if there's no block backend
> (which should continue to mean "no card").
>
> thanks
> -- PMM
