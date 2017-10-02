Received: by 10.223.197.9 with SMTP id q9csp3101411wrf;
        Mon, 2 Oct 2017 00:43:57 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QB7NldgOIPBB4ahHONXKcorc1h7/jpc1VciyVXOe5LO6AuPDoZNhLK0CRJ+M+4OAxRf5Vlk
X-Received: by 10.237.60.50 with SMTP id t47mr18444529qte.49.1506930237823;
        Mon, 02 Oct 2017 00:43:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506930237; cv=none;
        d=google.com; s=arc-20160816;
        b=VP2GVVhCZ7Y3VLAOJIpjene8pmfhuE+cXbCa4axIW42jYrRynB/MwyV+R0/JsEE97q
         gLTaGNQJ3wUGvM/BzcDzrL/eUCg8G4e1jAi/j/rGX+rrqaThZcI2srjZPZbHteGkFqkY
         VvQAAWEKpxuS446HqEHhBY8iURFiLsg7T3FWnmSu0w2/DIwgPGxRgOLX+EIFW69tm48x
         NLUReYRKxcIuyqAVNemg+8BFMPO33QXdyZAO0/hG/PpUrCHRQuWq2NlSXkftE87WGTKV
         qAdTXN7aDq6baT2JRlt7PIBcL7Gh9ubVqKAZe+x/lNuiewxg0kLlQnGR19ThCZ4n5WLX
         OhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=59Ro3o27RY0PIvBkrdSQLHCkvAYrbekM+3Pu6UX1UzY=;
        b=yjO030zRCHCV75cE4Jd6ibxeNG4ri4TvY05q5fEoqoNOYBVJimEZ2v88wzKnfrFykC
         iK8qHdJjkDKocxJc+5+f71mbhhZbK0dL3fO+xKu6lsvxbExJwi4D2qyVwr329PuR6/Gc
         UIulWAqIhVSOGJR3FpfGvsO6574FxHsC4UldrsDMHlCMx3JK4FozOXyN1om3MIa04LV/
         aZi63kIOS/F7E/WeXQ+iPVHn6ror1Z0sjNC2bjq0g8OtoqzsS7J0p0tCYibiSbEcOx2H
         aN1/1QTl/dSZQvQjPOqnThpgo7CXCcr0/2QAqQwA6PpQke07M7ZqVpKLYfC+2Xy+0M4P
         QM6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q16si1977108qkl.258.2017.10.02.00.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 02 Oct 2017 00:43:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@gnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@gnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>)
	id 1dyvON-0008Eg-Kh
	for alex.bennee@linaro.org; Mon, 02 Oct 2017 03:43:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dyvO9-0008EQ-2k
	for qemu-arm@nongnu.org; Mon, 02 Oct 2017 03:43:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dyvO6-0001Tv-1A
	for qemu-arm@nongnu.org; Mon, 02 Oct 2017 03:43:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34434)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dyvO5-0001T4-OX; Mon, 02 Oct 2017 03:43:37 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7B82B6146F;
	Mon,  2 Oct 2017 07:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7B82B6146F
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-116-233.ams2.redhat.com
	[10.36.116.233])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28DC55D6A6;
	Mon,  2 Oct 2017 07:43:21 +0000 (UTC)
To: Prem Mallappa <prem.mallappa@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-2-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8k4nAjqJ_Mu5ZZ8ygMMJikX17BCB3M0ZkbQBsKVLt5TQ@mail.gmail.com>
	<CADD6c-iohAZO7DLsYfh+sRz0SWyxWW0ja_tdFhdemgWJafHJjg@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6af2c711-5f6b-d8e1-d0e3-21bfb3e5c98c@redhat.com>
Date: Mon, 2 Oct 2017 09:43:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADD6c-iohAZO7DLsYfh+sRz0SWyxWW0ja_tdFhdemgWJafHJjg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 02 Oct 2017 07:43:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v7 01/20] hw/arm/smmu-common: smmu base
 device and datatypes
X-BeenThere: qemu-arm@gnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.gnu.org>
List-Unsubscribe: <https://lists.gnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=unsubscribe>
List-Archive: <http://lists.gnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@gnu.org>
List-Help: <mailto:qemu-arm-request@gnu.org?subject=help>
List-Subscribe: <https://lists.gnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@gnu.org?subject=subscribe>
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, robin.murphy@arm.com,
	wtownsen@redhat.com, Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@gnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@gnu.org>
X-TUID: mxUhS2+6tPKx

Hi Prem,

On 30/09/2017 10:28, Prem Mallappa wrote:
> All,
> 
> I am no longer associated with Broadcom, so can't help much here I guess.
> 
> If there is anything else I can do; please let me know.

Thank you very much for your reply. We are going to ask Broadcom's
representatives.

Thanks

Eric
> 
> Cheers,
> /Prem
> 
> 
> 
> --
> Prem
> 
> On Wed, Sep 27, 2017 at 11:08 PM, Peter Maydell
> <peter.maydell@linaro.org <mailto:peter.maydell@linaro.org>> wrote:
> 
>     On 1 September 2017 at 10:21, Eric Auger <eric.auger@redhat.com
>     <mailto:eric.auger@redhat.com>> wrote:
>     > The patch introduces the smmu base device and class for the ARM
>     > smmu. Devices for specific versions will be derived from this
>     > base device.
>     >
>     > We also introduce some important datatypes.
>     >
>     > Signed-off-by: Eric Auger <eric.auger@redhat.com <mailto:eric.auger@redhat.com>>
>     > Signed-off-by: Prem Mallappa <prem.mallappa@broadcom.com <mailto:prem.mallappa@broadcom.com>>
> 
>     > +/*
>     > + * Copyright (C) 2014-2016 Broadcom Corporation
>     > + * Copyright (c) 2017 Red Hat, Inc.
>     > + * Written by Prem Mallappa, Eric Auger
>     > + *
>     > + * This program is free software; you can redistribute it and/or modify
>     > + * it under the terms of the GNU General Public License version 2 as
>     > + * published by the Free Software Foundation.
> 
>     Really GPL-2-only ?
> 
>     Unless there's a good reason, you should probably fix this (including
>     getting an ack from Prem/Broadcom where it applies to code that came
>     from him).
> 
>     thanks
>     -- PMM
> 
> 
