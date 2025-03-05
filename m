Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp912039njm;
        Wed, 5 Mar 2025 08:13:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1EUgwEw0VId19kApFl1sI4rP4a/EtLXnIqJVabfZwM20nNcSkrBaDCekvGALIpwlBAisDC/msee+LJw==@linaro.org
X-Received: by 2002:a05:600c:35ce:b0:43b:cb06:d768 with SMTP id 5b1f17b1804b1-43bd29b3b78mr26185085e9.20.1741191189337;
        Wed, 05 Mar 2025 08:13:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741191189; cv=none;
        d=google.com; s=arc-20240605;
        b=eHlh98l+QNAqu8L1wjh9Wz14mc9/gnijCIN9Gz+93+zlZnAp22ycWo897HBMZkOJJ0
         +guxYEPS1y2ML5XQ947SHTFDypzLimvZ7wr5oI157DEYsJcdPsMKVXXdoAf8Zau2WlfU
         E6ViqkJW0QEigmWg2qZ0HvOzk7xV3WSlWxRE7PCY8TVaPfjnvE2J49j5Tzct/aDVaFSH
         AvD1WsGUpU0Ca9LB3kYtNB5w75Kw9ecUPyO0Bodl5R85H9x25pvEw3/c86AA2R4XOT0N
         R/OaRIQ89VdbIws9SZCbaCUbDN7FAc8SB9VqjEvI3F74IcNAXOS+l4+Nzfr9Azw/Hhms
         upeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=gIhGGd0/1q+JIY0hi7j9g+a5nqH/JO9F2rnfsDDPgP4=;
        fh=FpRAGfxp1h3wqoNCVzlsvD2zfi25IR4zbFFLJ+Ite2s=;
        b=UvPaS6DaDi7BJwjEqRtbsKOLcJahZcSPUNRHqfhPvcqdfypDL4JavV6Wij9J3uTzLw
         DSgqaXVv/eJ+NjGzvhzbUYJ3vrx/LtxEmKcu3TwFj/ufs5iksJhMot9COIp8B7/3FOtT
         QdFdgr3L6Mxh4ZIQsj1eWku3WFkWtBSzzpXvfb9A7jUSVAoi3DCjQNyQGDys2CIwJMbM
         MCqE7dsoUjw/yZfajd9bOIfoFNPp7Dp6c8BABaMz6REgnR4Y1JJzRSYRYuUnGV3JqkKD
         lh7OBI6J4MFRhu4kCKO1LpBvs5WMDKvqmYJbi7IXyzdFV1zE5Su1e/dobECrceml4CYn
         rQNw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KKpMYSk4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43bc962af03sor21010785e9.8.2025.03.05.08.13.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 05 Mar 2025 08:13:09 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KKpMYSk4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741191189; x=1741795989; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gIhGGd0/1q+JIY0hi7j9g+a5nqH/JO9F2rnfsDDPgP4=;
        b=KKpMYSk4ylW+o2BUI1ljPZyH+IUHVkd7yAhvfHA+U4g4ekQRe7lYAusxbnFHoQy6cX
         7TcUlrtuUz/f2PYiiS8dTsC9v7AKubvw1hxecFYJ49ciu3Ahxk6I4M+WIcqibAxH19Hf
         tdv03WQ32rT7KM690tLkW9/UuMFH9l9dL4AsumQ9Y2n6vjscqfUqrAk/YP9thlTDNkQL
         z//sIhRax1Y4m4FRkfaCVcueGs8fn2tEeuYVHowos7WgNv/UFBhLgtkPKHPrlFXIBYXn
         B1Mdsva1No1uuFI5zVFKurjm9wyNhmJugbTIL296A2/3cbHFQFwrlLfz4pwEm1VuKkbU
         ahtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741191189; x=1741795989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gIhGGd0/1q+JIY0hi7j9g+a5nqH/JO9F2rnfsDDPgP4=;
        b=UMJQXxanWH78ji21lhmKr3cU2tBEp2p4E3YgY9FLG15Eo1f/LvwTPLYhOINW+5PhFo
         hRlJCUGey+dHsi02wvZV34LDIiDppQU/yTkkrbY4T5LhYK5y1nLVWMhea+iF2LoytoS8
         pDgNdyfBDjpUUfSl+4N73p/VE/xwVjpNX8n9exk+M2QcAhB3/M8rt7wzYU4XR0d5+H0E
         5V7kwAViBvgTU/RrkK/9xzNGDvfHEO5drlGq7AgvLSJKvBUEfpKKChSKtHJZPu+tlCOw
         09FKQ4786sKg7ZSSNm3pKQ/ioOfg7UVVI3AZMOda+ADSsvh1VPKtXcGgC72amC9itcl/
         b2HQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+mduKU+4E9lhHlC8yfX1R/c0mPKFoZbUoRW02YwZvR6M5mUUITPSM0D2nziYdyTaHUEW6/e4j66r+TA==@linaro.org
X-Gm-Message-State: AOJu0YxZW4xXmwoxjLRyGsop+Ne2eF4YLobrIQVW+z8GTFHMOGjs3M2H
	j//n+pjIbPnGgNYzcYFMagtxOp9NQolLYK5/Bz72YiM2cBmNB2ro1L2hwLbMEdQx90yzuSy4ulg
	UBQknKQ==
X-Gm-Gg: ASbGncveLSbJ1UrZofxp/lpFtgUlYyWnGINovDRpmINoa7zhbIjurKHWfYxPjV/UtY0
	MlbG4x6OlOesTRI60LJBuM8QLG+2nnm5uzlqXJ3zEvD0JQkVi88BvgOW8kaq0E+4VPXsHl0L5rN
	YdN3W+GuDQj8cw8Mrk6cfdxo44lYndeg8FHQerzfq/jubyOte1UbDRNQpF11I7GLGbG2OsLm1zd
	g9p3Msu0AV72gNjZd1FIuTSJY3Q3n2PSLl3YOkYB8Hgtf+cJn/5dbzUtxVTuER+EO5t3tTBdc8J
	WS9/P1wmD5+FLAFLntvmrX+sXBkyeBwfb2kKbgOG4jEsswEeu3T2l628eT78AqtskrJ35K9jIM+
	Okl4Zi3EkrUCjf+KzGTI=
X-Google-Smtp-Source: AGHT+IHG44iYgP80iqa7aBVAlp2+znWXEwDSeRUMjjw21rd3eIQVyHabxI8YmCSES1ldC4HgNL+bTQ==
X-Received: by 2002:a05:6000:1562:b0:38d:e6f4:5a88 with SMTP id ffacd0b85a97d-3911f749c86mr2983958f8f.12.1741191188770;
        Wed, 05 Mar 2025 08:13:08 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47b6f22sm21116273f8f.47.2025.03.05.08.13.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 05 Mar 2025 08:13:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 4/4] hw/ppc: Remove TARGET_PPC64 use in ppc_create_page_sizes_prop()
Date: Wed,  5 Mar 2025 17:12:48 +0100
Message-ID: <20250305161248.54901-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250305161248.54901-1-philmd@linaro.org>
References: <20250305161248.54901-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: HmLlm7HGdl3j

Check the binary is built for 64-bit PPC at runtime,
removing the need for TARGET_PPC64 #ifdef'ry.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ppc/fdt.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ppc/fdt.c b/hw/ppc/fdt.c
index 0828ad72548..bae269c72ac 100644
--- a/hw/ppc/fdt.c
+++ b/hw/ppc/fdt.c
@@ -8,12 +8,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/legacy_binary_info.h"
 #include "target/ppc/cpu.h"
 #include "target/ppc/mmu-hash64.h"
 
 #include "hw/ppc/fdt.h"
 
-#if defined(TARGET_PPC64)
 size_t ppc_create_page_sizes_prop(PowerPCCPU *cpu, uint32_t *prop,
                                   size_t maxsize)
 {
@@ -21,6 +21,8 @@ size_t ppc_create_page_sizes_prop(PowerPCCPU *cpu, uint32_t *prop,
     int i, j, count;
     uint32_t *p = prop;
 
+    assert(legacy_binary_is_64bit());
+
     for (i = 0; i < PPC_PAGE_SIZES_MAX_SZ; i++) {
         PPCHash64SegmentPageSizes *sps = &cpu->hash64_opts->sps[i];
 
@@ -46,4 +48,3 @@ size_t ppc_create_page_sizes_prop(PowerPCCPU *cpu, uint32_t *prop,
 
     return (p - prop) * sizeof(uint32_t);
 }
-#endif
-- 
2.47.1
