Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp1156629lfm;
        Mon, 17 May 2021 03:55:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwgUT9Y9dXGA8LpKtm9UJ0mqr61F3dK1I9Evou/oNQPS5Md7dltBwHNvnryXzDfMaiQUVW3
X-Received: by 2002:a02:688:: with SMTP id 130mr14956297jav.48.1621248938906;
        Mon, 17 May 2021 03:55:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621248938; cv=none;
        d=google.com; s=arc-20160816;
        b=iB8e4PUn85qyJ6x5AGAlgwMuTQzE+cShZt400Gbzo0wndMBz5SGPg18P0Ll5UTkyrp
         JWt45Drm8MK680MPTl2qzwFlU4IzwNYOtF60Dex6n5B3dyLBbPn36uIZgOG0T9Lx72B0
         JI0F8lCUyH8t24RrSzxfPfPtFd6TxveNUfWOvusbP8g9epCaKUpITVuqITURERhsLnWc
         ZsJTwkKre8dlu4EMa8zdCtAxlfV1B9RkXD5Y3nBORocmOHXItccUlQUfqHEw1JrPZPvt
         irQN7I/+r6+J+gEhVvhEZYrlOw+tQ4zF7Osu3jnuAsBGHEl0a5v7xUov9ithYDyeLvPE
         f9GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=jVPo/7wf7/2upfXpPnfl/YhREfWQHr+znlMSFXjo7H8=;
        b=a8cUlGA8TnM8LH6lpGH44HA59TPsc7W24CJe21lQj3+HhcXyGDcFu5BjT5Esb9P6XT
         2RTVpkXe60MHKL9+MLECrgXGdYE5w87oSMiLG0d+5oFRYWHrfg0YpDibTguyOqzuwmxm
         tJqKfbHi2J+faP7byf3GNLIe7hqp70cN5bW3pD0HIurTgvFm8+khAJLCjUK6YjX3ojDh
         ANMxKzqozRsQyE7uFcmdypwYfPc5VQZHVQrojN6GItYdkYJQwLMHKtRaCRPp7yPW9jxJ
         QXIG6ht5Ytiez25e2PJMw+jN2Zb62AAnGeG7zQY/UXDY+LWT/wAs2g+qVgcim5i1eSv+
         tM2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZXTAgZZD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si18875096ilm.67.2021.05.17.03.55.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 May 2021 03:55:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ZXTAgZZD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:32830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liauQ-0003Sf-1M
	for alex.bennee@linaro.org; Mon, 17 May 2021 06:55:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarK-0005gS-Pt; Mon, 17 May 2021 06:52:26 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:46916)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1liarI-0006em-Oi; Mon, 17 May 2021 06:52:26 -0400
Received: by mail-wr1-x42b.google.com with SMTP id y14so3785985wrm.13;
 Mon, 17 May 2021 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jVPo/7wf7/2upfXpPnfl/YhREfWQHr+znlMSFXjo7H8=;
 b=ZXTAgZZDKYpbtRhiI+SV5EmMZJIobSIdnY7T9MyuO6DHeGB0w4oeWqveDrWJtK18/f
 sNMx+IR9GCXtwKMSCof1vx9Mg+q3fwgplcNAKPN3gVcWZjrM79q+T1wEV0Gfp05LAlUG
 AF5z5b7zngh1TfDmXCmRiH1wLLvIhAGlTUcpDQK24YOD2EAwo6oxYxzXC3dYdVqeVVuN
 7r8E0Y1G6RIWIabLmkMZaWTYa4TtCldxOgRVDkHWPVN+rdU7hCxtoHiAZfTU9fz6kMKp
 OpOqxzsQJQxWrKuoIVVthEwLeLrcUasvkB6fvreKAWw8r9YhHXRnC9OcthoJwGiQxFgb
 PXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=jVPo/7wf7/2upfXpPnfl/YhREfWQHr+znlMSFXjo7H8=;
 b=P2WFeuM1+W2pI+/210Oz7FPRm0Q5CL95Jbbn2cfzRfy58sNXI/uZz/JkU/+Hur1CEr
 G217gK+RxcLvroQiQq5ijVhKFtlVsfKMxhz1WDdpiWv1NxzpFi2HFFRSp/sej1qsR/oN
 8ZG+SxL217ri1yn22rfdiCa3SSz9MDoGn7cA+tifH97h14RA6KE/cjLC1ydhvgOcxZV1
 0JukKKDxjltY0lDxS1wVYBXX0zdfVn9fYPwface0Kff/xDfnamCn8gBVvSVhw+dSz+1A
 hCeR65LdFvXUrMbnJa4aoat8LGJvL5n8JrOryEfcXyfpcxqelbwIMfo+iuVKFhz1w+/U
 vILw==
X-Gm-Message-State: AOAM530MEvmLV7j3EMAsd5MNA19/68csweLYiejdn7pVE1UMGJgucKUW
 h95MxUHVYQeWtNN7vlcktvXz/PW7C+YD3w==
X-Received: by 2002:a5d:4ec8:: with SMTP id s8mr4559165wrv.181.1621248741521; 
 Mon, 17 May 2021 03:52:21 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id t17sm9915320wrp.89.2021.05.17.03.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:52:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/23] cpu: Directly use cpu_write_elf*() fallback handlers
 in place
Date: Mon, 17 May 2021 12:51:25 +0200
Message-Id: <20210517105140.1062037-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210517105140.1062037-1-f4bug@amsat.org>
References: <20210517105140.1062037-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
X-TUID: BAa6T1sxst/T

No code directly accesses CPUClass::write_elf*() handlers out
of hw/core/cpu.c (the rest are assignation in target/ code):

  $ git grep -F -- '->write_elf'
  hw/core/cpu.c:157:    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
  hw/core/cpu.c:171:    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
  hw/core/cpu.c:186:    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
  hw/core/cpu.c:200:    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
  hw/core/cpu.c:440:    k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;
  hw/core/cpu.c:441:    k->write_elf32_note = cpu_common_write_elf32_note;
  hw/core/cpu.c:442:    k->write_elf64_qemunote = cpu_common_write_elf64_qemunote;
  hw/core/cpu.c:443:    k->write_elf64_note = cpu_common_write_elf64_note;
  target/arm/cpu.c:2304:    cc->write_elf64_note = arm_cpu_write_elf64_note;
  target/arm/cpu.c:2305:    cc->write_elf32_note = arm_cpu_write_elf32_note;
  target/i386/cpu.c:7425:    cc->write_elf64_note = x86_cpu_write_elf64_note;
  target/i386/cpu.c:7426:    cc->write_elf64_qemunote = x86_cpu_write_elf64_qemunote;
  target/i386/cpu.c:7427:    cc->write_elf32_note = x86_cpu_write_elf32_note;
  target/i386/cpu.c:7428:    cc->write_elf32_qemunote = x86_cpu_write_elf32_qemunote;
  target/ppc/translate_init.c.inc:10891:    cc->write_elf64_note = ppc64_cpu_write_elf64_note;
  target/ppc/translate_init.c.inc:10892:    cc->write_elf32_note = ppc32_cpu_write_elf32_note;
  target/s390x/cpu.c:522:    cc->write_elf64_note = s390_cpu_write_elf64_note;

Check the handler presence in place and remove the common fallback code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/core/cpu-common.c | 63 --------------------------------------------
 hw/core/cpu-sysemu.c | 44 +++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 63 deletions(-)

diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 9d73c9a28ca..5913ffe22be 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -116,65 +116,6 @@ void cpu_exit(CPUState *cpu)
     qatomic_set(&cpu->icount_decr_ptr->u16.high, -1);
 }
 
-int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
-                             void *opaque)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
-}
-
-static int cpu_common_write_elf32_qemunote(WriteCoreDumpFunction f,
-                                           CPUState *cpu, void *opaque)
-{
-    return 0;
-}
-
-int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
-                         int cpuid, void *opaque)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
-}
-
-static int cpu_common_write_elf32_note(WriteCoreDumpFunction f,
-                                       CPUState *cpu, int cpuid,
-                                       void *opaque)
-{
-    return -1;
-}
-
-int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
-                             void *opaque)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
-}
-
-static int cpu_common_write_elf64_qemunote(WriteCoreDumpFunction f,
-                                           CPUState *cpu, void *opaque)
-{
-    return 0;
-}
-
-int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
-                         int cpuid, void *opaque)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
-}
-
-static int cpu_common_write_elf64_note(WriteCoreDumpFunction f,
-                                       CPUState *cpu, int cpuid,
-                                       void *opaque)
-{
-    return -1;
-}
-
-
 static int cpu_common_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg)
 {
     return 0;
@@ -377,10 +318,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->has_work = cpu_common_has_work;
     k->get_paging_enabled = cpu_common_get_paging_enabled;
     k->get_memory_mapping = cpu_common_get_memory_mapping;
-    k->write_elf32_qemunote = cpu_common_write_elf32_qemunote;
-    k->write_elf32_note = cpu_common_write_elf32_note;
-    k->write_elf64_qemunote = cpu_common_write_elf64_qemunote;
-    k->write_elf64_note = cpu_common_write_elf64_note;
     k->gdb_read_register = cpu_common_gdb_read_register;
     k->gdb_write_register = cpu_common_gdb_write_register;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
diff --git a/hw/core/cpu-sysemu.c b/hw/core/cpu-sysemu.c
index 078e1a84a58..7f3a3574943 100644
--- a/hw/core/cpu-sysemu.c
+++ b/hw/core/cpu-sysemu.c
@@ -54,6 +54,50 @@ int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
     return ret;
 }
 
+int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
+                             void *opaque)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!cc->write_elf32_qemunote) {
+        return 0;
+    }
+    return (*cc->write_elf32_qemunote)(f, cpu, opaque);
+}
+
+int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
+                         int cpuid, void *opaque)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!cc->write_elf32_note) {
+        return -1;
+    }
+    return (*cc->write_elf32_note)(f, cpu, cpuid, opaque);
+}
+
+int cpu_write_elf64_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
+                             void *opaque)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!cc->write_elf64_qemunote) {
+        return 0;
+    }
+    return (*cc->write_elf64_qemunote)(f, cpu, opaque);
+}
+
+int cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cpu,
+                         int cpuid, void *opaque)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (!cc->write_elf64_note) {
+        return -1;
+    }
+    return (*cc->write_elf64_note)(f, cpu, cpuid, opaque);
+}
+
 bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
-- 
2.26.3

