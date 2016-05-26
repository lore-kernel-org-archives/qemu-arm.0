Received: by 10.25.30.65 with SMTP id e62csp549584lfe;
        Thu, 26 May 2016 08:24:59 -0700 (PDT)
X-Received: by 10.140.173.212 with SMTP id t203mr9606744qht.89.1464276299620;
        Thu, 26 May 2016 08:24:59 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g70si4246580qge.25.2016.05.26.08.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 May 2016 08:24:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5x9e-0006pB-KO
	for alex.bennee@linaro.org; Thu, 26 May 2016 11:24:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5x9I-0006Sf-LH
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:24:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b5x9H-0004X3-CX
	for qemu-arm@nongnu.org; Thu, 26 May 2016 11:24:36 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57304)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5x9H-0004Uz-5V; Thu, 26 May 2016 11:24:35 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b5whJ-00045K-RK; Thu, 26 May 2016 15:55:41 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 26 May 2016 15:55:19 +0100
Message-Id: <1464274540-19693-2-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
References: <1464274540-19693-1-git-send-email-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 01/22] migration: Define VMSTATE_UINT64_2DARRAY
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
Cc: patches@linaro.org, Shlomo Pongratz <shlomo.pongratz@huawei.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, Shannon Zhao <shannon.zhao@linaro.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VaEjWvGFqCHZ

Define a VMSTATE_UINT64_2DARRAY macro, to go with the ones we
already have for other type sizes.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/migration/vmstate.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 30ecc44..aec9531 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -846,6 +846,12 @@ extern const VMStateInfo vmstate_info_bitmap;
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

