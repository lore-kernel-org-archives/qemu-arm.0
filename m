Received: by 10.182.158.201 with SMTP id ww9csp831277obb;
        Wed, 9 Dec 2015 10:54:52 -0800 (PST)
X-Received: by 10.141.6.9 with SMTP id i9mr518625qhd.68.1449687292138;
        Wed, 09 Dec 2015 10:54:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b43si10216729qga.13.2015.12.09.10.54.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 09 Dec 2015 10:54:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37399 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a6jt5-0003W9-Sc
	for alex.bennee@linaro.org; Wed, 09 Dec 2015 13:54:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a6jt2-0003SA-I7
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 13:54:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a6jsx-0001dX-Pb
	for qemu-arm@nongnu.org; Wed, 09 Dec 2015 13:54:48 -0500
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:36424)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a6jst-0001cu-OW; Wed, 09 Dec 2015 13:54:39 -0500
Received: by wmww144 with SMTP id w144so235461607wmw.1;
	Wed, 09 Dec 2015 10:54:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=ViYD4voYCeYM6KiuG9QWW5ysXgSNg0dujW6guM1mROc=;
	b=QAoIkk0IkQbnKqmpQUEbubh7+BMWyTnF0xANgMIQ07nrWLN//RBMaLeCD762otD5OW
	KO4+OjcegPwoydKgqP3Pi8BkU5vnHC/GIhZSppGv9TAQJ3lYqF3WhpLv4zk+9kZXWrJ4
	BvSYzoR39GmvGPL9Ybw0aLpBBv/zAikQmJKv8d/7r0u/JZLenKXK5afmjayjsOwkCAT+
	gEkAXAsksvhSmAoXLzsIregzim6h25wfMp0CLt/m+dhDLuKRz0TrdgO4YyKY7b/M8uuY
	ZJ4WnHMcgjesLLoWzbyQpCMtKtYKuQcYpJuQghpwmdRTtVtvmYk+e0fNeEElE3yUDDNj
	m3Xg==
MIME-Version: 1.0
X-Received: by 10.194.204.166 with SMTP id kz6mr7825135wjc.174.1449687278680; 
	Wed, 09 Dec 2015 10:54:38 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Wed, 9 Dec 2015 10:54:38 -0800 (PST)
In-Reply-To: <BLUPR0301MB203408E90349BF451ED484B79EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-4-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=oskY5fBigEnpBkm-uKWaRW1+KYsmZLQ9HRrmnMPGYp6Q@mail.gmail.com>
	<BLUPR0301MB2034314DC44EA275D6FC79FA9EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=poJ66bAJDx18WAtvuMCi-_fA=zBUAZAmzxP9Ke3BAzAw@mail.gmail.com>
	<BLUPR0301MB203408E90349BF451ED484B79EE80@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Wed, 9 Dec 2015 10:54:38 -0800
Message-ID: <CAPokK=od-urxW-0nkwoxhaip_EqDMnu93v5KF5G58tcrX6G0Xw@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Peter Maydell <peter.maydell@linaro.org>, 
	Kevin OConnor <kevin@koconnor.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22b
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Stefan Weil <sw@weilnetz.de>,
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
X-TUID: Z7LsF808nEbZ

On Wed, Dec 9, 2015 at 10:17 AM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> Sent: Tuesday, 8 December 2015 23:40
>> On Tue, Dec 8, 2015 at 10:19 PM, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> wrote:
>> >> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> >> Sent: Saturday, 5 December 2015 21:26
>> >> Is this IP just SDHCI? We already model SDHCI in QEMU, see
>> >> hw/sd/sdhci.c. If there are RPi specific features to the SDHCI
>> >> implementation they should be added as optional extensions (probababl=
y
>> >> via subclassing) to the existing SDHCI model.
>> >
>> > So yes, it turns out this is fairly similar to SDHCI (-> lots of waste=
d work by
>> Gregory and me, sigh), and indeed Linux boots with the existing sdhci
>> emulation. However, there are some quirks, and UEFI/Windows depend on
>> them. Namely:
>> >  * The host control registers (offset 0x28 and above) seem to differ
>> significantly. Maybe this is due to the SDHC version -- according to the
>> BCM2835 peripherals spec, the controller implements "Version 3.0 Draft 1=
.0"
>> of the SDHC spec, but of course I can't find that spec online anywhere. =
Luckily
>> nothing seems to depend on this, besides a few spurious warnings about
>> invalid writes.
>>
>> Looks reasonably consistent from a quick scan? 0x28 in shdci.c is only
>> doing the ADMA stuff while there are other fields on the BCM model.
>
> You're right, upon closer examination, it's not as bad as I thought (just=
 reserved / unimplemented bits). The one significant difference that seems =
likely to cause a problem is the first register (offset 0x0-0x3) which is A=
RG2 on Pi (used for auto CMD 23 support) but the SDMA system address on SDH=
CI (Pi doesn't support DMA in the controller). This will break if a guest w=
ants to use auto cmd 23 -- I've yet to see one that does, but Gregory's mod=
el implements it, so perhaps he did.
>
>> >  * Power is assumed to be always on -- the sdhci model requires the gu=
est
>> to turn it on by a write at offset 0x29 before issuing any commands, but=
 on pi
>> this bit is marked reserved, and commands are issued immediately after
>> reset.
>>
>> Does this help?:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2015-11/msg06271.html
>
> Yes, that's the same change I made. Is it going to be applied?
>

It missed the boat for 2.5, but you could help by putting a tested-by
or reviewed-by to the patch.

>> >  * The card inserted interrupt is rather broken on pi: it is set at th=
e start of
>> day, but a reset command clears it and it stays clear thereafter (and ne=
ver
>> generates interrupts).
>> >
>>
>> Is that more likely to be an IP connectivity problem (wierd input to
>> the card-detect pin in the SoC)?
>
> That might be it, but in any case I still need to model it somehow.
>

Ideally, this would be managed on the board level but it is kinda hard
the way to code is organised. Currently SDHCI is managing the SD card
instantiation due to a lack of QOMification. So for the moment, this
would be valid as a boolean property which disables the card detect
logic completely. If we get the SD QOMification though, the power,
card detect and sd interface proper can then be more finely managed on
the board level for all these varying connectivity configurations.

>> > There's an inconsistency with response handling, too, although I'm not=
 sure
>> if it's a quirk of the Pi or a general bug in sdhci. Pi UEFI sends a CMD=
23
>> without setting any of the response bits, but this command does in fact
>> generate a 4-byte R1 response. The question is whether this should be
>> treated as an error, or whether it simply means that the host wants to i=
gnore
>> the response. In sdhci, the following code path (around line 246) raises=
 a
>> "command index" error in the case that a non-zero response is returned b=
ut
>> no response bits were set in the command register:
>> >
>> >     } else if (rlen !=3D 0 && (s->errintstsen & SDHC_EISEN_CMDIDX)) {
>> >         s->errintsts |=3D SDHC_EIS_CMDIDX;
>> >         s->norintsts |=3D SDHC_NIS_ERR;
>> >     }
>> >
>> > I do not observe this behaviour on the real Pi2 (and it breaks UEFI). =
The
>> hardware semantics appear to be "if the command generates a response,
>> but you didn't want to see it, we'll successfully complete the command a=
nd
>> ignore the response", whereas the sdhci implementation raises an error f=
or
>> this as well as signalling completion. I have read the "SD Specification=
s Part A2
>> SD Host Controller Simplified Specification Version 2.00", but did not f=
ind
>> anything describing this case, so it could be that this is open to inter=
pretation.
>> (It could also be specified in SDHC v3.) The specific error also seems o=
dd -- my
>> understanding is that a "command index" error means that the index in th=
e
>> response didn't match the index of the issued command, but that's hardly
>> what is happening here.
>> >
>>
>> Starting to sound like a bug.
>
> I think so, yes. It was written this way in the original commit -- I'm ad=
ding the original author (Igor Mitsyanko) to the thread, in case he has any=
 insight.
>
>> > Assuming this latter bug can be fixed generically, how do you propose
>> handling the Pi quirks? I could add a bool property for "bcm2835-quirks"=
 or
>> similar and just special-case the relevant code (my preferred approach).=
 I'm
>> also open to subclassing, but no idea how that would work in practice, s=
o
>> would need some pointers.
>> >
>>
>> I think we need a more definitive list of the register level features
>> that are different or added, I am not seeing what is BCM specific just
>> yet.
>
> The complete diff needed to boot Windows appears below. The first hunk av=
oids re-triggering the insert interrupt on card reset,

Is this a runtime reset or an initial reset that is causing you grief?
You patch is also patching the controller reset so is it more a case
of the interrupt trigger on controller reset that is causing you
issues?

Regards,
Peter

>the second fixes the bug described above, and the last hunk is equivalent =
to your patch linked above. I propose that we make the first conditional un=
der a suitably-named bool property to enable the quirk, and apply the secon=
d two fixes directly.
>
> Thoughts?
>
> Andrew
>
> diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
> index d70d1a6..877dd51 100644
> --- a/hw/sd/sdhci.c
> +++ b/hw/sd/sdhci.c
> @@ -193,7 +193,7 @@ static void sdhci_reset(SDHCIState *s)
>       * initialization */
>      memset(&s->sdmasysad, 0, (uintptr_t)&s->capareg - (uintptr_t)&s->sdm=
asysad);
>
> -    sd_set_cb(s->card, s->ro_cb, s->eject_cb);
> +    //sd_set_cb(s->card, s->ro_cb, s->eject_cb);
>      s->data_count =3D 0;
>      s->stopped_state =3D sdhc_not_stopped;
>  }
> @@ -243,9 +243,11 @@ static void sdhci_send_command(SDHCIState *s)
>              (s->cmdreg & SDHC_CMD_RESPONSE) =3D=3D SDHC_CMD_RSP_WITH_BUS=
Y) {
>              s->norintsts |=3D SDHC_NIS_TRSCMP;
>          }
> +#if 0
>      } else if (rlen !=3D 0 && (s->errintstsen & SDHC_EISEN_CMDIDX)) {
>          s->errintsts |=3D SDHC_EIS_CMDIDX;
>          s->norintsts |=3D SDHC_NIS_ERR;
> +#endif
>      }
>
>      if (s->norintstsen & SDHC_NISEN_CMDCMP) {
> @@ -831,7 +833,7 @@ static void sdhci_data_transfer(void *opaque)
>
>  static bool sdhci_can_issue_command(SDHCIState *s)
>  {
> -    if (!SDHC_CLOCK_IS_ON(s->clkcon) || !(s->pwrcon & SDHC_POWER_ON) ||
> +    if (!SDHC_CLOCK_IS_ON(s->clkcon) || /* !(s->pwrcon & SDHC_POWER_ON) =
|| */
>          (((s->prnsts & SDHC_DATA_INHIBIT) || s->stopped_state) &&
>          ((s->cmdreg & SDHC_CMD_DATA_PRESENT) ||
>          ((s->cmdreg & SDHC_CMD_RESPONSE) =3D=3D SDHC_CMD_RSP_WITH_BUSY &=
&
