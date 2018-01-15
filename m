Received: by 10.28.173.206 with SMTP id w197csp2526110wme;
        Mon, 15 Jan 2018 01:50:39 -0800 (PST)
X-Google-Smtp-Source: ACJfBouKMUwdQvGfD5G0m6x3UY3mCIfjXaUFcRaaFBPCKpw2EhYWjp2lKWEIkedTwGBgmQSDPzw/
X-Received: by 10.37.11.135 with SMTP id 129mr18435758ybl.238.1516009839683;
        Mon, 15 Jan 2018 01:50:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516009839; cv=none;
        d=google.com; s=arc-20160816;
        b=XUHGvc4BGjkaqpRvN91sbwDc/jndGa7aqSu79qizhgNt1gWOenUf4TGFVnogq51h1b
         3HeW9/Yzt9yuGwYreBB1Z9OVjG62X7+xjB63soTe7xjuqNeJ5Y1F3SADjmygIvZE6DPo
         I+JytW3B2FdGIhlkCNgr6XT59Oeu4ce9vKekp6FIlXV3KTI2GoBYA10AzMrfFSXLYHa/
         n9h+MsnfQjCxnUjMcYvBM1xlNWHVa7TRFir8jH8NXkXughOvPQKbAbcpaSPs2q4GuzCq
         oUgteWgtLh0aIyrT7xJgcpGCyGMUIR7kWrs3k8zEL8Egr9RcBSz0IlKP8oFdGRjy8u5O
         TBtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=eGAMgS3QKjvBErYYru1XMXGQkT0SaVAp53pMVqqf0Tw=;
        b=Zt4Y64jq/v2RvBOIwGaPGkxSDD1/9Dr097wngdx1z2FCXhR1LBmIwHDT0G0U7h2C5g
         pMGHsZA8apXiwNRyKyfr2B9WiuMrLBBJ0KWGLVsBjy4dtZTgkiYzuR2wQoZNHqu4ad9T
         hyVZFPaUmv1AT0+wDmAQfhlzmRVtgFewQ8tUm01vY7qJT2EelDvAC5CqQln5dbTKuC9n
         2sV8FuVjs+EokgBwv0PopqrlNrncPXRpGe0rLF+swH6GwddWCeHvXaf78jacHx4yXZA6
         rF//yZCT1ZaeU5aV/RR7eI/awQDy7DBY0QwHY0EyFwonVUm4wURKn3jNuePVtRUFimyo
         mZ5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h28si2880555ybj.680.2018.01.15.01.50.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 01:50:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51848 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb1Pa-0004Nl-VT
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 04:50:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1eb1OO-0003WF-Ng
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 04:49:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1eb1OL-0006w5-GY
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 04:49:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42592)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1eb1OL-0006vA-2C; Mon, 15 Jan 2018 04:49:21 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5C7F9C04AC54;
	Mon, 15 Jan 2018 09:49:13 +0000 (UTC)
Received: from mapfelba-osx.local (unknown [10.35.206.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4453150DF7;
	Mon, 15 Jan 2018 09:48:57 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20180114020412.26160-1-f4bug@amsat.org>
	<20180114020412.26160-4-f4bug@amsat.org>
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <bdbf5163-f343-df4a-889f-35a945bb331e@redhat.com>
Date: Mon, 15 Jan 2018 11:48:55 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20180114020412.26160-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 15 Jan 2018 09:49:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC PATCH 3/3] qdev: use
 device_class_set_parent_realize/unrealize/reset()
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
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Dmitry Fleytman <dmitry@daynix.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Anthony Green <green@moxielogic.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Fam Zheng <famz@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	"open list:ARM cores" <qemu-arm@nongnu.org>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PZ6wo/Fs0LYJ

On 14/01/2018 4:04, Philippe Mathieu-Daud=C3=A9 wrote:
> changes generated using the following Coccinelle patch:
>=20
>    @@
>    type DeviceParentClass;
>    DeviceParentClass *pc;
>    DeviceClass *dc;
>    identifier parent_fn;
>    identifier child_fn;
>    @@
>    (
>    +device_class_set_parent_realize(dc, child_fn, &pc->parent_fn);
>    -pc->parent_fn =3D dc->realize;
>    ...
>    -dc->realize =3D child_fn;
>    |
>    +device_class_set_parent_unrealize(dc, child_fn, &pc->parent_fn);
>    -pc->parent_fn =3D dc->unrealize;
>    ...
>    -dc->unrealize =3D child_fn;
>    |
>    +device_class_set_parent_reset(dc, child_fn, &pc->parent_fn);
>    -pc->parent_fn =3D dc->reset;
>    ...
>    -dc->reset =3D child_fn;
>    )
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   hw/i386/kvm/i8254.c                | 4 ++--
>   hw/i386/kvm/i8259.c                | 3 +--
>   hw/input/adb-kbd.c                 | 4 ++--
>   hw/input/adb-mouse.c               | 4 ++--
>   hw/intc/arm_gic.c                  | 3 +--
>   hw/intc/arm_gic_kvm.c              | 7 +++----
>   hw/intc/arm_gicv3.c                | 3 +--
>   hw/intc/arm_gicv3_its_kvm.c        | 3 +--
>   hw/intc/arm_gicv3_kvm.c            | 7 +++----
>   hw/intc/i8259.c                    | 3 +--
>   hw/net/vmxnet3.c                   | 4 ++--
>   hw/pci-bridge/gen_pcie_root_port.c | 3 +--

PCIe Root Port changes:

Reviewed-by: Marcel Apfelbaum <marcel@redhat.com>

Thanks,
Marcel

>   hw/scsi/vmw_pvscsi.c               | 4 ++--
>   hw/timer/i8254.c                   | 3 +--
>   hw/vfio/amd-xgbe.c                 | 4 ++--
>   hw/vfio/calxeda-xgmac.c            | 4 ++--
>   hw/virtio/virtio-pci.c             | 4 ++--
>   target/alpha/cpu.c                 | 4 ++--
>   target/arm/cpu.c                   | 4 ++--
>   target/cris/cpu.c                  | 4 ++--
>   target/hppa/cpu.c                  | 4 ++--
>   target/i386/cpu.c                  | 8 ++++----
>   target/lm32/cpu.c                  | 5 ++---
>   target/m68k/cpu.c                  | 5 ++---
>   target/microblaze/cpu.c            | 5 ++---
>   target/mips/cpu.c                  | 5 ++---
>   target/moxie/cpu.c                 | 5 ++---
>   target/nios2/cpu.c                 | 4 ++--
>   target/openrisc/cpu.c              | 5 ++---
>   target/ppc/translate_init.c        | 8 ++++----
>   target/s390x/cpu.c                 | 4 ++--
>   target/sh4/cpu.c                   | 4 ++--
>   target/sparc/cpu.c                 | 4 ++--
>   target/tilegx/cpu.c                | 4 ++--
>   target/tricore/cpu.c               | 4 ++--
>   target/unicore32/cpu.c             | 4 ++--
>   target/xtensa/cpu.c                | 4 ++--
>   37 files changed, 73 insertions(+), 88 deletions(-)
>=20
> diff --git a/hw/i386/kvm/i8254.c b/hw/i386/kvm/i8254.c
> index 521a58498a..13f20f47d9 100644
> --- a/hw/i386/kvm/i8254.c
> +++ b/hw/i386/kvm/i8254.c
> @@ -315,8 +315,8 @@ static void kvm_pit_class_init(ObjectClass *klass, =
void *data)
>       PITCommonClass *k =3D PIT_COMMON_CLASS(klass);
>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>  =20
> -    kpc->parent_realize =3D dc->realize;
> -    dc->realize =3D kvm_pit_realizefn;
> +    device_class_set_parent_realize(dc, kvm_pit_realizefn,
> +                                    &kpc->parent_realize);
>       k->set_channel_gate =3D kvm_pit_set_gate;
>       k->get_channel_info =3D kvm_pit_get_channel_info;
>       dc->reset =3D kvm_pit_reset;
> diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
> index b91e98074e..05394cdb7b 100644
> --- a/hw/i386/kvm/i8259.c
> +++ b/hw/i386/kvm/i8259.c
> @@ -142,8 +142,7 @@ static void kvm_i8259_class_init(ObjectClass *klass=
, void *data)
>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>  =20
>       dc->reset     =3D kvm_pic_reset;
> -    kpc->parent_realize =3D dc->realize;
> -    dc->realize   =3D kvm_pic_realize;
> +    device_class_set_parent_realize(dc, kvm_pic_realize, &kpc->parent_=
realize);
>       k->pre_save   =3D kvm_pic_get;
>       k->post_load  =3D kvm_pic_put;
>   }
> diff --git a/hw/input/adb-kbd.c b/hw/input/adb-kbd.c
> index 354f56e41e..266aed1b7b 100644
> --- a/hw/input/adb-kbd.c
> +++ b/hw/input/adb-kbd.c
> @@ -374,8 +374,8 @@ static void adb_kbd_class_init(ObjectClass *oc, voi=
d *data)
>       ADBDeviceClass *adc =3D ADB_DEVICE_CLASS(oc);
>       ADBKeyboardClass *akc =3D ADB_KEYBOARD_CLASS(oc);
>  =20
> -    akc->parent_realize =3D dc->realize;
> -    dc->realize =3D adb_kbd_realizefn;
> +    device_class_set_parent_realize(dc, adb_kbd_realizefn,
> +                                    &akc->parent_realize);
>       set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  =20
>       adc->devreq =3D adb_kbd_request;
> diff --git a/hw/input/adb-mouse.c b/hw/input/adb-mouse.c
> index c9004233b8..47e88faf25 100644
> --- a/hw/input/adb-mouse.c
> +++ b/hw/input/adb-mouse.c
> @@ -228,8 +228,8 @@ static void adb_mouse_class_init(ObjectClass *oc, v=
oid *data)
>       ADBDeviceClass *adc =3D ADB_DEVICE_CLASS(oc);
>       ADBMouseClass *amc =3D ADB_MOUSE_CLASS(oc);
>  =20
> -    amc->parent_realize =3D dc->realize;
> -    dc->realize =3D adb_mouse_realizefn;
> +    device_class_set_parent_realize(dc, adb_mouse_realizefn,
> +                                    &amc->parent_realize);
>       set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  =20
>       adc->devreq =3D adb_mouse_request;
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index d701e49ff9..9e0a5ea725 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -1444,8 +1444,7 @@ static void arm_gic_class_init(ObjectClass *klass=
, void *data)
>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>       ARMGICClass *agc =3D ARM_GIC_CLASS(klass);
>  =20
> -    agc->parent_realize =3D dc->realize;
> -    dc->realize =3D arm_gic_realize;
> +    device_class_set_parent_realize(dc, arm_gic_realize, &agc->parent_=
realize);
>   }
>  =20
>   static const TypeInfo arm_gic_info =3D {
> diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
> index ae095d08a3..6f467e68a8 100644
> --- a/hw/intc/arm_gic_kvm.c
> +++ b/hw/intc/arm_gic_kvm.c
> @@ -591,10 +591,9 @@ static void kvm_arm_gic_class_init(ObjectClass *kl=
ass, void *data)
>  =20
>       agcc->pre_save =3D kvm_arm_gic_get;
>       agcc->post_load =3D kvm_arm_gic_put;
> -    kgc->parent_realize =3D dc->realize;
> -    kgc->parent_reset =3D dc->reset;
> -    dc->realize =3D kvm_arm_gic_realize;
> -    dc->reset =3D kvm_arm_gic_reset;
> +    device_class_set_parent_realize(dc, kvm_arm_gic_realize,
> +                                    &kgc->parent_realize);
> +    device_class_set_parent_reset(dc, kvm_arm_gic_reset, &kgc->parent_=
reset);
>   }
>  =20
>   static const TypeInfo kvm_arm_gic_info =3D {
> diff --git a/hw/intc/arm_gicv3.c b/hw/intc/arm_gicv3.c
> index f0c967b304..479c66733c 100644
> --- a/hw/intc/arm_gicv3.c
> +++ b/hw/intc/arm_gicv3.c
> @@ -385,8 +385,7 @@ static void arm_gicv3_class_init(ObjectClass *klass=
, void *data)
>       ARMGICv3Class *agc =3D ARM_GICV3_CLASS(klass);
>  =20
>       agcc->post_load =3D arm_gicv3_post_load;
> -    agc->parent_realize =3D dc->realize;
> -    dc->realize =3D arm_gic_realize;
> +    device_class_set_parent_realize(dc, arm_gic_realize, &agc->parent_=
realize);
>   }
>  =20
>   static const TypeInfo arm_gicv3_info =3D {
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index bf290b8bff..eea6a73df2 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -245,11 +245,10 @@ static void kvm_arm_its_class_init(ObjectClass *k=
lass, void *data)
>  =20
>       dc->realize =3D kvm_arm_its_realize;
>       dc->props   =3D kvm_arm_its_props;
> -    ic->parent_reset =3D dc->reset;
> +    device_class_set_parent_reset(dc, kvm_arm_its_reset, &ic->parent_r=
eset);
>       icc->send_msi =3D kvm_its_send_msi;
>       icc->pre_save =3D kvm_arm_its_pre_save;
>       icc->post_load =3D kvm_arm_its_post_load;
> -    dc->reset =3D kvm_arm_its_reset;
>   }
>  =20
>   static const TypeInfo kvm_arm_its_info =3D {
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 481fe5405a..ec371772b3 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -795,10 +795,9 @@ static void kvm_arm_gicv3_class_init(ObjectClass *=
klass, void *data)
>  =20
>       agcc->pre_save =3D kvm_arm_gicv3_get;
>       agcc->post_load =3D kvm_arm_gicv3_put;
> -    kgc->parent_realize =3D dc->realize;
> -    kgc->parent_reset =3D dc->reset;
> -    dc->realize =3D kvm_arm_gicv3_realize;
> -    dc->reset =3D kvm_arm_gicv3_reset;
> +    device_class_set_parent_realize(dc, kvm_arm_gicv3_realize,
> +                                    &kgc->parent_realize);
> +    device_class_set_parent_reset(dc, kvm_arm_gicv3_reset, &kgc->paren=
t_reset);
>   }
>  =20
>   static const TypeInfo kvm_arm_gicv3_info =3D {
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index 1602255a87..76f3d873b8 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -443,8 +443,7 @@ static void i8259_class_init(ObjectClass *klass, vo=
id *data)
>       PICClass *k =3D PIC_CLASS(klass);
>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>  =20
> -    k->parent_realize =3D dc->realize;
> -    dc->realize =3D pic_realize;
> +    device_class_set_parent_realize(dc, pic_realize, &k->parent_realiz=
e);
>       dc->reset =3D pic_reset;
>   }
>  =20
> diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> index 0654d594c1..3648630386 100644
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -2664,8 +2664,8 @@ static void vmxnet3_class_init(ObjectClass *class=
, void *data)
>       c->class_id =3D PCI_CLASS_NETWORK_ETHERNET;
>       c->subsystem_vendor_id =3D PCI_VENDOR_ID_VMWARE;
>       c->subsystem_id =3D PCI_DEVICE_ID_VMWARE_VMXNET3;
> -    vc->parent_dc_realize =3D dc->realize;
> -    dc->realize =3D vmxnet3_realize;
> +    device_class_set_parent_realize(dc, vmxnet3_realize,
> +                                    &vc->parent_dc_realize);
>       dc->desc =3D "VMWare Paravirtualized Ethernet v3";
>       dc->reset =3D vmxnet3_qdev_reset;
>       dc->vmsd =3D &vmstate_vmxnet3;
> diff --git a/hw/pci-bridge/gen_pcie_root_port.c b/hw/pci-bridge/gen_pci=
e_root_port.c
> index ad4e6aa7ff..4a3b13d02c 100644
> --- a/hw/pci-bridge/gen_pcie_root_port.c
> +++ b/hw/pci-bridge/gen_pcie_root_port.c
> @@ -132,8 +132,7 @@ static void gen_rp_dev_class_init(ObjectClass *klas=
s, void *data)
>       dc->vmsd =3D &vmstate_rp_dev;
>       dc->props =3D gen_rp_props;
>  =20
> -    rpc->parent_realize =3D dc->realize;
> -    dc->realize =3D gen_rp_realize;
> +    device_class_set_parent_realize(dc, gen_rp_realize, &rpc->parent_r=
ealize);
>  =20
>       rpc->aer_vector =3D gen_rp_aer_vector;
>       rpc->interrupts_init =3D gen_rp_interrupts_init;
> diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
> index 27749c0e42..a3a019e30a 100644
> --- a/hw/scsi/vmw_pvscsi.c
> +++ b/hw/scsi/vmw_pvscsi.c
> @@ -1284,8 +1284,8 @@ static void pvscsi_class_init(ObjectClass *klass,=
 void *data)
>       k->device_id =3D PCI_DEVICE_ID_VMWARE_PVSCSI;
>       k->class_id =3D PCI_CLASS_STORAGE_SCSI;
>       k->subsystem_id =3D 0x1000;
> -    pvs_k->parent_dc_realize =3D dc->realize;
> -    dc->realize =3D pvscsi_realize;
> +    device_class_set_parent_realize(dc, pvscsi_realize,
> +                                    &pvs_k->parent_dc_realize);
>       dc->reset =3D pvscsi_reset;
>       dc->vmsd =3D &vmstate_pvscsi;
>       dc->props =3D pvscsi_properties;
> diff --git a/hw/timer/i8254.c b/hw/timer/i8254.c
> index dbc4a0baec..1057850808 100644
> --- a/hw/timer/i8254.c
> +++ b/hw/timer/i8254.c
> @@ -358,8 +358,7 @@ static void pit_class_initfn(ObjectClass *klass, vo=
id *data)
>       PITCommonClass *k =3D PIT_COMMON_CLASS(klass);
>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>  =20
> -    pc->parent_realize =3D dc->realize;
> -    dc->realize =3D pit_realizefn;
> +    device_class_set_parent_realize(dc, pit_realizefn, &pc->parent_rea=
lize);
>       k->set_channel_gate =3D pit_set_channel_gate;
>       k->get_channel_info =3D pit_get_channel_info_common;
>       k->post_load =3D pit_post_load;
> diff --git a/hw/vfio/amd-xgbe.c b/hw/vfio/amd-xgbe.c
> index fab196cebf..0c4ec4ba25 100644
> --- a/hw/vfio/amd-xgbe.c
> +++ b/hw/vfio/amd-xgbe.c
> @@ -34,8 +34,8 @@ static void vfio_amd_xgbe_class_init(ObjectClass *kla=
ss, void *data)
>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>       VFIOAmdXgbeDeviceClass *vcxc =3D
>           VFIO_AMD_XGBE_DEVICE_CLASS(klass);
> -    vcxc->parent_realize =3D dc->realize;
> -    dc->realize =3D amd_xgbe_realize;
> +    device_class_set_parent_realize(dc, amd_xgbe_realize,
> +                                    &vcxc->parent_realize);
>       dc->desc =3D "VFIO AMD XGBE";
>       dc->vmsd =3D &vfio_platform_amd_xgbe_vmstate;
>       /* Supported by TYPE_VIRT_MACHINE */
> diff --git a/hw/vfio/calxeda-xgmac.c b/hw/vfio/calxeda-xgmac.c
> index 7bb17af7ad..24cee6d065 100644
> --- a/hw/vfio/calxeda-xgmac.c
> +++ b/hw/vfio/calxeda-xgmac.c
> @@ -34,8 +34,8 @@ static void vfio_calxeda_xgmac_class_init(ObjectClass=
 *klass, void *data)
>       DeviceClass *dc =3D DEVICE_CLASS(klass);
>       VFIOCalxedaXgmacDeviceClass *vcxc =3D
>           VFIO_CALXEDA_XGMAC_DEVICE_CLASS(klass);
> -    vcxc->parent_realize =3D dc->realize;
> -    dc->realize =3D calxeda_xgmac_realize;
> +    device_class_set_parent_realize(dc, calxeda_xgmac_realize,
> +                                    &vcxc->parent_realize);
>       dc->desc =3D "VFIO Calxeda XGMAC";
>       dc->vmsd =3D &vfio_platform_calxeda_xgmac_vmstate;
>       /* Supported by TYPE_VIRT_MACHINE */
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 6c75cca88a..3eeb98c4cf 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1907,8 +1907,8 @@ static void virtio_pci_class_init(ObjectClass *kl=
ass, void *data)
>       k->vendor_id =3D PCI_VENDOR_ID_REDHAT_QUMRANET;
>       k->revision =3D VIRTIO_PCI_ABI_VERSION;
>       k->class_id =3D PCI_CLASS_OTHERS;
> -    vpciklass->parent_dc_realize =3D dc->realize;
> -    dc->realize =3D virtio_pci_dc_realize;
> +    device_class_set_parent_realize(dc, virtio_pci_dc_realize,
> +                                    &vpciklass->parent_dc_realize);
>       dc->reset =3D virtio_pci_reset;
>   }
>  =20
> diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
> index 7d6366bae9..55675ce419 100644
> --- a/target/alpha/cpu.c
> +++ b/target/alpha/cpu.c
> @@ -233,8 +233,8 @@ static void alpha_cpu_class_init(ObjectClass *oc, v=
oid *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       AlphaCPUClass *acc =3D ALPHA_CPU_CLASS(oc);
>  =20
> -    acc->parent_realize =3D dc->realize;
> -    dc->realize =3D alpha_cpu_realizefn;
> +    device_class_set_parent_realize(dc, alpha_cpu_realizefn,
> +                                    &acc->parent_realize);
>  =20
>       cc->class_by_name =3D alpha_cpu_class_by_name;
>       cc->has_work =3D alpha_cpu_has_work;
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index cc1856c32b..2b29747b9f 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1722,8 +1722,8 @@ static void arm_cpu_class_init(ObjectClass *oc, v=
oid *data)
>       CPUClass *cc =3D CPU_CLASS(acc);
>       DeviceClass *dc =3D DEVICE_CLASS(oc);
>  =20
> -    acc->parent_realize =3D dc->realize;
> -    dc->realize =3D arm_cpu_realizefn;
> +    device_class_set_parent_realize(dc, arm_cpu_realizefn,
> +                                    &acc->parent_realize);
>       dc->props =3D arm_cpu_properties;
>  =20
>       acc->parent_reset =3D cc->reset;
> diff --git a/target/cris/cpu.c b/target/cris/cpu.c
> index 949c7a6e25..db8d0884a1 100644
> --- a/target/cris/cpu.c
> +++ b/target/cris/cpu.c
> @@ -260,8 +260,8 @@ static void cris_cpu_class_init(ObjectClass *oc, vo=
id *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       CRISCPUClass *ccc =3D CRIS_CPU_CLASS(oc);
>  =20
> -    ccc->parent_realize =3D dc->realize;
> -    dc->realize =3D cris_cpu_realizefn;
> +    device_class_set_parent_realize(dc, cris_cpu_realizefn,
> +                                    &ccc->parent_realize);
>  =20
>       ccc->parent_reset =3D cc->reset;
>       cc->reset =3D cris_cpu_reset;
> diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
> index 9e7b0d4ccb..899464ae87 100644
> --- a/target/hppa/cpu.c
> +++ b/target/hppa/cpu.c
> @@ -121,8 +121,8 @@ static void hppa_cpu_class_init(ObjectClass *oc, vo=
id *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       HPPACPUClass *acc =3D HPPA_CPU_CLASS(oc);
>  =20
> -    acc->parent_realize =3D dc->realize;
> -    dc->realize =3D hppa_cpu_realizefn;
> +    device_class_set_parent_realize(dc, hppa_cpu_realizefn,
> +                                    &acc->parent_realize);
>  =20
>       cc->class_by_name =3D hppa_cpu_class_by_name;
>       cc->do_interrupt =3D hppa_cpu_do_interrupt;
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 3818d72831..3573cfab65 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -4216,10 +4216,10 @@ static void x86_cpu_common_class_init(ObjectCla=
ss *oc, void *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       DeviceClass *dc =3D DEVICE_CLASS(oc);
>  =20
> -    xcc->parent_realize =3D dc->realize;
> -    xcc->parent_unrealize =3D dc->unrealize;
> -    dc->realize =3D x86_cpu_realizefn;
> -    dc->unrealize =3D x86_cpu_unrealizefn;
> +    device_class_set_parent_realize(dc, x86_cpu_realizefn,
> +                                    &xcc->parent_realize);
> +    device_class_set_parent_unrealize(dc, x86_cpu_unrealizefn,
> +                                      &xcc->parent_unrealize);
>       dc->props =3D x86_cpu_properties;
>  =20
>       xcc->parent_reset =3D cc->reset;
> diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
> index 6f5c14767b..96c2499d0b 100644
> --- a/target/lm32/cpu.c
> +++ b/target/lm32/cpu.c
> @@ -236,9 +236,8 @@ static void lm32_cpu_class_init(ObjectClass *oc, vo=
id *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       DeviceClass *dc =3D DEVICE_CLASS(oc);
>  =20
> -    lcc->parent_realize =3D dc->realize;
> -    dc->realize =3D lm32_cpu_realizefn;
> -
> +    device_class_set_parent_realize(dc, lm32_cpu_realizefn,
> +                                    &lcc->parent_realize);
>       lcc->parent_reset =3D cc->reset;
>       cc->reset =3D lm32_cpu_reset;
>  =20
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 03126ba543..a07c568297 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -255,9 +255,8 @@ static void m68k_cpu_class_init(ObjectClass *c, voi=
d *data)
>       CPUClass *cc =3D CPU_CLASS(c);
>       DeviceClass *dc =3D DEVICE_CLASS(c);
>  =20
> -    mcc->parent_realize =3D dc->realize;
> -    dc->realize =3D m68k_cpu_realizefn;
> -
> +    device_class_set_parent_realize(dc, m68k_cpu_realizefn,
> +                                    &mcc->parent_realize);
>       mcc->parent_reset =3D cc->reset;
>       cc->reset =3D m68k_cpu_reset;
>  =20
> diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
> index 5700652e06..d8df2fb07e 100644
> --- a/target/microblaze/cpu.c
> +++ b/target/microblaze/cpu.c
> @@ -258,9 +258,8 @@ static void mb_cpu_class_init(ObjectClass *oc, void=
 *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       MicroBlazeCPUClass *mcc =3D MICROBLAZE_CPU_CLASS(oc);
>  =20
> -    mcc->parent_realize =3D dc->realize;
> -    dc->realize =3D mb_cpu_realizefn;
> -
> +    device_class_set_parent_realize(dc, mb_cpu_realizefn,
> +                                    &mcc->parent_realize);
>       mcc->parent_reset =3D cc->reset;
>       cc->reset =3D mb_cpu_reset;
>  =20
> diff --git a/target/mips/cpu.c b/target/mips/cpu.c
> index 069f93560e..497706b669 100644
> --- a/target/mips/cpu.c
> +++ b/target/mips/cpu.c
> @@ -174,9 +174,8 @@ static void mips_cpu_class_init(ObjectClass *c, voi=
d *data)
>       CPUClass *cc =3D CPU_CLASS(c);
>       DeviceClass *dc =3D DEVICE_CLASS(c);
>  =20
> -    mcc->parent_realize =3D dc->realize;
> -    dc->realize =3D mips_cpu_realizefn;
> -
> +    device_class_set_parent_realize(dc, mips_cpu_realizefn,
> +                                    &mcc->parent_realize);
>       mcc->parent_reset =3D cc->reset;
>       cc->reset =3D mips_cpu_reset;
>  =20
> diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
> index f1389e5097..4170284da6 100644
> --- a/target/moxie/cpu.c
> +++ b/target/moxie/cpu.c
> @@ -102,9 +102,8 @@ static void moxie_cpu_class_init(ObjectClass *oc, v=
oid *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       MoxieCPUClass *mcc =3D MOXIE_CPU_CLASS(oc);
>  =20
> -    mcc->parent_realize =3D dc->realize;
> -    dc->realize =3D moxie_cpu_realizefn;
> -
> +    device_class_set_parent_realize(dc, moxie_cpu_realizefn,
> +                                    &mcc->parent_realize);
>       mcc->parent_reset =3D cc->reset;
>       cc->reset =3D moxie_cpu_reset;
>  =20
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 4742e52c78..fbfaa2ce26 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -187,8 +187,8 @@ static void nios2_cpu_class_init(ObjectClass *oc, v=
oid *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       Nios2CPUClass *ncc =3D NIOS2_CPU_CLASS(oc);
>  =20
> -    ncc->parent_realize =3D dc->realize;
> -    dc->realize =3D nios2_cpu_realizefn;
> +    device_class_set_parent_realize(dc, nios2_cpu_realizefn,
> +                                    &ncc->parent_realize);
>       dc->props =3D nios2_properties;
>       ncc->parent_reset =3D cc->reset;
>       cc->reset =3D nios2_cpu_reset;
> diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
> index e0394b8b06..20b115afae 100644
> --- a/target/openrisc/cpu.c
> +++ b/target/openrisc/cpu.c
> @@ -132,9 +132,8 @@ static void openrisc_cpu_class_init(ObjectClass *oc=
, void *data)
>       CPUClass *cc =3D CPU_CLASS(occ);
>       DeviceClass *dc =3D DEVICE_CLASS(oc);
>  =20
> -    occ->parent_realize =3D dc->realize;
> -    dc->realize =3D openrisc_cpu_realizefn;
> -
> +    device_class_set_parent_realize(dc, openrisc_cpu_realizefn,
> +                                    &occ->parent_realize);
>       occ->parent_reset =3D cc->reset;
>       cc->reset =3D openrisc_cpu_reset;
>  =20
> diff --git a/target/ppc/translate_init.c b/target/ppc/translate_init.c
> index 70ff15a51a..566cf552e0 100644
> --- a/target/ppc/translate_init.c
> +++ b/target/ppc/translate_init.c
> @@ -10556,12 +10556,12 @@ static void ppc_cpu_class_init(ObjectClass *o=
c, void *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       DeviceClass *dc =3D DEVICE_CLASS(oc);
>  =20
> -    pcc->parent_realize =3D dc->realize;
> -    pcc->parent_unrealize =3D dc->unrealize;
> +    device_class_set_parent_realize(dc, ppc_cpu_realizefn,
> +                                    &pcc->parent_realize);
> +    device_class_set_parent_unrealize(dc, ppc_cpu_unrealizefn,
> +                                      &pcc->parent_unrealize);
>       pcc->pvr_match =3D ppc_pvr_match_default;
>       pcc->interrupts_big_endian =3D ppc_cpu_interrupts_big_endian_alwa=
ys;
> -    dc->realize =3D ppc_cpu_realizefn;
> -    dc->unrealize =3D ppc_cpu_unrealizefn;
>       dc->props =3D ppc_cpu_properties;
>  =20
>       pcc->parent_reset =3D cc->reset;
> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index ae3cee91a2..4c068cedff 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -463,8 +463,8 @@ static void s390_cpu_class_init(ObjectClass *oc, vo=
id *data)
>       CPUClass *cc =3D CPU_CLASS(scc);
>       DeviceClass *dc =3D DEVICE_CLASS(oc);
>  =20
> -    scc->parent_realize =3D dc->realize;
> -    dc->realize =3D s390_cpu_realizefn;
> +    device_class_set_parent_realize(dc, s390_cpu_realizefn,
> +                                    &scc->parent_realize);
>       dc->props =3D s390x_cpu_properties;
>       dc->user_creatable =3D true;
>  =20
> diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
> index e0b99fbc89..e37c187ca2 100644
> --- a/target/sh4/cpu.c
> +++ b/target/sh4/cpu.c
> @@ -236,8 +236,8 @@ static void superh_cpu_class_init(ObjectClass *oc, =
void *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       SuperHCPUClass *scc =3D SUPERH_CPU_CLASS(oc);
>  =20
> -    scc->parent_realize =3D dc->realize;
> -    dc->realize =3D superh_cpu_realizefn;
> +    device_class_set_parent_realize(dc, superh_cpu_realizefn,
> +                                    &scc->parent_realize);
>  =20
>       scc->parent_reset =3D cc->reset;
>       cc->reset =3D superh_cpu_reset;
> diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
> index c7adc281de..ff6ed91f9a 100644
> --- a/target/sparc/cpu.c
> +++ b/target/sparc/cpu.c
> @@ -858,8 +858,8 @@ static void sparc_cpu_class_init(ObjectClass *oc, v=
oid *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       DeviceClass *dc =3D DEVICE_CLASS(oc);
>  =20
> -    scc->parent_realize =3D dc->realize;
> -    dc->realize =3D sparc_cpu_realizefn;
> +    device_class_set_parent_realize(dc, sparc_cpu_realizefn,
> +                                    &scc->parent_realize);
>       dc->props =3D sparc_cpu_properties;
>  =20
>       scc->parent_reset =3D cc->reset;
> diff --git a/target/tilegx/cpu.c b/target/tilegx/cpu.c
> index 2ef8ea7daa..54b6c50878 100644
> --- a/target/tilegx/cpu.c
> +++ b/target/tilegx/cpu.c
> @@ -141,8 +141,8 @@ static void tilegx_cpu_class_init(ObjectClass *oc, =
void *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       TileGXCPUClass *tcc =3D TILEGX_CPU_CLASS(oc);
>  =20
> -    tcc->parent_realize =3D dc->realize;
> -    dc->realize =3D tilegx_cpu_realizefn;
> +    device_class_set_parent_realize(dc, tilegx_cpu_realizefn,
> +                                    &tcc->parent_realize);
>  =20
>       tcc->parent_reset =3D cc->reset;
>       cc->reset =3D tilegx_cpu_reset;
> diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
> index 179c997aa4..2edaef1aef 100644
> --- a/target/tricore/cpu.c
> +++ b/target/tricore/cpu.c
> @@ -153,8 +153,8 @@ static void tricore_cpu_class_init(ObjectClass *c, =
void *data)
>       CPUClass *cc =3D CPU_CLASS(c);
>       DeviceClass *dc =3D DEVICE_CLASS(c);
>  =20
> -    mcc->parent_realize =3D dc->realize;
> -    dc->realize =3D tricore_cpu_realizefn;
> +    device_class_set_parent_realize(dc, tricore_cpu_realizefn,
> +                                    &mcc->parent_realize);
>  =20
>       mcc->parent_reset =3D cc->reset;
>       cc->reset =3D tricore_cpu_reset;
> diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
> index 17dc1504d7..fb837aab4c 100644
> --- a/target/unicore32/cpu.c
> +++ b/target/unicore32/cpu.c
> @@ -132,8 +132,8 @@ static void uc32_cpu_class_init(ObjectClass *oc, vo=
id *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       UniCore32CPUClass *ucc =3D UNICORE32_CPU_CLASS(oc);
>  =20
> -    ucc->parent_realize =3D dc->realize;
> -    dc->realize =3D uc32_cpu_realizefn;
> +    device_class_set_parent_realize(dc, uc32_cpu_realizefn,
> +                                    &ucc->parent_realize);
>  =20
>       cc->class_by_name =3D uc32_cpu_class_by_name;
>       cc->has_work =3D uc32_cpu_has_work;
> diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
> index 1c982a0b2e..4573388a45 100644
> --- a/target/xtensa/cpu.c
> +++ b/target/xtensa/cpu.c
> @@ -151,8 +151,8 @@ static void xtensa_cpu_class_init(ObjectClass *oc, =
void *data)
>       CPUClass *cc =3D CPU_CLASS(oc);
>       XtensaCPUClass *xcc =3D XTENSA_CPU_CLASS(cc);
>  =20
> -    xcc->parent_realize =3D dc->realize;
> -    dc->realize =3D xtensa_cpu_realizefn;
> +    device_class_set_parent_realize(dc, xtensa_cpu_realizefn,
> +                                    &xcc->parent_realize);
>  =20
>       xcc->parent_reset =3D cc->reset;
>       cc->reset =3D xtensa_cpu_reset;
>=20

