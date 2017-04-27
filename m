Received: by 10.25.0.144 with SMTP id 138csp883400lfa;
        Thu, 27 Apr 2017 10:32:51 -0700 (PDT)
X-Received: by 10.31.110.194 with SMTP id j185mr3292340vkc.0.1493314371879;
        Thu, 27 Apr 2017 10:32:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e6si1807207vkh.76.2017.04.27.10.32.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 27 Apr 2017 10:32:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3nHf-0001Ob-Ak
	for alex.bennee@linaro.org; Thu, 27 Apr 2017 13:32:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d3nHX-0001OG-Tx
	for qemu-arm@nongnu.org; Thu, 27 Apr 2017 13:32:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d3nHS-0002mE-Tr
	for qemu-arm@nongnu.org; Thu, 27 Apr 2017 13:32:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34076)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d3nHS-0002ls-Kc; Thu, 27 Apr 2017 13:32:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3994C25BF71;
	Thu, 27 Apr 2017 17:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 3994C25BF71
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 3994C25BF71
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 86E1217143;
	Thu, 27 Apr 2017 17:32:36 +0000 (UTC)
Date: Thu, 27 Apr 2017 14:32:35 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170427173235.GI3482@thinpad.lan.raisama.net>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-8-git-send-email-imammedo@redhat.com>
	<20170412210239.GC27126@thinpad.lan.raisama.net>
	<20170419131458.59e2d00e@nial.brq.redhat.com>
	<20170426122138.GU3482@thinpad.lan.raisama.net>
	<20170427151406.57fbfa79@nial.brq.redhat.com>
	<20170427163225.GE3482@thinpad.lan.raisama.net>
	<20170427192523.296713a6@Igors-MacBook-Pro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170427192523.296713a6@Igors-MacBook-Pro.local>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 27 Apr 2017 17:32:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10 07/23] pc: add node-id
 property to CPU
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hDEEN2ReuH5m

On Thu, Apr 27, 2017 at 07:25:23PM +0200, Igor Mammedov wrote:
[...]
> > >  #
> > >  # A discriminated record of NUMA options. (for OptsVisitor)
> > >  #
> > > +# For 'cpu' type as arguments use a set of cpu properties returned
> > > +# by query-hotpluggable-cpus[].props, where node-id could be used
> > > +# to override default node mapping. Since: 2.10
> > > +#
> > >  # Since: 2.1
> > >  ##
> > >  { 'union': 'NumaOptions',
> > >    'base': { 'type': 'NumaOptionsType' },
> > >    'discriminator': 'type',
> > >    'data': {
> > > -    'node': 'NumaNodeOptions' }}
> > > +    'node': 'NumaNodeOptions',
> > > +    'cpu' : 'CpuInstanceProperties' }}
> > 
> > I worry about not being able to add extra options to "-numa cpu"
> > in the future without affecting HotpluggableCPU.props too. Being
> > able to document the semantics of -numa cpu inside a dedicated
> > NumaCpuOptions struct would be nice too.
> > 
> > I believe this can be addressed by defing "NumaCpuOptions" with
> > "CpuInstanceProperties" as base:
> > 
> >  { 'union': 'NumaOptions',
> >    'base': { 'type': 'NumaOptionsType' },
> >    'discriminator': 'type',
> >    'data': {
> >      'node': 'NumaNodeOptions',
> >      'cpu' : 'NumaCpuOptions' }}
> > 
> > ##
> > # Options for -numa cpu,...
> > #
> > # "-numa cpu" accepts the same set of cpu properties returned by
> > # query-hotpluggable-cpus[].props, where node-id could be used to
> > # override default node mapping.
> > #
> > # Since: 2.10
> > ##
> > { 'struct': 'NumaCpuOptions',
> >   'base': 'CpuInstanceProperties' }
> is it inheritance or encapsulation?

If I understood the docs correctly, it's inheritance. I didn't
test it, though.

> if it's encapsulation, wouldn't look nice, but we can
> duplicate fields from CpuInstanceProperties in NumaCpuOptions
> like you proposed below and marshal them into CpuInstanceProperties
> inside of parse_numa() where needed.

I think inheritance will work. But if it doesn't, I don't mind
either: we can duplicate the fields like you suggest, or use
CpuInstanceProperties directly like you did above.

-- 
Eduardo
