Received: by 10.28.71.27 with SMTP id u27csp3806732wma;
        Tue, 6 Feb 2018 05:54:02 -0800 (PST)
X-Google-Smtp-Source: AH8x226kOKC9nRCKZAk/LgvWbMs4GLWd7YHN+PjKUK8EraaqOZMxda297TiaUEwkEoeImXksRAAO
X-Received: by 10.13.195.68 with SMTP id f65mr1342528ywd.341.1517925241994;
        Tue, 06 Feb 2018 05:54:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517925241; cv=none;
        d=google.com; s=arc-20160816;
        b=XdiGKBZPLwtWy9Tt+fVlInCS0mtJ7y2SzO1tXiv0tLKnKyrJZuH6hTzmpL7HeCS065
         1Wah/DPqfixlIrobhgj6TXhAsSmoDvgFHMe5C3LQBNEjsTcsVZ5pu++G9Kye8JvAFmmi
         5jCqGHdgcKpAmjoIvFOCjecHQjtEMNwa3N6MKUkNXPO1TqUJfu57J7Vvi/PDYXO5v8IU
         7dKYsp00aFWq56QV6OJJYxWfypssnkbuHk83nR2io5DBvfaXatEQYHtlbzvw/6/19Bgn
         zYqXo4g1XZKBi7nXHZoKHRa4pZe9+t8RM1GFivurQCzR7kjITC8Zh1P/nDgmErVljWkH
         xQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=/rqMpfCLHH2vV6Khevwf78BXY5ZuDAEslyy4mE/EnLE=;
        b=T1PLCKJmhzw5kN7EI2kyYKrjVQe8CiAjd2txh58Zh+nOi+eIwhstAqJgfC57rxiAv3
         kF8O9L61qX0XdvK/Z7l2xEoEnHA+L/ES37mK9xNejMrl+xViteC/xt8yqfMgsfLUu7H2
         A+opUdAu29HoeL6y1yYGHBThDUEr8S1Vt9BSn5io1r4kbs/3SslzjYSqYL0mpiNnycfN
         FQFq6sUv+UngviD1LHeTAvTls7MX5D80XYFMZCuTNLP65UANd/F6NZ6EpXGiCo+XnbRa
         dp6PZxvPMDd6amqKi/gwgJf8BSd/+ZsLD6rTQwr6aiUo+IEloyxnqBpWT1qsnm/k73gA
         SWDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KE7WcyOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si97643ybk.126.2018.02.06.05.54.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 05:54:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KE7WcyOz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ej3hB-000254-EA
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 08:54:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ej3h2-00023h-CM
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 08:53:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ej3gw-0000e1-GB
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 08:53:52 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:42792)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ej3gw-0000df-Ba; Tue, 06 Feb 2018 08:53:46 -0500
Received: by mail-qt0-x243.google.com with SMTP id i8so2329359qtj.9;
	Tue, 06 Feb 2018 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/rqMpfCLHH2vV6Khevwf78BXY5ZuDAEslyy4mE/EnLE=;
	b=KE7WcyOz12GpiSMLxrMehgjoYXVmoiu9sxsjIuaRJLIA40Htt+b2spQeakL3auCMRy
	VZb7mTYmyMB0b3ZPN92im7umr7Uq/kyAJbuE1usCMCN8qrhQ/rRa9QshlthtKwLDsA8i
	jOHjj1JbL0pogRcTTR3ivZq/1Ozi5KkH3LABG87rST+o8VoohwfZ+o+w1p+pstCdoNzc
	ioVfCis3N0im5HeUgJqlYtrT9AKZP2AMHb6ZNDgYXzsfxMYYtJezR4IfgCZz0248BBZK
	vzGZcPebbUYxFQUWHQ6S16IOIk16pB+NGHjsmv8fN1lM4tS0eRDOMODuSVRztE+fSg2G
	BmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=/rqMpfCLHH2vV6Khevwf78BXY5ZuDAEslyy4mE/EnLE=;
	b=JhWVGKylSOoVMbjYLD0wzlYlNLOfu3aVmdYN2sq6l9wcEAcN4kFsa5EiEIaPSwYDBt
	jLR7uC1udklwslZbecBmOZ2/Yw3cHn30U01nZNhKbOG2cAuvhKHpt7Xuhgvmebh6Ic72
	3Uifp/u10Qk5bOyVIDZ/th/pdLJ8VgkckR+yOAb+6D8O4DV+2YwtgaNauZAJMyC2DTbK
	sYPlRyEWuKao5TzzQ26xpWvIbhQ9OiiHgRfljhux9A6dAsLhz9dDPcLyvRE9v9vRqnBO
	SkRsrlfI+XHY42cyS++yjeXKrL79GM2C3Tn9lEwGzavzXrK73UU8cUhq+W9XCqIgncEh
	brYQ==
X-Gm-Message-State: APf1xPDp4/Nn7MjRRhOWQ+UCWAqIkmikcOQsc4nr6edugcSCGg/8D/Cb
	Va/f7iry3na4QsjxTTba0+nOunha
X-Received: by 10.200.13.139 with SMTP id s11mr3613477qti.287.1517925225569;
	Tue, 06 Feb 2018 05:53:45 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	t124sm7415480qke.57.2018.02.06.05.53.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Feb 2018 05:53:45 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180123035837.16578-1-f4bug@amsat.org>
	<20180123035837.16578-5-f4bug@amsat.org>
	<CAKmqyKMoUcPhkr8bM1DU1QeBaRbJ9kAfOp_j-vFxf1y8p=1AbA@mail.gmail.com>
	<5a373a1f-6289-a216-cd02-254402069c12@amsat.org>
	<CAFEAcA8UzFXVyWKHKdOtjtoPjKCJ-dxu_MSZD4_1i3Hoge7eKw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f10dd700-68c9-ec0a-461c-38ad757102c6@amsat.org>
Date: Tue, 6 Feb 2018 10:53:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8UzFXVyWKHKdOtjtoPjKCJ-dxu_MSZD4_1i3Hoge7eKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
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
X-TUID: 9ZjVVZ6k7t+K

Hi Peter,

On 02/06/2018 10:06 AM, Peter Maydell wrote:
> On 6 February 2018 at 12:43, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Hi Alistair,
>>
>> On 01/31/2018 01:41 PM, Alistair Francis wrote:
>>> On Mon, Jan 22, 2018 at 7:58 PM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>> using the sdbus_*() API.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>  hw/sd/pl181.c | 31 ++++++++++++++++++++-----------
>>>>  1 file changed, 20 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/hw/sd/pl181.c b/hw/sd/pl181.c
>>>> index 3ba1f7dd23..ce696c5d7d 100644
>>>> --- a/hw/sd/pl181.c
>>>> +++ b/hw/sd/pl181.c
>>>> @@ -33,6 +33,7 @@ typedef struct PL181State {
>>>>      SysBusDevice parent_obj;
>>>>
>>>>      MemoryRegion iomem;
>>>> +    SDBus sdbus;
>>>>      SDState *card;
>>>
>>> Shouludn't card be removed?
>>
>> Not yet :( It is still used by sd_set_cb() in pl181_reset().
> 
> I think you have to change that sd_set_cb() code now.
> If you look at sd_cardchange() it uses "is this SD card
> object on an SDBus" to determine whether to notify the
> controller via the old-API IRQ lines, or using the
> set_inserted() and set_readonly() callbacks on the SDBusClass.

Oh, this can get simplified, cool!

>> In my first approach [1] I added the SDBus SLAVE/MASTER interfaces and
>> the cards inserted/readonly signals were only accessible by the bus, not
>> the HCI, leaving the SDCard objects only pluggable to SDBus (removing
>> the sdbus_reparent_card() need). But since it was out of scope for the
>> UHS cards goal, I kept it for later.
> 
> How do you manage to get rid of sdbus_reparent_card()? Raspi
> needs it for its weirdo multiplexed SD controller setup, and
> AFAIK we don't have a way to say "this thing is hotpluggable
> but not by the user" yet...

The card is hotpluggable, the bus isn't.

An unique SDBus is created in the bcm2835_peripherals object (model
closer than hardware), sdhci/sdhost/gpio controllers use it via property
links.
What I don't do is checking the gpio selector (sd_fsel), hoping the
guest isn't nasty enough to use both SD controllers at once...

> PS: have you checked that these sd card refactorings don't
> accidentally break the monitor "change" and "eject" commands
> operating on SD cards ? (They are a bit weird because they
> affect which backing file is attached to the SD card object,
> rather than actually deleting and recreating the SD card
> object.)

Nop, but I can now add a qtest for this :)

Regards,

Phil.
