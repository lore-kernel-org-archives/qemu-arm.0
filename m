Received: by 10.25.0.6 with SMTP id 6csp266908lfa;
        Tue, 9 May 2017 11:24:57 -0700 (PDT)
X-Received: by 10.55.129.65 with SMTP id c62mr1566208qkd.229.1494354297190;
        Tue, 09 May 2017 11:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494354297; cv=none;
        d=google.com; s=arc-20160816;
        b=d5aBaxJO/MZ5H3XLrRsPrsQzi2fdiSQ8zHlG4/jxh0ciW2FUTQgxPGvez0PMleLauo
         fziN1LKbIOELm5/9csaznMrv79sncv6p2irvCnhcfSwnV2wvS8Bk1zYzsvJ1sblgGLL2
         ubLjuoBxSEfaDwfvdiXiDKf7VTIDguyaRJRDJTwhNMAHygqQo7lC6siKw3CAIjvmoNaL
         jdpal+DbNdzNDnWMEq+IgJy2Xkjwx9koSKKVW/8qCue4VK6qykCNb8LE6nJSpuR22dU6
         AxPyaXzlGiQ/I/6P+pf2AA47XT5potWF2fjvOCVx7JXqM1hBI2IeVqLDCKxtLymBXX+t
         gQhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=zTFBb1VlN2m3FRexAEJzr8kdn3Kvpqi/i17+447P2uU=;
        b=y9OBai+xoi9PB5QlKZKQdwjB9SE1c8JIS5Wrdx6ioJO6daXgFb5UYia2ygvfI/m1Wb
         ndqtIyAT5W8PxAPQc0KdGAd3vMm5GoLvFjvXGv1DoZSsRFl6MuyObxTEu8ZD5fpAMgaE
         cYGGmyuNCHiRRqZw4LYvKpw5NWvzuTnSjNw3S/ycU8t95WYYEozkSKBgm/zdX37/EFKr
         UfPMDsFjYxjLIFFkqUqviZRAyODCa9EZFb2TqEuVmRZ4XETTAfOJrYYmk8pMQwUOLVxx
         kbPAhmhE0lAift6ZhFkkQDoZP8hksgOez17Caf3NogbqrHJOIKjxdNHZuHVXfqNTU+nw
         vE/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d14si704418qte.15.2017.05.09.11.24.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 May 2017 11:24:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d89oe-0003li-N5
	for alex.bennee@linaro.org; Tue, 09 May 2017 14:24:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1d89oa-0003lN-F3
	for qemu-arm@nongnu.org; Tue, 09 May 2017 14:24:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1d89oX-0004Nw-B7
	for qemu-arm@nongnu.org; Tue, 09 May 2017 14:24:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52024)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1d89oX-0004MO-3i; Tue, 09 May 2017 14:24:49 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9ACCB80463;
	Tue,  9 May 2017 18:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9ACCB80463
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=thuth@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9ACCB80463
Received: from [10.36.116.100] (ovpn-116-100.ams2.redhat.com [10.36.116.100])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EFA27D542;
	Tue,  9 May 2017 18:24:40 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, qemu-arm@nongnu.org
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-3-f4bug@amsat.org>
	<2cd1e7a1-7f92-88a2-cf98-0dcea0a2f9b1@redhat.com>
	<f7e86a1d-f53e-5dfa-e8d2-5dd2e860879a@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <66e1f05c-36d0-9d80-1b57-4b21e9387b2a@redhat.com>
Date: Tue, 9 May 2017 20:24:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <f7e86a1d-f53e-5dfa-e8d2-5dd2e860879a@amsat.org>
Content-Type: text/plain; charset=utf-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 09 May 2017 18:24:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 02/11] hw/pci: define
 msi_nonbroken in pci-stub
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wfgO89LrltXD

 Hi Philippe,

On 09.05.2017 18:49, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Thomas,
>=20
> On 05/09/2017 02:19 AM, Thomas Huth wrote:
>> On 09.05.2017 01:39, Philippe Mathieu-Daud=C3=A9 wrote:
>>> This field is accessed in hw/intc/arm_gicv[23*].c
>>
>> default-configs/arm-softmmu.mak sets CONFIG_PCI, so this should not be
>> necessary, I think. Otherwise, you should extend your patch descriptio=
n,
>> to elaborate on what you're trying to do here.
>>
>>  Thomas
>=20
> Sure, I'm willing to add basic support for the TI Hercules MCU which is
> a big endian SoC (without PCI support).
>=20
> I'm using the following config:
>=20
> $ cat default-configs/armeb-softmmu.mak

$ cat default-configs/armeb-softmmu.mak
cat: default-configs/armeb-softmmu.mak: No such file or directory

... so you're planning for a new armeb config file here? That's the kind
of information that I was missing in the patch description.

[...]
> As I understand the 'msi_nonbroken' is a kludge (there is no intrinsic
> relationship between PCI/MSI and this particular interrupt controller).
> Since it is declared as extern in "hw/pci/msi.h" why not define it in
> pci-stub?

Sure, your patch is fine, IMHO it just lacks some rationale in its
description.

 Thomas

