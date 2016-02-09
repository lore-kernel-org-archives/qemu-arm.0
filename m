Received: by 10.25.159.19 with SMTP id i19csp1696444lfe;
        Mon, 8 Feb 2016 20:28:17 -0800 (PST)
X-Received: by 10.140.219.208 with SMTP id p199mr41004307qhb.80.1454992097037;
        Mon, 08 Feb 2016 20:28:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 92si22868308qgz.58.2016.02.08.20.28.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 20:28:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51677 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSzuS-0000BX-EY
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 23:28:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>) id 1aSzuP-0000BI-S8
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 23:28:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>) id 1aSzuM-000539-M3
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 23:28:13 -0500
Received: from avon.wwwdotorg.org ([70.85.31.133]:60764)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>) id 1aSzuM-000531-HH
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 23:28:10 -0500
Received: from severn.wwwdotorg.org (unknown [192.168.65.5])
	(using TLSv1 with cipher ADH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by avon.wwwdotorg.org (Postfix) with ESMTPS id CBFDE64A5;
	Mon,  8 Feb 2016 21:28:08 -0700 (MST)
Received: from dart.wwwdotorg.org (localhost [127.0.0.1])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by severn.wwwdotorg.org (Postfix) with ESMTPSA id 45DA8E40CA;
	Mon,  8 Feb 2016 21:28:08 -0700 (MST)
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
References: <1454821757-27964-1-git-send-email-swarren@wwwdotorg.org>
	<BLUPR0301MB20343F80372F1202A8EF2D3A9ED40@BLUPR0301MB2034.namprd03.prod.outlook.com>
From: Stephen Warren <swarren@wwwdotorg.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <56B96AD7.1040002@wwwdotorg.org>
Date: Mon, 8 Feb 2016 21:28:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <BLUPR0301MB20343F80372F1202A8EF2D3A9ED40@BLUPR0301MB2034.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
X-Virus-Scanned: clamav-milter 0.98.6 at avon.wwwdotorg.org
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 70.85.31.133
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] bcm2835_property: implement "get board
	revision" query
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
X-TUID: J+JuZL629zEu

On 02/07/2016 03:37 PM, Andrew Baumann wrote:
> Hi Stephen,
>=20
> Thanks for the patch!
>=20
>> From: Stephen Warren [mailto:swarren@wwwdotorg.org]
>> Sent: Sunday, 7 February 2016 4:09 PM
>>
>> Return a valid value from the BCM2835 property mailbox query "get boar=
d
>> revision". This query is used by U-Boot. Implementing it fixes the fir=
st
>> obvious difference between qemu and real HW.
...
> * Do you know where we can find the appropriate values for Pi1 boards?

Sure. There are two encoding schemes. For most boards, the revision
number is a simple integer that indicates the board type. A list can be
found at:

> https://github.com/AndrewFromMelbourne/raspberry_pi_revision/blob/maste=
r/README.md#prior-to-raspberry-pi-2

(There's also a bit that indicates the Pi has been over-volted in there,
so you need to mask off 0x1000000 or just use the LS byte when
extracting the revision.)

The RPi2 and RPi0 introduce a more complex multi-field encoding scheme
described at:

> https://github.com/AndrewFromMelbourne/raspberry_pi_revision/blob/maste=
r/README.md#raspberry-pi-2--model-zero

You can find how U-Boot interprets the revision fields at:

> https://github.com/swarren/u-boot/blob/rpi_dev/board/raspberrypi/rpi/rp=
i.c#L335

Also see the various xx_models[] arrays, and some more links at:

> https://github.com/swarren/u-boot/blob/rpi_dev/board/raspberrypi/rpi/rp=
i.c#L77

