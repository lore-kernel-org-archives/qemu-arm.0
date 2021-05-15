Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp1429512lfg;
        Sat, 15 May 2021 10:39:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztdVcVbPth5WF/VcLk1Q8rruioD/irV2cia62WAHFdbCl4T87im44cjV1DXFZRm9KgG/7D
X-Received: by 2002:a37:2cc3:: with SMTP id s186mr30176423qkh.500.1621100393188;
        Sat, 15 May 2021 10:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621100393; cv=none;
        d=google.com; s=arc-20160816;
        b=tTERp13CByw5JdCC0V5BpqB5uZJr1eOC+QFD3skdhDxRapC5TEn7KvjBtzxV1cEAdv
         LHnwkXuzKjGrt5cOcypDQPa0gj2j6AIur+Eflt3MvB2lcmf5pPhFvs8KcssCJkOeFuHh
         ybNjYExI7cKjUDGIzSPQtXC8gNgOgOmTbAhhfHelUQeAu5YmsV7ZScIiR3TsIUjdcpGc
         em47KrRwWcT2l+Rau/4JMAgNC5KfUVKVtRlPc7fxAOJcpgBfEVUKQRIo52O8o15kWDop
         7kAU522rA8NjJw8SLgoo5tYbpkb2/E+NemVDc2PYAZact2Qeg//kPMpD2P3l7tL92RaI
         3GIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=k/10dvLOYecsAQmUGPkwxrFRTrjd5+JzocYSZHgeVfk=;
        b=Se1EbcBvHg4A+xYIEn+SPZ0ip7xJYkWWEW0W+Mk655pSSD9EtbwxEW49EI61Zzzvoe
         KeZ0spVaWEXAhYzR23kiRrQ99jEiQIH50Ai9hzVzNCz0q3OuY5ogLEb+6KflhYPaZrmR
         EALG4PRA7M0nb0Rfj9h1zvsvfCZks3mK2RzoMqW52JA7ZZpl9azjArD0kjJyvlBp49Vr
         pYH3gIDPNms211YlxwFLoWTUZy9PdVcTCluP1yrCDaWLDl++oWYMvgI+KLLwY1N8R6Kz
         zQ2F3+mJL46eHxf6flPbPSSO+muCfhgpjQHGqMu6jOe74hOea6QdnoJ2AH7jYNcEmqBT
         ZGsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Ez/NEZ50";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u26si6685684qvf.198.2021.05.15.10.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 May 2021 10:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Ez/NEZ50";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhyGW-0002zw-Am
	for alex.bennee@linaro.org; Sat, 15 May 2021 13:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEI-0008Pu-Ey
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:37:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53865)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhyEG-00066J-0d
 for qemu-devel@nongnu.org; Sat, 15 May 2021 13:37:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621100251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/10dvLOYecsAQmUGPkwxrFRTrjd5+JzocYSZHgeVfk=;
 b=Ez/NEZ50nSNp3weLm451lazCKzrMGqFAyL2R27w61Q7JRBpqLa8LLAqBxSrScSt9hLgmKZ
 u00GK6iHKkrKmyVQa5uv4lKnJZZRLhPWEGgoNiY11YlkHXuc+OL6vjoCC5g/7ccWC6Igv+
 4vpTi7JZl4JYJJNfJfyD/IfYCB/jpp0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-537-gmUwbCH4PuyXb2-opXWk_A-1; Sat, 15 May 2021 13:37:30 -0400
X-MC-Unique: gmUwbCH4PuyXb2-opXWk_A-1
Received: by mail-wm1-f72.google.com with SMTP id
 b206-20020a1c1bd70000b02901713122405eso453691wmb.1
 for <qemu-devel@nongnu.org>; Sat, 15 May 2021 10:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k/10dvLOYecsAQmUGPkwxrFRTrjd5+JzocYSZHgeVfk=;
 b=YatS9Ji98mjl45c3MoBE+n8DinOxKbz1IhlzhJxWvyn+0ybjcgSa1EJ6ahGSc9so9w
 4n5e65Vh9Asky3NdmwUb++y62F7qE2wx/i8poVFJ7VwOMz+Rdxe9EURbXdvkGyUxK0M9
 QKB1PiIwNWzuwXOovBx27T35QtcocaLRx8zbCVptOArf35wprL4e6Ndqe2TJi/v6QJqt
 opoifQOiycHnUecNl6qniCyO/ziO1teNUSFmxTPoi/5zrFpvNMp6NxtP36e5otSupe+w
 6NSTp1LGPBoHwV1JEQUGr/6WQSjE7m3GLe9/hyggxgLvle28sx0tCooDwGAkbKDa4ls3
 A63g==
X-Gm-Message-State: AOAM533eHNiAHG0nXvQIu8W7MrdtfzjPuedgHnFlZo8IqsVwUKAYdI+0
 ZTet0XSBEuqlDpK1CfmrthJKpOymh1n0tmMmV7G4ma2k4z2CI2b1bWO3f+ryYRV0DB5gU3XoH+G
 dLGZXMcU+7klHGnQIRVceuK19OvbA3+noU7I3OaBTtOHuyjYa30+CHIbvACscfd9C
X-Received: by 2002:a05:600c:4eca:: with SMTP id
 g10mr15474344wmq.180.1621100248624; 
 Sat, 15 May 2021 10:37:28 -0700 (PDT)
X-Received: by 2002:a05:600c:4eca:: with SMTP id
 g10mr15474322wmq.180.1621100248461; 
 Sat, 15 May 2021 10:37:28 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id q3sm8260103wrr.43.2021.05.15.10.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 10:37:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/12] hw/ide/Kconfig: Add missing dependency PCI ->
 IDE_QDEV
Date: Sat, 15 May 2021 19:37:06 +0200
Message-Id: <20210515173716.358295-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210515173716.358295-1-philmd@redhat.com>
References: <20210515173716.358295-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair.francis@wdc.com>, qemu-riscv@nongnu.org,
 "open list:IDE" <qemu-block@nongnu.org>, John Snow <jsnow@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N83a8prT4irR

The pci_ide_create_devs() function is declared i hw/ide/qdev.c:

 $ git grep ide_create_drive
 hw/ide/pci.c:491:            ide_create_drive(d->bus + bus[i], unit[i], hd_table[i]);
 hw/ide/qdev.c:127:IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive)
 include/hw/ide/internal.h:653:IDEDevice *ide_create_drive(IDEBus *bus, int unit, DriveInfo *drive);

Fix the correct symbol dependency to avoid build failure when
deselecting some machines:

  /usr/bin/ld: libcommon.fa.p/hw_ide_pci.c.o: in function `pci_ide_create_devs':
  hw/ide/pci.c:491: undefined reference to `ide_create_drive'

Fixes: 8f01b41e109 ("ide: express dependencies with Kconfig")
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ide/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
index 8e2c8934549..dd85fa3619f 100644
--- a/hw/ide/Kconfig
+++ b/hw/ide/Kconfig
@@ -8,7 +8,7 @@ config IDE_QDEV
 config IDE_PCI
     bool
     depends on PCI
-    select IDE_CORE
+    select IDE_QDEV
 
 config IDE_ISA
     bool
-- 
2.26.3

