Received: by 10.103.124.15 with SMTP id x15csp1893965vsc;
        Tue, 23 May 2017 08:44:21 -0700 (PDT)
X-Received: by 10.55.217.155 with SMTP id q27mr28889675qkl.217.1495554261467;
        Tue, 23 May 2017 08:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495554261; cv=none;
        d=google.com; s=arc-20160816;
        b=jnV6t5Wpgcd9oTON1hz50FhvWbgXvBBuz5RkJ2eYFR0YbXJEnq6wVKezEjg6AlaIj5
         BD5jE/rWQz/gJYeekVwSwX3O77P6eD8yBMehQ1Z6icDm1u8HQhJp+aFub77K2PTmbwwn
         QFCGrEij16YXbT2CaKcWj4aF2udRmac5BqNXs/aCi8ZqAk9pqKZMYPVoTvjDBNNuQ/uk
         Em9J3ju82Q5Q9haYm+XvaGs9G9aCVo68qgA6pPhbC7QSBSYV+o449Qf/GT8XNsEQTEPm
         2V3Q2RtTXfJwjqOrx446KIZGzp7lHvitgv4yZRcpF75gTGnoqanuotTQVY76rw9BkZbC
         DOWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=l+3YIItdC568S4Q8Bi/avHbGiEefdwVcWKH03XBJARc=;
        b=YL4qVfIjDu7d6tfNf+C/VXRkZBu68odUxFIQWYlUBaHUazYmJ4OZZBWoXiyGabbYYn
         9PysNwd4fRXZUKu4wfX/dI27Zy2YMxslNmFsbwE6tvNMhNH+bMgfPayDi33xSyXXAL9a
         DCcXkWDKXmDxwCHDM1CrsjTuZZqtl90oigbz7rarLnODKit0IWYs3UGfvnTqMu3nhaLA
         ZeJev1S2WQaBfmUcqw+D0bLW61unM0xhqxOTbmWm4zIOQmA/kIZhC7WewC4L6JC3LtxQ
         ylu27HbdbxH2KuWMDWF1cIg2XoG+/qokh+4Z2eRoiwQlCGB3BMsJYwmatOSuoKDlmXf7
         Xa0g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d84si22054226qkh.165.2017.05.23.08.44.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 May 2017 08:44:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49825 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dDByv-0000ta-2q
	for alex.bennee@linaro.org; Tue, 23 May 2017 11:44:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDByq-0000sD-Gf
	for qemu-arm@nongnu.org; Tue, 23 May 2017 11:44:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1dDBym-0002Ud-JB
	for qemu-arm@nongnu.org; Tue, 23 May 2017 11:44:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39098)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1dDBym-0002UL-Cl; Tue, 23 May 2017 11:44:12 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A31D07AE90;
	Tue, 23 May 2017 15:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com A31D07AE90
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=imammedo@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com A31D07AE90
Received: from Igors-MacBook-Pro.local (ovpn-112-23.ams2.redhat.com
	[10.36.112.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3B8877E470;
	Tue, 23 May 2017 15:44:06 +0000 (UTC)
Date: Tue, 23 May 2017 17:44:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20170523174403.26a69d7c@Igors-MacBook-Pro.local>
In-Reply-To: <20170523144854.GF32274@thinpad.lan.raisama.net>
References: <1495550330-34087-1-git-send-email-imammedo@redhat.com>
	<1495550330-34087-5-git-send-email-imammedo@redhat.com>
	<20170523144854.GF32274@thinpad.lan.raisama.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 23 May 2017 15:44:11 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 4/5] numa: fallback to default NUMA node
 instead of node 0
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7QBffVNW9Mvx

On Tue, 23 May 2017 11:48:54 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Tue, May 23, 2017 at 04:38:49PM +0200, Igor Mammedov wrote:
> > Do the same as we did in commit
> >   (57924bcd8 numa: introduce machine callback for VCPU to node mapping)
> > but only for incomplete mapping usecase, falling back to board
> > provided default cpu to node mapping if user hasn't provided
> > mapping for CPU explicitly.
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> 
> This breaks migration compatibility, doesn't it? I understand
> this use case is not supported, but if are going to break stuff
> for people using incomplete mappings (by rejecting the
> configuration on a future release), I would prefer to break it
> only once.
it's firmware change and we generally don't care nor maintain firmware compat stuff
the same as with above mentioned 
 (57924bcd8 numa: introduce machine callback for VCPU to node mapping)

> 
> > ---
> >  hw/core/machine.c | 3 ---
> >  1 file changed, 3 deletions(-)
> > 
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index 964b75d..b8df15f 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -730,9 +730,6 @@ static void machine_numa_finish_init(MachineState *machine)
> >                  g_string_append_printf(s, "%sCPU %d [%s]",
> >                                         s->len ? ", " : "", i, cpu_str);
> >                  g_free(cpu_str);
> > -
> > -                /* non mapped cpus used to fallback to node 0 */
> > -                props.node_id = 0;
> >              }
> >  
> >              props.has_node_id = true;
> > -- 
> > 2.7.4
> > 
> 

