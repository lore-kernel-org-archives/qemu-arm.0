Received: by 10.25.44.15 with SMTP id s15csp4328686lfs;
        Mon, 24 Jul 2017 14:25:26 -0700 (PDT)
X-Received: by 10.200.47.193 with SMTP id m1mr23355013qta.331.1500931526469;
        Mon, 24 Jul 2017 14:25:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500931526; cv=none;
        d=google.com; s=arc-20160816;
        b=ilXfQDeQFpIObTnC3YMpoWlkj1bYha7tmlaXVchfjXZldNB/XKH9rQRq3VkZFpcsYn
         2RRJwg/7UiDyxOeVekdutHkn2Mfj8zLHHpeIQkLWPTDqXnE0mBc+ipMt9Hg/lZ9bONDV
         zVh1LuQeF20MVYNe98tw/R8kCxWm3Nyr+Ty9QfYVZNXex11PMm4rsN/LC3+KDda4NiKS
         y1l50ozhtm5IqaAc1cFV4H0Qj9GskBJckhttcuzPFPoxm5tlv2r8LovoT3CNWEcPAbFO
         9H2lHJMR8YhqO+696F3UDL3GX/pM5zUzYw78J/H5JwWjhleLDTVSHhOgZ36VJsA/ah4D
         Veng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=uvEQjfKilbNoG9yv+sSK/ucnGmazD589lmYGHJ5FfIY=;
        b=0m/2ZrYjzUEa05b6KiD6pM+OWfC+7BEpQVtbwZCiqhPi4rKsXlxjUxFHHWX+NaEnt1
         OGofHUDhzOIG2jO6VyzyYhTfHH6yUu1aBll2Y/6g8+2G2HnI8IvtsMGhCgb4ua62WsRt
         DSW0v5T7Q9T1ZIMo7sTv5dDgMJ1h1syPssIWMW+N1lb6ro/H110Vl9jKTC/z/9EdROW+
         KvYz5qVN7fyGv81uJ/zajeVC4aDCWWgH3cNDTWYoRurEFzdeJOZY6oJZOlmjrv34CWov
         prNWWw18e2izya2kso9fF6avXvByoCB5FqR4/X/IZFFJyVslKUFysjHwbMq1yNmbmLQT
         tF1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=kJSfZfFb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 1si9813076qtd.193.2017.07.24.14.25.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 14:25:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=kJSfZfFb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZkqx-0007dY-PJ
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 17:25:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34966)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkqr-0007Zm-Np
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:25:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkqq-00049n-QS
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:25:17 -0400
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:36966)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZkqq-00049X-JG
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:25:16 -0400
Received: by mail-wm0-x22a.google.com with SMTP id c184so41755623wmd.0
	for <qemu-arm@nongnu.org>; Mon, 24 Jul 2017 14:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uvEQjfKilbNoG9yv+sSK/ucnGmazD589lmYGHJ5FfIY=;
	b=kJSfZfFbJDHSbbvx1VQLzNr8bNVtasm/7XoJVH1gpMzCVezp1XG7ABET8vH253/1gT
	MR5HUemG0Qmpdb4NUnPdN45eKYQmzLTaAz5c2p/vyQ0x8lrz+jTfLVyjaU/gS4ALxAV3
	cLrsNx040LlojMVW0OUJsPXGQa/zuWMGtsEuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uvEQjfKilbNoG9yv+sSK/ucnGmazD589lmYGHJ5FfIY=;
	b=UOIgcobMoOU/ibOXV1gTN1Z4rLeHN6aoLPh/ol1zN5VT6HhQlODYPdV79AKBsXXfeM
	eEb5lGKifPfWsckLssD9N9ZubqnHnnFPmKl6nzt+3rMOsiWuZhiDR9iPJmotlLKySizh
	FFPkDmjg1ieRPI81QJgD/+RqhP9eM+mqGROnVHV+Ahv5QUVCZ+9Af66tY6r4m1WJOe7E
	ZjZEp6fZ7Gai53jC+Z2j40PVLKpXMlk/atuHnCV85h808L0uKGo2qmkbxx+UGZoZahIc
	q0uimHo5snJbbTcVKMb4HCVBi/GxkzrhKCagGNhwALMXHZS+n3TqkWlo/vEaJbbhoLeW
	3rhw==
X-Gm-Message-State: AIVw111Hy0whJ9m8qIPfPyMScvvgO3U/jMHozIELCei+G9U5fBQPTVXz
	QOsogW+HRxYXVXfkQYr/FDfL5NewzaGW
X-Received: by 10.28.24.135 with SMTP id 129mr6021710wmy.86.1500931515540;
	Mon, 24 Jul 2017 14:25:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 24 Jul 2017 14:24:55 -0700 (PDT)
In-Reply-To: <08765e63-6712-f965-7ea3-ab356b083c60@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-22-f4bug@amsat.org>
	<CAFEAcA_PRH_BuUOTtC=cvRFT7Gtiwt50T6C3avm+Sy13aDS4tg@mail.gmail.com>
	<08765e63-6712-f965-7ea3-ab356b083c60@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 22:24:55 +0100
Message-ID: <CAFEAcA8eQLvAY9CozjNJ+zz0Lm99q=yEw0ap9MXJmsH-XuC4=g@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-arm] [PATCH for 2.10 21/35] arm/sysbus-fdt: fix null
 pointer dereference
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /OcwvC2PbI4c

On 24 July 2017 at 22:20, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> On 07/24/2017 06:09 PM, Peter Maydell wrote:
>>
>> On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> ...
>
>>> diff --git a/hw/arm/sysbus-fdt.c b/hw/arm/sysbus-fdt.c
>>> index d68e3dcdbd..ad0cc49b19 100644
>>> --- a/hw/arm/sysbus-fdt.c
>>> +++ b/hw/arm/sysbus-fdt.c
>>> @@ -315,15 +315,14 @@ static int add_amd_xgbe_fdt_node(SysBusDevice
>>> *sbdev, void *opaque)
>>>       node_path =3D qemu_fdt_node_path(host_fdt, dt_name, vdev->compat,
>>>                                      &error_fatal);
>>>       if (!node_path || !node_path[0]) {
>>> -        error_setg(&error_fatal, "%s unable to retrieve node path for
>>> %s/%s",
>>> +        error_report("%s unable to retrieve node path for %s/%s",
>>>                      __func__, dt_name, vdev->compat);
>>> -    }
>>> -
>>> -    if (node_path[1]) {
>>> -        error_setg(&error_fatal, "%s more than one node matching
>>> %s/%s!",
>>> +        exit(1);
>>> +    } else if (node_path[1]) {
>>> +        error_report("%s more than one node matching %s/%s!",
>>>                      __func__, dt_name, vdev->compat);
>>> +        exit(1);
>>>       }
>>> -
>>>       g_free(dt_name);
>>
>>
>> This doesn't seem like an improvement. Now the
>> error handling in the function is an inconsistent
>> mix of error_report()+exit() and error_setg(&error_fatal).
>
>
> I got this from "qapi/error.h":
>
> 156 * Please don't error_setg(&error_fatal, ...), use error_report() and
> 157 * exit(), because that's more obvious.
> 158 * Likewise, don't error_setg(&error_abort, ...), use assert().
>
> Is this comment outdated?

Probably not, I expect this code predates it. However
my point about inconsistency still stands.

thanks
-- PMM
