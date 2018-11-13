Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4624145wrw;
        Tue, 13 Nov 2018 09:14:48 -0800 (PST)
X-Google-Smtp-Source: AJdET5fZ0cX6Y1QKQMvMxwz7PiYPmZg2CJHFAR825qGeipimnxiexDpLCliozOIFWe33YBh+IrIz
X-Received: by 2002:a0c:f053:: with SMTP id b19mr6118138qvl.29.1542129288804;
        Tue, 13 Nov 2018 09:14:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542129288; cv=none;
        d=google.com; s=arc-20160816;
        b=qmb43qcZBwIKMtl5KQ4+WCbcUpRQ27SmC72mthtztBFsgBk7l91J4WdkBXEEiEe51t
         VOQxIyk47hh/A/iGI2/IhRuHw2XQdHZI/miHnzUl/qttVpdptKGb+ePuOsCshWj1VoM7
         y62DSAUnGC+ehKX8zTCpNcRjKkH035OeyVTu62Q56C7gDbieQ7eP8E+1lkH7d+dU1/2G
         EBxrFOVC9ee+Yi5QZVIoBRPUlUhVXdorsFc+V1lKk5qhwQww2fHOBKZtjJusdrXKp57N
         3Byzfv/CeqtH0H/LfsK8iuOgxIygrMY6Hnc+BZ8D4bnb9oc15cTPskI4obueGznKkyll
         DWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=ViqXfGbgIuR6SQPOMTpyROS1nMGwnP9q7KFYkEgcF1E=;
        b=CLmqbw7CYYf+UO7HXNtKh1/GIV1+IIFm4FD54OTzsG3cIjbkA8WfNNs1nDozG5YftS
         lEUMMY/NcXxSz+v8yOFysEpF/VGMgvzY5hIIgDo9jAobEx0ZLjZOJS0MYWVJE9Be//VB
         Hz7MvA72kPSUpU8vVAZbvlo4SrbhYwnaRr8plF9zTJwWPFz1+dyNeXUjBRnGe/yycijJ
         V0lS9iow1di8OP5RJHOAjgnp6MGSpMyVmI2Ng47yB8hTfEcRJxfPVieiekoVILlbtCwd
         OnJGZ8RNmY5BALe73e4tZpOJCh4Ewo/O4RngMrfemXoK4txhNU9jfkRkB8tW+1i+9IJK
         5VSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2si3143961qtf.55.2018.11.13.09.14.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 09:14:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:55213 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMcH2-0006UC-6r
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 12:14:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMcAh-0006SB-Eu
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 12:08:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMbwm-000407-H2
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 11:53:53 -0500
Received: from mga06.intel.com ([134.134.136.31]:62858)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gMbwh-0003pu-H7; Tue, 13 Nov 2018 11:53:51 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 08:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,228,1539673200"; d="scan'208";a="107922110"
Received: from qingbai-mobl.ger.corp.intel.com (HELO
	caravaggio.ger.corp.intel.com) ([10.249.41.239])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2018 08:53:38 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 17:52:41 +0100
Message-Id: <20181113165247.4806-8-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181113165247.4806-1-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-arm] [PATCH 07/13] target: arm: Remove the LDST headers
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
	richard.henderson@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c0WCZq1ty65+

They are no longer needed.

Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Robert Bradford <robert.bradford@intel.com>
---
 target/arm/helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 689879c23a..dcb689bfbb 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -16,7 +16,6 @@
 #include "sysemu/sysemu.h"
 #include "qemu/crc32c.h"
 #include "exec/exec-all.h"
-#include "arm_ldst.h"
 #include <zlib.h> /* For crc32 */
 #include "exec/semihost.h"
 #include "sysemu/kvm.h"
-- 
2.19.1

