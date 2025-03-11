Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1680406njc;
        Tue, 11 Mar 2025 00:52:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoN0BOGPsIBMVnzG42BkPhSgJRxhFD/Wq2BkOs+2kGwmdfPovaO06QQ1YRU/O655VE22c4zqnbevayLA==@linaro.org
X-Google-Smtp-Source: AGHT+IGARo8em63vO5JF/W8RtZKOiX1KvsCFjjuX2TuquBei7xFDvpOK7Ycolcsn22jb5jGJ/eCG
X-Received: by 2002:ac8:5802:0:b0:471:ea1a:1cf6 with SMTP id d75a77b69052e-4761097cac0mr248753171cf.16.1741679542808;
        Tue, 11 Mar 2025 00:52:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741679542; cv=none;
        d=google.com; s=arc-20240605;
        b=c+ZF2a+5RSBAro52uVHhJaGD3rQTLcp/686C6E7DA4JlA0AqfEjP8Te8usdvwruxTw
         SxaNFSkSH34x8OZbQj50ERvkSDOoF/ww5TvaCvelY3v2X0xmrZrGOzbqOgDzcKC6fl9r
         aJNYsyttAhpSXv4OlVfS+OWLqB3f0ewVY2pomvmQTwFPMEgU3dyEl0tlx+WWUcWlxUTw
         Il7PBB3I/k6w+k98r0PxoezzLhDy3rLEm/GAsejF3wq2b+e8EDvwDvPFVteX0qWTmrYW
         EDXbBBsipVefqbwl/PacMb9yI4ZfOSa6Q5F7Hv3dORGE+rGcLMMdv/kFRiv5iWGV9xLZ
         gJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=tOCRYxeVN8kal8X/IUHfadE3OOAPaIu+bbg0lHmE2sw=;
        fh=SiIIwABAO+F4GFPjjy0Y8zqihChoOuE9SehuQsssXo8=;
        b=QlWVfMMmqPO/gAbGINaOFoz1WisVmHAYyPrZR95on/EKuiZQACtRRf5nnHTlQo+VpX
         LghzW0yP70F3/QAUQRecVTYpMjPLwHMWG1dJ8csa2a/BnUr9FNJivYAdIMNZibLx7iDz
         O0I1+maJpQlLTjmo4FrOPsM0rCMKS4Zi8qMuQgigWlRtPTYSZEpGl8eQN9539vr//fD6
         BmcLXibkEB6xbqKeXi07jaVXb1DeQ00tYeu5mo57iv447gRlU1drulydgAo50cvYDn+O
         EDs8mbZXB5oewwVXFcMmO/W/Cr1rLmLnDEQdfWiY6wQ6MnvTwjVlOUHBvXDsP7ej0jz0
         kWGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=C39QNago;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476695d3f53si63746971cf.522.2025.03.11.00.52.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 00:52:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=C39QNago;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1truPG-0006Kq-1X; Tue, 11 Mar 2025 03:52:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1truPD-0006IU-9C; Tue, 11 Mar 2025 03:52:03 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1truP6-0003cO-IE; Tue, 11 Mar 2025 03:52:02 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5e5e34f4e89so7612976a12.1; 
 Tue, 11 Mar 2025 00:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741679509; x=1742284309; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tOCRYxeVN8kal8X/IUHfadE3OOAPaIu+bbg0lHmE2sw=;
 b=C39QNago2JOxBlHVHxVqargPwX72fEACoB2ojmgFApXg/N5mBwjcjfc9mgKunA9CKM
 EZMORWD4hNW4XXHo80fszy1lpYajl1Yt4hf92l+0LskhRRoFnlxLu1UEpqpRKyd0C3iB
 /d2puWfXWVnP5atGB93/r3PAgw9wtf/NuOBFbJur3iPp+QfMk/eq/BS7jBZbnzePUOz6
 2qKXQQNPRd+IYRpQl0LBDe3nYhBziH6FJOBrZqvVr3Q4DM6DD5w8pKWzlwxTfAGUWfVX
 ybMYMDeefZTIpRvMd5y9Z87KbGm76kJ9tUcaWUVkaY7eIp0ZV4LL16YvSD3Vxr9RCgki
 CB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741679509; x=1742284309;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tOCRYxeVN8kal8X/IUHfadE3OOAPaIu+bbg0lHmE2sw=;
 b=c7MHUT1OOTI80onPoG5+9zs8EZwU3+Renloj6T+MKIjuko4kYlkPjdr51BFK8g0R5c
 akak+NQ4LaMfLyeyHm7PK5poV3BeOf7tBkSiVpGnTBGtsmYAarTQi0jYt7nAwZJqGf7h
 klWqA0buG5BC3m0O4R9SGkEBv6lZMUAjbt6nhGiCRqSq2oXkELkXcZ3+4fKbw+MEf8Ru
 yIItDIpfTBQ38KNpx0avL9nwomO0fTeuTgIZUcZNXtZQXYEdgXttRId/QgerTo4YSLDQ
 xiWfdRzwgyVUpZrc+5envd/uFeKsfM+eeQd8dN+KgrveV6xHydy33YbiT1JfN9GqJ4W5
 XW7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5TQmW2jS/nWTfT8cuV2s17kL4jMw71/kdXKNmOVFvsbLYM3uibdmRI073dfGsTnpMgGt5TxQh6a2qiA==@nongnu.org,
 AJvYcCVQwRAF2GBKav7EYO+vWXJqzcfTDc6aBC9rOVyQIcrkPn0xvLEFCqwuNb9exwn1krgvFDB97zLcIQ==@nongnu.org,
 AJvYcCWczxtjgr1iB5JfB+V/QGz3xvsviblwv64nfWkzy7K8cNiZoypmatXSOYrTMXgPOqMenO+Ty7EoxHz/bQ==@nongnu.org,
 AJvYcCWjWn1xF4wreg6b6X0h00YarOQBJsavH/B0pu2MJl2k5iSKeCBYE7Zoc53Law1nJHlgXI1XVZgjSGY=@nongnu.org
X-Gm-Message-State: AOJu0YwkJJHgZJMSmkzmmee2exq+cohooCXRfi6K5EvRSMQkGR/lkUfl
 75p8nELngxDDQ9XowRnvk8mi9tuqX37P8G9MWTfKFkOzcpjgqszV
X-Gm-Gg: ASbGncuJe2aVdopthdoAaUgn+QuyLLoa1KY6GqpGSzrVHChwxpMejb50rVZwbvHVytG
 vGlTn1iSlFYY1MtZra+igKPN+j3we84INgrQrQwq9Q51dk8c8Tq9i1L2rDLS0DE10ptllrSEOFR
 RwGmViPOFDuanaURk05s0Rl7xkVWVp0RfhjeaK2I3HRC+/yMU2ywmYq2N1xHN/Lz2O+6VceDyyI
 2IttNzPSC3TJpf7+hsb0xJWvdRzPrSgL04Py9zKBXrrialW01UdcqfDFGCkq3E8GPJGrNYj1ti0
 Mtjn5cOOtDDlr5MNbwDlIbBP5xPNTqIgW7q0fKg5Iw==
X-Received: by 2002:a17:907:9391:b0:ac2:c41b:f32b with SMTP id
 a640c23a62f3a-ac2c41c0272mr88232366b.28.1741679508732; 
 Tue, 11 Mar 2025 00:51:48 -0700 (PDT)
Received: from ?IPv6:::1? ([2a02:8106:5e:4000:69d2:56f6:a5af:50a8])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac23948578bsm890858966b.59.2025.03.11.00.51.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 00:51:48 -0700 (PDT)
Date: Tue, 11 Mar 2025 07:31:13 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
CC: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-block@nongnu.org,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_14/14=5D_hw/sd/sdhci=3A_Rem?=
 =?US-ASCII?Q?ove_unnecessary_=27endianness=27_property?=
In-Reply-To: <20250310000620.70120-15-philmd@linaro.org>
References: <20250310000620.70120-1-philmd@linaro.org>
 <20250310000620.70120-15-philmd@linaro.org>
Message-ID: <D6E3A7E5-7FF3-49AC-910F-02214E8E15AF@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +F1nb8w9PafW



Am 10=2E M=C3=A4rz 2025 00:06:20 UTC schrieb "Philippe Mathieu-Daud=C3=A9"=
 <philmd@linaro=2Eorg>:
>The previous commit removed the single use of instance
>setting the "endianness" property=2E
>
>Since classes can register their io_ops with correct
>endianness, no need to support different ones=2E
>
>Remove the code related to SDHCIState::endianess field=2E
>
>Remove the now unused SDHCIState::io_ops field, since we
>directly use the class one=2E
>
>Suggested-by: Bernhard Beschow <shentey@gmail=2Ecom>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> hw/sd/sdhci-internal=2Eh |  1 -
> include/hw/sd/sdhci=2Eh  |  2 --
> hw/sd/sdhci=2Ec          | 33 +++------------------------------
> 3 files changed, 3 insertions(+), 33 deletions(-)

I don't have the code in front of me right now=2E IIRC, the PCI subclass s=
ets the "endianness" property as well, but doesn't need to=2E This has to b=
e removed, otherwise creation of the PCI device will fail=2E

Best regards,
Bernhard

>
>diff --git a/hw/sd/sdhci-internal=2Eh b/hw/sd/sdhci-internal=2Eh
>index d99a8493db2=2E=2Ee4da6c831d1 100644
>--- a/hw/sd/sdhci-internal=2Eh
>+++ b/hw/sd/sdhci-internal=2Eh
>@@ -308,7 +308,6 @@ extern const VMStateDescription sdhci_vmstate;
> #define SDHC_CAPAB_REG_DEFAULT 0x057834b4
>=20
> #define DEFINE_SDHCI_COMMON_PROPERTIES(_state) \
>-    DEFINE_PROP_UINT8("endianness", _state, endianness, DEVICE_LITTLE_EN=
DIAN), \
>     DEFINE_PROP_UINT8("sd-spec-version", _state, sd_spec_version, 2), \
>     DEFINE_PROP_UINT8("uhs", _state, uhs_mode, UHS_NOT_SUPPORTED), \
>     \
>diff --git a/include/hw/sd/sdhci=2Eh b/include/hw/sd/sdhci=2Eh
>index e8fced5eedc=2E=2E1016a5b5b77 100644
>--- a/include/hw/sd/sdhci=2Eh
>+++ b/include/hw/sd/sdhci=2Eh
>@@ -54,7 +54,6 @@ struct SDHCIState {
>     AddressSpace sysbus_dma_as;
>     AddressSpace *dma_as;
>     MemoryRegion *dma_mr;
>-    const MemoryRegionOps *io_ops;
>=20
>     QEMUTimer *insert_timer;       /* timer for 'changing' sd card=2E */
>     QEMUTimer *transfer_timer;
>@@ -105,7 +104,6 @@ struct SDHCIState {
>=20
>     /* Configurable properties */
>     uint32_t quirks;
>-    uint8_t endianness;
>     uint8_t sd_spec_version;
>     uint8_t uhs_mode;
> };
>diff --git a/hw/sd/sdhci=2Ec b/hw/sd/sdhci=2Ec
>index 47e4bd1a610=2E=2Ecbb9f4ae8c0 100644
>--- a/hw/sd/sdhci=2Ec
>+++ b/hw/sd/sdhci=2Ec
>@@ -1391,17 +1391,6 @@ sdhci_write(void *opaque, hwaddr offset, uint64_t =
val, unsigned size)
> }
>=20
> static const MemoryRegionOps sdhci_mmio_le_ops =3D {
>-    =2Eread =3D sdhci_read,
>-    =2Ewrite =3D sdhci_write,
>-    =2Evalid =3D {
>-        =2Emin_access_size =3D 1,
>-        =2Emax_access_size =3D 4,
>-        =2Eunaligned =3D false
>-    },
>-    =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
>-};
>-
>-static const MemoryRegionOps sdhci_mmio_be_ops =3D {
>     =2Eread =3D sdhci_read,
>     =2Ewrite =3D sdhci_write,
>     =2Eimpl =3D {
>@@ -1413,7 +1402,7 @@ static const MemoryRegionOps sdhci_mmio_be_ops =3D =
{
>         =2Emax_access_size =3D 4,
>         =2Eunaligned =3D false
>     },
>-    =2Eendianness =3D DEVICE_BIG_ENDIAN,
>+    =2Eendianness =3D DEVICE_LITTLE_ENDIAN,
> };
>=20
> static void sdhci_init_readonly_registers(SDHCIState *s, Error **errp)
>@@ -1467,23 +1456,6 @@ void sdhci_common_realize(SDHCIState *s, Error **e=
rrp)
>     SDHCIClass *sc =3D s->sc;
>     const char *class_name =3D object_get_typename(OBJECT(s));
>=20
>-    s->io_ops =3D sc->io_ops ?: &sdhci_mmio_le_ops;
>-    switch (s->endianness) {
>-    case DEVICE_LITTLE_ENDIAN:
>-        /* s->io_ops is little endian by default */
>-        break;
>-    case DEVICE_BIG_ENDIAN:
>-        if (s->io_ops !=3D &sdhci_mmio_le_ops) {
>-            error_setg(errp, "SD controller doesn't support big endianne=
ss");
>-            return;
>-        }
>-        s->io_ops =3D &sdhci_mmio_be_ops;
>-        break;
>-    default:
>-        error_setg(errp, "Incorrect endianness");
>-        return;
>-    }
>-
>     sdhci_init_readonly_registers(s, errp);
>     if (*errp) {
>         return;
>@@ -1493,7 +1465,7 @@ void sdhci_common_realize(SDHCIState *s, Error **er=
rp)
>     s->fifo_buffer =3D g_malloc0(s->buf_maxsz);
>=20
>     assert(sc->iomem_size >=3D SDHC_REGISTERS_MAP_SIZE);
>-    memory_region_init_io(&s->iomem, OBJECT(s), s->io_ops, s, class_name=
,
>+    memory_region_init_io(&s->iomem, OBJECT(s), sc->io_ops, s, class_nam=
e,
>                           sc->iomem_size);
> }
>=20
>@@ -1578,6 +1550,7 @@ void sdhci_common_class_init(ObjectClass *klass, co=
nst void *data)
>     dc->vmsd =3D &sdhci_vmstate;
>     device_class_set_legacy_reset(dc, sdhci_poweron_reset);
>=20
>+    sc->io_ops =3D &sdhci_mmio_le_ops;
>     sc->iomem_size =3D SDHC_REGISTERS_MAP_SIZE;
> }
>=20
