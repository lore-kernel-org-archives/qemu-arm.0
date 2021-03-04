Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6647601lfg;
        Thu, 4 Mar 2021 14:51:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIGeQscRuJIT3rbCB2pkrOaQ1zMzayhBZ5ZTOyR2PFI/P+y9HQxQXscNeOxrG4OSs7ount
X-Received: by 2002:aca:455:: with SMTP id 82mr4821238oie.174.1614898297877;
        Thu, 04 Mar 2021 14:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614898297; cv=none;
        d=google.com; s=arc-20160816;
        b=FAUcdmvyUrSq9ONVi09cOrcLNkUe30qUQJX330Y1LzWT4jMulYUHKSy1/hy6Uu18vB
         sY4jF6nqsu1yWFgMLlkIMje669/ZhVzR53xwPdZmIB1hEPaP8zAcZG/+0TsWHJaqGAU4
         NWFotoj+4i6ScRAXIuvXHYck2SfeeXXSwn+Mpr2e/s9RGwuXmGAz8FLJ/0vux42KMRF3
         nJwQUihpwktCKpB05p1Y/xwURK6UEBlLZ9oPapDLFfgts6MLA4DhtJ9zuLNhTZSNEBn/
         0hNAVO5oRD41SEpYYqWJpBFq/zc4aG91qR8BuZMRW82sgpINZvzKcgDz6hY5FddLB2fW
         VHNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zTTkw6DpezJcV9ta0hw/wRNRNKjGMDk4hmoteXF2Vxs=;
        b=a686gymIDZJOVgY88OY97KJm2blnD2SZSTfN+dhD/y3X71mdrdtVLi182bLTpw0AoG
         ZjkbOQ4jhiQXsppQynrFAKhzYqRcsUGnrEX43z0GeCKN5W2Pa1R9430rUGD+dUYveki7
         8bYQymyHU/CTl1kqgvABiv39W6snX5ZLZr20XEZRBi5LvDCTk7YFVdDP+3aXs6b3Kbux
         px2BmxAi1NfZkFP04TfGt6YvJLH6x5vPKZk9M4xOMoyao1TxcOzhv7Lc9wECyWy7oXae
         6bKqajfbQrV4um341JWpOrIA0U5p8b4JQNnAbwvq8tqB9RK2bskYyI/0Nfe7jHG21ANV
         DpdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="hvqFY9/8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u184si800013oig.162.2021.03.04.14.51.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 14:51:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="hvqFY9/8";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:37314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHwoj-0007s6-2s
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 17:51:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwO0-0007SI-PO; Thu, 04 Mar 2021 17:24:01 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNz-0002Za-D1; Thu, 04 Mar 2021 17:24:00 -0500
Received: by mail-wr1-x434.google.com with SMTP id b18so22907486wrn.6;
 Thu, 04 Mar 2021 14:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zTTkw6DpezJcV9ta0hw/wRNRNKjGMDk4hmoteXF2Vxs=;
 b=hvqFY9/8x2pQ3MdLFvz9iIu5R1VUd7sy7YKrg48MftwYJzQStGNpMagbf/ibcJtbsS
 XwMp3hHqRmtfVrMPBBQDd1vlpCwXpxjWamEvUSlS/G7NT4eCaEshL3K+OwE40c3588/m
 50TiCJYqL7y8Ez0+9t43ZY3RJpwiVrGzZ7u94im5FDNBfSmpjkGTH5KiQuIF5Yc6Z2Bc
 WsUOkX/KedqBhzkGeO2/xO1TKURwjQ6X91NvLNkZ0/WhdN5Ws1MQ3DmWzQVdQE6HPb0x
 OdYsOgznLGyHSDXvKBheVqDG15OBVEpabtX2QNTIBCPgXltANzN1n/5VYgNPLFdlMPQr
 hZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=zTTkw6DpezJcV9ta0hw/wRNRNKjGMDk4hmoteXF2Vxs=;
 b=NpAB2+MR4nGVogjCPU9nOdgQrFvTBRO0lBCjL6rWrt8fXMsjRHLHqI6zERNWSVf2ux
 tnZkq1s63wSs+E5YnxrPwX/Jpx7zY8r+6OTmwyB2cA8dFwScJeynW0WOUyvOUc35RRy9
 rPUHBSwFXk1cQBpE819IyxRwqf5sxFJQJckwvB0joe5tdrRbeuTC/wzqm8BxSZnHcT63
 PqgL1f9st7r+fvcVR7iJ910FRHDCfuURJZ8fHP4g9sKJEGa8JzwQOi13dhbvcvGtGk8r
 0Z64EnbZigRDJHXEqhS69yyG2QM9LgMyQaIHN4sXH80OYj4bT1TmPQQ6nfkqhAYkSQn9
 c/cw==
X-Gm-Message-State: AOAM532KYUNSZsK6exDlDPhDIEyZxYQNEMokgqHawOKSoDjR9Oyvnt7o
 5C3VtbMZFKElY2I239Ns0FmQiZgbMPY=
X-Received: by 2002:a5d:400f:: with SMTP id n15mr5930136wrp.89.1614896636541; 
 Thu, 04 Mar 2021 14:23:56 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j12sm1165596wrt.27.2021.03.04.14.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 14:23:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 6/8] cpu: Declare cpu_has_work() in 'sysemu/tcg.h'
Date: Thu,  4 Mar 2021 23:23:21 +0100
Message-Id: <20210304222323.1954755-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304222323.1954755-1-f4bug@amsat.org>
References: <20210304222323.1954755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FuqN129L8yWO

We can only check if a vCPU has work with TCG.
Move the cpu_has_work() prototype to "sysemu/tcg.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
RFC: could another accelerator do that?
     can we rename this tcg_vcpu_has_work()?
---
 include/hw/core/cpu.h | 16 ----------------
 include/sysemu/tcg.h  | 11 +++++++++++
 accel/tcg/cpu-exec.c  |  7 +++++++
 softmmu/cpus.c        |  1 +
 4 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 1376e496a3f..66109bcca35 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -670,22 +670,6 @@ CPUState *cpu_create(const char *typename);
  */
 const char *parse_cpu_option(const char *cpu_option);
 
-/**
- * cpu_has_work:
- * @cpu: The vCPU to check.
- *
- * Checks whether the CPU has work to do.
- *
- * Returns: %true if the CPU has work, %false otherwise.
- */
-static inline bool cpu_has_work(CPUState *cpu)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    g_assert(cc->has_work);
-    return cc->has_work(cpu);
-}
-
 /**
  * qemu_cpu_is_self:
  * @cpu: The vCPU to check against.
diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index c16c13c3c69..3d46b0a7a93 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -10,6 +10,7 @@
 
 #ifndef CONFIG_TCG
 #define tcg_enabled() 0
+#define cpu_has_work(cpu) false
 #else
 
 void tcg_exec_init(unsigned long tb_size, int splitwx);
@@ -26,6 +27,16 @@ extern bool tcg_allowed;
 extern bool mttcg_enabled;
 #define qemu_tcg_mttcg_enabled() (mttcg_enabled)
 
+/**
+ * cpu_has_work:
+ * @cpu: The vCPU to check.
+ *
+ * Checks whether the CPU has work to do.
+ *
+ * Returns: %true if the CPU has work, %false otherwise.
+ */
+bool cpu_has_work(CPUState *cpu);
+
 #endif /* CONFIG_TCG */
 
 #endif
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 7e67ade35b9..b9ce36e59e2 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -447,6 +447,13 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
     return tb;
 }
 
+bool cpu_has_work(CPUState *cpu)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    return cc->has_work(cpu);
+}
+
 static inline bool cpu_handle_halt(CPUState *cpu)
 {
     if (cpu->halted) {
diff --git a/softmmu/cpus.c b/softmmu/cpus.c
index a7ee431187a..548ab9236f1 100644
--- a/softmmu/cpus.c
+++ b/softmmu/cpus.c
@@ -42,6 +42,7 @@
 #include "sysemu/runstate.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/whpx.h"
+#include "sysemu/tcg.h"
 #include "hw/boards.h"
 #include "hw/hw.h"
 
-- 
2.26.2

