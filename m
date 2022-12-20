Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4715284ejb;
        Tue, 20 Dec 2022 15:07:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6ubk44xWUWtevFIXPAzn/96bzQULk3XBL73Iu592uTcM8twmY4MR8jG4Q45Ji/JF1hNjwb
X-Received: by 2002:a1f:5ec5:0:b0:3bd:bb42:646d with SMTP id s188-20020a1f5ec5000000b003bdbb42646dmr25462241vkb.15.1671577647145;
        Tue, 20 Dec 2022 15:07:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671577647; cv=none;
        d=google.com; s=arc-20160816;
        b=auElYeaoi9nGL28eGOOUjp53GetKttTM4aaOqEkrYhBDXJ5GE5CfqDwVZdtX6cSggA
         t3KASpSYnREBuy51Rl7n0z/6bpqDXkUEWScAIVfdU108azgfhonf7gjS0pZXaQ4vd0YN
         Cm0oePaJ9S6n2LG93Qq+iiJz7YQkiAzzDKL9S0fIpsj7TKaPHIPJtPkhLxSmbxier1HJ
         BlJwg1ILd08kYBuxiMRoCAsjewAcupGtAVTQneXty8gt3X8ptHvFOH+FFt2oqc8Nk3kT
         hzPjS1mRb65H6fhD/l89Bz9Mvq7DKjmx9ZkW+rB6FCjQXoea9LEOPLXyo7gLy+a4uP4C
         hDhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=GoIhH1nfTAGGdQoD9FwZxY0U8TnYBkwALW/yO4nS9Fk=;
        b=QqQ7MlWocPom4marP6iIpDVBnBglYFEneLXfiuegEjXthQULqptNTxvsu+FItT6zRf
         Grxz7fM9PjXxOhF3e4+gcpzc7QQdyIOjs4cXroQdjIEE2v7KItWFZNDcqbKLof/JE2Jt
         JkKh1nzZtsyFSzvUGRM1rHPToV2c8Hd4K4esVnNtIfDLncoouUso1+OPNO/33P2W7mMu
         7yDVTslHlFZpJgEfzfYz9KovbbyQBQTlS3+NKKEkUoPHl7k+Q5sEPgIJ3XlCaqWro1TW
         D1WM5gx42mBP/aZ18K4NQZk8CiVfrV/qCOh2k+hsT7UWO94hX4Qtl4o+Sx+MR6kUdEUo
         VvZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y29-20020a37f61d000000b006fefb04578esi5357183qkj.215.2022.12.20.15.07.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 15:07:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7lfW-0000EE-2J; Tue, 20 Dec 2022 18:05:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1p7lel-0008Lg-Sd; Tue, 20 Dec 2022 18:04:23 -0500
Received: from mail.csgraf.de ([85.25.223.15] helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1p7lek-0007ca-0k; Tue, 20 Dec 2022 18:04:19 -0500
Received: from localhost.localdomain
 (dynamic-095-114-015-034.95.114.pool.telefonica.de [95.114.15.34])
 by csgraf.de (Postfix) with ESMTPSA id 1F8B26080470;
 Wed, 21 Dec 2022 00:04:16 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 2/2] hw/arm/virt: Make accels in GIC finalize logic explicit
Date: Wed, 21 Dec 2022 00:04:14 +0100
Message-Id: <20221220230414.47876-3-agraf@csgraf.de>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20221220230414.47876-1-agraf@csgraf.de>
References: <20221220230414.47876-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
X-TUID: sbqLUsu+kLoF

Let's explicitly list out all accelerators that we support when trying to
determine the supported set of GIC versions. KVM was already separate, so
the only missing one is HVF which simply reuses all of TCG's emulation
code and thus has the same compatibility matrix.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 hw/arm/virt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c79f5b6a66..b7fb473788 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1929,7 +1929,7 @@ static void finalize_gic_version(VirtMachineState *vms)
         /* KVM w/o kernel irqchip can only deal with GICv2 */
         gics_supported |= VIRT_GIC_VERSION_2;
         accel_name = "KVM with kernel-irqchip=off";
-    } else {
+    } else if (tcg_enabled() || hvf_enabled())  {
         gics_supported |= VIRT_GIC_VERSION_2;
         if (module_object_class_by_name("arm-gicv3")) {
             gics_supported |= VIRT_GIC_VERSION_3;
@@ -1938,6 +1938,9 @@ static void finalize_gic_version(VirtMachineState *vms)
                 gics_supported |= VIRT_GIC_VERSION_4;
             }
         }
+    } else {
+        error_report("Unsupported accelerator, can not determine GIC support");
+        exit(1);
     }
 
     /*
-- 
2.37.1 (Apple Git-137.1)

