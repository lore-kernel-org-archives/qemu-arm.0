Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp397161ejb;
        Thu, 1 Jun 2023 05:21:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6xiToIQUUcBGdzcqmM4B9KOWjXRdeK8RxLmrifd2pgvOqzA6VfDwdwDQpEYGQiKUd3+K7W
X-Received: by 2002:a7b:c7cd:0:b0:3f6:105:8d87 with SMTP id z13-20020a7bc7cd000000b003f601058d87mr1997742wmk.14.1685622109028;
        Thu, 01 Jun 2023 05:21:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685622109; cv=none;
        d=google.com; s=arc-20160816;
        b=xW6UvdH5eonyRPrU44Fk26fobJeUtI1gd3hwVEvZHC7nd3azz9FtmrcxxWQfJamw5e
         r8OjJrMlpiW9OJPgHJMyxmU9sY8OHsK4tpzatpo3j1e0WPdGW23NQoQJ8D96tO32NyNH
         D9Cy33ICdUpyJ8ArBd/WVmQP3tlOPDW6TXFch3Iwi7OIqzspOD1HMQ4+jJWXdfmEJrHU
         JC4ZiMZAJ+j5AD3sFHoDVsgBUcrZXnmOrVxR5IjooEvYk77euH0X8wfZ7cFFT0u25fIj
         s6ivjyhoXQBqqlWkPPv66TLetXFELVes2qxxJiGcLWXFTDOrjvw1ba+dCguTX0YWAnqK
         7b8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HfiJtYRd+EKxQrb6oAD/0hu4+lwd/Z++BpXwDzN4BKk=;
        b=wss5ThXIN3bNUTnfpmzlyUF6LijPfuhd4DdFmcER9jNITxOcB8Xa1Ka3f9PBZchei+
         QfN2v1ST4Gf0Vh1fRgOB3IpJTGGDPt3PTju9lAYFmG2m5KaZAcwzSFsYhgxK6/rnPPQh
         37/nOyDTgTJ2zTIgJceJPr5djXVY9SzKBpUfT+txktQ1FcnSIzKWSEEEdfZq8RWKeNrP
         xeDpmOKVmx8Qmy1ysNdWO3Vu+YMUqRGyN/Zv56diIK6PoHKzxw/rrItg6TPy84apuqAX
         J77uoHeoREQRdUS0tVDFgH9QvJFIlfGsA0NtToNbA+Hvcpjkb215HBxdcCqbRhday1Qi
         VKuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fK2RzlmA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3-20020a05600c214300b003f4ef7df952si830767wml.132.2023.06.01.05.21.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Jun 2023 05:21:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fK2RzlmA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4hFP-0003py-Fx; Thu, 01 Jun 2023 08:17:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q4hD0-0000nz-2R
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 08:15:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1q4hCv-0006UD-VW
 for qemu-arm@nongnu.org; Thu, 01 Jun 2023 08:15:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1685621709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfiJtYRd+EKxQrb6oAD/0hu4+lwd/Z++BpXwDzN4BKk=;
 b=fK2RzlmAi7zidLHOe6x11QEaSFrEhc/Yl7KWzTimzhZAl95W+YBVHNGkANwC+enRkjovej
 Ne9K8z9GCyzfmYlh+z0+UMzbxUYYxMbbnTvwjY6xPY9UPHFkqm+Ade8X7wYr6g7ks6GxMD
 QcobDSah6gRiZ3eePPy8PAy7fmP0ZuI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-kqKoFzjgOamaWOAvRKIqRA-1; Thu, 01 Jun 2023 08:15:04 -0400
X-MC-Unique: kqKoFzjgOamaWOAvRKIqRA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 576E9185A78E;
 Thu,  1 Jun 2023 12:15:04 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.22.8.170])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA98E2166B25;
 Thu,  1 Jun 2023 12:15:02 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v3 08/10] hw/i386/pc: Remove PC_MACHINE_DEVMEM_REGION_SIZE
Date: Thu,  1 Jun 2023 14:14:45 +0200
Message-Id: <20230601121447.272487-10-david@redhat.com>
In-Reply-To: <20230601121447.272487-1-david@redhat.com>
References: <20230601121447.272487-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.166,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: uLA+orqNtPVs

There are no remaining users in the tree. Libvirt never used that
property and a quick internet search revealed no other users.

Further, we renamed that property already in commit f2ffbe2b7dd0
("pc: rename "hotplug memory" terminology to "device memory"") without
anybody complaining.

So let's just get rid of it.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Eduardo Habkost <eduardo@habkost.net>
Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/i386/pc.c         | 19 -------------------
 include/hw/i386/pc.h |  1 -
 2 files changed, 20 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 3d7f991368..96334cf60d 100644
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

