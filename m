Received: by 2002:a05:7022:f201:b0:7e:eb73:5b3b with SMTP id rf1csp1758346dlb;
        Thu, 20 Jun 2024 09:59:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVgkqlRVY/mM7Bl4rA4rHVB3bkOnGDbznpf7rHayFrZvngXMv2q0O64NBGv1ksUz4f55/t0ecxbkBnZJrBP9yjhV5W84C9Y
X-Google-Smtp-Source: AGHT+IHSovd2Z97QyHlAECaoM3/qk1Co6eSZsROZjfU898+Mx6LpIe56g/BgrF0r0l+3SmZuB5it
X-Received: by 2002:ac8:5a04:0:b0:43a:ea03:31b7 with SMTP id d75a77b69052e-444a7a4ab81mr70353041cf.52.1718902742350;
        Thu, 20 Jun 2024 09:59:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718902742; cv=none;
        d=google.com; s=arc-20160816;
        b=BfUktNmYdGBUUMAky28dNRXcud1PFDlVf37CxUwPUKCtO4mhimuPCUmy7oN9LJD5K0
         6Y8jhh1Tk4Vh1joNZDQyHOhc3e8WLFEJho2uXgwob8qn3ydTXDsPYiDZltJ29BvVKMqJ
         vlsVaC08KtpDyu9yWo2ez2X3JG28ErTJhkFcZY/2ErdlyqiRJaNDJz+f5cHAmBKWzJ64
         XjsCIzu6HpdFm6I3F59hc0ipZ087jlFI9Cgl7JrPAFMGHIVylrwLn8mxGcDoGUYmmaMq
         Q5hTvlDq0r+MnXAPMOruvjnH7VhDirxfg8LxE3RHDhUoUmpUC7FQxltgomhK2lsrarjo
         YCMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W26zUu3tzIuzLwn1cRO3MRqBR1pUCXsSQEhk0LfTWoM=;
        fh=3Wd8C5ILZWfK4GrPw00UkAAsfCUTnUYMb3cFGB6sOew=;
        b=J7vnip2XfgTrFEv8saunDu+rB82ZMwFhZku2zfm169osfbvq2DbDVAUKPg0NWHICtE
         FbJ6/HxayiPDFLcTvvpKRET1ulFx48scNEtWZt3HcuaLz0j5g7JiF7zZZ+WdzHQGJchi
         WEnWGORGj2cpygy3hYmFiqoLezjNHJyuYbxY9Ps/uLlqIwnCanQb8XfdMMhPrd1AnT29
         kxDyh3HsnHVLze2tPeAe/nKM7cPR7pCEFJikZdDlCeUKjWvNITV9Gc+99V9tzmi7+hRt
         Pz7r7HMcPZNaRlS6g7mumqXYhgUTAIDU5cYzHSDEagowwZAO9GNFK21M6oST74XWxfXk
         /IGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HLZRe1Qy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4449826f2adsi85927341cf.212.2024.06.20.09.59.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2024 09:59:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HLZRe1Qy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sKL7C-0005Yv-3T; Thu, 20 Jun 2024 12:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL7A-0005Wr-Pw
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 12:58:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1sKL79-0000vo-Cj
 for qemu-arm@nongnu.org; Thu, 20 Jun 2024 12:58:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718902702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W26zUu3tzIuzLwn1cRO3MRqBR1pUCXsSQEhk0LfTWoM=;
 b=HLZRe1QykIg9XSV/AmEYJYPtV7JwEZtBswYaAY0+k2gzLJOPzLd6YmAAlHvUaHMTh/Jt5J
 2PZ/jv565Ny6eQInK/Y67836O2bC2nK1BW/aEDJQVBY3BtFu6lCN8Nx2rfSjFgdDmJlFVH
 6YUzc6G5XKZD3ujbVf3PqpZ0IbnQ4Zo=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-70-nnqil8olNBWpHYhM9LHVmQ-1; Thu,
 20 Jun 2024 12:58:18 -0400
X-MC-Unique: nnqil8olNBWpHYhM9LHVmQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2166C1956087; Thu, 20 Jun 2024 16:58:13 +0000 (UTC)
Received: from toolbox.redhat.com (unknown [10.42.28.69])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0634D19560B0; Thu, 20 Jun 2024 16:58:03 +0000 (UTC)
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
Subject: [PATCH v2 02/14] hw/arm: convert 'virt' machine definitions to use
 new macros
Date: Thu, 20 Jun 2024 17:57:30 +0100
Message-ID: <20240620165742.1711389-3-berrange@redhat.com>
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
X-TUID: sSjF7/uPNTIy

This changes the DEFINE_VIRT_MACHINE macro to use the common
helpers for constructing versioned symbol names and strings,
bringing greater consistency across targets.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/arm/virt.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c7a1f754e7..a326aa24db 100644
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

