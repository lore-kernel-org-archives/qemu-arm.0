Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1359739lfr;
        Tue, 6 Apr 2021 04:14:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPfqDuuy6YnJ1QBU8PECmrnOfN0qTEAtZCDZhynRnjX8pdE3i7neP80ZliEqRzKr+iv8u2
X-Received: by 2002:a05:6e02:219c:: with SMTP id j28mr23440619ila.229.1617707694760;
        Tue, 06 Apr 2021 04:14:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617707694; cv=none;
        d=google.com; s=arc-20160816;
        b=Qu8a8cVs+cdReyZph6TkNJxDYFY/THF2rx4dKLkyR2jdPdmLQ6NRAXiQ9N82XK/hHK
         Cs+9D4nT1N11raRblxUPDVNRgz0FZrekXiHUbhw2/qUsV/3ZJ2h8ayKnlcj+LUbyT2eX
         V4QQhgN06cu/imNsBaAQx4RzPuqjwaMaiqkuIICPkel6XIjGpRF9CGdk9JTY2EM5hY+i
         DInPmK+831JNDCkBwmE3MQA+uo8sqW0me/MO9lCRYlJuWjtWGbXhZ6+TO6KRjMvNURta
         S3EEOpn6H1u1klZxzhe7ihZAuJ5p0ykBVwV00ejEUgVdG5plWlquQ9Xt/1USENKKgDS0
         UkEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=86rFKf/dpnhWd5MFpmO2yEWECsP2Q5v5meodLK7mXCw=;
        b=Ipjyb4y95xgPN72nhZ9xm4Af4RbiwsU858Y/vO2pqacKRdT+4MJRctZcfWnzwg8sEj
         h+NO372CCOdWXVozCPZr0liOSyV4aUz0w+B537AiWi/dXdN62rV0j7YgqdRj9AV+C93M
         42blSYcbtuuuSAiNUhgvjSJ/z1FTJzh7UG/KT9+ge/ER986vTu1TsRIXvcm4Rt04g0/a
         gREg1NisMwyHT9TM2J/SMNqB+yWnJsxIom8LLfKSIcMv4+y0dZ0KpEOPIOg1O1ihHW5M
         svjWElWKIsxrbamWyssAYvbtba/ZJh0lo+vG72J8g6sleH5hiUjniLpXKD6JACDH6s9t
         rTaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d9WIzlvM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si17893851iog.76.2021.04.06.04.14.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Apr 2021 04:14:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=d9WIzlvM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lTjfZ-0000W4-W5
	for alex.bennee@linaro.org; Tue, 06 Apr 2021 07:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lTjf5-0000UJ-Eb
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 07:14:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lTjf3-0005vR-Hx
 for qemu-arm@nongnu.org; Tue, 06 Apr 2021 07:14:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617707660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86rFKf/dpnhWd5MFpmO2yEWECsP2Q5v5meodLK7mXCw=;
 b=d9WIzlvMnJAYDtLGvq4/Zi8IyjCF1F/Mkxjj9qUJTPz4PYmUe3C3wUC7Z1ViySnsgPbCGN
 GlQgdS6AdHmOF4kn9sQ9+xUEIt+kKTAivojT67IgtYAtBdsUvyr3m0EipPw/5ggW8um94F
 9/50EA0uWeqBzuw/tkVSmzHLfqWfa4c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-KKG0YSsjOLufT0pLHDuAhg-1; Tue, 06 Apr 2021 07:14:18 -0400
X-MC-Unique: KKG0YSsjOLufT0pLHDuAhg-1
Received: by mail-wm1-f69.google.com with SMTP id a65so73389wme.5
 for <qemu-arm@nongnu.org>; Tue, 06 Apr 2021 04:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=86rFKf/dpnhWd5MFpmO2yEWECsP2Q5v5meodLK7mXCw=;
 b=c2SCA0uliLZtmyjJ3/i47eo30w5wvQ9f5+a2S7F/jtVHPKkP39Efjsi+Faofrll3xe
 GAQWp23MoXmeUwuhkL8Mpur00swXRlXyzcCUvGiL8hLuKb+MZuZwrpkVcbvMDBd0K+hC
 ZXmlGqvs03boTI07Xc6Db8tKQ984/zfk4F990+erNzCv5HWr/VtOPQAgfrPuCV8SCmE+
 aAsuXQaqbia5EloAK1WW8x9RVbB7VVMYWeyYsn9BWD7Gr91RaWS45/fTOi7bJlncfyF2
 HahEjotjKREdTgZbnsiXkl3XiGrtvaOAoZfWN/W7w3OurLBj0EGBt61JgfrdXvyksWJU
 1W6g==
X-Gm-Message-State: AOAM532w/hUN05RWmvqbgbgZQ38kVIr1EZfobQxoXuCL62XfLrQVDCGT
 sLBR/lzzq5q3WFdpIww5SkCsB3ie5swnq1Em5MqK+F2Cqp6w2IAh+smGJjZnvR/IAo7SarqVoVE
 EjCC64QLQepXM
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr35814641wrn.338.1617707656991; 
 Tue, 06 Apr 2021 04:14:16 -0700 (PDT)
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr35814617wrn.338.1617707656824; 
 Tue, 06 Apr 2021 04:14:16 -0700 (PDT)
Received: from redhat.com (bzq-79-183-252-180.red.bezeqint.net.
 [79.183.252.180])
 by smtp.gmail.com with ESMTPSA id o1sm4834072wrw.23.2021.04.06.04.14.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 04:14:16 -0700 (PDT)
Date: Tue, 6 Apr 2021 07:14:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/2] x86: rename oem-id and oem-table-id properties
Message-ID: <20210406111359.302193-2-mst@redhat.com>
References: <20210406111359.302193-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210406111359.302193-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ovLcDi1itpXp

From: Paolo Bonzini <pbonzini@redhat.com>

After introducing non-scalar machine properties, it would be preferrable
to have a single acpitable property which includes both generic
information (such as the OEM ids) and custom tables currently
passed via -acpitable.

Do not saddle ourselves with legacy oem-id and oem-table-id
properties, instead mark them as experimental.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210402082128.13854-1-pbonzini@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/x86.h          | 4 ++--
 hw/arm/virt.c                  | 8 ++++----
 tests/qtest/bios-tables-test.c | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 26c9cc45a4..c09b648dff 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -78,8 +78,8 @@ struct X86MachineState {
 
 #define X86_MACHINE_SMM              "smm"
 #define X86_MACHINE_ACPI             "acpi"
-#define X86_MACHINE_OEM_ID           "oem-id"
-#define X86_MACHINE_OEM_TABLE_ID     "oem-table-id"
+#define X86_MACHINE_OEM_ID           "x-oem-id"
+#define X86_MACHINE_OEM_TABLE_ID     "x-oem-table-id"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 OBJECT_DECLARE_TYPE(X86MachineState, X86MachineClass, X86_MACHINE)
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index aa2bbd14e0..bc5f948367 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2670,19 +2670,19 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
                                           "Set on/off to enable/disable "
                                           "ITS instantiation");
 
-    object_class_property_add_str(oc, "oem-id",
+    object_class_property_add_str(oc, "x-oem-id",
                                   virt_get_oem_id,
                                   virt_set_oem_id);
-    object_class_property_set_description(oc, "oem-id",
+    object_class_property_set_description(oc, "x-oem-id",
                                           "Override the default value of field OEMID "
                                           "in ACPI table header."
                                           "The string may be up to 6 bytes in size");
 
 
-    object_class_property_add_str(oc, "oem-table-id",
+    object_class_property_add_str(oc, "x-oem-table-id",
                                   virt_get_oem_table_id,
                                   virt_set_oem_table_id);
-    object_class_property_set_description(oc, "oem-table-id",
+    object_class_property_set_description(oc, "x-oem-table-id",
                                           "Override the default value of field OEM Table ID "
                                           "in ACPI table header."
                                           "The string may be up to 8 bytes in size");
diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index e020c83d2a..156d4174aa 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -73,7 +73,7 @@
 
 #define OEM_ID             "TEST"
 #define OEM_TABLE_ID       "OEM"
-#define OEM_TEST_ARGS      "-machine oem-id="OEM_ID",oem-table-id="OEM_TABLE_ID
+#define OEM_TEST_ARGS      "-machine x-oem-id="OEM_ID",x-oem-table-id="OEM_TABLE_ID
 
 typedef struct {
     bool tcg_only;
-- 
MST

