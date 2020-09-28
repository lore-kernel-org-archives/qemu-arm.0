Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp3521685lfq;
        Mon, 28 Sep 2020 03:49:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+ruBv/9D9byQiireZs59zd7jmoaMZsGsq3VPxseMOStHmxBn44PCT9y1YmCTIo0vpo4i4
X-Received: by 2002:a25:5ed4:: with SMTP id s203mr1009566ybb.427.1601290145886;
        Mon, 28 Sep 2020 03:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601290145; cv=none;
        d=google.com; s=arc-20160816;
        b=wnE8l+cawy8yGNEWGmGDuhi67qS87hAIRXaFHoz+W4zLGkTOJZizTtlpTl5OUYEmLf
         ttGoDux+u0YT/CJq2gjNl3ngq6smWa0pTGSwx48Wwj+DvmVWMZ8OgCNUDb0d+UKjGx3k
         mZxsf2TI0HJaDjvduTmtWJqvFEqrz/RHzJi9kZJx+o+daXCvuwjI5Aaq/JFoqA2TiPnf
         HzIQKNrk4iGzQwf0hcBG7QpSLOJ+nzrWlxHgdItyjm3P5xj7bvVObZsFWlgdAceZE0f9
         gR4TbRm3jG2XDE/2BNyb0H0M6vTrCEqhJT2UeFDA368nS4RgSfWrTcSsIVjOS3mLjBRL
         Z4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=0+ic4XYc4a38mwCG7bGYIrFsYTNeEPqO632utFxp4Gc=;
        b=W9YmYw5aD1FPAdPe2sXL53r8UwKvt3prV5jOuq/nRPr1dYfTy9OYNdxMcBcjgXfrmH
         9o79ZtBCBibZexInuIHjxHB3czn+hPbRbbHDiWV6GXn6XhOCDbTGWIZ2q3LnT+sEKTv+
         9loEyRcrHE6G7cTZjEcY8o4HK5olbDOnITU91Be34MeT8WIdL+cEqN07Ee5Gbo1jApGk
         2a+KfgoyZB66Iqkpx+yK2qXlJZJCpnycpTYoazowK5Jk7NIXoTnVpoU0GPkjY2eqp1OI
         izo5NdRFoTB0IWDPOT2WEaG3aEcQ76fjbxYWJNewyZ0ryvA2ZJXBpMBJnOg3vRJ5CuYm
         7uDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WlEqVbjz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 194si553253ybc.416.2020.09.28.03.49.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Sep 2020 03:49:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WlEqVbjz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kMqiM-0006js-59
	for alex.bennee@linaro.org; Mon, 28 Sep 2020 06:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMqcs-0007x4-GH
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 06:43:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44171)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1kMqcp-0006JG-G7
 for qemu-arm@nongnu.org; Mon, 28 Sep 2020 06:43:22 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601289798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0+ic4XYc4a38mwCG7bGYIrFsYTNeEPqO632utFxp4Gc=;
 b=WlEqVbjzOXY4c0qpHVuJya1VVll0SQ0+QjeGctxuMxZ9sj8quTSwORpMIFY6oGRN6T4bRL
 yJaKzqK3GsdF7I+yOal6loy00oAEtK60DyqlQm8+dVqIDVGSP+qLyqDjgrvtm4xXjvmup5
 YE1/aoQHZ7yPZt9R+sC9Z3qxMBd/ZfQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-via2PX4WMLC7482Gq1Sy6w-1; Mon, 28 Sep 2020 06:43:17 -0400
X-MC-Unique: via2PX4WMLC7482Gq1Sy6w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A674F1DDF4;
 Mon, 28 Sep 2020 10:43:15 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-56.ams2.redhat.com
 [10.36.112.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2903F5C1A3;
 Mon, 28 Sep 2020 10:42:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5D12140825; Mon, 28 Sep 2020 12:42:56 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/12] move MemMapEntry
Date: Mon, 28 Sep 2020 12:42:45 +0200
Message-Id: <20200928104256.9241-2-kraxel@redhat.com>
In-Reply-To: <20200928104256.9241-1-kraxel@redhat.com>
References: <20200928104256.9241-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/28 03:47:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.576,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Leif Lindholm <leif@nuviainc.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u70elMcXuPTL

It is defined twice already.  Move to a common header file to
remove duplication and make it available to everybody.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
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

