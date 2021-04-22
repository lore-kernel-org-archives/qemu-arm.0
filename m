Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp240436lfb;
        Thu, 22 Apr 2021 03:51:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjzqhcjQu3wXKVorUZmyDNsVIn4iY7E/UPUUXgs+jp5ET0H2/5VrEVrBjULqajVY6Navfn
X-Received: by 2002:a05:620a:1267:: with SMTP id b7mr3068829qkl.116.1619088661649;
        Thu, 22 Apr 2021 03:51:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619088661; cv=none;
        d=google.com; s=arc-20160816;
        b=F4iV6CccUyYRTneMZ/tpLUKT0DGkbJQAo8DNy4K6pPeMQpS4BB024c+zCEFlhDjnz+
         q+1iRqlz/ivO0Bl0pOYZd5Bw7UQo7E8+wGOhb8w/PUkvPUpjO7pxseJcfEY25m0azp7k
         1qEm6RdctaUgJjCMq+kd/9lvzeixrblfwT/IfT9OU/4NNXRWSIVlRaotM0VVSo/gxQGM
         FgsmvXLEG41+pr0eVCY2rDHDeDDp1sjlQq8Ewm4KTvjvV+7zRzw1XwrK7nPSawNtlur2
         zdlnfnubid94bhPUEkysXkOgjcuZmnlasWjYWDO7IiB7S1Sotl2FGHe7/hNHqJipdBfy
         fYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JQ0OTstwzXipk72lX8fvK3spe8ZEv2YAFM7sdltFU54=;
        b=kWZxKOQpAuJ0bpnIamchTdX3shB/6Ecm6wcIIxjSHUlEHXxz41R/KZs2ncFcRVoVEJ
         g7ERIkWpnTgYygrAKnv06FaS7VAIhKnLa5HeI878ID3TehRzCyq7ZkOUlGYsBOIx9/v/
         +Ae/rpwPJ7MoPxEDP5aaCrrpOaC7XVdq9MnhDzRBJ/ggTqAwzQWrOKU9hzm80VM+PIf8
         VscNn6LumeMeWcWoXfzhoFSRQENKo+Yh7Tjfyln9ybOKx4b4hfwv1N/P9vCYX5gINRxX
         SvzHK2NF8mnyAxZWsCXre8UUHfQtae2by9eyPGgcAtuUiPKa9QGahD3rVtoz05RbX7tM
         vyoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aeWAH3G8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4si1844102qkl.245.2021.04.22.03.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Apr 2021 03:51:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aeWAH3G8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZWvE-0001EW-TC
	for alex.bennee@linaro.org; Thu, 22 Apr 2021 06:51:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWrd-0005Sm-QR; Thu, 22 Apr 2021 06:47:17 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWrc-0004pO-4d; Thu, 22 Apr 2021 06:47:17 -0400
Received: by mail-wr1-x433.google.com with SMTP id a4so44312682wrr.2;
 Thu, 22 Apr 2021 03:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JQ0OTstwzXipk72lX8fvK3spe8ZEv2YAFM7sdltFU54=;
 b=aeWAH3G8EpW+AZHWNlu0nhIo7Ev+MF7JBLe5jkax6DTbA5/ZYpOOfY934gfXmDu5JC
 6dszsbsd5Y3dkur/QuVT/iQgifazshNbCliHl6WlVx6sOYERCYw+7FoxnSO8CZ+Hyu6X
 nXPFPyrLULI5RQFyoE2QT2i0btOWhf0c9SuctODrXgwzHNYpEptoZOjpJY9PuVl5Bhz3
 8JFD0Ycu9qGeOg8Wi3yjLBwkJT00waTp9SFo6hVYqXraLNhcMrQfLsl4Ukl1hPaotWP2
 fXcBnlBaR5cYtCHZgLVaqa1NqLOJSyl8utbKSS2JpAGZxUqL1biLJN5r89Bwt05LWEfI
 q56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=JQ0OTstwzXipk72lX8fvK3spe8ZEv2YAFM7sdltFU54=;
 b=RfVViK5oa7uNBdS5K9NdJv+xA9u0IqnLr8tEro5Lgpg+8kMH36m+ZWtvJ2i4vGwciU
 0XFtg8yLpnHDkZKv6vehs2sWS+GOtAZ/nE9wD3ME49qTbXVifqo5yhAbmsiwgHshpJ62
 rxN5EQfpgVyY0P5ewdmMwksBeP0C9zRqkCqHzjXbta8W/DgCAkAYaZF8FFrQ5gBjTnRk
 cfP4pj+xctMUpllIB0JZrYNQWGpIiUwPuAYVinzc/0SRA34jf7EWKpC2coYaLIrW4D6t
 7vsoN6mxt1bN6LyBOPFuOtHp+3fUpx8ThP01GrGxODxdw+SGGGgLw/kFQpxtCLZUkJ/J
 l+Ww==
X-Gm-Message-State: AOAM533C9pfs0gNJ7fEWDy1wKMqnrnfklNH/hHcWss8cz33oOyJjZkCz
 SxlV4LF6o6rTHvsS2ukPiAVwSGmBXbap6w==
X-Received: by 2002:adf:84e6:: with SMTP id 93mr3193295wrg.376.1619088432924; 
 Thu, 22 Apr 2021 03:47:12 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id u5sm5652369wmg.25.2021.04.22.03.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 03:47:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 01/15] cpu: Un-inline cpu_get_phys_page_debug and
 cpu_asidx_from_attrs
Date: Thu, 22 Apr 2021 12:46:50 +0200
Message-Id: <20210422104705.2454166-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422104705.2454166-1-f4bug@amsat.org>
References: <20210422104705.2454166-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /A3xeRiuyHRJ

To be able to later extract the cpu_get_phys_page_debug() and
cpu_asidx_from_attrs() handlers from CPUClass, un-inline them
from "hw/core/cpu.h".

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 33 ++++-----------------------------
 hw/core/cpu.c         | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c68bc3ba8af..9338e80aa4b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -580,18 +580,8 @@ void cpu_dump_statistics(CPUState *cpu, int flags);
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
@@ -603,12 +593,7 @@ static inline hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
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
@@ -617,17 +602,7 @@ static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
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
 
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 00330ba07de..4dce35f832f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -94,6 +94,38 @@ static void cpu_common_get_memory_mapping(CPUState *cpu,
     error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
 }
 
+hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                                   MemTxAttrs *attrs)
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
 /* Resetting the IRQ comes from across the code base so we take the
  * BQL here if we need to.  cpu_interrupt assumes it is held.*/
 void cpu_reset_interrupt(CPUState *cpu, int mask)
-- 
2.26.3

