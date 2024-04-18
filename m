Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1953430ejd;
        Thu, 18 Apr 2024 12:28:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQhTtJWNSK3D7iMKwSQSU5shZeqN1nlTbzZc/QY2PRJAJFjTDRkONpOgAVEnUCx006Jxun9Ny8UswR4bfAGII3vd/jG5bY
X-Received: by 2002:a5d:66cb:0:b0:345:72af:769b with SMTP id k11-20020a5d66cb000000b0034572af769bmr2055135wrw.38.1713468501427;
        Thu, 18 Apr 2024 12:28:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468501; cv=none;
        d=google.com; s=arc-20160816;
        b=PxQDNx1vBytQHXf/61WQAb1W3oTclgPplv5ZrZ622O9lXsrq1WyaU/CaB5PHHa7WSi
         oW5i8D8poaC+YLPsnEHpzUGUmI1yBZ6l0qLlgbZwJA+VTpIvkfUJGr73L0W4KyVC45TL
         FHQp4yiJZTRHiht4rFsfwxcgfnMLY+VLtjVQstckjQ4xppxq8Q9VFJMe9ETZdkWMt5vG
         MIEFWKlPR+p4CAB+p0VTsd6cwBLGDvpfTG3Ebq/8N0ZQ4LFJbZNlhy8DgFpXB8M+EzX+
         jN2pEP9VpsyWtcRMEygsyZgPl7TPCYUij8H2KP7NPOXz8s62cvdk8QRZCkHyHSjlg1IO
         g4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/Yz7aRuiYxkABVdFEv0r+XjMMhiAPKgmd2KiD0xHfQg=;
        fh=/VBiZgOPMAqK40420XRZz61RVOeUJ/sOwvJjCd17emk=;
        b=TrS2Uk1B6QsEYc1Ge8iDhRHnWE/DHnbDmTLOpoqPe5sun/WgoByvgWFEH9qq/k5koM
         zIg97omVDnwyiOiFfDUVieNExDe1J0c75bZx3VA8gdie4WA+01S5LVbhaR3WgthcRoLt
         T0tJg7YTJ/8NMxTuDF6EQwyaFM5ckd5b6IzG9KOtV2SwO0nYCAjaQKIrz2x1dXWRFviQ
         kvmXE6AJjPVwjJnYM1PmT45YyJoO7eR7SCUjMdYy4YNxCrHZAb4RnWh7yXvlS7hrURqj
         B0xnedRRgnj7cD/XZb+QU00Hdg+P2ndX38DQM/CSZYXDgyDytHs0adV2VzVZTMZYLrTe
         h9qA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FrPfydU7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u17-20020adfc651000000b00341b39311efsor715315wrg.7.2024.04.18.12.28.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:28:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FrPfydU7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468501; x=1714073301; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Yz7aRuiYxkABVdFEv0r+XjMMhiAPKgmd2KiD0xHfQg=;
        b=FrPfydU76NDDpN9gh4TGPYGuJ60sfzpowaIBRmehEPHOGfWre7oEeE7KksLnIU+cwx
         yoyhGOf/MgTyKJH81fliT3ZV9x8ShwwrHbTvCq8duW+aNcNGjrTTkTHGpgUWXV5HxuQD
         86+LIUzLHnGciytG2L3OqH3y+/iQCLEQEbwU7YhODWXO1kFKcEQh6mg8HdN+UXkl4Jb6
         O43KVkH9y8gXnQNkDbtWQYU9dydPiObFBlefrDakqgUQIdCSoZpZAKYCA249jGwiLWDG
         Z/Qq+uKbRZFYYjJ9Y8eNCxRdNxuXZjSWU8fxxBHAJ7r5YJl16RJTHfpMw/l/KuG9FrEB
         GkGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468501; x=1714073301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Yz7aRuiYxkABVdFEv0r+XjMMhiAPKgmd2KiD0xHfQg=;
        b=CUUwTPvemL+EpQkbhaG8M9Kox/pfVBMlUARbpudoHYUwGwepA3TR7iH9qRT99ZfgWG
         68Eewtr7M0j0TxLQsy2pzjej+ac59MACgpoKsLv8puOw+w03oz0Z8uKfqhfVMWecXhJi
         V/MaTWjANvTb70dht7e3r7/9PlAiA/zszGKRXvEnRIPmJAw3FdoTxYUZcgQTgMCpv4Sj
         DnKFdhyBob4lwBA/oLJpkJh/frP26KYdzmr5iXeTgAmSuLO+HDAR2GKYEAjCEicL9INW
         px9N9IOn1ascj38MsEqhJbfYwgKORha78N7pAn20zk951yr+lmHoTR61IMkHDP4nuIlW
         ZidA==
X-Forwarded-Encrypted: i=1; AJvYcCUsuk/LcJNV6V/U01XuyvmiuVDNqOtALJnKO0vNnexOI/WIxbu2YiUUQAQGEJ/WZve/w8gVVY1UPcl4zYExg/BT7HQrTJE3
X-Gm-Message-State: AOJu0YwqiYX42P8xDns1tutQ9ef8lqd98y4BhJ2K1YxhwcnCo77lejn1
	mQuYHJTNTmTlhvs7Bk2sX4EHT0I8F0FGiGxJyM2legpTFTERDYGCvgYAMmG5ltgI3w==
X-Google-Smtp-Source: AGHT+IE562H6bYcdnvQhGKG5MNuVHbGU/S9+AnWWXJN4YRjw79fzPiSU1R9hf/G0jjN+LtZRXHV9Vw==
X-Received: by 2002:a5d:64ca:0:b0:346:44:3910 with SMTP id f10-20020a5d64ca000000b0034600443910mr2930235wri.49.1713468501071;
        Thu, 18 Apr 2024 12:28:21 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id u21-20020a1709064ad500b00a47423b4c33sm1256988ejt.128.2024.04.18.12.28.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:28:20 -0700 (PDT)
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
	Michael Rolnik <mrolnik@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Song Gao <gaosong@loongson.cn>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [PATCH 23/24] exec: Remove 'disas/disas.h' from 'exec/log.h'
Date: Thu, 18 Apr 2024 21:25:22 +0200
Message-ID: <20240418192525.97451-24-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: uZQZWJ9LlIA+

"exec/log.h" doesn't require "disas/disas.h". Remove it,
including it in the sources when required.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/log.h               | 1 -
 target/avr/translate.c           | 1 +
 target/hexagon/translate.c       | 1 +
 target/loongarch/tcg/translate.c | 1 +
 target/rx/translate.c            | 1 +
 tcg/tcg.c                        | 1 +
 6 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/include/exec/log.h b/include/exec/log.h
index e0ff778a10..ee33981aab 100644
--- a/include/exec/log.h
+++ b/include/exec/log.h
@@ -4,7 +4,6 @@
 #include "qemu/log.h"
 #include "qemu/log-for-trace.h"
 #include "hw/core/cpu.h"
-#include "disas/disas.h"
 
 /* cpu_dump_state() logging functions: */
 /**
diff --git a/target/avr/translate.c b/target/avr/translate.c
index 87e2bd5ef1..b2005f3cbe 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -29,6 +29,7 @@
 #include "exec/helper-gen.h"
 #include "exec/log.h"
 #include "exec/translator.h"
+#include "disas/disas.h"
 
 #define HELPER_H "helper.h"
 #include "exec/helper-info.c.inc"
diff --git a/target/hexagon/translate.c b/target/hexagon/translate.c
index 47a870f42d..6bec38404e 100644
--- a/target/hexagon/translate.c
+++ b/target/hexagon/translate.c
@@ -25,6 +25,7 @@
 #include "exec/translation-block.h"
 #include "exec/cpu_ldst.h"
 #include "exec/log.h"
+#include "disas/disas.h"
 #include "internal.h"
 #include "attribs.h"
 #include "insn.h"
diff --git a/target/loongarch/tcg/translate.c b/target/loongarch/tcg/translate.c
index 7567712655..ae87a68c69 100644
--- a/target/loongarch/tcg/translate.c
+++ b/target/loongarch/tcg/translate.c
@@ -14,6 +14,7 @@
 #include "exec/helper-proto.h"
 #include "exec/helper-gen.h"
 #include "exec/log.h"
+#include "disas/disas.h"
 #include "qemu/qemu-print.h"
 #include "fpu/softfloat.h"
 #include "translate.h"
diff --git a/target/rx/translate.c b/target/rx/translate.c
index f6e9e0ec90..4259ad6d74 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -27,6 +27,7 @@
 #include "exec/helper-gen.h"
 #include "exec/translator.h"
 #include "exec/log.h"
+#include "disas/disas.h"
 
 #define HELPER_H "helper.h"
 #include "exec/helper-info.c.inc"
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 6a32656cd4..e7e0ab6846 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -51,6 +51,7 @@
 #endif
 
 #include "elf.h"
+#include "disas/disas.h"
 #include "exec/log.h"
 #include "tcg/tcg-ldst.h"
 #include "tcg/tcg-temp-internal.h"
-- 
2.41.0
