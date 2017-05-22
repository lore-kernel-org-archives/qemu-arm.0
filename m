Received: by 10.25.0.6 with SMTP id 6csp1264873lfa;
        Mon, 22 May 2017 00:58:55 -0700 (PDT)
X-Received: by 10.31.61.7 with SMTP id k7mr7702355vka.82.1495439934927;
        Mon, 22 May 2017 00:58:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495439934; cv=none;
        d=google.com; s=arc-20160816;
        b=AWenH/2Ov18mkW/3K4dOX/iS5/hs7LJzlWtM8j0ZdSAJzN3yceA+MS8p/jaBSwGOCE
         j+61VNxzccG+l6DyfFbBB5dpyKCUc+z7lQd2s6/f2P/X+WnjBpG/6slx7q8fJL06q4Xe
         Hmistn45Sv7Em6hCQy8KU/ERDIazGlC462dYGQn5SjtWq5EXzSCVYNt6j2jd797Q/7rd
         wg0yF2CkZ+HtGgRdx2yBAoY76SjLlQP93vL3QdpOukslGHoiX5riY+jLGzruZvBDALVo
         znXJvoYw/ABt9zY6rvtXX4ENoQ8LfrUGcby8GT5XUAG1qC7eyPf49GUrWe4qTs6By+WT
         3XqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=M69QHkNkL1ZmSkcsVo6q05gXTKfqoIBsRK/EZzmjVUg=;
        b=sS44DyqYDKk0Tfk09BEUV/2AC3CViIWaLmJ3K8o5GUD4w6OyTVvb9AafsTcJ2rcO5l
         4xznHM7VrN9A+1WeLzEvjlDGhoNwCaTcHrgApj4bij1yZ7+60L4ezFczX8CIjNKXMaKb
         qMlAPNZ/4w0xWE7RMk+CX9JQGPa9uYCQMklR0xDOVm7k4wUNHpFTdTrzdfAKtRoS9ApG
         uWGCNogp+gKDJ54LS7DpnPvs9UGyS+qxz8c32wwTrek53VqnxXvz27sb25J1aBC3T+Ua
         Pvvo/nvYh4VmIlhHX7/gRpsx0GuRNL/l9OEwTQRHVwBVwgYKbt1Q3acKzcl2vSTnW/Hz
         8XlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y18si5370660vky.115.2017.05.22.00.58.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 May 2017 00:58:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41187 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCiEw-0003SJ-Cs
	for alex.bennee@linaro.org; Mon, 22 May 2017 03:58:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dCiEp-0003Rx-43
	for qemu-arm@nongnu.org; Mon, 22 May 2017 03:58:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dCiEk-0002ls-8n
	for qemu-arm@nongnu.org; Mon, 22 May 2017 03:58:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47780)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dCiEk-0002ld-3Q; Mon, 22 May 2017 03:58:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ACB7C804F0;
	Mon, 22 May 2017 07:58:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com ACB7C804F0
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com ACB7C804F0
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CD9B77E8B;
	Mon, 22 May 2017 07:58:38 +0000 (UTC)
Date: Mon, 22 May 2017 09:58:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170522095836.59149abc@nial.brq.redhat.com>
In-Reply-To: <20170518182039.GO4748@thinpad.lan.raisama.net>
References: <1495094971-177754-1-git-send-email-imammedo@redhat.com>
	<1495094971-177754-4-git-send-email-imammedo@redhat.com>
	<20170518182039.GO4748@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Mon, 22 May 2017 07:58:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] numa: silence incomplete
 mapping warning under qtest
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
Cc: Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ZyHrwc9NS7H

On Thu, 18 May 2017 15:20:39 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, May 18, 2017 at 10:09:31AM +0200, Igor Mammedov wrote:
> > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>  
> 
> Where exactly is the test code that triggers those messages and
> requires this patch? I would like to document that in the commit
> message.

ok, I'll  mention test case in commit message on respin

> > ---
> > CC: Markus Armbruster <armbru@redhat.com>
> > 
> > ---
> >  hw/core/machine.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 2e91aa9..21ebef8 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -21,6 +21,7 @@
> >  #include "qemu/error-report.h"
> >  #include "qemu/cutils.h"
> >  #include "sysemu/numa.h"
> > +#include "sysemu/qtest.h"
> >  
> >  static char *machine_get_accel(Object *obj, Error **errp)
> >  {
> > @@ -732,7 +733,7 @@ static void machine_numa_finish_init(MachineState *machine)
> >              }
> >          }
> >      }
> > -    if (s->len) {
> > +    if (s->len && !qtest_enabled()) {
> >          error_report("warning: CPU(s) not present in any NUMA nodes: %s",
> >                       s->str);
> >          error_report("warning: All CPU(s) up to maxcpus should be described "
> > -- 
> > 2.7.4
> >   
> 

