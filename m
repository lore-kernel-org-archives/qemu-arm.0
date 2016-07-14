Received: by 10.25.21.156 with SMTP id 28csp277198lfv;
        Thu, 14 Jul 2016 13:34:59 -0700 (PDT)
X-Received: by 10.55.10.147 with SMTP id 141mr19712275qkk.42.1468528499071;
        Thu, 14 Jul 2016 13:34:59 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r67si1634620qka.282.2016.07.14.13.34.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jul 2016 13:34:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bNnLW-00080M-FP
	for alex.bennee@linaro.org; Thu, 14 Jul 2016 16:34:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bNnJw-0006lp-0W
	for qemu-devel@nongnu.org; Thu, 14 Jul 2016 16:33:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bNnJr-0003mq-K3
	for qemu-devel@nongnu.org; Thu, 14 Jul 2016 16:33:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35328)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bNnJm-0003kp-5Q; Thu, 14 Jul 2016 16:33:10 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A1C5D142583;
	Thu, 14 Jul 2016 20:33:09 +0000 (UTC)
Received: from localhost (vpn1-5-31.gru2.redhat.com [10.97.5.31])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6EKX7mc020791; Thu, 14 Jul 2016 16:33:08 -0400
Date: Thu, 14 Jul 2016 17:33:05 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160714203305.GF31865@thinpad.lan.raisama.net>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-10-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465580427-13596-10-git-send-email-drjones@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 14 Jul 2016 20:33:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH RFC 09/16] hw/i386/pc: don't use smp_cores,
 smp_threads
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
Cc: peter.maydell@linaro.org, imammedo@redhat.com, qemu-devel@nongnu.org,
	agraf@suse.de, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	dgibson@redhat.com, pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: omaJT6pstfWK

On Fri, Jun 10, 2016 at 07:40:20PM +0200, Andrew Jones wrote:
[...]
> @@ -1940,9 +1943,10 @@ static void pc_machine_reset(void)
>  
>  static unsigned pc_cpu_index_to_socket_id(unsigned cpu_index)
>  {
> +    CPUState *cs = first_cpu;

Eww.

>      X86CPUTopoInfo topo;
> -    x86_topo_ids_from_idx(smp_cores, smp_threads, cpu_index,
> -                          &topo);
> +
> +    x86_topo_ids_from_idx(cs->nr_cores, cs->nr_threads, cpu_index, &topo);

If first_cpu is already available[1], then current_machine would
also be available. Better to use the new MachineState fields you
added, than the CPUState::nr_{cores,threads} fields that
shouldn't have existed in the first place.

[1] Is it really available? This function is called very early,
    from parse_numa_opts(). I think current_machine is already
    available, though. But we need to ensure parse_numa_opts()
    will be called only after SMP option parsing is done and SMP
    topology data in MachineState is already populated.

    Later, we could also make the NUMA option parsing not depend
    on SMP parsing to be done first. The cpu_index_to_socket_id()
    magic can be moved to numa_post_machine_init(), probably.

-- 
Eduardo
