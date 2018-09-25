Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp739630wrt;
        Tue, 25 Sep 2018 07:25:05 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60ZgUS/yD0wnv2KgN4sS2k68AykdrVsxwYDiBWNa0/PoEGr9B9OyDppJEqVsKo1cH1WZVZ9
X-Received: by 2002:a37:64d6:: with SMTP id y205-v6mr874517qkb.166.1537885505402;
        Tue, 25 Sep 2018 07:25:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537885505; cv=none;
        d=google.com; s=arc-20160816;
        b=ozrO69oV8nNfIv7tDmByWfHvdobuSIA/Xd835FSRFgtBLCbKu9y1mIGLhWvMgjd0qC
         S/CkNKYDcrV/UP5NshW2+KKZ4WqRglc3yH0hNQSCDIukJxgiWBZ3eK1LPsg52oziDzVW
         qMkc2BAfGakBQXrtrhL+1qoQI/ntvYCb7kaxz46M7MBhJQS9OLVSae8lOGXh0pZA/pMd
         ipxm9SFP1BMwDAB1aTzCjnAQyu8L1n3sQeBvU/kKUdV3iogE36gX+/3X4vTn3Hu3kJlE
         pzwQqQi6xGOnlES5LurK6Uhk1yHm5ooM5IHDydZVeABb83yblTexqhcM4+xTB3WNtXoH
         uhfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=geA8hdk/L2YiHOz08UuLR6iFU8C0n8rhwpiYmP0z8HQ=;
        b=oedT9srA6SgT53fIDMzyRLdBZcHYew6wAlkfeIX8nzKOHV26Ertu5qELA3kcsW3uam
         dH/Pf1qk/ul7ETqzzABlvocL2mIj82XTYkGmgR3EL7AYmxHHhazJxH7vXMVMPrjbCiVh
         xNqCY71KP2W1o+HOFLZu3n2KOEPO360/ugkBFNgCVnsoXzuZ7VmfyYWP/6EnfQJGVBzV
         kahp4xiXeVJc8zbeAgB5L4xDu+HthAF5P+43AAzL3gS2x+7MgrPt+0uAhItLEEW5Bf3r
         lLFksFNNeEohQROZycwqYrELgPg6WrZzfB2a4Ppq+erNa4Nl+qca2DIFSF8bOqiy8jhT
         ADag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XPxEdGhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t16-v6si1843510qvh.46.2018.09.25.07.25.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 07:25:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XPxEdGhe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53423 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4oGu-0001Gx-JW
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 10:25:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55644)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4oGf-0001Ev-TH
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4oGe-0004YN-RG
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:24:49 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45361)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4oGe-0004XB-Ey
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 10:24:48 -0400
Received: by mail-ot1-x341.google.com with SMTP id c13-v6so6810152otf.12
	for <qemu-arm@nongnu.org>; Tue, 25 Sep 2018 07:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=geA8hdk/L2YiHOz08UuLR6iFU8C0n8rhwpiYmP0z8HQ=;
	b=XPxEdGhe/umZasNEKvzdty4Pk+9QhoTnsqikFVfvvxwAskhdu0GU6VDH+JeoKpuDV5
	uKOXtU0Ol/klT0f4eVXYyA7KCp9Qh/Ar45sINMPIv5CCj4eBYdxLNTU5JGkK07zCAtx3
	YH2OKxW0w2uxz7EodwDjl+0n3jrqs+eStVFJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=geA8hdk/L2YiHOz08UuLR6iFU8C0n8rhwpiYmP0z8HQ=;
	b=htlhsKuVkAROLeWXc4b2/qFK8JG3Sj014sriflG4D+aHzX5aDU5h03CVufG2fhF5ii
	pdqwXSBC9jEdeouNEp094Q44RVbEI0hrJmDLBhk9OpbLOGTKo/7TqHw+/kb82YsdlAmT
	XsWOmr0ofngQEsL5mTDQc+caW72e+T03hEgWLuZVkQKBQCZYHUgPsuolY7wiNmaVJ6My
	RBl5MRAXqFm+veZBbE8H5DP8iCLgDXZfBCFgAPEASANuJQNH1vgQELlTTr5dPQuHBiig
	jEebSt4jNTO4KVZlZ737hmd0xTfasfSCyAn+Q1b0AYGjK7Rk3O0krwZyoyirKmsY0QXf
	xTYw==
X-Gm-Message-State: ABuFfoiyx1YXdJ14x6zXL453GgwtSqnfib5AbDVOmqB0BVz++kTFzp0z
	vul8h5JKVEpnhAJW0RsJit5ntKgdNCdyP7nzOLTblSHHU2A=
X-Received: by 2002:a9d:2e21:: with SMTP id q30-v6mr893432otb.98.1537885487067;
	Tue, 25 Sep 2018 07:24:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 07:24:26
	-0700 (PDT)
In-Reply-To: <839d47bb-16ac-8ad8-44c5-5ab86346ca94@redhat.com>
References: <20180921070138.10114-1-eric.auger@redhat.com>
	<20180921070138.10114-2-eric.auger@redhat.com>
	<CAFEAcA9vHnCrw7mX=_TTvhBjpE-58dZCX8zPOVpCBNeHya-p6w@mail.gmail.com>
	<839d47bb-16ac-8ad8-44c5-5ab86346ca94@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 15:24:26 +0100
Message-ID: <CAFEAcA_b0k4kpfgH-z+EL6rUM5t=w6qMbNoO8oW1aTUwqz+e1A@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 1/2] hw/arm/smmu-common: Fix the name of the
 iommu memory regions
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s2UzM99U2ONm

On 25 September 2018 at 15:16, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 9/25/18 4:09 PM, Peter Maydell wrote:
>> On 21 September 2018 at 08:01, Eric Auger <eric.auger@redhat.com> wrote:
>>> At the point smmu_find_add_as() gets called, the bus number might
>>> not be computed. Let's change the name of IOMMU memory region and
>>> just use the devfn and an incrementing index.
>>>
>>> The name only is used for debug.
>>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>> ---
>>>  hw/arm/smmu-common.c | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
>>> index 55c75d65d2..3f55cfd193 100644
>>> --- a/hw/arm/smmu-common.c
>>> +++ b/hw/arm/smmu-common.c
>>> @@ -311,6 +311,7 @@ static AddressSpace *smmu_find_add_as(PCIBus *bus, void *opaque, int devfn)
>>>      SMMUState *s = opaque;
>>>      SMMUPciBus *sbus = g_hash_table_lookup(s->smmu_pcibus_by_busptr, bus);
>>>      SMMUDevice *sdev;
>>> +    static uint index;
>>
>> "uint" isn't a standard type (and causes a build failure on
>> at least one of my build systems). Did you mean "unsigned int" ?
> Hum yes, I did. Shall I repost or do you fix it directly?

I've fixed it up in my v2 pull request.

thanks
-- PMM
