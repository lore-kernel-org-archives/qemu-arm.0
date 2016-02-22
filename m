Received: by 10.25.208.211 with SMTP id h202csp1391824lfg;
        Mon, 22 Feb 2016 13:06:06 -0800 (PST)
X-Received: by 10.140.31.225 with SMTP id f88mr37039836qgf.52.1456175165960;
        Mon, 22 Feb 2016 13:06:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v16si31136024qhb.56.2016.02.22.13.06.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 22 Feb 2016 13:06:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aXxgD-0005Or-A2
	for alex.bennee@linaro.org; Mon, 22 Feb 2016 16:06:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aXxgA-0005LL-KV
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 16:06:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1aXxg9-0004Dn-PW
	for qemu-arm@nongnu.org; Mon, 22 Feb 2016 16:06:02 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:55906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aXxg7-0004CT-LP; Mon, 22 Feb 2016 16:05:59 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aXx2t-0001R1-W6; Mon, 22 Feb 2016 20:25:28 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 22 Feb 2016 20:25:19 +0000
Message-Id: <1456172720-12650-5-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456172720-12650-1-git-send-email-peter.maydell@linaro.org>
References: <1456172720-12650-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Cc: Shlomo Pongratz <shlomopongratz@gmail.com>, qemu-arm@nongnu.org,
	Pavel Fedin <p.fedin@samsung.com>
Subject: [Qemu-arm] [RFC 4/5] migration: Define VMSTATE_UINT64_2DARRAY
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: l92mOL3dwvJq

Define a VMSTATE_UINT64_2DARRAY macro, to go with the ones we
already have for other type sizes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/migration/vmstate.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 7246f29..ecc4992 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -766,6 +766,12 @@ extern const VMStateInfo vmstate_info_bitmap;
 #define VMSTATE_UINT64_ARRAY(_f, _s, _n)                              \
     VMSTATE_UINT64_ARRAY_V(_f, _s, _n, 0)
 
+#define VMSTATE_UINT64_2DARRAY(_f, _s, _n1, _n2)                      \
+    VMSTATE_UINT64_2DARRAY_V(_f, _s, _n1, _n2, 0)
+
+#define VMSTATE_UINT64_2DARRAY_V(_f, _s, _n1, _n2, _v)                 \
+    VMSTATE_2DARRAY(_f, _s, _n1, _n2, _v, vmstate_info_uint64, uint64_t)
+
 #define VMSTATE_INT16_ARRAY_V(_f, _s, _n, _v)                         \
     VMSTATE_ARRAY(_f, _s, _n, _v, vmstate_info_int16, int16_t)
 
-- 
1.9.1

