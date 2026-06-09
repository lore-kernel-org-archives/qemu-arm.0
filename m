Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE29ECD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 17:27:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wX0D4-0007gO-R8; Tue, 09 Jun 2026 13:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Ct-0007Yj-ER
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 13:25:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wX0Cp-0001vR-3O
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 13:25:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781025936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mqrDCR+oRMqmtrsRDcLBvqMYTFGEeRtYsKQ4H1N/ZoA=;
 b=cxMFjHU0TtDNw6/eTwtAPQh6rOBIv7NZZeeYBCO0hsDkQP5otbLM5ZanJwPKVkeyWb91wC
 rnlbGCQwoiSVE3jERyFRz/Kh6+maDRwCw9xc/55tli2lYjhpplWjYyr59TumTrLR9gUuYp
 ZFZ2Y0EnSubXb6W58WOFV9GoWwkz9YU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-NGHoGCSmPMmiLS6nH0bIMA-1; Tue, 09 Jun 2026 13:25:35 -0400
X-MC-Unique: NGHoGCSmPMmiLS6nH0bIMA-1
X-Mimecast-MFC-AGG-ID: NGHoGCSmPMmiLS6nH0bIMA_1781025935
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-5178fc89b1bso73796281cf.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 10:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781025935; x=1781630735;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=mqrDCR+oRMqmtrsRDcLBvqMYTFGEeRtYsKQ4H1N/ZoA=;
 b=glbtmuccDs4rrdyY9c4arzzGJuqTnr7sOx7ZksEUzG4KhiiGi1Z3dd5VO7HwZveSNI
 aIR/235pJ2r6nVOAas/q0OPsf4Z7Y0Ot9AJ95CpLg1bC+PEJKLglIVjqNhtnI+ZzVCaz
 Fzt1urhltkA3emMlWE3ayPiVnuWKvZ5WdUBnpVWq1DUmUSnjHyKjlLgI/dS7TPaVns2T
 376q4RaO1jhOHOcGRp3m/L4DAQegbH4cTieywHR2JWy9YyS8eS094lfWRSOtH4BLyNuo
 V7kHyNHEfdmDMYDH8fO9nqaJC4Xdsda1HG6bYQbaOIlQvfuVZBaN4oDxzl3RH9u/dyEy
 KdgQ==
X-Gm-Message-State: AOJu0YwFXnn6UYNfqNqJsABcTYukSLd5c6uD53Tjifjnc+jfrUJKevHx
 9cN6S5RzStCo9OAuqBV3c6d2jNNY7gtCJwwuYRqt2IhU52uiiWjwni4wyIQFdxbiic/hclHSE/L
 eZADNcvbsLnN/I/RnOHtlOrNhxOAgcf4ayDIg0gGNpVYU6zEa3ZgGjw==
X-Gm-Gg: Acq92OEuFQN90UZLNCEIhliA7FQoqPg49GzACzD5O+sr4tMtl1Mj1GbXpGI6CJuYS2E
 7HHiELnj/liKCkutE/UAtTdS3lFPH6y8s4DnD0QD8hsdFlhssdkR6XjBDMtdbVoKbWH7XtlsJ0A
 VjE79GdkwaLKsrBk+UzutyGeqf1eQw6diTz6uNsKNs3j22XS5vDwD9zY6HAg5SqGFwDRQReuh5K
 ZcNnNO4ms243MrnD4CxNVrPH0Dv6A8PvkAsG+TIZM0GGE9NH8JinqgZxfWNyTUqiZCpCjkUZ+1u
 6E0VPBShxXEVXzda+BlwMFVFIl9SLO3v4Rc3BLq/V5gfGTEIIoWiCNAvI8Ix0uTwC7Qx11TDTPt
 6JyIRpfG1eOJyCZXbf+uUQg4=
X-Received: by 2002:ac8:610f:0:b0:517:707b:14f1 with SMTP id
 d75a77b69052e-51795c09df1mr301392941cf.46.1781025934759; 
 Tue, 09 Jun 2026 10:25:34 -0700 (PDT)
X-Received: by 2002:ac8:610f:0:b0:517:707b:14f1 with SMTP id
 d75a77b69052e-51795c09df1mr301392161cf.46.1781025934194; 
 Tue, 09 Jun 2026 10:25:34 -0700 (PDT)
Received: from x1.com ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-51775da2c56sm187524711cf.21.2026.06.09.10.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 10:25:33 -0700 (PDT)
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
Subject: [PATCH v2 07/10] qom: Add object_property_add_size_ptr()
Date: Tue,  9 Jun 2026 13:25:11 -0400
Message-ID: <20260609172514.2037645-8-peterx@redhat.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260609172514.2037645-1-peterx@redhat.com>
References: <20260609172514.2037645-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HBNqr9qX538yLaPhC0gmoup3huuzC5xDiXYAu29um5A_1781025935
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

Add a helper to set qom property via a size pointer.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/qom/object-property-ptr.h | 16 +++++++++++++
 qom/object-property-ptr.c         | 40 +++++++++++++++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/include/qom/object-property-ptr.h b/include/qom/object-property-ptr.h
index 9cd8600094..be467c64af 100644
--- a/include/qom/object-property-ptr.h
+++ b/include/qom/object-property-ptr.h
@@ -115,4 +115,20 @@ ObjectProperty *object_class_property_add_uint64_ptr(ObjectClass *klass,
                                           const uint64_t *v,
                                           ObjectPropertyFlags flags);
 
+/**
+ * object_property_add_size_ptr:
+ * @obj: the object to add a property to
+ * @name: the name of the property
+ * @v: pointer to value
+ * @flags: bitwise-or'd ObjectPropertyFlags
+ *
+ * Add a property of type 'size' to the object.
+ *
+ * Returns: The newly added property on success, or %NULL on failure.
+ */
+ObjectProperty *
+object_property_add_size_ptr(Object *obj, const char *name,
+                             const uint64_t *v,
+                             ObjectPropertyFlags flags);
+
 #endif
diff --git a/qom/object-property-ptr.c b/qom/object-property-ptr.c
index 49f223da7b..21ceb2510d 100644
--- a/qom/object-property-ptr.c
+++ b/qom/object-property-ptr.c
@@ -107,6 +107,26 @@ static void property_set_uint64_ptr(Object *obj, Visitor *v, const char *name,
     *field = value;
 }
 
+static void property_get_size_ptr(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    uint64_t value = *(uint64_t *)opaque;
+    visit_type_size(v, name, &value, errp);
+}
+
+static void property_set_size_ptr(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    uint64_t *field = opaque;
+    uint64_t value;
+
+    if (!visit_type_size(v, name, &value, errp)) {
+        return;
+    }
+
+    *field = value;
+}
+
 ObjectProperty *
 object_property_add_bool_ptr(Object *obj, const char *name,
                              const bool *v, ObjectPropertyFlags flags)
@@ -285,3 +305,23 @@ object_class_property_add_uint64_ptr(ObjectClass *klass, const char *name,
     return object_class_property_add(klass, name, "uint64",
                                      getter, setter, NULL, (void *)v);
 }
+
+ObjectProperty *
+object_property_add_size_ptr(Object *obj, const char *name,
+                             const uint64_t *v,
+                             ObjectPropertyFlags flags)
+{
+    ObjectPropertyAccessor *getter = NULL;
+    ObjectPropertyAccessor *setter = NULL;
+
+    if ((flags & OBJ_PROP_FLAG_READ) == OBJ_PROP_FLAG_READ) {
+        getter = property_get_size_ptr;
+    }
+
+    if ((flags & OBJ_PROP_FLAG_WRITE) == OBJ_PROP_FLAG_WRITE) {
+        setter = property_set_size_ptr;
+    }
+
+    return object_property_add(obj, name, "size",
+                               getter, setter, NULL, (void *)v);
+}
-- 
2.53.0


