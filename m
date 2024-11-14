Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp26039njc;
        Wed, 13 Nov 2024 17:14:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUbbgfkYeRMuQrjiCmCqfpHHWvrzy6cfVy09K6fE66MaOVz2+xHdozAglms7GjPSscUORtGndxQrsLZjA==@linaro.org
X-Received: by 2002:a05:6000:4106:b0:382:1854:c8bf with SMTP id ffacd0b85a97d-3821854c938mr180223f8f.12.1731546873215;
        Wed, 13 Nov 2024 17:14:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731546873; cv=none;
        d=google.com; s=arc-20240605;
        b=ZgMDFgzWxQlveA19+wpl7Eela3D4WlDSgrhCPUSQnD1DW4GqYFzFK7YIEjKwY5wWPr
         RSGf/M3s9AAB0Nn5HOgUvci4DJzBXvMkfzvJj4gTkCxIbg8CH7eNxHyork3sQmtZsrQX
         nMy5Oh19G9UbwqJQFSyDLiH2xwZlsv5323mg+Tj9dc77WUgznNtLGnL8n3f7OBocwZil
         /RK2xfZ7npZp05wpsSlwDulfMWZljZ7avI9uCo+64k1cM7RtL6i4dmD/CshhHUePre8l
         tGZJKJl9iWFk/kmB72A5sbvz4eQYlGRL23fogX5TY02rxMHzK+8Y2Jg3+qItEqpQKsJn
         f+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WwdhRXN0joprmzKwfGffR3OdfbOtF5yrdb8wFJrdlRk=;
        fh=N0SZXtDdsY6dB0Gu/DGPcSU9Ql/jlk2wydb2L+1iQ7k=;
        b=gD1x/Oy147yHmqI0hlqKOCQhLIWVUQalS2gwKs/XQMb2P5+F3EyvWoEtf+jcE6HzjA
         NIJgTkNKAHjqUcm978r5+1t/lKcXLKGYjaqrKjk31A/QI0z6pfRit9TLP6BxypzI+Kw8
         0kLUy3cmjETC5Gj4EAQPMBBvz1zJYJOZH2ucJdfqennvtLwOEE9aInRML8UXEpn3aakr
         xtryaJ7yrcP2hX7+5d3QyU6sezNzkPgkDnMvRXy/QywfUef5Nu8STBS6X/oIyBYuIyOp
         3JqqRR1fKil/Y6+Qqv+y+EIpVNCQtNZsn+b0pynBLzGW/Lpk/GtKSUV+R2Fo6WiBiq+R
         0/kQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XCxApTEy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-432b0baa297sor60749655e9.11.2024.11.13.17.14.33
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 13 Nov 2024 17:14:33 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XCxApTEy;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731546873; x=1732151673; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwdhRXN0joprmzKwfGffR3OdfbOtF5yrdb8wFJrdlRk=;
        b=XCxApTEySgY9Z8sy/U6IHCWdSvA3e8byGtdOOxopMg1DwYxWdjDSTZny/zwAfxMPkS
         nmBvSohxN41mH/AQY9gbW1B2M66i/ndFy3XVBSqELpzWpWkHGi2cclyYUMnN2csYKmPm
         OmuM8+zK2H75iU1SRO9X6FGU6RU/u7Vtk+FT7iTi81SsSJTdvrl5Q9C0zWCCyFYiWAJQ
         2feDJebmjZoVcXg9nwQB9E0ZknLQ2PPqOZiS5Gll0o+Za9Fh21w9FfgGU07zuWvWPHV2
         imJ4fU94JkRoJJVj0CpXl4OZ0znd7LP5EW59UrLzD2B/Y7K5DgIBbqNVT/JupT5lGoCN
         +xnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731546873; x=1732151673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwdhRXN0joprmzKwfGffR3OdfbOtF5yrdb8wFJrdlRk=;
        b=gn43NGjpz9BFvRqmXjQQL3fVO+T3/2kAiQ/DKpVZru7Ch8WtXzp5QU2cck0ggcPwXH
         lrX+ATHLeA1sh2BS3JlSu+ss2D5ew3SwP0MQvv1l6LxmiElykfHSZznds3+guYwid5hU
         IV9qCKTLaNZBn/Aj/yhkybZqAXkqLBr9wVW8VW6Hgv/8zxcUlhSWW9230d6IlVPrWpZd
         AOVvevEJL/3hiffU54hvSQHCaJW0REFSpvqm8N87u4qTQIPsSuyxKTAzJNsgnrBWNSLw
         xPIuGB+Dip9OgfGjKV2o7jNFBgUaHJYa05fLeJyZY/k5YxE0mtLcArPR4K75xQUsqHKP
         mHyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBgqxUJc7WvZQIWWqSKO5cGD556le30JYUHE5u1aPQH8w7mtEkYYcvX3lBfaNKKp6Yesep4fUsyPtgqw==@linaro.org
X-Gm-Message-State: AOJu0Yw61UFWJUTOacww70yi4zH5iYoiq4aiaX0DILYEofV0AO/b6wxy
	Vsgqv0FVhmyyQU2a4DVHnmBt/bbYK2/70csGBhIJKXHWjCvCCIyiHGe5f3iqR1PA/A==
X-Google-Smtp-Source: AGHT+IE3ms5xpjQHGWXmVlg3v8W+KzlHKEnbriHG+Xzyq9cJJh/6mR5hbnlsDRfww5BsPv6tn+pTYQ==
X-Received: by 2002:a05:600c:1d1c:b0:426:6308:e2f0 with SMTP id 5b1f17b1804b1-432da7cbcefmr2174995e9.26.1731546872750;
        Wed, 13 Nov 2024 17:14:32 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain ([176.187.209.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d48baa42sm33170825e9.1.2024.11.13.17.14.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 13 Nov 2024 17:14:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/24] target/arm/mte: Restrict 'exec/ram_addr.h' to system emulation
Date: Thu, 14 Nov 2024 02:12:54 +0100
Message-ID: <20241114011310.3615-10-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241114011310.3615-1-philmd@linaro.org>
References: <20241114011310.3615-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: EZJW/HLhkfMs

"exec/ram_addr.h" contains system specific declarations.
Restrict its inclusion to sysemu to avoid build errors
when refactoring.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/tcg/mte_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/tcg/mte_helper.c b/target/arm/tcg/mte_helper.c
index 9d2ba287ee..b017b26d07 100644
--- a/target/arm/tcg/mte_helper.c
+++ b/target/arm/tcg/mte_helper.c
@@ -23,7 +23,9 @@
 #include "internals.h"
 #include "exec/exec-all.h"
 #include "exec/page-protection.h"
+#ifndef CONFIG_USER_ONLY
 #include "exec/ram_addr.h"
+#endif
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "hw/core/tcg-cpu-ops.h"
-- 
2.45.2
