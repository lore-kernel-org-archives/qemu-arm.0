Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp935069lfp;
        Thu, 23 Jan 2020 09:37:50 -0800 (PST)
X-Google-Smtp-Source: APXvYqwKqlVIZji6N6eTAK7SwfzT1M3BS7bi30+lmExLYRVkWW9rvcgjBJ7QG+UezICYVhqYY+c+
X-Received: by 2002:a37:62c9:: with SMTP id w192mr4504917qkb.391.1579801069939;
        Thu, 23 Jan 2020 09:37:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579801069; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUn9QFrGG8Ab5409BEYAi6kX6DC5IHz+NUpIgiqXgUj/kow+I5BGZVaYmDW594jYmX
         /eCc1G8jf9zvFmW43tCJRrB6vLRAywtM17luseUIVC/g9S2Y1atVBPHX8rsOcW5/mMQd
         zdyqTuhUixlxycOo4qOsSvDEdXqRUTLLO2Rhopmz1wz1eKw4UL6peYnZai4Su5LdQQTA
         gAS0JagSVP1BuTDGzrYBFS8evaxj9PrpDIHbL7h/PDfSpypzhnVueoDXrVDsJhG3YlvQ
         69CWKhR67JTOW6EhtqmV98wsgwAHm8fZ7HgHPR87iQHxgYC0BkGlpuGCpq5JV2qUkB4q
         HYDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=ZEOJ4hHDlpjG53G0NmYTegfHo15aL+AiedS0R0mF8Fw=;
        b=mD2yqmFyHvPOSigBBHLyHu5usPoxqa99vLHlCODNWfsIfPkZQd8XfypoENAuzE3Onk
         hMN4Hl0zxUJXmfLcue19k70BBBgez+ArkFrK7T3Y7IG/f7VpMMcXtuiHZfTNLpZW16Pj
         QNMrZBSR09gulJsR8nKWj5WSiUeofRv+eg9ul06GwKkEGk+HgrSaDtg5Np90rkGUTE6o
         9Fnpe3WL5VRdW5ZetzziWxw5jyLfgVo2YZmNq0FWMDG1NF1PWERT+bI5FrST0ZiCqE7G
         nrPoQphp9BNCgH0IgdaXDWITtjgmB/cVNnrjskrGz5O3SqcAVcXAl8FNjvSYPP77eoVJ
         a1cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b7R4aXXT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si1942774qka.271.2020.01.23.09.37.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 09:37:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b7R4aXXT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iugQP-0005KK-0M
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 12:37:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iudcP-0001hE-NZ
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 09:38:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iudcO-0002P8-Hz
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 09:38:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43768
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iudcO-0002O6-EE
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 09:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579790279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZEOJ4hHDlpjG53G0NmYTegfHo15aL+AiedS0R0mF8Fw=;
 b=b7R4aXXTnjw2/ddkDHaTQstaHFJpCCfMIySX6/SUjSXiKQjXJ+O2w03dwyLaMmCRYBQDIN
 xlDYA8HKTu4GsEzqStvtzwyvA7v/7KVx8W2bDNiQLgXiDcjfpFAsxC2dZB8CYL2O80x9ql
 dYNAHcCEMXiX5YboHoW2VOF8oDs+oxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-6OfRk62_Nb-FACkmJUQTyw-1; Thu, 23 Jan 2020 09:37:58 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01098107ACC4;
 Thu, 23 Jan 2020 14:37:57 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 032FE86810;
 Thu, 23 Jan 2020 14:37:55 +0000 (UTC)
Date: Thu, 23 Jan 2020 15:37:53 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 20/80] arm/mps2-tz: use memdev for RAM
Message-ID: <20200123143753.5thh23czkypa76sh@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-21-git-send-email-imammedo@redhat.com>
 <20200123125909.p2aq3ad2x5l24zq5@kamzik.brq.redhat.com>
 <20200123143948.4ef7b702@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200123143948.4ef7b702@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 6OfRk62_Nb-FACkmJUQTyw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5AMFW0ZnEZCq

On Thu, Jan 23, 2020 at 02:39:48PM +0100, Igor Mammedov wrote:
> On Thu, 23 Jan 2020 13:59:09 +0100
> Andrew Jones <drjones@redhat.com> wrote:
>=20
> > On Thu, Jan 23, 2020 at 12:37:45PM +0100, Igor Mammedov wrote:
> > > memory_region_allocate_system_memory() API is going away, so
> > > replace it with memdev allocated MemoryRegion. The later is
> > > initialized by generic code, so board only needs to opt in
> > > to memdev scheme by providing
> > >   MachineClass::default_ram_id
> > > and using MachineState::ram instead of manually initializing
> > > RAM memory region.
> > >=20
> > > PS:
> > >  while at it add check for user supplied RAM size and error
> > >  out if it mismatches board expected value.
> > >=20
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > ---
> > > v2:
> > >   * fix format string causing build failure on 32-bit host
> > >     (Philippe Mathieu-Daud=E9 <philmd@redhat.com>)
> > >=20
> > > CC: drjones@redhat.com
> > > CC: peter.maydell@linaro.org
> > > CC: qemu-arm@nongnu.org
> > > ---
> > >  hw/arm/mps2-tz.c | 15 +++++++++++----
> > >  1 file changed, 11 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> > > index f8b620b..06dacf6 100644
> > > --- a/hw/arm/mps2-tz.c
> > > +++ b/hw/arm/mps2-tz.c
> > > @@ -39,6 +39,7 @@
> > > =20
> > >  #include "qemu/osdep.h"
> > >  #include "qemu/units.h"
> > > +#include "qemu/cutils.h"
> > >  #include "qapi/error.h"
> > >  #include "qemu/error-report.h"
> > >  #include "hw/arm/boot.h"
> > > @@ -79,7 +80,6 @@ typedef struct {
> > >      MachineState parent;
> > > =20
> > >      ARMSSE iotkit;
> > > -    MemoryRegion psram;
> > >      MemoryRegion ssram[3];
> > >      MemoryRegion ssram1_m;
> > >      MPS2SCC scc;
> > > @@ -388,6 +388,13 @@ static void mps2tz_common_init(MachineState *mac=
hine)
> > >          exit(1);
> > >      }
> > > =20
> > > +    if (machine->ram_size !=3D mc->default_ram_size) {
> > > +        char *sz =3D size_to_str(mc->default_ram_size);
> > > +        error_report("Invalid RAM size, should be %s", sz);
> > > +        g_free(sz);
> > > +        exit(EXIT_FAILURE);
> > > +    }
> > > +
> > >      sysbus_init_child_obj(OBJECT(machine), "iotkit", &mms->iotkit,
> > >                            sizeof(mms->iotkit), mmc->armsse_type);
> > >      iotkitdev =3D DEVICE(&mms->iotkit);
> > > @@ -458,9 +465,7 @@ static void mps2tz_common_init(MachineState *mach=
ine)
> > >       * tradeoffs. For QEMU they're all just RAM, though. We arbitrar=
ily
> > >       * call the 16MB our "system memory", as it's the largest lump.
> > >       */
> > > -    memory_region_allocate_system_memory(&mms->psram,
> > > -                                         NULL, "mps.ram", 16 * MiB);
> > > -    memory_region_add_subregion(system_memory, 0x80000000, &mms->psr=
am);
> > > +    memory_region_add_subregion(system_memory, 0x80000000, machine->=
ram);
> > > =20
> > >      /* The overflow IRQs for all UARTs are ORed together.
> > >       * Tx, Rx and "combined" IRQs are sent to the NVIC separately.
> > > @@ -642,6 +647,7 @@ static void mps2tz_class_init(ObjectClass *oc, vo=
id *data)
> > > =20
> > >      mc->init =3D mps2tz_common_init;
> > >      iic->check =3D mps2_tz_idau_check;
> > > +    mc->default_ram_id =3D "mps.ram";
> > >  }
> > > =20
> > >  static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
> > > @@ -657,6 +663,7 @@ static void mps2tz_an505_class_init(ObjectClass *=
oc, void *data)
> > >      mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-m33");
> > >      mmc->scc_id =3D 0x41045050;
> > >      mmc->armsse_type =3D TYPE_IOTKIT;
> > > +    mc->default_ram_size =3D 16 * MiB; =20
> >=20
> > Shouldn't this line be added to mps2tz_class_init ?
>=20
> Yep, it should be there

With that change you can add my r-b.

Thanks,
drew

