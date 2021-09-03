Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1173590lfb;
        Fri, 3 Sep 2021 04:07:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs+BXj16PW3QC6S3zHJcbL1gk96eGKwNWZFp7yR3Ef/kew6UnhjNb8RyR+6eEZYazxJjpM
X-Received: by 2002:a05:6402:1cbb:: with SMTP id cz27mr3308787edb.334.1630667246593;
        Fri, 03 Sep 2021 04:07:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667246; cv=none;
        d=google.com; s=arc-20160816;
        b=dOWBTxMiMQ28kwBdrIToFs+BgXyDus4Cs//1BIfUaymAy5+tTAzUzX8Q8hNAjI+Msh
         4E1s1m4y0yiTIcjZCXkW1d5NGAs3oTr7ofrI77Tz1nbObbLc4M8VGMzem5EcfAseJMEQ
         1Uyew/LQ0a/hHD78L6EpShWwoFegLxsp3Qdh+mIria/QAzIKy5wNnJW+bq/UOpHvNrTV
         4VxENMEuzwO6dBECCvbDM3DNFcebdhNdYwwkgiXpQKJXqJX+8hyYmzWFYvQaLU8I8FMm
         nleMgcYgAT5lOZKUYgCyqqA/iHqtlztEMFf6xPqSlhT2fN5YLRXeuN8VoHwRAMkaMjfk
         6lrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=IJcPcmBTlXv680lRxXxIAa1x+QW8hhus++pQyqguqCw=;
        b=n7+pe44bRzj7v90rjl+2PsGI+LMqCTSGotHhsivA43FOgxX+5Edl4hZvkBlSFnP8MT
         5nDyHckYpN3izkEJo9PTASTD/IhCM17DeqH8GIFmvg56C46TdYtK8cadSof7s7zMzPQG
         VQt30cB9feqCTU3ZUcesP2Xqx4KjPc3sVhob+hWLrAsEFlvGpVvw3/lgCvL4AEmoBf94
         TTB89YiJE0YjA4xdtjXEa4KtauDQmHkU3t933nc8XUDR40aFG/cuJSvr1QjW/T8wto3E
         wN8lyKOwK7HGGvChmEeSCdS6Ko2JeOzlY0C9xBeF/I1bQXDVFO5gibbYRUoimPwyodFf
         3obA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CfnwAl5U;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j13si3515709edw.440.2021.09.03.04.07.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:07:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CfnwAl5U;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IJcPcmBTlXv680lRxXxIAa1x+QW8hhus++pQyqguqCw=;
	b=CfnwAl5Uy73PnPFbWIOSuCTs+/fY8KX/IeK2VPvD0jxp1XDiZAyfmgonbEBiECCmevPFM7
	HzZI8zY6inLxkWdzKwzvGkkayfXCCulh46J1G4rUStLQzxoS/kyCE90XaNdhs2y0oQdgaV
	14YHUCDuDo+eAFm7DB7c8hywb3BqGkE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-x2eJ4FGyPlKceCM04wP4vQ-1; Fri, 03 Sep 2021 07:07:24 -0400
X-MC-Unique: x2eJ4FGyPlKceCM04wP4vQ-1
Received: by mail-wr1-f70.google.com with SMTP id m16-20020a056000181000b0015964e4ae48so416219wrh.14
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 04:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IJcPcmBTlXv680lRxXxIAa1x+QW8hhus++pQyqguqCw=;
        b=nAfLpjZgdnyZDM0PMG3ognPl7IEaF0/5K9kT8PJ9biVMVKpByzSz5eySn6vM/a1MBs
         IZT7N3327VyTTbGqAbEW6d/JPF+lw0JCpgzBkvTvDZlu1mNcS/l1X1RJZY1ELEYZolUq
         hLGpfLmHW/+5QmbHFiJ/zUZ4eHIjjLVcVrneoDTyCt9IksPKH6rn8+SoDdAYnjvKy6Tr
         jbZk4jQJDExPj+YFFAgUuluGOoQKH+6IXlBJl39eHbVmdvYNfbQJhsq8EIx9FY6dyok+
         p5xH8JuAXmT1pxBDBmCQoMSGT68n1QQ9oCOe83FnYkv+SvlwS9Iv0VTs/W1qX2SZRwTg
         nTGA==
X-Gm-Message-State: AOAM533tfMD9+OsXGYTKgchudVyKj9CjsXr/epPaDqcSkv+cvcRAT3e3
	PIBPjpmds/1rHQkFj1/l6XStUf+7SvhsR16SuQdjgIJW+eZ4kGJzGSoyVSXa9ifcpLJmqxx2y3N
	Kt0WEsA/cIBpqhuzY
X-Received: by 2002:a7b:c014:: with SMTP id c20mr2767804wmb.81.1630667243359;
        Fri, 03 Sep 2021 04:07:23 -0700 (PDT)
X-Received: by 2002:a7b:c014:: with SMTP id c20mr2767781wmb.81.1630667243141;
        Fri, 03 Sep 2021 04:07:23 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id k25sm4747138wrd.42.2021.09.03.04.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 04:07:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hanna Reitz <hreitz@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Michael Roth <michael.roth@amd.com>,
	Zhang Chen <chen.zhang@intel.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	Stefan Weil <sw@weilnetz.de>,
	John Snow <jsnow@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-block@nongnu.org,
	Helge Deller <deller@gmx.de>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Peter Xu <peterx@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Greg Kurz <groug@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-ppc@nongnu.org,
	David Hildenbrand <david@redhat.com>
Subject: [PATCH 03/28] qapi: Replace g_memdup() by g_memdup2_qemu()
Date: Fri,  3 Sep 2021 13:06:37 +0200
Message-Id: <20210903110702.588291-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903110702.588291-1-philmd@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8VasIUd9GSIO

Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

  The old API took the size of the memory to duplicate as a guint,
  whereas most memory functions take memory sizes as a gsize. This
  made it easy to accidentally pass a gsize to g_memdup(). For large
  values, that would lead to a silent truncation of the size from 64
  to 32 bits, and result in a heap area being returned which is
  significantly smaller than what the caller expects. This can likely
  be exploited in various modules to cause a heap buffer overflow.

Replace g_memdup() by the safer g_memdup2_qemu() wrapper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/qapi-clone-visitor.c | 16 ++++++++--------
 qapi/qapi-visit-core.c    |  6 ++++--
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/qapi/qapi-clone-visitor.c b/qapi/qapi-clone-visitor.c
index c45c5caa3b8..fb38505d982 100644
--- a/qapi/qapi-clone-visitor.c
+++ b/qapi/qapi-clone-visitor.c
@@ -37,7 +37,7 @@ static bool qapi_clone_start_struct(Visitor *v, const char *name, void **obj,
         return true;
     }
 
-    *obj = g_memdup(*obj, size);
+    *obj = g_memdup2_qemu(*obj, size);
     qcv->depth++;
     return true;
 }
@@ -65,8 +65,8 @@ static GenericList *qapi_clone_next_list(Visitor *v, GenericList *tail,
     QapiCloneVisitor *qcv = to_qcv(v);
 
     assert(qcv->depth);
-    /* Unshare the tail of the list cloned by g_memdup() */
-    tail->next = g_memdup(tail->next, size);
+    /* Unshare the tail of the list cloned by g_memdup2() */
+    tail->next = g_memdup2_qemu(tail->next, size);
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
