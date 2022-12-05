Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378988ejx;
        Mon, 5 Dec 2022 01:55:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5LDW9LVvrzlDyvsEFRnRUHLIMPixIIsfL+wI7Nwfgwvedyw89b/XFBaqQezS5XE013M+sG
X-Received: by 2002:a37:b2c2:0:b0:6ee:9453:9d92 with SMTP id b185-20020a37b2c2000000b006ee94539d92mr73733328qkf.520.1670234145166;
        Mon, 05 Dec 2022 01:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234145; cv=none;
        d=google.com; s=arc-20160816;
        b=llWNvDFmPlnMXSffYaLsONvReSPuuG1y1L0SMP6CUX3jVR2wMX9TWn/0ActgrZ50cc
         2urScsSbP89/5o2yrkBFzvufoUEWVIJnM8uBs9DOQTuIyIr6rwCcYimjHpwwQTRbAM13
         h7mTrB31ltqZo2HVWkQ/uJETsjAdyIBNbkgExHgGjA4ewxp4Yv1iby4eVI9EMp2dMhCU
         osvbYQ7iJj9NcdMAERGo0o8xl6BNC43ARoBINFtPY5Cc/4F4TwbOvfwph68QhxnyQNeh
         YOC4+NpKvQx5iuD+b1e4Egw3FBOOfh8YJ8/ooCgE/v3+oHGmMNBKuXSJhhqPEwCHWIIU
         6ilA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dnkYOrTgO+HGLMQelFOS97QjJMRgo81PYH7NJKA+HKk=;
        b=tuQzNBmU2QVBiPiuTv090E4WJ6/1ikmHwgMRqW9Nf9ySE6aTI4UqkJVfTh6kMhf8NM
         DVtKHESzAYPviKGpF4wFB9xsx5lP2wdRxPBuo03lw+JCHyjbQbu4tDPBuLtCkRDjV0AP
         DE0IMTDSrlxwoeVTkqQnxOKFEtYdn527NNMU/XSVRzals7VoMLSYSCBm2gmhNUFvYAVZ
         tA33epxObyLOy+dd+AuquqkG1TTEL5ErTEOihsuzK36xLmW7ZoQOs4gyr5uQaBQfUauM
         M84CFO3LlKZHscRESQStWV+Itm9H1WcIcTjZ/jsMZF3TkUtKiwPDY+iI4pZ6HTiddj29
         B/zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FVZBslVK;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id o65-20020a37be44000000b006fa1585a6absi7376739qkf.186.2022.12.05.01.55.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:55:45 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FVZBslVK;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234144;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dnkYOrTgO+HGLMQelFOS97QjJMRgo81PYH7NJKA+HKk=;
	b=FVZBslVKzQsq674mtc4+SHUEvEewPLZFVaE69zTq+tw8cqGMZaJrx/Uu3C38W/gpR4gwPH
	UFD/lVVYA75AC3mci8aF0ZZdOlDfG36voJTa5DqkUfXm8vloqbOHBqkn2Zaw96rIURUdUK
	p53+/Qj8U+aVrkHJreuk9JHWmpzv06s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-8t4q3dc7PkiPR_2Ty-aeZg-1; Mon, 05 Dec 2022 04:55:40 -0500
X-MC-Unique: 8t4q3dc7PkiPR_2Ty-aeZg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5829B185A794;
	Mon,  5 Dec 2022 09:55:39 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F35CF2166B29;
	Mon,  5 Dec 2022 09:55:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	virtio-fs@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	qemu-block@nongnu.org,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Klaus Jensen <its@irrelevant.dk>,
	John Snow <jsnow@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Daniel Hoffman <dhoff749@gmail.com>
Subject: [PATCH v2 23/51] target/i386: Always completely initialize TranslateFault
Date: Mon,  5 Dec 2022 10:52:00 +0100
Message-Id: <20221205095228.1314-24-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: ha7WuiLHbjl7

From: Richard Henderson <richard.henderson@linaro.org>

In get_physical_address, the canonical address check failed to
set TranslateFault.stage2, which resulted in an uninitialized
read from the struct when reporting the fault in x86_cpu_tlb_fill.

Adjust all error paths to use structure assignment so that the
entire struct is always initialized.

Reported-by: Daniel Hoffman <dhoff749@gmail.com>
Fixes: 9bbcf372193a ("target/i386: Reorg GET_HPHYS")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221201074522.178498-1-richard.henderson@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1324
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 target/i386/tcg/sysemu/excp_helper.c | 34 ++++++++++++++++------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/target/i386/tcg/sysemu/excp_helper.c b/target/i386/tcg/sysemu/excp_helper.c
index 405a5d414a..55bd1194d3 100644
--- a/target/i386/tcg/sysemu/excp_helper.c
+++ b/target/i386/tcg/sysemu/excp_helper.c
@@ -71,10 +71,11 @@ static bool ptw_translate(PTETranslate *inout, hwaddr addr)
         TranslateFault *err = inout->err;
 
         assert(inout->ptw_idx == MMU_NESTED_IDX);
-        err->exception_index = 0; /* unused */
-        err->error_code = inout->env->error_code;
-        err->cr2 = addr;
-        err->stage2 = S2_GPT;
+        *err = (TranslateFault){
+            .error_code = inout->env->error_code,
+            .cr2 = addr,
+            .stage2 = S2_GPT,
+        };
         return false;
     }
     return true;
@@ -431,10 +432,11 @@ do_check_protect_pse36:
                                   MMU_NESTED_IDX, true,
                                   &pte_trans.haddr, &full, 0);
         if (unlikely(flags & TLB_INVALID_MASK)) {
-            err->exception_index = 0; /* unused */
-            err->error_code = env->error_code;
-            err->cr2 = paddr;
-            err->stage2 = S2_GPA;
+            *err = (TranslateFault){
+                .error_code = env->error_code,
+                .cr2 = paddr,
+                .stage2 = S2_GPA,
+            };
             return false;
         }
 
@@ -494,10 +496,11 @@ do_check_protect_pse36:
         }
         break;
     }
-    err->exception_index = EXCP0E_PAGE;
-    err->error_code = error_code;
-    err->cr2 = addr;
-    err->stage2 = S2_NONE;
+    *err = (TranslateFault){
+        .exception_index = EXCP0E_PAGE,
+        .error_code = error_code,
+        .cr2 = addr,
+    };
     return false;
 }
 
@@ -564,9 +567,10 @@ static bool get_physical_address(CPUX86State *env, vaddr addr,
                 int shift = in.pg_mode & PG_MODE_LA57 ? 56 : 47;
                 int64_t sext = (int64_t)addr >> shift;
                 if (sext != 0 && sext != -1) {
-                    err->exception_index = EXCP0D_GPF;
-                    err->error_code = 0;
-                    err->cr2 = addr;
+                    *err = (TranslateFault){
+                        .exception_index = EXCP0D_GPF,
+                        .cr2 = addr,
+                    };
                     return false;
                 }
             }
-- 
2.38.1
