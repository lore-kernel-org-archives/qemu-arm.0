Received: by 10.25.15.230 with SMTP id 99csp627336lfp;
        Thu, 23 Mar 2017 00:44:47 -0700 (PDT)
X-Received: by 10.55.19.167 with SMTP id 39mr798133qkt.276.1490255087861;
        Thu, 23 Mar 2017 00:44:47 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r35si3050362qte.243.2017.03.23.00.44.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Mar 2017 00:44:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cqxQN-0001R9-Bh
	for alex.bennee@linaro.org; Thu, 23 Mar 2017 03:44:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cqxQJ-0001QC-FB
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 03:44:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1cqxQG-0004fT-DI
	for qemu-arm@nongnu.org; Thu, 23 Mar 2017 03:44:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41876)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1cqxQG-0004fI-7O; Thu, 23 Mar 2017 03:44:40 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 21185437F7C;
	Thu, 23 Mar 2017 07:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 21185437F7C
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 21185437F7C
Received: from hawk.localdomain (ovpn-204-115.brq.redhat.com [10.40.204.115])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEDB25DD62;
	Thu, 23 Mar 2017 07:44:35 +0000 (UTC)
Date: Thu, 23 Mar 2017 08:44:33 +0100
From: Andrew Jones <drjones@redhat.com>
To: He Chen <he.chen@linux.intel.com>
Message-ID: <20170323074433.u6irjyrmq2gcnpaj@hawk.localdomain>
References: <1490175166-19785-1-git-send-email-he.chen@linux.intel.com>
	<20170322103405.rcye74zye6gvrfis@hawk.localdomain>
	<20170323072335.GC10166@he>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170323072335.GC10166@he>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 23 Mar 2017 07:44:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3] Allow setting NUMA distance
 for different NUMA nodes
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T7266RS8YahB

On Thu, Mar 23, 2017 at 03:23:35PM +0800, He Chen wrote:
> > 
> > And maybe should also point out how to set an unreachable node with 255.
> > 
> Thanks for your careful review. Regarding setting unreachable node,
> which way is good? Set exact 255 as distance or distance that is larger
> than 255 is regarded as unreachable?

If a numeric distance is to be used, then I think following the spec with
255 is best. Alternatively, we could have something like
'-numa dist,src=0,dst=1,unreachable', rather than specifying val at all,
but, IMO, it's not worth it.

Thanks,
drew
