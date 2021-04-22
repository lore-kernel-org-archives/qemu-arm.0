Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp243192lfb;
        Thu, 22 Apr 2021 03:56:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyXwjNA0+rFRjn18qq++8XROYP5fegGG/4qCyDpoYNC1Se6uaQxKGatwafKmvJviVLz94bt
X-Received: by 2002:a02:9081:: with SMTP id x1mr2647493jaf.2.1619088967526;
        Thu, 22 Apr 2021 03:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619088967; cv=none;
        d=google.com; s=arc-20160816;
        b=jzp3wcoktTZ+f6n2fDb6OfN0iR1YYpNMKFRPp6zNVlrS8MKe1/J3rkXY1bJSK3jROr
         RDBudZlm9gZZnGM/9lJli2V8WnqbOz3TTnGKKIwiQWgNx6pY69Xaep9xdjacihCu4hME
         CC/20GUQFl48AtgL2BBRztB53qsL3A3qOJ6/gAtxuQYFh/h0efD+mVVlJ8eAHwsPzMTZ
         7+n31lFZUiZqda65h0xCwpRAzF7Jl6vdv7OPyrFmeig7svXuF/TBeDf5VRa1Q5Fre/dR
         ViIXBiRqSrQUEGo/kIVnRZzigQpIKgimm+trHw+VED7lytMEyDWomb2kUl09zi7MxNo4
         S8xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9/x0sbee0gzO87Im7J0Upi0aYSK51jCOG4/iCv7QYG0=;
        b=G/31mIoUJDpiesW+lBulmLo1gv+t0vQEbSDcnzr3DqS0+02P24DNHrYpJueF3xACrU
         kHD+Jhx2nEjwcp9cvjY+C3OzADOoDlXFb2W6JXPDXnVXfYGYE3VakVcqOhfA4mUaeJos
         zQ/QN2s/A0dQxnjynJ8QncN5GSdBNHJkyRWtju+AHBoGqc3dGUOjFXeDA4hPtnRmrkV2
         K6Pec0bIbr+A12cz1gj+RhWcWPkNDXyqzBWqzj5EI7cT1g5x8WON+lZYtqJL1zcrQlQG
         KL+9oAe5q7DAHrubsvUVrmIyjX6KWL4PSYhjT+XffzY36Wyynzyr8vAo/CZ8TKFVR9HF
         Hh3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XVoyPnqP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si2236520ios.49.2021.04.22.03.56.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Apr 2021 03:56:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XVoyPnqP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:58556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lZX0A-0008JB-Qv
	for alex.bennee@linaro.org; Thu, 22 Apr 2021 06:56:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWsl-0007BG-UH; Thu, 22 Apr 2021 06:48:28 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:42985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZWsi-0005WM-Hu; Thu, 22 Apr 2021 06:48:27 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 y5-20020a05600c3645b0290132b13aaa3bso2869188wmq.1; 
 Thu, 22 Apr 2021 03:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9/x0sbee0gzO87Im7J0Upi0aYSK51jCOG4/iCv7QYG0=;
 b=XVoyPnqPEXFVncimCquNPhdHgXHJiJoO7ioPnl5TZBZb4QbF2BGG2rhGER+KK28rZy
 LHxYMR7EPdG/sQLFRPzSFGzX4E1Rz3LVJnr8nYHmOvQtRZ5wXOe2uRRVHbkVM9zlR/yI
 JBzBzl8IgiazX4PR+ESR3BDUzcA0h6u5uVn1BnMBXz+24nhh50Vn/8ij3WZxHCFIJT+F
 pxAPbg6aO+Hddk2oxoE/DGJ6w7PPdQd4itrv48xEemdufB8RIHB2fcoLZXoAiEQH83CW
 A5zj536ukP9arygIfOr86hhQbyLjSPLlpSdIh8hlbGH16ge9NuOsYHtoydX7eCS2kZpI
 Z9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9/x0sbee0gzO87Im7J0Upi0aYSK51jCOG4/iCv7QYG0=;
 b=MOsO6bCGa9+zK4kLy6N51Hohy68OXrk6pJjqtRhnsXFkKj9Q/DnjmKRpLX6aQKiEHu
 PyKppBTiICb6cNV/tK8R21Dhv39ljdz3Rs3WTZS7tqQAkR8jd3d4SgAt4OHof0hxpFPC
 8iTgqRFxwburxMJ48MoQrCoOi3BWhFqMxAMctaf8HDjWjY+nuZwIM3Hzm6qiMS1Xo41X
 oVmYmMftI71en9j7cM4KMpUYCHDfYVpGVQsPmwF3GXmMx3ekW1MAeeGgtbMt5YeEHT9c
 E72kReGIiNc9WqUg+VyK8rnJK+R5mMAeZbEqwYp3FO/Em4rnDJiJSevRMyTOhZVouvN4
 nvDw==
X-Gm-Message-State: AOAM532KbUI0ICKUKx2z8g4UxSMMAw9y8CH9xSkj8muUYGIQS7YBXPSL
 G/73n/FYg10hrS3pBXEC6UnByysyAfeugg==
X-Received: by 2002:a1c:e006:: with SMTP id x6mr14995174wmg.40.1619088501321; 
 Thu, 22 Apr 2021 03:48:21 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id 18sm5709423wmo.47.2021.04.22.03.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 03:48:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 13/15] cpu: Move CPUClass::get_memory_mapping to
 SysemuCPUOps
Date: Thu, 22 Apr 2021 12:47:02 +0200
Message-Id: <20210422104705.2454166-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210422104705.2454166-1-f4bug@amsat.org>
References: <20210422104705.2454166-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 53q4bs4bFDjL

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h            | 3 ---
 include/hw/core/sysemu-cpu-ops.h | 5 +++++
 hw/core/cpu.c                    | 4 ++--
 target/i386/cpu.c                | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 88a0a90ac7b..6dd60c3ada4 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -94,7 +94,6 @@ struct AccelCPUClass;
  * @dump_statistics: Callback for dumping statistics.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
  * @get_paging_enabled: Callback for inquiring whether paging is enabled.
- * @get_memory_mapping: Callback for obtaining the memory mappings.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
  *       setting the PC from a source such as an ELF file entry point;
@@ -138,8 +137,6 @@ struct CPUClass {
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     bool (*get_paging_enabled)(const CPUState *cpu);
-    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
-                               Error **errp);
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index 0c8f616a565..460e7d63b0c 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -16,6 +16,11 @@
  * struct SysemuCPUOps: System operations specific to a CPU class
  */
 typedef struct SysemuCPUOps {
+    /**
+     * @get_memory_mapping: Callback for obtaining the memory mappings.
+     */
+    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
+                               Error **errp);
     /**
      * @get_phys_page_debug: Callback for obtaining a physical address.
      */
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 6932781425a..339bdfadd7a 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -83,8 +83,8 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_memory_mapping) {
-        cc->get_memory_mapping(cpu, list, errp);
+    if (cc->sysemu_ops->get_memory_mapping) {
+        cc->sysemu_ops->get_memory_mapping(cpu, list, errp);
         return;
     }
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 18debeb645f..1b7317e43b4 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7393,6 +7393,7 @@ static Property x86_cpu_properties[] = {
 
 #ifndef CONFIG_USER_ONLY
 static const struct SysemuCPUOps i386_sysemu_ops = {
+    .get_memory_mapping = x86_cpu_get_memory_mapping,
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
@@ -7436,7 +7437,6 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
     cc->get_paging_enabled = x86_cpu_get_paging_enabled;
 
 #ifndef CONFIG_USER_ONLY
-    cc->get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->sysemu_ops = &i386_sysemu_ops;
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.26.3

