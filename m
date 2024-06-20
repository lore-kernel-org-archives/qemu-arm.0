Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1760522dlb;
        Thu, 20 Jun 2024 10:01:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXTjeEt/nqAR4i0f2HSi5NVTixwbgVwfr2v4XKusg9kUi91d9z1bAusn64+U84hMs0DslbK4QgIEW6FOdmGWyWV6OWESAhU
X-Google-Smtp-Source: AGHT+IH4QDBL0qRsng/wJjHgbNF6NZdu7b4lRH0bwaoUP8oFHgClHBTcA8eNPPy4HKfVhDRAa+P7
X-Received: by 2002:a0c:df82:0:b0:6b2:bc45:a7db with SMTP id 6a1803df08f44-6b501e0b7efmr72890006d6.2.1718902915363;
        Thu, 20 Jun 2024 10:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718902915; cv=none;
        d=google.com; s=arc-20160816;
        b=S3VcEFIsxS4V0epxApC6VR/AGQaFJ1kBehG/hTQG+wgQh42x0Rgg7Qkxfoc1qKgnXX
         owef2YG72K6w5vtgIepfbWrWr0CmTJKnWUu+EJ7M9qLcWVZvOqGuiyNfrEG4gJKTwSZW
         AH2ho4zsojKFBZSsv8g3T9lGE2EGP03uQLBX1ZMXiZOEFgGwpmRaWLXnw7+ko4KmyJbK
         9OvXu0h3aZ4DZysiQIbe2fgjA9illgmFjT9i8YIEOk0bh/U8kCLFrlDD0+p5btqBNrcp
         cQiYGdY3+ekffBqFei1Q7CbJQ9OXH6O1Aa+OpKO3HOp/0VXCUj72HXfdXDc1B7t9/J9V
         NrAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8/owPdu5/iJ48Xgy+KKO46Gh3iwTxELUGA2Cx8B6spU=;
        fh=3Wd8C5ILZWfK4GrPw00UkAAsfCUTnUYMb3cFGB6sOew=;
        b=bT/FO3jzLTu7PD3mjr3GibcGZe/jKJeQNpVIgKH1DucAFKMeqYeoC7j/02ubt9ywbU
         eZUGQPUYxRLRUrdIdQWjzbmfmLE7uED4a8mgvckgWjZzXLBvbDPO6OLIispDkX9OwyRN
         qqkj7d5NLZjo8eL8SqXJgr86dp0a2RxYtUCHzRk4z4yuHTawUcOtrWYAC7iys3PkRbw+
         X69UzYxSfoylAYuSLLAOkkPzSBYkxpVtfAofXY8oOrQCYEMj6CRCC6NZIXXJMlzDnwEX
         iD0ndHCZSkVbhK8wIsXc+GfdFxLfYJ9DGR7zr4PXx5XJ21hhMuTEnXB51X4M4Ycc8tzn
         UFCQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fznILTsV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b2a5a3420esi145800186d6.156.2024.06.20.10.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 10:01:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fznILTsV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sKL8W-0000Tk-E7; Thu, 20 Jun 2024 12:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL8R-0000Nq-5F
 for qemu-devel@nongnu.org; Thu, 20 Jun 2024 12:59:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL8O-0001BP-A6
 for qemu-devel@nongnu.org; Thu, 20 Jun 2024 12:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718902779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/owPdu5/iJ48Xgy+KKO46Gh3iwTxELUGA2Cx8B6spU=;
 b=fznILTsVclj4JJC7bITQfxFSbBONCaS7XaTB7Fmarl63QRYYYSUi8Mu3ogwMzjvi3HmT53
 OW6EH6U61600HH3hy9FMKfyF+ckx9/sEosYf5NQX5BpxmAxYWDE61w74k89nUd9OAf/pjU
 7sphEOanlnhMBhysGCBdmzJoplELGPQ=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-78-Hag_DufFMKSF0R3eIlsnVg-1; Thu,
 20 Jun 2024 12:59:35 -0400
X-MC-Unique: Hag_DufFMKSF0R3eIlsnVg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 43C6F195608B; Thu, 20 Jun 2024 16:59:32 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.42.28.69])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0657519560AF; Thu, 20 Jun 2024 16:59:23 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Halil Pasic <pasic@linux.ibm.com>, devel@lists.libvirt.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clegoate@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 11/14] hw: skip registration of outdated versioned machine
 types
Date: Thu, 20 Jun 2024 17:57:39 +0100
Message-ID: <20240620165742.1711389-12-berrange@redhat.com>
In-Reply-To: <20240620165742.1711389-1-berrange@redhat.com>
References: <20240620165742.1711389-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.152,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wE8XM4+JRc3/

This calls the MACHINE_VER_DELETION() macro in the machine type
registration method, so that when a versioned machine type reaches
the end of its life, it is no longer registered with QOM and thus
cannot be used.

The actual definition of the machine type should be deleted at
this point, but experience shows that can easily be forgotten.
By skipping registration the manual code deletion task can be
done at any later date.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/arm/virt.c              | 1 +
 hw/m68k/virt.c             | 1 +
 hw/ppc/spapr.c             | 1 +
 hw/s390x/s390-virtio-ccw.c | 1 +
 include/hw/i386/pc.h       | 1 +
 5 files changed, 5 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index ef6591d914..ab4a0d9ed6 100644
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
index 55268489d3..044e6a8d9d 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4824,6 +4824,7 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     };                                                               \
     static void MACHINE_VER_SYM(register, spapr, __VA_ARGS__)(void)  \
     {                                                                \
+        MACHINE_VER_DELETION(__VA_ARGS__);                           \
         type_register(&MACHINE_VER_SYM(info, spapr, __VA_ARGS__));   \
     }                                                                \
     type_init(MACHINE_VER_SYM(register, spapr, __VA_ARGS__))
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 4cc7567872..0cb8c595a2 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -846,6 +846,7 @@ static const TypeInfo ccw_machine_info = {
     };                                                                        \
     static void MACHINE_VER_SYM(register, ccw, __VA_ARGS__)(void)             \
     {                                                                         \
+        MACHINE_VER_DELETION(__VA_ARGS__);                                    \
         type_register_static(&MACHINE_VER_SYM(info, ccw, __VA_ARGS__));       \
     }                                                                         \
     type_init(MACHINE_VER_SYM(register, ccw, __VA_ARGS__))
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 83d2e66498..4e55d7ef6e 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -340,6 +340,7 @@ extern const size_t pc_compat_2_3_len;
     }; \
     static void MACHINE_VER_SYM(register, namesym, __VA_ARGS__)(void) \
     { \
+        MACHINE_VER_DELETION(__VA_ARGS__); \
         type_register(&MACHINE_VER_SYM(info, namesym, __VA_ARGS__)); \
     } \
     type_init(MACHINE_VER_SYM(register, namesym, __VA_ARGS__));
-- 
2.43.0

