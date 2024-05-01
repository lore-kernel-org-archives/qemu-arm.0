Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp643062ejy;
        Wed, 1 May 2024 11:29:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5IjVbLbANuiRp8TdF+3pQ4Zw3TIt0++yY4HK/9ZpIwlktCkSae460KMFRfFUHwMwRNzeSnIr+ugcmYoGx5uyp4TuWmV9K
X-Google-Smtp-Source: AGHT+IHGzEpWpE9dORkvG+K3rlshm9s+K+ingRr9ZWxDSSbWt0nEp4Luey/SB6e34WBhBM4UHAak
X-Received: by 2002:a05:620a:118e:b0:790:a961:373a with SMTP id b14-20020a05620a118e00b00790a961373amr873210qkk.31.1714588180608;
        Wed, 01 May 2024 11:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714588180; cv=none;
        d=google.com; s=arc-20160816;
        b=Yl3gwrOFKBX3fhjyKFQE8hZCD+JoZTvc3GmDcqf+MsPh2YxCMiu2n362yTNt0x8G9r
         jyS6tV7GNilcL7T8c7bUYRhkv1m1UOeTZs1rGYeGv3QSTHqvqeJimVuEDAPD0VAcDDw6
         pff/gIHkL54dW8n65YuRvLNamPYXLNAPLU77qlaUm8EA8yRNWH272BL0C1sYFHsjixFL
         Ig1ALdb9uOiaUwMBLv/Icw7edagp8J0WOaUaxu1wpHHlNt2El1BlgoUhJU+UsskAMqVf
         vJ4L3wMGFCLBMpfouiGQwm9oNN6YQiCVBKaK4EkF/8GnpyRGWwUD5tKYqi0W17FdyYVj
         1jgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GfZjvRgY+N1hSW4FRFPg1V3Orbmg+ibOyYup93C+b3Y=;
        fh=+wZQXfkGrDFf08DRkV04g4pIKND0uH82z0Y2PgLJFoY=;
        b=LX0DO8gOx4fBcQyZGg9EXacJUWKmddG6yLaE595FqNfvHakCTYVuwFwAuhLxcZpy9R
         khQWH+TDyjRK0wCpsaW5lf5QYzrsOGHubrGvViLDNGTThmeMoF68C9jYVNDAT7Hb8q8z
         Nr7jawSNya98ANRgNF/Rri1TOJBjew0EmgPwkILb+HT0DOjma4kQCit6lMTveECCYyTu
         HwU62G/dWFvi+JamFbzXDZxubsaugKBMVgkwf0lHJuLYcYoNpDJi9DaDTl9EBSLv4cwH
         PKIMG6+SbkOW1YK2C7CpdyzoAbfPEoBQf9mUHbk1xCPhsUM9lM+7HVO83mA+RZMuvbJk
         zm1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UA9nKFHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj41-20020a05620a1da900b0078f066ae1c8si29760008qkn.470.2024.05.01.11.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2024 11:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UA9nKFHQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2Eh6-0006EN-Ga; Wed, 01 May 2024 14:28:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2Eh5-0006Di-9Y
 for qemu-arm@nongnu.org; Wed, 01 May 2024 14:28:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2Eh2-0003J2-NJ
 for qemu-arm@nongnu.org; Wed, 01 May 2024 14:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714588116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GfZjvRgY+N1hSW4FRFPg1V3Orbmg+ibOyYup93C+b3Y=;
 b=UA9nKFHQ8IO6KtExUyLCmAio2LL/46LERXX/P9zqeFKaXxJqC80fcT9Z6LiAeuLGkb9vac
 1QtMnRSLEd/89n/Uv18FUzHwDKSY2Bzh8ZJXMMHTo3DTi9RobaDTlL6XQ1sNpX0um3KT3o
 e6KemMjyfpCUkcJ1exiKZrXRubQ58Fs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-A9S8f-g_OUmaAcYVWFtxJQ-1; Wed, 01 May 2024 14:28:32 -0400
X-MC-Unique: A9S8f-g_OUmaAcYVWFtxJQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9237830D37;
 Wed,  1 May 2024 18:28:31 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.42.28.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 879FC8C4;
 Wed,  1 May 2024 18:28:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clegoate@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-arm@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 02/14] hw/arm: convert 'virt' machine definitions to use new
 macros
Date: Wed,  1 May 2024 19:27:47 +0100
Message-ID: <20240501182759.2934195-3-berrange@redhat.com>
In-Reply-To: <20240501182759.2934195-1-berrange@redhat.com>
References: <20240501182759.2934195-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.897,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QajGumFMbd4r

This changes the DEFINE_VIRT_MACHINE macro to use the common
helpers for constructing versioned symbol names and strings,
bringing greater consistency across targets.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/arm/virt.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 3c93c0c0a6..24b104dfa7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -101,33 +101,35 @@ static void arm_virt_compat_set(MachineClass *mc)
                      arm_virt_compat_len);
 }
 
-#define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
-    static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
-                                                    void *data) \
+#define DEFINE_VIRT_MACHINE_IMPL(latest, ...) \
+    static void MACHINE_VER_SYM(class_init, virt, __VA_ARGS__)( \
+        ObjectClass *oc, \
+        void *data) \
     { \
         MachineClass *mc = MACHINE_CLASS(oc); \
         arm_virt_compat_set(mc); \
-        virt_machine_##major##_##minor##_options(mc); \
-        mc->desc = "QEMU " # major "." # minor " ARM Virtual Machine"; \
+        MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
+        mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " ARM Virtual Machine"; \
         if (latest) { \
             mc->alias = "virt"; \
         } \
     } \
-    static const TypeInfo machvirt_##major##_##minor##_info = { \
-        .name = MACHINE_TYPE_NAME("virt-" # major "." # minor), \
+    static const TypeInfo MACHINE_VER_SYM(info, virt, __VA_ARGS__) = \
+    { \
+        .name = MACHINE_VER_TYPE_NAME("virt", __VA_ARGS__), \
         .parent = TYPE_VIRT_MACHINE, \
-        .class_init = virt_##major##_##minor##_class_init, \
+        .class_init = MACHINE_VER_SYM(class_init, virt, __VA_ARGS__), \
     }; \
-    static void machvirt_machine_##major##_##minor##_init(void) \
+    static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
-        type_register_static(&machvirt_##major##_##minor##_info); \
+        type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
     } \
-    type_init(machvirt_machine_##major##_##minor##_init);
+    type_init(MACHINE_VER_SYM(register, virt, __VA_ARGS__));
 
 #define DEFINE_VIRT_MACHINE_AS_LATEST(major, minor) \
-    DEFINE_VIRT_MACHINE_LATEST(major, minor, true)
+    DEFINE_VIRT_MACHINE_IMPL(true, major, minor)
 #define DEFINE_VIRT_MACHINE(major, minor) \
-    DEFINE_VIRT_MACHINE_LATEST(major, minor, false)
+    DEFINE_VIRT_MACHINE_IMPL(false, major, minor)
 
 
 /* Number of external interrupt lines to configure the GIC with */
-- 
2.43.0

