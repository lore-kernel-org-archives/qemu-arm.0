Received: by 10.25.0.198 with SMTP id 189csp142048lfa;
        Wed, 3 May 2017 08:00:57 -0700 (PDT)
X-Received: by 10.200.50.101 with SMTP id y34mr35290846qta.31.1493823657540;
        Wed, 03 May 2017 08:00:57 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r25si1947626qki.133.2017.05.03.08.00.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 May 2017 08:00:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d5vlx-0000vD-1q
	for alex.bennee@linaro.org; Wed, 03 May 2017 11:00:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5vkj-0008WI-6C
	for qemu-devel@nongnu.org; Wed, 03 May 2017 10:59:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1d5vki-0000o5-JD
	for qemu-devel@nongnu.org; Wed, 03 May 2017 10:59:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50536)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1d5vkg-0000mN-Pi; Wed, 03 May 2017 10:59:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8DBAA7D4E7;
	Wed,  3 May 2017 14:59:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 8DBAA7D4E7
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=ehabkost@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 8DBAA7D4E7
Received: from localhost (ovpn-116-4.gru2.redhat.com [10.97.116.4])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D56E1836C;
	Wed,  3 May 2017 14:59:36 +0000 (UTC)
Date: Wed, 3 May 2017 11:59:35 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20170503145935.GN3482@thinpad.lan.raisama.net>
References: <1493816238-33120-1-git-send-email-imammedo@redhat.com>
	<1493816238-33120-6-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1493816238-33120-6-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 03 May 2017 14:59:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 05/24] numa: move source of default CPUs
 to NUMA node mapping into boards
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aGuKnQapumt8

On Wed, May 03, 2017 at 02:56:59PM +0200, Igor Mammedov wrote:
[...]
> @@ -378,14 +379,16 @@ void parse_numa_opts(MachineClass *mc)
>           * rule grouping VCPUs by socket so that VCPUs from the same socket
>           * would be on the same node.
>           */
> +        if (!mc->cpu_index_to_instance_props) {
> +            error_report("default CPUs to NUMA node mapping isn't supported");
> +            exit(1);
> +        }

This will make people trying to use -numa on unsupported machines
see a misleading error message: instead of telling them that the
machine doesn't support NUMA at all, the message seems to imply
that NUMA may be supported and we just don't have default NUMA node
mapping support.

Probably a more generic "NUMA is not supported by this
machine-type" message before even trying to parse -numa would be
clearer. (I don't know if another patch in this series already
does that.)

-- 
Eduardo
