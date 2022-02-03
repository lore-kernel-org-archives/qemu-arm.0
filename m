Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1938632lfk;
        Thu, 3 Feb 2022 07:53:08 -0800 (PST)
X-Received: by 2002:a5d:408e:: with SMTP id o14mr29431012wrp.83.1643903588586;
        Thu, 03 Feb 2022 07:53:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643903588; cv=none;
        d=google.com; s=arc-20160816;
        b=fKvV+ux0DYxF/d32GJaUBQkxa3/wibALFMN4fK5BGtKipc1CK/dgXqoKUuge0pSauD
         M5xQlr+0fjiJgoMD2IFL2VaOKjDGVRXXlQgGjGohjzPEZpdc9QisFHcVa6rxaujUT1hl
         8DVOHDck81Oj3VGnz2Fd1ymAp5el68T3sFz0+S2exBBclawWQICCJ9qRBA/nb+0CnCdP
         kcOx7douy6hHW/Apte86WMgdl+M7VhGB7Hl3qZZxdwvtGqtYuU2zpdMXpLF1EbKTwJAL
         eZvPYWrJIhaV75U7GkCb0IjOqt3sDpIgekUf6uTaRmEtB5iWrhnbPauJbuZJVny1Uaut
         LNSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:from:subject:mime-version:message-id:date:dkim-signature;
        bh=hlcPZ7SXucwFodQrQPiBEc/tDIQ/hkwYn0I0gTD1PIQ=;
        b=MbBFWzWrBH7zvOBr4vHbdwioyJ9Vl6Bb6fjcMW3eTHSLuQrGaLpBq/+0lHWFGTOoia
         AOjFzJALhxuvLEPFQX32IyH5YAmN7AJJt72YOgdZmvNfoX8Gt9xN6hid2Io7U0TvLVUP
         rVDiRM6HeimLwSJUy4pTEM+W7puIyAVMssnIma+ZxLl6DPwefAQGMAWyLCiHtqdfbuxe
         xzbBMtgRpJyfezVhbyTB3Tyk6ebUlwrg3Ue2WzgGwGn0h57Mcsr4xxwNC+eRoEWbxgY0
         32G9zO5ZbqbWp439lgds5Xit1Z8dkMHLRLohlR0LVXBEmEPKd4t1FaDchGKWtZshk7Qu
         riuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=oEjqBRJw;
       spf=pass (google.com: domain of 3zpr7yq0kc18s7ibkqfkdefq7dlldib.9lj7ibu.8bkkbbifk7ol.lod@flex--valentinghita.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ZPr7YQ0KC18S7IBKQFKDEFQ7DLLDIB.9LJ7IBU.8BKKBBIFK7OL.LOD@flex--valentinghita.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <3ZPr7YQ0KC18S7IBKQFKDEFQ7DLLDIB.9LJ7IBU.8BKKBBIFK7OL.LOD@flex--valentinghita.bounces.google.com>
Received: from mail-sor-f73.google.com (mail-sor-f73.google.com. [209.85.220.73])
        by mx.google.com with SMTPS id w15sor4602238wrn.61.2022.02.03.07.53.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 03 Feb 2022 07:53:08 -0800 (PST)
Received-SPF: pass (google.com: domain of 3zpr7yq0kc18s7ibkqfkdefq7dlldib.9lj7ibu.8bkkbbifk7ol.lod@flex--valentinghita.bounces.google.com designates 209.85.220.73 as permitted sender) client-ip=209.85.220.73;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=oEjqBRJw;
       spf=pass (google.com: domain of 3zpr7yq0kc18s7ibkqfkdefq7dlldib.9lj7ibu.8bkkbbifk7ol.lod@flex--valentinghita.bounces.google.com designates 209.85.220.73 as permitted sender) smtp.mailfrom=3ZPr7YQ0KC18S7IBKQFKDEFQ7DLLDIB.9LJ7IBU.8BKKBBIFK7OL.LOD@flex--valentinghita.bounces.google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=hlcPZ7SXucwFodQrQPiBEc/tDIQ/hkwYn0I0gTD1PIQ=;
        b=oEjqBRJwGyXfTp9iotik1mjTnMok/fF9l6jRzBcU8Z3w223U3PDy5qMJtowJ9WL6qS
         /kIhrC78pKmYzC0c9vhxoe8yHNd7u2r2dyrGOq4F+LeqhnENfg9nZdJA1QXx8nAxYZAi
         O4IpU/Exs4jyWL+yuq7fOhemGx8j5ynLsVI7lvhKuDEAu9NJE8X3ldoJ7sOoFlo55C7v
         tLGHhvzQ+oazdhrVXX0FmDGelkU2LxkR6FSP5Itp+TG7JlxPycmwg44wameoUA/IhYqg
         Q1COFjpjsua43pViPzT4Tx4dJULBV33cSZNStalXWf+aLYLWRgENHEfDiKeX49wpEOTd
         d6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=hlcPZ7SXucwFodQrQPiBEc/tDIQ/hkwYn0I0gTD1PIQ=;
        b=pMx1hBi3M5ZAiLQ+DR7eQEUXDpiyGRqcteqGuurj2q8gZKNidcWjAVadozgCufy8iX
         2m1suJBGAgj/GGPnibxVdbIq8ZXYrDa45jvkad9mzYOJx0a9/8T65qplmtaxGcPpOPtr
         pPARXNG52oAIxvPcMBGh+Tqv6w0mu3i+XlIZ0GoyWVSz4oYzNTrRw7/RC1c9sUnm6Kpa
         3t4tuyfUTMQG5qgpOUrohFbHkJYRN0C6vd7QgapwC+MojxfcYjRCPgzDIcOwREt6+r9k
         5/yWCBMwj7M3s+SyIaXsvyng5kxUzKRF0Pq+TKPHfS5L0iAxqarmyJm9Sjj8iSyRs4Oc
         RS6w==
X-Gm-Message-State: AOAM530jBlNjXzMOlW1uRVCauMXfV06XSCApNC9A5pX7+WLslej+0tFS
	+MVXJFKtGZ3rZWO7rSCGMCMCLuIQASS6qIRih6fA
X-Google-Smtp-Source: ABdhPJy/8G0GGD8SdbKSSTr86yO5UgCSa1yuHHjpxn14FvbxgdON/Z+RQU8pAd5fRy4onh/GhsEfbMjuoD2gtPc/GSqq
X-Received: from valentinghita.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:1906])
 (user=valentinghita job=sendgmr) by 2002:a05:6000:1564:: with SMTP id
 4mr24557965wrz.56.1643903588017; Thu, 03 Feb 2022 07:53:08 -0800 (PST)
Date: Thu,  3 Feb 2022 15:53:04 +0000
Message-Id: <20220203155304.2648009-1-valentinghita@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
Subject: [PATCH] armv7m_nvic: set DHCSR.DEBUGEN when debugger is attached
From: Valentin Ghita <valentinghita@google.com>
To: qemu-devel@nongnu.org
Cc: "=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <f4bug@amsat.org>, Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
	Valentin Ghita <valentinghita@google.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: wch/oop85FK1

The DEBUGEN bit is set by the debugger when it is connected to the
core.  Software can use this bit to check if a debug session is active.

Add a function in gdbstub to check if the debugger is attached to a CPU
and use this information when the DHCSR register is read in armv7m_nvic.

Signed-off-by: Valentin Ghita <valentinghita@google.com>
---
 gdbstub.c              | 10 ++++++++++
 hw/intc/armv7m_nvic.c  |  4 ++++
 include/exec/gdbstub.h |  6 ++++++
 3 files changed, 20 insertions(+)

diff --git a/gdbstub.c b/gdbstub.c
index 3c14c6a038..d4e39db8e7 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -3585,6 +3585,16 @@ int gdbserver_start(const char *device)
     return 0;
 }
 
+bool gdb_attached(CPUState *cpu)
+{
+    GDBProcess *process = gdb_get_cpu_process(cpu);
+    if (process != NULL) {
+        return process->attached;
+    }
+
+    return false;
+}
+
 static void register_types(void)
 {
     type_register_static(&char_gdb_type_info);
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 13df002ce4..d6fff94bca 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -21,6 +21,7 @@
 #include "sysemu/runstate.h"
 #include "target/arm/cpu.h"
 #include "exec/exec-all.h"
+#include "exec/gdbstub.h"
 #include "exec/memop.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
@@ -1510,6 +1511,9 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
         }
         /* We provide minimal-RAS only: RFSR is RAZ/WI */
         return 0;
+    case 0xdf0: /* DHCSR */
+        /* Bit 0: DEBUGEN. */
+        return gdb_attached(CPU(cpu)) ? 1 : 0;
     case 0xf34: /* FPCCR */
         if (!cpu_isar_feature(aa32_vfp_simd, cpu)) {
             return 0;
diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
index a024a0350d..383f4e5224 100644
--- a/include/exec/gdbstub.h
+++ b/include/exec/gdbstub.h
@@ -177,6 +177,12 @@ static inline uint8_t * gdb_get_reg_ptr(GByteArray *buf, int len)
  */
 int gdbserver_start(const char *port_or_device);
 
+/**
+ * gdb_attached: check if GDB is attached to a given CPU.
+ * @cpu: the CPU to check if GDB is attached to.
+ */
+bool gdb_attached(CPUState *cpu);
+
 /**
  * gdb_has_xml:
  * This is an ugly hack to cope with both new and old gdb.
-- 
2.35.0.263.gb82422642f-goog
