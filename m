Received: by 10.25.15.230 with SMTP id 99csp2612208lfp;
        Thu, 30 Mar 2017 08:28:17 -0700 (PDT)
X-Received: by 10.200.47.129 with SMTP id l1mr349646qta.112.1490887697118;
        Thu, 30 Mar 2017 08:28:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c204si2082769qke.73.2017.03.30.08.28.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Mar 2017 08:28:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36342 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ctbzk-000612-Kv
	for alex.bennee@linaro.org; Thu, 30 Mar 2017 11:28:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ctbyB-00050M-FJ
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 11:26:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1ctby7-0007zV-G6
	for qemu-arm@nongnu.org; Thu, 30 Mar 2017 11:26:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37814)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1ctby7-0007yL-7o; Thu, 30 Mar 2017 11:26:35 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C1A5C83D;
	Thu, 30 Mar 2017 15:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8C1A5C83D
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=drjones@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8C1A5C83D
Received: from kamzik.brq.redhat.com (kamzik.brq.redhat.com [10.34.1.143])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AE748442B;
	Thu, 30 Mar 2017 15:26:28 +0000 (UTC)
Date: Thu, 30 Mar 2017 17:26:26 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170330152626.ndf2lvh3vz2u5gnw@kamzik.brq.redhat.com>
References: <1490175166-19785-1-git-send-email-he.chen@linux.intel.com>
	<20170323102955.5e2d1c65@nial.brq.redhat.com>
	<20170329085000.GA20377@he>
	<20170329134458.793e882d@nial.brq.redhat.com>
	<20170329123038.u6ebwn2xazbzr4nv@kamzik.brq.redhat.com>
	<20170330150048.GL3709@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170330150048.GL3709@thinpad.lan.raisama.net>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 30 Mar 2017 15:26:33 +0000 (UTC)
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
	"Michael S . Tsirkin" <mst@redhat.com>, He Chen <he.chen@linux.intel.com>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IIDDc6/dHTTn

On Thu, Mar 30, 2017 at 12:00:48PM -0300, Eduardo Habkost wrote:
> On Wed, Mar 29, 2017 at 02:30:38PM +0200, Andrew Jones wrote:
> > On Wed, Mar 29, 2017 at 01:44:58PM +0200, Igor Mammedov wrote:
> > > On Wed, 29 Mar 2017 16:50:00 +0800
> > > He Chen <he.chen@linux.intel.com> wrote:
> > > > > > +static void default_numa_distance(void)
> > > > > > +{
> > > > > > +    int src, dst;
> > > > > > +  
> > > > > fill in defaults only if there weren't any '-numa dist' on CLI
> > > > > and refuse to start if partial filled table were explicitly provided on CLI
> > > > >   
> > > > I am afraid that I may have a bad function name here, fill_numa_distance
> > > > might be a better name?
> > > > 
> > > > Also, since the distance can be asymmetric, IMHO, providing a partial
> > > > filled table looks fine. If we set many NUMA nodes e.g. 8 nodes for
> > > > guest, the whole filled table would require many command lines which
> > > > might be inconvenient and less flexible.
> > > asymmetric doesn't imply sparse, so one has to specify full matrix
> > > it might be inconvenient /long/ but is very flexible.
> > 
> > This makes me realize that a user only inputting one of A -> B or B -> A
> > command line inputs doesn't imply symmetry.  It could be that the user
> > just forgot to input the opposite.  To avoid the ambiguity we either need
> > to force both to be input (as it was before I suggested otherwise), or
> > add a '-numa symmetric' type of property to enable the shortcut.  I guess
> > we should just avoid the shortcut, at least for now.
> 
> Is protecting the user from one very specific (and very rare[1])
> mistake a good reason for making the automatic default less
> useful?

Maybe not, but creating new interfaces with known ambiguities isn't ideal
either.

> Requiring an explicit '-numa symmetric' option to enable
> the automatic default seems to defeat the purpose of having an
> automatic default, to me.

We could reverse it, '-numa asymmetric' could turn off the defaults
and abort on an incomplete table.


Or, we could leave it ambiguous, but improve the heuristic by requiring
all directions be given if even one direction has an asymmetric reverse
path given. With that, there's still a chance to let user error slip
through, but much less. I could live with that.

Thanks,
drew
