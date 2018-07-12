Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1332780wrq;
        Thu, 12 Jul 2018 05:56:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfcoPSAWXwCgFJjd+DN8X3k4089VKwwuGFiQY4EuCNQKSdYHJTn8jtJj2m4+KEpSMdf2rAW
X-Received: by 2002:a0c:e011:: with SMTP id j17-v6mr2223767qvk.0.1531400197006;
        Thu, 12 Jul 2018 05:56:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531400197; cv=none;
        d=google.com; s=arc-20160816;
        b=Ufh1efaqBdGkZg7VdE6IcepQWLsJdGngVDkvMRWvIlBYNo99sDQi7fKoFrQLPl1aPn
         gb8II4pMYjlMl6Wetmyy7ktxbVd819okeWUD1tqWg5KQ+n+QpUuwSFeD+KuXUSiEF8zB
         jPL3WhzkBk86m3S7BbBghgbURT9EHdCWW5GNHvQ80ht9JKoXg7aJZFXG694ov6fndlCN
         yz+QG08dSVDBUScYCgbcUMwSIUro2Bp/tMtLFMdRQDBeZRJCrQjD7UAXzFAXU2/WzQMG
         AM/R0LzhUvZJ6DJju2jyWrkgKJrJ6UfMAd5Eyb1EZx0u69+q22mN+vlZUWZsQmCUFlzI
         HAIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=aErfaCanYU/SkQ6A5AtpXlYOgbKW8nnpINgtsaXTAWo=;
        b=SMhvZ3k+rxhJGBJfH1FL9SC3s8AKbftWkAFNb6dQty+1OcGR90HwcuObOXv+8daCJh
         9RXeSLLLMOKZj/duUkAf/F0ceV+6YHtIlAHof+1fwP116VHz4/u3wMhhikOEw8Ol6pa/
         9xCCttPndaxEuUPC8rD2aVOX+6AOZhv9pZlZzqNKCgK9JzamFvpkMmIieZHpbtaWoy/d
         hEBL+g9zAD5QAPxTnTjXSaOJNhRfzeNgUui6Rm7pljrHjiJrvaL2B0bUgHcWN4m4IEvs
         yDaE4g+QL3n0gFRdi2YXNcUoasJYYJIfQT+xf2K+OARGbzZAtmPRvVmITfDxZzPx65bN
         XQzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bOu09z83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u190-v6si12172443qkf.195.2018.07.12.05.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 05:56:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bOu09z83;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59621 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdb9A-0008Ha-K8
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 08:56:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdb8l-00088L-Dp
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:56:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdb8k-00036H-If
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:56:11 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:43762)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdb8k-00035w-DM
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 08:56:10 -0400
Received: by mail-oi0-x241.google.com with SMTP id b15-v6so55501818oib.10
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 05:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aErfaCanYU/SkQ6A5AtpXlYOgbKW8nnpINgtsaXTAWo=;
	b=bOu09z83+M/WaAvqMv+GTYByMwcVVXzRz1clxua5Y1grkNDqSIKtFNvyYKxTHALFkQ
	45rRD33XELO8+zwXs9FM/dRfAx9EHLz45EQLZsOxcfQGwT9Vjn7n/2unFm8XOfCLAQMF
	5IOtc4uPK9IeTDOAN+oLNxSHgjCQ7LC0SLqpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aErfaCanYU/SkQ6A5AtpXlYOgbKW8nnpINgtsaXTAWo=;
	b=jf3Ln7t3/S1arqGqWjOiPzoyCf7BVsBHusE5yRVaAcRTN1mhGpWOHjbtmvpdbxUboN
	Nc66TadBNhclouPOlKwuyTeq0m6d48PBGuEqCoErHHGt1BWhM2GBI9c462vSwowfOpJv
	WOLC/zWB6Wc1eG43P/RjlrpM93HLD8PaF9ORWFKPtJR+D/8cbr6ahmZ4BkjeDqONCxOt
	Wm1ThdOngMQ8VxiD4gyUC3JR58ebLe4fG4fNobWkm6LegOFI/Spe+OF+RrngwEUXIzxY
	cOYWz7DcP91KPWmbD+4DCFzoWNmgza6m4qYrD3Ten5nGQB0JaQqFUWrOfQi5raQe1wzt
	9vWw==
X-Gm-Message-State: AOUpUlFQgOB5AeAUY6PNPd90HZxMCuZntZfwjPqhDzH9r0HfUFTdYRIx
	o514gxga7uwA5eYF4XWTfGXa8hFz5tE4ThKRb+kZ7w==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr2312045oic.252.1531400169741; 
	Thu, 12 Jul 2018 05:56:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 05:55:49
	-0700 (PDT)
In-Reply-To: <87y3egmzem.fsf@dusky.pond.sub.org>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<CAFEAcA-T_d2kEU+Pb72=pJQhpvqvN1owgi4RLNtNY=L4t_1Z2g@mail.gmail.com>
	<5d0c7195-ffbf-1618-6106-ef6c82df3bd7@redhat.com>
	<CAFEAcA9GspXJg2ioLrCknBgYHJ9f6qvM=n=y0dLeU12yv_5ETA@mail.gmail.com>
	<931c0545-e3d8-fc84-9b69-59fab040265c@redhat.com>
	<20180711161216.GV7451@localhost.localdomain>
	<CAFEAcA-3aBQPwiwDfZSjspiwv4L-U0LXBKaOQ2m+=OzhqRq3OQ@mail.gmail.com>
	<87y3egmzem.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 13:55:49 +0100
Message-ID: <CAFEAcA-RwRdgr-_YVwEWf0pSNQj_rdEmX_OZf5HFmNoR8LbthA@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/bcm283x: Fix crash with
 device_add bcm2837 on unsupported machines
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wg3fOKCpCVhJ

On 12 July 2018 at 13:06, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> On 11 July 2018 at 17:12, Eduardo Habkost <ehabkost@redhat.com> wrote:
>>> On Wed, Jul 11, 2018 at 09:21:48AM +0200, Thomas Huth wrote:
>>>> Hm, ok, so how to continue here now? Shall we at least mark the
>>>> bcm2836/7 devices with user_creatable=false, so that users can not crash
>>>> their QEMU so easily with device_add? The problem with introspection via
>>>> device-list-properties would still continue to exist, but I think that's
>>>> less likely used in practice... otherwise we could still move the
>>>> qdev_set_parent_bus() calls to the realize() function instead, and just
>>>> add a big fat FIXME comment in front of the code block, so that we
>>>> remember to clean that up one day...
>>>
>>> Crashing device-list-properties should be a blocker bug, IMO.
>
> Seconded.
>
>>> Moving to realize is not the best solution, but I would prefer to
>>> do that in 3.0 instead of leaving the device-list-properties
>>> crash unfixed.
>>
>> I would like to see the crash fixed too. But I'd like to
>> see it fixed:
>>  (a) by having clear documentation about how the QOM
>> system works, what you should do in init and what you
>> should do in realize, when and why you need to manually
>> parent objects, etc
>>  (b) as far as possible making our APIs for doing this
>> easy to use correctly and difficult to use wrongly. At
>> the moment we have APIs that are far too easy to misuse,
>> which means we will continue to get bugs like this and spend
>> a lot of time on one-off fixes for them.
>>
>> In particular I don't understand why we need to manually
>> parent these objects at all.
>
> I want both (a) and (b) as badly as anyone, but we should not hold any
> particular crash bug hostage to get them.

Without at least (a) I can't review this patch or any other
patch that fixes this kind of crash bug...

thanks
-- PMM
