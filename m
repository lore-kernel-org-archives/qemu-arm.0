Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2877470lfq;
        Mon, 14 Dec 2020 12:07:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMK3EXVX4QIFeTDTipUcpdwTvyK8fQIrXq5eCcOPfu5JJsA3soHrr2U/Mef3jXuJdBUdHC
X-Received: by 2002:a17:902:fe95:b029:da:fa53:666 with SMTP id x21-20020a170902fe95b02900dafa530666mr24190686plm.72.1607976440011;
        Mon, 14 Dec 2020 12:07:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607976440; cv=none;
        d=google.com; s=arc-20160816;
        b=EGgB2jypf5TE7v4AAA1WXH8t0nHKXUEfzT1yodOXLjFDXU869vwboXyyGMcXgBGASt
         ze+H9XYyCqRaK4IyqHf/Z8dLk06esMVqXWQBxrmsCWiH1kjqSn28UeZJ4qAb/w89GF6m
         9MR47TREwfHlKz4HVB1NSvG6xi6P7JJ4agecIB/oTyc6rgbhaXPMcvVltrz2jhWzR8DH
         3bKgNJAl4sSOXH7pFkUqw2W5TTaAj+UcY1j3csunh74aF9FNdQ4NsfHCWaFRqIV1Qrxi
         Du44sA+wRWwWBdu8jiONPu5qFIXYYNBuDqABU9rOAJjXP50sXzukN38oBtL07TJ4e9tx
         yiYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:dkim-signature;
        bh=qlegxJfvZcTjnYxrLxNnZr/mJ7//MzmXmfpo6d0D5HI=;
        b=JfhmPGdZDmIE3q5aCaeBBAd3ftpJF4WXs6ScRe7Ztjfrpn+4pJXZuTq38BuOBbX9LO
         AbBQn50Va3m+r3IOWSV0/nbS8jZxt+rmfWLmEVzeCBjLSQWyQGZk9TrymianWXEULs+N
         vcX3NCBqYj4EsQtlbSGsAW/dNOUo0iC8odrBLufmHCt+uT96aCtN7eLtmlqmDv351oOI
         I8saHdIeuwXxm3gwFPzdqQjmtU7rZGuehr9kN8znI5XebPdMY2SXIzFUxVi2EyoRearq
         qGXjcOyPI9uqBVGIjUhbhN5mMeNsIjCoZN3Dn9nzQv9oRnBEK6ByMh+KBG3yChSbBPIK
         u88Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=hEXj2fRM;
       dkim=pass header.i=@keithp.com header.s=mail header.b=VlRNnvPN;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Return-Path: <keithp@keithp.com>
Received: from elaine.keithp.com (home.keithp.com. [63.227.221.253])
        by mx.google.com with ESMTPS id f18si17680500pju.114.2020.12.14.12.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 12:07:19 -0800 (PST)
Received-SPF: pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) client-ip=63.227.221.253;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@keithp.com header.s=mail header.b=hEXj2fRM;
       dkim=pass header.i=@keithp.com header.s=mail header.b=VlRNnvPN;
       spf=pass (google.com: domain of keithp@keithp.com designates 63.227.221.253 as permitted sender) smtp.mailfrom=keithp@keithp.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=keithp.com
Received: from localhost (localhost [127.0.0.1])
	by elaine.keithp.com (Postfix) with ESMTP id A84543F2D6F1;
	Mon, 14 Dec 2020 12:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976438; bh=RmH2R6QxobB3gCYv+aIjULuWn7gQGSuqYqflCGwU5OI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hEXj2fRM9SbPndVcaUqg0TVhjj2/AtI69re/MzLFhtGVNt03673uynrUCYZKNdfVq
	 vAKAs+3YlqVkFjarPajSMDP6FYDUz7Wmb+g8AK0asZy6B57bv9TlAKh4QD5zwKzkkG
	 Dg0qfZcBtIvQYWn0fGzO5NYh4o/CjS2ewLM7Q7EjSaDCjdHDq12g+qD4VI/JH9kPNO
	 joEhc+uuYcKrz2UWV2oY7wDvCwjBUJOd+S5y7xKoWq9kHSrjY3APUxzoi1RmmbUORw
	 TUoSjYcmRQz5Q6EwadfU2h/wQU+FvMkKHwLRKNJRtqpxXoJdwQlNr7O+2ZyTvB5FU/
	 vClSSolfFUDqQ==
X-Virus-Scanned: Debian amavisd-new at keithp.com
Received: from elaine.keithp.com ([127.0.0.1])
	by localhost (elaine.keithp.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HpKMlp2pV3hq; Mon, 14 Dec 2020 12:07:18 -0800 (PST)
Received: from keithp.com (koto.keithp.com [10.0.0.2])
	by elaine.keithp.com (Postfix) with ESMTPSA id 995633F2E379;
	Mon, 14 Dec 2020 12:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=keithp.com; s=mail;
	t=1607976437; bh=RmH2R6QxobB3gCYv+aIjULuWn7gQGSuqYqflCGwU5OI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VlRNnvPNCSbCiXxm1EL8YehsVCioLiaAVgn6nICuV49OCiJFTgb4G9OQ5i8wlAdwZ
	 mCIYeinfVhD9vj6QvTfxmDzlrY8zCMvHMrSCnO6PsuoZ43HrUiercC8IE/T3SlpfWI
	 MHPFag52RVxX9PR2+KGewfnOE/QlX2vwyzuMlTDLYY8l8iZU4BtRCTa3FL6UTn/dLD
	 bvHpQmbpwsf6naSjvMlKQ1dGyOuVUQgdq4EtiwY0qwHow+MEekz/s7s5aGY2vXOMYI
	 plfqHQ+4jDyjbNNmxIb9uG0RRgQynBL4KeWR24QRUJpKN/kSUPkvN3ChmatnsHxht7
	 0iYX4VYZmfW1g==
Received: by keithp.com (Postfix, from userid 1000)
	id 484181582202; Mon, 14 Dec 2020 12:07:17 -0800 (PST)
From: Keith Packard <keithp@keithp.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Laurent Vivier <laurent@vivier.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	Keith Packard <keithp@keithp.com>
Subject: [PATCH 4/9] semihosting: Support SYS_HEAPINFO when env->boot_info is not set
Date: Mon, 14 Dec 2020 12:07:08 -0800
Message-Id: <20201214200713.3886611-5-keithp@keithp.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201214200713.3886611-1-keithp@keithp.com>
References: <87wnxktost.fsf@linaro.org>
 <20201214200713.3886611-1-keithp@keithp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: gsvcIdYX/7Jx

env->boot_info is only set in some ARM startup paths, so we cannot
rely on it to support the SYS_HEAPINFO semihosting function. When not
available, fallback to finding a RAM memory region containing the
current stack and use the base of that.

Signed-off-by: Keith Packard <keithp@keithp.com>

---

v2
	Explicitly convert 64-bits to 128-bits in find_region_base
	for hosts that don't have native 128-bit int type.
---
 hw/semihosting/common-semi.c | 43 +++++++++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/hw/semihosting/common-semi.c b/hw/semihosting/common-semi.c
index 33c82f73b1..f09deff4d3 100644
--- a/hw/semihosting/common-semi.c
+++ b/hw/semihosting/common-semi.c
@@ -137,6 +137,36 @@ typedef struct GuestFD {
 
 static GArray *guestfd_array;
 
+#ifndef CONFIG_USER_ONLY
+#include "exec/address-spaces.h"
+/*
+ * Find the base of a RAM region containing the specified address
+ */
+static inline hwaddr
+common_semi_find_region_base(hwaddr addr)
+{
+    MemoryRegion *subregion;
+
+    /*
+     * Find the chunk of R/W memory containing the address.  This is
+     * used for the SYS_HEAPINFO semihosting call, which should
+     * probably be using information from the loaded application.
+     */
+    QTAILQ_FOREACH(subregion, &get_system_memory()->subregions,
+                   subregions_link) {
+        if (subregion->ram && !subregion->readonly) {
+            Int128 top128 = int128_add(int128_make64(subregion->addr),
+                                       subregion->size);
+            Int128 addr128 = int128_make64(addr);
+            if (subregion->addr <= addr && int128_lt(addr128, top128)) {
+                return subregion->addr;
+            }
+        }
+    }
+    return 0;
+}
+#endif
+
 #ifdef TARGET_ARM
 static inline target_ulong
 common_semi_arg(CPUState *cs, int argno)
@@ -175,7 +205,18 @@ common_semi_rambase(CPUState *cs)
 {
     CPUArchState *env = cs->env_ptr;
     const struct arm_boot_info *info = env->boot_info;
-    return info->loader_start;
+    target_ulong sp;
+
+    if (info) {
+        return info->loader_start;
+    }
+
+    if (is_a64(env)) {
+        sp = env->xregs[31];
+    } else {
+        sp = env->regs[13];
+    }
+    return common_semi_find_region_base(sp);
 }
 #endif
 
-- 
2.29.2
