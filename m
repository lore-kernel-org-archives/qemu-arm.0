Received: by 10.182.158.201 with SMTP id ww9csp2427051obb;
        Sun, 20 Dec 2015 15:18:44 -0800 (PST)
X-Received: by 10.140.133.144 with SMTP id 138mr22404015qhf.0.1450653524194;
        Sun, 20 Dec 2015 15:18:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h8si26983897qhd.116.2015.12.20.15.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Dec 2015 15:18:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:42367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAnFT-0003e3-OX
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 18:18:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58248)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAnFR-0003cb-GA
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 18:18:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAnFQ-0006K2-Jn
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 18:18:41 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33591)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAnFQ-0006Jf-FG
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 18:18:40 -0500
Received: by mail-vk0-x22a.google.com with SMTP id a188so93039598vkc.0
	for <qemu-arm@nongnu.org>; Sun, 20 Dec 2015 15:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=luujGeXB4H8zU992f5QbqnKURC8RFYvzXEdnakxKiWg=;
	b=XLB2swS0KIIXTBFgRoBcRgt3SbZgEhH8O2wnGLWTZ7D5o2SjdXmwMeSvGQ8sSdBq9f
	Rpv4+mB+hSNb2BYvdkQuyPyvPcN5nqt+a8fVX+wPBvwA2yDhuJCP3f62t4AT1CW9TElp
	Jj510NG2Y6SMlkmkT73effa9TPB47lQpHpu90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=luujGeXB4H8zU992f5QbqnKURC8RFYvzXEdnakxKiWg=;
	b=QqklGLTkWyUIs7DF1+Q01r4J75m5mD3lT6FBV26V8kUDcZpFMCVxbObIrfjgKaiZUB
	1zsV7+arF1R82TpoGun5cVHZmo/vor3ojdxw7SfPN6WUhAzWayFTKIWOItbbA4c10WFX
	Pe8vaHpgbmGwBtEm9kFsMWPhmKEngs/lxEac/nMV3XjcjnndR+HguPGOyqiH8+TPjUk6
	d4xcKsgy3Cth0RPN7SfSwxDMBn+CTYd4osWMO2dRHa47MbYr56lMxw5RTwuwv3jHi+sU
	x7cYgsRiesC2FQDL0UXjLQvgvdod1CW/SpBPoGZzSfHKKGN4wNloUehZwH6/+1pO35mD
	5T/w==
X-Gm-Message-State: ALoCoQnnAj0kMBcP8oapIUUZ8C6So5saHKPr3sUjUO34osKLztYgo9Jnehp2VBUC48/paogBiU+dsRTNAFgMY5S63zAS4TpJQHwYj8T5sRTqs1PsUORJOD8=
X-Received: by 10.31.13.205 with SMTP id 196mr10448561vkn.37.1450653519032;
	Sun, 20 Dec 2015 15:18:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Sun, 20 Dec 2015 15:18:19 -0800 (PST)
In-Reply-To: <CAPokK=pPvPxLu3fkkz7qA9gahG1Sm2cWJYBYeDgw6A1Q2bfjeQ@mail.gmail.com>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-5-git-send-email-peter.maydell@linaro.org>
	<20151219213830.GE4164@pcrost-box>
	<CAFEAcA8MKt-dJU5p=w_jOLv4+dFXtHaCHps=51=9ZM49wXesjw@mail.gmail.com>
	<CAPokK=pPvPxLu3fkkz7qA9gahG1Sm2cWJYBYeDgw6A1Q2bfjeQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Dec 2015 23:18:19 +0000
Message-ID: <CAFEAcA9q_qVVEsP9VKy0F6HRes1FWMtQ_sHVAUbG6F57g4jnNg@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Kevin O'Connor <kevin@koconnor.net>, Qemu-block <qemu-block@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Patch Tracking <patches@linaro.org>,
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
X-TUID: OYlf1X4Cq0yY

On 20 December 2015 at 20:51, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Sun, Dec 20, 2015 at 9:10 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> On 19 December 2015 at 21:38, Peter Crosthwaite
>> <crosthwaitepeter@gmail.com> wrote:
>>> On Fri, Dec 11, 2015 at 04:37:05PM +0000, Peter Maydell wrote:
>>>> +bool sdbus_get_inserted(SDBus *sdbus)
>>>> +{
>>>> +    SDState *card = get_card(sdbus);
>>>> +
>>>> +    if (card) {
>>>> +        SDClass *sc = SD_GET_CLASS(card);
>>>> +
>>>> +        return sc->get_inserted(card);
>>>> +    }
>>>> +
>>>> +    return false;
>>>> +}
>>>
>>> This I am not sure about. Realistically, the card has no self
>>> awareness of its ejection state so it can't be polled for "are
>>> you there". The card insertion switch is implemented as a
>>> physical switch on the slot itself and a property of the bus.
>>>
>>> The absence on presence of a device should determine this, making me
>>> think this should return !!card.
>>>
>>> Unfortunately, we have the case of the block UI being able to trigger a
>>> card ejection from underneath the bus level. But since the SD card is already
>>> using qdev_get_parent_bus() the removal from the bus can be managed at the
>>> card level.
>>
>> For user-level back compat I think we need to retain "might have
>> an sdcard object with no block backend, and that means
>> 'no-card-present'". This is both for the user facing
>> monitor commands to manipulate the sd card, and also
>
> What are the user-facing monitor commands? I tried using "change" and
> "eject", but they don't seem to work for SD, due to the tray being
> closed. Has this ever worked in a way that is user manipulatable for
> SD or is it just to handle the case of unconditional SD card creation
> (with the card never hotplugging over the system lifetime)?

I admit to just assuming that this stuff worked rather than
testing it :-)

thanks
-- PMM
