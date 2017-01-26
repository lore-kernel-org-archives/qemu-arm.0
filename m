Received: by 10.25.77.65 with SMTP id a62csp126630lfb;
        Thu, 26 Jan 2017 02:07:06 -0800 (PST)
X-Received: by 10.200.52.209 with SMTP id x17mr1819779qtb.74.1485425226652;
        Thu, 26 Jan 2017 02:07:06 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 67si772032qkq.86.2017.01.26.02.07.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 02:07:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cWgxL-0003B5-Qx
	for alex.bennee@linaro.org; Thu, 26 Jan 2017 05:07:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1cWgxD-00039g-CL
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 05:06:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1cWgx8-0001k7-El
	for qemu-arm@nongnu.org; Thu, 26 Jan 2017 05:06:55 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48024)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1cWgx8-0001jh-86; Thu, 26 Jan 2017 05:06:50 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4222981227;
	Thu, 26 Jan 2017 10:06:50 +0000 (UTC)
Received: from work-vm (ovpn-117-62.ams2.redhat.com [10.36.117.62])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v0QA6jFg022995
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 26 Jan 2017 05:06:47 -0500
Date: Thu, 26 Jan 2017 10:06:44 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20170126100643.GD2083@work-vm>
References: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
	<1485422381-29019-5-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485422381-29019-5-git-send-email-eric.auger@redhat.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 26 Jan 2017 10:06:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC 4/4] hw/intc/arm_gicv3_its: Allow save/restore
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, vijay.kilari@gmail.com,
	quintela@redhat.com, qemu-devel@nongnu.org, peterx@redhat.com,
	Vijaya.Kumar@cavium.com, qemu-arm@nongnu.org,
	shannon.zhao@linaro.org, christoffer.dall@linaro.org,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5jdsvuz4NdkL

* Eric Auger (eric.auger@redhat.com) wrote:
> We change the restoration priority of both the GICv3 and ITS. The
> GICv3 must be restored before the ITS and the ITS needs to be restored
> before PCIe devices since it translates their MSI transactions.
> 
> We typically observe the virtio-pci-net device sending MSI transactions
> very early (even before the first vcpu run) which looks weird. It
> appears that not servicing those transactions cause the virtio-pci-net
> to stall.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

<snip>

> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index 3f8017d..7f81d33 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -95,8 +95,12 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
>       * Block migration of a KVM GICv3 ITS device: the API for saving and
>       * restoring the state in the kernel is not yet available
>       */
> -    error_setg(&s->migration_blocker, "vITS migration is not implemented");
> -    migrate_add_blocker(s->migration_blocker);
> +    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +                               GITS_CTLR)) {
> +        error_setg(&s->migration_blocker, "This operating system kernel does "
> +                                          "not support vITS migration");
> +        migrate_add_blocker(s->migration_blocker);
> +    }

Watch out, a change went in to the parameters/return value of migrate_add_blocker
earlier in the week - it can now fail.

>      kvm_msi_use_devid = true;
>      kvm_gsi_direct_mapping = false;
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 1a22887..ebd755c 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -188,6 +188,8 @@ enum VMStateFlags {
>  
>  typedef enum {
>      MIG_PRI_DEFAULT = 0,
> +    MIG_PRI_GICV3_ITS,
> +    MIG_PRI_GICV3,
>      MIG_PRI_MAX,

Can we keep this commented so it's trivially easy to see the order, something like:

 typedef enum {
     MIG_PRI_DEFAULT = 0,
+    MIG_PRI_GICV3_ITS,    /* Needs to be before PCI devices */
+    MIG_PRI_GICV3,        /* Must be before ITS */
     MIG_PRI_MAX,
 } MigrationPriority;

Dave

>  
> -- 
> 2.5.5
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
