Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2447618ejb;
        Wed, 24 May 2023 03:28:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6xaKWEUi5iYKH4FJXKUvhnEZQO7QzCfBLeI3YKl54kkqJy2soQ2cN8mY/nLckmQdOVW8kM
X-Received: by 2002:a05:620a:8590:b0:75b:23a1:3657 with SMTP id pf16-20020a05620a859000b0075b23a13657mr5704949qkn.24.1684924118662;
        Wed, 24 May 2023 03:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684924118; cv=none;
        d=google.com; s=arc-20160816;
        b=WzhWHqULVMMAel6xVMck83F4YVCX4+Ot3QWJupszVOVZOoyVS2vPkKAhQ75fCE62RI
         XW/O0dWAmjo1hOD65HC2SRH2DVcwNoD2Xxsm9kmIqGwXIWYQUjjihPdhOmTAB7+eePGU
         gF104LoVBOLEnBNfGz3JK5E+G7gB4F9EFfOzxsVtAKzPTlR5vTbJ0mZsyu1uOi8/9R/y
         k98iAHy8ty5Vw8EG5sm7aa1xidKaZGrJKa7AIZowLppi7KrlHdnCz0GWHNtCRjqf97Xf
         S2T4gjUvoYLULE4wLhZRw1d9mMYemwbTARgGQpv5px5JkfgsOTzXU6GtvYxvDB7VXntU
         R0tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=i2eHc6EduuRy9IXt0IrW6LdtP5rNELiZJU7Gubi9OL4=;
        b=iCwVKga2uohm6qR95JVimP2PvfLce1tdmbTbCzrVWlua8K2iZwB8ma0HJAIkYE/xfc
         80GSG8qbxaoLy5J44gBbBZ1X2gvwxg8zzBhoUIDYtd+Y6NsPlnf4ElxlroyRfUJF6G1n
         PFn7pBvrTVNNBx/QbenyjmoHZQdfLtFosx8eMyQvPL5NOnkSGzc57R+dYvJvGZsIpIwf
         xityahLTE8IAlVJvLW63fI7US3LAx1o921rRlfjkyLcAdgOxh+ALZxy3eZpjbfomorA0
         iklNVASzz72YTWbiOyTuYB1kgpB3QoFroTQ/aSdtCR+jxZx3vBZz/poTay6XxVnJ7nj5
         06jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pi10-20020a05620a378a00b0074e244a98c6si5855714qkn.645.2023.05.24.03.28.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:28:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q1lix-0008HP-Eq; Wed, 24 May 2023 06:28:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1lic-0007tV-Os; Wed, 24 May 2023 06:27:47 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1liY-0000PE-ID; Wed, 24 May 2023 06:27:45 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id B4743260BBC;
 Wed, 24 May 2023 12:27:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0v95eSEzGZ7Z; Wed, 24 May 2023 12:27:39 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 85571260249;
 Wed, 24 May 2023 12:27:36 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3 5/5] hw/arm/sbsa-ref: use MachineClass->default_display
Date: Wed, 24 May 2023 12:27:29 +0200
Message-Id: <20230524102729.810892-6-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
References: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Rtg3m0Mjyzeq

Mark the default graphica via the new MachineClass->default_display
setting so that the machine-defaults code in vl.c can decide whether the
default graphics is usable or not (for example when compiling with the
"--without-default-devices" configure switch).

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 9a3d77d6b6..30ce7f7db4 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -649,7 +649,7 @@ static void create_pcie(SBSAMachineState *sms)
         }
 
         if (vga_interface_type != VGA_NONE) {
-            pci_create_simple(pci->bus, -1, "bochs-display");
+            pci_create_simple(pci->bus, -1, mc->default_display);
         }
     }
 
@@ -865,6 +865,7 @@ static void sbsa_ref_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
     mc->default_ram_id = "sbsa-ref.ram";
     mc->default_cpus = 4;
+    mc->default_display = "bochs-display";
     mc->possible_cpu_arch_ids = sbsa_ref_possible_cpu_arch_ids;
     mc->cpu_index_to_instance_props = sbsa_ref_cpu_index_to_props;
     mc->get_default_cpu_node_id = sbsa_ref_get_default_cpu_node_id;
-- 
2.40.1

