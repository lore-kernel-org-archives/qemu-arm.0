Received: by 10.25.21.156 with SMTP id 28csp1497099lfv;
        Mon, 11 Jul 2016 07:23:27 -0700 (PDT)
X-Received: by 10.55.209.207 with SMTP id o76mr25389005qkl.144.1468247007312;
        Mon, 11 Jul 2016 07:23:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p18si1921432qtp.80.2016.07.11.07.23.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jul 2016 07:23:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMc7K-0000f4-MG
	for alex.bennee@linaro.org; Mon, 11 Jul 2016 10:23:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bMc7C-0000Y8-S6
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 10:23:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1bMc78-0003VM-Ld
	for qemu-arm@nongnu.org; Mon, 11 Jul 2016 10:23:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59424)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1bMc78-0003VD-Fg; Mon, 11 Jul 2016 10:23:14 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDD78C04B332;
	Mon, 11 Jul 2016 14:23:13 +0000 (UTC)
Received: from nial.brq.redhat.com (dhcp-1-118.brq.redhat.com [10.34.1.118])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6BENBN4028463; Mon, 11 Jul 2016 10:23:11 -0400
Date: Mon, 11 Jul 2016 16:23:08 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20160711162308.2a646e78@nial.brq.redhat.com>
In-Reply-To: <1465580427-13596-4-git-send-email-drjones@redhat.com>
References: <1465580427-13596-1-git-send-email-drjones@redhat.com>
	<1465580427-13596-4-git-send-email-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 11 Jul 2016 14:23:13 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH RFC 03/16] hw/smbios/smbios: fix number of
 sockets calculation
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, qemu-devel@nongnu.org,
	agraf@suse.de, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	dgibson@redhat.com, pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SAdvjwtoFu9Y

On Fri, 10 Jun 2016 19:40:14 +0200
Andrew Jones <drjones@redhat.com> wrote:

> The specification "sect. 7.5 Processor Information (Type 4)" says
>  "NOTE One structure is provided for each processor instance in a
>   system. For example, a system that supports up to two processors
>   includes two Processor Information structures - even if only one
>   processor is currently installed..."
> 
> We should use max_cpus in the calculation. The rounding is still
> necessary, since smp_cores and smp_threads may have been calculated
> based on smp_cpus, rather than max_cpus. The rounding is safe,
> because smp_parse will fail when the result produces a topology
> supporting more cpus than max_cpus.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/smbios/smbios.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index cb8a1111029cf..cf18ecfd8599c 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -881,7 +881,7 @@ void smbios_get_tables(const struct smbios_phys_mem_area *mem_array,
>          smbios_build_type_2_table();
>          smbios_build_type_3_table();
>  
> -        smbios_smp_sockets = DIV_ROUND_UP(smp_cpus, smp_cores * smp_threads);
> +        smbios_smp_sockets = DIV_ROUND_UP(max_cpus, smp_cores * smp_threads);
>          assert(smbios_smp_sockets >= 1);
>  
>          for (i = 0; i < smbios_smp_sockets; i++) {

