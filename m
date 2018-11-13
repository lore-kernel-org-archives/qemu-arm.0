Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4624837wrw;
        Tue, 13 Nov 2018 09:15:22 -0800 (PST)
X-Google-Smtp-Source: AJdET5cOXjFvk3ArDsNv/P4VoerqwNk9u4rsYsxmHZDroowIWtWHTQF5A5WHsl97NGozScC7vVyf
X-Received: by 2002:a0c:ec92:: with SMTP id u18mr6194268qvo.168.1542129322673;
        Tue, 13 Nov 2018 09:15:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542129322; cv=none;
        d=google.com; s=arc-20160816;
        b=et76VH9NiUGYKco+2hITGwGpRhyfaZyU+EmQW6m+NKsJQ0wLmBnQL33kTdBxxSy+mt
         FVMZ+vNcQdJ3LsA1fkvOsRV5zrh3YzM0RwFYF7M3rovkgftx2p2pLr+F9TP3SCImN8P+
         3Qjk2ut9WqHrTHNrB3Mx9R0UpDlYklexogUNzEBPTG/7NDRYcoIGe6xXklrNd5aX4meN
         32lt6NzZqJXueA71KVRnsJDRCQTryXNYK/l4Ht3Td4usLAuBQ9hRUmwmjzs+zFgNpjRq
         inVRlUQSwGXwLY//NfKuXOhFXHPPGUBBrzJgnqCda0eQUs4E1v4ysqxPgh3GE1lTQOZb
         dN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=d6YbJv7fPqfQrm2+de4WECj+Se5BzoULdHOTthDqZDo=;
        b=Ms29+aT33+S/0EhkRNS57yrvJyBT/LvrZ9JoVCYy1tmLBiD4hWLLRkDGDVdjT7Q7gP
         LOmVdxscuFJ5t0KNMr2y2+ZqnasDohFpbrFEpKwoiNq/WgZ8fO0vlr6RDoMl9Mkk7Jp3
         pIl/09/1Os0TJiXxLKfCcuzEXX067viDebFVnUQXE8ziBHRVIUbM+mwQaVroEV9y2B18
         WXc0yQOZGzR0dwJLsYTNMoG9Pbay27uMbRw2nCzDHd2HDgX2A7KFfVehBpKlb6AZdtRw
         ozq+jUquFZl5yUJV0tTj7KtZTrIl21w4SGbiFid0R0/9w62iOOp3u66jd91YE/1GW9b1
         xPAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m5si5813810qte.371.2018.11.13.09.15.22
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 09:15:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:55221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMcHa-0006z1-3D
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 12:15:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMcAl-0006SB-SC
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 12:08:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMbwd-0003vQ-Bm
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 11:53:44 -0500
Received: from mga06.intel.com ([134.134.136.31]:62852)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gMbwS-0003pH-JN; Tue, 13 Nov 2018 11:53:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 08:53:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,228,1539673200"; d="scan'208";a="107922091"
Received: from qingbai-mobl.ger.corp.intel.com (HELO
	caravaggio.ger.corp.intel.com) ([10.249.41.239])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2018 08:53:24 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 17:52:35 +0100
Message-Id: <20181113165247.4806-2-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181113165247.4806-1-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH 01/13] target: arm: Add copyright boilerplate
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: f5Y1fNUUaC2D

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Robert Bradford <robert.bradford@intel.com>
Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
---
 target/arm/helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0da1424f72..3d4e9c5c8a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1,3 +1,10 @@
+/*
+ * ARM generic helpers.
+ *
+ * This code is licensed under the GNU GPL v2.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
 #include "qemu/osdep.h"
 #include "target/arm/idau.h"
 #include "trace.h"
-- 
2.19.1

