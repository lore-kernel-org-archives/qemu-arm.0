Received: by 10.25.77.65 with SMTP id a62csp330887lfb;
        Thu, 26 Jan 2017 09:59:51 -0800 (PST)
X-Received: by 10.55.20.22 with SMTP id e22mr4352975qkh.139.1485453591068;
        Thu, 26 Jan 2017 09:59:51 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e63si1664067qtd.131.2017.01.26.09.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 09:59:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40326 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWoKq-0003oY-Fy
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 12:59:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50108)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cWoKg-0003fF-7N
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 12:59:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cWoKd-0002Zl-39
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 12:59:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38826)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cWoKc-0002ZV-R3; Thu, 26 Jan 2017 12:59:35 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C243EC0567B3;
	Thu, 26 Jan 2017 17:59:34 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0QHxV1X006943
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 26 Jan 2017 12:59:32 -0500
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1485443388-27253-1-git-send-email-armbru@redhat.com>
	<1485443388-27253-5-git-send-email-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a3509663-3b80-3eab-73ac-f31027d68c87@redhat.com>
Date: Thu, 26 Jan 2017 18:59:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1485443388-27253-5-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 26 Jan 2017 17:59:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/8] hw: Default -drive to
 if=none instead of scsi when scsi cannot work
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
Cc: kwolf@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
	qemu-block@nongnu.org, Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: goy8CLjI9MZh

On 26.01.2017 16:09, Markus Armbruster wrote:
> Block backends defined with -drive if=scsi are meant to be picked up
> by machine initialization code: a suitable frontend gets created and
> wired up automatically.
> 
> if=scsi drives not picked up that way can still be used with -device
> as if they had if=none, but that's unclean and best avoided.  Unused
> ones produce an "Orphaned drive without device" warning.
> 
> A few machine types default to if=scsi, even though they don't
> actually have a SCSI HBA.  This makes no sense.  Change their default
> to if=none.  Affected machines:
> 
> * aarch64/arm: realview-pbx-a9 vexpress-a9 vexpress-a15 xilinx-zynq-a9
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Alistair Francis <alistair.francis@xilinx.com>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/arm/realview.c    | 1 -
>  hw/arm/vexpress.c    | 1 -
>  hw/arm/xilinx_zynq.c | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/hw/arm/realview.c b/hw/arm/realview.c
> index 8eafcca..8c11c7a 100644
> --- a/hw/arm/realview.c
> +++ b/hw/arm/realview.c
> @@ -443,7 +443,6 @@ static void realview_pbx_a9_class_init(ObjectClass *oc, void *data)
>  
>      mc->desc = "ARM RealView Platform Baseboard Explore for Cortex-A9";
>      mc->init = realview_pbx_a9_init;
> -    mc->block_default_type = IF_SCSI;
>      mc->max_cpus = 4;
>  }
>  
> diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
> index 58760f4..5756470 100644
> --- a/hw/arm/vexpress.c
> +++ b/hw/arm/vexpress.c
> @@ -751,7 +751,6 @@ static void vexpress_class_init(ObjectClass *oc, void *data)
>  
>      mc->desc = "ARM Versatile Express";
>      mc->init = vexpress_common_init;
> -    mc->block_default_type = IF_SCSI;
>      mc->max_cpus = 4;
>  }
>  
> diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
> index 7dac20d..3985356 100644
> --- a/hw/arm/xilinx_zynq.c
> +++ b/hw/arm/xilinx_zynq.c
> @@ -323,7 +323,6 @@ static void zynq_machine_init(MachineClass *mc)
>  {
>      mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
>      mc->init = zynq_init;
> -    mc->block_default_type = IF_SCSI;
>      mc->max_cpus = 1;
>      mc->no_sdcard = 1;
>  }

Right, that looks like old copy-n-paste bugs from other machine types.

Reviewed-by: Thomas Huth <thuth@redhat.com>

