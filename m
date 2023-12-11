Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp492990ejo;
        Mon, 11 Dec 2023 13:22:43 -0800 (PST)
X-Received: by 2002:a7b:c451:0:b0:40c:2f84:599c with SMTP id l17-20020a7bc451000000b0040c2f84599cmr2336357wmi.134.1702329763017;
        Mon, 11 Dec 2023 13:22:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702329763; cv=none;
        d=google.com; s=arc-20160816;
        b=rT14594O1cTtlP0Po4gzco+LLgUMl8xVGX08HdC/Mpt7MvEp427TyGqkgIqzUGHyuI
         yG9TEX35csGqzJyozxzMPkIy1HYI85a9ZBLcvk6CPGQt9AaUCFPn4b2PzfgPwFdLz0d9
         bVO0LslZ6eDn6Vqt33IoJchqh0KFYFCXr21tPt2DMpMo7sQod5gncbtGFfA17TGR+BqO
         EgMhEhf+dj+ziP/5P7TNCMWLSfRa4KW+mGw06v5CSRFr7Anb9+WziemSIHbCdcmrib6O
         L9HyUaZF9Pj+QSexBNo8BFwwJ/KiT1vWIfODVtqr5Air3q55uFXMYkJV2gVZyWzNIQWF
         fTSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=rlfqSYrNkjFSxwUTlcye06DjNA4hjvTlO8ldGCK0b6M=;
        fh=6uA3yvXeN55FEhLQ+7xhayEyGzy+Y3z2qOYV5oRrcR8=;
        b=kGaNeIkLtwO+gftLwPxLRaCQs2cx2K56WdaBGbpk7dghjE/X2UkI4lkJ+bUMhbESTV
         6q17Mo9SuUqi5ApmXFSHHJ/VbQwcGFDI4strKEd3q193eBaDmbMzXaO521Z/aYkUCTHy
         pwZR8F+Axp4dxZQF0XyQnCZsqtTVBae+L1SZcOYSu3kc8OusYHkDG6BFCFKbXwF+pOwg
         8YjjFVrJEkZxUPw5cqSjexUkoQLnnEeDo9aGeJrMhebh8w2oKWeSjPzQTmYyAuWrq51R
         pUG5CRgQHdZs8TOTC+qf+WZe+2TgtQjaXeyYr8YEe1WX93RhCQwiiglHnAEPCjCgC08q
         rwIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qir7wb23;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jl6-20020a17090775c600b00a16ce63c390sor1927641ejc.2.2023.12.11.13.22.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 13:22:42 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qir7wb23;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702329762; x=1702934562; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlfqSYrNkjFSxwUTlcye06DjNA4hjvTlO8ldGCK0b6M=;
        b=qir7wb23KewHvRydMCnZiGBm43VJqtTA2KKzwLEwehmwXkd97iuouIcnn1YmxibGF9
         4DfGNVsuEwTcBjt2zKYsRIQXZ6O3axgVAnC5ax/wEodWmpH/pvjVWbSD/sRYj+5Vj9Oz
         nZR8k/SeAqWG5yuUbNJZ5GIK8Xm/3N1ws/GUO2SEsjbhT9+N9Jwx2ca8b/W8VQQIYbp8
         sN6FAkEAgevTCBDNoAI/Zmhhv4iTtNneaWyFtWTcXptxJM6tyZqeaizlOPrcSRUclVNA
         G0+wx31mtaUiu2hysl6kO4ipMtXM3C0Yd7Zx/+3xC59GZJmiMeVag4momNo/08OP6fag
         /tNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702329762; x=1702934562;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlfqSYrNkjFSxwUTlcye06DjNA4hjvTlO8ldGCK0b6M=;
        b=QLzqGiPAkdba2/lQDaAworbeUS5NHTq6g/Rjbvexj7VzeX+RM84AYf+9xpJDqVaflB
         x8zSze9xqQRjqbv6X1uZt9C11zNGqjZPYVkVl52p1uq8ZLEJxfhVSIelATY3Oi5hES6W
         XI8v4wlOGYVDOI8Ewm13WI2Fj6TXp9OXk7KCVEMM5gaiLJJ3t8Nk/INHdwsfAXC7CCMb
         5AJ4aHF3JStdhwv5UwK1kNnuUmPoJrrU4XFG+wTrLBepylAVR0FHEH9m9cLCDhjAXuzY
         tfCWAvHzph9WY/X7RIMDzkRnuitwgGbl/4/u66Mu2DOE+USUDFxWeQYkQAsgAWDro4g6
         G9mA==
X-Gm-Message-State: AOJu0Ywh73hqAgKQU1KwA7a2ucKFOBBiWAdU/9U0H9H0pqe6nAARJnIU
	VcROWGQ5d5ktwCNQyWIm7ala5Rwn
X-Google-Smtp-Source: AGHT+IH6UZZbtd9VX4mMgUEM45N0Ecs0qtLqZAswEvZJyd3ESyVjTRZHXsO4ZqciVy4gf+vf9Z5ROw==
X-Received: by 2002:a17:907:503:b0:a19:a19b:55f5 with SMTP id wj3-20020a170907050300b00a19a19b55f5mr2102238ejb.133.1702329762813;
        Mon, 11 Dec 2023 13:22:42 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id fj15-20020a1709069c8f00b00a1f6c2c3928sm5093354ejc.175.2023.12.11.13.22.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 11 Dec 2023 13:22:42 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 19/24] exec/user: Do not include 'cpu.h' in 'abitypes.h'
Date: Mon, 11 Dec 2023 22:19:56 +0100
Message-ID: <20231211212003.21686-20-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211212003.21686-1-philmd@linaro.org>
References: <20231211212003.21686-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DN4vJuZch3b6

First, "exec/user/abitypes.h" is missing the following
includes (they are included by "cpu.h"):
 - "exec/target_long.h"
 - "exec/cpu-all.h"
 - "exec/tswap.h"
Second, it only requires the definitions from "cpu-param.h",
not the huge "cpu.h".

In order to avoid "cpu.h", pick the minimum required headers.

Assert this user-specific header is only included from user
emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/user/abitypes.h | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/include/exec/user/abitypes.h b/include/exec/user/abitypes.h
index 6178453d94..1a8cd1ac74 100644
--- a/include/exec/user/abitypes.h
+++ b/include/exec/user/abitypes.h
@@ -1,7 +1,14 @@
 #ifndef EXEC_USER_ABITYPES_H
 #define EXEC_USER_ABITYPES_H
 
-#include "cpu.h"
+#ifndef CONFIG_USER_ONLY
+#error Cannot include this header from system emulation
+#endif
+
+#include "cpu-param.h"
+#include "exec/target_long.h"
+#include "exec/cpu-all.h"
+#include "exec/tswap.h"
 
 #ifdef TARGET_ABI32
 #define TARGET_ABI_BITS 32
-- 
2.41.0
