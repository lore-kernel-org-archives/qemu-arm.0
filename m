Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp794230ejo;
        Fri, 5 Jan 2024 07:48:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcjAZh+N+B8x4B0vriDNFXLHJgQOfVat5JTwAI1E7GbQtm1PXzZ06AJooJ+coQNZc+Vv9O
X-Received: by 2002:a05:620a:bd4:b0:781:61c:2398 with SMTP id s20-20020a05620a0bd400b00781061c2398mr2833269qki.56.1704469710760;
        Fri, 05 Jan 2024 07:48:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469710; cv=none;
        d=google.com; s=arc-20160816;
        b=eXMRWEq349KhDVVjORQqoO8AbtgQV/qWcmMDBaKwPW6p0rIWsAavUU6At26Po32ThZ
         nx8OfjVM+kepYmUgvfyB4R6qGUsmpi6l1iFIbX2YIf8wP6e1557euUqZT84PF9PqIWun
         2aFzC81m61QZFyNWcKFheXanIbaeEecLp5rjIU3siy67gdRpF1BawOmRmmEVU1FXeAZ1
         BGvqhtNmJ2GDrnnHzJ1gjaw61y954M9xv8S/WqiH2TqBHfq32Ttl3d12bATEr68mGUwo
         yHRgUgzEkEVsvX1oTes9fCOeHTfA2vslpGjUiCum31DbuERT9a0C8rKDVIAsRRnnJ6sF
         miOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z1uFhaGSAXCVtK5H8w3hTtFzEkQOw8kna05bCiblS/M=;
        fh=3nCCaiiW3tvaCvW7R3dnb3A1HVjFyaxnPEYthLbnaW4=;
        b=F7FcEpZThmNJh3DLu84mvBciattOI98e5qM5jJnpMSlQzNp8eDtKwU/sqBO7EfrJnQ
         vwrVGS3tKQQlz223U2ZJ/F3MSz1W62ZHljf8h4yXhp87fl2RV8sf7heMB00YJAkhTmKW
         TaeupLmmpE0M/KUDDa0S5IHmnpBt7KIXvehVhqBH64dLRN7ioRTS09Vi6vA6bBd2jZGp
         8ov9RK9nx52UaY3Rr3lb4rA3c1u6i2JnT0zUY4rvt1MC2GC1EbqHLtJmB1LNlGbWnZCY
         bPBd/7YWoK2RcMb4YtWFstEPzHC9isAG3xJNxRlu64zWZ4GWldZREEjom3dOfFA89TLZ
         1Qcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f+PT+rUv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id po8-20020a05620a384800b00781dde92148si1849068qkn.595.2024.01.05.07.48.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:48:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=f+PT+rUv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmPJ-0003qf-Fv; Fri, 05 Jan 2024 10:46:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmOc-0001mD-QG
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:46:06 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmOa-0003nw-HA
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:46:06 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40d3352b525so16183225e9.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:46:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469561; x=1705074361; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z1uFhaGSAXCVtK5H8w3hTtFzEkQOw8kna05bCiblS/M=;
 b=f+PT+rUvYR9fqDBm8gjVu32P9inyKy7hXUYxxSF8Nm5iMU6IIL/QaayarcXkX86jN0
 ddqtdXG29N9ymQdvb/Q4DIkDf7qtkmW5KtkNRv8wBMVR/dqD8yCg8HuVmZiooWz8kYW+
 T4EVbq3y1P8OdhUnDoWCgionN9RQoFVQ/lxWP14p5UwHRKDzgO4AT9HWSOip9AeOXb7g
 MwAZsFozCxcCk0Qf/kqrZ07wOE7Kyy6RyBgfXUaqTyzdQkv8dVOpjegVm8iHvXDVuRNp
 3AL5ocMUl6zbxkiD/5bqwyJXiLtsffKsBzSFPyoPVcYbZeMBYduoLC7oF93QCrbRwaWg
 F1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469561; x=1705074361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z1uFhaGSAXCVtK5H8w3hTtFzEkQOw8kna05bCiblS/M=;
 b=wza+M3Gczh8wAVaAM1M7i0NFkh4CuftEuj1KaM/wUYb5d++Pnwho5xFxEx1Er2fri8
 raCXvugjWm8gN8GGhCe6pU/Ir5jUGbTgI9aGjtRbslpraBZhaOb6uVnJwM10kRQCDkRb
 3KyzC9GHCT7P6vte30P58v/uA5HHGLn05Xv01TdEoYRaLOznlt9ezK8aJKynFbKga6gY
 cBbgH29EDvOoAGLi3Rl75AE/edmL5u+g07RF3QtLHx1wME/xtyuekrQrjx+XtIk/7ed7
 KoJHL+BCfDopet3D4c6NNhia0L4hdWaJnk3nTpzwRqcrb0uLD6hAV1YfsAhGZLiqP6Wq
 JN5A==
X-Gm-Message-State: AOJu0Yyugeph8cPB3zrLgBhnXW6xC/FTgmsXwkeisi50a8s1UHaLlnsq
 R8pNhmHB6RyphlfDI2PytlqNjBXi0WfH9w==
X-Received: by 2002:a05:600c:3b95:b0:40e:3532:2f6f with SMTP id
 n21-20020a05600c3b9500b0040e35322f6fmr1208080wms.182.1704469560809; 
 Fri, 05 Jan 2024 07:46:00 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c154d00b0040e3635ca65sm1945854wmg.2.2024.01.05.07.45.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:46:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 25/71] machine: Introduce helper is_cpu_type_supported()
Date: Fri,  5 Jan 2024 16:42:18 +0100
Message-ID: <20240105154307.21385-26-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: fnzxYYGsLzIW

From: Gavin Shan <gshan@redhat.com>

The logic, to check if the specified CPU type is supported in
machine_run_board_init(), is independent enough. Factor it out into
helper is_cpu_type_supported(). machine_run_board_init() looks a bit
clean with this. Since we're here, @machine_class is renamed to @mc to
avoid multiple line spanning of code. The comments are tweaked a bit
either.

No functional change intended.

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-ID: <20231204004726.483558-3-gshan@redhat.com>
[PMD: Only call new helper if machine->cpu_type is not NULL]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/machine.c | 84 ++++++++++++++++++++++++++---------------------
 1 file changed, 46 insertions(+), 38 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 1898d1d1d7..0119b11fc8 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1399,12 +1399,53 @@ const char *machine_class_default_cpu_type(MachineClass *mc)
     return mc->default_cpu_type;
 }
 
+static bool is_cpu_type_supported(const MachineState *machine, Error **errp)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(machine);
+    ObjectClass *oc = object_class_by_name(machine->cpu_type);
+    CPUClass *cc;
+    int i;
+
+    /*
+     * Check if the user specified CPU type is supported when the valid
+     * CPU types have been determined. Note that the user specified CPU
+     * type is provided through '-cpu' option.
+     */
+    if (mc->valid_cpu_types) {
+        for (i = 0; mc->valid_cpu_types[i]; i++) {
+            if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
+                break;
+            }
+        }
+
+        /* The user specified CPU type isn't valid */
+        if (!mc->valid_cpu_types[i]) {
+            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
+            error_append_hint(errp, "The valid types are: %s",
+                              mc->valid_cpu_types[0]);
+            for (i = 1; mc->valid_cpu_types[i]; i++) {
+                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
+            }
+
+            error_append_hint(errp, "\n");
+            return false;
+        }
+    }
+
+    /* Check if CPU type is deprecated and warn if so */
+    cc = CPU_CLASS(oc);
+    if (cc && cc->deprecation_note) {
+        warn_report("CPU model %s is deprecated -- %s",
+                    machine->cpu_type, cc->deprecation_note);
+    }
+
+    return true;
+}
+
 void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp)
 {
     ERRP_GUARD();
     MachineClass *machine_class = MACHINE_GET_CLASS(machine);
-    ObjectClass *oc = object_class_by_name(machine->cpu_type);
-    CPUClass *cc;
 
     /* This checkpoint is required by replay to separate prior clock
        reading from the other reads, because timer polling functions query
@@ -1459,42 +1500,9 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
         machine->ram = machine_consume_memdev(machine, machine->memdev);
     }
 
-    /* If the machine supports the valid_cpu_types check and the user
-     * specified a CPU with -cpu check here that the user CPU is supported.
-     */
-    if (machine_class->valid_cpu_types && machine->cpu_type) {
-        int i;
-
-        for (i = 0; machine_class->valid_cpu_types[i]; i++) {
-            if (object_class_dynamic_cast(oc,
-                                          machine_class->valid_cpu_types[i])) {
-                /* The user specified CPU is in the valid field, we are
-                 * good to go.
-                 */
-                break;
-            }
-        }
-
-        if (!machine_class->valid_cpu_types[i]) {
-            /* The user specified CPU is not valid */
-            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
-            error_append_hint(errp, "The valid types are: %s",
-                              machine_class->valid_cpu_types[0]);
-            for (i = 1; machine_class->valid_cpu_types[i]; i++) {
-                error_append_hint(errp, ", %s",
-                                  machine_class->valid_cpu_types[i]);
-            }
-
-            error_append_hint(errp, "\n");
-            return;
-        }
-    }
-
-    /* Check if CPU type is deprecated and warn if so */
-    cc = CPU_CLASS(oc);
-    if (cc && cc->deprecation_note) {
-        warn_report("CPU model %s is deprecated -- %s", machine->cpu_type,
-                    cc->deprecation_note);
+    /* Check if the CPU type is supported */
+    if (machine->cpu_type && !is_cpu_type_supported(machine, errp)) {
+        return;
     }
 
     if (machine->cgs) {
-- 
2.41.0

