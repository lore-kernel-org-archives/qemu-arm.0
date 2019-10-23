Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1043862wrq;
        Wed, 23 Oct 2019 08:31:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyrbc6zicOxhEVaOBCYI5IP+WfTeMt4Gd4Kd752W8Qrz8ZtWMaNGt+lGeKEObAqp8DxZgp0
X-Received: by 2002:a17:906:5601:: with SMTP id f1mr6187573ejq.151.1571844683013;
        Wed, 23 Oct 2019 08:31:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571844683; cv=none;
        d=google.com; s=arc-20160816;
        b=cQWr+bdkQGnLMcJqqYM+W/+1vtIB3D2c2iHOoj69l9Mkqn5hEHH8U07xBXDHshE+Rw
         58matmj5l5rfYfsVZbR+b3P0QtVMhmulT7+P/5/i0Hovwkw8tJJE4EEH2fYSk6/GXJm/
         JdwN2Umo9QK2ybvz1BAhkRaI/uW/P2CQJzoKeQQSw2UKfydNV0JifO51pjhNc3WHzSzT
         z7Fj+wiCmVnS5sYaTrbNpA8sACKVaIwN6mPUZWsIPYuYMBywrN4CyV5BmxlxsNA7LStp
         RopHEY1Ga75qsaN8/+wcsSEQVrsGPzcDmVnlxz1mbV0swHix7BvnVMaG8Z1yjFGwGqEL
         dofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=X22okviioTNDt7zI04Hhn7/Ba9cdRHpUwnG0LrTV7qc=;
        b=aL2fEXWgWCGmqHFCg3ytqasU2tdH1RjOO8ojlcJsAQ5BYgsvgU8L50Q58oB0EWw2bM
         AVWi80kDLYGeTIJSf0YBwTfUc2je2fo7hENzTb6Ppi9I+3vMttJHJOcUDfuWfI+iKqRL
         afOo4zHOVgmqWgiGAz3i+YTyUnyOqCtkPrbNCE/Nyi3qL6Y1X0tTaaoH1Dy9r+veQvSn
         5AK5NbhcIqYkOZSqa0O0CnmWHoRPbpR/aczhl/XM6VwozXMVuP99fPBLgQq1FkumBjvs
         fjTs97BaTvOL0oFmeXwEM25skoKi11caA6YN65iEvimmtRFQt+jUe4L4k+ABKYF/5too
         ADzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W7hUYkvB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d28si5921231edb.10.2019.10.23.08.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 08:31:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W7hUYkvB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNIbZ-0008EB-A6
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 11:31:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35350)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8w-0008Do-0S
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iNI8s-0001II-9w
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:45 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:42090)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iNI8r-0001Am-Um
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 11:01:42 -0400
Received: by mail-qt1-x844.google.com with SMTP id w14so32712824qto.9
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 08:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=X22okviioTNDt7zI04Hhn7/Ba9cdRHpUwnG0LrTV7qc=;
 b=W7hUYkvBV4U84FkGgu5j4qdKyHLytPYVaAmgc1TcoF7kDY+hBgJktlSMHu+sOn8g8v
 6j2aDHaY00/K32dfJPL8WYfJtG4JCQ3olPYZFb+7LrS6dlWB7SXkMRgIHCj9mebasoL3
 nvSC2yN9Lsu+cyPMophx5upiL8QYj2jR0y9R7/xk49LkWcVJv0UDchl71MIj74mUk2HL
 GJVCqsBeYj4ytI5c8gMrf2CcO6NkTvHJ6e+eNrQq7m03xCHMOs1/5RVkH8YzxB07hI3i
 UFQSIbaqNeJALnezQuP1x8/VT1Xv51oTQswEnCSpxJScLmL+00Ykn81brw/Z821lJMKZ
 Ftyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=X22okviioTNDt7zI04Hhn7/Ba9cdRHpUwnG0LrTV7qc=;
 b=abVFEjmJUx+APCQIptsHuZqAm3FUrzKYg2McmnEXYcXblRE3KyYiN/ykHJS2YVK/88
 ej96OGIR8HIsCN49txhlYCpG2UajzfWFEYbgcFIuCxmg2daq+rWjLMtvjlqV5A49jbPN
 VxYHjhUle1UvRl0gO64g8Ess2TrdtWod87yR7XfaGSxdP9vQ0SMqQRgpid7LqNxdBALG
 AUk3naaOYZhLriJTLOvq1ls1Z2tRJLiZ/SGTxFGpSdHn8y6mVCcDu1rbWKSmZKIUKdvc
 LrPi/oNmW2yCW5pKDr4WH6RKWuML32+OTqFZGUCulVp9swtPyGXj4gtngqPCdYLzjGe4
 b01w==
X-Gm-Message-State: APjAAAUoUqzdYR2+NfxWrM6SFJP/2LvP7Py76kdAYqd+MZZgkfuhz16C
 HkNgukpYeHJ1DRwNhLzHL4Wpce5mKkA=
X-Received: by 2002:ac8:1194:: with SMTP id d20mr9752190qtj.275.1571842890760; 
 Wed, 23 Oct 2019 08:01:30 -0700 (PDT)
Received: from localhost.localdomain (198-4-20-64.static.cosmoweb.net.
 [64.20.4.198])
 by smtp.gmail.com with ESMTPSA id l189sm11030168qke.69.2019.10.23.08.01.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 08:01:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 21/24] target/arm: Rebuild hflags for M-profile NVIC
Date: Wed, 23 Oct 2019 11:00:54 -0400
Message-Id: <20191023150057.25731-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191023150057.25731-1-richard.henderson@linaro.org>
References: <20191023150057.25731-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
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
X-TUID: /UdsoWjbM4wL

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

