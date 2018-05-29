Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp3342280wre;
        Tue, 29 May 2018 02:13:32 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK74x1w8H3ZZJ2d45OfWsdsG+4IFjiSFMXPHdynI01dnqKanEcUlGALRx0tQU6qpR64x1Yf
X-Received: by 2002:a37:1828:: with SMTP id j40-v6mr13821206qkh.11.1527585212524;
        Tue, 29 May 2018 02:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527585212; cv=none;
        d=google.com; s=arc-20160816;
        b=JcQiOitjkukUTxecxnMLe1bFozMejVe2R4qCZjhH98LzbyWyL3vqh6HZJx40wCSkOl
         /+o2KA6Kq1DfScNtasilB45wTxpCXQbJ8Woi9SUXoQCDjZDN69yhhKA81zR64IXCVsQd
         u2J8rSj3p7CqgdYG4Hj4nXRMsMhDBzpIOa63SdUUARkmCWxuLtcKaXLBs3N/XQ/OEw5f
         epSosS4baFA5ySwbbpx6tOuBCTgRIfzCzstMSup8I5jyhlgoP0ihrjZV/BJ+ha9VyYFp
         XZaus2kZ7gFoLNGTOv26LpzzKrmsrXdy9vDBgdrWBinX0wyp2RdYl2JlvlQvXKQ1seAz
         PKYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Xqs2r1/nr82fh4uCSXOWK60zUls5lNl58E2ffx6Ne5g=;
        b=RPrBxvnCgopXRA6mZteadDxL6WUWLRQtv0z3IZQT425vZKF7qliERMGIvr4EGijmXu
         iKd90xI2Oic4X2Wvny13lPX6mqIcfS6bHs37JarXYGGTxH2LabEzDHRSvNGZLIi1qLGF
         HI8rv2L+mVMW6uR7LHa8iQzhho6cECn2RHcb2DAshlfnZxhpzszBzDxrGHoJCJDd18BM
         i4soIU1zMUv8gWRuzIc7qq8JV9mH7w05Gv5w3x9pARaEh7h47RCAsRFvWPSnK2DwwTUu
         2UqMP/zSjOCOjWftQcF8iA4bODF3KRNMXdPlA2Lb2j+95W7SZydVxBZyZxVZ/HJaB6OX
         waqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N2ktSvNm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m62-v6si15484672qkf.304.2018.05.29.02.13.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 02:13:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N2ktSvNm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59739 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNahA-0002eA-0K
	for alex.bennee@linaro.org; Tue, 29 May 2018 05:13:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNah2-0002c3-43
	for qemu-arm@nongnu.org; Tue, 29 May 2018 05:13:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fNah1-0007SM-6e
	for qemu-arm@nongnu.org; Tue, 29 May 2018 05:13:24 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:42144)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fNah0-0007RZ-QA
	for qemu-arm@nongnu.org; Tue, 29 May 2018 05:13:23 -0400
Received: by mail-ot0-x243.google.com with SMTP id l13-v6so16131737otk.9
	for <qemu-arm@nongnu.org>; Tue, 29 May 2018 02:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Xqs2r1/nr82fh4uCSXOWK60zUls5lNl58E2ffx6Ne5g=;
	b=N2ktSvNm8c+r+qiGOarmRlxbCRt6F5qzvf08eku+L0bqjW89izlZg7hF/COOgKtihD
	dqLXBSZLrS7PHoY+5ZCr4c7kqvAGN0JnwALqx9nvigLf5UsxhoqqTpcA+PGSeccx2nEu
	0D4Bxb9C1mHXW7QcePregiMyf07nhdEiRM/34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Xqs2r1/nr82fh4uCSXOWK60zUls5lNl58E2ffx6Ne5g=;
	b=Mi1NnUfbIkYxlrIEsp3fuRc8XdsNyFfR9ZRYU/dC87pUVFF1eRZ/R3crHCVm1i8tuI
	N9NorjQpwf14Zi/WDnVhEwHB6mHWZ2wbE5t7hjor3lsPmiRl5JHvufBCa60glS0Ujhfc
	sP5MVb67XY/L7N13leiYIAO0kaIIXRy0spBloEO4uDfsZSZGOvY7MslizFH4tkqLr0uv
	C+JPYYfBwlSXWTeksCSlFFT7HcLOrIa61zEwtp4kkCPsBkf01YKZ65ldIj9L0ZwF3tYR
	tUABEjvMr+xHo1QHze7WX8HG4yxZDatjauoPAS7D2dtTB0vS9AnR5fikRmUGauU6Sk4v
	3lWA==
X-Gm-Message-State: ALKqPweKzv1f7kTzvfCazvtqyxIS+0ycsjOmAqY74LRpvuoM/mBTAU4d
	Jc3YxfDPgMfrCcPOoQ7mg0dCOoBG5JloSSKku9/DRg==
X-Received: by 2002:a9d:5014:: with SMTP id
	a20-v6mr9935880oth.205.1527585202252; 
	Tue, 29 May 2018 02:13:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Tue, 29 May 2018 02:13:01
	-0700 (PDT)
In-Reply-To: <929ce9c7-afae-7978-ed35-3789fcbf026a@redhat.com>
References: <1526222114-5324-1-git-send-email-eric.auger@redhat.com>
	<1526222114-5324-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8yo_NKY=mHNYFFTA1+eR-731ePUb5hDum0ubUM2XOxxg@mail.gmail.com>
	<929ce9c7-afae-7978-ed35-3789fcbf026a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 May 2018 10:13:01 +0100
Message-ID: <CAFEAcA-yWBexVnpd9_iicL0o8A3TNZ2ezAf8nrYJ_ZPmB+xocg@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [RFC v2 3/7] hw/intc/arm_gicv3: Introduce
 redist-region-count array property
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
Cc: Andrew Jones <drjones@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0e/gzJhrHM+z

On 29 May 2018 at 10:08, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
> On 05/22/2018 02:27 PM, Peter Maydell wrote:
>> On 13 May 2018 at 15:35, Eric Auger <eric.auger@redhat.com> wrote:
>>> To prepare for multiple redistributor regions, we introduce
>>> an array of uint32_t properties that stores the redistributor
>>> count of each redistributor region.
>>>
>>> Non accelerated VGICv3 only supports a single redistributor region.
>>> The capacity of all redist regions is checked against the number of
>>> vcpus.
>>>
>>> Machvirt is updated to set the count to 123 vcpus for the unique
>>> redistributor region we currently have.

>>> +
>>> +    if (type == 3) {
>>> +        qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
>>> +        qdev_prop_set_uint32(gicdev , "redist-region-count[0]",
>>> +                             vms->memmap[VIRT_GIC_REDIST].size / 0x20000);
>>
>> We used to create a region which had num_cpu redistributors in it;
>> won't this cause us to create one which has as many redistributors
>> as will fit in the space ?
> Is that an issue? From a machine perspective the whole region is
> reserved for rdist. dt and ACPI will expose this whole region and the
> device will use a subset of it? I agree I need to document this change
> in the commit message though.

It's a difference, and a guest-visible difference too. This
patchset is supposed to be introducing split-redistributor-regions,
not changing the behaviour of other configs. Also, I don't think
it makes sense to model a GIC with more redistributors than CPUs:
real hardware doesn't look like that AFAIK.

thanks
-- PMM
