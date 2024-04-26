Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp636625ejb;
        Fri, 26 Apr 2024 12:42:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUHI8JxNq9GR411HFOTEZHcJGZpfThPqjzIKk2LX3s2zYueqmYnS5SuSfJiiJlCs0g64+g8dubPK9/WN/+AaR+hQ0bt1NCs
X-Received: by 2002:ac2:5601:0:b0:51c:dc6:a1cf with SMTP id v1-20020ac25601000000b0051c0dc6a1cfmr341412lfd.34.1714160571262;
        Fri, 26 Apr 2024 12:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160571; cv=none;
        d=google.com; s=arc-20160816;
        b=Eo1SNe3GnnE1upkyIe58B8K3jUoWzRVdLHfm4sN96hC3/uUXayY4eUf9ssaNfhSQO8
         Hn56hPScUKqvPIA3956yYrqn8Q1vAl5Q0MmtI9mwhYVfnlqjn11KoaakjT8rMnBkeMgd
         Zf5sG8SfMcf2UbsOPnYBdsTnaFQtXMT+21fdmAjY8OjDSfM7dMMeYwBFLlKZyAi9dyV+
         GTKtexPb50KZd8kX1FBby3oHxLkqYXtiUZCGgdD+N1wjaOa9GA4g/3c2+fymL+g5kLXi
         XIOJabfQ75Ql2fX7VFSeuGpQz6TEl9Hv2YBbrtgN36oDBQ3xlRnZWy/du4QEFq/7fQ2f
         ySzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=XHpChPLpjXlPm4sz2ZPmxjIjHGSHb3jC7Cykk4D98j0=;
        fh=79xppqjdWBh3jPU49rslql7e/dDa8QEu0mIwWGLhlq8=;
        b=w/hi6uTZLo2p2MetLspVIn3YMRks+6eBuq3IyankBw6fGyn1wtX3CBQiJRQkRmyyAK
         G68acPHibC4zOabmRDyBoUFJDA2Sk0PzbEbuOs7b8VJ8ONcsitL4+k3fby7TOVR31cHP
         FQgLIvi7nQtjFay0b7asMESkgPxwKP/DVu8Kkky5Kjm4g1IK1Ilrnikpkb3GqEA95YkC
         lknWkeIikHrgpZPf4pwz3toSVKkwOCugpZnU05zidKn6X9Kiil8DfBQQkCsiYN80pyRr
         fMVsSPqIOhOCCxqJUeJ5oXJlgJMR4WLSs/UJtIZuqV3bsqV4PbkR07/iqFB+kPDW8QB7
         rPWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pRboA2vo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t25-20020a17090605d900b00a55ab2661d4sor3720319ejt.7.2024.04.26.12.42.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Apr 2024 12:42:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pRboA2vo;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714160571; x=1714765371; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XHpChPLpjXlPm4sz2ZPmxjIjHGSHb3jC7Cykk4D98j0=;
        b=pRboA2voW3bRODydAwR/Npy9nR++bgHL83tDRiwxqI6aCWQI4XBlgLo36LRiQa30I5
         K8m5T7jmAsvub9amLWFelkmJSTfdamIWHukxiU0MbkN+FUDGlLEiy0UANW8kqm1Yo5oN
         vVbLWEbdmsm7+B0RkSq+F6oAkrvZum+sdO/FPUq9Yi4L3+TmZbXQM3h10dcBo4EEDbqS
         cEMI7d2IiTBXHFXTce42VmqmSaPnyJ4PMwgC/3flCx91qrRPgFvzLCbVNoUPHU1uenyu
         CahIwstMzkpUoR8U2eYFYulFSblEGkvfaYW4nTwgTuL0v11XmuHvdtYNvkynOvGuQshL
         3ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714160571; x=1714765371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XHpChPLpjXlPm4sz2ZPmxjIjHGSHb3jC7Cykk4D98j0=;
        b=P6iQa6Tqz4TNGcCZAFtCk92avY/oDbw0unbJgKOnOk8nvyeFE394/8A+7PpmnMb/pA
         UnP3DxdJGmAqirDBJzUFmmKqqIKRY4ckQSK6mtAUgD/XCEvs0vRMnXNaXw4hlTI1y7FN
         j6Qd4DPFMZ9p0aETEkwmZNc/0KGYJLFk+SU7FdvGR9aijY6y01EYyvcZLkKeKshqRItN
         RPa9OdjdIOOBL6WBiC5HIjTF6oP/PSRkxc7hohGFYvvfu8KsWX/lIAab4GB4nvQ8Cssd
         PSOcGEIvhBOw2H4dcwnEkkInk09m2dHZFVfh5Y3zKbGMqGIkhPVNu5TNqix5YZ0sdEWM
         GZ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUff0y7KdZPU+sy8zVzpk8pGTgrvztACKZcIrtqTR0qjjY1x2kkSbowitQhmluNXlW1BwjGZxPakRM1EK6jKYdO7l5E6uA4
X-Gm-Message-State: AOJu0YwFvtjj5pmvZfq7ziXWnKhTy40uZxHBj3Q1unOGcBBaYsA2brZ2
	7FZyAEnDAcHqFmIFZspkY1uuO9h+e+yrygRUsFcgN2K2reQrcSuqRzlfpne6MHGw/A==
X-Google-Smtp-Source: AGHT+IGbNeMhzgN98z4dLatfRNgzD4JoCLYAUAAa0SGI/fSgo7fYEHmK/xLWoyE9mZAyJiPl+fFwig==
X-Received: by 2002:a17:906:27d0:b0:a58:7470:21f3 with SMTP id k16-20020a17090627d000b00a58747021f3mr322493ejc.28.1714160570950;
        Fri, 26 Apr 2024 12:42:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr. [176.184.11.147])
        by smtp.gmail.com with ESMTPSA id t11-20020a170906a10b00b00a5244a80cfcsm10944860ejy.91.2024.04.26.12.42.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Apr 2024 12:42:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PULL 08/38] gdbstub: Avoid including 'cpu.h' in 'gdbstub/helpers.h'
Date: Fri, 26 Apr 2024 21:41:28 +0200
Message-ID: <20240426194200.43723-9-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +qtQlX0C80HA

We only need the "exec/tswap.h" and "cpu-param.h" headers.
Only include "cpu.h" in the target gdbstub.c source files.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240418192525.97451-20-philmd@linaro.org>
---
 include/gdbstub/helpers.h | 3 ++-
 target/avr/gdbstub.c      | 1 +
 target/tricore/gdbstub.c  | 1 +
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/gdbstub/helpers.h b/include/gdbstub/helpers.h
index 6277a858a1..26140ef1ac 100644
--- a/include/gdbstub/helpers.h
+++ b/include/gdbstub/helpers.h
@@ -16,7 +16,8 @@
 #error "gdbstub helpers should only be included by target specific code"
 #endif
 
-#include "cpu.h"
+#include "exec/tswap.h"
+#include "cpu-param.h"
 
 /*
  * The GDB remote protocol transfers values in target byte order. As
diff --git a/target/avr/gdbstub.c b/target/avr/gdbstub.c
index 2eeee2bf4e..d6d3c1479b 100644
--- a/target/avr/gdbstub.c
+++ b/target/avr/gdbstub.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "gdbstub/helpers.h"
+#include "cpu.h"
 
 int avr_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
diff --git a/target/tricore/gdbstub.c b/target/tricore/gdbstub.c
index f9309c5e27..29a70051ff 100644
--- a/target/tricore/gdbstub.c
+++ b/target/tricore/gdbstub.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "gdbstub/helpers.h"
+#include "cpu.h"
 
 
 #define LCX_REGNUM         32
-- 
2.41.0
