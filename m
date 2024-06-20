Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1761178dlb;
        Thu, 20 Jun 2024 10:02:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWLxw91fzEehG74JfMICYeQJSsfKWGRhhJAZXkVcfbmllpYU8dhzeOA6xpMoAMnx7TH1gyH8ltifD/E2E5O6YBm7QdrAfVb
X-Google-Smtp-Source: AGHT+IEFVSernU8WCqCo+HNh2CPeVoEF865qDuRPECghtVh4vzJO0Jz6AWCHdmITahDockeMJF40
X-Received: by 2002:a05:620a:170f:b0:79a:2fcb:ed4f with SMTP id af79cd13be357-79bb3e1a1b3mr714378985a.13.1718902957099;
        Thu, 20 Jun 2024 10:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718902957; cv=none;
        d=google.com; s=arc-20160816;
        b=tNyitKv6urUTYujBu8WnpckGHf7Gl57+RYMSanIDatebgYPlJZzQKmhMslv1I5QtEx
         UQdJqr4Y6GxwDH/dfDWz3az6purCHNHWRBwjjBASY0F5hbcYTnMmvBcUc5vota9yYIes
         Gyj6bMwyHVH5rN7mln9gPptjTbIy0GKKxknOocqyKlud/KpeUtl0tAHWNh+PF2SgZSME
         /ZoxFOYTO4vFx2mn1R25p0r7IguTgVYMcytnAIlRDPQd4w0tDDMfiubW+vXf9L6QfEiO
         Co+rYICANLJDGZY+eiNp+3NV3vnMjE9mZFkMQK1t0I4ExoLGB+JK++L1RHuIKQppJx6f
         xiug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=62rjxcJ3nmchiyP3ljOtuxEnPhE805Y+giHJJYqlDdU=;
        fh=3Wd8C5ILZWfK4GrPw00UkAAsfCUTnUYMb3cFGB6sOew=;
        b=jPr/cSEYlT6lTQBvpzTXhniSaYK3K/+mxQIWuRzd+vqdILi0r7m5z2lrKvDgzDLaVn
         eatesiHF+hI/od4nfHXdMOXKRKDSYhKoBGmv7tqH/UXVbOEMERCH6M/7d924eUfn5DOL
         gIeecue0GvMFt0tLa7ze7YUAvWR6pQAkVFindBhCFEEgzDJrNjCUmM7b3kYX/ZvAtkA9
         Y5siAfRy8mdmQQeI6iMZZ0vYjjqzlhmPO3OX67LFB1gCo4vgBGi1SUs9HeRjiGtup7p6
         SzzUbY9cl/2JSCtdJz37UdsFTy9s8ZaQzzfWvfME4gtxapo6M6Is1s/n5Uh7gO/Tp2Ia
         5oYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XVLqImQq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798ac089d5fsi1734403385a.741.2024.06.20.10.02.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 10:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XVLqImQq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKL8L-0008PL-Hs; Thu, 20 Jun 2024 12:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL8K-0008KN-Op
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 12:59:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL8H-00018L-MD
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 12:59:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718902773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=62rjxcJ3nmchiyP3ljOtuxEnPhE805Y+giHJJYqlDdU=;
 b=XVLqImQqaxeLVT3VA72N4pYVRd0w3oKhHdLl+2hGbWxv/+FDs1CLk03TdaNpmYAV+EtrwX
 SZhnAQuapaT7yPsPIYV6oYofi0PMjy+7x9LV/L7UigXzyV7CjOZowjVIht8yF05Dp2iygd
 nC/fJVZup6p/3XqatrjvquFzcRVKRO8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-63-3_hYD_v-Nm2FIUWa37YF8Q-1; Thu,
 20 Jun 2024 12:59:27 -0400
X-MC-Unique: 3_hYD_v-Nm2FIUWa37YF8Q-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BFC7219560A7; Thu, 20 Jun 2024 16:59:23 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.42.28.69])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2D45519560AF; Thu, 20 Jun 2024 16:59:13 +0000 (UTC)
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
Subject: [PATCH v2 10/14] hw: set deprecation info for all versioned machine
 types
Date: Thu, 20 Jun 2024 17:57:38 +0100
Message-ID: <20240620165742.1711389-11-berrange@redhat.com>
In-Reply-To: <20240620165742.1711389-1-berrange@redhat.com>
References: <20240620165742.1711389-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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
X-TUID: //4l9JGysulT

This calls the MACHINE_VER_DEPRECATION() macro in the definition of
all machine type classes which support versioning. This ensures
that they will automatically get deprecation info set when they
reach the appropriate point in their lifecycle.

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
index a326aa24db..ef6591d914 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -110,6 +110,7 @@ static void arm_virt_compat_set(MachineClass *mc)
         arm_virt_compat_set(mc); \
         MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
         mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " ARM Virtual Machine"; \
+        MACHINE_VER_DEPRECATION(__VA_ARGS__); \
         if (latest) { \
             mc->alias = "virt"; \
         } \
diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index cd6ee692f7..37bb36b385 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -343,6 +343,7 @@ type_init(virt_machine_register_types)
         MachineClass *mc = MACHINE_CLASS(oc); \
         MACHINE_VER_SYM(options, virt, __VA_ARGS__)(mc); \
         mc->desc = "QEMU " MACHINE_VER_STR(__VA_ARGS__) " M68K Virtual Machine"; \
+        MACHINE_VER_DEPRECATION(__VA_ARGS__); \
         if (latest) { \
             mc->alias = "virt"; \
         } \
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2785b6b303..55268489d3 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4811,6 +4811,7 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
     {                                                                \
         MachineClass *mc = MACHINE_CLASS(oc);                        \
         MACHINE_VER_SYM(class_options, spapr, __VA_ARGS__)(mc);      \
+        MACHINE_VER_DEPRECATION(__VA_ARGS__);                        \
         if (latest) {                                                \
             spapr_machine_latest_class_options(mc);                  \
         }                                                            \
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index efed539bc6..4cc7567872 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -825,6 +825,7 @@ static const TypeInfo ccw_machine_info = {
         MachineClass *mc = MACHINE_CLASS(oc);                                 \
         MACHINE_VER_SYM(class_options, ccw, __VA_ARGS__)(mc);                 \
         mc->desc = "Virtual s390x machine (version " MACHINE_VER_STR(__VA_ARGS__) ")"; \
+        MACHINE_VER_DEPRECATION(__VA_ARGS__);                                 \
         if (latest) {                                                         \
             mc->alias = "s390-ccw-virtio";                                    \
             mc->is_default = true;                                            \
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 027c6f29f7..83d2e66498 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -330,6 +330,7 @@ extern const size_t pc_compat_2_3_len;
         MachineClass *mc = MACHINE_CLASS(oc); \
         MACHINE_VER_SYM(options, namesym, __VA_ARGS__)(mc); \
         mc->init = MACHINE_VER_SYM(init, namesym, __VA_ARGS__); \
+        MACHINE_VER_DEPRECATION(__VA_ARGS__); \
     } \
     static const TypeInfo MACHINE_VER_SYM(info, namesym, __VA_ARGS__) = \
     { \
-- 
2.43.0

