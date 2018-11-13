Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4626885wrw;
        Tue, 13 Nov 2018 09:17:03 -0800 (PST)
X-Google-Smtp-Source: AJdET5fTlFZo3zHl6v81qppUsIt2wzAFx1h50x19vhqEzX1pj90zNR5uhbL89IG1GL+M/nanlmN7
X-Received: by 2002:a0c:b48d:: with SMTP id c13mr6066263qve.91.1542129423205;
        Tue, 13 Nov 2018 09:17:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542129423; cv=none;
        d=google.com; s=arc-20160816;
        b=O4LYlIXPBXaYxfxqEIjI6e3DaoMwzHja8oKnCc9m+jKX/vPfDVE7jSsC8nD+2GATMO
         R7VEZ7Jgo3wWhqPcA6OIOUZvQI59NzKqB6VEg4hyndKBV/KlNKm1Nfwg0C4CiZKiToYj
         v3Bav7LzDk110ckIqwrAolXJZhp4Ur686ulkimzvccWd4NyP/TDrswnqzPzPiZ+FIyhH
         33FHY6CfKO0ebTDhMOvNyzyJLnhrlvE00lPA1GRu1ktTQiIoMcv8bmzvQX3deXk/SHWv
         bUS8WZ+VZe5bKve37UVcl3e71mxEklpU5KLj0NlW1UT03889Gx7+B6YTuGUxaNGdEkYD
         vsBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=weQkJ1TcJG6VadghPXld165vxJNpg1dyKgCiBIinP1A=;
        b=yP/ngP5aPbcH/r8pTvagNxz9b7R5H/X85TvKeVrXNq1S1MPuuhlbG6jt2vYxnBCtZL
         THObxD+B/AliZYPPLEYRI01nL+rkHVuf3xy2+Wacy/urkwO9h4aBzTOIHNDucJ7/8hct
         wzgpOnArco3rEe4hC8NjDO+3LV/jPs/4KCZ/bdO6cFHf1QyoL3UZTL7Fr2pqjfkjW3WN
         eleZDHAdh0HT1iCxchkKw2x4P3x6X7nsF+HGtS2M1hTFZST/ZmlNxDthP1PmlgtVW+BQ
         N8Xdzjiv+mBAZ7Vbz0vmGl/Vha5tQfrvmXdJK2NdI8OdEpAUTciKLrCNibBStDMi9Bfg
         cYyg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w66-v6si769661qkd.29.2018.11.13.09.17.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 09:17:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:55230 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMcJA-0007bi-86
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 12:17:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36383)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMcAl-0007X5-V4
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 12:08:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gMbwZ-0003uE-QZ
	for qemu-devel@nongnu.org; Tue, 13 Nov 2018 11:53:41 -0500
Received: from mga06.intel.com ([134.134.136.31]:62858)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gMbwW-0003pu-0O; Tue, 13 Nov 2018 11:53:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2018 08:53:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,228,1539673200"; d="scan'208";a="107922094"
Received: from qingbai-mobl.ger.corp.intel.com (HELO
	caravaggio.ger.corp.intel.com) ([10.249.41.239])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2018 08:53:26 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 17:52:36 +0100
Message-Id: <20181113165247.4806-3-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181113165247.4806-1-sameo@linux.intel.com>
References: <20181113165247.4806-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.31
Subject: [Qemu-devel] [PATCH 02/13] target: arm: Remove unused headers
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rVlajZZyqetW

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Robert Bradford <robert.bradford@intel.com>
Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
---
 target/arm/helper.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 3d4e9c5c8a..27d9285e1e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12,13 +12,10 @@
 #include "internals.h"
 #include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
-#include "qemu/host-utils.h"
 #include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
-#include "qemu/bitops.h"
 #include "qemu/crc32c.h"
 #include "exec/exec-all.h"
-#include "exec/cpu_ldst.h"
 #include "arm_ldst.h"
 #include <zlib.h> /* For crc32 */
 #include "exec/semihost.h"
-- 
2.19.1

