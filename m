Received: by 2002:a05:7023:b15:b0:92:a90b:6588 with SMTP id qd21csp434995dlb;
        Tue, 4 Feb 2025 10:09:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWw7TxvnPc+R+ny+vwwLhzdJR7WRdQQF0vFshBEIUVNyNLtoSVGBNbh+gW2BqG/WKpjJ+zCsO/sL/n47w==@linaro.org
X-Google-Smtp-Source: AGHT+IE9MuooovHcpwZn8F3r+WE2I7UE7VPjqW1qh8+OK/ce2IV/UJIsMB5hPWQDNrZkGzMMvbav
X-Received: by 2002:a05:6122:a18:b0:518:791a:3462 with SMTP id 71dfb90a1353d-51e9e518da7mr22801330e0c.9.1738692544617;
        Tue, 04 Feb 2025 10:09:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738692544; cv=none;
        d=google.com; s=arc-20240605;
        b=ERQy0ZInP9o4B7oTnV08C/5BnG/OMIHbf4C6YpTR8Y90fxycaHA7Uml4bFf4BvsTPW
         W9hHoV2y5AXXIV62z/FhHjg3sPqNG7QFp8dLzuAUpWryOvdshAR2K6P9KiI4t93dMe5i
         YJY4L+Eoi+0ieb6+Tujy/7tkwKnKWg29WG+rNblTJ/PPmZGly8utwCV+7vXnlqMJqtvD
         dZ3QkFZ1TgLFPjDCum8yx5qG5wCRAL4OZeejP2ARG5WfBqHzJXow+X1QW8/F3zJY6iTj
         6sD2kGbgcpsiv9Vcw9Xxb6M/ysrYJ9F97Wgmi5IxKJWbZ1JYl0vE7uNIThIiTcs0Di/k
         ag4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BrfjnJSg9CX0l2LnyeLtW/bJrqIZsHOwQ9P6gpzmndY=;
        fh=LudvwgQnuHkQooKOvT/QjwYg7qAMjLsY84m7dABA9xA=;
        b=HqxFIYdBV0UCKRv59tUO+8/ww6kDcpNvHZ/E+CoBjkkvKli4f84I/ZD9O5c67jmUV7
         QuJJ2ViHAx3DMkwOcMQjTMiZr10wBogluYyV67C2sQqa4lDfZKU7S88h9yTVOLYRdF+0
         cxwGm9Y2DkWU7NMMuILBTC+8MeGN96zMvBa3ZlC9irSXwHyP2oO1FP35oQY+YJ7vP84H
         jLUwtlUyaHpSxR59QlKQI/389yp4hpNf7vmNjEAdftZec0CWH8zZGlg9q4NJlVDWtgV5
         M3+IAdCzW5naaQOJcF4wnjqVe6v69vsO6ZUj2gsW7azybwGJT570uiywWm1/cStVFcGT
         ds1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2uA0u+8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51f08f9df00si284616e0c.90.2025.02.04.10.09.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 10:09:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=P2uA0u+8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfNLC-0004MK-9e; Tue, 04 Feb 2025 13:08:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNL4-0004J3-I8
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:07:59 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tfNL1-00078e-CK
 for qemu-arm@nongnu.org; Tue, 04 Feb 2025 13:07:57 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-38dada77686so821565f8f.0
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 10:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738692473; x=1739297273; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BrfjnJSg9CX0l2LnyeLtW/bJrqIZsHOwQ9P6gpzmndY=;
 b=P2uA0u+8gWRX/oPFEDrpcFV80nG1++BjwvtUFTEq14oz4bG4BUlSld580WrxXNWAFB
 CMHoN/nMiyV0zxVkutCGL6Jpp+AVwJSMiiFdkPC3otwdrhaenyHznlRL/h4JboIu2TnY
 oIOiIvVUmQtRZuMhEw81ez151ngqokHDXhchS/dksjngAgnITTckVnbVYqvdNer+Hmps
 KnXl3qOSPlrNv0omX2s6jMHSr+R8ChJPdBFEES5LPewasySpHzGswGghPevlg27ULOXe
 yGiuNMHXyWA4IzqlkrYDWLhGYLP5lcjWFWvtGW/BROymx/Q7td7Srm2E3B0fdtfCc7jf
 9oqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738692473; x=1739297273;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BrfjnJSg9CX0l2LnyeLtW/bJrqIZsHOwQ9P6gpzmndY=;
 b=Ln2peWuNYicK90uLUA8j0x9ixCTTNGbXNbiQy8G9Cx9iJ7du6LOo6t8cg+EgfAFms6
 3fgRVbV9EHfvHSdvA+9BDn5E8Yfan8jh3QGFtuQWLrwEcejPGu1WRCV6jsA9O/xtGH7V
 j89+0GzSC+nfbCMJaDVfPLxAvENFyjvEEqhxNPXxXLUUQOYLJ5wqG5+iHx09eJX9lJDN
 lPscoJ4x+lgqEqL2WDXzTRofdo0rQCan8nxTFvR1JF1cQUH7zbg/tgaiG8Izx6SUglUE
 iY7sbWmNlDvPuusk+HiR8xpxQ8aB+zznqRobAenMLfWfMrCPD8/ZfJ/uIc3XuuwCIIeT
 qKqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGKUMu7+HUAOmzzG/eiXyuqM8XY0lcUrNGphtyMgMI0EhWwLpcLIXQg/sAGCiGdkhPRqKlOcuz6w==@nongnu.org
X-Gm-Message-State: AOJu0YwZBem1VoUfLtPpzd9pmANz85gSoZywLXfPKtlALnE17SrmVKsa
 RCUNfrdYU2EIKXk09aTvgu+How+MyL7diX6tXeyABKN/Co/GMVHwggJXcNn6bvY=
X-Gm-Gg: ASbGncsYqBR/fInqyk8laP4Ed42KJYHtpYQP3qhBD+9ZrlHHej2/I/ScStL+2KZ29/G
 yWIqqckgfPL7d/eu2s0qMWj7huk/6tb+uRt9o5IyGAljva5VH3nSNPw8n1eTdMDGJnrOcsumX2f
 gHWLBqillZJTawC4l2e5a8OVYEGYT2SO6iNBqoBLzsKcIEgUvL4nYDjFLcdUydOgsBdgBds8ZDx
 kmv2pmNeKQA1sCdcW1cC0h1ksazubonDXz8n6O2c1Dk8i4XlTivnCSyV1UaELfAiTEtUR75OP7z
 7wg280QUVctpzpkmoc60FcDv4AKOvPNrAVJ349yvDgcxnnMaEfIB+YqI3d4QNKEUJQ==
X-Received: by 2002:a05:6000:1faa:b0:385:fb8d:865b with SMTP id
 ffacd0b85a97d-38c520a344emr28306088f8f.48.1738692473369; 
 Tue, 04 Feb 2025 10:07:53 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc80e61sm236364185e9.34.2025.02.04.10.07.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 04 Feb 2025 10:07:52 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/8] hw/boards: Convert no_sdcard flag to OnOffAuto
 tri-state
Date: Tue,  4 Feb 2025 19:07:39 +0100
Message-ID: <20250204180746.58357-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204180746.58357-1-philmd@linaro.org>
References: <20250204180746.58357-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: nmLGHPUTPDhy

MachineClass::no_sdcard is initialized as false by default.
To catch all uses, convert it to a tri-state, having the
current default (false) becoming AUTO.

No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/boards.h        | 2 +-
 hw/arm/xilinx_zynq.c       | 2 +-
 hw/core/null-machine.c     | 2 +-
 hw/s390x/s390-virtio-ccw.c | 2 +-
 system/vl.c                | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index e1f41b2a533..d61b0a47780 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -283,9 +283,9 @@ struct MachineClass {
         no_parallel:1,
         no_floppy:1,
         no_cdrom:1,
-        no_sdcard:1,
         pci_allow_0_address:1,
         legacy_fw_cfg_order:1;
+    OnOffAuto no_sdcard;
     bool is_default;
     const char *default_machine_opts;
     const char *default_boot_order;
diff --git a/hw/arm/xilinx_zynq.c b/hw/arm/xilinx_zynq.c
index 8477b828745..12418094f9d 100644
--- a/hw/arm/xilinx_zynq.c
+++ b/hw/arm/xilinx_zynq.c
@@ -463,7 +463,7 @@ static void zynq_machine_class_init(ObjectClass *oc, void *data)
     mc->desc = "Xilinx Zynq Platform Baseboard for Cortex-A9";
     mc->init = zynq_init;
     mc->max_cpus = ZYNQ_MAX_CPUS;
-    mc->no_sdcard = 1;
+    mc->no_sdcard = ON_OFF_AUTO_ON;
     mc->ignore_memory_transaction_failures = true;
     mc->valid_cpu_types = valid_cpu_types;
     mc->default_ram_id = "zynq.ext_ram";
diff --git a/hw/core/null-machine.c b/hw/core/null-machine.c
index f586a4bef54..b93056c0f7b 100644
--- a/hw/core/null-machine.c
+++ b/hw/core/null-machine.c
@@ -53,7 +53,7 @@ static void machine_none_machine_init(MachineClass *mc)
     mc->no_parallel = 1;
     mc->no_floppy = 1;
     mc->no_cdrom = 1;
-    mc->no_sdcard = 1;
+    mc->no_sdcard = ON_OFF_AUTO_ON;
 }
 
 DEFINE_MACHINE("none", machine_none_machine_init)
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index d9e683c5b49..5f78c8d20ff 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -817,7 +817,7 @@ static void ccw_machine_class_init(ObjectClass *oc, void *data)
     mc->no_cdrom = 1;
     mc->no_floppy = 1;
     mc->no_parallel = 1;
-    mc->no_sdcard = 1;
+    mc->no_sdcard = ON_OFF_AUTO_ON;
     mc->max_cpus = S390_MAX_CPUS;
     mc->has_hotpluggable_cpus = true;
     mc->smp_props.books_supported = true;
diff --git a/system/vl.c b/system/vl.c
index db8e604ebab..2940c865b19 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1346,7 +1346,7 @@ static void qemu_disable_default_devices(void)
     if (!has_defaults || machine_class->no_cdrom) {
         default_cdrom = 0;
     }
-    if (!has_defaults || machine_class->no_sdcard) {
+    if (!has_defaults || machine_class->no_sdcard == ON_OFF_AUTO_ON) {
         default_sdcard = 0;
     }
     if (!has_defaults) {
-- 
2.47.1

