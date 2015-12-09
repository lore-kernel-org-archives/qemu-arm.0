Received: by 10.182.158.201 with SMTP id ww9csp471717obb;
        Tue, 8 Dec 2015 23:40:27 -0800 (PST)
X-Received: by 10.140.194.136 with SMTP id p130mr11037675qha.76.1449646827398;
        Tue, 08 Dec 2015 23:40:27 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o7si7760877qho.30.2015.12.08.23.40.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Dec 2015 23:40:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34982 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6ZMQ-00079S-Ra
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 02:40:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a6ZMO-00077m-Qa
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 02:40:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a6ZMN-0006Pp-Nt
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 02:40:24 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:36614)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a6ZML-0006PB-1C; Wed, 09 Dec 2015 02:40:21 -0500
Received: by wmww144 with SMTP id w144so209919898wmw.1;
	Tue, 08 Dec 2015 23:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=g64QJKpTFk2ITXRt4Cv8FbuUtUhEbAhmmEibRw4lbac=;
	b=bRTO4iTwRtIbxQD6PCA121638Ae+pKGI6pDfyvrk/7I9KSGewj3lVWhjZQ/O31KNFl
	S89ZSW8u1QXJINdcdVDP87BbQkHxp45fGK4uMtypmfdWoW+DADW/7e4XeQVNxWpVBgf3
	Tlf0u00J9VfyvHdkZdsJjWNPUAxk450IoRmGIE9Jh8ssRo22Z6YN28Q1J8pKTUmRmLlv
	HZKOc4tfQLETs3kAuO0eIQ17cExEWx9undrY/RjBg4MlVDHt5HdOacF1ltWOeoo0HXh/
	7k5qqfo1YJwOQd66aXUR7Fr2tWRKhuEPhjGkA3ZtEulRcauTCpFlb+HuhhJtm4EHFirp
	9NZg==
MIME-Version: 1.0
X-Received: by 10.28.18.9 with SMTP id 9mr30979169wms.96.1449646820244; Tue,
	08 Dec 2015 23:40:20 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Tue, 8 Dec 2015 23:40:20 -0800 (PST)
In-Reply-To: <BLUPR0301MB2034314DC44EA275D6FC79FA9EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-4-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=oskY5fBigEnpBkm-uKWaRW1+KYsmZLQ9HRrmnMPGYp6Q@mail.gmail.com>
	<BLUPR0301MB2034314DC44EA275D6FC79FA9EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Tue, 8 Dec 2015 23:40:20 -0800
Message-ID: <CAPokK=poJ66bAJDx18WAtvuMCi-_fA=zBUAZAmzxP9Ke3BAzAw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 4/8] bcm2835_emmc: add bcm2835 MMC/SD
	controller
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
X-TUID: oro2NXtEK9b4

On Tue, Dec 8, 2015 at 10:19 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> Sent: Saturday, 5 December 2015 21:26
>> Is this IP just SDHCI? We already model SDHCI in QEMU, see
>> hw/sd/sdhci.c. If there are RPi specific features to the SDHCI
>> implementation they should be added as optional extensions (probabably
>> via subclassing) to the existing SDHCI model.
>
> So yes, it turns out this is fairly similar to SDHCI (-> lots of wasted w=
ork by Gregory and me, sigh), and indeed Linux boots with the existing sdhc=
i emulation. However, there are some quirks, and UEFI/Windows depend on the=
m. Namely:
>  * The host control registers (offset 0x28 and above) seem to differ sign=
ificantly. Maybe this is due to the SDHC version -- according to the BCM283=
5 peripherals spec, the controller implements "Version 3.0 Draft 1.0" of th=
e SDHC spec, but of course I can't find that spec online anywhere. Luckily =
nothing seems to depend on this, besides a few spurious warnings about inva=
lid writes.

Looks reasonably consistent from a quick scan? 0x28 in shdci.c is only
doing the ADMA stuff while there are other fields on the BCM model.

>  * Power is assumed to be always on -- the sdhci model requires the guest=
 to turn it on by a write at offset 0x29 before issuing any commands, but o=
n pi this bit is marked reserved, and commands are issued immediately after=
 reset.

Does this help?:

https://lists.gnu.org/archive/html/qemu-devel/2015-11/msg06271.html

>  * The card inserted interrupt is rather broken on pi: it is set at the s=
tart of day, but a reset command clears it and it stays clear thereafter (a=
nd never generates interrupts).
>

Is that more likely to be an IP connectivity problem (wierd input to
the card-detect pin in the SoC)?

> There's an inconsistency with response handling, too, although I'm not su=
re if it's a quirk of the Pi or a general bug in sdhci. Pi UEFI sends a CMD=
23 without setting any of the response bits, but this command does in fact =
generate a 4-byte R1 response. The question is whether this should be treat=
ed as an error, or whether it simply means that the host wants to ignore th=
e response. In sdhci, the following code path (around line 246) raises a "c=
ommand index" error in the case that a non-zero response is returned but no=
 response bits were set in the command register:
>
>     } else if (rlen !=3D 0 && (s->errintstsen & SDHC_EISEN_CMDIDX)) {
>         s->errintsts |=3D SDHC_EIS_CMDIDX;
>         s->norintsts |=3D SDHC_NIS_ERR;
>     }
>
> I do not observe this behaviour on the real Pi2 (and it breaks UEFI). The=
 hardware semantics appear to be "if the command generates a response, but =
you didn't want to see it, we'll successfully complete the command and igno=
re the response", whereas the sdhci implementation raises an error for this=
 as well as signalling completion. I have read the "SD Specifications Part =
A2 SD Host Controller Simplified Specification Version 2.00", but did not f=
ind anything describing this case, so it could be that this is open to inte=
rpretation. (It could also be specified in SDHC v3.) The specific error als=
o seems odd -- my understanding is that a "command index" error means that =
the index in the response didn't match the index of the issued command, but=
 that's hardly what is happening here.
>

Starting to sound like a bug.

> Assuming this latter bug can be fixed generically, how do you propose han=
dling the Pi quirks? I could add a bool property for "bcm2835-quirks" or si=
milar and just special-case the relevant code (my preferred approach). I'm =
also open to subclassing, but no idea how that would work in practice, so w=
ould need some pointers.
>

I think we need a more definitive list of the register level features
that are different or added, I am not seeing what is BCM specific just
yet.

Regards,
Peter

> Thanks,
> Andrew
