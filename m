Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3657941wrq;
        Mon, 25 Jun 2018 03:55:39 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ/QL5lPyOKxdkZeAXjePd/bA0k4SSxXLkruzksU86p5k7knm5/Kh9Ggfqk958LT9Kxl/9Z
X-Received: by 2002:ac8:4514:: with SMTP id q20-v6mr4769965qtn.28.1529924139488;
        Mon, 25 Jun 2018 03:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529924139; cv=none;
        d=google.com; s=arc-20160816;
        b=JEo6muJUUR8GAb7EnxjlHXIcY7BkfNMX2royyvKeWfbIEQLGfaZd2MZoc0rDrIBmQM
         L6S7Dsl1Z15otghE/Ohzp/uHX4Nr9xcBGeOLyhm1NIoYodHvH8VOdKs3GP52Qjv9Lbx6
         sbeEy0+TSlRZXIBdbgHetFhsdmJgJKnYlXkcMzqL7M0RgCkHYGAgzvH7W3Hvra38V9eI
         2h702uD+07FdYQvEpfChIU+B1+OBkOZz+VhVGVzzbDXdBDC7i9A5UuGKxvRT/xaiiztf
         O+AgP7W1M9HVVVA8C5rDR7Sib8irSIDamv43Xey/5dRfHsDbmoXsE3S7s5j0vA6Z0rgq
         ciXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=E/94Ux+QhYVz1qXnIkQ63Ld/B0lz37U0lY+3O+r2nfc=;
        b=N4nik1C67/VlrUhznO/DB/ttFFSOMlC5ELAB7tOVcGGZHAyClnd8mmyI9EjCYiTU1/
         /l0Ryia/vqIqSiscDY4Z7FlwUpnf7Pc0//UhkE+K9dS4Ba6fJG1F97MD2P39OhnhVJ5B
         L38/yb7vuaBgLYmBWt50pBncFa8Gtr2LNgSFD/EpD9uoLg5o39tN7cbrm9c/H5m2xiFh
         yUZbMD8LRq8cyELkjAWs5iylJ7ORDtoIdL3JG/DTZ0jTqDyalEv4eZTYj4u+yEY8zIqy
         6xavMx9WUnK8CVPJj9b5ANqGcuYZ6jGVEITeBAHL5oiLzyx6sFziR0cVWYszuo++emxx
         UH1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QXcZz6Y2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c40-v6si814612qtb.208.2018.06.25.03.55.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 03:55:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QXcZz6Y2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45420 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXP9n-00036K-1I
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 06:55:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXP9b-00035S-Pf
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 06:55:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fXP9a-0007GG-OV
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 06:55:27 -0400
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:42094)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fXP9a-0007Fq-Hp
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 06:55:26 -0400
Received: by mail-ot0-x242.google.com with SMTP id 92-v6so14539606otw.9
	for <qemu-arm@nongnu.org>; Mon, 25 Jun 2018 03:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=E/94Ux+QhYVz1qXnIkQ63Ld/B0lz37U0lY+3O+r2nfc=;
	b=QXcZz6Y2IQslCPcIZhL3QaVXTJiItDh5jXl28YgZOrtr+FFE0ZABz9jnhU7LkeX5gz
	FJIyEPdgscQ3J2GFVdfuzmI0vomI8cyxTOgeOQiTS0SbHH6FUvSUJJJDXzbthws14FSd
	do6mxWijDDTBuJmPOJfLs7ek7/f3qE7ILiB1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=E/94Ux+QhYVz1qXnIkQ63Ld/B0lz37U0lY+3O+r2nfc=;
	b=sUxHEDnABpr2fB52AGFeVbPUu++kYPdAPaDmEccLbxn8pRs1ztZpuxbhajKZz8KQ0K
	pwkK291erEEmQL+XNk0qCke6AT5lopDWL4yWoTwsRhsCf74ynBGe7f4hOAR5PqI+mF+u
	t07EmysDtGbzX480OtmNwJ2WVMBZNln+I9po0wvV7m1KtTyOQsjTxg4eS8uvUznvCML/
	gJHgY9La1NN/gZtkPC3QuX53n6LmT/e9OrPWLRI6Ozqg7bw7fJKb4KqJIQLgOpdRD+UE
	QwQ7u+5/15pzdPYlZy9zAFoEwQ0wAlltfs4tQ23SbJZmu4yAQv2WPuZRiV7rF/ek0BSV
	9NWQ==
X-Gm-Message-State: APt69E16GyAjdROzFoTjw6DzsqSVBSvb0D1bPQvV5RgwnLTHV3uJLEXh
	kD0TIOgMdef98ZdpdMYhJVXyIAWVsR1n1pVwu2wKbQ==
X-Received: by 2002:a9d:2909:: with SMTP id
	d9-v6mr6621387otb.258.1529924125669; 
	Mon, 25 Jun 2018 03:55:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 03:55:05
	-0700 (PDT)
In-Reply-To: <c7077a71-6f01-b3f2-cc0b-4d845b967ef3@amsat.org>
References: <20180606144706.29732-1-f4bug@amsat.org>
	<1160f838-5625-b9bf-6c34-3071ed185074@redhat.com>
	<0c5018d5-7e87-bba1-7522-c8020277bde0@amsat.org>
	<c7077a71-6f01-b3f2-cc0b-4d845b967ef3@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jun 2018 11:55:05 +0100
Message-ID: <CAFEAcA8TP5hzgFVP7z-y81vxYDdPhg1csLLrqKH4+xqy+eV5CQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-arm] [PATCH] MAINTAINERS: Adopt the Gumstix
 computers-on-module machines
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VwO0fmljFWxC

On 22 June 2018 at 14:30, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> Hi Peter,
>
> On 06/06/2018 12:02 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 06/06/2018 11:53 AM, Thomas Huth wrote:
>>> On 06.06.2018 16:47, Philippe Mathieu-Daud=C3=A9 wrote:
>>>> These COMs are hard to find, and the companie dropped the support
>>
>> "company" :/
>>
>>>> few years ago.
>>>>
>>>> Per the "Gumstix Product Changes, Known Issues, and EOL" pdf:
>>>>
>>>> - Phasing out: PXA270-based Verdex product line
>>>>   September 2012
>>>>
>>>> - Phasing out: PXA255-based Basix & Connex
>>>>   September 2009
>>>>
>>>> However there are still booting SD card image availables, very
>>>> convenient to stress test the QEMU SD card implementation.
>>>> Therefore I volunteer to keep an eye on this file, while it
>>>> is useful for testing.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>> ---
>>>>  MAINTAINERS | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 41cd3736a9..1825deb762 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -491,9 +491,10 @@ F: include/hw/arm/digic.h
>>>>  F: hw/*/digic*
>>>>
>>>>  Gumstix
>>>> +M: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>>>  L: qemu-devel@nongnu.org
>>>>  L: qemu-arm@nongnu.org
>>>> -S: Orphan
>>>> +S: Odd Fixes
>>>>  F: hw/arm/gumstix.c

> Do you agree with this patch? This is mostly to avoid removing these 2
> boards in 2 releases from now. The datasheets are public so I can keep
> an eye on them.
> I already removed them from the "Future deprecated candidates" entry in
> the Wiki.

As Thomas says, whether anybody's listed in MAINTAINERS is
orthogonal to whether we choose to deprecate and remove boards.
If you want to look after these, that's cool.

I've applied this patch to target-arm.next.

thanks
-- PMM
