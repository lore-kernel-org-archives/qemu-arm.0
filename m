Received: by 10.28.173.206 with SMTP id w197csp2494144wme;
        Mon, 15 Jan 2018 01:10:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBou1WR1EkhbVEmnvY9w5fxJw9FDl53SQb49vhJc8NjejOj3SgbKTb2gB/LOHKcLyOCvISbl2
X-Received: by 10.13.250.70 with SMTP id k67mr13452749ywf.79.1516007400520;
        Mon, 15 Jan 2018 01:10:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516007400; cv=none;
        d=google.com; s=arc-20160816;
        b=re0lYtQUH8sy7UN0NQ8l85NNASwc5A4n5VExGb39invWzjV/obVZxnYQJlLtFJR1vj
         KXUCB8uobm0FgIyjD8w6kjZluvNk7d5IjdJlMiDQySLFK1InzzsW5wJvTkdZ3qUuDuSp
         G6Jb+UBAwFHjMHDK0+IRrxJSxKX/VwEySbvUa9S5X2yoxApUnxiCxiIcpw9bbSHHn3Qj
         jD6uYmg2vQz+Dk9/DxYcbWbMa1HpbolUz1CUXAzyStN3zqYvJltoDk9dHNv3hRvTeQ+h
         K9asqOEHx4QgCeX3UXTQ0xgBwdA66zub/Hs6b4LD8LOJWMekGkyHupq1EIYv+kWBNVeA
         teJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:to:from:date:arc-authentication-results;
        bh=zP7nKmWilxf6Ljvnmo4TVJIForw8Bq2xQTxnkoQ/V7o=;
        b=UUXFBtZag3g/bRsuANGV18cyTtqqJNj8A4qcRCgILWTaYdk1hEjCJckxbeowDFtdcH
         9mcX7zRszWHvlCPRC/jpfPpoVYWFHVYfepO4rOQnrwHcaaqi3Z5pSJqhCC9BllSlo3Tp
         /liMUd63oTCAlGd0eP5GcrKI91uvTqdlYW++2PEogPu/ByijlAUh8fZM2c7LvlfYvmE1
         +5VPVLNdESRRj2MxqXeLClSNIVosgx8g2Aj59osOfUzb8PNKDetwoioKJm/Dc+iyQZLR
         /0rmBdeF2reHBXt9sj/lfw7JRF0aJWP5569gl6V8pRWi6/a4L3Fdeh2iuNK5SUU/y7be
         tA0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j14si583215ywa.440.2018.01.15.01.10.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 01:10:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49657 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eb0mF-0008I2-Tm
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 04:09:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1eb0m4-0008Gl-OI
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 04:09:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1eb0m1-0007yM-JO
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 04:09:48 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32912)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>)
	id 1eb0m1-0007v9-9l; Mon, 15 Jan 2018 04:09:45 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A002782A;
	Mon, 15 Jan 2018 09:09:36 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0AD115C266;
	Mon, 15 Jan 2018 09:09:17 +0000 (UTC)
Date: Mon, 15 Jan 2018 10:09:14 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
Message-ID: <20180115100914.3ee3c68b.cohuck@redhat.com>
In-Reply-To: <20180114020412.26160-4-f4bug@amsat.org>
References: <20180114020412.26160-1-f4bug@amsat.org>
	<20180114020412.26160-4-f4bug@amsat.org>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Mon, 15 Jan 2018 09:09:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [qemu-s390x] [RFC PATCH 3/3] qdev: use
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
Cc: Peter Maydell <peter.maydell@linaro.org>, "Michael S.
	Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Michael Roth <mdroth@linux.vnet.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>, Dmitry Fleytman <dmitry@daynix.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Yongbok Kim <yongbok.kim@mips.com>, Marek Vasut <marex@denx.de>,
	Markus Armbruster <armbru@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Anthony Green <green@moxielogic.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, "Dr. David Alan
	Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	"open list:ARM cores" <qemu-arm@nongnu.org>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>, Alexander Graf <agraf@suse.de>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>, "open list:S390" <qemu-s390x@nongnu.org>,
	Michael Walle <michael@walle.cc>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: APiiIsLc2ePW

On Sat, 13 Jan 2018 23:04:12 -0300
Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:

> changes generated using the following Coccinelle patch:
>=20
>   @@
>   type DeviceParentClass;
>   DeviceParentClass *pc;
>   DeviceClass *dc;
>   identifier parent_fn;
>   identifier child_fn;
>   @@
>   (
>   +device_class_set_parent_realize(dc, child_fn, &pc->parent_fn);
>   -pc->parent_fn =3D dc->realize;
>   ...
>   -dc->realize =3D child_fn;
>   |
>   +device_class_set_parent_unrealize(dc, child_fn, &pc->parent_fn);
>   -pc->parent_fn =3D dc->unrealize;
>   ...
>   -dc->unrealize =3D child_fn;
>   |
>   +device_class_set_parent_reset(dc, child_fn, &pc->parent_fn);
>   -pc->parent_fn =3D dc->reset;
>   ...
>   -dc->reset =3D child_fn;
>   )
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/i386/kvm/i8254.c                | 4 ++--
>  hw/i386/kvm/i8259.c                | 3 +--
>  hw/input/adb-kbd.c                 | 4 ++--
>  hw/input/adb-mouse.c               | 4 ++--
>  hw/intc/arm_gic.c                  | 3 +--
>  hw/intc/arm_gic_kvm.c              | 7 +++----
>  hw/intc/arm_gicv3.c                | 3 +--
>  hw/intc/arm_gicv3_its_kvm.c        | 3 +--
>  hw/intc/arm_gicv3_kvm.c            | 7 +++----
>  hw/intc/i8259.c                    | 3 +--
>  hw/net/vmxnet3.c                   | 4 ++--
>  hw/pci-bridge/gen_pcie_root_port.c | 3 +--
>  hw/scsi/vmw_pvscsi.c               | 4 ++--
>  hw/timer/i8254.c                   | 3 +--
>  hw/vfio/amd-xgbe.c                 | 4 ++--
>  hw/vfio/calxeda-xgmac.c            | 4 ++--
>  hw/virtio/virtio-pci.c             | 4 ++--
>  target/alpha/cpu.c                 | 4 ++--
>  target/arm/cpu.c                   | 4 ++--
>  target/cris/cpu.c                  | 4 ++--
>  target/hppa/cpu.c                  | 4 ++--
>  target/i386/cpu.c                  | 8 ++++----
>  target/lm32/cpu.c                  | 5 ++---
>  target/m68k/cpu.c                  | 5 ++---
>  target/microblaze/cpu.c            | 5 ++---
>  target/mips/cpu.c                  | 5 ++---
>  target/moxie/cpu.c                 | 5 ++---
>  target/nios2/cpu.c                 | 4 ++--
>  target/openrisc/cpu.c              | 5 ++---
>  target/ppc/translate_init.c        | 8 ++++----
>  target/s390x/cpu.c                 | 4 ++--
>  target/sh4/cpu.c                   | 4 ++--
>  target/sparc/cpu.c                 | 4 ++--
>  target/tilegx/cpu.c                | 4 ++--
>  target/tricore/cpu.c               | 4 ++--
>  target/unicore32/cpu.c             | 4 ++--
>  target/xtensa/cpu.c                | 4 ++--
>  37 files changed, 73 insertions(+), 88 deletions(-)

> diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
> index ae3cee91a2..4c068cedff 100644
> --- a/target/s390x/cpu.c
> +++ b/target/s390x/cpu.c
> @@ -463,8 +463,8 @@ static void s390_cpu_class_init(ObjectClass *oc, void=
 *data)
>      CPUClass *cc =3D CPU_CLASS(scc);
>      DeviceClass *dc =3D DEVICE_CLASS(oc);
> =20
> -    scc->parent_realize =3D dc->realize;
> -    dc->realize =3D s390_cpu_realizefn;
> +    device_class_set_parent_realize(dc, s390_cpu_realizefn,
> +                                    &scc->parent_realize);
>      dc->props =3D s390x_cpu_properties;
>      dc->user_creatable =3D true;
> =20

s390x change:

Acked-by: Cornelia Huck <cohuck@redhat.com>
