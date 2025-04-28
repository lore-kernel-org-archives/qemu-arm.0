Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp5870433njd;
        Mon, 28 Apr 2025 03:28:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXzOeYKo3ey+BvrLPEXVyFvVzuOJCzrP6XExfBA2Lq75tQU71+01i902ansPuTBt99AO1+gIsC/eJC9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGirtNGSSzFNpr/4+OVU7xncCeh1tJ8gxw9E/9RgJn2BCPibqvVNP4soTug3cuaO0SzAiZu
X-Received: by 2002:a05:622a:c9:b0:476:78a8:4356 with SMTP id d75a77b69052e-4801ce5c60dmr164883981cf.26.1745836120595;
        Mon, 28 Apr 2025 03:28:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745836120; cv=none;
        d=google.com; s=arc-20240605;
        b=QmYM/iofpgX2bMcxf7x6i8+TQQv7pu4kPELNHzPnKK+QINwNkl0EQMX0wy9Hyachxh
         6cNGS/2F3CHrRAM2WnRF0FtChlP+ZcQ5dZJwpp0R7dkI7aeCW0rC4L/OCVefUOKuawVk
         zvMkiS12e+wmQBSLdJS8yzmL/a8CzvQiSfwvFZPLB0O4kuz3CeUwDR6J1o0kJLcoeFck
         VoafHoHMs3Rb4xRB7/NHrGPHHdn1spHF3aqq0NOJXGdqRAM5fczdXkLT2LV7GUfszkV7
         0oJWEvGadwRami1UtXPL87qe+Nn2ITdeoE7khSyrkf8RGFyuHq8tY6NsTlN73JIop6K9
         V7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6XahBnXpFqwycsDBbg1wLu1EfXJ0E3CuvWhdSJiCoos=;
        fh=+sxB8NkS+xL+1QwPgIVnaMhN8Q9GX11v/uLdEosqQQA=;
        b=kgc6mlZUT6Wh/SI5QFy9XMhkpemIK/5pWVxM/IMhYMHwvRn7fw/KFm2FYljbyrRijc
         2zSwGroT6ths0/QC4JLTnIv9BjI7etaAJ4sOiibpy4HJ+d1bIZg/iQxSvy3bVlqCXLxU
         VNtjnWJs4sG/vToap/j5jYiPSmgG6bEd8RY4Afh22fOU74CavQE3lNM4vrr9Nb6q+Szy
         z1dn0gVXhLoEadO84EC7y2NNqrm/uHn3eTC6OCwuUCJpEGXRSzPkLNuvqv/QrTytdwa9
         K0QvquzUQv99vANjO+mIz3QijJgdvXKhWm9f3XvX8NaSxF3hfxgWmk6ObQ+vLcNihELP
         V2sw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BmbFEPG2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ea1995bcdsi101476331cf.305.2025.04.28.03.28.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Apr 2025 03:28:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BmbFEPG2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u9LhU-0006S4-Oz; Mon, 28 Apr 2025 06:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9LhJ-0005rZ-Uz
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 06:26:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1u9LhI-0003Fh-0E
 for qemu-arm@nongnu.org; Mon, 28 Apr 2025 06:26:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1745836006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6XahBnXpFqwycsDBbg1wLu1EfXJ0E3CuvWhdSJiCoos=;
 b=BmbFEPG2efQN3ARm5+jW4l9h7v41PGBdt7UjtbEjIQTFFl1ToPjauIkYxX/r0xAR0fhBP4
 7MYdlM8K1bIzVzuQ4g2uSKAQN8WN+Sxg/i8gaOLvu5wgRypn9lfG3eCNZyPS9RpYSMcDkI
 evIHbCWsIY56sXBTMC/sBJ6eMjp1PhA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-6ey_4z0KMjCz6EJX54VPFQ-1; Mon,
 28 Apr 2025 06:26:43 -0400
X-MC-Unique: 6ey_4z0KMjCz6EJX54VPFQ-1
X-Mimecast-MFC-AGG-ID: 6ey_4z0KMjCz6EJX54VPFQ_1745836002
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 00E7319560AA; Mon, 28 Apr 2025 10:26:42 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.44.32.14])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D0464180045C; Mon, 28 Apr 2025 10:26:36 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, imammedo@redhat.com,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com,
	Jonathan.Cameron@huawei.com
Subject: [RFC 01/24] hw/pci/pcie_port: Fix pcie_slot_is_hotpluggbale_bus typo
Date: Mon, 28 Apr 2025 12:25:27 +0200
Message-ID: <20250428102628.378046-2-eric.auger@redhat.com>
In-Reply-To: <20250428102628.378046-1-eric.auger@redhat.com>
References: <20250428102628.378046-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.492,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: F7L3YQQJZnGg

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/pci/pcie_port.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index c73db30e98..072500ed34 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -188,7 +188,7 @@ int pcie_count_ds_ports(PCIBus *bus)
     return dsp_count;
 }
 
-static bool pcie_slot_is_hotpluggbale_bus(HotplugHandler *plug_handler,
+static bool pcie_slot_is_hotpluggable_bus(HotplugHandler *plug_handler,
                                           BusState *bus)
 {
     PCIESlot *s = PCIE_SLOT(bus->parent);
@@ -221,7 +221,7 @@ static void pcie_slot_class_init(ObjectClass *oc, void *data)
     hc->plug = pcie_cap_slot_plug_cb;
     hc->unplug = pcie_cap_slot_unplug_cb;
     hc->unplug_request = pcie_cap_slot_unplug_request_cb;
-    hc->is_hotpluggable_bus = pcie_slot_is_hotpluggbale_bus;
+    hc->is_hotpluggable_bus = pcie_slot_is_hotpluggable_bus;
 }
 
 static const TypeInfo pcie_slot_type_info = {
-- 
2.49.0

