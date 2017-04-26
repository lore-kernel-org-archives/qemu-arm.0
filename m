Received: by 10.25.0.144 with SMTP id 138csp223254lfa;
        Wed, 26 Apr 2017 04:06:29 -0700 (PDT)
X-Received: by 10.200.38.132 with SMTP id 4mr33576925qto.99.1493204789039;
        Wed, 26 Apr 2017 04:06:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t26si20258994qki.192.2017.04.26.04.06.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Apr 2017 04:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54297 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d3KmC-0002CA-IJ
	for alex.bennee@linaro.org; Wed, 26 Apr 2017 07:06:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d3KkR-0000uc-IZ
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 07:04:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d3KkN-0007C4-KT
	for qemu-arm@nongnu.org; Wed, 26 Apr 2017 07:04:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40128)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d3KkN-0007Bu-Ei; Wed, 26 Apr 2017 07:04:35 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D8AC8048D;
	Wed, 26 Apr 2017 11:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1D8AC8048D
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1D8AC8048D
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8DEF78AC0B;
	Wed, 26 Apr 2017 11:04:33 +0000 (UTC)
Date: Wed, 26 Apr 2017 08:04:32 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170426110432.GT3482@thinpad.lan.raisama.net>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
	<1490189568-167621-11-git-send-email-imammedo@redhat.com>
	<20170412211529.GD27126@thinpad.lan.raisama.net>
	<20170419115245.5855f624@nial.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170419115245.5855f624@nial.brq.redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 26 Apr 2017 11:04:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10 10/23] numa: mirror cpu
 to node mapping in MachineState::possible_cpus
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
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2yQKPRZpaASO

On Wed, Apr 19, 2017 at 11:52:45AM +0200, Igor Mammedov wrote:
> On Wed, 12 Apr 2017 18:15:29 -0300
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > On Wed, Mar 22, 2017 at 02:32:35PM +0100, Igor Mammedov wrote:
> > > Introduce machine_set_cpu_numa_node() helper that stores
> > > node mapping for CPU in MachineState::possible_cpus.
> > > CPU and node it belongs to is specified by 'props' argument.
> > > 
> > > Patch doesn't remove old way of storing mapping in
> > > numa_info[X].node_cpu as removing it at the same time
> > > makes patch rather big. Instead it just mirrors mapping
> > > in possible_cpus and follow up per target patches will
> > > switch to possible_cpus and numa_info[X].node_cpu will
> > > be removed once there isn't any users left.
> > > 
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> > 
> > So, this patch is the one that makes "-numa" and "-numa cpu"
> > affect query-hotpluggable-cpus output.
> that was intent behind series.
> 
> [...]
> > As noted in another message, I am not sure we really should make
> > "-numa" affect query-hotpluggable-cpus output unconditionally (I
> > believe we shouldn't). But we do, we need to document this very
> > clearly.
> What place would you suggest to document this at?

qemu-options.hx documentation for -numa cpu, NumaCpuOptions docs
on qapi-schema, and/or query-hotpluggable-cpus docs on
qapi-schema.

-- 
Eduardo
