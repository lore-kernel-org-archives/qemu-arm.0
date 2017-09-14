Received: by 10.223.172.38 with SMTP id v35csp652530wrc;
        Thu, 14 Sep 2017 02:50:32 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBZ1cIbG1Af+SrItYYl5vct3dyklTWx3ploiqlboq20FM91ltdQFQga1bYCoX6v7/bv6z/x
X-Received: by 10.237.59.25 with SMTP id p25mr12834235qte.99.1505382632827;
        Thu, 14 Sep 2017 02:50:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505382632; cv=none;
        d=google.com; s=arc-20160816;
        b=CoqjmMNjJ1vf7X8Th1yao18/LAugL4YL4fe61ni4jgVVdMeUOZBsX5xN2S7JEVdOnw
         OGHEKagNSOSqzpeAv27/FynkWjILUUj+/YeVDqWZ+xs2rfhXnxa0Xjx0kaNx6BtmZrdl
         72yPobhn5y8/Iv69kfPNlrIBa1L0/fJn+TEPaEakIbgNSDbqDO/lfaur9JvOhcZWxN86
         7Jzr/WbYXnacLz4K3+5bNenl4QJEDFlFNQ3zHgLMcA5gNs2ybsE6abaQoVJbQS2+QjDu
         xn+G4r+qj+lzbmHSRNv6YzJkmrcCGYhRcmeDHcVGkyxuJdWCNnK3HfK/OOdmKVllZy3y
         Bruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=Mp+RylAYCkopGix6Dna2+Pb6tdIfky3d4lrs86kk77w=;
        b=xQzuzSYSsKH5q8ZOqLRTgvhRfEDrbpexU9JgMXu/rQO6TxcgOOSXoaxpn4DMF2Yl4l
         a61fktNE43BgKduMXWCO1i3p5yfW6++YBm9Yz95sDxzGAK7RIzFpdePnKlyf8NUx4vMG
         WJPmOp/dpKkVDZtp6NgGMOYV+izkTDoeLP3GrPa7MY+Tro46+e29czstcZJTqaWms8OV
         /lyL2Stc7TE0n258D2wD1y4H3joxAHsfxeyIDBezKqEZ02euvZFLwPg/rUEdFWbWRIia
         mRCaaAPepiOSGrIOhQlkAQgwbSZ+xzyHdKW/q7pizFK7I07CZ4JgtsPMb4gL+8A2kUaj
         mDmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22si18545121qkp.389.2017.09.14.02.50.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 02:50:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsQn0-0007dg-Hz
	for alex.bennee@linaro.org; Thu, 14 Sep 2017 05:50:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53650)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dsQmo-0007cX-Hm
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 05:50:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1dsQmj-0003hH-M3
	for qemu-arm@nongnu.org; Thu, 14 Sep 2017 05:50:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47362)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1dsQmj-0003fl-Fj; Thu, 14 Sep 2017 05:50:13 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6BAAC801;
	Thu, 14 Sep 2017 09:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 6BAAC801
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=dgilbert@redhat.com
Received: from work-vm (ovpn-117-192.ams2.redhat.com [10.36.117.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62A196F445;
	Thu, 14 Sep 2017 09:50:03 +0000 (UTC)
Date: Thu, 14 Sep 2017 10:50:01 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20170914095000.GB3982@work-vm>
References: <20170913142036.2469-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170913142036.2469-1-lvivier@redhat.com>
User-Agent: Mutt/1.8.3 (2017-05-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 14 Sep 2017 09:50:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 0/4] hmp: fix "dump-quest-memory" segfault
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
	peterx@redhat.com, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ncEA+SrKvA0C

* Laurent Vivier (lvivier@redhat.com) wrote:
> Fix aarch64 and ppc when dump-guest-memory is
> used with none machine type and no CPU.
> 
> The other machine types don't have the problem.
> 
> Update test-hmp, to test none machine type
> with (2 MB) and without memory, and add a test
> to test dump-quest-memory without filter parameters

Queued for HMP

Dave

> 
> v4:
>   - update comment in test-hmp.c
>   - add cohuck's patch
> 
> v3:
>   - remove blank line after a comment
>   - forbid memory dump when there is no CPU
> 
> v2:
>   - add arm fix
>   - update test-hmp
> 
> Cornelia Huck (1):
>   dump: do not dump non-existent guest memory
> 
> Laurent Vivier (3):
>   hmp: fix "dump-quest-memory" segfault (ppc)
>   hmp: fix "dump-quest-memory" segfault (arm)
>   tests/hmp: test "none" machine with memory
> 
>  dump.c                 |  6 ++++++
>  target/arm/arch_dump.c | 11 +++++++++--
>  target/ppc/arch_dump.c | 11 +++++++++--
>  tests/test-hmp.c       |  4 ++++
>  4 files changed, 28 insertions(+), 4 deletions(-)
> 
> -- 
> 2.13.5
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
