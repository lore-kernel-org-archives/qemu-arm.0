Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6636423lfg;
        Thu, 4 Mar 2021 14:33:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzf5Gd0SRkL9CrVx7J8glQ07r5+5B9dRPQRHKdY0EY95RfhW7HpF6WQEEs8TX8615EcKF3S
X-Received: by 2002:a4a:e058:: with SMTP id v24mr5189724oos.83.1614897208729;
        Thu, 04 Mar 2021 14:33:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614897208; cv=none;
        d=google.com; s=arc-20160816;
        b=NNKLWm8E04OibDa8fKGCOy+xvhg4uEGfUsOhMD0IzdE3dBMYkmVTLbMZC8/7vJPUNc
         /LC/3oR2E1Xs10CZb1Da4ARKqW5ITePwiqmfAiqH+TxPUVZDxKvYiSF5oKZVPsM2HRXi
         C3FsiuwdEjxAtIYSmWGzU4Pd8yi8UcFXmoSnZ3TaMFFMmGKppNuUqGzdCRwPhFUfPgeY
         uzx23DMs86W7cshhwverISwPw/4YRp88kqNJl3xeJ11nL53A1gSvDiPNd0gdT9LeHwnf
         kgif+Os1thCYebNYKz3E4y5WC+mFuTr8MWGCdRQXJ5+KqHZAj+lTjl5+tUb0gn601dir
         RqQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OUZUt6DUDETGfeYoWkRPY1ImgFxPl3GPkcbxoc9krNo=;
        b=gFzzY53PJfLIS9h+aVRnfQMt353Ochb25kayhHXsDDTp9KqPGcgTCksOd4zVV3bL0z
         e1a1u9bL8FRneIS3ma5UUcvUL/2EOLG621/M2HQcvjw8F/mc24V5V/gP9kvJJwiHpt2I
         fP2P9Jclu8CL817UgzVEe3aSRG5b91W099fSlJoJ6dVTLmAaNx+XGNEkCFNYBaCFPq7C
         jJRkgBjoWTqg2N+jKVoaA/lxq3oaWEX1h2bwC6mGft5UJMGpnpwfVZytp9tR9V83Qq1d
         Hl0on3Qbps1NTCO68t4oFxU9THYfMN1BHSeXM+6Ke8ISN5tz0OZJv/JNBQJ3NrJqHwxb
         WEXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UWQyP0l8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p185si784232oib.100.2021.03.04.14.33.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 14:33:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UWQyP0l8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHwX9-0002Eg-Ua
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 17:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNh-0006mN-5B; Thu, 04 Mar 2021 17:23:41 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:54722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNf-0002Qs-GD; Thu, 04 Mar 2021 17:23:40 -0500
Received: by mail-wm1-x335.google.com with SMTP id u187so9370354wmg.4;
 Thu, 04 Mar 2021 14:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OUZUt6DUDETGfeYoWkRPY1ImgFxPl3GPkcbxoc9krNo=;
 b=UWQyP0l8uyZKNzmMYvUOIW1n9rnYeebf87oLY66bGNcJPc/WT9d+sCaWgS5LOEasCZ
 KCQZLazOPSW9RjHHtS8Nnuq4iUGbzC2rSjtt1hRvs9xdL4RvNLN4+kQtbjABSCugpnoO
 TSnqXY3R26ztLy+AG3I9AJzYoD2HEhJsphdG6OhnVAp2Xlj4GE3h9Mi7x6VsZXoLyQ6z
 76lZEtmKUvnt673nEJGgiFYHerS5bq+9vt5Hk9FOK+P4pfYwdGUIoBbgAkstYXmnQ8w1
 6JF9AvG/e5MoSDh+q0MF8+tJ5R33fwIdskaXZ+P3Ha4oKozJ9M0+/SLav6vd9xCP/7IO
 CdJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OUZUt6DUDETGfeYoWkRPY1ImgFxPl3GPkcbxoc9krNo=;
 b=GVKflYSjLbp+pyQ3t1NMl1MnDvWlIZIEBLNnIr/6L9JD8a7lX9AoEwkSzI+scEwp/+
 gknN0hGeUkdpMGiuKGmR8tMY7Ct/pc47ju57lTRDCMa7hKYXXPmQTPkPa9G2ksZYnnto
 5/dIS5Q8DHaqCHi2A5fYSKRMoPYAJOxvwdJN1+YKltOHcrKd0av8U6c1h5HNCbqWdLAM
 2zYgsMnT/7DlKtQr8gjrOdRJ1nmnkJ7f0FS3s/YRS5kxz9jtx0xP+BFxN2gvAggNvgEe
 avHT/02FBTDR0pA9dJlw84eVo3A60nieyhCLED71hVh16KygWwC+Ub+YOZj3A/0jEvz9
 wxcg==
X-Gm-Message-State: AOAM531WonKrkms0CIevjycthj7YHyZHByphyGFOK9/CctaUYzrk5Wed
 nkGFSaSpY9r4dzjUbmfXTGpjZK53BQE=
X-Received: by 2002:a05:600c:4ba2:: with SMTP id
 e34mr5923244wmp.121.1614896616354; 
 Thu, 04 Mar 2021 14:23:36 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id d13sm1058581wro.23.2021.03.04.14.23.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 14:23:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 2/8] sysemu/tcg: Restrict qemu_tcg_mttcg_enabled() to
 TCG
Date: Thu,  4 Mar 2021 23:23:17 +0100
Message-Id: <20210304222323.1954755-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304222323.1954755-1-f4bug@amsat.org>
References: <20210304222323.1954755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
X-TUID: CHF3b8YP/rbY

qemu_tcg_mttcg_enabled() shouldn't not be used outside of TCG,
restrict its declaration.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 9 ---------
 include/sysemu/tcg.h  | 9 +++++++++
 accel/tcg/cpu-exec.c  | 1 +
 tcg/tcg.c             | 1 +
 4 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index e3648338dfe..1376e496a3f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -454,15 +454,6 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
     }
 }
 
-/**
- * qemu_tcg_mttcg_enabled:
- * Check whether we are running MultiThread TCG or not.
- *
- * Returns: %true if we are in MTTCG mode %false otherwise.
- */
-extern bool mttcg_enabled;
-#define qemu_tcg_mttcg_enabled() (mttcg_enabled)
-
 /**
  * cpu_paging_enabled:
  * @cpu: The CPU whose state is to be inspected.
diff --git a/include/sysemu/tcg.h b/include/sysemu/tcg.h
index fddde2b6b9a..c16c13c3c69 100644
--- a/include/sysemu/tcg.h
+++ b/include/sysemu/tcg.h
@@ -17,6 +17,15 @@ void tcg_exec_init(unsigned long tb_size, int splitwx);
 extern bool tcg_allowed;
 #define tcg_enabled() (tcg_allowed)
 
+/**
+ * qemu_tcg_mttcg_enabled:
+ * Check whether we are running MultiThread TCG or not.
+ *
+ * Returns: %true if we are in MTTCG mode %false otherwise.
+ */
+extern bool mttcg_enabled;
+#define qemu_tcg_mttcg_enabled() (mttcg_enabled)
+
 #endif /* CONFIG_TCG */
 
 #endif
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 16e4fe3ccd8..7e67ade35b9 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -39,6 +39,7 @@
 #include "hw/i386/apic.h"
 #endif
 #include "sysemu/cpus.h"
+#include "sysemu/tcg.h"
 #include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/replay.h"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 63a12b197bf..4a4dac0bb3e 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -65,6 +65,7 @@
 #include "elf.h"
 #include "exec/log.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/tcg.h"
 
 /* Forward declarations for functions declared in tcg-target.c.inc and
    used here. */
-- 
2.26.2

