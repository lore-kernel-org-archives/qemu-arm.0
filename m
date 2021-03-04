Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6642765lfg;
        Thu, 4 Mar 2021 14:43:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjUpc2d92ZH+GqoOodd9xNrju5zSvPPFKZfQUNIEp+WndBH//aPFjlSv3d4vt+e6oHXsaF
X-Received: by 2002:a6b:4109:: with SMTP id n9mr5291707ioa.43.1614897794898;
        Thu, 04 Mar 2021 14:43:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614897794; cv=none;
        d=google.com; s=arc-20160816;
        b=oEqI/8h+NoBJf5d9HYBcaTRQsPnNeiLy7aZxcV+eica5M5eLU9mnhZcYPotpDChQ8o
         p51FR2ZAD352Fx6PZKfpaMM0q+SBHZ3/TAXljTXislGydBhvzKmMRsP1vCdgry8TDAdx
         f4fy6ys97v2zx29JADhLKP7dja0hqDvlz+E5LAVVbd+SC4DoLEX3lUx/idZLGM0iadzm
         vMBvRM4c6bbFyMlwA2RPhEo7S959VONRW8Yd8UebD8squUoOk1Iuxc3kgTmurQIpK3sM
         a6WIJhzMBSXZL34O5lRtzMyR4w8E8kZKogvzfnExs1wikwRZf6MgjN4Y+icGhS4DKtP2
         gSoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+rqeUSg2fiW/MftHzeY++j7Aj9yk8dsEiDYp+lRnH1c=;
        b=qbSqtQrbdGPG6ckGiK9Scmxv/+SWhsTY1soJWUYuz89GGRJ1KB7SDcJ5/mkIFWR4Dk
         rHsVwZTe99vo3173r3eD5YgZAO+sBEaDPTgeH22Ipe0pQrbGyrpetmlILvKyNm6iM/U5
         ksQCHu+HJEKdhY2RqQcuLveWV4qqpMsvqBYkliX7cNWXR4QTZjVY0532tIrQ7SpVWP7p
         ZsN3O1n7yZfhd14PNkK0pa3XD37U1dL6ZJXZvQlam12D28g1roImofI+iTzwLllDTP4w
         39BbTYwsJj33cGxriCXXG8I0iIZv6bbXi2IINgLa/NR3eLyEeHJ/UwLEd+PY78DSZA4y
         MX/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OOdbFZ3A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n16si815245jat.35.2021.03.04.14.43.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 14:43:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OOdbFZ3A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHwgc-0007T1-5E
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 17:43:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNr-0007CJ-4W; Thu, 04 Mar 2021 17:23:51 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:33643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHwNp-0002VC-GQ; Thu, 04 Mar 2021 17:23:50 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 w203-20020a1c49d40000b029010c706d0642so5202401wma.0; 
 Thu, 04 Mar 2021 14:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+rqeUSg2fiW/MftHzeY++j7Aj9yk8dsEiDYp+lRnH1c=;
 b=OOdbFZ3AqgZkXVIv+J10pQn1XsyaoAYbkMORcRS7S/KbOJ4VSw3ZqOa1gcj+mFkYT5
 CeTJC7kMsKIUKqtrc1cLSs6ag0pKQhWPXeeMcMCS1lLITsEV9RHZqjiY9Op/96wgtTNK
 tZGghF+IwTdq8Y15SeAXpDmHCfMruYiMABL1XpvuU0w1twQWFe/dlMy7YYBP5WDTtaQw
 2yRhfHQX2R60nsIyMO1UBSAdOKL23MyEnKqe9fgZ4hs/5KLUXXObr7VJXjhl3qVumlTU
 eu34/v9omzWDN4/dDT++xEXPKyAz6IzjVIa1qytss59q5pBSZqFhgtu/btW0SUsQRze0
 oL2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=+rqeUSg2fiW/MftHzeY++j7Aj9yk8dsEiDYp+lRnH1c=;
 b=QkkWBC95NVSsixsankuNPXZBRZtasGXTdpF8tWxBpnmMOQG4ZjEbY4Bktk2LEIzg2x
 DBtV+PWRuCZzkgHuP4AFEcOTLOVs5twf5ceXufcYJIwf4vWFHauOw6fR4mFcOBrSs69J
 Fpx+MAZqIBqOoQbltD2NXjwqY5zOL9OLaJsrhQeNFK6pEobOocWO9v7VCJjlawBT02Wz
 Kbux95BlCs116a0wWk3EWxSdz0jYGNHkgfsW8aRb9JHddcAC6ss28JEgCx6ljdj5/jIR
 pCgJEwp04rdKeCyqKmAED6CaDxB5dSDmqpIKcJDwebInXUpuWFUhy2Tjsnldj7Q8cfPu
 LQUA==
X-Gm-Message-State: AOAM530OsSXntBZA5jGIpMdjtA/sNXwFxsITuc8OxRnBJQtcXsTrUIgR
 SejtO6KM9v1VFWUbGSrGyo1wbEWZdH4=
X-Received: by 2002:a05:600c:2f08:: with SMTP id
 r8mr5905655wmn.95.1614896626435; 
 Thu, 04 Mar 2021 14:23:46 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 3sm1162274wry.72.2021.03.04.14.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 14:23:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 4/8] target/s390x: Move s390_cpu_has_work to
 excp_helper.c
Date: Thu,  4 Mar 2021 23:23:19 +0100
Message-Id: <20210304222323.1954755-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210304222323.1954755-1-f4bug@amsat.org>
References: <20210304222323.1954755-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YfcHNqdi+u/f

We will restrict the s390_cpu_has_work() function to TCG.
First declare it in "internal.h" and move it to excp_helper.c.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/s390x/internal.h    |  1 +
 target/s390x/cpu.c         | 17 -----------------
 target/s390x/excp_helper.c | 18 ++++++++++++++++++
 3 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index 11515bb6173..7184e38631c 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -263,6 +263,7 @@ ObjectClass *s390_cpu_class_by_name(const char *name);
 
 
 /* excp_helper.c */
+bool s390_cpu_has_work(CPUState *cs);
 void s390x_cpu_debug_excp_handler(CPUState *cs);
 void s390_cpu_do_interrupt(CPUState *cpu);
 bool s390_cpu_exec_interrupt(CPUState *cpu, int int_req);
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index feaf2a6d08f..d57f69e7f7d 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -56,23 +56,6 @@ static void s390_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.psw.addr = value;
 }
 
-static bool s390_cpu_has_work(CPUState *cs)
-{
-    S390CPU *cpu = S390_CPU(cs);
-
-    /* STOPPED cpus can never wake up */
-    if (s390_cpu_get_state(cpu) != S390_CPU_STATE_LOAD &&
-        s390_cpu_get_state(cpu) != S390_CPU_STATE_OPERATING) {
-        return false;
-    }
-
-    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-        return false;
-    }
-
-    return s390_cpu_has_int(cpu);
-}
-
 #if !defined(CONFIG_USER_ONLY)
 /* S390CPUClass::load_normal() */
 static void s390_cpu_load_normal(CPUState *s)
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index ce16af394b1..64923ffb83a 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -28,12 +28,30 @@
 #include "hw/s390x/ioinst.h"
 #include "exec/address-spaces.h"
 #include "tcg_s390x.h"
+#include "qapi/qapi-types-machine.h"
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/sysemu.h"
 #include "hw/s390x/s390_flic.h"
 #include "hw/boards.h"
 #endif
 
+bool s390_cpu_has_work(CPUState *cs)
+{
+    S390CPU *cpu = S390_CPU(cs);
+
+    /* STOPPED cpus can never wake up */
+    if (s390_cpu_get_state(cpu) != S390_CPU_STATE_LOAD &&
+        s390_cpu_get_state(cpu) != S390_CPU_STATE_OPERATING) {
+        return false;
+    }
+
+    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
+        return false;
+    }
+
+    return s390_cpu_has_int(cpu);
+}
+
 void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
                                               uint32_t code, uintptr_t ra)
 {
-- 
2.26.2

