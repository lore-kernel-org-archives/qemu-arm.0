Received: by 10.25.0.23 with SMTP id 23csp40341lfa;
        Fri, 2 Jun 2017 10:16:49 -0700 (PDT)
X-Received: by 10.200.37.165 with SMTP id e34mr10333606qte.112.1496423809404;
        Fri, 02 Jun 2017 10:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496423809; cv=none;
        d=google.com; s=arc-20160816;
        b=NOhhJxsnrmL4+k9K6dgGZB8jSbCp0zemaOjPfglgRPtVCVyjNG9hDOVJ+n6REMUXEc
         BykX8XjtlPNxYSCCwWmh7V+DXKU9zQJEJ5V/IPoR2JC/2AsyuDWKKTGmX66+SUyMVSNb
         vKkzfVXZRVcO2zn2Q6PLbrSOofXJLqKkjmoy1pqWar9lOGRVq3scYPgOe/JTi2LbvNrX
         zl9nc2fpRrgmq47UpWE42pygBgvyUVuLXV65iAz4+p+oms2tU0Os7D4lORz6ZH1z61AD
         fBYfBWFduwZ79EQ935R6rhRWBCF8vwZOBcMGAJyS52zM0dinvkeYMOeim5xtNEmZotZR
         23zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=8AQFB0qBKTS/bRiBViKxc4ENB68NKNTiMG2ZN/29q28=;
        b=Ex/rTiWsnyCG0MIHYFPVQPME8BznTHzqDSeXga07fJtfHBzCq4hp1GXwCWr2iFWk8U
         lC7hkVDZWYfvyWE+pcObIAv8yuW7CHr/U8DIUwJB+nBuEskxygUGRlK8W94az0C6u4rf
         EJnGgx66UrzjfSL38hksN9W69ufHyjEELlyy2ULL0nIpccWs+um8wsUO5jf794XAYErb
         t3ZA9g5hT6HnFphnNZj8B/t8G3+15JqKqRgbsrCRJWA4/Ly59j3E+ZnZk2Cgk3szHc/A
         38/16EBG8DWDaly5hSQ9pbYKU27rfnLGvhDUKn9L4CdZn5OWd4AA1aXVzjruU7jdoJ9E
         gVpA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w207si3935806qkb.72.2017.06.02.10.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 10:16:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50897 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGqBq-0006Nu-MW
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 13:16:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44859)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dGqBn-0006No-Ad
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 13:16:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1dGqBk-0007Jk-KX
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 13:16:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37148)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1dGqBk-0007Jd-E3; Fri, 02 Jun 2017 13:16:40 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E533580480;
	Fri,  2 Jun 2017 17:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E533580480
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E533580480
Received: from localhost (ovpn-116-42.gru2.redhat.com [10.97.116.42])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 16F0F60BEF;
	Fri,  2 Jun 2017 17:16:37 +0000 (UTC)
Date: Fri, 2 Jun 2017 14:16:36 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170602171636.GF4294@thinpad.lan.raisama.net>
References: <20170531133201.GS32274@thinpad.lan.raisama.net>
	<1496314408-163972-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1496314408-163972-1-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 02 Jun 2017 17:16:39 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v4 7/7] numa: cpu: calculate/set default
 node-ids after all -numa CLI options are parsed
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
X-TUID: 07TWODuuUzL5

On Thu, Jun 01, 2017 at 12:53:28PM +0200, Igor Mammedov wrote:
> Calculating default node-ids for CPUs in possible_cpu_arch_ids()
> is rather fragile since defaults calculation uses nb_numa_nodes but
> callback might be potentially called early before all -numa CLI
> options are parsed, which would lead to cpus assigned only upto
> nb_numa_nodes at the time possible_cpu_arch_ids() is called.
> 
> Issue was introduced by
> (7c88e65 numa: mirror cpu to node mapping in MachineState::possible_cpus)
> and for example CLI:
>   -smp 4 -numa node,cpus=0 -numa node
> would set props.node-id in possible_cpus array for every non
> explicitly mapped CPU to the first node.
> 
> Issue is not visible to guest nor to mgmt interface due to
>   1) implictly mapped cpus are forced to the first node in
>      case of partial mapping
>   2) in case of default mapping possible_cpu_arch_ids() is
>      called after all -numa options are parsed (resulting
>      in correct mapping).
> 
> However it's fragile to rely on late execution of
> possible_cpu_arch_ids(), therefore add machine specific
> callback that returns node-id for CPU and use it to calculate/
> set defaults at machine_numa_finish_init() time when all -numa
> options are parsed.
> 
> Reported-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Queued on numa-next.  Thanks!

-- 
Eduardo
