Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3171979dlj;
        Wed, 15 Jan 2025 09:12:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXh1xFycft8DbZHd6EI1Ih6u1ya2E1ysJOdcpRjtn+22VhlfPDsukPtAtYu7kcqWaLk06BOy9CsQxQJzg==@linaro.org
X-Google-Smtp-Source: AGHT+IGbIWJ1bGAUs9wZrtXpBJ+b9tT81F1l5W7djPQaoRs26HjhJFOU1mFMd2OBu15lrcGWzZQX
X-Received: by 2002:a05:6214:5c02:b0:6dd:c594:27a2 with SMTP id 6a1803df08f44-6df9b2294e1mr477736866d6.27.1736961169953;
        Wed, 15 Jan 2025 09:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736961169; cv=none;
        d=google.com; s=arc-20240605;
        b=VSt+pA2XgUaKmZT2D7MS8nIU+kj0jcxFFxF4sL3QWzd42sYlLuJ9hLd5q8M//pxJ3c
         fFLDA+sSLl8Ff/Ra6NpgpHC3eMLlr1f82bIFDamVgqcoSTQyXcj82gR8DDp8oiVPSwBQ
         Jxq9YmNlB/OaZnjLQ+Ood8WOtj2/+yRhgp8IWKGbnuvDojZ5BXlbMcwKolBr+6MPvic7
         SE/MFYIa9SgIU0QRrXvvwcQDjaF0OuGpqlhHGlCrGrnwQHZifZsb02Xva49NdHOFL1mA
         ioUj6G6PzB0hhknL2FmlBp90g0tadrOYWnq2LW6m88TsHO4ofa/LXZM2QDML8Yi+Emlr
         bL6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kOweRygtApOATxyfDtRFWpTcMZz+FkF5/nAzWV1Nj4A=;
        fh=6BvVRpAIq3gv43oZgIhZo/0FjQqncQ3QLhkb9GvMr98=;
        b=ROTPMmUfv5v08PMO4G5ZkRBtK4DyVhnIjoYBV+VXgXFDeVo2XVk0SGNfQCAHZVX1Iq
         nkzNbQbnO3kX1ST6yYDKSkyyThTnkCQb7hiDU/9JUFp5y8e4GmGg9jpWQj8yFT++mJjA
         PP/tbiA7eDzHcCxD03kj7ATDREOVEgleXoS0FIXJA00YO4kc4LrY68bJ1AsN73p4JBEI
         lMd2ywnA+mTkwwkxse9rQrCF8zM8YhQobjYKU45M17+Xw556aN74293Psct8zm13H7dE
         mAXGnk304YgIrYW7MMHXcEnQYfoHsUcDzC7AMNn2S8jcEZKbcUNbroqcdG5jco3mDtdS
         q1cQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Al01Wlt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfadedda09si143437586d6.293.2025.01.15.09.12.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 09:12:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Al01Wlt8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY6vH-0008BK-Vo; Wed, 15 Jan 2025 12:11:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6vE-0007xa-3J
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:11:16 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6vC-0006eE-NJ
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:11:15 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361c705434so50258605e9.3
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 09:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736961073; x=1737565873; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kOweRygtApOATxyfDtRFWpTcMZz+FkF5/nAzWV1Nj4A=;
 b=Al01Wlt8FmYtUEcZiX9EUSzXmO0AibwOPydsLTxq10135Zu5iquGBA0cvYcH/fcZB2
 /vwFiqM+2h7kcQI22GOBIIoumXECjoVSLdnewW14JT7JrP/59B4WGpCfmhzppGlLrlz1
 AxsGTsdXZffgFirM56fjQvgzCZNLcC2haOtQfh90BVpzE7OFHwnHzomyZ5sTmjSuOb0X
 +qy9J1kcEfRdg1M/2/j1bCPoP8lkqvph+b3Pm8GnPgUXmpDZs1fvk10RFHzcEwRZZ/s8
 tDxd8sfJt/WKwKnt9NyntgF8aFl8uKbDhLcIuI8MsqrRIX+XOt10QAlG+U4cbSNfOtfo
 vDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736961073; x=1737565873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kOweRygtApOATxyfDtRFWpTcMZz+FkF5/nAzWV1Nj4A=;
 b=cxwe4c8GYZTu0rdeEbXijkp8oLYq+eQuQpAoHTA4mbSbNG77z99wqI3knvHWUAc8Ui
 Ps4g9M6g5Mc/peMRQO8VwuumQVZmT34dEjy5rBCjss5SFwJc4qSQxJH2RdKH0DISgokw
 lAJXXFa/VsFVQIT/2C+Z4RTQiX8/smhh0AJ52Dif93t06x5E9q05sVw4LEX2p9yZgZg+
 jj4/XEmiThw5Byd9zgjbKMXx+KXM5lsK1aV+nOi0dc5c+69yuOKPxdXqTL1JLPktdde8
 dPC9APOWKB0C4druSK4zT7hrOn0yibxWWV3K3at/EE6YNFYJsAGzBVe9vNSF8J69o3HW
 i9Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6JAgXVdEMTXOSEMszaWVf0dZoHMgwKOqi/bfW1Rv8Lagjc9GzCJs/hk2Wi0hvXyXUGNzFTz4yBw==@nongnu.org
X-Gm-Message-State: AOJu0YzH0gTfePD7dnPHm6Vzi82CxiNcfUsfpfxRfLqXmLvP2SY1+6k1
 778z33nMCU9Fb3dFcFFVejIrZ/kXzgs9+znkWar8e6xYK4U+ZK4HqeXORENG/Eo=
X-Gm-Gg: ASbGncs7WLO5NmW9xuIGUH7BDcaMLxD4CMKQAlDE+v3FQ3Z7hRfCgWbHDFhOja6UPWM
 maOcGgpCge/9nIp5hD2Pw1IXK2kjNQvx+YuI6k3KRtRRhzncR5C3mz6vOvk9jPmXgUWSmiFpMsN
 +Zq2T5F2eH4aA84B7je9Dz1GPmswCiqpouS5Gx4BvNnZidrQF4g+r8CFR6sZTn4xwmtKxEA2nSV
 NisX9WZDaRx83uWacgwlCXf42zslDNhqt1ywOLC9np1e7NsOl/skq6/4VBF2q1HXunS3PSiCJn+
 7jnJczdw99ds5JoTE3RrstW3e264JiDzPl6H
X-Received: by 2002:a05:600c:3543:b0:434:f767:68ea with SMTP id
 5b1f17b1804b1-436e2677c7dmr305800585e9.5.1736961073027; 
 Wed, 15 Jan 2025 09:11:13 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c7499502sm30038845e9.4.2025.01.15.09.11.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jan 2025 09:11:12 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 13/13] hw/arm/virt: Remove VirtMachineClass::no_highmem_ecam
 field
Date: Wed, 15 Jan 2025 18:10:09 +0100
Message-ID: <20250115171009.19302-14-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115171009.19302-1-philmd@linaro.org>
References: <20250115171009.19302-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: wNKZi/efa0+R

The VirtMachineClass::no_highmem_ecam field was only
used by virt-2.12 machine, which got removed. Remove it
and simplify virt_instance_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/virt.h | 1 -
 hw/arm/virt.c         | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index b2cc012a402..9a1b0f53d21 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -119,7 +119,6 @@ struct VirtMachineClass {
     MachineClass parent;
     bool no_tcg_its;
     bool no_highmem_compact;
-    bool no_highmem_ecam;
     bool no_ged;   /* Machines < 4.2 have no support for ACPI GED device */
     bool kvm_no_adjvtime;
     bool no_kvm_steal_time;
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a607a66a198..4de5ce3c541 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3267,7 +3267,7 @@ static void virt_instance_init(Object *obj)
     vms->highmem_compact = !vmc->no_highmem_compact;
     vms->gic_version = VIRT_GIC_VERSION_NOSEL;
 
-    vms->highmem_ecam = !vmc->no_highmem_ecam;
+    vms->highmem_ecam = true;
     vms->highmem_mmio = true;
     vms->highmem_redists = true;
 
-- 
2.47.1

