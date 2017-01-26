Received: by 10.25.77.65 with SMTP id a62csp336349lfb;
        Thu, 26 Jan 2017 10:11:03 -0800 (PST)
X-Received: by 10.55.181.198 with SMTP id e189mr4363770qkf.231.1485454262915;
        Thu, 26 Jan 2017 10:11:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w29si1688941qtc.100.2017.01.26.10.11.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 10:11:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40391 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWoVg-0008Me-Am
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 13:11:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cWoVZ-0008MX-58
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 13:10:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1cWoVU-00067O-NH
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 13:10:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43586)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1cWoVU-00066u-H9; Thu, 26 Jan 2017 13:10:48 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 84B10C057FA4;
	Thu, 26 Jan 2017 18:10:48 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0QIAirr003298
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 26 Jan 2017 13:10:46 -0500
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <1485443388-27253-1-git-send-email-armbru@redhat.com>
	<1485443388-27253-6-git-send-email-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9af8649f-d27f-7033-7e1d-6b67d3e9c8d9@redhat.com>
Date: Thu, 26 Jan 2017 19:10:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <1485443388-27253-6-git-send-email-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 26 Jan 2017 18:10:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 5/8] hw/arm/highbank: Default
 -drive to if=ide instead of if=scsi
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
Cc: kwolf@redhat.com, Rob Herring <robh@kernel.org>, qemu-block@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>, mreitz@redhat.com,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9SwtfUP/uD0y

On 26.01.2017 16:09, Markus Armbruster wrote:
> These machines have no onboard SCSI HBA, and no way to plug one.
> -drive if=scsi therefore cannot work.  They do have an onboard IDE
> controller (sysbus-ahci), but fail to honor if=ide.
> 
> Change their default to if=ide, and add a TODO comment on what needs
> to be done to actually honor -drive if=ide.
> 
> Cc: Rob Herring <robh@kernel.org>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/arm/highbank.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
> index 80e5fd4..0a4508c 100644
> --- a/hw/arm/highbank.c
> +++ b/hw/arm/highbank.c
> @@ -363,6 +363,8 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
>          sysbus_connect_irq(SYS_BUS_DEVICE(dev), 2, pic[82]);
>      }
>  
> +    /* TODO create and connect IDE devices for ide_drive_get() */
> +
>      highbank_binfo.ram_size = ram_size;
>      highbank_binfo.kernel_filename = kernel_filename;
>      highbank_binfo.kernel_cmdline = kernel_cmdline;
> @@ -405,7 +407,8 @@ static void highbank_class_init(ObjectClass *oc, void *data)
>  
>      mc->desc = "Calxeda Highbank (ECX-1000)";
>      mc->init = highbank_init;
> -    mc->block_default_type = IF_SCSI;
> +    mc->block_default_type = IF_IDE;
> +    mc->units_per_default_bus = 1;
>      mc->max_cpus = 4;
>  }
>  
> @@ -421,7 +424,8 @@ static void midway_class_init(ObjectClass *oc, void *data)
>  
>      mc->desc = "Calxeda Midway (ECX-2000)";
>      mc->init = midway_init;
> -    mc->block_default_type = IF_SCSI;
> +    mc->block_default_type = IF_IDE;
> +    mc->units_per_default_bus = 1;
>      mc->max_cpus = 4;
>  }
>  
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

