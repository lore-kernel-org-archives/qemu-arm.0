Received: by 10.223.172.38 with SMTP id v35csp1224959wrc;
        Fri, 8 Sep 2017 01:36:03 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QC3E2m9IjpqTUGIgM5Uvs8sdq2N3XUTIk7HlQbkc8QVvNuzWENxJAte9+0JzVaQ3neV7sRo
X-Received: by 10.200.8.72 with SMTP id x8mr2880891qth.108.1504859763763;
        Fri, 08 Sep 2017 01:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504859763; cv=none;
        d=google.com; s=arc-20160816;
        b=Q29hyG8KGkSSSEy72RSop5gAht3zGKouExgF3AsOGrW/HZB0gYCsQOjEhTZL91BlVG
         c+fX8TZtEnMdxAAMnD0pYBp0Uehr/CwlqyGLm+ECUfBNbzEWVLsW0XF4Z+PICHk9Ysa7
         6ZaJn4G6QkYQlj0scTw9m82UBcc9MWdecGjRA1JQYJpCHTavFZsBg3LzSqpXfteyekTK
         HIRaVnwFq/WYa0LLsuKUvKKa4aV6BHxaS5lG6Gsoq7gb5fRmAYXmU1f2SDUAuQigVk7R
         b+/PL2715RuBC3R+mRelOkZdoJhB1krgy/LMRISIhVk2y+CHQsG8zvgopjBetL48ny/N
         IqNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=xxKURk3Vv7RNCPTIpljKxYnEv1MkmLd98wR65J3f5GA=;
        b=eA4WQoTOnBTcpfGtFBTynM/PGEblOUJMkdUhFffUrAfphYEphoLrxSM8x0HhOeizAY
         GDgaFqrulKvrlfZFaQNdg6eZGbblMy9HWUQP4Cx1sxhhKPBk+KYuZJ62OpSX+BFdc++W
         WizFbjQ+OPFfS/Ths/Mfo7O0vIOxjr3i9ZGEUQ2Vh8oClh0Mouulc+e3By4BrdXSZPdx
         RdkdNaIyvALqNB6srA+yiC4r7XLj5cZxZ939JqJXydfs+2w3cwxKBifGmvBvS9cPsbAz
         +WOwe46meD4ttOULivhbm64wKKLFWC9QUqdRzqWxazC2uO8upH6lRoxDhnQ8dmkn+UZ1
         bw3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u11si1478968qka.403.2017.09.08.01.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Sep 2017 01:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43885 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dqEld-0007fR-IQ
	for alex.bennee@linaro.org; Fri, 08 Sep 2017 04:36:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33575)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dqElT-0007ek-Fp
	for qemu-arm@nongnu.org; Fri, 08 Sep 2017 04:35:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dqElL-0004Fl-ND
	for qemu-arm@nongnu.org; Fri, 08 Sep 2017 04:35:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46098)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dqElL-0004DS-FL; Fri, 08 Sep 2017 04:35:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53DC981DE4;
	Fri,  8 Sep 2017 08:35:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 53DC981DE4
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-1.ams2.redhat.com [10.36.117.1])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1663600C0;
	Fri,  8 Sep 2017 08:35:29 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-79barRXh-H1g16UgiswsQqtHnYKLv4_Vhp89nNxM2NQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <05efe60e-e4d0-24e1-548b-b587bf5153ff@redhat.com>
Date: Fri, 8 Sep 2017 10:35:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-79barRXh-H1g16UgiswsQqtHnYKLv4_Vhp89nNxM2NQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 08 Sep 2017 08:35:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 00/20] ARM SMMUv3 Emulation Support
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	robin.murphy@arm.com, wtownsen@redhat.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mSoNLDmAj9Kh

Hi Peter,

On 07/09/2017 14:39, Peter Maydell wrote:
> On 1 September 2017 at 18:21, Eric Auger <eric.auger@redhat.com> wrote:
>> This series implements the emulation code for ARM SMMUv3.
>>
>> Changes since v6:
>> - DPDK testpmd now running on guest with 2 assigned VFs
>> - Changed the instantiation method: add the following option to
>>   the QEMU command line
>>   -device smmuv3 # for virtio/vhost use cases
>>   -device smmuv3,caching-mode # for vfio use cases (based on [1])
>> - splitted the series into smaller patches to allow the review
>> - the VFIO integration based on "tlbi-on-map" smmuv3 driver
>>   is isolated from the rest: last 2 patches, not for upstream.
>>   This is shipped for testing/bench until a better solution is found.
>> - Reworked permission flag checks and event generation
> 
> Hi Eric -- I see you've upgraded this from an RFC to a PATCH set.
> Do you want the patches reviewed and (eventually) taken into git
> now?

Yes I split the series to make it more reviewable and from a functional
point of view I have run all major use cases. So now I would encourage
people to start reviewing the series (focusing on patches 1-18).

Thanks

Eric
> 
> thanks
> -- PMM
> 
