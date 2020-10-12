Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1014922lfa;
        Mon, 12 Oct 2020 05:48:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRdD6GrB4Nv7GAp0bspEiURLL5BSSDLTFxaLpghFQfnTvhbPjW6YputnMRNOBPl7awlBmE
X-Received: by 2002:a5b:70f:: with SMTP id g15mr13065546ybq.244.1602506930452;
        Mon, 12 Oct 2020 05:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602506930; cv=none;
        d=google.com; s=arc-20160816;
        b=pi8h5QziNTQstPQzYl5Ncrudj3dVr1rd1/TvpzQhc/GGWR3y+GVlgQ4xtHG0rvABIA
         JhpLucMzbOu3fUUn8k9hL7nQZ7MAaIN+s+mXTDsxJUlE/xj9MAY68y3tManj1Y9Ckx/i
         xkpLi4YbULZlC0B4qyi9Lx0MDPOENRlemhpLWtdBHyVrGR+9cO6AMMwd3x1lr5Ils0O0
         54LJYiKvTR2/tOvx+KviP18j+oSDnjWCP90SiNahR2mJWLC4yCdIX/Pus62+mR+X8P1I
         1l2hkDG+QL+1u8cM9b4glMHxq5ZC6tsuwGRQNt2MjR9BqOyGW5gSYc5FEp21RrvNUT2E
         7E7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=uEfJTmQm7IfbaNLnhhKiUk3mZKxHaYrO9aWEgNYf1LY=;
        b=s8S/ZsukyfGQC23jexU1eXsKswkAEsN5Ta14riFOKRbZw7PBN6sqLFIsj1oTAI/Ppe
         B5EUDN56sOA0gElyJ2Z0GHJxzvTX23m+8rRmJkO/UPGOVxRDeJXQ5MQsCWv0H+/JoQwZ
         mPglOC2SvfBQ6pBCpWBDKvRHVZ/ZgwSiOCzr/exZWsfzDe2JENcANxKpqohyQMFl7GlH
         AokKKTsFlWL2Z2CB8iryebbKTQywnA+zyGpnwH34likoQIqwKdbeSSZOTA/auazVR5up
         1gvi5xUY9LKTysq/4e3aPyro6A3gqGyVzM+QR27UWWJELiPEyWIC9I1kNMwAADQS+CnO
         QKlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i6qZgCEQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 197si1199602ybc.182.2020.10.12.05.48.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Oct 2020 05:48:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i6qZgCEQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kRxFx-0007z9-OH
	for alex.bennee@linaro.org; Mon, 12 Oct 2020 08:48:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCh-0005De-Oi
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 08:45:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kRxCg-0008Vo-6L
 for qemu-arm@nongnu.org; Mon, 12 Oct 2020 08:45:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602506725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uEfJTmQm7IfbaNLnhhKiUk3mZKxHaYrO9aWEgNYf1LY=;
 b=i6qZgCEQ875udRWEeba6AQZW5gTzAMKjtYhajRPEjKMQ4u3b6eTEJp/VWh4k9e3Mr6ap39
 86oVu9j4naArs7/i20TvK4KRyKXXclSczvdeDyuFAFdzzMVMH+o9Ay0NGV0sNHerO20VZV
 qng19FfoUj02qLtBJW8Na7otXYahs0I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-eIVu4u_NMrKlGXBns0cJWQ-1; Mon, 12 Oct 2020 08:45:22 -0400
X-MC-Unique: eIVu4u_NMrKlGXBns0cJWQ-1
Received: by mail-wr1-f72.google.com with SMTP id n14so5759003wrp.1
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2020 05:45:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uEfJTmQm7IfbaNLnhhKiUk3mZKxHaYrO9aWEgNYf1LY=;
 b=EVJ6/HzqtWFK8CdEPf/3CmcGPly0uT/7YP/ZaDY3NimDPaxGVuH44YgPRsO3YUh9SZ
 +OAJFZuou0nn0OCOpT4xUqDGJPaTB9OZO0Dx9MXgxud2bMoGDoPHZFIJWupl0Sr0BHAJ
 wjZEmHpYUioYI9fCA/FOwCXbBUDVWZa9QcKz5evmzpJxH78RnVBLNfbgTgMxXQQVjHi8
 N9jYoyPnB86QysDMby2SkOTxySEAY1dblsdyg06r45gacGpctSd/dWqWUvWBHk+HXLOa
 ZNgobBcocpPpcrC4nkfc6q49GY8znaveA+M3/PY0K0M6jXlFlilqbje5oZBU7WyECFrG
 EVgQ==
X-Gm-Message-State: AOAM532nVFEs0McmXVE58fjjO6ulaUXs0YDCKFo1Rtrc9p+bC8aE/CPB
 koQX/Dr1iRrMzevKJGvdsY3AaVoJ+mVoC9Vm3fZ2qZdGaEvsxetvl5Y66IIiuwYB0Lp1W+CmMhL
 1sZ/RaEDwMiSR
X-Received: by 2002:adf:8b85:: with SMTP id o5mr16319176wra.104.1602506720840; 
 Mon, 12 Oct 2020 05:45:20 -0700 (PDT)
X-Received: by 2002:adf:8b85:: with SMTP id o5mr16319151wra.104.1602506720677; 
 Mon, 12 Oct 2020 05:45:20 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id b5sm2564766wrs.97.2020.10.12.05.45.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 05:45:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/pci-host: Use the PCI_BUILD_BDF() macro from
 'hw/pci/pci.h'
Date: Mon, 12 Oct 2020 14:45:03 +0200
Message-Id: <20201012124506.3406909-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201012124506.3406909-1-philmd@redhat.com>
References: <20201012124506.3406909-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/11 23:52:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen <chenhc@lemote.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C2Ztzf4yK02j

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

We already have a generic PCI_BUILD_BDF() macro in "hw/pci/pci.h"
to pack these values, use it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c   | 3 +--
 hw/pci-host/pnv_phb4.c | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index abb3ee86769..b05295639a6 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -196,8 +196,7 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
 #define PCI_IDSEL_VIA686B          (1 << PCI_IDSEL_VIA686B_BIT)
 
 #define PCI_ADDR(busno , devno , funno , regno)  \
-    ((((busno) << 8) & 0xff00) + (((devno) << 3) & 0xf8) + \
-    (((funno) & 0x7) << 8) + (regno))
+    ((PCI_BUILD_BDF(busno, PCI_DEVFN(devno , funno)) << 8) + (regno))
 
 typedef struct BonitoState BonitoState;
 
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 03daf40a237..6328e985f81 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -889,7 +889,7 @@ static bool pnv_phb4_resolve_pe(PnvPhb4DMASpace *ds)
     /* Read RTE */
     bus_num = pci_bus_num(ds->bus);
     addr = rtt & PHB_RTT_BASE_ADDRESS_MASK;
-    addr += 2 * ((bus_num << 8) | ds->devfn);
+    addr += 2 * PCI_BUILD_BDF(bus_num, ds->devfn);
     if (dma_memory_read(&address_space_memory, addr, &rte, sizeof(rte))) {
         phb_error(ds->phb, "Failed to read RTT entry at 0x%"PRIx64, addr);
         /* Set error bits ? fence ? ... */
-- 
2.26.2

