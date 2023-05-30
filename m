Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2108384ejb;
        Tue, 30 May 2023 04:40:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ57lSfYZiL2pB0ArAogVD0JU6aTNtms6MhQU3q7w4ASz761VbTNX2m0F6EQVRvIxJToiAm6
X-Received: by 2002:ad4:5de4:0:b0:625:7fbc:d23f with SMTP id jn4-20020ad45de4000000b006257fbcd23fmr1417653qvb.34.1685446857823;
        Tue, 30 May 2023 04:40:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685446857; cv=none;
        d=google.com; s=arc-20160816;
        b=Mi8zt3wPHCqooJYlfr46VFjcsNh/eSNFsMcX9gR3nvNVsZLTIvquhz8HDxADe45Cbn
         KFjmIa1n+Mlfj9DL3Jz0nUkshYlH7bkok8Er4Gq4zGI6WRqXfJrQtxdND2v86WyMTO9F
         k82+6+QorZvC88sZwdWHtrri3AxK6oqsz1K2CxGeQzh8mBNk07CD3aWnX1qe4AKLWjk9
         mRMJ/iLje+Wla1AWB2ooOm2AV0b4J0h3CxzP8BT2rWYJ2Iuv8CCTykfqwq7r4oqZyvm4
         66bRg9i+jZJR7Or1RYwf6+kGpol9LlZm0Del5rWo/uteeb2q3RWQxbtKl4iuJQv7enTF
         U6Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=y1o8JwHfKO0g83U4avSDTqgBOKXfwEYHCi8B3HZYx1E=;
        b=m9QhQaCpI256XNpw7Vk/XQN+Nl8SuXckaO8iUraM3ho3XnXTa4/2mJS3ddqeDjOaxh
         naPEw3HWZo193lMk4njb89iV9TZAh5JGlSNzdsk/k2GRudBfjBDOlz/ID3fo/OKTDaL2
         KARoKIB+e0upuA5iINrQYWm4oP2lUvm/KeXm8+G1R2w8fr2ulI2wIm6iCCrvwKsCuxjJ
         6um4OBb3b9JMwXJlw76WaZdFBZaMh4JisaPs/kLiSemc5r6QXvKoxfyUYjwpC4AeDFX5
         57ubUoK8l19OAMEOEbQnrxHjwwhlxwZ5cA5j/lcrwkf4VoBCFmvj15NA+n2ql4YFcdYa
         HnTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RpPJDXWE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv9-20020a056214262900b00624d4b91560si4386953qvb.395.2023.05.30.04.40.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 04:40:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=RpPJDXWE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q3xhI-00087v-Rp; Tue, 30 May 2023 07:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xhF-00083L-5t
 for qemu-devel@nongnu.org; Tue, 30 May 2023 07:39:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q3xhC-0004EH-Nd
 for qemu-devel@nongnu.org; Tue, 30 May 2023 07:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685446762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y1o8JwHfKO0g83U4avSDTqgBOKXfwEYHCi8B3HZYx1E=;
 b=RpPJDXWE7NfMxksijWJorH1DlE38cSphCZb7GIjxgU+xH94+SS2RNAaKgsOKqcTYze2qJ3
 Q5wGNU8QFLXPzG9dIv3fA5G9B5ivsMumGiPygklrSUYWz/geekKCADIYgxygrYKocmf7aS
 1VVLr4QbMJmA3ExdjGdcYEyn2jkLBvI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-538-EfHJyXHsNU6Zxu4j8ONrqQ-1; Tue, 30 May 2023 07:39:15 -0400
X-MC-Unique: EfHJyXHsNU6Zxu4j8ONrqQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 065192A59566;
 Tue, 30 May 2023 11:39:15 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.194.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A25E540CFD45;
 Tue, 30 May 2023 11:39:11 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH 08/10] hw/i386/pc: Remove PC_MACHINE_DEVMEM_REGION_SIZE
Date: Tue, 30 May 2023 13:38:36 +0200
Message-Id: <20230530113838.257755-9-david@redhat.com>
In-Reply-To: <20230530113838.257755-1-david@redhat.com>
References: <20230530113838.257755-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: QMqjab1EzJ83

There are no remaining users in the tree, so let's remove it.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/i386/pc.c         | 19 -------------------
 include/hw/i386/pc.h |  1 -
 2 files changed, 20 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 920aa32b53..c4789e2f35 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1646,21 +1646,6 @@ static HotplugHandler *pc_get_hotplug_handler(MachineState *machine,
     return NULL;
 }
 
-static void
-pc_machine_get_device_memory_region_size(Object *obj, Visitor *v,
-                                         const char *name, void *opaque,
-                                         Error **errp)
-{
-    MachineState *ms = MACHINE(obj);
-    int64_t value = 0;
-
-    if (ms->device_memory) {
-        value = memory_region_size(&ms->device_memory->mr);
-    }
-
-    visit_type_int(v, name, &value, errp);
-}
-
 static void pc_machine_get_vmport(Object *obj, Visitor *v, const char *name,
                                   void *opaque, Error **errp)
 {
@@ -1980,10 +1965,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_set_description(oc, PC_MACHINE_MAX_RAM_BELOW_4G,
         "Maximum ram below the 4G boundary (32bit boundary)");
 
-    object_class_property_add(oc, PC_MACHINE_DEVMEM_REGION_SIZE, "int",
-        pc_machine_get_device_memory_region_size, NULL,
-        NULL, NULL);
-
     object_class_property_add(oc, PC_MACHINE_VMPORT, "OnOffAuto",
         pc_machine_get_vmport, pc_machine_set_vmport,
         NULL, NULL);
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index c661e9cc80..6c9ad2d132 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -60,7 +60,6 @@ typedef struct PCMachineState {
 
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
 #define PC_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
-#define PC_MACHINE_DEVMEM_REGION_SIZE "device-memory-region-size"
 #define PC_MACHINE_VMPORT           "vmport"
 #define PC_MACHINE_SMBUS            "smbus"
 #define PC_MACHINE_SATA             "sata"
-- 
2.40.1

