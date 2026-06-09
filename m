Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A26CD98C7
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 17:26:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX0D1-0007dT-EO; Tue, 09 Jun 2026 13:25:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Cr-0007Xi-GO
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 13:25:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Co-0001vo-W5
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 13:25:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781025937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwLp2AvTjapZW+/ErJH1EShXN1MPuQYDgyT1L5wHR6o=;
 b=JPVjlppVlL8SUUtTmZes4wP+bAJ/ZgbT+JIBsKTCYPCazYQkNgBPhdn7hc14nXgXwJ4o7Q
 OrfegoGBMj405AtmErU3+yahrPCW/ESYo+SGa+ZW3NU8sLD3IlgiwUMJVBv+i5VSJbkrVR
 +kVlkB5nnMH1j3glCpuDREq7Hcngkac=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-vjtmy2VAP1CBnG78WEiSmg-1; Tue, 09 Jun 2026 13:25:33 -0400
X-MC-Unique: vjtmy2VAP1CBnG78WEiSmg-1
X-Mimecast-MFC-AGG-ID: vjtmy2VAP1CBnG78WEiSmg_1781025933
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8cce1de2519so63995226d6.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 10:25:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781025933; x=1781630733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jwLp2AvTjapZW+/ErJH1EShXN1MPuQYDgyT1L5wHR6o=;
 b=mgaNpx9wJcyadWoRK5ZIE9C66K1gNqFVLJ+kdDhF+tvDGWrZH9whJ4jo/cIAW/bDqr
 KCaTilg8wyUw0Uya3lBb9t8hs1WHeogwm69zWRTYwJegZCLTmdIPdhtUW+tfrEI1SbTG
 OZ435fFWbO7syIliTIs8Li3SazEFdJf76vUFVn0KiaV0F1aZErXgrcAgImi7r9rw7mef
 TlGyHMd8IT8eOPfctRA5gjWMAmQlu0+iVvDyODMu/K4347iWv8jyOnmr9Ry30M6I+u37
 awodZfjyczCGmIiQCkS/CvbMAD0JIhIoLnmmBauhAtyjh4nH8+XYX9vxvu98kir34qxw
 CsIg==
X-Gm-Message-State: AOJu0YzsZVKiDVZ4r3ViTw6jWaTODTdh9z2I6UtJCgaNjXjvgv8NjmjM
 C7dj6GejQw6rC3Jog9DYZUHWJH/YB6D2Z5snuWNmtFIJC5FcvEg9egI6wubH5CoiNyy5QeLBA+8
 gCFZMpO6VFpGlq5jGfSqYnQkG4EmpnHnVslD89YHwS1MULoi2+nRacQ==
X-Gm-Gg: Acq92OGMkW/sGsqs/1wDqWFKjl0+S/7Uz+IjYj33Yb91TK1xwkb2ARDl1+Z828qafsI
 LC8TOZOogaNpzE1zy7kka/1IA28oCuy+8eJCBtRbJm698Djmfix4hEr3aBcQ+Py5I5XlLn7cpIP
 KtPjGhYK1hi6f0emASbTdLoYanQX6R1isdD13ivODup9inTGFYyezIIFYjKUTuPRZNekcf+tweQ
 37BuxIEeOfQ4+lwMBpWuA6JIblvAGp2PXVd7YDRVP/88Qz8+LYJV1f98YkP0hDVqS7GGdSjLaCE
 PpnTP+mdmQaOnod6pxHjhSekqrZ2AjoUUZCC7yjjXDDdo7kVEvOof92QOJ0ANaSNa3vi3nu8DwY
 d8oeb3Mm/8I9WpfRoLuR3Dh4=
X-Received: by 2002:a05:622a:460d:b0:517:a9ef:ce23 with SMTP id
 d75a77b69052e-517a9efd0c9mr162127181cf.16.1781025933189; 
 Tue, 09 Jun 2026 10:25:33 -0700 (PDT)
X-Received: by 2002:a05:622a:460d:b0:517:a9ef:ce23 with SMTP id
 d75a77b69052e-517a9efd0c9mr162126561cf.16.1781025932578; 
 Tue, 09 Jun 2026 10:25:32 -0700 (PDT)
Received: from x1.com ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775da2c56sm187524711cf.21.2026.06.09.10.25.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:25:27 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Sana Sharma <sansshar@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juraj Marcin <jmarcin@redhat.com>, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: [PATCH v2 06/10] qom: Add object_property_add_bool_ptr()
Date: Tue,  9 Jun 2026 13:25:10 -0400
Message-ID: <20260609172514.2037645-7-peterx@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609172514.2037645-1-peterx@redhat.com>
References: <20260609172514.2037645-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: npLkNkhI-TVrm6iXXoR2rlU5pfFcEnu3BkFPCEd9v1k_1781025933
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add a helper to set qom property via a bool pointer.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/qom/object-property-ptr.h | 15 ++++++++++++
 qom/object-property-ptr.c         | 39 +++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/include/qom/object-property-ptr.h b/include/qom/object-property-ptr.h
index 6066c377fb..9cd8600094 100644
--- a/include/qom/object-property-ptr.h
+++ b/include/qom/object-property-ptr.h
@@ -16,6 +16,21 @@ typedef enum {
     OBJ_PROP_FLAG_READWRITE = (OBJ_PROP_FLAG_READ | OBJ_PROP_FLAG_WRITE),
 } ObjectPropertyFlags;
 
+/**
+ * object_property_add_bool_ptr:
+ * @obj: the object to add a property to
+ * @name: the name of the property
+ * @v: pointer to value
+ * @flags: bitwise-or'd ObjectPropertyFlags
+ *
+ * Add a property of type 'bool' to the object.
+ *
+ * Returns: The newly added property on success, or %NULL on failure.
+ */
+ObjectProperty *
+object_property_add_bool_ptr(Object *obj, const char *name, const bool *v,
+                             ObjectPropertyFlags flags);
+
 /**
  * object_property_add_uint8_ptr:
  * @obj: the object to add a property to
diff --git a/qom/object-property-ptr.c b/qom/object-property-ptr.c
index 02c01ed7f0..49f223da7b 100644
--- a/qom/object-property-ptr.c
+++ b/qom/object-property-ptr.c
@@ -7,6 +7,26 @@
 #include "qom/object.h"
 #include "qapi/visitor.h"
 
+static void property_get_bool_ptr(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    bool value = *(bool *)opaque;
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void property_set_bool_ptr(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    bool *field = opaque;
+    bool value;
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    *field = value;
+}
+
 static void property_get_uint8_ptr(Object *obj, Visitor *v, const char *name,
                                    void *opaque, Error **errp)
 {
@@ -87,6 +107,25 @@ static void property_set_uint64_ptr(Object *obj, Visitor *v, const char *name,
     *field = value;
 }
 
+ObjectProperty *
+object_property_add_bool_ptr(Object *obj, const char *name,
+                             const bool *v, ObjectPropertyFlags flags)
+{
+    ObjectPropertyAccessor *getter = NULL;
+    ObjectPropertyAccessor *setter = NULL;
+
+    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
+        getter = property_get_bool_ptr;
+    }
+
+    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
+        setter = property_set_bool_ptr;
+    }
+
+    return object_property_add(obj, name, "bool",
+                               getter, setter, NULL, (void *)v);
+}
+
 ObjectProperty *
 object_property_add_uint8_ptr(Object *obj, const char *name,
                               const uint8_t *v,
-- 
2.53.0


