Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1515088lfb;
        Fri, 3 Sep 2021 10:45:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoYWgTFu8Vcjk1f1qtS6O85ve9YEOE0eSYKYa/jyzxdj8HgGkyVuzIWvZbd/PR0Hu7yp1x
X-Received: by 2002:aa7:d351:: with SMTP id m17mr197272edr.72.1630691132058;
        Fri, 03 Sep 2021 10:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691132; cv=none;
        d=google.com; s=arc-20160816;
        b=voBLaIsJ3mj6uite8l9H9apyLaCNAHYLatK1Crth+Snsy9pi4y/SWTF8uUVNWidJqt
         bEgHbRnRgB4ompZdcO/EcNphFCeSuBh+Fx4p2jfLLANg4goh4Y7Am3c6GCUnrvPto/9e
         yPIaHRSNn+nlHPgVSuahVHBDdBsooFJnVxa9bb8whH7WIJgitwDwRGgDmNW/pX7fU+55
         o99lrmXzV6/PsIS3bfRfiwwnMeDca4qPAvOjOz8n9LXWLlnVgIbhAJoYU6sWjGBHKKnV
         4iJ9J/N6yO6haVpZdtFnSPPiln1Tu0Hhmnld6MA/0mQ49Y7qtkKQ8FR93OkdGRDXhOXW
         gtLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6axIh+16/DTX2QUR6MOtSJVf4S/aGvlneoKk63wKfEE=;
        b=R1E17jqlaWYlxWYEFucbHh+gRaKmZEGBZFKXEW0q3AqgaoWSmqsF/vZSGFPQkkD5Ro
         FJWHsNumJtEKwQzrV63LGdAiy6GI5HdSw6WuT0w18U/fVTaGMpaEMB0jmcvhmhlgjkRC
         EqTEFaHpPTusS9SwVvY+0SNvKMlb8RXjV3bn/7TrKksehfh+lnt5MbJM77vGWUZWmRYj
         kH9Qsrk/k0+HKzX1RkMHWUSC7aWuEJhKCGqJ8AoK0SxfP5aD9gFxA87pupOZrzBfOpkf
         TOT/pzY/8gCsosenu1PkHEf4qxAfamjyOcV2oAmsvlKJB9nEWmJRs/Uxrk2jGEOkGdBv
         ImXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FgbEut2w;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id l12si5961657ejo.331.2021.09.03.10.45.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:45:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FgbEut2w;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6axIh+16/DTX2QUR6MOtSJVf4S/aGvlneoKk63wKfEE=;
	b=FgbEut2wMqtxgHKoW/P00o3g/+3BL3HUBsTz2xhK2AKJX3IHLMKH82wTtN7zPPRiBe10pr
	CM3VmyL8Kgamh6tVQgcKvJVXzOgsd1CSa29ig/WjyVA0nmTlloCPSyVh128zMX1U/9LBFr
	kmuuaP4uXROSAMHmv+Rxg2ChxbM+pe8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-zEmLGJaSO-6SFQxmMM_7Qg-1; Fri, 03 Sep 2021 13:45:30 -0400
X-MC-Unique: zEmLGJaSO-6SFQxmMM_7Qg-1
Received: by mail-wm1-f69.google.com with SMTP id j135-20020a1c238d000000b002e87aa95b5aso49274wmj.4
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6axIh+16/DTX2QUR6MOtSJVf4S/aGvlneoKk63wKfEE=;
        b=F/+HfEJnY4SPq10IgTwbLPVe8uolkW9Ra3lg8vvnq4bPktNKxUV6rTN4BMpPF+mha+
         kih3ryOtwtlWkRaXnZKnlNqotKl7h2G07Ue7xKU4rNhNZCKYngRPvibJp1yeU39kNh/E
         VjXpI8n2A8eIbhulscSN7MsRCLsQfEqJt5gZeE79K9gKspozd7jS7H8twuIzUuyLduZi
         yE6Sd03dBPQ31XzZQLUFkg//drLq+o2txlFH8NM50AhWSffI156KjQW3YD8WX5j/Abwc
         5elC3ZkH8xWPGTenVoJVzC7XnkJJ1xBNjEy7aCuQMEcVgQ6UheLG12WryApq9hfM/MOp
         pUbw==
X-Gm-Message-State: AOAM531tzutZr57/rrzl+2ZMiN3m6tByrnaZpVx+rhdZMxV5pGZ1unH1
	C7b3zZ9SPn6EqqI/v5c1UUMM0VSYSvb50rcDdWPPoKEy65un6Dv17hd/ev+tbGhSgk61n7tZB0r
	KnKmwi9XCzccvCQDU
X-Received: by 2002:a05:600c:2d45:: with SMTP id a5mr10814wmg.125.1630691128628;
        Fri, 03 Sep 2021 10:45:28 -0700 (PDT)
X-Received: by 2002:a05:600c:2d45:: with SMTP id a5mr10802wmg.125.1630691128471;
        Fri, 03 Sep 2021 10:45:28 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id s13sm56649wmc.47.2021.09.03.10.45.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 10:45:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org,
	qemu-ppc@nongnu.org,
	"Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v3 03/28] qapi: Replace g_memdup() by g_memdup2()
Date: Fri,  3 Sep 2021 19:44:45 +0200
Message-Id: <20210903174510.751630-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: g9ZT14oABQCQ

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/qapi-clone-visitor.c | 16 ++++++++--------
 qapi/qapi-visit-core.c    |  6 ++++--
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/qapi/qapi-clone-visitor.c b/qapi/qapi-clone-visitor.c
index c45c5caa3b8..b014119d368 100644
--- a/qapi/qapi-clone-visitor.c
+++ b/qapi/qapi-clone-visitor.c
@@ -37,7 +37,7 @@ static bool qapi_clone_start_struct(Visitor *v, const char *name, void **obj,
         return true;
     }
 
-    *obj = g_memdup(*obj, size);
+    *obj = g_memdup2(*obj, size);
     qcv->depth++;
     return true;
 }
@@ -65,8 +65,8 @@ static GenericList *qapi_clone_next_list(Visitor *v, GenericList *tail,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Unshare the tail of the list cloned by g_memdup() */
-    tail->next = g_memdup(tail->next, size);
+    /* Unshare the tail of the list cloned by g_memdup2() */
+    tail->next = g_memdup2(tail->next, size);
     return tail->next;
 }
 
@@ -83,7 +83,7 @@ static bool qapi_clone_type_int64(Visitor *v, const char *name, int64_t *obj,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Value was already cloned by g_memdup() */
+    /* Value was already cloned by g_memdup2() */
     return true;
 }
 
@@ -93,7 +93,7 @@ static bool qapi_clone_type_uint64(Visitor *v, const char *name,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Value was already cloned by g_memdup() */
+    /* Value was already cloned by g_memdup2() */
     return true;
 }
 
@@ -103,7 +103,7 @@ static bool qapi_clone_type_bool(Visitor *v, const char *name, bool *obj,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Value was already cloned by g_memdup() */
+    /* Value was already cloned by g_memdup2() */
     return true;
 }
 
@@ -114,7 +114,7 @@ static bool qapi_clone_type_str(Visitor *v, const char *name, char **obj,
 
     assert(qcv->depth);
     /*
-     * Pointer was already cloned by g_memdup; create fresh copy.
+     * Pointer was already cloned by g_memdup2; create fresh copy.
      * Note that as long as qobject-output-visitor accepts NULL instead of
      * "", then we must do likewise. However, we want to obey the
      * input visitor semantics of never producing NULL when the empty
@@ -130,7 +130,7 @@ static bool qapi_clone_type_number(Visitor *v, const char *name, double *obj,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Value was already cloned by g_memdup() */
+    /* Value was already cloned by g_memdup2() */
     return true;
 }
 
diff --git a/qapi/qapi-visit-core.c b/qapi/qapi-visit-core.c
index a641adec51e..ebabe63b6ea 100644
--- a/qapi/qapi-visit-core.c
+++ b/qapi/qapi-visit-core.c
@@ -413,8 +413,10 @@ bool visit_type_enum(Visitor *v, const char *name, int *obj,
     case VISITOR_OUTPUT:
         return output_type_enum(v, name, obj, lookup, errp);
     case VISITOR_CLONE:
-        /* nothing further to do, scalar value was already copied by
-         * g_memdup() during visit_start_*() */
+        /*
+         * nothing further to do, scalar value was already copied by
+         * g_memdup2() during visit_start_*()
+         */
         return true;
     case VISITOR_DEALLOC:
         /* nothing to deallocate for a scalar */
-- 
2.31.1
