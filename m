Received: by 10.182.158.201 with SMTP id ww9csp2446055obb;
        Sun, 20 Dec 2015 16:15:17 -0800 (PST)
X-Received: by 10.55.76.18 with SMTP id z18mr20768616qka.105.1450656917593;
        Sun, 20 Dec 2015 16:15:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s128si27175590qhs.65.2015.12.20.16.15.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Dec 2015 16:15:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42484 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAo8D-0004bq-5H
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 19:15:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39671)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAo8B-0004Yq-9r
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 19:15:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aAo8A-0000u2-7L
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 19:15:15 -0500
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:38439)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aAo85-0000p6-O2; Sun, 20 Dec 2015 19:15:09 -0500
Received: by mail-wm0-x234.google.com with SMTP id l126so49228647wml.1;
	Sun, 20 Dec 2015 16:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=to6wg6+hb7H9LlpiqhwxFG7K14rNcb/c7LibF31172c=;
	b=yQiYKyOVsu02zzILrIAAx5YKr9+Lk4A4+B0Ux/meG1JKPm16EBWuh+CIWyyh97aZMs
	/5cMi8uRomHMIC846dv3G3scJv+eD/bSJ4dGAb7XhQvptn4qCCHdamKmCp32VKP/BMbf
	zkA8zf6EVDBlecoZ3e6jrxJVMtsu/A05i5seVQq4Z5Vi+ytHI4EORWjdfFYKbNCtQUfU
	oempyuzVZBWo8kqQTYoBAhzyrdnSRYUGmZAg1FtKkQqDKOYpYCsVJbYjFh1EL1w1PlXi
	ccqziUicsxwOvXwqioRxV61Ne0coajwUaUeYZVF1EmPLXgshuPYHrSY5NIZjSTZE9OhF
	HMiw==
MIME-Version: 1.0
X-Received: by 10.28.150.201 with SMTP id y192mr16113286wmd.15.1450656909188; 
	Sun, 20 Dec 2015 16:15:09 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Sun, 20 Dec 2015 16:15:09 -0800 (PST)
In-Reply-To: <CAFEAcA9q_qVVEsP9VKy0F6HRes1FWMtQ_sHVAUbG6F57g4jnNg@mail.gmail.com>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-5-git-send-email-peter.maydell@linaro.org>
	<20151219213830.GE4164@pcrost-box>
	<CAFEAcA8MKt-dJU5p=w_jOLv4+dFXtHaCHps=51=9ZM49wXesjw@mail.gmail.com>
	<CAPokK=pPvPxLu3fkkz7qA9gahG1Sm2cWJYBYeDgw6A1Q2bfjeQ@mail.gmail.com>
	<CAFEAcA9q_qVVEsP9VKy0F6HRes1FWMtQ_sHVAUbG6F57g4jnNg@mail.gmail.com>
Date: Sun, 20 Dec 2015 16:15:09 -0800
Message-ID: <CAPokK=oCWNTZsDscNqdGVOzOwr5hLEhYjTgaVYNUHT-Mu=gWOA@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::234
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
X-TUID: LvGnwoIYlf1X

On Sun, Dec 20, 2015 at 3:18 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 20 December 2015 at 20:51, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> On Sun, Dec 20, 2015 at 9:10 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> On 19 December 2015 at 21:38, Peter Crosthwaite
>>> <crosthwaitepeter@gmail.com> wrote:
>>>> On Fri, Dec 11, 2015 at 04:37:05PM +0000, Peter Maydell wrote:
>>>>> +bool sdbus_get_inserted(SDBus *sdbus)
>>>>> +{
>>>>> +    SDState *card = get_card(sdbus);
>>>>> +
>>>>> +    if (card) {
>>>>> +        SDClass *sc = SD_GET_CLASS(card);
>>>>> +
>>>>> +        return sc->get_inserted(card);
>>>>> +    }
>>>>> +
>>>>> +    return false;
>>>>> +}
>>>>
>>>> This I am not sure about. Realistically, the card has no self
>>>> awareness of its ejection state so it can't be polled for "are
>>>> you there". The card insertion switch is implemented as a
>>>> physical switch on the slot itself and a property of the bus.
>>>>
>>>> The absence on presence of a device should determine this, making me
>>>> think this should return !!card.
>>>>
>>>> Unfortunately, we have the case of the block UI being able to trigger a
>>>> card ejection from underneath the bus level. But since the SD card is already
>>>> using qdev_get_parent_bus() the removal from the bus can be managed at the
>>>> card level.
>>>
>>> For user-level back compat I think we need to retain "might have
>>> an sdcard object with no block backend, and that means
>>> 'no-card-present'". This is both for the user facing
>>> monitor commands to manipulate the sd card, and also
>>
>> What are the user-facing monitor commands? I tried using "change" and
>> "eject", but they don't seem to work for SD, due to the tray being
>> closed. Has this ever worked in a way that is user manipulatable for
>> SD or is it just to handle the case of unconditional SD card creation
>> (with the card never hotplugging over the system lifetime)?
>
> I admit to just assuming that this stuff worked rather than
> testing it :-)
>

Can we capitilise on the opportunity here to break the backwards
compat for the non-functional feature and defeature eject and change
for SD? File substitution for SD cards doesn't match the real world
nicely, as we use the file size to modify the SD card implementation
(SDSC vs SDHC as well as the # of blocks). It really should be a
destroy+recreate rather than a substitution.We can then deal with SD
card ejection and insertion as proper hotplug.

Regards,
Peter

> thanks
> -- PMM
