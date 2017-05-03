Received: by 10.25.0.198 with SMTP id 189csp215245lfa;
        Wed, 3 May 2017 10:58:15 -0700 (PDT)
X-Received: by 10.55.21.154 with SMTP id 26mr3920546qkv.287.1493834295521;
        Wed, 03 May 2017 10:58:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d12si2324103qkb.95.2017.05.03.10.58.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 10:58:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38044 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5yXU-0000Y1-RQ
	for alex.bennee@linaro.org; Wed, 03 May 2017 13:58:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5yXQ-0000XB-M9
	for qemu-arm@nongnu.org; Wed, 03 May 2017 13:58:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5yXN-0001Tj-KQ
	for qemu-arm@nongnu.org; Wed, 03 May 2017 13:58:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47814)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d5yXN-0001Sr-EF; Wed, 03 May 2017 13:58:05 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1A4D3C04B946;
	Wed,  3 May 2017 17:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 1A4D3C04B946
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 1A4D3C04B946
Received: from localhost (ovpn-116-40.gru2.redhat.com [10.97.116.40])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 60B7477524;
	Wed,  3 May 2017 17:58:03 +0000 (UTC)
Date: Wed, 3 May 2017 14:58:02 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20170503175802.GU3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-24-git-send-email-imammedo@redhat.com>
	<20170503163543.GR3482@thinpad.lan.raisama.net>
	<5f71cfda-2a73-77e3-0bf7-85e2aed53811@redhat.com>
	<20170503173841.GT3482@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170503173841.GT3482@thinpad.lan.raisama.net>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 03 May 2017 17:58:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 23/24] numa: add '-numa cpu,
 ...' option for property based node mapping
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
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org,
	Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nCwpJeL0k8Fy

On Wed, May 03, 2017 at 02:38:41PM -0300, Eduardo Habkost wrote:
> On Wed, May 03, 2017 at 11:39:10AM -0500, Eric Blake wrote:
> > On 05/03/2017 11:35 AM, Eduardo Habkost wrote:
> > 
> > >> +
> > >> +        memset(&cpu, 0, sizeof(cpu));
> > >> +        cpu.has_node_id = object->u.cpu.has_node_id;
> > >> +        cpu.node_id = object->u.cpu.node_id;
> > >> +        cpu.has_socket_id = object->u.cpu.has_socket_id;
> > >> +        cpu.socket_id = object->u.cpu.socket_id;
> > >> +        cpu.has_core_id = object->u.cpu.has_core_id;
> > >> +        cpu.core_id = object->u.cpu.core_id;
> > >> +        cpu.has_thread_id = object->u.cpu.has_thread_id;
> > >> +        cpu.thread_id = object->u.cpu.thread_id;
> > > 
> > > We don't have a way to avoid copying each field individually?
> > > Some visitor trick, maybe?
> > > 
> > > Eric, Markus, Michael, do you have any suggestions?
> > 
> > Markus just added QAPI_CLONE_MEMBERS(), which sounds like what you want:
> > 
> > https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg04867.html
> 
> Not sure if it would work in this case. Note that cpu and
> object->u.cpu have different types. 'cpu' is CpuInstanceProps,
> but object->u.cpu is NodeCpuOptions.
> 
> NodeCpuOptions has { 'base': 'CpuInstanceProps' }, and
> CpuInstanceProps field declarations are duplicated in struct
> NodeCpuOptions. Do you know why struct inheritance is implemented
> by duplicating the fields of the base struct instead of embedding
> the base struct?

Nevermind, I just found out that QAPI generates a
qapi_NumaCpuOptions_base() upcast helper. So this can be solved
with no data copying at all:

 machine_set_cpu_numa_nodes(ms, qapi_NumaCpuOptions_base(&object->u.cpu), &err);

-- 
Eduardo
