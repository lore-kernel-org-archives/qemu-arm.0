Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1953219ejd;
        Thu, 18 Apr 2024 12:27:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKfwNxPq/oIfYmG2a4omNUGJK/mVnJJu3a+WGuRfp77ffCd1vVnwrwE3cQ85NJXHh+Ls1fYXrfbxA7Txz18Yj0/ra0hSEC
X-Received: by 2002:a05:6512:328e:b0:519:461f:b98 with SMTP id p14-20020a056512328e00b00519461f0b98mr8461lfe.17.1713468476836;
        Thu, 18 Apr 2024 12:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468476; cv=none;
        d=google.com; s=arc-20160816;
        b=Poi1Bd+fBvNawF85mrYchJU3nL2T8bN1UWAyAx0JhVR/6MQBch7FWu7DylUR0/pmXl
         c681FoD7QPhdE0qHq6EbxUlYyQ7sSmAVzYF/pwqKBLJx1D3DnRLD6XQO59Yp9iAKUMOj
         eC9OAUd0irfFpV8KikO4r58BF6dmJfimyRDtJIs9/VbprEZwyu89Tfd2zRk4y2+qzKMX
         INRo/slEZ4XGhB+DTea/gEEHHxQJLTXnVGodf9WvfOWGJ42R7TOZEG4+9WwvuTyCY18D
         B7WfoqRe0NbzxU/b2/FP65LzgdkKcnd2Hh1Cx5GXVAX3Ph9TPOFIkNUmiRTWari/IoMu
         ryoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/V78U8y8hgVchZketDvNFCqr9+uicpA2z97iCqadZGc=;
        fh=FpNfz9Z9Umjv1FcHIXo1JNXDauK1Gv1jAHGIWRJXMPI=;
        b=ouESko808cO9WLzdnVp3mfPi4cE6GFsgKI5jQHqWjX8I56EyVTHDmVdHhLPYOU9rkj
         FB9KBWU9iFQjAnlgFRSyTahuPIPb9THISqlsizbE8Rikdhgw+MIUVPhOIcnanm89ncGu
         DLoA3LActQUkmVUUz8ZkXFhwFdV402aAQEzs5OAoaWXAVJektkUkfejl7BllsjDl7Qxj
         /hkO049iJGex6m9gjfHA9v6UJAIu2k3g9ESIkg5RH/fQFxLTYohjaWeqNY+uhGHW9o3X
         s7VY0JbkShDoUnO3JNYy9meM79YOz39+no1w//csbVMugav0+4xyEJDcX6liU1xDxjmT
         mtTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EFIVUFX9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f23-20020a170906495700b00a55637f88a4sor312873ejt.9.2024.04.18.12.27.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:27:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EFIVUFX9;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468476; x=1714073276; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/V78U8y8hgVchZketDvNFCqr9+uicpA2z97iCqadZGc=;
        b=EFIVUFX93IOjXnFla28275O1eUNVrsYOKAm1ZG8G/0TR6sfSxJFDU8z0VwWXyhzYuG
         xwctPp+sGC7Kh12H33XyIxwQKQvUs++aifCDTnDY5ahqzWuKfWXKyPK5lzzitdqjb6SI
         gMryMIoHwjGnCxF6nPHtHaNXeIPrrwRU8uD7luzmHczKLelPJH8m1G/2Fj0CwzILLJ9m
         IdC7TqQKRy95jwOCt8vB/DUIFVEWMmsUbyEQ8vpp5ypJ6TIlUoy1hLJiKHA1DJsZ9o9R
         65V1UWH3cpyZDIBoQupqOEWcDs3iXu/A+4MBAjeUjopevAOfvg1xbZ4/XGpPi6awMlwt
         PETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468476; x=1714073276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/V78U8y8hgVchZketDvNFCqr9+uicpA2z97iCqadZGc=;
        b=N4B3ylQaryIHg46MWiT22ZzswkoKrWe1vGe481My08x7kuFJtmbnIYBj/Ta+fnFvTy
         0G3PsI5qBalfABBKmx8pCb5VYX7ESf0v3hTkhJHSBGBuwMC/RRkvXOseL1+ro8IHO1vs
         X7CC+QXLIkvxn0GF9Bjp+1dy1H7QrVHQWk7RVwJIaqYMNCVBoQi3+p7gcQL3ckrUvotm
         Wk+mfTlKKUCvo3jOwTlJfacHgz2xzptUpae47y0S2AoVd38sVDSiCoCxX64r9C8Oooig
         urMAzRGCIwt3tnMLAzNwp+Pq1/bJOdQqdL+iTph9tEpmoaL/jYo2iSU7k1WqwNfzMmO5
         tCWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZh4i278x6OI/ABAGyvUZsKDBDZEz+axkKp/xGxrDl4+piBQDHwOwt4kFQmC+lJA149rgRvQSUoP81BbrFQkx1Jx5DAn9r
X-Gm-Message-State: AOJu0YzyBwskf3t3izjvrhKZAQVcPDYVUk5zyImNTWIaeykeE4FDL2g7
	0sZq8qkA/vFZQ/9NPUfkMK+Do3KB1X28Tb2z1SwibDJ68sHsxP73bJNpf0Wp4/sDaiObe4abBEE
	m7NI=
X-Google-Smtp-Source: AGHT+IHrcqo2UHAx8u+9jCAFEincYHzZAP1Wb8pNWMNf4c7FJye8uQUKnPM8ZPTzpZx3xyIVm80lkw==
X-Received: by 2002:a50:cd1d:0:b0:56e:d54:6d63 with SMTP id z29-20020a50cd1d000000b0056e0d546d63mr104698edi.15.1713468476332;
        Thu, 18 Apr 2024 12:27:56 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id fe7-20020a056402390700b00571c16323b4sm736740edb.48.2024.04.18.12.27.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:27:55 -0700 (PDT)
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
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH 19/24] gdbstub: Avoid including 'cpu.h' in 'gdbstub/helpers.h'
Date: Thu, 18 Apr 2024 21:25:18 +0200
Message-ID: <20240418192525.97451-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: n0NcCskEr3n8

We only need the "exec/tswap.h" and "cpu-param.h" headers.
Only include "cpu.h" in the target gdbstub.c source files.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
