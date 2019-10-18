Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1234635wrm;
        Fri, 18 Oct 2019 10:56:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzqQMH9LTAYGkVe5aS5a0DFsd8aahAWI6TlKjUOjx25zLOmNMbA77VIJHFpPl80Pauf4FOT
X-Received: by 2002:a17:906:7094:: with SMTP id b20mr10082023ejk.134.1571421384363;
        Fri, 18 Oct 2019 10:56:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571421384; cv=none;
        d=google.com; s=arc-20160816;
        b=RTislwH1IUuLE3u0aP7WQQ8S9j1vmbzKoNLFr089qOerab+TwiF9o7EQhvZeHdOBND
         2aqqXOIG3TAhLK9D99O71y/vigU2TC6Ky17e0jW6ul/kIWD8TpYVyvKA5k8WcUML5sUD
         IrHR18BUI7zwHU26V7xeXzeFQDq5ZWoMVuMcuwSK3CXWhjJ0UblnFWRc3b99G4G8z32v
         tQV++zPqZGX70YmnmzdYRUedZXFUBLVhxHwHGYVX7Q2vVtqN3NDoS/HScEvQRLgWPn+b
         Rg+cF4ips1HP2uSFyFV8N9HoTo5k438LexapuoJmB4BD8+DGrGgfhLWO3DJTf4btJ2lO
         PPBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=X22okviioTNDt7zI04Hhn7/Ba9cdRHpUwnG0LrTV7qc=;
        b=fH01ttSiR3YH0ueKR+DvzBFJU7kELyVSoMjThmHyQEWyqMGHoRuC0oJzWD049W9NJ5
         FcU02yQxb5d8if21vrDNM5PKxIjaHuATwaOn2FoDakaSjpRvrJk3ZjR3ZHgY6QiZPTGZ
         EC4Nxy6ZhgizMJUcdWT+CveE74Nb5ZY9IZ0K0HNN6xDv7/tt0EUBG23xwTNzzzcszFnK
         rvygeTnOor66XxYRZeGZ/a8kQ/JrnIivqcjeyp8qpK6GTIP6maJwr2eFEWB56Mtld2dH
         e8eHS7Gi0SFn9/R4IW2yCVs3H0uOjnTWy+JN+Mh+kLCSirfR9j66DOMX+sC278LKqt4V
         5dHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uvo+O8B5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qh16si3850157ejb.349.2019.10.18.10.56.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 10:56:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Uvo+O8B5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLWUA-0002sb-Tl
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 13:56:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59539)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJB-0006vn-FY
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:45:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLWJA-0005fs-8N
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:45:01 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45363)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLWJA-0005fH-2k
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 13:45:00 -0400
Received: by mail-pf1-x444.google.com with SMTP id y72so4303630pfb.12
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 10:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=X22okviioTNDt7zI04Hhn7/Ba9cdRHpUwnG0LrTV7qc=;
 b=Uvo+O8B5nhB1hCuO8tXl8IgS+fjESYIng+bYLuPYt0ykIXNCI9m9GMcqDYYKDAKUKA
 B7NgaY+lnBS5CbCpqcZccKMYBn9koqvBa6866Y8ApTyAAH+4mUVRGAKNhEwRrnUmE5Sg
 GcoVkm338NIhcWuUElXc2hMzpc0a73HGAdUeC55c7a0KTnUWQFFeoVD2Z6z/U8mq70Q8
 meuefAnx0EK/BAeNBVRQDbWW2m0g+J3ZMpQZ59xkw+IcR66NyyykpZoM+gXWKxIjbUa7
 YZSxTyooCpviez/XFSKbT+Gej1f2p8N6ODFg1jmHiLx5sJGGGWtn4zz81uP1FoLWuh7D
 cMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=X22okviioTNDt7zI04Hhn7/Ba9cdRHpUwnG0LrTV7qc=;
 b=SvU01fksXbMLclv8ygKTSMifRN3orj+qxX4x0UpGbtUskEuLqLvKACjH/Tlyc59w+6
 K7Y5TZM5MaOkGGR1QAK8+uA/uHh3+0te29OsYhDOFyShBckTYtXigSczcxpz4LtrY5rN
 OLqPYsKYIWsSmcGwvP2b+tqw0m+8gSubTSWhMOMb3w05/44+Qf8yeBAUvtxKMCHxgESe
 rPV/LJrc4byDiM5NC8amZEtM9MbAPTMkcFoG835YOb+BUAm3ibINTLYXgnv1tpu3vxs/
 2zes2loyO737Tj79dUn4qRiII8yZsIlpNsklQxTQwFadD6Ka9GcTTckJ7EgE53t6kzoO
 m91Q==
X-Gm-Message-State: APjAAAXpP8Ev5Klx2jcduPgR4j6t40C+PQ1MeKe0o/iSGgsYty1JaUo+
 maGgXlUgmSIvPA4ogpdcAweWJ1e2I0M=
X-Received: by 2002:a17:90a:f311:: with SMTP id
 ca17mr12070981pjb.112.1571420699116; 
 Fri, 18 Oct 2019 10:44:59 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id d20sm7857534pfq.88.2019.10.18.10.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 10:44:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 21/22] target/arm: Rebuild hflags for M-profile NVIC
Date: Fri, 18 Oct 2019 10:44:30 -0700
Message-Id: <20191018174431.1784-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191018174431.1784-1-richard.henderson@linaro.org>
References: <20191018174431.1784-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OP49MDV1Iky9

Continue setting, but not relying upon, env->hflags.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/armv7m_nvic.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 8e93e51e81..e8c74f9eba 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2251,7 +2251,7 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
             }
         }
         nvic_irq_update(s);
-        return MEMTX_OK;
+        goto exit_ok;
     case 0x200 ... 0x23f: /* NVIC Set pend */
         /* the special logic in armv7m_nvic_set_pending()
          * is not needed since IRQs are never escalated
@@ -2269,9 +2269,9 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
             }
         }
         nvic_irq_update(s);
-        return MEMTX_OK;
+        goto exit_ok;
     case 0x300 ... 0x33f: /* NVIC Active */
-        return MEMTX_OK; /* R/O */
+        goto exit_ok; /* R/O */
     case 0x400 ... 0x5ef: /* NVIC Priority */
         startvec = (offset - 0x400) + NVIC_FIRST_IRQ; /* vector # */
 
@@ -2281,10 +2281,10 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
             }
         }
         nvic_irq_update(s);
-        return MEMTX_OK;
+        goto exit_ok;
     case 0xd18 ... 0xd1b: /* System Handler Priority (SHPR1) */
         if (!arm_feature(&s->cpu->env, ARM_FEATURE_M_MAIN)) {
-            return MEMTX_OK;
+            goto exit_ok;
         }
         /* fall through */
     case 0xd1c ... 0xd23: /* System Handler Priority (SHPR2, SHPR3) */
@@ -2299,10 +2299,10 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
             set_prio(s, hdlidx, sbank, newprio);
         }
         nvic_irq_update(s);
-        return MEMTX_OK;
+        goto exit_ok;
     case 0xd28 ... 0xd2b: /* Configurable Fault Status (CFSR) */
         if (!arm_feature(&s->cpu->env, ARM_FEATURE_M_MAIN)) {
-            return MEMTX_OK;
+            goto exit_ok;
         }
         /* All bits are W1C, so construct 32 bit value with 0s in
          * the parts not written by the access size
@@ -2322,15 +2322,19 @@ static MemTxResult nvic_sysreg_write(void *opaque, hwaddr addr,
              */
             s->cpu->env.v7m.cfsr[M_REG_NS] &= ~(value & R_V7M_CFSR_BFSR_MASK);
         }
-        return MEMTX_OK;
+        goto exit_ok;
     }
     if (size == 4) {
         nvic_writel(s, offset, value, attrs);
-        return MEMTX_OK;
+        goto exit_ok;
     }
     qemu_log_mask(LOG_GUEST_ERROR,
                   "NVIC: Bad write of size %d at offset 0x%x\n", size, offset);
     /* This is UNPREDICTABLE; treat as RAZ/WI */
+
+ exit_ok:
+    /* Ensure any changes made are reflected in the cached hflags.  */
+    arm_rebuild_hflags(&s->cpu->env);
     return MEMTX_OK;
 }
 
-- 
2.17.1

