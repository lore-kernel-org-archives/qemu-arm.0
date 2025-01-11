Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp896559njn;
        Sat, 11 Jan 2025 10:38:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVzpAC2sX/8ZFaY3rIjaBfjxqBXcA6wiZ1cUWb6LtOqe/eJnSYr2osTI1wRf9R5l7D4960XVAyLokMzMw==@linaro.org
X-Google-Smtp-Source: AGHT+IHMoMgWPcSOumgS1AxYd4MsJXo7bTAWRw3uCctxlUrf4VQnpV40xE+LLlOxoj5i41fymDvF
X-Received: by 2002:ad4:5d61:0:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6df9b28c6aemr244488496d6.34.1736620722576;
        Sat, 11 Jan 2025 10:38:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736620722; cv=none;
        d=google.com; s=arc-20240605;
        b=VlfUXVYozkx95LujK6LYfGZeR60SsnGsrFg4yjqapZxy43CQ1S4d4gh1sg++ADPB6L
         fYfhZOFUaeYS+wFulyjKNXNjLvIToQQdThiq2T+LJ6STF4jaR5xAKiTo9CaGrCUD8b8p
         wKO7uwKOhP1zEEEkACQHsQLhIP904BzQaC4+5+78vYAm/lls+3z/N3MkiFjnR0bWptoN
         Ob64jl+S1cfx+YzhDYofY4ngUAZ69ItXnCVODqwsClJMNhggzOj+LcHPgWM/V3QnGrxs
         LXJYmY8b7nPFcY6AGKHhtQLUv4LnNbqtX2v9w9Oeb72OPRuqjWGMaibF2o3/O7Svs1A+
         h4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7xvmtujobjZispI604dErPVBv97hCzWiTfq+q42+nT0=;
        fh=9iDHpQw/0ob9M7ElsgSYjxhYKU752+T/80D955YrGDk=;
        b=ebEdpOmOQtsu8Mch3DlTd1LSY5UvPRz9MMhia4H2sFUz0y4b/ybDOdX84yZ9uupQhv
         clO+3hLa8Ry4O+nt0uxyr6vcVFs5JkC2n9uS6g0dPVI32HqV4YH09VLQVd6IEUJMBkXk
         zyn/+jn6FWRwpCYl3MG3gN9Rh9gVTcF5exlxNT9KNYWPMeb0YHgEOFX++x/vwhw3Z6Md
         bF08kzHkbd4YdKyhhG9R2a1BCK3/VdddW6YQRVpA1c8aiC3JBOGV2qsuNTLfHYKOqO15
         KKZx+vvmfpBir+uNzm3GRjPdquF4r7ki3Nc6A6r7L4uw8Ob68KySQGIpx4pYZ4TTZPTY
         iLAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=dgngqmYc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfae02b418si48990066d6.494.2025.01.11.10.38.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 11 Jan 2025 10:38:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=dgngqmYc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWgMh-0007JZ-Ds; Sat, 11 Jan 2025 13:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tWgMe-0007GW-VY; Sat, 11 Jan 2025 13:37:40 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tWgMd-0003xs-CM; Sat, 11 Jan 2025 13:37:40 -0500
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5d3d479b1e6so4131132a12.2; 
 Sat, 11 Jan 2025 10:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736620656; x=1737225456; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xvmtujobjZispI604dErPVBv97hCzWiTfq+q42+nT0=;
 b=dgngqmYcYtRgMM9REUGVUxRC6NY1mCs1Nn3fNEyM4PUz5YxLphS4HSpNfzxRzRbGV0
 Pof7G5ClzD/fgOHywQehXsm59xDuV+aGTYc74JLS/vrfa/h6b0+HNAqrk8BvhrfGsObb
 gjyhp95XmUvAG/C7gahfo0Db23teAaXjd+S0fY/ddGpxxLlp28HQ4ie7XBDKKrriqM15
 sxG1GVpjCg/J2vitOkXs2TyQ0yVOhrEBPaBfesSLqUp67lYTo6SIuRjR+ISeUTZ5lTZ1
 YTaGCzTYqsHN6pmQg4RePEx9gyBwLcjgh0wC8YEY6hyYr/3yF/mRk2ZaSltgYiemBjaX
 sRUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736620656; x=1737225456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7xvmtujobjZispI604dErPVBv97hCzWiTfq+q42+nT0=;
 b=td/gUojvgFoKwQoW/URj14lTNxsTHgN4KAIJSsDfDHkOfVSxg7B5DHI2mXAMfkHTAj
 U024oyK6BtFvaQjSqguWmKIBzs4r/HbxTe4L295h+LaGyYpA/WVW+gfTkfrTXUQYS7Ci
 8Xl3UTYtKRAEridDvyxqTM/1JylputMEjCwLKL74L41uz1xPAZjDFAGczEbr4SzXeLy9
 qncc1XHw9JBCM/TTldCxq5cL8fg5zU/MWni7PVv16d1NGtbNTrYikA4CiNu1M+G8AQhh
 RhhvpOprwZK8Jt/zgPCajrnatsl4IJNvA0O+m5LmrUYY2HSnFLZHUQhB+AiXEoBy27HP
 gXMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaQTZSPLc5/uIEyMWmeFYlPIdLw6gpL11ScadtFazWWihdLOn11g0sMrww9aFB2P0vOc/G/JOFz8QNXg==@nongnu.org,
 AJvYcCWNLQ6hAmIvwOQMiHx6xYuvuFcV113+TzL6eKsX/ohw7JWYmVmjehSPog1H9FoDNBCQHSJL2sG1ZQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx7ZI4W9eCRcgJ4G9MEp66sR98zGZ6fE6rAY1sV4wfqPv+0GIWv
 F83ezgTO/mu2nuFhK2idIyXezoXHbgEQ99+xGdBeMx8/FXpDFHzMoOuyVw==
X-Gm-Gg: ASbGnctW8T1PB+UoJhHdXFIP70nnQLIx1OUoLvhkEeaeNgsphknlwZUVg/eVbtGsOv6
 LO5GrpFNaKSXh9XAfezW+OhTrOloIev1zlLKqkFu3esidSn9nXSEVczS5YIIxHfsiyxn3Gr0fdJ
 +PCL4fufeV9D2qdgSJcrKAk38wXNtF8GpbThOgwCRdo8oFm9a8PQ/MGyOsaSr6UYxe1Co424fRh
 xiAT+LvxCeS1aitoTpL9HrEj4dYqKQTnJbe+gB3MMOhqmTBxMNwBjLS3zSaXR1EQvtjOmzz9urY
 dO9xRqbWcHd1CYgDw7yYg0faONyyIsLdC5ztFoKodXw=
X-Received: by 2002:a05:6402:5109:b0:5d0:cfad:f71 with SMTP id
 4fb4d7f45d1cf-5d972e7110amr32181787a12.32.1736620656035; 
 Sat, 11 Jan 2025 10:37:36 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-078-054-101-099.78.54.pool.telefonica.de. [78.54.101.99])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab2c95af187sm299026666b.142.2025.01.11.10.37.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:37:34 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-block@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 12/13] hw/misc/imx6_src: Convert DPRINTF() to trace events
Date: Sat, 11 Jan 2025 19:37:10 +0100
Message-ID: <20250111183711.2338-13-shentey@gmail.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250111183711.2338-1-shentey@gmail.com>
References: <20250111183711.2338-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-TUID: fqC3DWEodsWp

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/misc/imx6_src.c   | 23 +++++------------------
 hw/misc/trace-events |  6 ++++++
 2 files changed, 11 insertions(+), 18 deletions(-)

diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index dc6a2b92ba..06cc46292e 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -17,18 +17,7 @@
 #include "qemu/module.h"
 #include "target/arm/arm-powerctl.h"
 #include "hw/core/cpu.h"
-
-#ifndef DEBUG_IMX6_SRC
-#define DEBUG_IMX6_SRC 0
-#endif
-
-#define DPRINTF(fmt, args...) \
-    do { \
-        if (DEBUG_IMX6_SRC) { \
-            fprintf(stderr, "[%s]%s: " fmt , TYPE_IMX6_SRC, \
-                                             __func__, ##args); \
-        } \
-    } while (0)
+#include "trace.h"
 
 static const char *imx6_src_reg_name(uint32_t reg)
 {
@@ -87,7 +76,7 @@ static void imx6_src_reset(DeviceState *dev)
 {
     IMX6SRCState *s = IMX6_SRC(dev);
 
-    DPRINTF("\n");
+    trace_imx6_src_reset();
 
     memset(s->regs, 0, sizeof(s->regs));
 
@@ -111,7 +100,7 @@ static uint64_t imx6_src_read(void *opaque, hwaddr offset, unsigned size)
 
     }
 
-    DPRINTF("reg[%s] => 0x%" PRIx32 "\n", imx6_src_reg_name(index), value);
+    trace_imx6_src_read(imx6_src_reg_name(index), value);
 
     return value;
 }
@@ -134,8 +123,7 @@ static void imx6_clear_reset_bit(CPUState *cpu, run_on_cpu_data data)
     assert(bql_locked());
 
     s->regs[SRC_SCR] = deposit32(s->regs[SRC_SCR], ri->reset_bit, 1, 0);
-    DPRINTF("reg[%s] <= 0x%" PRIx32 "\n",
-            imx6_src_reg_name(SRC_SCR), s->regs[SRC_SCR]);
+    trace_imx6_clear_reset_bit(imx6_src_reg_name(SRC_SCR), s->regs[SRC_SCR]);
 
     g_free(ri);
 }
@@ -173,8 +161,7 @@ static void imx6_src_write(void *opaque, hwaddr offset, uint64_t value,
         return;
     }
 
-    DPRINTF("reg[%s] <= 0x%" PRIx32 "\n", imx6_src_reg_name(index),
-            (uint32_t)current_value);
+    trace_imx6_src_write(imx6_src_reg_name(index), value);
 
     change_mask = s->regs[index] ^ (uint32_t)current_value;
 
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 0f5d2b5666..cf1abe6928 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -253,6 +253,12 @@ ccm_clock_freq(uint32_t clock, uint32_t freq) "(Clock = %d) = %d"
 ccm_read_reg(const char *reg_name, uint32_t value) "reg[%s] <= 0x%" PRIx32
 ccm_write_reg(const char *reg_name, uint32_t value) "reg[%s] => 0x%" PRIx32
 
+# imx6_src.c
+imx6_src_read(const char *reg_name, uint32_t value) "reg[%s] => 0x%" PRIx32
+imx6_src_write(const char *reg_name, uint64_t value) "reg[%s] <= 0x%" PRIx64
+imx6_clear_reset_bit(const char *reg_name, uint32_t value) "reg[%s] <= 0x%" PRIx32
+imx6_src_reset(void) ""
+
 # imx7_src.c
 imx7_src_read(const char *reg_name, uint32_t value) "reg[%s] => 0x%" PRIx32
 imx7_src_write(const char *reg_name, uint32_t value) "reg[%s] <= 0x%" PRIx32
-- 
2.48.0

