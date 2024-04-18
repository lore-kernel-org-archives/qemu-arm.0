Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952184ejd;
        Thu, 18 Apr 2024 12:25:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUSQPEG0S3htLud5eZMYfXEKX2koMZoL87oDK+tndK4GIGLTIb2wFgHcT/UXV0zwjzbeUjvWUWAJeY8Eia50RoD9Dyyq98P
X-Received: by 2002:a5d:5146:0:b0:34a:3680:172 with SMTP id u6-20020a5d5146000000b0034a36800172mr858008wrt.16.1713468341919;
        Thu, 18 Apr 2024 12:25:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468341; cv=none;
        d=google.com; s=arc-20160816;
        b=PHN11bD26t70ZDK2QUnllmQBwV//99ibre/AavrNcM2F0LafypcPUTnDq1KRRO65l6
         IPuS3jBgNFyyjSWWTVyogW1miIgFNLNtCgrdZhwRmYI9hzTij9bnkHoJ4opr2k5h76my
         +zmhBOKFnE2LUeA9qs7IyxwTMybVfLduifv7ewkoLZk3liZdV8Ojo3Bs1S65UZrfyFwQ
         t/+kKdjRiksbZQJqeHJ+Y0+hZ82iiq1+ehUyH/12QLl9bjxluvxdYv0CtpPIUk+Hy0tN
         e+TjMHYGVzPsVaOHj26LOa46qqc3g/XG3b7a8wjnh1Rc2UEsyteCQ/stMZduYymzA7Ix
         VavQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Rg2JOTw5ouUti560CWKRK7poJqCPTKGwJpqCuG5tVqg=;
        fh=z87j0DWbj1PG69IOC+oMKeGyy1BPDBW1lV74abVVgVM=;
        b=PPfwXLNngsOXYR/fHludRgZy8OhrC5YeSJ4DhowzZbxpbU3bbw6nJ+ODYm23d8YCgx
         Fl5/P1soSeGmNcgxBiQXMl3yQahPF70VuiaGiEd9ZZC99FDmTQXtZCj0XboeOyoHqQX+
         t2NGoZj81xdsLjcZD3/IS4woEUKD1KPR3I4u1syidtupb4l1NAMZPkDVj9IL9g8dRPXq
         DCAHoQ8vA7vNNuF4Q60KzzR2mkFNmbNCxHx3Vkv41S9uigxi0bpkwLEz+3vUWEHyTVYZ
         YB1zDHt5X3wFmO9CRuqnAfH923wDF8sinvAVeh4ebqbCDL8LFiFyDQypkgu96nQDGuCF
         w69Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMHxjLyP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r5-20020a170906c28500b00a522238abdbsor719944ejz.11.2024.04.18.12.25.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:25:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DMHxjLyP;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468341; x=1714073141; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rg2JOTw5ouUti560CWKRK7poJqCPTKGwJpqCuG5tVqg=;
        b=DMHxjLyPMBFuwdrXappJS+4UittUSUfT+GPNlmSwSulzxr/I8aCd/VQ4uk5k90B7Yj
         JUL1oQUJnrDyhxpoOFURfrgt5XZw6oBlkikq1WJuPl2OWfxtTS9Y633ybzbBA7QtYST+
         skrD5XVA+jIvLXllxeBpQE1cR8OCm8DJY/WZoHywRbCnfbqeMgShk+bIkfEkVnnCxgNd
         dO/BJVkUQcuc4IRlYp/X5wbIAnD0xPE2HwJ90FuEnMdaCRDmiY33tzc83Kq6fZxqQhRT
         6koZ6l4lPcQS1Wbj1vH6EI9XCSlLu/wS9pVtEjOyf/f7IMQzWEnKwDehruqv6We42pWa
         zyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468341; x=1714073141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rg2JOTw5ouUti560CWKRK7poJqCPTKGwJpqCuG5tVqg=;
        b=g4QVqOgg0hLmQLQTk6ebPOncOi6HhV76OYp8l7huGxG7jfbLkN/VvRKTpObao9lGWB
         CYqI0RYXIuIcy6nyuzc/WrVMq1rPYI+xEJQFTcLUeNIcUUqoP7hjsTchKKmzS1HTayzP
         9ikGTkG0U8iQeehoGto7pwy95SOWV05yqD8BmwAFRN81bnxncmCDs8L74nOdWVyJclCJ
         60YMu0OQkYyx9WKXWG6lHQDk77Sn6mP38Krop8PE3eTQNdafqDutw9SQ7oUA69WvguDA
         ex/eKFyYVi/5G7+KD1sQUD7TcDJTQ+Op0PwKY6PiHmxj2WqjUkkmlAkPeD2zSUQHtgUK
         W9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCW2WZ4+S3gF89lHT7IAEWsy74wYLneFuc2LIFXgqgsqLH0tesZIBCrzLQHCAd2JlccnVUBAAlDYVydRBuZTcGAUT0iK2CiX
X-Gm-Message-State: AOJu0YwcAOkZ3qKH5kOMels/qqopgf+m5RUv3nNrKFheMfS9asyYnHd3
	docMmNCtZDlJbtn27hAJoxnLoi8MYS17lRYNporTOSKbrEZtmmFDzjpT49GwN56WfQ==
X-Google-Smtp-Source: AGHT+IGASUllNpo0Va0P2dkaALouSNHWQpdA0Wzw0LXpl6pAHWuJa2Joj8M3jDkvfPrz+ilPpgnX1w==
X-Received: by 2002:a17:906:2591:b0:a52:6cb2:9347 with SMTP id m17-20020a170906259100b00a526cb29347mr49043ejb.8.1713468341444;
        Thu, 18 Apr 2024 12:25:41 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id hx12-20020a170906846c00b00a5582324219sm68524ejc.16.2024.04.18.12.25.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:25:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>
Subject: [PATCH 02/24] exec: Declare CPUBreakpoint/CPUWatchpoint type in 'breakpoint.h' header
Date: Thu, 18 Apr 2024 21:25:01 +0200
Message-ID: <20240418192525.97451-3-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 1HO7xGQoZAWo

The CPUBreakpoint and CPUWatchpoint structures are declared
in "hw/core/cpu.h", which contains declarations related to
CPUState and CPUClass. Some source files only require the
BP/WP definitions and don't need to pull in all CPU* API.
In order to simplify, create a new "exec/breakpoint.h" header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/breakpoint.h | 23 +++++++++++++++++++++++
 include/hw/core/cpu.h     | 16 +---------------
 target/arm/internals.h    |  1 +
 target/ppc/internal.h     |  1 +
 target/riscv/debug.h      |  2 ++
 5 files changed, 28 insertions(+), 15 deletions(-)
 create mode 100644 include/exec/breakpoint.h

diff --git a/include/exec/breakpoint.h b/include/exec/breakpoint.h
new file mode 100644
index 0000000000..45038263e3
--- /dev/null
+++ b/include/exec/breakpoint.h
@@ -0,0 +1,23 @@
+#ifndef EXEC_BREAKPOINT_H
+#define EXEC_BREAKPOINT_H
+
+#include "qemu/queue.h"
+#include "exec/vaddr.h"
+#include "exec/memattrs.h" //MemTxAttrs
+
+typedef struct CPUBreakpoint {
+    vaddr pc;
+    int flags; /* BP_* */
+    QTAILQ_ENTRY(CPUBreakpoint) entry;
+} CPUBreakpoint;
+
+typedef struct CPUWatchpoint {
+    vaddr vaddr;
+    vaddr len;
+    vaddr hitaddr;
+    MemTxAttrs hitattrs;
+    int flags; /* BP_* */
+    QTAILQ_ENTRY(CPUWatchpoint) entry;
+} CPUWatchpoint;
+
+#endif
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5f0422493b..6f5a16e0fc 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -22,6 +22,7 @@
 
 #include "hw/qdev-core.h"
 #include "disas/dis-asm.h"
+#include "exec/breakpoint.h"
 #include "exec/hwaddr.h"
 #include "exec/vaddr.h"
 #include "exec/memattrs.h"
@@ -347,21 +348,6 @@ typedef struct CPUNegativeOffsetState {
     bool can_do_io;
 } CPUNegativeOffsetState;
 
-typedef struct CPUBreakpoint {
-    vaddr pc;
-    int flags; /* BP_* */
-    QTAILQ_ENTRY(CPUBreakpoint) entry;
-} CPUBreakpoint;
-
-struct CPUWatchpoint {
-    vaddr vaddr;
-    vaddr len;
-    vaddr hitaddr;
-    MemTxAttrs hitattrs;
-    int flags; /* BP_* */
-    QTAILQ_ENTRY(CPUWatchpoint) entry;
-};
-
 struct KVMState;
 struct kvm_run;
 
diff --git a/target/arm/internals.h b/target/arm/internals.h
index dd3da211a3..a7c5ec1849 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -25,6 +25,7 @@
 #ifndef TARGET_ARM_INTERNALS_H
 #define TARGET_ARM_INTERNALS_H
 
+#include "exec/breakpoint.h"
 #include "hw/registerfields.h"
 #include "tcg/tcg-gvec-desc.h"
 #include "syndrome.h"
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 5b20ecbd33..601c0b533f 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -18,6 +18,7 @@
 #ifndef PPC_INTERNAL_H
 #define PPC_INTERNAL_H
 
+#include "exec/breakpoint.h"
 #include "hw/registerfields.h"
 
 /* PM instructions */
diff --git a/target/riscv/debug.h b/target/riscv/debug.h
index 5794aa6ee5..c347863578 100644
--- a/target/riscv/debug.h
+++ b/target/riscv/debug.h
@@ -22,6 +22,8 @@
 #ifndef RISCV_DEBUG_H
 #define RISCV_DEBUG_H
 
+#include "exec/breakpoint.h"
+
 #define RV_MAX_TRIGGERS         2
 
 /* register index of tdata CSRs */
-- 
2.41.0
