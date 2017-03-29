Received: by 10.25.15.230 with SMTP id 99csp2056752lfp;
        Wed, 29 Mar 2017 05:30:56 -0700 (PDT)
X-Received: by 10.200.44.235 with SMTP id 40mr264436qtx.178.1490790656810;
        Wed, 29 Mar 2017 05:30:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d203si6069416qkc.148.2017.03.29.05.30.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 29 Mar 2017 05:30:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58885 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ctCka-0003RU-Av
	for alex.bennee@linaro.org; Wed, 29 Mar 2017 08:30:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ctCkV-0003RB-8s
	for qemu-arm@nongnu.org; Wed, 29 Mar 2017 08:30:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ctCkS-0004lo-5N
	for qemu-arm@nongnu.org; Wed, 29 Mar 2017 08:30:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49810)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1ctCkR-0004lS-Vh; Wed, 29 Mar 2017 08:30:48 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 228058FCE8;
	Wed, 29 Mar 2017 12:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 228058FCE8
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx02.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 228058FCE8
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 29AF67E698;
	Wed, 29 Mar 2017 12:30:41 +0000 (UTC)
Date: Wed, 29 Mar 2017 14:30:38 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170329123038.u6ebwn2xazbzr4nv@kamzik.brq.redhat.com>
References: <1490175166-19785-1-git-send-email-he.chen@linux.intel.com>
	<20170323102955.5e2d1c65@nial.brq.redhat.com>
	<20170329085000.GA20377@he>
	<20170329134458.793e882d@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170329134458.793e882d@nial.brq.redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 29 Mar 2017 12:30:46 +0000 (UTC)
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>,
	He Chen <he.chen@linux.intel.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ORbSd1jrpa+

On Wed, Mar 29, 2017 at 01:44:58PM +0200, Igor Mammedov wrote:
> On Wed, 29 Mar 2017 16:50:00 +0800
> He Chen <he.chen@linux.intel.com> wrote:
> > > > +static void default_numa_distance(void)
> > > > +{
> > > > +    int src, dst;
> > > > +  
> > > fill in defaults only if there weren't any '-numa dist' on CLI
> > > and refuse to start if partial filled table were explicitly provided on CLI
> > >   
> > I am afraid that I may have a bad function name here, fill_numa_distance
> > might be a better name?
> > 
> > Also, since the distance can be asymmetric, IMHO, providing a partial
> > filled table looks fine. If we set many NUMA nodes e.g. 8 nodes for
> > guest, the whole filled table would require many command lines which
> > might be inconvenient and less flexible.
> asymmetric doesn't imply sparse, so one has to specify full matrix
> it might be inconvenient /long/ but is very flexible.

This makes me realize that a user only inputting one of A -> B or B -> A
command line inputs doesn't imply symmetry.  It could be that the user
just forgot to input the opposite.  To avoid the ambiguity we either need
to force both to be input (as it was before I suggested otherwise), or
add a '-numa symmetric' type of property to enable the shortcut.  I guess
we should just avoid the shortcut, at least for now.

Thanks,
drew
