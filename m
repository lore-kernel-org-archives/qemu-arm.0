Received: by 10.25.0.198 with SMTP id 189csp40484lfa;
        Fri, 5 May 2017 00:36:59 -0700 (PDT)
X-Received: by 10.237.34.136 with SMTP id p8mr42827991qtc.282.1493969819625;
        Fri, 05 May 2017 00:36:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j21si996680qke.40.2017.05.05.00.36.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 May 2017 00:36:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from localhost ([::1]:45485 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d6XnM-0000Q9-Rq
	for alex.bennee@linaro.org; Fri, 05 May 2017 03:36:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1d6Xn9-0000NL-Gd
	for qemu-arm@nongnu.org; Fri, 05 May 2017 03:36:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1d6Xn5-0005lm-H3
	for qemu-arm@nongnu.org; Fri, 05 May 2017 03:36:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38921
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cornelia.huck@de.ibm.com>)
	id 1d6Xn5-0005lY-AC
	for qemu-arm@nongnu.org; Fri, 05 May 2017 03:36:39 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v457Tu0v005554
	for <qemu-arm@nongnu.org>; Fri, 5 May 2017 03:36:38 -0400
Received: from e06smtp12.uk.ibm.com (e06smtp12.uk.ibm.com [195.75.94.108])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2a8hw3qjen-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Fri, 05 May 2017 03:36:37 -0400
Received: from localhost
	by e06smtp12.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Fri, 5 May 2017 08:36:33 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp12.uk.ibm.com (192.168.101.142) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 5 May 2017 08:36:24 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id v457aO1834799722; Fri, 5 May 2017 07:36:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5531A4C050;
	Fri,  5 May 2017 08:35:21 +0100 (BST)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7475B4C04A;
	Fri,  5 May 2017 08:35:20 +0100 (BST)
Received: from gondolin (unknown [9.152.224.119])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  5 May 2017 08:35:20 +0100 (BST)
Date: Fri, 5 May 2017 09:36:22 +0200
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: Eduardo Habkost <ehabkost@redhat.com>
In-Reply-To: <20170503203604.31462-3-ehabkost@redhat.com>
References: <20170503203604.31462-1-ehabkost@redhat.com>
	<20170503203604.31462-3-ehabkost@redhat.com>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17050507-0008-0000-0000-0000043CBECB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17050507-0009-0000-0000-00001D8A89AE
Message-Id: <20170505093622.37902dea.cornelia.huck@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-05-05_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
	definitions=main-1705050081
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-arm] [PATCH RESEND v2 02/21] sysbus: Set
 user_creatable=false by default on TYPE_SYS_BUS_DEVICE
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Yi Min Zhao <zyimin@linux.vnet.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Pierre Morel <pmorel@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	sstabellini@kernel.org, qemu-block@nongnu.org,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Laszlo Ersek <lersek@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Thomas Huth <thuth@redhat.com>, "Gabriel L . Somlo" <somlo@cmu.edu>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Beniamino Galvani <b.galvani@gmail.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
	Juergen Gross <jgross@suse.com>,
	Frank Blaschka <frank.blaschka@de.ibm.com>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2ZdW7/phxbq8

On Wed,  3 May 2017 17:35:45 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> commit 33cd52b5d7b9adfd009e95f07e6c64dd88ae2a31 unset
> cannot_instantiate_with_device_add_yet in TYPE_SYSBUS, making all
> sysbus devices appear on "-device help" and lack the "no-user"
> flag in "info qdm".
> 
> To fix this, we can set user_creatable=false by default on
> TYPE_SYS_BUS_DEVICE, but this requires setting
> user_creatable=true explicitly on the sysbus devices that
> actually work with -device.
> 
> Fortunately today we have just a few has_dynamic_sysbus=1
> machines: virt, pc-q35-*, ppce500, and spapr.
> 
> virt, ppce500, and spapr have extra checks to ensure just a few
> device types can be instantiated:
> 
> * virt supports only TYPE_VFIO_CALXEDA_XGMAC, TYPE_VFIO_AMD_XGBE.
> * ppce500 supports only TYPE_ETSEC_COMMON.
> * spapr supports only TYPE_SPAPR_PCI_HOST_BRIDGE.
> 
> This patch sets user_creatable=true explicitly on those 4 device
> classes.
> 
> Now, the more complex cases:
> 
> pc-q35-*: q35 has no sysbus device whitelist yet (which is a
> separate bug). We are in the process of fixing it and building a
> sysbus whitelist on q35, but in the meantime we can fix the
> "-device help" and "info qdm" bugs mentioned above. Also, despite
> not being strictly necessary for fixing the q35 bug, reducing the
> list of user_creatable=true devices will help us be more
> confident when building the q35 whitelist.
> 
> xen: We also have a hack at xen_set_dynamic_sysbus(), that sets
> has_dynamic_sysbus=true at runtime when using the Xen
> accelerator. This hack is only used to allow xen-backend devices
> to be dynamically plugged/unplugged.
> 
> This means today we can use -device with the following 22 device
> types, that are the ones compiled into the qemu-system-x86_64 and
> qemu-system-i386 binaries:
> 
> * allwinner-ahci
> * amd-iommu
> * cfi.pflash01
> * esp
> * fw_cfg_io
> * fw_cfg_mem
> * generic-sdhci
> * hpet
> * intel-iommu
> * ioapic
> * isabus-bridge
> * kvmclock
> * kvm-ioapic
> * kvmvapic
> * SUNW,fdtwo
> * sysbus-ahci
> * sysbus-fdc
> * sysbus-ohci
> * unimplemented-device
> * virtio-mmio
> * xen-backend
> * xen-sysdev
> 
> This patch adds user_creatable=true explicitly to those devices,
> temporarily, just to keep 100% compatibility with existing
> behavior of q35. Subsequent patches will remove
> user_creatable=true from the devices that are really not meant to
> user-creatable on any machine, and remove the FIXME comment from
> the ones that are really supposed to be user-creatable. This is
> being done in separate patches because we still don't have an
> obvious list of devices that will be whitelisted by q35, and I
> would like to get each device reviewed individually.
> 
> Cc: Alexander Graf <agraf@suse.de>
> Cc: Alex Williamson <alex.williamson@redhat.com>
> Cc: Alistair Francis <alistair.francis@xilinx.com>
> Cc: Beniamino Galvani <b.galvani@gmail.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Cornelia Huck <cornelia.huck@de.ibm.com>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> Cc: Frank Blaschka <frank.blaschka@de.ibm.com>
> Cc: Gabriel L. Somlo <somlo@cmu.edu>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: John Snow <jsnow@redhat.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Laszlo Ersek <lersek@redhat.com>
> Cc: Marcel Apfelbaum <marcel@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Pierre Morel <pmorel@linux.vnet.ibm.com>
> Cc: Prasad J Pandit <pjp@fedoraproject.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-block@nongnu.org
> Cc: qemu-ppc@nongnu.org
> Cc: Richard Henderson <rth@twiddle.net>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Shannon Zhao <zhaoshenglong@huawei.com>
> Cc: sstabellini@kernel.org
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Yi Min Zhao <zyimin@linux.vnet.ibm.com>
> Acked-by: John Snow <jsnow@redhat.com>
> Acked-by: Juergen Gross <jgross@suse.com>
> Acked-by: Marcel Apfelbaum <marcel@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v1 -> v2:
> * Rewrite commit message: don't pretend we are actually fixing
>   the q35 issue. We're just fixing "info qdm" and "-device help".
>   Making it easier to fix q35 is just a nice side-effect.
> * Rewrite FIXME comments to make it clear that we just have
>   user_creatable=true because we don't know yet if the device
>   should be in the q35 whitelist
> ---
>  hw/block/fdc.c           | 10 ++++++++++
>  hw/block/pflash_cfi01.c  |  5 +++++
>  hw/core/sysbus.c         | 11 +++++++++++
>  hw/i386/amd_iommu.c      |  5 +++++
>  hw/i386/intel_iommu.c    |  5 +++++
>  hw/i386/kvm/clock.c      |  5 +++++
>  hw/i386/kvm/ioapic.c     |  5 +++++
>  hw/i386/kvmvapic.c       |  5 +++++
>  hw/ide/ahci.c            | 10 ++++++++++
>  hw/intc/ioapic.c         |  5 +++++
>  hw/isa/isa-bus.c         |  5 +++++
>  hw/misc/unimp.c          |  5 +++++
>  hw/net/fsl_etsec/etsec.c |  2 ++
>  hw/nvram/fw_cfg.c        | 10 ++++++++++
>  hw/ppc/spapr_pci.c       |  2 ++
>  hw/scsi/esp.c            |  5 +++++
>  hw/sd/sdhci.c            |  5 +++++
>  hw/timer/hpet.c          |  5 +++++
>  hw/usb/hcd-ohci.c        |  5 +++++
>  hw/vfio/amd-xgbe.c       |  2 ++
>  hw/vfio/calxeda-xgmac.c  |  2 ++
>  hw/virtio/virtio-mmio.c  |  5 +++++
>  hw/xen/xen_backend.c     | 10 ++++++++++
>  23 files changed, 129 insertions(+)
> 

> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index c0f560b289..6a2eec8dd0 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -326,6 +326,17 @@ static void sysbus_device_class_init(ObjectClass *klass, void *data)
>      DeviceClass *k = DEVICE_CLASS(klass);
>      k->init = sysbus_device_init;
>      k->bus_type = TYPE_SYSTEM_BUS;
> +    /*
> +     * device_add plugs devices into suitable bus.  For "real" buses,

s/suitable/a suitable/

> +     * that actually connects the device.  For sysbus, the connections
> +     * need to be made separately, and device_add can't do that.  The
> +     * device would be left unconnected, and will probably not work
> +     *
> +     * However, a few machines and a few devices can handle a few sysbus
> +     * devices. In this case, the device subclass needs to override

Should that rather be "a few machines can handle a few specific sysbus
devices"?

> +     * it and set user_creatable=true.
> +     */
> +    k->user_creatable = false;
>  }
> 
>  static const TypeInfo sysbus_device_type_info = {

