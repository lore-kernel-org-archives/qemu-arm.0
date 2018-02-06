Received: by 10.28.71.27 with SMTP id u27csp3760470wma;
        Tue, 6 Feb 2018 05:06:56 -0800 (PST)
X-Google-Smtp-Source: AH8x2279syOTTvLyTLDVmiDcu2RIAn3NPZYOpynTK/nK3x6uH62jd1NT2rTcmK0vG2BCJTtPqKcE
X-Received: by 10.37.118.205 with SMTP id r196mr1288510ybc.321.1517922416732;
        Tue, 06 Feb 2018 05:06:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517922416; cv=none;
        d=google.com; s=arc-20160816;
        b=YFrej5O4KrDV8E3CoGDGfly+8R6PFM/PpcReQ5q7cCGEvEaCL43vN91teoBRyvNyDt
         jtjdlap5dr+bgltnJDMAZNMn6NG2EMuPuKlGeTplLVwo06wVaCTme77z7Wr2LsgvXBqk
         88i8MNn2TeXjIB6bJKT6OC5ZBl4ekdDB1E/eUvMi+AxOX0D7GrIhrUFXEjzM9bWKXOTx
         PpNWgsYhpk+4kCRwBNznp6N1IviPkxk1QvqXdCb6oeWkSdFBNuDgRTKMLjNUa4o5FD9f
         O3Gq/WuXoCTLZvtnq8gqeYanSMfwRBrX9WB1bKK62/5DcV/Akoe/LTIYmL3Tfpmhuvrn
         qikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=5JXXPKie4vWj9nGtnZvlPmCCTlWSipzjaX5dhcLVSaY=;
        b=wZdrwUh0nYZNnvzbdLYV2zWL0tSmf82DgMkGk8uEz79SD5UpsxKe9SOubXXvfmwaMr
         KadJbyDCU7qhDf1PswCOV+HFD44j3FE4W8/FBegaLcgRx4I6Rm5ACKncG8I6tdZR/+Tv
         DoXJG/Gk2rbVfCIOsIRX7bQTuJzrYrCHwYvut4nl2PaYurp+9rfYJUIouVKhJs+W7hM2
         uoYnl/roSwGZMkl73wFcyijx3M9OkUgNlprDKkJbKehRQnO0y8Pl2HXLzXDNFAMwQ4WL
         o7d3tx7D1/w+WCkax/+PiskKy9JrAaLEr6RknXLM3Gaf/XhSRc4jPvmInJROWvfy8l0Q
         mWLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KTp6TS8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b5si1274396ywc.365.2018.02.06.05.06.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 05:06:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KTp6TS8a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41170 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ej2xc-0003NX-57
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 08:06:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ej2xN-0003Lp-Ad
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 08:06:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ej2xJ-0004rm-D8
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 08:06:41 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:40942)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ej2xJ-0004qr-7K
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 08:06:37 -0500
Received: by mail-ot0-x242.google.com with SMTP id s4so1630278oth.7
	for <qemu-arm@nongnu.org>; Tue, 06 Feb 2018 05:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5JXXPKie4vWj9nGtnZvlPmCCTlWSipzjaX5dhcLVSaY=;
	b=KTp6TS8a/o5mRGvgk4C9cEcNzoKZUEsMzdmu+nS/S9qGf0dlKYY9F3Jk2FeSE4emqF
	ikqBiEY8AH1QuoJaPimdW8Iobhhc2ZAYQaWwapEkvrjcceC4vl6yJhoZ2/KgklJhZ/06
	SszPp+h8IN0iIIbOTBXJ8pVFFQfQDGOkxwISA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5JXXPKie4vWj9nGtnZvlPmCCTlWSipzjaX5dhcLVSaY=;
	b=OeO1CNykjI8zKFH3kTduEdKjexwm8YW9QZxajJO40P3lbZpqIec7FLuzkRl6jkkOU+
	KiQDVs/pR9rZVx89Jq9wrHc/w1SIjurZSzrbOxBaOpgD80v7ujCVFA3Tai7EAHlTwiRs
	XJZG9kpIIj7nqFLlmED6OZiBc60KSn+ijJIfHecLhf2oTMV3DkUMQN3jCmuu08Ona8FG
	HEa+jkBp3hQg1efsd7KO1g3EualHs/WY7NdX8FRw/LuTCqwD+T0+G7udvk5g3bKqStIG
	yRPVb6FdZuZibQxYqPltuCJBycqkGyMxDOQPyIKQ558e7SMf2grUNOQ5G9uNYPDDtema
	dRJQ==
X-Gm-Message-State: APf1xPAlYimdnR4VKf97sRYALlV5xANMECl6ikjf67y/y/5BqpWEbzmG
	INUCDy7uLkI1TQSzn0YY0hoWXtrBAleYGcHlb5z6YJ5f
X-Received: by 10.157.21.26 with SMTP id u26mr1604978otf.110.1517922396483;
	Tue, 06 Feb 2018 05:06:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.34.163 with HTTP; Tue, 6 Feb 2018 05:06:16 -0800 (PST)
In-Reply-To: <5a373a1f-6289-a216-cd02-254402069c12@amsat.org>
References: <20180123035837.16578-1-f4bug@amsat.org>
	<20180123035837.16578-5-f4bug@amsat.org>
	<CAKmqyKMoUcPhkr8bM1DU1QeBaRbJ9kAfOp_j-vFxf1y8p=1AbA@mail.gmail.com>
	<5a373a1f-6289-a216-cd02-254402069c12@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2018 13:06:16 +0000
Message-ID: <CAFEAcA8UzFXVyWKHKdOtjtoPjKCJ-dxu_MSZD4_1i3Hoge7eKw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/6] hw/sd/pl181: expose a
 SDBus and connect the SDCard to it
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
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Michael Walle <michael@walle.cc>,
	"open list:ARM PrimeCell and..." <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hh7UiT1R8u+E

On 6 February 2018 at 12:43, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
> Hi Alistair,
>
> On 01/31/2018 01:41 PM, Alistair Francis wrote:
>> On Mon, Jan 22, 2018 at 7:58 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsa=
t.org> wrote:
>>> using the sdbus_*() API.
>>>
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>> ---
>>>  hw/sd/pl181.c | 31 ++++++++++++++++++++-----------
>>>  1 file changed, 20 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
>>> index 3ba1f7dd23..ce696c5d7d 100644
>>> --- a/hw/sd/pl181.c
>>> +++ b/hw/sd/pl181.c
>>> @@ -33,6 +33,7 @@ typedef struct PL181State {
>>>      SysBusDevice parent_obj;
>>>
>>>      MemoryRegion iomem;
>>> +    SDBus sdbus;
>>>      SDState *card;
>>
>> Shouludn't card be removed?
>
> Not yet :( It is still used by sd_set_cb() in pl181_reset().

I think you have to change that sd_set_cb() code now.
If you look at sd_cardchange() it uses "is this SD card
object on an SDBus" to determine whether to notify the
controller via the old-API IRQ lines, or using the
set_inserted() and set_readonly() callbacks on the SDBusClass.

> In my first approach [1] I added the SDBus SLAVE/MASTER interfaces and
> the cards inserted/readonly signals were only accessible by the bus, not
> the HCI, leaving the SDCard objects only pluggable to SDBus (removing
> the sdbus_reparent_card() need). But since it was out of scope for the
> UHS cards goal, I kept it for later.

How do you manage to get rid of sdbus_reparent_card()? Raspi
needs it for its weirdo multiplexed SD controller setup, and
AFAIK we don't have a way to say "this thing is hotpluggable
but not by the user" yet...

PS: have you checked that these sd card refactorings don't
accidentally break the monitor "change" and "eject" commands
operating on SD cards ? (They are a bit weird because they
affect which backing file is attached to the SD card object,
rather than actually deleting and recreating the SD card
object.)

thanks
-- PMM
