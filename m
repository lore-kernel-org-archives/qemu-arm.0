Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp1811816lfq;
        Mon, 28 Feb 2022 06:09:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBF8riyylLDd3DMuc4B6R9jzk6ZC2xuyLUXRphXgR0D2G0jwGhhMopr40utvVI6EBOnM8F
X-Received: by 2002:ab0:654d:0:b0:347:27e5:cb4a with SMTP id x13-20020ab0654d000000b0034727e5cb4amr1918739uap.67.1646057377868;
        Mon, 28 Feb 2022 06:09:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646057377; cv=none;
        d=google.com; s=arc-20160816;
        b=xceTCt5sjrpHxUfDjVbcIespCb5wUSqIxgadGW18gNEjazORy0VJY0jz3MofGlk76j
         sDY2U11notNwwyJiqmVF4birQfCzz9IeCeKMWS+MQo+0AJLSM7IjZYVcpnDRUZDhsQyS
         uyfQ8+pKAOBNZ8BMepgSHBREEV9mm3sYY5JmbK1Th1t3C3iTp1/7Olcl0pexPFiqK89X
         oab/2ltUDxi+U9Qmnpm8xUiRe8nvgQSDVNCXmk5tboRUZeOtWONvW8eg1Shl1Pwk9WOW
         MQzDGP6dyehtpnq5j7WDixyJfbClTO2zGSXI1L5zFqC8NBnu1X71agiSL3Btl1dooY17
         r+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:mime-version
         :content-transfer-encoding:to:in-reply-to:message-id:subject:date
         :from;
        bh=qb3lGYsAsgoEWJ7i34tl9T0samNKessC2ncln3vMbm0=;
        b=u7ooYDTZhV3aEARdZlhvQv9AElFZ7AKPScI51ox3XRPLkpQ5hpe4mTjvBqDePda8G3
         wty142L941qkYdbPy7N/HTagYtolvvMv0+kLbYNwKX0w/szla1vNnWKkhOz2kzf0O9a5
         iSDXFlY2UyxyAHYaGIApAzdt/piCKE7Oy+3Y2Tt4nlgcOLnMdbK11BsX5c7kB4tUl41I
         4oITr7iOLw9FDnD1Y7jPTsn/LYldv6q+6WmDSYE45DnuaVlOk6I2WIpwxRP/wO/mksZo
         cOARtAzxGwjTD9vC1/Us3jkIBRnxlt0QH6+5xl4W6laWfoaK42t5RPCiFnQJfGUSxxLc
         8m1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h30-20020a056102209e00b0031bdd425532si638967vsr.191.2022.02.28.06.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Feb 2022 06:09:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=sr.ht
Received: from localhost ([::1]:58436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nOgiW-00035C-8Q
	for alex.bennee@linaro.org; Mon, 28 Feb 2022 09:09:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn6-0001Yd-B4; Mon, 28 Feb 2022 01:45:52 -0500
Received: from mail-b.sr.ht ([173.195.146.151]:58198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nOZn2-0003IO-LJ; Mon, 28 Feb 2022 01:45:51 -0500
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id 1120D11EF38;
 Mon, 28 Feb 2022 06:45:46 +0000 (UTC)
From: ~ubzeme <ubzeme@git.sr.ht>
Date: Mon, 28 Feb 2022 09:12:14 +0800
Subject: [PATCH qemu 3/7] hvf: use correct data types for addresses in memory
 related functions
Message-ID: <164603074537.20094.1732342403585879912-3@git.sr.ht>
X-Mailer: git.sr.ht
In-Reply-To: <164603074537.20094.1732342403585879912-0@git.sr.ht>
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 18
X-Spam_score: 1.8
X-Spam_bar: +
X-Spam_report: (1.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 FREEMAIL_FORGED_REPLYTO=2.095, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Feb 2022 09:07:18 -0500
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
Reply-To: ~ubzeme <ubzeme@gmail.com>
Cc: Yan-Jie Wang <ubzeme@gmail.com>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iaWIDxY6/Nht

From: Yan-Jie Wang <ubzeme@gmail.com>

Follow the QEMU coding style. Use hwaddr for guest physical address.

Signed-off-by: Yan-Jie Wang <ubzeme@gmail.com>
---
 accel/hvf/hvf-mem.c      | 2 +-
 include/sysemu/hvf_int.h | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/accel/hvf/hvf-mem.c b/accel/hvf/hvf-mem.c
index c60303c84e..e8cd6b9251 100644
--- a/accel/hvf/hvf-mem.c
+++ b/accel/hvf/hvf-mem.c
@@ -32,7 +32,7 @@
 
 static hvf_slot memslots[HVF_NUM_SLOTS];
 
-hvf_slot *hvf_find_overlap_slot(uint64_t start, uint64_t size)
+hvf_slot *hvf_find_overlap_slot(hwaddr start, hwaddr size)
 {
     hvf_slot *slot;
     int x;
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 8ee31a16ac..2c4a97debe 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -22,9 +22,9 @@
 #define HVF_SLOT_READONLY (1 << 1)
 
 typedef struct hvf_slot {
-    uint64_t start;
-    uint64_t size;  /* 0 if the slot is free */
-    uint64_t offset;  /* offset within memory region */
+    hwaddr start;
+    hwaddr size;  /* 0 if the slot is free */
+    hwaddr offset;  /* offset within memory region */
     uint32_t flags;
     MemoryRegion *region;
 } hvf_slot;
@@ -58,7 +58,7 @@ int hvf_arch_init(void);
 int hvf_arch_init_vcpu(CPUState *cpu);
 void hvf_arch_vcpu_destroy(CPUState *cpu);
 int hvf_vcpu_exec(CPUState *);
-hvf_slot *hvf_find_overlap_slot(uint64_t, uint64_t);
+hvf_slot *hvf_find_overlap_slot(hwaddr, hwaddr);
 int hvf_put_registers(CPUState *);
 int hvf_get_registers(CPUState *);
 void hvf_kick_vcpu_thread(CPUState *cpu);
-- 
2.34.1

