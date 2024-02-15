Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp635568ejb;
        Thu, 15 Feb 2024 07:18:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU5g5u1SAekxFs9A/3LgwCeTKCJvO9RG2VK0nXNpEtra33AZcEUd0Qy/C1QPrpDPLrGlqSIiDfP+EPfK45jEWsba0TPVS3G
X-Google-Smtp-Source: AGHT+IEh3MCBACWDBsuKpOQalXA35wU2Jk2BBg0zCK3rzZ1VuPvBxjGyhrkG/v0SG/b/fN9GHSaj
X-Received: by 2002:a5d:5046:0:b0:33c:f677:a637 with SMTP id h6-20020a5d5046000000b0033cf677a637mr2015085wrt.18.1708010316089;
        Thu, 15 Feb 2024 07:18:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708010316; cv=none;
        d=google.com; s=arc-20160816;
        b=nLRn0ddOkYOEGDHfFA4CAdkJDesx+ZR3ISnuE8+/P+iDnK+ODZZGMh1UOzx/r7cvsN
         I1jEP6x+6Uro/vsqsxus/AaUFLJaqd3HpbjXIVKYI6+HCB78f8e5VDnf8lRSPovF9Jhp
         aDbOESRtDIQtYqKxPDdHHNf3nFOB32J2UL/nh2m0L8j5P+qBHHX5dnunF6M02jfL5qlx
         zL84xVvPgy1/6L4FrFn9fcSMYbNSQ7smE5yy7uBqMhKK4LYd7eBzd9x6CZRjpcdLufQ0
         F+jQdflInY73FvKsxJaDOJ6CXfWOy0xHJtz1ZdOWMV+AhDRItSY4nLoIX5x1vBuWR/mG
         ZFNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=y9RfYvGcKmJEHeO7Q7A+afZQ3ur0mgqnAL9/HxpSRa4=;
        fh=Vg2yBWlikDPSwYiCI/Uk6oY6b+moM58ISSo3pIJ9eYM=;
        b=ciwEyfBVp/PkidH8YGeGKCReZUIHvstV7SqmyLLftcAKGizY+10xQlL9TOoh0yZjiL
         7DIqgx9GnyOwDv8ePv7A50IyY//ACOh2sMcbpftmRu0hyvJuX9Qc+VDQzMAtJ044Stsy
         claP4ETn92stwlxWkCcIzFfFAEa9OgfuW1oroCp4SRwesXvSkouaPPeqwaTvtYDRbQl/
         ZbJVynommkh508QVnckeMy8EvreSceyx3maclzMhwGgjCJlyDx34sWr4BaUHJSNyAKGa
         uEvMipqFy5IuV+fv3y9Ypf2obF1dlK7xtap7N/FAqtFxH9RXyVWZwqBqqXIMifI+ubAH
         OA0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id b7-20020a5d4b87000000b0033d1123db6csi354584wrt.56.2024.02.15.07.18.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Feb 2024 07:18:36 -0800 (PST)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TbJWt5spZz689Hq;
	Thu, 15 Feb 2024 23:14:50 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 4D6EF1400CD;
	Thu, 15 Feb 2024 23:18:35 +0800 (CST)
Received: from SecurePC-101-06.china.huawei.com (10.122.247.231) by
 lhrpeml500005.china.huawei.com (7.191.163.240) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 15:18:34 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, Gregory
 Price <gregory.price@memverge.com>, =?UTF-8?q?Alex=20Benn=C3=A9e?=
	<alex.bennee@linaro.org>, <richard.henderson@linaro.org>
CC: <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: [RFC PATCH 1/1] arm/ptw: Handle atomic updates of page tables entries in MMIO during PTW.
Date: Thu, 15 Feb 2024 15:18:04 +0000
Message-ID: <20240215151804.2426-2-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215151804.2426-1-Jonathan.Cameron@huawei.com>
References: <20240215151804.2426-1-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: LIp2AqgFz4Yj

I'm far from confident this handling here is correct. Hence
RFC.  In particular not sure on what locks I should hold for this
to be even moderately safe.

The function already appears to be inconsistent in what it returns
as the CONFIG_ATOMIC64 block returns the endian converted 'eventual'
value of the cmpxchg whereas the TCG_OVERSIZED_GUEST case returns
the previous value.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 target/arm/ptw.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 5eb3577bcd..37ddb4a4db 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -711,8 +711,38 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
     void *host = ptw->out_host;
 
     if (unlikely(!host)) {
-        fi->type = ARMFault_UnsuppAtomicUpdate;
-        return 0;
+        /* Can I do a load and store via the physical address */
+
+        bool locked = bql_locked();
+        if (!locked) {
+            bql_lock();
+        }
+        /* Page table in MMIO Memory Region */
+        if (ptw->out_be) {
+            old_val = cpu_to_be64(old_val);
+            new_val = cpu_to_be64(new_val);
+            cpu_physical_memory_read(ptw->out_phys, &cur_val, 8);
+            if (cur_val == old_val) {
+                cpu_physical_memory_write(ptw->out_phys, &new_val, 8);
+                cur_val = be64_to_cpu(new_val);
+            } else {
+                cur_val = be64_to_cpu(cur_val);
+            }
+        } else {
+            old_val = cpu_to_le64(old_val);
+            new_val = cpu_to_le64(new_val);
+            cpu_physical_memory_read(ptw->out_phys, &cur_val, 8);
+            if (cur_val == old_val) {
+                cpu_physical_memory_write(ptw->out_phys, &new_val, 8);
+                cur_val = le64_to_cpu(new_val);
+            } else {
+                cur_val = le64_to_cpu(cur_val);
+            }
+        }
+        if (!locked) {
+            bql_unlock();
+        }
+        return cur_val;
     }
 
     /*
-- 
2.39.2
