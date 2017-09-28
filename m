Received: by 10.223.173.107 with SMTP id p98csp386474wrc;
        Thu, 28 Sep 2017 00:58:00 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBcfrh1t9HjkOJaBjR0G6LAtQFsIFi45MJJ4wz28xe+ZR+UMztvsAZllKDgo/xmzNDAB4Oj
X-Received: by 10.200.35.186 with SMTP id q55mr5785475qtq.193.1506585480729;
        Thu, 28 Sep 2017 00:58:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506585480; cv=none;
        d=google.com; s=arc-20160816;
        b=oIES/4zQ4w5no0DRTuy+Q9IcB0Eow8a5mifK9aevwvTeZeozX2IY/DTLzCRBcVxRcE
         KcTFIsu8VuicSNNhF+JIOnkcxLQTMjzuf/ecWJflSp7f+AdWhzpEacKAY/jhq6KyxaHD
         Pk/DUMbJ6T44oOweNLX91AYFzUgUePTechdCLPxFAQLDzgrayY7+GL1xDvcy5/O1o8qi
         SSieWa4z4SzOEvYFGJKR8e/1MD5eEQqoOKmkMBT2AV1Lfut7pya6LZZds5tUf54zOoMr
         0VPTXuCxxiFYTZ0Nky/q11XNo/LGRi8e7y4OTCiT6Idm64EO/JqPIrIrUK16FheEoZO6
         aTZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=KGWYGIdPwTgwe1/4CnTKj4VKMK5iO3EkcKSIe6QLQvc=;
        b=QyBd2FJuDy3HPi3F5MzKEe+YruPq4wf86vv4NJaeVGhtWhYItC/e504xTzYR+lSofh
         pydA6u7PYT4wyncyIzURL6jAAJojwr5WUZDquaXxCGTT8alkbRIPw6Rm6s6vgZ5Fc65F
         KZy3ZZh1JZY/YrmW4OfuMUAYI4Cuzud7nzcGkPeHsu0OAnV+Tl7mOAt0cX0gLo6FLPsu
         AcFpIt3bB0cXINfqfRsR4YGLHZF3M6X7Ia6ib9QwL8OxMR0xq9Z+zc0GXjDRfcPXUubZ
         68k3+uwNC53C8czIVmdiZRbJDeXCqvM3R2+HAWrxyqRGLfIm91OHrQVulkV1rreSamh6
         e3Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r30si988561qta.168.2017.09.28.00.58.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Sep 2017 00:58:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57841 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dxThm-0008ER-IL
	for alex.bennee@linaro.org; Thu, 28 Sep 2017 03:57:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40418)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxThd-0008E2-5P
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 03:57:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dxThc-0005tc-BJ
	for qemu-arm@nongnu.org; Thu, 28 Sep 2017 03:57:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55990)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dxThc-0005tM-4W; Thu, 28 Sep 2017 03:57:48 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02C7522D6E1;
	Thu, 28 Sep 2017 07:57:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 02C7522D6E1
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-163.ams2.redhat.com
	[10.36.116.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C65D917143;
	Thu, 28 Sep 2017 07:57:36 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-2-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8k4nAjqJ_Mu5ZZ8ygMMJikX17BCB3M0ZkbQBsKVLt5TQ@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <18211c39-970f-1277-e2a8-a30bb30f9050@redhat.com>
Date: Thu, 28 Sep 2017 09:57:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8k4nAjqJ_Mu5ZZ8ygMMJikX17BCB3M0ZkbQBsKVLt5TQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 28 Sep 2017 07:57:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 01/20] hw/arm/smmu-common: smmu base
 device and datatypes
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
X-TUID: XkXntiinIGIL

Hi Peter,
On 27/09/2017 19:38, Peter Maydell wrote:
> On 1 September 2017 at 10:21, Eric Auger <eric.auger@redhat.com> wrote:
>> The patch introduces the smmu base device and class for the ARM
>> smmu. Devices for specific versions will be derived from this
>> base device.
>>
>> We also introduce some important datatypes.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com>
> 
>> +/*
>> + * Copyright (C) 2014-2016 Broadcom Corporation
>> + * Copyright (c) 2017 Red Hat, Inc.
>> + * Written by Prem Mallappa, Eric Auger
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
> 
> Really GPL-2-only ?
> 
> Unless there's a good reason, you should probably fix this (including
> getting an ack from Prem/Broadcom where it applies to code that came
> from him).
OK, thanks for the notice,  I will investigate how/if we can change the
license.

Best Regards

Eric
> 
> thanks
> -- PMM
> 
