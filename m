Received: by 2002:a17:906:a205:b0:a52:4db9:938b with SMTP id r5csp645242ejy;
        Wed, 1 May 2024 11:33:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpvwLobVU7i/y4HaL/g8RTU+pCvFlJLnOFdBM5G5CeJzL5wF8NAnObH06S7ZyHwhCvA4GBH5F1nicr4hLfAnXIYHM9Tfdx
X-Google-Smtp-Source: AGHT+IHrvXKD4RQ2bzfjm2FDfJ2kkMAps0RWXgHyMwAhUdyyF9SiaqKKsagfMQ7/Lwt5+6gaVVct
X-Received: by 2002:a05:690c:d1c:b0:61b:9369:ef28 with SMTP id cn28-20020a05690c0d1c00b0061b9369ef28mr3737817ywb.9.1714588400377;
        Wed, 01 May 2024 11:33:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714588400; cv=none;
        d=google.com; s=arc-20160816;
        b=VlK1Md/KqpVHQdbhCK0r4DYNyfWUvq9T54MDMcYkk6WqXu7kybQFaRgjdCGKHPg6vR
         PchXh3hQNVtHnkYx8VhCOgitila9DNUXsA2pX+iDlWASy2lXVxFjIhMev8fGromIOVfW
         8SKG7ob/r3Qn0erM+Tv9GEBBqZjOJzRZDJkzxwrMwnOMqO6Pp7kVYn0/ksyWlckYDlnc
         SinUyx9aBRBZKURoiV+qvCvJT5Qmby4meEc+d4hWL/GPsnhSpGZlM1Qe5mg0bTpMvirI
         /8L+S+EK+SfJyQ0jYNFOz+0BIDp0D3U+5Z2Cfdrf1n06bxA2q9A6KztmJXQVCpdEphyP
         520w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Ke0YNYbnoXN8Yjpeec2ghn7fsjIWg8CqwiI8sUJouLY=;
        fh=+wZQXfkGrDFf08DRkV04g4pIKND0uH82z0Y2PgLJFoY=;
        b=KbLCoKXWAJ8f5OT7UdPElC+rZZWd0CQ5Pngfs3OUNsXRPxXld5BekA/gD8Y0wFDi3p
         mGC84PmpBhCFKBK6ze7NIBLWV9DqggEn6AV5qLrFqzWSfbVt+fmusv8GbVW2zodikTDi
         tnyCehm6EmB8S9NgSskRat19kMdNc2EB1NSgnkLu8evFbqDdQ0du7q0kYXWD0czzJ6GR
         x6ZlMk3Qamv8U0nMfDu7EqCA80CcGqNVqrhpJXddu5uxH8Oohtgjp4evinR2ZVSZRXtu
         8i6ChttW71wEPSOOU1JHpdc5u11keKf8e/EtIuUpKwrmjSwPmv8elgXkUfjAoE4Bh9Fk
         IOmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NFSi+ySg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14-20020a05622a188e00b0043b0856e79esi5970001qtc.431.2024.05.01.11.33.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2024 11:33:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NFSi+ySg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s2Ejf-0002CK-CE; Wed, 01 May 2024 14:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2Eig-0000ww-G2
 for qemu-arm@nongnu.org; Wed, 01 May 2024 14:30:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s2Eid-0003hE-UX
 for qemu-arm@nongnu.org; Wed, 01 May 2024 14:30:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714588213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ke0YNYbnoXN8Yjpeec2ghn7fsjIWg8CqwiI8sUJouLY=;
 b=NFSi+ySgFngx/OKVzgHIR8yodWdJMU4ksUcUW4wR/ORj/hFHndVcXYEvNrI7cmXkR3IMtG
 O6eV4q7nXz3T0W7jqZe0O821nkVUtHMX0/sfPurg7sKJrS+ezw85BB2XzLCfCjto1Tlz/v
 VA30ZQ8Sf4WjsMQwl0ESfPSydYFl25s=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-257-Ewdeei-uOr6t6kUQ2jwBjw-1; Wed,
 01 May 2024 14:30:03 -0400
X-MC-Unique: Ewdeei-uOr6t6kUQ2jwBjw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F7543C0274D;
 Wed,  1 May 2024 18:30:00 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.42.28.121])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 176846958;
 Wed,  1 May 2024 18:29:50 +0000 (UTC)
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
Subject: [PATCH 11/14] hw: skip registration of outdated versioned machine
 types
Date: Wed,  1 May 2024 19:27:56 +0100
Message-ID: <20240501182759.2934195-12-berrange@redhat.com>
In-Reply-To: <20240501182759.2934195-1-berrange@redhat.com>
References: <20240501182759.2934195-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.897,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: ix0YR+Jnw+jr

This calls the MACHINE_VER_DELETION() macro in the machine type
registration method, so that when a versioned machine type reaches
the end of its life, it is no longer registered with QOM and thus
cannot be used.

The actual definition of the machine type should be deleted at
this point, but experience shows that can easily be forgotten.
By skipping registration the manual code deletion task can be
done at any later date.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/arm/virt.c              | 1 +
 hw/m68k/virt.c             | 1 +
 hw/ppc/spapr.c             | 1 +
 hw/s390x/s390-virtio-ccw.c | 1 +
 include/hw/i386/pc.h       | 1 +
 5 files changed, 5 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index e2e10523a3..0786f82da6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -123,6 +123,7 @@ static void arm_virt_compat_set(MachineClass *mc)
     }; \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
+        MACHINE_VER_DELETION(__VA_ARGS__); \
         type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
     } \
     type_init(MACHINE_VER_SYM(register, virt, __VA_ARGS__));
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 37bb36b385..cda199af8f 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -356,6 +356,7 @@ type_init(virt_machine_register_types)
     }; \
     static void MACHINE_VER_SYM(register, virt, __VA_ARGS__)(void) \
     { \
+        MACHINE_VER_DELETION(__VA_ARGS__); \
         type_register_static(&MACHINE_VER_SYM(info, virt, __VA_ARGS__)); \
     } \
     type_init(MACHINE_VER_SYM(register, virt, __VA_ARGS__));
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 7f5412f2ed..2aad99a2f2 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4808,6 +4808,7 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     };                                                               \
     static void MACHINE_VER_SYM(register, spapr, __VA_ARGS__)(void)  \
     {                                                                \
+        MACHINE_VER_DELETION(__VA_ARGS__);                           \
         type_register(&MACHINE_VER_SYM(info, spapr, __VA_ARGS__));   \
     }                                                                \
     type_init(MACHINE_VER_SYM(register, spapr, __VA_ARGS__))
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 289a687434..723021f644 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -862,6 +862,7 @@ bool css_migration_enabled(void)
     };                                                                        \
     static void MACHINE_VER_SYM(register, ccw, __VA_ARGS__)(void)             \
     {                                                                         \
+        MACHINE_VER_DELETION(__VA_ARGS__);                                    \
         type_register_static(&MACHINE_VER_SYM(info, ccw, __VA_ARGS__));       \
     }                                                                         \
     type_init(MACHINE_VER_SYM(register, ccw, __VA_ARGS__))
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index acc17c7dac..a605f223d5 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -337,6 +337,7 @@ extern const size_t pc_compat_2_0_len;
     }; \
     static void MACHINE_VER_SYM(register, namesym, __VA_ARGS__)(void) \
     { \
+        MACHINE_VER_DELETION(__VA_ARGS__); \
         type_register(&MACHINE_VER_SYM(info, namesym, __VA_ARGS__)); \
     } \
     type_init(MACHINE_VER_SYM(register, namesym, __VA_ARGS__));
-- 
2.43.0

