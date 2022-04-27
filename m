Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1361343lfu;
        Wed, 27 Apr 2022 16:44:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYXsrYHJrm4e4fXYie/5YewAaggmxH8CA/n0LqRTd2OQHLsE+RgS+SCdl1gHD80c11nL3C
X-Received: by 2002:a05:622a:2c6:b0:2f3:591e:68ac with SMTP id a6-20020a05622a02c600b002f3591e68acmr19424919qtx.17.1651103083522;
        Wed, 27 Apr 2022 16:44:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651103083; cv=none;
        d=google.com; s=arc-20160816;
        b=MGe4Q2G8vq3XYqxfzgdBHLkklULXjgq8Q94Litem5JB6wOMpiu3SGW7KYx+rMM6QMz
         RC8u3vH4iJC1McBgOmUY9DC52VNlDlMQNmjA1jRe5ndhNqhUKBzmfPWKuHhCK08oWeWn
         ksuf8Pzy0jhDC43BLnSxf5zNdeWh9TZ7/pAT+70+ly+vMphQVH+3P7QhDcq4F2/ugIJR
         wbKs2rPyNEa2grvwj+9nMSmkMC+bl5yNbfDx2ryTuO3MOjcCa8zk2YOJoPzTP24l8GSA
         muRP79iVdjWCJ5kScoU70Xe2+d+eN7gnPxtmSpfhfdf4m4J3gS8aS/fEook5ABx4UVNR
         Xt/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:wdcironportexception:ironport-sdr:ironport-sdr
         :dkim-signature;
        bh=HJ+guQUmfkSU3cLDBU/C8A87LNugezFfxzm47WlFROU=;
        b=ZTgY8+cJTdifEYcCglyvwk1YR5MBqWNXnBCrO8z6rACf3NKR3P4XOTYr1OCkQIs0zp
         iXWF6pz1qAd+K0QvLs3PH+CVZyquXsBjkKTD8GyrtRNEGzAoNybz9e63lWyif0XY995G
         QMnLsSaAb4id2VcIHK1WjyZeFeoHviSO3n/HmVa8OyB9Ms18sTBtibF/MZncvbrXd9E2
         WJws9gOjZaibJxzkv4e2bjO+unyF+WyOXYAa/OPm2NvfRnU8LycXEYp5C8ZHEkRjYs+t
         Dbd0tx63e7/AANU+Q6SjXJ+05CCFxHibf1SDkSZSiF71GIEhDZlUfFkS1UlDtFxQu5Tq
         grPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=mAZKVB7E;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=EEgllN2n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6-20020a05622a190600b002f360465c60si1020247qtc.53.2022.04.27.16.44.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Apr 2022 16:44:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@wdc.com header.s=dkim.wdc.com header.b=mAZKVB7E;
       dkim=pass header.i=@opensource.wdc.com header.s=dkim header.b=EEgllN2n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=opensource.wdc.com
Received: from localhost ([::1]:51832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njrKs-0005Uh-Rp
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 19:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIc-0004yT-3q
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 19:42:22 -0400
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:48842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=109fe075d=alistair.francis@opensource.wdc.com>)
 id 1njrIa-0004WI-0S
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 19:42:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651102940; x=1682638940;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TRafi5SdzHuV4X0PCy+jdQib6Lt3hEKxPFu/WBMaC5c=;
 b=mAZKVB7EG4mvxdM5y3gWnAwQYSn4jQf9iZZwXcqe+bd63+jrGyuaEpdg
 rgYrM4XKAPCCeCaUU7b4FdjPbXlw93b6l/ZQJ8tDOSXMVMPlpFsr/4MaN
 Fz3Y702ev5RaVnPPS12WvBf93QCP+4f/hwsqKOqzN8TAKriPjI/n6H/sh
 RZM9iNnYHRRGoWR4p885fK7lLZR54grvYnfijP6KCWTSdpREurmHTST15
 xuUCHWJ3oBqlwqT2vzVph419+FGBWzVjLnN+dUtpMuQ1SVzbPKXvLwOo2
 T9Ynk0BOucno2XktX2HX5EJmVZdFc2OwnozhjQfKdG8iKcPSxcFYoQGPF w==;
X-IronPort-AV: E=Sophos;i="5.90,294,1643644800"; d="scan'208";a="197844551"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2022 07:42:17 +0800
IronPort-SDR: KYTLxt8m8NMbCa0je1OVcuoW+wtqGCUVf2w+5T3SBu5fyX2vnIWflMsiGeMOSBYWxThJy939+3
 eKZXTltxWE6XFAMZF44oRvTVIPhs1i/DFM2rOYowzrRWBhB3mivZoZcQClf4bqoxg4zIAyL0fa
 0aCa+UX13TcdcVENjSpDW86/gYOCthU6JOfBzna4ypYf/qbo20OEvPSz7Q9t0bef06IdcxsK2k
 5CoQhdwXA/Ja/gGSsgAbAKg1Hu3IoXiA0y8doAdE0q6gJYZTMRzrlggrq4TcmzoQsJ2BKLWLAj
 ZW1+cjwBw85a+oZ6XvRfeFRO
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:12:27 -0700
IronPort-SDR: 4Z7EVqasC1G9lveGiIszKXsMMLWYJ95ov2klSqcKJzvpzyERpLh+zzRbMrzXFGxWmIXy8ke5AY
 HuHzqbO37ihMsKXaB0N1Y2h7jZDjdqGkpW9FzYW1yj48rmOfOi99TmvCAOH4NpQBlDQ/FPFLtn
 H+xUnas8gXfj1cHaKPuVjaInN/z7Wlsv4swzPEzZDVAYzzy/ff1t6lqj3pJsSwGX50OM+06kqd
 G+kgW7A0IJUrSixmXhmUaK3+/sc6hAIyFTRg6GBgKrxRsODVaRRC4x9j6/vghWtxv4CkF52Li4
 BdI=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Apr 2022 16:42:18 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4KpZzY1HqMz1SVp0
 for <qemu-arm@nongnu.org>; Wed, 27 Apr 2022 16:42:17 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:mime-version
 :references:in-reply-to:x-mailer:message-id:date:subject:to
 :from; s=dkim; t=1651102936; x=1653694937; bh=TRafi5SdzHuV4X0PCy
 +jdQib6Lt3hEKxPFu/WBMaC5c=; b=EEgllN2nTrDwxEODlSH5eLnAF4eUKpbLMQ
 0kToOKCQQRXAhdY1Xd/g1XVg+TqaU4+MERWzQXaR0GsvHYnfF83DUH/bLh3KvcJi
 sIOCwoGh7swo4heV42CleWdiKXZj6B7axNqSruAsNNCAoWzO6Dqn9Dela6i1zO0u
 e2qJaJAEcbbPDviCb88S4hb3Zd4fdEfhKOEwpret9/LAVhAoKzs7PHOfbRXGQJ3H
 WqRkmr22wYa48Zy0cX32acetWfwHSl8sk6tc+IfptKh1gzX1DwLZ4f4IN17aDW4W
 BWei8frQbAtiMEZ+jBHyEVdQxijwdA4mHecV45g1yl10en2IVmOg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id FDSr4HvU4SbY for <qemu-arm@nongnu.org>;
 Wed, 27 Apr 2022 16:42:16 -0700 (PDT)
Received: from toolbox.wdc.com (unknown [10.225.165.122])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4KpZzS2MYsz1Rwrw;
 Wed, 27 Apr 2022 16:42:12 -0700 (PDT)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-riscv@nongnu.org,
	qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, alistair23@gmail.com,
 Palmer Dabbelt <palmer@dabbelt.com>, qemu-arm@nongnu.org,
 Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>, bmeng.cn@gmail.com
Subject: [PATCH v5 5/6] hw/riscv: virt: Add device plug support
Date: Thu, 28 Apr 2022 09:41:45 +1000
Message-Id: <20220427234146.1130752-6-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
References: <20220427234146.1130752-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.71.154.42;
 envelope-from=prvs=109fe075d=alistair.francis@opensource.wdc.com;
 helo=esa4.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6pGIsM5rbvOc

From: Alistair Francis <alistair.francis@wdc.com>

Add support for plugging in devices, this was tested with the TPM
device.

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 hw/riscv/virt.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index a2ffd04a78..da098917dd 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1569,10 +1569,37 @@ static void virt_set_aclint(Object *obj, bool val=
ue, Error **errp)
     s->have_aclint =3D value;
 }
=20
+static HotplugHandler *virt_machine_get_hotplug_handler(MachineState *ma=
chine,
+                                                        DeviceState *dev=
)
+{
+    MachineClass *mc =3D MACHINE_GET_CLASS(machine);
+
+    if (device_is_dynamic_sysbus(mc, dev)) {
+        return HOTPLUG_HANDLER(machine);
+    }
+    return NULL;
+}
+
+static void virt_machine_device_plug_cb(HotplugHandler *hotplug_dev,
+                                        DeviceState *dev, Error **errp)
+{
+    RISCVVirtState *s =3D RISCV_VIRT_MACHINE(hotplug_dev);
+
+    if (s->platform_bus_dev) {
+        MachineClass *mc =3D MACHINE_GET_CLASS(s);
+
+        if (device_is_dynamic_sysbus(mc, dev)) {
+            platform_bus_link_device(PLATFORM_BUS_DEVICE(s->platform_bus=
_dev),
+                                     SYS_BUS_DEVICE(dev));
+        }
+    }
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     char str[128];
     MachineClass *mc =3D MACHINE_CLASS(oc);
+    HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(oc);
=20
     mc->desc =3D "RISC-V VirtIO board";
     mc->init =3D virt_machine_init;
@@ -1584,6 +1611,10 @@ static void virt_machine_class_init(ObjectClass *o=
c, void *data)
     mc->get_default_cpu_node_id =3D riscv_numa_get_default_cpu_node_id;
     mc->numa_mem_supported =3D true;
     mc->default_ram_id =3D "riscv_virt_board.ram";
+    assert(!mc->get_hotplug_handler);
+    mc->get_hotplug_handler =3D virt_machine_get_hotplug_handler;
+
+    hc->plug =3D virt_machine_device_plug_cb;
=20
     machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
=20
@@ -1614,6 +1645,10 @@ static const TypeInfo virt_machine_typeinfo =3D {
     .class_init =3D virt_machine_class_init,
     .instance_init =3D virt_machine_instance_init,
     .instance_size =3D sizeof(RISCVVirtState),
+    .interfaces =3D (InterfaceInfo[]) {
+         { TYPE_HOTPLUG_HANDLER },
+         { }
+    },
 };
=20
 static void virt_machine_init_register_types(void)
--=20
2.35.1

