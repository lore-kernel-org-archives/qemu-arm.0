Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378196ejx;
        Mon, 5 Dec 2022 01:54:05 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7qWSnJbbJZ4S4OckoyQXN5vMkWYFWgLs7rF3l+eptEDxYClK70mU+39pwvXF3OPwMcbGIT
X-Received: by 2002:ae9:eb15:0:b0:6fe:c19d:e94f with SMTP id b21-20020ae9eb15000000b006fec19de94fmr2784059qkg.644.1670234045193;
        Mon, 05 Dec 2022 01:54:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234045; cv=none;
        d=google.com; s=arc-20160816;
        b=po16xiD+ofIAJaKYU5FOEHMoGXpSYhDgVKZLZbtTT8/qcJ6/Xj8w4Dn8K9HaWI0uXJ
         UMB71srZYx2E6fIgeFBAx0ahcZO58GyxYXvv95LksaIBh39OLIld9H0GZNuUhsbPOHtk
         5D9vi4jNucTdB02prQTBTRMKcMnPXo0JFzqTCGTSGYkZQHDj9lp5BE5/jqm+ylMncDUH
         4nxCxlpJ13qWJa1RviXMeP3Erau70Sri4kQWdzzN0Jrd3tOLlsw1I7Fn5y+sRUdN+48y
         hr3Lx0cZcYHcaBWBAXilInT04NowhW/BFhm6SQhxF51GrniEQC362eLA9F7G/mp1e3o3
         a7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=QGsT94LJsQpjrOeUhrN/Lye50j+vEUGPnyUCzBtYNtE=;
        b=aey+ezKxoPb136adpLYxK1jmhtFCIOLjfY3RzWmkExSqLo2Enj+og6LP3BOn8NlSDO
         rDu2jhaSNNtHh8FXuPeRPbVrYRpPs+7XmQiz1pF5GiYnjDySJATqgJuxGEPGXZN/gSQy
         FWUAvBFwakfNH+GHMQM9b2R09i6U6oqPF4NZeAy8Om5UstLKAKLMbEz71ONzK4FUVtmp
         FbJHEm3fxuJq3jsNkYbqCKNeB2Hf2m9YbUI9UQi0wCCOX//R4NZpUYhlFXcCff9SB4+l
         4GBvMn3eNgf5ipR5aDr4/vmMmTbfSgyPtqTucCMydh18fYxvL8OuZX9ltGcP5PfwQGJr
         W2wA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bH2XXUuV;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 137-20020a37038f000000b006f993fa03f0si7226716qkd.214.2022.12.05.01.54.04
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:54:05 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bH2XXUuV;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGsT94LJsQpjrOeUhrN/Lye50j+vEUGPnyUCzBtYNtE=;
	b=bH2XXUuVtKmwULNxmVsPJ+un6nhnoJPdJBQlNlXTjAWyJAzKZwVRDwTLQoeZtiqL9TQUx/
	zP/I6eHmFiWFRy8aqRsLDtQeliiWop2tH9XJYu00z5kdpiWrxM98WfoGdGylbCKd9qcwUe
	9YxmnYMVxGXaleoq/kpA56+9h695ixc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-258-bPnN0Ow8OEe5yPQXjP4OrQ-1; Mon, 05 Dec 2022 04:54:01 -0500
X-MC-Unique: bPnN0Ow8OEe5yPQXjP4OrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C595285A59D;
	Mon,  5 Dec 2022 09:53:59 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B2282166B29;
	Mon,  5 Dec 2022 09:53:52 +0000 (UTC)
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
	Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Subject: [PATCH v2 10/51] target/arm: Set TCGCPUOps.restore_state_to_opc for v7m
Date: Mon,  5 Dec 2022 10:51:47 +0100
Message-Id: <20221205095228.1314-11-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: 1KFy5+yANsuR

From: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>

This setting got missed, breaking v7m.

Fixes: 56c6c98df85c ("target/arm: Convert to tcg_ops restore_state_to_opc")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1347
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221129204146.550394-1-richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++++
 target/arm/cpu.c       | 6 +++---
 target/arm/cpu_tcg.c   | 1 +
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index d9121d9ff8..161e42d50f 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -185,6 +185,10 @@ static inline int r14_bank_number(int mode)
 void arm_cpu_register_gdb_regs_for_features(ARMCPU *cpu);
 void arm_translate_init(void);
 
+void arm_restore_state_to_opc(CPUState *cs,
+                              const TranslationBlock *tb,
+                              const uint64_t *data);
+
 #ifdef CONFIG_TCG
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index a021df9e9e..38d066c294 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -91,9 +91,9 @@ void arm_cpu_synchronize_from_tb(CPUState *cs,
     }
 }
 
-static void arm_restore_state_to_opc(CPUState *cs,
-                                     const TranslationBlock *tb,
-                                     const uint64_t *data)
+void arm_restore_state_to_opc(CPUState *cs,
+                              const TranslationBlock *tb,
+                              const uint64_t *data)
 {
     CPUARMState *env = cs->env_ptr;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 60ff539fa1..9a2cef7d05 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1035,6 +1035,7 @@ static const struct TCGCPUOps arm_v7m_tcg_ops = {
     .initialize = arm_translate_init,
     .synchronize_from_tb = arm_cpu_synchronize_from_tb,
     .debug_excp_handler = arm_debug_excp_handler,
+    .restore_state_to_opc = arm_restore_state_to_opc,
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = arm_cpu_record_sigsegv,
-- 
2.38.1
