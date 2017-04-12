Received: by 10.25.0.144 with SMTP id 138csp455695lfa;
        Wed, 12 Apr 2017 13:20:03 -0700 (PDT)
X-Received: by 10.55.78.201 with SMTP id c192mr17470510qkb.81.1492028403219;
        Wed, 12 Apr 2017 13:20:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 3si20485873qtz.30.2017.04.12.13.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Apr 2017 13:20:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyOkC-00052y-MS
	for alex.bennee@linaro.org; Wed, 12 Apr 2017 16:20:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58469)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cyOjG-0004Sv-Me
	for qemu-arm@nongnu.org; Wed, 12 Apr 2017 16:19:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1cyOjC-00087D-Mj
	for qemu-arm@nongnu.org; Wed, 12 Apr 2017 16:19:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60912)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1cyOjC-00086V-G3; Wed, 12 Apr 2017 16:18:58 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ADA687EBB6;
	Wed, 12 Apr 2017 20:18:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com ADA687EBB6
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com ADA687EBB6
Received: from localhost (ovpn-116-31.gru2.redhat.com [10.97.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EAB5018EFF;
	Wed, 12 Apr 2017 20:18:55 +0000 (UTC)
Date: Wed, 12 Apr 2017 17:18:54 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170412201854.GB27126@thinpad.lan.raisama.net>
References: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1490189568-167621-1-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 12 Apr 2017 20:18:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.10 00/23] numa: add '-numa
 cpu' option
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
X-TUID: PNl8t2czG5Cn

On Wed, Mar 22, 2017 at 02:32:25PM +0100, Igor Mammedov wrote:
> Changes since RFC:
>     * convert all targets that support numa (Eduardo)
>     * add numa CLI tests
>     * support wildcard matching with "-numa cpu,..." (Paolo)
> 
> Series introduces a new CLI option to allow mapping cpus to numa
> nodes using public properties [socket|core|thread]-ids instead of
> internal cpu_index and moving internal handling of cpu<->node
> mapping from cpu_index based global bitmaps to MachineState.
> 
> New '-numa cpu' option is supported only on PC and SPAPR
> machines that implement hotpluggable-cpus query.
> ARM machine user-facing interface stays cpu_index based due to
> lack of hotpluggable-cpus support, but internally cpu<->node
> mapping will be using the common for PC/SPAPR/ARM approach
> (i.e. store mapping info in MachineState:possible_cpus)
> 
> It only provides CLI interface to do mapping, there is no QMP
> one as I haven't found a suitable place/way to update/set mapping
> after machine_done for QEMU started with -S (stopped mode) so that
> mgmt could query hopluggable-cpus first, then map them to numa nodes
> in runtime before actually allowing guest to run.
> 
> Another alternative I've been considering is to add CLI option
> similar to -S but that would pause initialization before machine_init()
> callback is run so that user can get CPU layout with hopluggable-cpus,
> then map CPUs to numa nodes and unpause to let machine_init() initialize
> machine using previously predefined numa mapping.
> Such option might also be useful for other usecases.

I would support this approach. This would help on other use cases
as well, and it's what I suggsted at KVM Forum last year:
http://www.linux-kvm.org/images/4/46/03x06A-Eduardo_HabkostMachine-type_Introspection_and_Configuration_Where_Are_We_Going.pdf

But I would treat it as a future plan, as it might take some time
until we refactor the main-loop/QMP code to allow this to happen.

-- 
Eduardo
