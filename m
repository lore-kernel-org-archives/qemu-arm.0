Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp1950720njc;
        Mon, 16 Jun 2025 08:52:54 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCULITGOTm/lpN7QTQvaIab2KyxADEo3pWmReQCVWqZH76i/T1gsSxyqaqn/rRi6L9rGUwxD/KFuAG2woA==@linaro.org
X-Google-Smtp-Source: AGHT+IGBm6VJcq6aTVZrK69Qca5jLCKgIerIauRFBEQJRWThNKSLeeS4Zgdfs585l98Cjaj5ETNU
X-Received: by 2002:a5d:5f4e:0:b0:3a4:f893:3f03 with SMTP id ffacd0b85a97d-3a572e79692mr6992083f8f.45.1750089173710;
        Mon, 16 Jun 2025 08:52:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1750089173; cv=pass;
        d=google.com; s=arc-20240605;
        b=Rs9hH4cNHkRXl4C4IWQzIi2z1Q0rDABPlNyz7bB2jIAoMtl9mMYE9Y+IC0jQxAPPEB
         l9U/NcOt17HLGh6r9k7736naT/OFt100qTCSgguqAeyEnOTW7GiL1el7TlMzoYiIrdcs
         J4pwGf7Ffk+zkiLwzG6sIpWbCvOkZ1krGuP/b3q3XJv1anlB1outQVvm3OM1IX7IdroY
         kkhg5WEJLmJ9sIoVwXmNZEajRnBs1U/b3MGT13hAw1ToA0oVxMQ5pduGy4RP96trw/Xk
         Ko5uMiE/RVNfqd/1JItaBAKYowHWl/iLvMhvLonuIBf2HVZkKCmDBP//enoPut2rE+/m
         NxGA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature:arc-filter;
        bh=vUgFWK27h7+QzB2tPNFSekmWswMsNRaZj07x9fPU7Xo=;
        fh=k7QEiNZfr1ScQsNOT11oMF1qoGKc91uRRDJBZaz6hH0=;
        b=IPzo//qT1SFcLj5fhqxTxnojd2WtlChOOY5HfyErfVO0c6XuMeepyyqGKtEmg63a7k
         dRxDW6mMvU4YEUX/4eDVZQDF4/B2edMACh6nW+XHlTkmLeurohWmii7b0ijO2Fi0dUTS
         rPHCQmnCKB5rk7mt8TBGEGZ83Aq7qj0E9Rc8DbAEFiN9+j0v3WhtfgWP2BPhs8AcbiFF
         NA7R1dH36T61t70HcfkOt6Cxin1Kx4TG2To+Ri6LWWGnhHPkCNJc6K7ng9fRLJBUJ4/I
         yR1p37aJ1rhzDZrYbmIZ+xHQKBME2GEk+VRzLIRnEKCojIngOHhEnrZ0kQT9G2gB9so1
         rStA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@sean.taipei header.s=2021Q3 header.b=UB32phdY;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=sean.taipei
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a568a541ccsi6327570f8f.164.2025.06.16.08.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Jun 2025 08:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sean.taipei header.s=2021Q3 header.b=UB32phdY;
       arc=pass (i=1);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=sean.taipei
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uRC8c-0002Uc-V0; Mon, 16 Jun 2025 11:52:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@sean.taipei>)
 id 1uRC8V-0002OC-QN; Mon, 16 Jun 2025 11:52:39 -0400
Received: from mail.sean.taipei ([128.199.207.102] helo=sean.taipei)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@sean.taipei>)
 id 1uRC8S-00044M-9K; Mon, 16 Jun 2025 11:52:39 -0400
Authentication-Results: sean.taipei; dmarc=fail (p=quarantine dis=none)
 header.from=sean.taipei
ARC-Filter: OpenARC Filter v0.1.0 sean.taipei B20C17389
ARC-Seal: i=1; a=rsa-sha256; d=sean.taipei; s=arc-2024Q2; t=1750089120;
 cv=none;
 b=AsG7YFQQWVqR6a2Uc5LrKDmiiLeOS+Xo3D5TvWdAsFTJ/Z/O9qkRIQ8e37DlVJaZynsHqekehc0ZXD/QJDjXBwk+VilWM7SeBN4VOg8V409nYkOpZviSj4K1crXxYkVDoBbhVXip4Xdk7kVNW2Pupdz4rs2Hphy8A7VhOG+7ZL/RZXjBeOY29jCpUNfkvV8tBbiXVzm3NKvbPLpawQUAaVcdTm3JxurmBgngmH+FGYXyVrBddOwfDNryf/sKJ9zlbiG+h+IUIUNljrZqmKxpF8Ta7J2wP/Mr1lXp+TzvJMqrj3j3ny5RjcMU1vTS6XoHsN/+UD6VXhr6oIonEWUkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=sean.taipei; s=arc-2024Q2;
 t=1750089120; c=relaxed/simple;
 bh=xwjkPl8NeSHmZR6/B86A6bnYGCIQGsZXeJmjL1O1fWw=;
 h=DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:References:
 MIME-Version;
 b=rl1eDOiOJov0p8fEBfVun2ynnI1G/K2sDxJgQlMYUx7x85IRT6ln7gdD4WykS+ifVx1hWjUnMT/48dXvP3zIzGuObSl8FwKL2y2Upts0M5ab3TpYxMC1YRiUzPiqscCco+tSKyfbxWZkXNbZgHsJ3HXJDChOfcO0JwURqETITw0IGg04gA8zDyI+KTLETbIWFucn8W1lANziGmHQCJAd4J/GQ2jqzCBEUI0+SQu0ah9EKaN9dN8fRrwOU/HdQUQnl0wZeplbqCzEr09BDOsM6XNHfPEZJcXZfkfKH/cty69Vu5UI0xi9RuG21vwWKc8h3kYOUxKtkpKFIlIqk8cB0w==
ARC-Authentication-Results: i=1; sean.taipei;
 dmarc=fail (p=quarantine dis=none)
 header.from=sean.taipei
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sean.taipei;
 s=2021Q3; t=1750089119;
 bh=xwjkPl8NeSHmZR6/B86A6bnYGCIQGsZXeJmjL1O1fWw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UB32phdYayN4xdsvinvny+ll6lGzs/Mre+6v5ZjTIPNBFx5P8oBtDZMYjsDU8Q2B9
 gK+jjkZ5XJvEPUkgFOJ6knfqyrydw0MStoigOaXYFwCcX68RzoO31bYDaIw9hKpUGl
 W5uXhZ3As0ExsBNarmNPJVd+aVNomd6a8efe8EDYW5tLZmMHGv/Lbam9wq93xhKLtt
 ptPJCXgvDkw7zVHvTHdW6OFwoW0kikJU9fMHN5gmmX7lbo4h/CJuFMU4tNEZ2vyfAB
 AZQwOTh1KcS9ZCyMZ/nLh5yvEJrnxXLEtdrX3q/MjaqV8wrfXXgBsA04nJ/QvH3SuQ
 t1x2Xjqc5mLVg==
Received: from localhost.localdomain (unknown [23.170.80.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by sean.taipei (Postfix) with ESMTPSA id B20C17389;
 Mon, 16 Jun 2025 23:51:55 +0800 (CST)
From: Sean Wei <me@sean.taipei>
To: qemu-devel@nongnu.org
Cc: Sean Wei <me@sean.taipei>, Keith Busch <kbusch@kernel.org>,
 Klaus Jensen <its@irrelevant.dk>, Jesper Devantier <foss@defmacro.it>,
 Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 qemu-block@nongnu.org (open list:nvme),
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH 6/6] treewide: fix paths for relocated files in comments
Date: Mon, 16 Jun 2025 11:51:30 -0400
Message-ID: <20250616.qemu.relocated.06@sean.taipei>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616.qemu.relocated@sean.taipei>
References: <20250616.qemu.relocated@sean.taipei>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1  ALL_TRUSTED
X-Powered-By: Sean <postmaster@sean.taipei>
X-Scanned-By: MIMEDefang 3.3 on 104.21.5.93
Received-SPF: pass client-ip=128.199.207.102; envelope-from=me@sean.taipei;
 helo=sean.taipei
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: EixshXkdOiC+

After the docs directory restructuring, several comments
refer to paths that no longer exist.

Replace these references to the current file locations
so readers can find the correct files.

Related commits
---------------

  189c099f75f (Jul 2021)
    docs: collect the disparate device emulation docs into one section
    Rename  docs/system/{ => devices}/nvme.rst

  5f4c96b779f (Feb 2023)
    docs/system/loongarch: update loongson3.rst and rename it to virt.rst
    Rename  docs/system/loongarch/{loongson3.rst => virt.rst}

  fe0007f3c1d (Sep 2023)
    exec: Rename cpu.c -> cpu-target.c
    Rename  cpus-common.c => cpu-common.c

  42fa9665e59 (Apr 2025)
    exec: Restrict 'cpu_ldst.h' to accel/tcg/
    Rename  include/{exec/cpu_ldst.h => accel/tcg/cpu-ldst.h}

Signed-off-by: Sean Wei <me@sean.taipei>
---
 docs/spin/tcg-exclusive.promela | 4 ++--
 hw/nvme/ctrl.c                  | 2 +-
 target/arm/cpu.c                | 2 +-
 target/loongarch/README         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/docs/spin/tcg-exclusive.promela b/docs/spin/tcg-exclusive.promela
index c91cfca9f7..1d03af850b 100644
--- a/docs/spin/tcg-exclusive.promela
+++ b/docs/spin/tcg-exclusive.promela
@@ -1,6 +1,6 @@
 /*
  * This model describes the implementation of exclusive sections in
- * cpus-common.c (start_exclusive, end_exclusive, cpu_exec_start,
+ * cpu-common.c (start_exclusive, end_exclusive, cpu_exec_start,
  * cpu_exec_end).
  *
  * Author: Paolo Bonzini <pbonzini@redhat.com>
@@ -65,7 +65,7 @@
                              }
 #define COND_BROADCAST(c)    c++
 
-// this is the logic from cpus-common.c
+// this is the logic from cpu-common.c
 
 mutex_t mutex;
 cond_t exclusive_cond;
diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index fd935507bc..5810bfbe7a 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -22,7 +22,7 @@
  *
  * Usage
  * -----
- * See docs/system/nvme.rst for extensive documentation.
+ * See docs/system/devices/nvme.rst for extensive documentation.
  *
  * Add options:
  *      -drive file=<file>,if=none,id=<drive_id>
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e025e241ed..90cf924938 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2672,7 +2672,7 @@ static const char *arm_gdb_get_core_xml_file(CPUState *cs)
  * linux syscall TIF_TAGGED_ADDR setting, not TBI in general.
  *
  * There should be a better place to put this, but we need this in
- * include/exec/cpu_ldst.h, and not some place linux-user specific.
+ * include/accel/tcg/cpu-ldst.h, and not some place linux-user specific.
  *
  * Note that arm-*-user will never set tagged_addr_enable.
  */
diff --git a/target/loongarch/README b/target/loongarch/README
index 0b9dc0d40a..1ffd3422d2 100644
--- a/target/loongarch/README
+++ b/target/loongarch/README
@@ -11,7 +11,7 @@
 
 - System emulation
 
-  You can reference docs/system/loongarch/loongson3.rst to get the information about system emulation of LoongArch.
+  You can reference docs/system/loongarch/virt.rst to get the information about system emulation of LoongArch.
 
 - Linux-user emulation
 
-- 
2.49.0

