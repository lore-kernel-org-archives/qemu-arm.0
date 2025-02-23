Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp1309486njc;
        Sun, 23 Feb 2025 03:47:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVb/sHjn7WTFEP6Qesabxg5PIszccKjj9eee9oi4/vajNmDVHWnJqtAyek45tvDPgw3DkmhLRlmGuQoyQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEVN2+wjDz/fq7LPNGRGLq7eHSKdbpf9P2kTT+1k36ltYFcwUakgoAAuFgF81IB+Yywpw8z
X-Received: by 2002:ac8:5f50:0:b0:471:8b48:70d with SMTP id d75a77b69052e-472228c826cmr146891081cf.21.1740311261231;
        Sun, 23 Feb 2025 03:47:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740311261; cv=none;
        d=google.com; s=arc-20240605;
        b=KOImBSsRhmoy66KdUYPvrboHNiMlFL80pNlEohLfrleb/zBdIBaqTsZDm4OkgOf4fw
         zUdcsqOzKk/h9OjS+bpgBxhL1ev6ef7jMy2CSXy5Jj5SlteARwNEApSkOdUGwFP8YO0o
         ufJiJFsDboQNkBs7keVCjcvkfE/F3qWVIScFVHVMj6Zfd04XN6EhoLaiOrthJSJx2v45
         7BJb8r08JD+OjGYSaguVFo4PU1nA5k/9Bu2A1Wh7B28LpJNS65yNaELIyCso9lhnu0UN
         dp3x3zpT46I3e0YKQHrSY4eVAQtVMSmdCJRLokiQh64mlpmkVv80YVxADQraszid1V8C
         cPJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uWfrQhvz/dbConbW1e2cYEwd7c6kqdBGuDJ0FPSuEbo=;
        fh=VBmxCzxIHVotSmTsVMLh/OUvX9AgKRncGg8mCyW2BqQ=;
        b=FilA1lrSncSgJoxjaRhJRRTdigYFSTEqWeyoBiCM7UX+Gwb6dEpBYszNav2zC21YOO
         3S7KTZG7ZrGygavFUdgQuizDDWjCoxw9fkFOBmuAedxufP3FHqlbYvkGU7J1G3e5Wtpa
         vVYZBTk/DfI3YtK6HM06Ik2zZFAvfs7jR0iipQzne2WWvsBphzcziTFH2SQrvCrTvck7
         aVJMW/XgMX2oK8YQIdOCfpB5iLyeehisLv3R5Ilm+18TyanJoSjJovQIRdEhkcSdZmHA
         6zuS7KnPzoTpzZ+b/HeSQpgnwIY78PRiJ3U8+NJZg5H44R2Io1wFHsQguoM/2dwlBXjY
         ljLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="jSib/9rl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e6a3027958si63049126d6.345.2025.02.23.03.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Feb 2025 03:47:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="jSib/9rl";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmASF-0008QI-O3; Sun, 23 Feb 2025 06:47:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tmASD-0008Pj-Kc; Sun, 23 Feb 2025 06:47:25 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tmASB-0005vT-Nx; Sun, 23 Feb 2025 06:47:25 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-ab744d5e567so606938866b.1; 
 Sun, 23 Feb 2025 03:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740311241; x=1740916041; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWfrQhvz/dbConbW1e2cYEwd7c6kqdBGuDJ0FPSuEbo=;
 b=jSib/9rlrO+yUViatlvCt0Y+dGMKaA3evumBiamf/6HS1DXMAicn7qbhNE+9YY0j+8
 7rM05E8q4E9qDoLm1te/e02zO6o0YqiymKD5qaUWYuRdA01haplnreBvRSbvit+aOAd2
 6Lv+8xFhjTje+xjmWgDzac0uMYpqyZ7+9JpoX360zJ8rI0H3c5KGZ6shFako1gGd0jk4
 igMkbLtaNtCthRQg8YeOmXsLC/kigM06j7aaXWdxY+e9YJsF3eoRxiL6+ProsvPV4GDY
 IE7m+v7UA2cd2x/JDOcrWglR7WQsXN83dEVXvo0cn0WWhlseNYPD5GkTvIAUBxUBDOcv
 USXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740311241; x=1740916041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uWfrQhvz/dbConbW1e2cYEwd7c6kqdBGuDJ0FPSuEbo=;
 b=sm2gCqtJ3XDF+YyTimGvXzzpszCoTMg99GuieU2lzDQtT+MENFM4qDnS91FHZIZCG/
 CwcvwjIGJXaviy15TSIi1SSFiKUBy8VN2A3XkxDpjsEQpfzlTarc17nKW/fgKEYNko4W
 qbbf74w/8fzve/7aKa7nWo/xKv/9oZfHvTAPSt1ca/pHgdSOHhlbqltOKp24NCnFSwcD
 m2nMzngWIYsY8m3qM32flMxR4xstRA+RfUd4FOUe3CkgQb6Guag4QEGelwpaF6ZGoezY
 ZU2GMwV+3yEfougNUd6QURxS9pbFnXXmAYqwdPS5SJ+0HHJ4YK/IFWk3RKhSV7mu6zqG
 zCJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBUcz00TZ1tZh9f9DN4sK3Ht344d8vIpHmfh+i3koOMxqSiufO55TACHDa/Uq4CKliR35GteRhcA==@nongnu.org
X-Gm-Message-State: AOJu0Ywyu/UCGRixJzh6LmFClwVCtG29qu/Er38ocZhmSRt8Q2iC99RA
 alOH+BdQkvevG2Li4g+j2t3ZbjTg/CZvrzsaIcSkj6mvadmRTvtiflFF3g==
X-Gm-Gg: ASbGncteGDrQLEDKTTE1/bDG1SWbYzo7iFyhZps+ER544I7+mFxutdlK8nAp8GQbSsV
 DbB7uZ2FP3RlgcMb++qxQ5AzDLFfPT8HyG6quaVwJesULlbaCY+e6Sex0GW9qsi7G0lLpMFzrpJ
 W1+FfhO9b0FmxiDK+WNW2rMlOp0gq/L2XoITZadk1Gd1v6XaTeQ3diQDTTUek0iFHIoUTaxpACO
 8M825ed7eZ8815OJqEbXnA+i//Qdj82hPC9C0rb2T8G8es5ARqP5zv/YBYSwfFIUPzNjn9rmYBY
 sOxZMlizIFZNCLmDCnwS7rPXH+Ji20nVx/Y8yzBRo0V/mPzdRH1j85e5vtUjms8PhQcqAxllFSS
 w7DWpSOg6Daw6
X-Received: by 2002:a17:906:308c:b0:ab3:9aba:ce7d with SMTP id
 a640c23a62f3a-abc0ae1ab4cmr755188166b.1.1740311240904; 
 Sun, 23 Feb 2025 03:47:20 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-011-167-038.77.11.pool.telefonica.de. [77.11.167.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abba4b9ee98sm1240515466b.167.2025.02.23.03.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Feb 2025 03:47:20 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 02/18] hw/pci-host/designware: Prevent device attachment on
 internal PCIe root bus
Date: Sun, 23 Feb 2025 12:46:52 +0100
Message-ID: <20250223114708.1780-3-shentey@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250223114708.1780-1-shentey@gmail.com>
References: <20250223114708.1780-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
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
X-TUID: hjASQpsVTUaC

On the real device, the PCIe root bus is only connected to a PCIe bridge and
does not allow for direct attachment of devices. Doing so in QEMU results in no
PCI devices being detected by Linux. Instead, PCI devices should plug into the
secondary PCIe bus spawned by the internal PCIe bridge.

Unfortunately, QEMU defaults to plugging devices into the PCIe root bus. To work
around this, every PCI device created on the command line needs an extra
`bus=dw-pcie` option which is error prone. Fix that by marking the PCIe root bus
as full which makes QEMU decend into the child PCIe bus.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 include/hw/pci-host/designware.h |  7 +++++++
 hw/pci-host/designware.c         | 18 +++++++++++++++++-
 2 files changed, 24 insertions(+), 1 deletion(-)

diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index bf8b278978..a35a3bd06c 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -25,12 +25,19 @@
 #include "hw/pci/pci_bridge.h"
 #include "qom/object.h"
 
+#define TYPE_DESIGNWARE_PCIE_ROOT_BUS "designware-pcie-root-BUS"
+OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIERootBus, DESIGNWARE_PCIE_ROOT_BUS)
+
 #define TYPE_DESIGNWARE_PCIE_HOST "designware-pcie-host"
 OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIEHost, DESIGNWARE_PCIE_HOST)
 
 #define TYPE_DESIGNWARE_PCIE_ROOT "designware-pcie-root"
 OBJECT_DECLARE_SIMPLE_TYPE(DesignwarePCIERoot, DESIGNWARE_PCIE_ROOT)
 
+struct DesignwarePCIERootBus {
+    PCIBus parent;
+};
+
 typedef struct DesignwarePCIEViewport {
     DesignwarePCIERoot *root;
 
diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 3e8c36e6a7..c07740bfaa 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -55,6 +55,17 @@
 #define DESIGNWARE_PCIE_ATU_DEVFN(x)               (((x) >> 16) & 0xff)
 #define DESIGNWARE_PCIE_ATU_UPPER_TARGET           0x91C
 
+static void designware_pcie_root_bus_class_init(ObjectClass *klass, void *data)
+{
+    BusClass *k = BUS_CLASS(klass);
+
+    /*
+     * Designware has only a single root complex. Enforce the limit on the
+     * parent bus
+     */
+    k->max_dev = 1;
+}
+
 static DesignwarePCIEHost *
 designware_pcie_root_to_host(DesignwarePCIERoot *root)
 {
@@ -699,7 +710,7 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
                                      &s->pci.memory,
                                      &s->pci.io,
                                      0, 4,
-                                     TYPE_PCIE_BUS);
+                                     TYPE_DESIGNWARE_PCIE_ROOT_BUS);
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
     memory_region_init(&s->pci.address_space_root,
@@ -754,6 +765,11 @@ static void designware_pcie_host_init(Object *obj)
 
 static const TypeInfo designware_pcie_types[] = {
     {
+        .name           = TYPE_DESIGNWARE_PCIE_ROOT_BUS,
+        .parent         = TYPE_PCIE_BUS,
+        .instance_size  = sizeof(DesignwarePCIERootBus),
+        .class_init     = designware_pcie_root_bus_class_init,
+    }, {
         .name           = TYPE_DESIGNWARE_PCIE_HOST,
         .parent         = TYPE_PCI_HOST_BRIDGE,
         .instance_size  = sizeof(DesignwarePCIEHost),
-- 
2.48.1

