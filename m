Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5740726lfq;
        Wed, 30 Sep 2020 10:50:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoqr96ie0v2EEF8VXEm/0t5M3SCXFlYCiiUf/2iIrenJEgUW1HvngpaXu9stzegZzaOkJB
X-Received: by 2002:a25:c014:: with SMTP id c20mr5173669ybf.277.1601488239272;
        Wed, 30 Sep 2020 10:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601488239; cv=none;
        d=google.com; s=arc-20160816;
        b=PQyz6sk22IQK0VkGxTle9NZIMEoE+i1SNza3EP2vKiBorULiNreGU4xiFcGxxibhAS
         jzOEn9MWn4qXMHPfiY+zH7UN81PJVHkNkj3bBLxglD51T86cB52dP6SwHVnBfgOs/hpI
         +W1+ikoaMKV/gxNQjgZqmaqEHaYUlfwWWXCJWgJUjLAPOgiOI65KhE4rlhRcVoaWyTg5
         /XRNmHOxh/CMJPEujD1jehnGRtUkiEjZZR2YZoY7Mj6HI5Tcp5nEtgFveSLdbLzw/Bwe
         QqaHgA/rTdRBJSiukQXTSKECvgHgfRez2BaHG0JEZErgq2QqUkd1JoNXCSTEgU6OR/Zm
         QTLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=cnEvm2YGufL/LGTxpb1iYvXccIx4fAshtwx4WeM3AM0=;
        b=CnQZQfb1GOylJHiKuHsQq1pQqJMpnlUwysDA7D9vFDRGSbq5ZGQvo+RPv2j9tWPulH
         ABMW7YPTPuJrHTQXf99/NOZ9MpIGS5gppn1QuzxSsFXNg0Z5ZLXB4d7i2yDlwfCiqMah
         PLmL/xeynOqB/QT7b6+Rj3uOtRQnU2uczOLHG5VZCIyqLa8trypXINu0dr8BU/dBNFy+
         bS04guhRy4leYzorF1OWURwx/jdpX4MUN40Rz1FDMlXcFeVqCGpxVqz4wXlxOlOaVq+5
         mns96VT8/UtnVRhkdddTRc7hePUfPOMnxueL+woCbkIbIC/BVybw/D2m4XizgVWIje54
         bmwg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="aPAiFb/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si2440003ybj.44.2020.09.30.10.50.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 10:50:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="aPAiFb/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNgFS-0006TV-Ja
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 13:50:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgE7-00057r-Gs
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 13:49:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kNgE5-0004i5-V6
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 13:49:15 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601488153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cnEvm2YGufL/LGTxpb1iYvXccIx4fAshtwx4WeM3AM0=;
 b=aPAiFb/zp0Fxf+Bc1vbR64Cm8Z1x5g7k/TYLuUhkQImfIvhb2iWiPS6Io4nwI39nwcXVYc
 SgWwmm5dCalpzz8zLrVoEI7kqkMCTRcKi8ToeWBzotUVEGj8umWDZ0Wi61woVl9HOFdC0f
 2QGJsSmbwGcj8uxUSy49JWKvWv16AIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-545-ppq9LB9RNWqsiZMROomY2Q-1; Wed, 30 Sep 2020 13:49:10 -0400
X-MC-Unique: ppq9LB9RNWqsiZMROomY2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7666D80F058;
 Wed, 30 Sep 2020 17:49:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E5F55D9DC;
 Wed, 30 Sep 2020 17:48:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1178443BFB4; Wed, 30 Sep 2020 19:48:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/12] move MemMapEntry
Date: Wed, 30 Sep 2020 19:48:44 +0200
Message-Id: <20200930174856.11296-2-kraxel@redhat.com>
In-Reply-To: <20200930174856.11296-1-kraxel@redhat.com>
References: <20200930174856.11296-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Radoslaw Biernacki <rad@semihalf.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DYZQdJ3O2gmH

It is defined twice already.  Move to a common header file to
remove duplication and make it available to everybody.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-id: 20200928104256.9241-2-kraxel@redhat.com
---
 include/exec/hwaddr.h | 5 +++++
 include/hw/arm/virt.h | 5 -----
 hw/arm/sbsa-ref.c     | 5 -----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/include/exec/hwaddr.h b/include/exec/hwaddr.h
index a71c93cc810a..8f16d179a885 100644
--- a/include/exec/hwaddr.h
+++ b/include/exec/hwaddr.h
@@ -18,4 +18,9 @@ typedef uint64_t hwaddr;
 #define HWADDR_PRIx PRIx64
 #define HWADDR_PRIX PRIX64
 
+typedef struct MemMapEntry {
+    hwaddr base;
+    hwaddr size;
+} MemMapEntry;
+
 #endif
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index d018a4f29788..655b895d5eba 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -111,11 +111,6 @@ typedef enum VirtGICType {
     VIRT_GIC_VERSION_NOSEL,
 } VirtGICType;
 
-typedef struct MemMapEntry {
-    hwaddr base;
-    hwaddr size;
-} MemMapEntry;
-
 struct VirtMachineClass {
     MachineClass parent;
     bool disallow_affinity_adjustment;
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 257ada942550..9c3a893bedfd 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -80,11 +80,6 @@ enum {
     SBSA_EHCI,
 };
 
-typedef struct MemMapEntry {
-    hwaddr base;
-    hwaddr size;
-} MemMapEntry;
-
 struct SBSAMachineState {
     MachineState parent;
     struct arm_boot_info bootinfo;
-- 
2.27.0

