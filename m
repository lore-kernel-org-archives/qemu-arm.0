Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp840533wrq;
        Fri, 15 Jun 2018 06:17:17 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIaua86kKvIHVNhh+LkCUwKUEXG7GWeUdRb7WW/xbPhJBz62uzMH3JmwDNt+Y+zfDqGOfGg
X-Received: by 2002:ac8:296:: with SMTP id p22-v6mr1407849qtg.188.1529068637808;
        Fri, 15 Jun 2018 06:17:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529068637; cv=none;
        d=google.com; s=arc-20160816;
        b=yO+IuZWCdN9twSVInnf7ORp6fKnQ4fK1gRsipBH+r5F1y3OP9x2nOveFLvpmuyDXsP
         Z6XIIruQTJeJW+ISlnCCKw7qe/uvQcKSWZwwr7Odg/PhqocvePSA7WcAC5hVmvoeMzwP
         1cuvSBqzVfOmJAeJM2ZvoVRNAemCEiE/HC3ag+FzjXpM9RxnJ9Zwt6NH9N1GniUguOjq
         W2noOC+RUeF2ym/6WWj0iuozXeTg7j2vQQP07jxyueqKKxXxUBzZC/rf4NUkcWVMw5ZJ
         Wgn7vhZdL6e4ajMkFthJvmLSYTWr61cunrWgOxKpuU8rUoxrBrrzYcnnnhU8MSV9hUUL
         lemQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=j0v0WSQb3GCMup5qwuvfcAzTtmnYXnoYpr+9kDi04p0=;
        b=lMLQ5ptehxfj8efnkFva6mQLK+t3J2OxjM3Mfwjp/XtvwfM5+ywX9J9DMIkev1ut1G
         b3auFkApsClO7xFhdMq0JQU+tTxWFaXS3caS7c6zZPlsgOaDl0A4Goh0653Pl3ZQUrAj
         3JpyCrzTJiOhqbWaM3Dkg6Wz4zddHw4v8FAZE2re499OTQfrMoZKxfEyMjUVQ5JgBe91
         jAegkVNstkM5sl9vioguZ5wgFGUv/k2oDqmaLzafkkWTPASiAPo8wkG/A8ToREuNIkpz
         VtmxBreEilOi2MUZZQ3KTzTFt81kkoYffyRQIfgfw0Hh0PTll8IlL10XTIXwojym+fqR
         H7zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VCr0btMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k23-v6si7356512qvg.220.2018.06.15.06.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 06:17:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VCr0btMK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTobN-00049Q-AH
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 09:17:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTob7-00046Y-MV
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 09:17:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTob6-0004IR-KZ
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 09:17:01 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:39540)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fTob6-0004HU-EB
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 09:17:00 -0400
Received: by mail-oi0-x242.google.com with SMTP id t22-v6so8760760oih.6
	for <qemu-arm@nongnu.org>; Fri, 15 Jun 2018 06:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j0v0WSQb3GCMup5qwuvfcAzTtmnYXnoYpr+9kDi04p0=;
	b=VCr0btMK7hoqpsRNI9UgIYtVHLv016OMpv1pkbegtJoxlp9jTY32dKybE4sl5IfKi1
	wiy4+juhWaun5RdeJCuKEs6jVrKKAoohUdDTiDiR34H8WuxMeyDIAXbsI+ZECGDUeeq4
	4rNyw6/IrTB3WDsjqtF8pNNaXWPiqOl8XUlXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j0v0WSQb3GCMup5qwuvfcAzTtmnYXnoYpr+9kDi04p0=;
	b=QqecF8xSoOPBm9+aloqeh7KXdCrHToeXrg0ytenyLKqCSJW/qDqxwQ3HcrJtGK34Tu
	+6dEtPaQy5mMqTuZ0GbbB9+5sp+sAYWDw3TrLdj21gqMRucKJb0yZRS2viqFXqHWYgT0
	YlKfy9W9+mk0ApWcjqUQGfEopJBYV/5LSGoB8WXfLbPl6ye/orK1KiXrnlR/8d6uk+uA
	A+knfzkrfdonRbfjlyBNWNt7sw4Vjy26X65/Cz5wxl1dXh5xvQm4EFjzmtUJOB5QeJHM
	nJhaUOZq+1NpxhH4fWebrSj9FFzcbemt6a/eHUqUFlD0Mx8tkhgGrBeLrUeaWzDLINQ0
	8bFw==
X-Gm-Message-State: APt69E28KVOUVgxA5T1TIDUlIFAYn0e25qUpsnpmhENo1n4BWoDJZZjj
	XN0JO/zvfkiSOPlzLJq8QJpgSS05V6qXVORoBtMzFA==
X-Received: by 2002:aca:a846:: with SMTP id r67-v6mr895776oie.12.1529068619667;
	Fri, 15 Jun 2018 06:16:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 06:16:39
	-0700 (PDT)
In-Reply-To: <CAFEAcA_R_68FDq-=1coazcTpc1MGqh2ZanccP8C=C9ZJ9_T_6Q@mail.gmail.com>
References: <1528554193-27270-1-git-send-email-eric.auger@redhat.com>
	<1528554193-27270-3-git-send-email-eric.auger@redhat.com>
	<CAFEAcA_R_68FDq-=1coazcTpc1MGqh2ZanccP8C=C9ZJ9_T_6Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 14:16:39 +0100
Message-ID: <CAFEAcA8B2qu1g2yGn4HiWCBhX2Can+UyrL==QTdKvxL7_Wq2Xg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 2/2] hw/arm/virt: Silence dtc /memory warning
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
X-TUID: Nm1eGiEYpln2

On 15 June 2018 at 13:26, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 9 June 2018 at 15:23, Eric Auger <eric.auger@redhat.com> wrote:
>> When running dtc on the guest /proc/device-tree we get the
>> following warning: Warning (unit_address_vs_reg): Node /memory
>> has a reg or ranges property, but no unit name".
>>
>> Let's fix that by adding the unit address to the node name. We also
>> don't create the /memory node anymore in create_fdt(). We directly
>> create it in load_dtb. /chosen still needs to be created in create_fdt
>> as the uart needs it. In case the user provided his own dtb, either
>> the bank is added to the existing /memory node or if this latter is
>> not found we create a new separate memory node.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  hw/arm/boot.c | 20 ++++++++++++++------
>>  hw/arm/virt.c |  6 ------
>>  2 files changed, 14 insertions(+), 12 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 1e2be20..2054670 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -593,24 +593,32 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>              g_free(nodename);
>>          }
>>      } else {
>
> I think you need also to change the "if" half of this if..else,
> which deals with NUMA, because it assumes a "/memory" node was
> created by the virt.c code and now it will not be.

...I think this breaks the tests/numa-test part of 'make check'.

thanks
-- PMM
