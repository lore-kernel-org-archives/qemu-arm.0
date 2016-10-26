Received: by 10.80.166.35 with SMTP id d32csp209698edc;
        Wed, 26 Oct 2016 00:02:25 -0700 (PDT)
X-Received: by 10.55.182.4 with SMTP id g4mr69548qkf.120.1477465345030;
        Wed, 26 Oct 2016 00:02:25 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a20si453769qta.89.2016.10.26.00.02.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Oct 2016 00:02:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:60137 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bzIEC-0003O7-4p
	for alex.bennee@linaro.org; Wed, 26 Oct 2016 03:02:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41850)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bzIE8-0003N4-By
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 03:02:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1bzIE5-0006QS-9h
	for qemu-arm@nongnu.org; Wed, 26 Oct 2016 03:02:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52586)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1bzIE5-0006QE-3q; Wed, 26 Oct 2016 03:02:17 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 37FDA7F7A9;
	Wed, 26 Oct 2016 07:02:16 +0000 (UTC)
Received: from hawk.localdomain (ovpn-204-70.brq.redhat.com [10.40.204.70])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9Q72CjF016484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 26 Oct 2016 03:02:14 -0400
Date: Wed, 26 Oct 2016 09:02:11 +0200
From: Andrew Jones <drjones@redhat.com>
To: Wei Huang <wei@redhat.com>
Message-ID: <20161026070211.eomqqlb4whww6q3m@hawk.localdomain>
References: <1477463301-17175-1-git-send-email-wei@redhat.com>
	<1477463301-17175-3-git-send-email-wei@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477463301-17175-3-git-send-email-wei@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 26 Oct 2016 07:02:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V8 2/2] arm: virt: add PMU property to
 mach-virt machine type
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	abologna@redhat.com, shannon.zhao@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dl6yG8kicdrX

On Wed, Oct 26, 2016 at 02:28:21AM -0400, Wei Huang wrote:
> CPU vPMU is now turned ON by default, but this feature wasn't introduced
> until virt-2.7 machine type. To solve this problem, this patch adds a
> PMU option in machine state, which is used to control CPU's vPMU status.
> This PMU option is not exposed to command line and is turned off in
> virt-2.6 machine type.
> 
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 074d11c..e64dc4a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -85,6 +85,7 @@ typedef struct {
>      VirtBoardInfo *daughterboard;
>      bool disallow_affinity_adjustment;
>      bool no_its;
> +    bool no_pmu;
>  } VirtMachineClass;
>  
>  typedef struct {
> @@ -1353,6 +1354,10 @@ static void machvirt_init(MachineState *machine)
>              }
>          }
>  
> +        if (vmc->no_pmu && object_property_find(cpuobj, "pmu", NULL)) {
> +            object_property_set_bool(cpuobj, false, "pmu", NULL);
> +        }
> +
>          if (object_property_find(cpuobj, "reset-cbar", NULL)) {
>              object_property_set_int(cpuobj, vbi->memmap[VIRT_CPUPERIPHS].base,
>                                      "reset-cbar", &error_abort);
> @@ -1588,5 +1593,7 @@ static void virt_machine_2_6_options(MachineClass *mc)
>      virt_machine_2_7_options(mc);
>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_6);
>      vmc->disallow_affinity_adjustment = true;
> +    /* Disable PMU for 2.6 as PMU support was first introduced in 2.7 */
> +    vmc->no_pmu = true;
>  }
>  DEFINE_VIRT_MACHINE(2, 6)
> -- 
> 1.8.3.1
> 

Reviewed-by: Andrew Jones <drjones@redhat.com>
