Received: by 10.223.150.237 with SMTP id u100csp2532639wrb;
        Mon, 6 Nov 2017 03:14:34 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SCngbuWpoph5/4ns6/IICWBLs+mieId4OJSGxrJy8l7m15542llShHowGvYpt/LAqLA9eH
X-Received: by 10.37.123.7 with SMTP id w7mr3410749ybc.18.1509966874269;
        Mon, 06 Nov 2017 03:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509966874; cv=none;
        d=google.com; s=arc-20160816;
        b=D0DyEl1Y9cYmHEQFlXm6JCYKHqR5godPllN9PjvTdHD5ZpEBWFd0VPEnKeL8uU1vOF
         yHvI5iJA9kig2VNZkUHAS6CdTBfqPPX7d5uXDCrQ6MBNOA45klQRId2akr9mreu5QwQH
         6piLbHjw3pTchiKtTuJW59WkgJkH7PNr/dt3qa/+1/XTic4bxHKhQyyDderrtbPHtoP0
         VslgpS+tQ2P8BSHpwAm0A29LZMpLKB7Ck2EN0ZvmqIgI3dis8HErcc6ZfdL1bMVgLv+w
         N/gIknknUheO7LprDdUJDLbK8vnJ7dNWFI1m3+cwwSK6CI8ExO6G5bnvf+und3aGIRbI
         BiAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=J5GYBzeGBPLRwJGpubYkZw0ss+jgb7Istnpn524eLzE=;
        b=mMNbBmiOtibO1OrH10+dTUIgXHM+gBntETo7vXADT9ePjW0SjC+ZcRZQ4MZp2hChm9
         wmBxj7LNEvmNXAEGGOWK+fudopFfkr72+5c01b25f+ndZvdk/FgA7IzLX3mH0Q+BBehG
         FmWaKahwd3ejdGeQHE6Rd6SHUhhpEM7jb+99wMQQRi+Sp0/dTVm/9koquqNEYGwKFqoy
         csJqb6nAD/Vh9jlthOWtMO3Iooz3NM/+IOqX6wwu028p0BJCmM5TPO5d+or0/MqMJQh2
         ISKjYKNKb1rbZpCL7Cc8p1N4Y3OgJ4fpknDZyXSA5Hppi7q5IuYVHf2FYv/SJR7nacqw
         mdOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ah6NwFU2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t18si2665669ywg.332.2017.11.06.03.14.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Nov 2017 03:14:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ah6NwFU2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47491 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eBfMP-0003Bb-Ov
	for alex.bennee@linaro.org; Mon, 06 Nov 2017 06:14:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eBfLV-0002nv-2j
	for qemu-devel@nongnu.org; Mon, 06 Nov 2017 06:13:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eBfLU-00085j-2K
	for qemu-devel@nongnu.org; Mon, 06 Nov 2017 06:13:37 -0500
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b]:56433)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eBfLT-00085A-SP
	for qemu-devel@nongnu.org; Mon, 06 Nov 2017 06:13:36 -0500
Received: by mail-wm0-x22b.google.com with SMTP id z3so13347875wme.5
	for <qemu-devel@nongnu.org>; Mon, 06 Nov 2017 03:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J5GYBzeGBPLRwJGpubYkZw0ss+jgb7Istnpn524eLzE=;
	b=ah6NwFU24eBV0/BjFe6CPj+LSx6hmZIypuDmdVzQRBAgK+NgnAZ5hxj/zaR9suVzrY
	L22dFGMmfelKPEVGkCdehwkNfkyRPzfpLLMzAjOurXi8h+aDTYaJME1b8/5QHjss/NTM
	Syw2XaM4JSOtb+zN6aU2MorLwenL4swwwJdjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J5GYBzeGBPLRwJGpubYkZw0ss+jgb7Istnpn524eLzE=;
	b=HM7aUH2E8sTnQdPetOHLn+wn7RZQc9VTCuz5KK23i4UIlucnEZtJyj2Wb4FVmBsHcX
	4hpuW8ZdUdYGvV5yCTVt76EJfvHZaF75Sj7KDHDQdFzBPfYPKaXSPDZ6wYFBQZrUNwxI
	A+sUtl2EXIiVIWIlebsgRE0+DsD/wO4AGzhqbPjMzNdXulj1pc/V8N8qtR8Xa6b+zqf+
	RJ2OfunV6/5s7us84MJ1eCSvU51T8fPyti+NLM5c+NXHGYdhb5I9s1XwK2evZZqAZnx3
	c8HvIINYbEL3HrNlyWVV2eqLps6cyGtnpwUxC9V773JlHjvPrXFasv5KWyjUocpRfmmE
	NSCA==
X-Gm-Message-State: AJaThX4/kWmpVO5fJaEF0QJ9UHSSJGJl1plrxrJm7CHKeAk0+9GHp10s
	QoVdCqpeUuUo4QVlAiQHPREUOKk2Mp/zdzxpV0oCSA==
X-Received: by 10.28.46.136 with SMTP id u130mr4346911wmu.127.1509966814719;
	Mon, 06 Nov 2017 03:13:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 6 Nov 2017 03:13:14 -0800 (PST)
In-Reply-To: <0686ba45-7a77-f5b0-537d-07e2c3438e5e@redhat.com>
References: <1508772937-21054-1-git-send-email-eric.auger@redhat.com>
	<1508772937-21054-2-git-send-email-eric.auger@redhat.com>
	<CAFEAcA81ogq6py71ejK7JD52A8LrQz1v92M1HZPCfPVBZy1vww@mail.gmail.com>
	<0686ba45-7a77-f5b0-537d-07e2c3438e5e@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Nov 2017 11:13:14 +0000
Message-ID: <CAFEAcA8_yta5s9rsfahqBVBJfqAE_LpU2tmuQz3kcn33OfHsmA@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22b
Subject: Re: [Qemu-devel] [RFC v2 1/4] hw/intc/arm_gicv3_its: Don't abort on
 table save failure
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Wei Huang <wei@redhat.com>, Andrew Jones <drjones@redhat.com>,
	Vijay Kilari <vijay.kilari@gmail.com>, Juan Quintela <quintela@redhat.com>,
	qemu-stable <qemu-stable@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /jgCMfi+Vsyb

On 6 November 2017 at 10:09, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 02/11/2017 13:53, Peter Maydell wrote:
>> On 23 October 2017 at 16:35, Eric Auger <eric.auger@redhat.com> wrote:
>>> The ITS is not fully properly reset at the moment. Caches are
>>> not emptied.
>>>
>>> After a reset, in case we attempt to save the state before
>>> the bound devices have registered their MSIs and after the
>>> 1st level table has been allocated by the ITS driver
>>> (device BASER is valid), the first level entries are still
>>> invalid. If the device cache is not empty (devices registered
>>> before the reset), vgic_its_save_device_tables fails with -EINVAL.
>>> This causes a QEMU abort().
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> Reported-by: wanghaibin <wanghaibin.wang@huawei.com>
>>>
>>> ---
>>>
>>> this patch would deserve being cc'ed stable (2.10)
>>> This goes along with patches 1-5 of
>>> [PATCH v5 00/10] vITS Migration fixes and reset, candidate
>>> for being cc'ed stable
>>> ---
>>
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>>
>> We could/should put this patch into qemu now, right (it's
>> the rest of the series that's RFC) ?
>
> Yes that's correct.

OK. I have applied 1/4 (and none of the rest) to target-arm.next,
with a cc-stable annotation.

thanks
-- PMM
