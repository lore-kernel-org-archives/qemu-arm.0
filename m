Received: by 10.223.150.237 with SMTP id u100csp2431183wrb;
        Mon, 13 Nov 2017 05:10:02 -0800 (PST)
X-Google-Smtp-Source: AGs4zMab7LWKytJAzm1rwMtXBCOWXkImG+SAJNQZIdWinl6Vh7Y4L8+/Tv54nBbDQJBWxtzCOrnl
X-Received: by 10.129.175.101 with SMTP id x37mr2715805ywj.289.1510578602881;
        Mon, 13 Nov 2017 05:10:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510578602; cv=none;
        d=google.com; s=arc-20160816;
        b=MD0J1+bOIfnJjcSaj9J09Z9Hmxh417XMI/HEAsVGb3j8QvdaXDZYERb0TgQfXo6jhs
         IIhsItzuq/T5VIWYa+aW6Nd9eCuCf2Q3UgbBojzY297OFYrxrqDx0klWLlMJCrXN4yb2
         /DWG+EyVsA0dP/JJidY4grfjlgJMgzB2O4IBq4C5cd3vHVhauIOGcpKAIb7kGjmW2W6I
         TkzJ47GbkCwtrXTIAIUIl5ffofs5G7D9+9DbxWZl8TUSsHVMNHCE4d0pEMt4hisd4nVh
         qr2th7BAmt7EPet/OPvEUQp+YqgtmlTTQCe/iRW8uC4lX/IE5WzlARHqNcbUZ5wINOIL
         PiGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=bUoO11mJOX0+pXO7obSFWSIjevpz57NiV5iRsB5KZo0=;
        b=P1iCxN9/+rXhtnmXpZATdMAme3Tgii5o9hnC1hovD2MIlQ6hE6/OoAGnYSos5kstkS
         jmqYzMbuJZ/1FVZnfou2vguW94pObzWRlqqSehZ4lswOmz+rxAznQPmITUrg4rkuRVhe
         /DHA8WzFzWxdfnbVvs5c5Guqb1LFKL4J8m7MysWWQdNMakbCHLv0twNFPugF18/urb2E
         5kpgddeAkN3orQJh1uBmR7W1hrsCCVjscUwmLC3d6onHFbDZAa57B97fWYwKebLrszuW
         mSms12qebgUnWHOnc6/wbT4M2Fbc1ALYuiqGB0i4TzxkQ7FPMKg1ZzjZV4HhzO9ckPXd
         viHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Af0JrKcy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o64si3655146ywe.731.2017.11.13.05.10.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 05:10:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Af0JrKcy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54345 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEEV0-0002YO-AG
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 08:10:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eEETZ-0001s2-Jc
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 08:08:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eEETY-0007XI-9U
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 08:08:33 -0500
Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a]:48288)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eEETY-0007Vv-3R
	for qemu-devel@nongnu.org; Mon, 13 Nov 2017 08:08:32 -0500
Received: by mail-wr0-x22a.google.com with SMTP id 15so14363084wrb.5
	for <qemu-devel@nongnu.org>; Mon, 13 Nov 2017 05:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bUoO11mJOX0+pXO7obSFWSIjevpz57NiV5iRsB5KZo0=;
	b=Af0JrKcyzqcOjffVGjlY+vM3MSMsARISJQxQxM1/buNsz2RO4V4+lA1G2qMX878RnF
	91CctIZpopQL6RSphxZ2t2qwqSn2LSJn+mefG2dZfu4jVNFFLFQXIe7VJMaVLuF3Y6Rd
	XRXxhuV1huzbUG8q2O25CvpvFnD6aS/k+O9oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bUoO11mJOX0+pXO7obSFWSIjevpz57NiV5iRsB5KZo0=;
	b=a4TvQ/GGKPg1CE0sYxxDJqQoDaUaSWWv1BxhYQXhyOJQi+sv/kB73J1K8bL1fDrmRw
	0sT9F7Py3R+m+XR767kfgnCbnMP9+yPPShCax1Oo+oPETgiP3CYChKrBvtr1P6skyNfd
	G5sOYNy6pR7nv9SsfVmu56E0ygB+BVWzVTn8ERQnpgRDWX/Mz2qm9AABnPC2oXF6cOiw
	itY19JBoIoQdKSblzNVabpbSigcmjx8rzTMF4CGvpDtDBOn/T42ufcwSbvlEdzSlW0NN
	+mv84K1s/2i/8ZOQdUv54Rp2yE5w2MXAubW+d2H/QDKBCZmu8ey1NXyXqsUKzljun9Pr
	fqQQ==
X-Gm-Message-State: AJaThX7byXR0vBVYBiWgn15f4GXnQE1sVCepD3nSJJwUtrnFOhJgAS7+
	OvDqjbe39tF48G/NRD/g05VK1x45OZqY92X30+4IQQ==
X-Received: by 10.223.169.80 with SMTP id u74mr6794902wrc.178.1510578510995;
	Mon, 13 Nov 2017 05:08:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 13 Nov 2017 05:08:10 -0800 (PST)
In-Reply-To: <40a0ece3-7498-0dda-9e13-234ba09bedf1@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-16-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-BfvNFMFpiQd-XwGPYGasV3D-w3oDcqfHRoAXOAT17Fg@mail.gmail.com>
	<40a0ece3-7498-0dda-9e13-234ba09bedf1@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Nov 2017 13:08:10 +0000
Message-ID: <CAFEAcA_d1DzNXoJHpi9afGA-oFcPncuM3L-n8GjiLPcAyic+TA@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22a
Subject: Re: [Qemu-devel] [PATCH v7 15/20] hw/arm/sysbus-fdt: Pass the
 VirtMachineState to the node creation functions
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	robin.murphy@arm.com, wtownsen@redhat.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BRo3skN/MOuh

On 13 November 2017 at 13:00, Auger Eric <eric.auger@redhat.com> wrote:
> On 09/10/2017 19:47, Peter Maydell wrote:
>> More generally, why is sysbus-fdt involved in this at all?
>> I expected that instantiating and wiring up the SMMU would
>> be the job of hw/arm/virt.c, like any other device we
>> might have on the board.
> I wished to have the same type of option as for x86 where
> "-device intel-iommu" is passed to the QEMU command line. smmuv3 device
> being a SysBusDevice, a natural framework to handle its node creation
> function is sysbus-fdt. Having a -device approach is practical to pass
> other options to the device (this was typically the case for the
> "caching-mode" option). On Intel there are caching-mode, passthrough
> (pt) options.

Not being able to conveniently wire up a sysbus device on the
command line or pass it options are general problems. I don't
think the SMMU is a special case that should work around these
general issues by being created in a different way to everything
else. If the "hard to pass options to the device" problem needs
solving (which it does anyway if we want to drop '-net' for
configuring embedded ethernet devices) we should solve it,
not have some small set of sysbus devices be weirdly magic.

thanks
-- PMM
