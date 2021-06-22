Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp3219274lfg;
        Tue, 22 Jun 2021 09:16:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJya+bUgdzwPz6zRBC2ELEinovA+iU0rUSobYb7UBhU5MLwzlfLXyxVxeUICEoFLVzuo5Lz4
X-Received: by 2002:a05:6402:35c8:: with SMTP id z8mr6080252edc.348.1624378562857;
        Tue, 22 Jun 2021 09:16:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624378562; cv=none;
        d=google.com; s=arc-20160816;
        b=ih14YruQRgvVjHPqGHP+JvvJ5jM6jqrU+SPEE+q6xea0Bx1GANFdrL4OJjRcD6xTRU
         AeV69z5tfF7p0qBWGTG7CJz+cVg0B0O/KUZ/lk5XmXhlqA6zoeWxHqO/dPvoZyIrdgmM
         Wn+vhAycgiaZzIbTeAwXBahNIqYStMmKwegDO14/2dbQvfeaO6WH3eMDYZTCp80ucxv7
         TGYAt7c3KfHnAXwkglca1cdKseu7oe3zMlLJE/D1ZzIdBu/EPKq9bQkr5WQrqVtaJ7OK
         6nS1W6z8PPed4aY9Mcet4S9zad3zNYxzMxDGpSu2z96QhzMGXwa8hxR8RLArEaK3kzbB
         rhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=xMuHYlxTGpWZ/cCewwWXbER7wzi9x2/gcVq+Sqd5Dy8=;
        b=NjKoivO5IoYGFEY0W/dvkVLQG/i6+r9xRnbB/8j9iPcpqjzxjI7fEHcDCkQmWgAzc2
         e5V/rPcJ5UyGzgIzuEFbbQdFY17FxkiICuh8TdQMq2bzJaAYKEOSxENjlFpU0VFdDAZ9
         wq45a7/CkqA/b0JoZUrkgqSL66/hZgEBcq0P9U1xTS0H3CkckscUPd/Rt3t19QNG/BDw
         vLw3ag+eo9bwIOPPq+SPcTL1N5pl7oSC332MQtdURQGEGfVkZkj8VvWevb8Na2Jvr5/k
         v9CZ8b7B4lNCQG5Yv0SIZyoKtC/44QC2C/7gmVQVo87l4pkwfSBESZFpnS/2HWwsrr8K
         0XDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xe+wGRI0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6si13390353ejq.442.2021.06.22.09.16.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Jun 2021 09:16:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Xe+wGRI0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lvj4D-0003K3-M8
	for alex.bennee@linaro.org; Tue, 22 Jun 2021 12:16:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvj3w-0003Gs-7g; Tue, 22 Jun 2021 12:15:45 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvj3s-0005Bm-Jv; Tue, 22 Jun 2021 12:15:42 -0400
Received: by mail-wr1-x42f.google.com with SMTP id a11so24344893wrt.13;
 Tue, 22 Jun 2021 09:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xMuHYlxTGpWZ/cCewwWXbER7wzi9x2/gcVq+Sqd5Dy8=;
 b=Xe+wGRI0bNQDOKv8jdi9KT9Zbby66/Iigi9EGX3TG75Wqd9kurkGfIAWs+A0BHsnW9
 v3sy6BZvdAFsWVmqSsS+jZDhBzK7zNDZqs1x9gHCV231sH7bKtXLnCl/C7ljfjxShVAl
 GSVm9v/9dK1ModS5P5ZrNmpsXHHsgVemZOfnLkckS9tZdkWRNL7dBZbxGYM4W36xY5l4
 3r2d5tQdptVFnvv2vTQjiF5EWao1jx4m7YbozoJq+jV6zGjiDZRDwAhcr5D5c4AiCUXg
 rUWVBN91p6L+E4U9pTcDFzN3ylG4JKobOv48sxx455GSNM3k5gortE/EQW604ZE3ENFF
 Grlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xMuHYlxTGpWZ/cCewwWXbER7wzi9x2/gcVq+Sqd5Dy8=;
 b=k8E3Yhtdc/jF1gzJ5FKIzBm8T6nGvZF5gHGtz/OwAgPQmcCcsGQzFt0wPoPIn8C9bn
 5YCi+ammowLQza3HbwAIU9EANBnV0D8Y4vOPkI+djDgid5WVOtv2nVRN00YsdhhuuqIa
 UuCmpQ5rlTk16IeKVz46p5jSgFcXC6ExYzu3+M8z2P7c7I3CmPhAfF68QTGVw0hNGR65
 IPEIR8oEAUWzv6MqpnYpPv7Ds6cO5SyX47hGQv9qRRC2gNDxvHBBquKFAFNT1UqolYV2
 eg8lbMKMBRyKvJqXZ20VnIjFZmV47nEsGEih3fxNbeQBdsNpnVnd0XBYiu+eCu2ccX2j
 OwSA==
X-Gm-Message-State: AOAM5307IqNUaxQMiSmTRly1mVfc/ODAMLfNMg1LRt6PKXfUc4pHA2vB
 saWfFeb9SKRYrDnJCfBRF1+9MjJvYLxGSg==
X-Received: by 2002:a5d:4383:: with SMTP id i3mr5836138wrq.255.1624378537238; 
 Tue, 22 Jun 2021 09:15:37 -0700 (PDT)
Received: from x1w.redhat.com (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id i6sm16360929wro.12.2021.06.22.09.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 09:15:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] tcg: Avoid including 'trace-tcg.h' in target translate.c
Date: Tue, 22 Jun 2021 18:15:34 +0200
Message-Id: <20210622161534.602428-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RYwPstgrJ27+

The root trace-events only declares a single TCG event:

  $ git grep -w tcg trace-events
  trace-events:115:# tcg/tcg-op.c
  trace-events:137:vcpu tcg guest_mem_before(TCGv vaddr, uint16_t info) "info=%d", "vaddr=0x%016"PRIx64" info=%d"

and only a tcg/tcg-op.c uses it:

  $ git grep -l trace_guest_mem_before_tcg
  tcg/tcg-op.c

therefore it is pointless to include "trace-tcg.h" in each target
(because it is not used). Remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/alpha/translate.c      | 1 -
 target/arm/translate-a64.c    | 1 -
 target/arm/translate-sve.c    | 1 -
 target/arm/translate.c        | 1 -
 target/cris/translate.c       | 1 -
 target/hppa/translate.c       | 1 -
 target/i386/tcg/translate.c   | 1 -
 target/m68k/translate.c       | 1 -
 target/microblaze/translate.c | 1 -
 target/mips/tcg/translate.c   | 1 -
 target/openrisc/translate.c   | 1 -
 target/ppc/translate.c        | 1 -
 target/rx/translate.c         | 1 -
 target/s390x/translate.c      | 1 -
 target/sh4/translate.c        | 1 -
 target/sparc/translate.c      | 1 -
 target/xtensa/translate.c     | 1 -
 17 files changed, 17 deletions(-)

diff --git a/target/alpha/translate.c b/target/alpha/translate.c
index f454adea5e0..5fcedd85d36 100644
--- a/target/alpha/translate.c
+++ b/target/alpha/translate.c
@@ -28,7 +28,6 @@
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
-#include "trace-tcg.h"
 #include "exec/translator.h"
 #include "exec/log.h"
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 7f74d0e81a9..066d942b7fc 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -35,7 +35,6 @@
 #include "exec/helper-gen.h"
 #include "exec/log.h"
 
-#include "trace-tcg.h"
 #include "translate-a64.h"
 #include "qemu/atomic128.h"
 
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 46210eb696d..35d838aa068 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -30,7 +30,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/log.h"
-#include "trace-tcg.h"
 #include "translate-a64.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9e2cca77077..3a3ccc97eb6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -34,7 +34,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 
diff --git a/target/cris/translate.c b/target/cris/translate.c
index 6dd5a267a61..044e587eeb2 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -37,7 +37,6 @@
 
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 
diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 64af1e0d5cc..424ec3252ed 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -27,7 +27,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 /* Since we have a distinction between register size and address size,
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index a7f5c0c8f20..5fb3350c5a8 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -30,7 +30,6 @@
 #include "exec/helper-gen.h"
 #include "helper-tcg.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 #define PREFIX_REPZ   0x01
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index f0c5bf9154e..348fc6e844e 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -31,7 +31,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 #include "fpu/softfloat.h"
 
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index c1b13f4c7d3..5dfb08d49f1 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -29,7 +29,6 @@
 #include "exec/translator.h"
 #include "qemu/qemu-print.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 #define EXTRACT_FIELD(src, start, end) \
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 797eba44347..9895f7336c6 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -32,7 +32,6 @@
 #include "semihosting/semihost.h"
 
 #include "target/mips/trace.h"
-#include "trace-tcg.h"
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index a9c81f8bd5b..5db63d76093 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -33,7 +33,6 @@
 #include "exec/helper-gen.h"
 #include "exec/gen-icount.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 /* is_jmp field values */
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index f65d1e81eac..07d79acc08f 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -32,7 +32,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/atomic128.h"
diff --git a/target/rx/translate.c b/target/rx/translate.c
index 9ea941c6302..22a15ee11d8 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -26,7 +26,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 typedef struct DisasContext {
diff --git a/target/s390x/translate.c b/target/s390x/translate.c
index e243624d2a6..d7c7f37e363 100644
--- a/target/s390x/translate.c
+++ b/target/s390x/translate.c
@@ -42,7 +42,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "qemu/atomic128.h"
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 93127906237..1096817ee79 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -28,7 +28,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
-#include "trace-tcg.h"
 #include "exec/log.h"
 #include "qemu/qemu-print.h"
 
diff --git a/target/sparc/translate.c b/target/sparc/translate.c
index 4bfa3179f8e..f3fe7a03699 100644
--- a/target/sparc/translate.c
+++ b/target/sparc/translate.c
@@ -29,7 +29,6 @@
 
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/translator.h"
 #include "exec/log.h"
 #include "asi.h"
diff --git a/target/xtensa/translate.c b/target/xtensa/translate.c
index 14028d307d8..d5da35f4fcd 100644
--- a/target/xtensa/translate.c
+++ b/target/xtensa/translate.c
@@ -43,7 +43,6 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 
-#include "trace-tcg.h"
 #include "exec/log.h"
 
 
-- 
2.31.1

