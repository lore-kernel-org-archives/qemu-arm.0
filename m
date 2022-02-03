Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1897424lfk;
        Thu, 3 Feb 2022 06:47:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy70khbmGYhLcXgVwUXQro+bOIwAT1z3dNnyjgQyi9bvpIX78iuhUXgDoltDVu4F8if9pI3
X-Received: by 2002:a81:1d8f:: with SMTP id d137mr4483039ywd.383.1643899627742;
        Thu, 03 Feb 2022 06:47:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643899627; cv=none;
        d=google.com; s=arc-20160816;
        b=E4LZOH1ivsPtH+o0c2KWoNiCW8oypdpP5Ksu237A6PFaQrxpW9tNdEiNcba6PuwUwR
         gty6iF/Xsuy2EgSZ9eeCUYTu7kmvrUAz4/00zwUzJ1ZAWXRKD7CDN1/wPdsV9jfJpikE
         5V7WvQntuK+Js12z/ih/lFNcRFwaC6MX1YLRrpcgbGsbNqjQvV9IXFov4SwtlM9wzI0g
         POm43i+NjS21Wpewachk+8/1UkpfKYVBbuSZ5kKKDPuzxbo/HTsF+poafGKBuNhAk5Fj
         Vebd5Dd8BENi2bzQ4A4RX4ZAt41dsPxlM/yWyBO/5jjr9pG2UltN7fEdFve0nHmotVIz
         uUzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=TOWoguJq/mWVhBJ7miyvfGycpXiSxjlmqB6T3zm3ALQ=;
        b=sSCww715lrKbUzB6DFfobJ//wtIQj5OYrOcYZQVAsG+N7pqBxljSTpk+4IvL7SYLT/
         ouMnFxnxZgydR0gYo7H22iM7jOnj2PGkiWaENPEjp4mwTCw79rpsrnGmymiJCHvG7p6u
         RizHB1yNj0iuYTGbPEAIHBN/j2K8hwNSCM8DNhcoxWzJ5wTSqRN4dBAP/CpNLOeAlXjG
         DHZYCXFkoO+XSTkfBfIlTXoohCQNMK63Xx++3l+apPriN1aPuW2mFbLc2uQdKQke00/x
         o34sxnQ/He5WQIW7Fla3W+PZ2jYigweNg7bmwJMS3vB05/vyXP5NVJTskO1YH/tt0tEU
         qczQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i205si34726653ybc.499.2022.02.03.06.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Feb 2022 06:47:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nFdO7-00073t-3C
	for alex.bennee@linaro.org; Thu, 03 Feb 2022 09:47:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nFd1I-00028R-Cv; Thu, 03 Feb 2022 09:23:32 -0500
Received: from mail.csgraf.de ([85.25.223.15]:34076 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nFd1G-0007FO-EE; Thu, 03 Feb 2022 09:23:32 -0500
Received: from localhost.localdomain
 (dynamic-095-114-033-227.95.114.pool.telefonica.de [95.114.33.227])
 by csgraf.de (Postfix) with ESMTPSA id 39B4F6080DA9;
 Thu,  3 Feb 2022 15:23:22 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH] hvf: arm: Add simple dirty bitmap tracking
Date: Thu,  3 Feb 2022 15:23:20 +0100
Message-Id: <20220203142320.33022-1-agraf@csgraf.de>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Cameron Esfahani <dirty@apple.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i7OoEjDkCHq3

The actual tracking of dirty bitmap updates is happening in architecture code.
So far, the aarch64 hvf code has not updated QEMU's dirty bitmap at all. The
net result of that is that the VGA device's framebuffer would not update.

This patch adds simplistic dirty bitmap updates. Unfortunately hvf can only set
permissions per full region, so we have to mark the complete region as dirty
when only a single byte was modified inside.

We also handle the write protect update logic before we handle any writes.
This allows us to even handle non-ISV instructions on dirty logging enabled
memory regions: Once we flip the region to writable again, we just rerun
the trapping instruction.

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 target/arm/hvf/hvf.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0dc96560d3..92ad0d29c4 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1163,6 +1163,28 @@ int hvf_vcpu_exec(CPUState *cpu)
             break;
         }
 
+        /*
+         * Dirty log updates work without isv as well. We just run the write
+         * again with write permissions set. So handle them before the assert.
+         */
+        if (iswrite) {
+            uint64_t gpa = hvf_exit->exception.physical_address;
+            hvf_slot *slot = hvf_find_overlap_slot(gpa, 1);
+
+            if (slot && slot->flags & HVF_SLOT_LOG) {
+                /*
+                 * HVF can only set a full region's permissions, so let's just
+                 * mark the full region as dirty.
+                 */
+                memory_region_set_dirty(slot->region, 0, slot->size);
+                hv_vm_protect(slot->start, slot->size, HV_MEMORY_READ |
+                              HV_MEMORY_WRITE | HV_MEMORY_EXEC);
+
+                /* Run the same instruction again, without write faulting */
+                break;
+            }
+        }
+
         assert(isv);
 
         if (iswrite) {
-- 
2.32.0 (Apple Git-132)

