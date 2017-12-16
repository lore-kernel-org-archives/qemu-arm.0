Received: by 10.223.159.74 with SMTP id f10csp150543wrg;
        Fri, 15 Dec 2017 16:14:30 -0800 (PST)
X-Google-Smtp-Source: ACJfBouwIiatPBAJtKpUYc+jSdWjLYpxNb8WZkHNvoZUXzozPo4douMTC3/J6gl09BMhiAwrkqWG
X-Received: by 10.37.160.200 with SMTP id i8mr8304615ybm.118.1513383270773;
        Fri, 15 Dec 2017 16:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513383270; cv=none;
        d=google.com; s=arc-20160816;
        b=U6QV4VnaBr/UgQzO4tCIUyKeHx0ibRheo6yDMn5qaICEbSlKS0OZp0+klMBjuBKmws
         HU+f2PkI9BOvdRn2/yqvEc393bFxJ98jiGNqG/WwCVhhldAvGhK8Vaw3tyJh9fddh1xo
         5z6kn+L5WRhF7RTrr4+dsUSl98pV27jXyPWRpmz9VR9r3GirQKjhFn9P7BUyvlKz/jF3
         BS3w7EbyGVVlQsq/XV1KYHTxA9hI8a0zEiq58+goZAO25KuCrjUU1Y0Ws+DcA2pqP5sb
         nwxJwHfPzkE1759tTiP2fJKn7yCLWII2AI1JxUCqqzmZE77X0zmkrLwIqjy1oZpeZFIV
         xv1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=S/7HwejleEQJm0hyEDi92gBafhGIqmEZUISPIlZ218o=;
        b=QJEkXiIHE4Y+F+6kEXkxwNxcAz3LFQHNfHgegY1iDE934CHu7lU/UmItKGO1rchQF+
         DYDew+pQb/2s88V+Tbh6LTNkecLSBO4UT6Fp4/k+bjaSR8y32ppLJsYfmToMFSdo5VXj
         cOE5eVc9X6adNSsQRgqSPJhHynYg4xpizdksczf3KJznlph+1q4gKWjHg3fzt2LZ+1/n
         weJvuyw5/2ERjW7c6+WCjOkwLWN28Lbg/yXs9c2RjhOOfAX4Zitb1Qul2OvwArUINCvU
         RU71tZoG4m3+vgsDZ1eSWjK6qkPwbwOjYBtKEtIC6479FmyI7bCgv1gUpirbd4u+ygKU
         9Wfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mx+FxJck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l14si1438031ywi.554.2017.12.15.16.14.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Dec 2017 16:14:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=mx+FxJck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:48874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQ07a-0004JK-6V
	for alex.bennee@linaro.org; Fri, 15 Dec 2017 19:14:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eQ07P-0004HP-Gv
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 19:14:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eQ07O-0003SG-2I
	for qemu-arm@nongnu.org; Fri, 15 Dec 2017 19:14:19 -0500
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:40377)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eQ07K-0003KF-Hh; Fri, 15 Dec 2017 19:14:14 -0500
Received: by mail-wr0-x243.google.com with SMTP id q9so9412006wre.7;
	Fri, 15 Dec 2017 16:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=S/7HwejleEQJm0hyEDi92gBafhGIqmEZUISPIlZ218o=;
	b=mx+FxJckkpMXB2Zn5OP9MwDF9XlPBi2QlwUDlU1xpLMdjsEhhCu28XMFcYOu2uNZke
	/rw72RW2LYMfj2M45PRAPWvJq0dIw45zg3STzRfpZ50ima8jLSEhDZSz3eUOzEq2WGiG
	LvrEhLdNAlbjWoCoNoM8N3iuEQCpUz4xhFrx02ZRV/FWbTAM0TnuBoxnsnrrqKLvhN79
	UDsWB9ZDw2i+5Exszx5QDgrZiKydbUYfya3EdDh8ZFCzlUq8VcHoJiEtyCYDLuTO8pnI
	jGqDZdPnKOexulxcerrONc6HnuN4GNLtGJxqpqjcL7eUHbKtq92eKNHjCGWpUM/zpDBb
	dCxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=S/7HwejleEQJm0hyEDi92gBafhGIqmEZUISPIlZ218o=;
	b=oA7rcCtC0StVx9UoionO/pCbD1XkSxI13j8YEGk6MXFe3QS+T1S89VbjcrstzvOy4h
	bO4KYwoF2H21J+zBkX/EB2GDNGvaShwAqwmQ8MoMVKu8t60/8OSsFEZpvqebcZAOCWkX
	CApA4AILFipI0hbNmYGk703xO8J7QiQacnbOiHkjIw7+22F9zCTGEh3SQYtIGO8N0YWc
	ygeILHZyESXBWeH152w9uk0ojXwXgPOQhrLdJDT+/XFivVw50Rks3Ur0qwXMSTGyCwUG
	rZnjv0QnCw08A80va+9PGBUg9bsKX45+Ovgb3oWg6Qxrb8Id90s6JezpI8NOHAk2NDcS
	0rgg==
X-Gm-Message-State: AKGB3mLlIT1UQZj6lTXQ2xlIGRh45DNg58jJiVoYaWeBe6qN9559upNB
	x9WxhAuqpUY8R1fwPLJKrqzkUuMT9Ye072VQQZM=
X-Received: by 10.223.163.133 with SMTP id l5mr11711361wrb.83.1513383253384;
	Fri, 15 Dec 2017 16:14:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 15 Dec 2017 16:13:42 -0800 (PST)
In-Reply-To: <20171213232025.24503-1-f4bug@amsat.org>
References: <20171213232025.24503-1-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 15 Dec 2017 16:13:42 -0800
X-Google-Sender-Auth: rEq7HgyyinT5Wl73sqUllHQYBMI
Message-ID: <CAKmqyKNR4ECfJL7ymgyBdVSJKPcxFVJ2=svAE0aUQCW5=qHvSg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/26] SDCard housekeeping
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Fam Zheng <famz@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
	Isaac Lozano <109lozanoi@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Andrey Yurovsky <yurovsky@gmail.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SANhqv5FJ/LK

On Wed, Dec 13, 2017 at 3:19 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Now that we have a way to write qtest in Python, lets start with a simple=
 test
> to perform basic card identification, covering many functions of the sd/s=
d.c
> file.
>
> [patch 1]
> When a device is not MMIO-connected but rather plugged into a Bus, it is =
easier
> to write tests using QMP.
> So we add a 'sdbus-command' entry to directly operate on a SD Bus.
> (Note this method should also work with all other QBus).
>
> [patch 2]
> We write a simple pyqtest, which
>   - resolve the SDBus QOM path in the test setup()
>   - verify default values for SD Spec v2.
>
> Since have a test, lets run after each patch, so we are sure we don't bre=
ak things.
>
> [patch 4-14,20-23]
> Add a bunch of trace events
> [patch 3,11,15-18]
> Aesthetic changes mostly
> [other patches]
> Trivial changes
>
> Once this series applied, booting some Linux on a vexpress-a9 with few
> sd*command traces enabled result in this outputs (which result useful to
> understand/fix the different SD implementations):
>
> 48.687227:sdcard_normal_command         IO_RW_DIRECT/ CMD52 arg 0x00000c0=
0 (state idle)
> 48.687233:sdcard_command_response (no response) (state idle)
> 48.689237:sdcard_normal_command         IO_RW_DIRECT/ CMD52 arg 0x80000c0=
8 (state idle)
> 48.689244:sdcard_command_response (no response) (state idle)
> 48.690877:sdcard_normal_command        GO_IDLE_STATE/ CMD00 arg 0x0000000=
0 (state idle)
> 48.690890:sdcard_command_response (no response) (state idle)
> 48.723486:sdcard_normal_command         SEND_IF_COND/ CMD08 arg 0x000001a=
a (state idle)
> 48.723507:sdcard_command_response 00 00 01 aa  (state idle)
> 48.723886:sdcard_normal_command      IO_SEND_OP_COND/ CMD05 arg 0x0000000=
0 (state idle)
> 48.723892:sdcard_command_response (no response) (state idle)
> 48.724019:sdcard_normal_command      IO_SEND_OP_COND/ CMD05 arg 0x0000000=
0 (state idle)
> 48.724023:sdcard_command_response (no response) (state idle)
> 48.724110:sdcard_normal_command      IO_SEND_OP_COND/ CMD05 arg 0x0000000=
0 (state idle)
> 48.724115:sdcard_command_response (no response) (state idle)
> 48.724178:sdcard_normal_command      IO_SEND_OP_COND/ CMD05 arg 0x0000000=
0 (state idle)
> 48.724181:sdcard_command_response (no response) (state idle)
> 48.724999:sdcard_command_response 00 40 01 20  (state idle)
> 48.725214:sdcard_app_command         SD_SEND_OP_COND/ACMD41 arg 0x0000000=
0 (state idle)
> 48.725225:sdcard_command_response 40 ff ff 00  (state idle)
> 48.727113:sdcard_normal_command        GO_IDLE_STATE/ CMD00 arg 0x0000000=
0 (state idle)
> 48.727125:sdcard_command_response (no response) (state idle)
> 48.729206:sdcard_normal_command         SEND_IF_COND/ CMD08 arg 0x000001a=
a (state idle)
> 48.729213:sdcard_command_response 00 00 01 aa  (state idle)
> 48.729339:sdcard_command_response 00 00 01 20  (state idle)
> 48.729412:sdcard_app_command         SD_SEND_OP_COND/ACMD41 arg 0x4030000=
0 (state idle)
> 48.729419:sdcard_command_response c0 ff ff 00  (state ready)
> 48.729786:sdcard_normal_command         ALL_SEND_CID/ CMD02 arg 0x0000000=
0 (state ready)
> 48.729797:sdcard_command_response aa 58 59 51 45 4d 55 21 01 de ad be ef =
00 62 19  (state identification)
> 48.730825:sdcard_normal_command   SEND_RELATIVE_ADDR/ CMD03 arg 0x0000000=
0 (state identification)
> 48.730835:sdcard_command_response 45 67 05 00  (state standby)
> 48.731221:sdcard_normal_command             SEND_CSD/ CMD09 arg 0x4567000=
0 (state standby)
> 48.731228:sdcard_command_response 40 0e 00 32 5b 59 00 00 0d 47 7f 80 0a =
40 00 00  (state standby)
> 48.732012:sdcard_normal_command SELECT/DESELECT_CARD/ CMD07 arg 0x4567000=
0 (state standby)
> 48.732021:sdcard_command_response 00 00 07 00  (state transfer)
> 48.732419:sdcard_command_response 00 00 09 20  (state transfer)
> 48.764983:sdcard_app_command                SEND_SCR/ACMD51 arg 0x0000000=
0 (state transfer)
> 48.765000:sdcard_command_response 00 00 09 20  (state sendingdata)
> 48.766951:sdcard_command_response 00 00 09 20  (state transfer)
> 48.767159:sdcard_app_command               SD_STATUS/ACMD13 arg 0x0000000=
0 (state transfer)
> 48.767168:sdcard_command_response 00 00 09 20  (state sendingdata)
> 48.966731:sdcard_normal_command  READ_MULTIPLE_BLOCK/ CMD18 arg 0x0000000=
0 (state transfer)
> 48.966763:sdcard_command_response 00 00 09 00  (state sendingdata)
> 48.974869:sdcard_normal_command    STOP_TRANSMISSION/ CMD12 arg 0x0000000=
0 (state sendingdata)
> 48.974877:sdcard_command_response 00 00 0b 00  (state transfer)
> 50.044308:sdcard_normal_command          SEND_STATUS/ CMD13 arg 0x4567000=
0 (state transfer)
> 50.044330:sdcard_command_response 00 00 09 00  (state transfer)
> [...]
>
> Regards,
>
> Phil.
>
> Based-on: 20171213213557.26561-7-f4bug@amsat.org
>           (QTests: use Python to run complex tests)

As this series can't be merged until the Python for Qtest series is
merged I'm not going to go over this now. Let's wait and see how that
discussion goes first.

Alistair

>
> Philippe Mathieu-Daud=C3=A9 (26):
>   sdbus: add a QMP command to access a SDBus
>   sdcard: add Python qtests
>   sdcard: use ldst API
>   sdcard: replace fprintf() -> qemu_log_mask()
>   sdcard: rename sd_set_mode() -> sd_update_mode()
>   sdcard: add sd_set_mode()
>   sdcard: add sdcard_set_mode() trace event
>   sdcard: add sd_set_state()
>   sdcard: add a sdcard_set_state() trace event
>   sdcard: use more detailled state/mode trace events
>   sdcard: use warn_report() instead of fprintf()
>   sdcard: replace DPRINTF() by trace events
>   sdcard: add more trace events
>   sdcard: use qemu_hexbuf_strdup() to trace command response
>   sdcard: use PW_LEN define instead of '16' magic
>   sdcard: let cmd_valid_while_locked() returns a bool
>   sdcard: rename sd_set_REG() functions called by sd_reset() as sd_reset_=
REG()
>   sdcard: move Memory Card registers together
>   sdcard: add DSR register
>   sdcard: add/use SD_CMD_MAX to check valid SD commands
>   sdcard: add sd_cmd_abbreviation() to resolve the SD command id
>   sdcard: reduce sd_cmd traces
>   sdcard: add ACMD trace events
>   sdcard: use a 16-bit type for the 16-bit RCA register
>   sdcard: add/use a SDCardCommandClass enum instead of magic numbers
>   sdcard: add/use a ccc_spi enum for the commands supported in SPI mode
>
>  qapi-schema.json       |  41 ++++
>  hw/sd/core.c           |  43 ++++
>  hw/sd/sd.c             | 519 +++++++++++++++++++++++++++++++------------=
------
>  stubs/qmp_sdbus.c      |  11 ++
>  hw/sd/trace-events     |  17 ++
>  stubs/Makefile.objs    |   1 +
>  tests/Makefile.include |   2 +
>  tests/sdcard_tests.py  | 172 ++++++++++++++++
>  8 files changed, 617 insertions(+), 189 deletions(-)
>  create mode 100644 stubs/qmp_sdbus.c
>  create mode 100755 tests/sdcard_tests.py
>
> --
> 2.15.1
>
>
