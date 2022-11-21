Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2159010ejx;
        Sun, 20 Nov 2022 23:44:36 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6NPFTgJileG4aliLmb5xKWQTkv2P2ze83EU3Sj/iFVdFm2+7mj43TdxWhEhE5Q1ykg08wx
X-Received: by 2002:a05:620a:15fc:b0:6fa:452a:a588 with SMTP id p28-20020a05620a15fc00b006fa452aa588mr2287819qkm.600.1669016676131;
        Sun, 20 Nov 2022 23:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669016676; cv=none;
        d=google.com; s=arc-20160816;
        b=0wsPtsv32a7C3LmPQ+gkXMz6THNeS4qMqnExWpVy7vN+JqmqF6wdcMw0CsvT0c7aO9
         jWo9GYuJh3n3bTpCaqtwmX6BG/Xkr3e4z4VIdNVLyKZgk/VrcuWzc2208PM2k/rhoHOn
         sN5VJxS/Zg166yQN9W/NOqt08gYA1IlKTZIjt8ULR2ZRdi49bHWTa46ASBlMFL2hE3QU
         nAN3EB5UUaiRmPVH5VEqXcjqIOyBqJg+oAPsBhRYu2+vxUJvY0bvo1bJiojMG6C29rSe
         dQtjzBhV7CeRhNrDKoNrEov81BqTFYgrKgKXm2oazdWxFerWn0atmrbjvPbn8ksDPMnA
         YVkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=MGzzpp85gLzkiQhazm2FXp8dFhUOQgU5cDDhi/bg5Z8=;
        b=L9JvJBAAcZiT75chLKgk/egRB0/opdgDY4uWfCsP7nIS+DTCo2F76FfhGChjfXDpjd
         8UUOUuTpOmJ4C+Vc4CrJ20QWAvi9G5sZJI5lB7+zUGlKh1frgX/RcbafEe30WAKndWKF
         YFRS5eUIpSB/XOxC4c0NyCJc+N3Sjyz2/CZu6Y6uU/cgV7llxRYj1JaG3eqchbWebPmY
         dKzx5M45LBCtIQsQZ/sw6u6ZWbbvJ9giap0xZV9ieS+Rlk4yZdW/QlcZ9YMwH4JujTbE
         lkymr/KGenDQ0sj+rgvdUz8CuslGVWQl5JLfhRbgRGyDboM9zOt1jpE6L4rsI83XigKV
         gaKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pp2Nowy+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fn6-20020ad45d66000000b00496d277e855si961452qvb.420.2022.11.20.23.44.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Nov 2022 23:44:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Pp2Nowy+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ox1TH-00072x-7Y; Mon, 21 Nov 2022 02:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ox1TG-00072I-01
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 02:44:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1ox1TB-0003ov-5t
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 02:44:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669016636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MGzzpp85gLzkiQhazm2FXp8dFhUOQgU5cDDhi/bg5Z8=;
 b=Pp2Nowy+VsEr4xNdwAq/wUJyEyEEQJPUM3HTHXpFizYHHh/3obeYwweRSkDK4DpB18Uvl+
 cilUeRZZBxoaa9FrCO/toyx/bJE+/p40giLF3DweAI1ET8ulzU61BNNj9XxYXE1ih6unTt
 WwHDe3rY8Kicz749HmLiAzazzuAuPNk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-390-UkJKIH3KMsG18CbFChu22w-1; Mon, 21 Nov 2022 02:43:55 -0500
X-MC-Unique: UkJKIH3KMsG18CbFChu22w-1
Received: by mail-ej1-f71.google.com with SMTP id
 qa14-20020a170907868e00b007ae24f77742so6094701ejc.8
 for <qemu-arm@nongnu.org>; Sun, 20 Nov 2022 23:43:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MGzzpp85gLzkiQhazm2FXp8dFhUOQgU5cDDhi/bg5Z8=;
 b=4Ahdt8qBVCosvLgEZro7sQIm/EQrAUeBbnfGmyj8AhpkCRVH6WVmDRom2nbPAII/zN
 0qvjWWRdmR80TZPzyBHKvOA3ZltVkIbcHErzS+vSeMCVuajZyExvdStsST/FlrR1MO3w
 HFYl3PUpIpWJAvd6etzDdhllE9Hh65+TceEbVNEfxO8ON25iWTrLiAlI8pxyfindNK2F
 Yu9OycfqbPLzRkmWb/TOpvGxJRRl/ild2tqFlZOJ3/8gmHCOUcxgB7X6WFbBUSi2eazY
 JxiubPnpu8gxV22T6MKgla5IqsTjaOBwtSzvROs2FRD/BMLZLfn+pA34Ey5e3i/qLYJB
 75vw==
X-Gm-Message-State: ANoB5pl3UXWFOPdRQXAjU63YuPnu1a5dK43uSns2uw4aAQ16U94XkMXG
 dYnkm+q1wSIwTEJEofX8J7J4SBVoz7KBmlc9oFgFm5/jMTA089/1f0pydi51nwjQE8qIXmj2keB
 eKiRB8uG7OmSb
X-Received: by 2002:a05:6402:4507:b0:467:205b:723d with SMTP id
 ez7-20020a056402450700b00467205b723dmr5487060edb.69.1669016633675; 
 Sun, 20 Nov 2022 23:43:53 -0800 (PST)
X-Received: by 2002:a05:6402:4507:b0:467:205b:723d with SMTP id
 ez7-20020a056402450700b00467205b723dmr5487034edb.69.1669016633287; 
 Sun, 20 Nov 2022 23:43:53 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 e25-20020a056402105900b004610899742asm4820835edu.13.2022.11.20.23.43.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Nov 2022 23:43:52 -0800 (PST)
Date: Mon, 21 Nov 2022 08:43:51 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 mst@redhat.com, ani@anisinha.ca, pbonzini@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 andrew.smirnov@gmail.com, paulburton@kernel.org,
 aleksandar.rikalo@syrmia.com, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au, groug@kaod.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
Subject: Re: [PATCH 1/2] remove DEC 21154 PCI bridge
Message-ID: <20221121084351.3e1ccc1f@imammedo.users.ipa.redhat.com>
In-Reply-To: <916f93a2-3b0d-3e52-5137-995496c4aefa@ilande.co.uk>
References: <20221116152730.3691347-1-imammedo@redhat.com>
 <20221116152730.3691347-2-imammedo@redhat.com>
 <79ad881d-ac77-5bca-bd5f-ba6290b2c830@eik.bme.hu>
 <916f93a2-3b0d-3e52-5137-995496c4aefa@ilande.co.uk>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UvIqai6Dyse+

On Sun, 20 Nov 2022 22:08:54 +0000
Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk> wrote:

> On 16/11/2022 19:39, BALATON Zoltan wrote:
>=20
> > On Wed, 16 Nov 2022, Igor Mammedov wrote:
> >  =20
> >> Code has not been used practically since its inception (2004)
> >> =C2=A0f2aa58c6f4a20 UniNorth PCI bridge support
> >> or maybe even earlier, but it was consuming contributors time
> >> as QEMU was being rewritten.
> >> Drop it for now. Whomever would like to actually
> >> use the thing, can make sure it actually works/reintroduce
> >> it back when there is a user.
> >>
> >> PS:
> >> I've stumbled upon this when replacing PCIDeviceClass::is_bridge
> >> field with QOM cast to PCI_BRIDGE type. Unused DEC 21154
> >> was the only one trying to use the field with plain PCIDevice.
> >> It's not worth keeping the field around for the sake of the code
> >> that was commented out 'forever'.
> >>
> >> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> >> ---
> >> hw/pci-bridge/dec.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 =
9 ---
> >> include/hw/pci/pci_ids.h=C2=A0 |=C2=A0=C2=A0 1 -
> >> hw/pci-bridge/dec.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 164 --------=
------------------------------
> >> hw/pci-bridge/meson.build |=C2=A0=C2=A0 2 -
> >> hw/pci-host/uninorth.c=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 --
> >> 5 files changed, 182 deletions(-)
> >> delete mode 100644 hw/pci-bridge/dec.h
> >> delete mode 100644 hw/pci-bridge/dec.c
> >>
> >> diff --git a/hw/pci-bridge/dec.h b/hw/pci-bridge/dec.h
> >> deleted file mode 100644
> >> index 869e90b136..0000000000
> >> --- a/hw/pci-bridge/dec.h
> >> +++ /dev/null
> >> @@ -1,9 +0,0 @@
> >> -#ifndef HW_PCI_BRIDGE_DEC_H
> >> -#define HW_PCI_BRIDGE_DEC_H
> >> -
> >> -
> >> -#define TYPE_DEC_21154 "dec-21154-sysbus"
> >> -
> >> -PCIBus *pci_dec_21154_init(PCIBus *parent_bus, int devfn);
> >> -
> >> -#endif
> >> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> >> index bc9f834fd1..e4386ebb20 100644
> >> --- a/include/hw/pci/pci_ids.h
> >> +++ b/include/hw/pci/pci_ids.h
> >> @@ -169,7 +169,6 @@
> >>
> >> #define PCI_VENDOR_ID_DEC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1011
> >> #define PCI_DEVICE_ID_DEC_21143=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x0019
> >> -#define PCI_DEVICE_ID_DEC_21154=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 0x0026
> >>
> >> #define PCI_VENDOR_ID_CIRRUS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x1013
> >>
> >> diff --git a/hw/pci-bridge/dec.c b/hw/pci-bridge/dec.c
> >> deleted file mode 100644
> >> index 4773d07e6d..0000000000
> >> --- a/hw/pci-bridge/dec.c
> >> +++ /dev/null
> >> @@ -1,164 +0,0 @@
> >> -/*
> >> - * QEMU DEC 21154 PCI bridge
> >> - *
> >> - * Copyright (c) 2006-2007 Fabrice Bellard
> >> - * Copyright (c) 2007 Jocelyn Mayer
> >> - *
> >> - * Permission is hereby granted, free of charge, to any person obtain=
ing a copy
> >> - * of this software and associated documentation files (the "Software=
"), to deal
> >> - * in the Software without restriction, including without limitation =
the rights
> >> - * to use, copy, modify, merge, publish, distribute, sublicense, and/=
or sell
> >> - * copies of the Software, and to permit persons to whom the Software=
 is
> >> - * furnished to do so, subject to the following conditions:
> >> - *
> >> - * The above copyright notice and this permission notice shall be inc=
luded in
> >> - * all copies or substantial portions of the Software.
> >> - *
> >> - * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EX=
PRESS OR
> >> - * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTAB=
ILITY,
> >> - * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT =
SHALL
> >> - * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES =
OR OTHER
> >> - * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, AR=
ISING FROM,
> >> - * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEAL=
INGS IN
> >> - * THE SOFTWARE.
> >> - */
> >> -
> >> -#include "qemu/osdep.h"
> >> -#include "dec.h"
> >> -#include "hw/sysbus.h"
> >> -#include "qapi/error.h"
> >> -#include "qemu/module.h"
> >> -#include "hw/pci/pci.h"
> >> -#include "hw/pci/pci_host.h"
> >> -#include "hw/pci/pci_bridge.h"
> >> -#include "hw/pci/pci_bus.h"
> >> -#include "qom/object.h"
> >> -
> >> -OBJECT_DECLARE_SIMPLE_TYPE(DECState, DEC_21154)
> >> -
> >> -struct DECState {
> >> -=C2=A0=C2=A0=C2=A0 PCIHostState parent_obj;
> >> -};
> >> -
> >> -static int dec_map_irq(PCIDevice *pci_dev, int irq_num)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 return irq_num;
> >> -}
> >> -
> >> -static void dec_pci_bridge_realize(PCIDevice *pci_dev, Error **errp)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 pci_bridge_initfn(pci_dev, TYPE_PCI_BUS);
> >> -}
> >> -
> >> -static void dec_21154_pci_bridge_class_init(ObjectClass *klass, void =
*data)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);
> >> -=C2=A0=C2=A0=C2=A0 PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> >> -
> >> -=C2=A0=C2=A0=C2=A0 set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> >> -=C2=A0=C2=A0=C2=A0 k->realize =3D dec_pci_bridge_realize;
> >> -=C2=A0=C2=A0=C2=A0 k->exit =3D pci_bridge_exitfn;
> >> -=C2=A0=C2=A0=C2=A0 k->vendor_id =3D PCI_VENDOR_ID_DEC;
> >> -=C2=A0=C2=A0=C2=A0 k->device_id =3D PCI_DEVICE_ID_DEC_21154;
> >> -=C2=A0=C2=A0=C2=A0 k->config_write =3D pci_bridge_write_config;
> >> -=C2=A0=C2=A0=C2=A0 k->is_bridge =3D true;
> >> -=C2=A0=C2=A0=C2=A0 dc->desc =3D "DEC 21154 PCI-PCI bridge";
> >> -=C2=A0=C2=A0=C2=A0 dc->reset =3D pci_bridge_reset;
> >> -=C2=A0=C2=A0=C2=A0 dc->vmsd =3D &vmstate_pci_device;
> >> -}
> >> -
> >> -static const TypeInfo dec_21154_pci_bridge_info =3D {
> >> -=C2=A0=C2=A0=C2=A0 .name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D "dec-21154-p2p-bridge",
> >> -=C2=A0=C2=A0=C2=A0 .parent=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D TYPE_PCI_BRIDGE,
> >> -=C2=A0=C2=A0=C2=A0 .instance_size =3D sizeof(PCIBridge),
> >> -=C2=A0=C2=A0=C2=A0 .class_init=C2=A0=C2=A0=C2=A0 =3D dec_21154_pci_br=
idge_class_init,
> >> -=C2=A0=C2=A0=C2=A0 .interfaces =3D (InterfaceInfo[]) {
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { INTERFACE_CONVENTIONAL_P=
CI_DEVICE },
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { },
> >> -=C2=A0=C2=A0=C2=A0 },
> >> -};
> >> -
> >> -PCIBus *pci_dec_21154_init(PCIBus *parent_bus, int devfn)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 PCIDevice *dev;
> >> -=C2=A0=C2=A0=C2=A0 PCIBridge *br;
> >> -
> >> -=C2=A0=C2=A0=C2=A0 dev =3D pci_new_multifunction(devfn, false, "dec-2=
1154-p2p-bridge");
> >> -=C2=A0=C2=A0=C2=A0 br =3D PCI_BRIDGE(dev);
> >> -=C2=A0=C2=A0=C2=A0 pci_bridge_map_irq(br, "DEC 21154 PCI-PCI bridge",=
 dec_map_irq);
> >> -=C2=A0=C2=A0=C2=A0 pci_realize_and_unref(dev, parent_bus, &error_fata=
l);
> >> -=C2=A0=C2=A0=C2=A0 return pci_bridge_get_sec_bus(br);
> >> -}
> >> -
> >> -static void pci_dec_21154_device_realize(DeviceState *dev, Error **er=
rp)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 PCIHostState *phb;
> >> -=C2=A0=C2=A0=C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(dev);
> >> -
> >> -=C2=A0=C2=A0=C2=A0 phb =3D PCI_HOST_BRIDGE(dev);
> >> -
> >> -=C2=A0=C2=A0=C2=A0 memory_region_init_io(&phb->conf_mem, OBJECT(dev),=
 &pci_host_conf_le_ops,
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dev, "pci-conf-idx", 0x1000);
> >> -=C2=A0=C2=A0=C2=A0 memory_region_init_io(&phb->data_mem, OBJECT(dev),=
 &pci_host_data_le_ops,
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 dev, "pci-data-idx", 0x1000);
> >> -=C2=A0=C2=A0=C2=A0 sysbus_init_mmio(sbd, &phb->conf_mem);
> >> -=C2=A0=C2=A0=C2=A0 sysbus_init_mmio(sbd, &phb->data_mem);
> >> -}
> >> -
> >> -static void dec_21154_pci_host_realize(PCIDevice *d, Error **errp)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 /* PCI2PCI bridge same values as PearPC - check th=
is */
> >> -}
> >> -
> >> -static void dec_21154_pci_host_class_init(ObjectClass *klass, void *d=
ata)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 PCIDeviceClass *k =3D PCI_DEVICE_CLASS(klass);
> >> -=C2=A0=C2=A0=C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);
> >> -
> >> -=C2=A0=C2=A0=C2=A0 set_bit(DEVICE_CATEGORY_BRIDGE, dc->categories);
> >> -=C2=A0=C2=A0=C2=A0 k->realize =3D dec_21154_pci_host_realize;
> >> -=C2=A0=C2=A0=C2=A0 k->vendor_id =3D PCI_VENDOR_ID_DEC;
> >> -=C2=A0=C2=A0=C2=A0 k->device_id =3D PCI_DEVICE_ID_DEC_21154;
> >> -=C2=A0=C2=A0=C2=A0 k->revision =3D 0x02;
> >> -=C2=A0=C2=A0=C2=A0 k->class_id =3D PCI_CLASS_BRIDGE_PCI;
> >> -=C2=A0=C2=A0=C2=A0 k->is_bridge =3D true;
> >> -=C2=A0=C2=A0=C2=A0 /*
> >> -=C2=A0=C2=A0=C2=A0=C2=A0 * PCI-facing part of the host bridge, not us=
able without the
> >> -=C2=A0=C2=A0=C2=A0=C2=A0 * host-facing part, which can't be device_ad=
d'ed, yet.
> >> -=C2=A0=C2=A0=C2=A0=C2=A0 */
> >> -=C2=A0=C2=A0=C2=A0 dc->user_creatable =3D false;
> >> -}
> >> -
> >> -static const TypeInfo dec_21154_pci_host_info =3D {
> >> -=C2=A0=C2=A0=C2=A0 .name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D "dec-21154",
> >> -=C2=A0=C2=A0=C2=A0 .parent=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D TYPE_PCI_DEVICE,
> >> -=C2=A0=C2=A0=C2=A0 .instance_size =3D sizeof(PCIDevice),
> >> -=C2=A0=C2=A0=C2=A0 .class_init=C2=A0=C2=A0=C2=A0 =3D dec_21154_pci_ho=
st_class_init,
> >> -=C2=A0=C2=A0=C2=A0 .interfaces =3D (InterfaceInfo[]) {
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { INTERFACE_CONVENTIONAL_P=
CI_DEVICE },
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 { },
> >> -=C2=A0=C2=A0=C2=A0 },
> >> -};
> >> -
> >> -static void pci_dec_21154_device_class_init(ObjectClass *klass, void =
*data)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);
> >> -
> >> -=C2=A0=C2=A0=C2=A0 dc->realize =3D pci_dec_21154_device_realize;
> >> -}
> >> -
> >> -static const TypeInfo pci_dec_21154_device_info =3D {
> >> -=C2=A0=C2=A0=C2=A0 .name=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D TYPE_DEC_21154,
> >> -=C2=A0=C2=A0=C2=A0 .parent=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
=3D TYPE_PCI_HOST_BRIDGE,
> >> -=C2=A0=C2=A0=C2=A0 .instance_size =3D sizeof(DECState),
> >> -=C2=A0=C2=A0=C2=A0 .class_init=C2=A0=C2=A0=C2=A0 =3D pci_dec_21154_de=
vice_class_init,
> >> -};
> >> -
> >> -static void dec_register_types(void)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 type_register_static(&pci_dec_21154_device_info);
> >> -=C2=A0=C2=A0=C2=A0 type_register_static(&dec_21154_pci_host_info);
> >> -=C2=A0=C2=A0=C2=A0 type_register_static(&dec_21154_pci_bridge_info);
> >> -}
> >> -
> >> -type_init(dec_register_types)
> >> diff --git a/hw/pci-bridge/meson.build b/hw/pci-bridge/meson.build
> >> index 243ceeda50..fe92d43de6 100644
> >> --- a/hw/pci-bridge/meson.build
> >> +++ b/hw/pci-bridge/meson.build
> >> @@ -8,8 +8,6 @@ pci_ss.add(when: 'CONFIG_PXB', if_true:=20
> >> files('pci_expander_bridge.c'),
> >> pci_ss.add(when: 'CONFIG_XIO3130', if_true: files('xio3130_upstream.c'=
,=20
> >> 'xio3130_downstream.c'))
> >> pci_ss.add(when: 'CONFIG_CXL', if_true: files('cxl_root_port.c', 'cxl_=
upstream.c',=20
> >> 'cxl_downstream.c'))
> >>
> >> -# NewWorld PowerMac
> >> -pci_ss.add(when: 'CONFIG_DEC_PCI', if_true: files('dec.c'))
> >> # Sun4u
> >> pci_ss.add(when: 'CONFIG_SIMBA', if_true: files('simba.c'))
> >>
> >> diff --git a/hw/pci-host/uninorth.c b/hw/pci-host/uninorth.c
> >> index aebd44d265..5c617e86c1 100644
> >> --- a/hw/pci-host/uninorth.c
> >> +++ b/hw/pci-host/uninorth.c
> >> @@ -127,12 +127,6 @@ static void pci_unin_main_realize(DeviceState *de=
v, Error **errp)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCI_DEVFN(11, =
0), 4, TYPE_PCI_BUS);
> >>
> >> =C2=A0=C2=A0=C2=A0 pci_create_simple(h->bus, PCI_DEVFN(11, 0), "uni-no=
rth-pci");
> >> -
> >> -=C2=A0=C2=A0=C2=A0 /* DEC 21154 bridge */
> >> -#if 0
> >> -=C2=A0=C2=A0=C2=A0 /* XXX: not activated as PPC BIOS doesn't handle m=
ultiple buses properly */ =20
> >=20
> > I think real hardware has this bridge and QEMU could emulate it but Ope=
nBIOS can't=20
> > handle more than one PCI bus or this bridge yet so this was disabled fo=
r that reason.=20
> > Maybe leave the comment around as a reminder that this could be brought=
 back from git=20
> > history if somebody wants to fix it in the future, otherwise this may b=
e forgotten=20
> > and reimplemented from scratch. =20
>=20
> Unlike OpenHackWare, OpenBIOS can enumerate PCI topologies containing PCI=
-PCI bridges=20
> and I believe this is the bridge present in New World machines. Since thi=
s bridge=20
> exists on the "main" PCI bus then in theory it should be possible to enab=
le it=20
> without any changes required for OpenBIOS.
>=20
> Having said that, my time working on QEMU is limited in the short term so=
 I'd have a=20
> mild preference to keep it, but if it causes problems then it's easy enou=
gh to=20
> retrieve from git history later.
Problem I've met with is that it uses is_bridge field with plain PCIDevice
and it's the only unconventional instance that does this.

Also wrt device model the rest of hostbridges impl. aren't split to 'subdev=
ices'
as with this DEC model. So perhaps it should be rewritten to match common
pattern is possible.

As for short term (as if 19 years were too short interval), I'd prefer it r=
emoved
for now (it easily can be brought back once someone bothers to make sure it=
 works
as expected). I'll leave a comment around mentioning that as it was suggest=
ed.

(it also should save us some CI time budget, however minuscule but it build=
s up)
=20
> ATB,
>=20
> Mark.
>=20

