Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1156391lfm;
        Mon, 17 May 2021 03:55:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybBNbmUujO2zLClpd8cMQawwrrZf3rNU5n+YQu5KCzkV8vmpptIqzUpcdXoiTsWtANG7Si
X-Received: by 2002:a05:6e02:20ce:: with SMTP id 14mr52173681ilq.102.1621248913343;
        Mon, 17 May 2021 03:55:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621248913; cv=none;
        d=google.com; s=arc-20160816;
        b=xOwrPr4alTCDz06NL+bFbp0chx+souRrQHlAA6oPFjAhvoCscbA2P012aW3ZUoCmsh
         ArAiwOJB2BiZlDVRhtrnksjN5lmnhEr2H7CdoDBUUFBFbX/zHO7TxhxJlZPY6PzjkGhp
         TvfYBQCQX3cFiUqx6QHoIFK2PIS6Vbnvp2puafvS33GgP5C4wLOSTOeoNr07VOg5qz24
         8Aw6VWT8+zJvrkbZq+yI7JkhnmNJXhQlHyPhfV2M+vc6kz8X2iXVw4JAPtLXRZkoFI2h
         Z/TXjiW607Bdv8MX3WALz/FA4/c4Cpups+hM8p+Kb0CcinClcWtrX16lASZa4zryzyCR
         aqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=GlSXe+rLjO5Sm+DFhb+DRpEt2vwp+8OnODDN1P00uBk=;
        b=Y4c6DeajOJMIX8KLc+t4xrAXw6IP1pWbA35T8iQacXGpyFceMPfhanJOE6pQUPyI5h
         WzxzJdIpTUspPWDaYXTxeNH8Ij1iA7Ngboj7A6aaLegFy2RhQMNOMG5l8sGtnmSlf2Ut
         5ybIlaUKkOCbIfp08/8/pzUDMN8IWYT0m1cfZdAdIOnW3CAp62nEWVMHH6+oBN+koX/O
         /G1saFHT+gszamFbh2i3yaLlfE1VQoqkOOEJ1bWPslDnYRS7qdpKPJdtG1f0nenM9vZ2
         0Z2sYIYQQ745OCk9LsXYbijPPf4drrzT1ceRPk8RUkDCrWW3uDSeetAKaCI3nxEjhscN
         hQUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W8v5ewV3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si18489495jaj.107.2021.05.17.03.55.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 03:55:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=W8v5ewV3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liau0-0002Nq-II
	for alex.bennee@linaro.org; Mon, 17 May 2021 06:55:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarA-00052o-Du; Mon, 17 May 2021 06:52:16 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liar8-0006YS-LX; Mon, 17 May 2021 06:52:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id j14so4140575wrq.5;
 Mon, 17 May 2021 03:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GlSXe+rLjO5Sm+DFhb+DRpEt2vwp+8OnODDN1P00uBk=;
 b=W8v5ewV3Bdno7Txtdy4oFcQuokxSg6tEF86HSbkhdjYzIAl+L4ppgjqT6HW4GaveBo
 LtLgJHswCMjWD9Twdavox3X2krKFuH89MMyrP7Si4Tr84fr0QrLBBDqhy4TYOqsz7Eq/
 toyB41+6p2ON3BG3X9c4HUwowH7PDQwUHzQqj7i/AH2qMyMyXrtZNYfBdpxvxlfDj3D2
 bwyBeSJjEDQmdYI/69EV999JA2+Y/ynDsoU+7OuYUUn5o8nD6mcy97ZE/3HVn/FOG1Sh
 EE1bHaJlAZRXKrDEMSn25yLOs8tqDKdzmiSum80bZj4ONrhN9b70A/CAvN6V0Y+bhjML
 NHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GlSXe+rLjO5Sm+DFhb+DRpEt2vwp+8OnODDN1P00uBk=;
 b=rVn5pjtuep2xMjpUqpLdTMSu6LB5evyLhQdjAHAtRBOaiaj3s2VmvEKbBIlkiCMbM2
 p4EQdgO5AQXj6JuDVyzRXuRXTwe9F3NTQjryKQ139BAZXUwTEKzxJvBpQ/fjZxWPl+zi
 EVQ+GcfCIhtX1uPPNGJn27LY7p67iYzMpM8X4gfFeSV+672JUvN/fpPWdjarm+9hFb1d
 TSX49yAgN09OlELrxIe71xWTbF23hINMoffVNnMCDZuhJG/DSi5mS8/VNnepJvxEGQLL
 jOTx246YMf62hb1DcuvXYJasN1jKq7zqjQVdCV+FRDf3zJecbK+ZDeQ3No1N+ogtDlOC
 e8qw==
X-Gm-Message-State: AOAM531a3XNYeVSzrwwdnB4fbiOmWUubIKcX/YA8lHxxAvXOufr58Vut
 Cpfi9ebC45fLzi7iSxKDvaTSWOZlwTwgrw==
X-Received: by 2002:a5d:4e91:: with SMTP id e17mr11136051wru.396.1621248731341; 
 Mon, 17 May 2021 03:52:11 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id j14sm16735759wmj.19.2021.05.17.03.52.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:52:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/23] cpu: Un-inline cpu_get_phys_page_debug and
 cpu_asidx_from_attrs
Date: Mon, 17 May 2021 12:51:23 +0200
Message-Id: <20210517105140.1062037-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LL7f67hqfqzR

To be able to later extract the cpu_get_phys_page_debug() and
cpu_asidx_from_attrs() handlers from CPUClass, un-inline them
from "hw/core/cpu.h".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 33 ++++-----------------------------
 hw/core/cpu-sysemu.c  | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index d45f78290e0..df495287850 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -586,18 +586,8 @@ void cpu_dump_statistics(CPUState *cpu, int flags);
  *
  * Returns: Corresponding physical page address or -1 if no page found.
  */
-static inline hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
-                                                   MemTxAttrs *attrs)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->get_phys_page_attrs_debug) {
-        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
-    }
-    /* Fallback for CPUs which don't implement the _attrs_ hook */
-    *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->get_phys_page_debug(cpu, addr);
-}
+hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                     MemTxAttrs *attrs);
 
 /**
  * cpu_get_phys_page_debug:
@@ -609,12 +599,7 @@ static inline hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
  *
  * Returns: Corresponding physical page address or -1 if no page found.
  */
-static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
-{
-    MemTxAttrs attrs = {};
-
-    return cpu_get_phys_page_attrs_debug(cpu, addr, &attrs);
-}
+hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
 /** cpu_asidx_from_attrs:
  * @cpu: CPU
@@ -623,17 +608,7 @@ static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
  * Returns the address space index specifying the CPU AddressSpace
  * to use for a memory access with the given transaction attributes.
  */
-static inline int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    int ret = 0;
-
-    if (cc->asidx_from_attrs) {
-        ret = cc->asidx_from_attrs(cpu, attrs);
-        assert(ret < cpu->num_ases && ret >= 0);
-    }
-    return ret;
-}
+int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
 
 #endif /* CONFIG_USER_ONLY */
 
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index f517ef5d460..fe90dde8681 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -22,6 +22,38 @@
 #include "qapi/error.h"
 #include "hw/core/cpu.h"
 
+hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                     MemTxAttrs *attrs)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->get_phys_page_attrs_debug) {
+        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
+    }
+    /* Fallback for CPUs which don't implement the _attrs_ hook */
+    *attrs = MEMTXATTRS_UNSPECIFIED;
+    return cc->get_phys_page_debug(cpu, addr);
+}
+
+hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
+{
+    MemTxAttrs attrs = {};
+
+    return cpu_get_phys_page_attrs_debug(cpu, addr, &attrs);
+}
+
+int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    int ret = 0;
+
+    if (cc->asidx_from_attrs) {
+        ret = cc->asidx_from_attrs(cpu, attrs);
+        assert(ret < cpu->num_ases && ret >= 0);
+    }
+    return ret;
+}
+
 GuestPanicInformation *cpu_get_crash_info(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
-- 
2.26.3

