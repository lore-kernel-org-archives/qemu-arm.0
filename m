Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492042ejo;
        Mon, 11 Dec 2023 13:20:45 -0800 (PST)
X-Received: by 2002:a17:907:6d1d:b0:a1e:eecd:6f88 with SMTP id sa29-20020a1709076d1d00b00a1eeecd6f88mr3154409ejc.77.1702329645623;
        Mon, 11 Dec 2023 13:20:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329645; cv=none;
        d=google.com; s=arc-20160816;
        b=htjj4rvHkJH/GZQJtDXTUsGVTLJ4Q3VV5gWb8mzhwJ0hPpGEEkLA07uoqMKdZCPhLY
         7PQnf4v07YogLOx+vH8ovv5nnV+ZjlYuKg2ML+IjnBvgCv3gAb62O9pEDISlsXyy4GFl
         lhr+mC1T/1GHkOEM4l9jDXP84Zg1T2a9oJgNRM01p+5LUEN1tH6yr+9CjcUJk1GUylgf
         7Z/ur28Wc4bFZn24jV/oeVqYIYqt9ZXkhcs5S17YlD8VKeLkebiI5tflyAiQzzqSdxjh
         wvA4Halg3n1OeG3b1RlMMdluJDhDm/Jac8aA3gB5tJcXyAsZ+0KJ4ncTij9CjltHnf9I
         Y3NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+33Nr6gIzIhUPCwLsBvRZhZAyU1ywCj1cKlsVdoDYyo=;
        fh=FIFGVIYXk9KJtQPgL9lL2Fk0MJdNDskMwQ9IfapQKgw=;
        b=W98WUjzUblrK/E7pheP4GdUfyJNN9GYcR95MqP2nOOklz5vJ+MoMyEdIIJQqessKHo
         +20NLRSRFKd7Wbgjztch9FjhlAoP4gSmMcbbZs0OPvYeXWcZ0qr0uwbgt2M4lkEsFHmD
         J4vSM3JqoEsRkYRcRjACpMytsbEu/VWtSUHhfhmpepmsUvkoItV/GsSZEzWohvat3pf0
         O66I7mj6S+g5pa249QUduLgNl6Uyx5MXfztolQMSmgtAxO6D84G41FGcJtY2zMzrM1IL
         LXu8a6FsjsSBR3pSO4GdQwmjeld7UvHy9W5KeeP+eP+JRp5AEmzRTesjFUpaLR23lA4h
         sqRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q651UpTi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jl19-20020a17090775d300b00a03470b2d25sor1789263ejc.3.2023.12.11.13.20.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:20:45 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q651UpTi;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329645; x=1702934445; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+33Nr6gIzIhUPCwLsBvRZhZAyU1ywCj1cKlsVdoDYyo=;
        b=q651UpTiXZ24hzL32OgKhzC3+PLD5drFY5fNnaAZC9BnLEV0R7eN5MX9mxNj4d87iL
         2FZcLNwQvwfJzSDQ04+Yi1RIzsezEJQDJjIbVA+jWDDGd1GMnARWMw57sGiDbdBFJ1Yk
         TKEAusqMEPaGGl6yxwEO2BjvNTLP7DMU26rz0/FTBt/OPR6UqZ5rPXlhQs3nBZHxWPqZ
         vmSYpLImlnRwQ5aNo26Ap2Il41qwy+sXFyIG3i+ImZorJqHN9uh97LA7wThf5Tym0YkZ
         v3xdkxzGugLYr/ZQbDaOLmalexULMsG1phURBavpzUhVwaaJC9XVqJa3G4W6+W3GZJ1/
         VYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329645; x=1702934445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+33Nr6gIzIhUPCwLsBvRZhZAyU1ywCj1cKlsVdoDYyo=;
        b=qBgaR9vHCBf109sUk+nyiQ57eN2+ZkNLRtE3Jio2N8W9O7utAfq1Yo1n5qr/1FcmeL
         8XPsA+74rmpojPIhfRAIfpvRYVpSbn4gIw01FuM6PYwKbnj4Xhw/hSNuTYFghhU/Fi/G
         NMzeoDCwIBoYpg3FbgDN8cKmViPH/DvLPLtgA0Lw3nVKjQlxAiCSVuyndvGT+CT8j6iR
         X9U9YlFZxKt+xUXpHYmY4oOVCYdNk+nh3SaVEOxiJQ/0YiqT9Ql6tcZwfebpn1VlIB2h
         +NlfVW2Qtl9HaCBzrMp33p/78j6E64dhSEUn9okLpwuNWeKEeuDhl3FWye7npNduyJSq
         sZ3A==
X-Gm-Message-State: AOJu0Yxgm7Nhy3NSirHlSzqlN4qnn8U3d6bxDl/zJht8aIXXFADv24TK
	wohKCgceDCD4MNAKcaXdTEgtazIl
X-Google-Smtp-Source: AGHT+IGP260sklW8SrHdq22yOUtbknlqztMe93MGgqTfX8ATVzXMGH+5zD2rskJoqWCw5Df+cqNKpA==
X-Received: by 2002:a17:906:20d0:b0:a1f:b493:f725 with SMTP id c16-20020a17090620d000b00a1fb493f725mr773668ejc.106.1702329645408;
        Mon, 11 Dec 2023 13:20:45 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id rf20-20020a1709076a1400b00a1d1b8a088esm5331661ejc.92.2023.12.11.13.20.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:20:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <eduardo@habkost.net>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Warner Losh <imp@bsdimp.com>,
	Claudio Fontana <cfontana@suse.de>,
	Brian Cain <bcain@quicinc.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>
Subject: [PATCH 04/24] accel: Include missing 'exec/cpu_ldst.h' header
Date: Mon, 11 Dec 2023 22:19:41 +0100
Message-ID: <20231211212003.21686-5-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4PfuHB95godH

Theses files call cpu_ldl_code() which is declared
in "exec/cpu_ldst.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/translator.c        | 1 +
 target/hexagon/translate.c    | 1 +
 target/microblaze/cpu.c       | 1 +
 target/microblaze/translate.c | 1 +
 target/nios2/translate.c      | 1 +
 5 files changed, 5 insertions(+)

diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 38c34009a5..5b019a0852 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -12,6 +12,7 @@
 #include "qemu/error-report.h"
 #include "exec/exec-all.h"
 #include "exec/translator.h"
+#include "exec/cpu_ldst.h"
 #include "exec/plugin-gen.h"
 #include "tcg/tcg-op-common.h"
 #include "internal-target.h"
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 666c061180..744dc4fc3f 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -23,6 +23,7 @@
 #include "exec/helper-gen.h"
 #include "exec/helper-proto.h"
 #include "exec/translation-block.h"
+#include "exec/cpu_ldst.h"
 #include "exec/log.h"
 #include "internal.h"
 #include "attribs.h"
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index bbb3335cad..91d7cd9061 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -28,6 +28,7 @@
 #include "qemu/module.h"
 #include "hw/qdev-properties.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "exec/gdbstub.h"
 #include "fpu/softfloat-helpers.h"
 #include "tcg/tcg.h"
diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 49bfb4a0ea..1c9a364c2b 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -22,6 +22,7 @@
 #include "cpu.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "tcg/tcg-op.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index e806623594..a74eb6909f 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -25,6 +25,7 @@
 #include "cpu.h"
 #include "tcg/tcg-op.h"
 #include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
 #include "disas/disas.h"
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
-- 
2.41.0
