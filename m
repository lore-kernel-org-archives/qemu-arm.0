Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp860786wrq;
        Fri, 22 Jun 2018 06:55:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd1rgFVqtCC9en9SWNadOFr5thh4h92pg4MNF61L+LK0+d1YG3ykIk+qkUpmT/6A6PECWBe
X-Received: by 2002:aed:3f2e:: with SMTP id p43-v6mr1439927qtf.267.1529675715127;
        Fri, 22 Jun 2018 06:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529675715; cv=none;
        d=google.com; s=arc-20160816;
        b=kQ1vZCQaZLqYusJ4fMlk1CZfs0z3ykFTsW8Dq3XyanSTlfLCk4TAn4S949loPRzlWV
         q19Zjxp8zIBrCpZD1z0VAORcNvvhkhSXqLogA66IEnbloOoTprRBufdbMf9ZCShfbnQn
         bn1ORbdl70EFUpp5V5hsm8UR022yNsxaCs7WIVWdv97THaIv3I8ToQwJVZSJtVMU1ZGa
         Jofm6tdvjOQMAL1o/pZ+9gn+JbchxMLzaqLV2N56kcsmiYj2382wevZFSH63gg9t/h5Q
         fHWq06yaZScmRwntEUrqs/uWKSVSR+ljxxP72YZfq6bNdBVxOkA5uSbUo7+c0O9ajtOI
         Xgnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=rb4Tel6ruUx+KkPm4chyV+0/3KWS8VEG2yorSZc4qog=;
        b=vmu3yWqdve0cHDXrosGpBthB42b0VGWdRUNsVV1WWg9q2Y31Cl2c2xGsQr/9l+w7PL
         hNsc6ASO/1rwM3o5eV2rZSn7b0/RQJ4IjRmkUvFskvA0Te0/0Iba9UXPiz2eDsUZkL3o
         SqQZVXeCwuEgFYnB9GXOb0+1hwH0S1GTCiivs4Ate+eDOzgrVR1VBTLuT4mIsvFx6LY1
         tEEH1VfKE7EfNEARwHAWJ5k/JFpJ0eaG/ZvLSwrOrTG+7yZ9HjEmNPe6Ce65Ph3HEzpa
         qXEw3mfXwwN5OMo9gCxdLCFF+ZlpzaNbRyinWXZYVSCIhFPISfJ9oGuah7LSvNkDcWMF
         yfwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rmRncngD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u3-v6si2087087qte.53.2018.06.22.06.55.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:55:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rmRncngD;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34119 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMWw-000060-E0
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:55:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJS-0006Ji-9k
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 09:41:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJR-0003eZ-FS
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 09:41:18 -0400
Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a]:33069)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJR-0003dr-AX; Fri, 22 Jun 2018 09:41:17 -0400
Received: by mail-qt0-x22a.google.com with SMTP id l10-v6so5937861qtj.0;
	Fri, 22 Jun 2018 06:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rb4Tel6ruUx+KkPm4chyV+0/3KWS8VEG2yorSZc4qog=;
	b=rmRncngDDmZtkzWkBrWIUbMYuiBoZpXDw4csJka4Y0EBJA/VBZKB1RqVZ7aUF57mBn
	VbpYJL7GsP6nveyXCFgGFEwpVQeVH6BXlKjk0ekmFupSnqe4KUKx1OntFL/1luul3GyK
	+uUzgjNxt4I4R8AeprjWpJULjat4NLrVSEUBucaQIrRDA/irm+1otgny9JacFN/lsChU
	lAuo7mdraZznPkc3WMcncNNUHZswBZWUH+S91nzd1VzF34jhQb1CRZJP0iMx0ehp30E2
	2ymleoZXQDYZn3+TpfRd2PFVu4tKesfS9Qw/8GnJtxlqM2wDJGO1TWhhc/I2WRallVTJ
	gQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=rb4Tel6ruUx+KkPm4chyV+0/3KWS8VEG2yorSZc4qog=;
	b=CQUeCWWpuztiFdcEA1ukajPzMGSymp2ewbDn/no+SNWw+C9H4+e1L6yGBguKHmzK3A
	m3fpWldt1tRsVE/QPr5ECDkcT73G4rXQr33EYxpGQo83Rj+ZC0oJu9mGG3R0Fn+K52qm
	bs3o1pfX2RVJZrRi0EsLbj9GlYkO2TeBU8UBtVc5a/BxCCau/NcUIaIfr4LKDmnlHEhv
	tddUkLsT1bcrLEie+eNPnzWV9EuLIHlT9qa0ArxhsRePeItjayPOVHPAmCdSvs499rx0
	/T2hXGCLiXZrTBd/Phc3QkmFOuy6TfFPguLwsyYPBxuPIQiPz4ONPP1j3jn1FOwXkJxD
	3RWg==
X-Gm-Message-State: APt69E0ctBI+jFWWag6y0bP4sL+AXa8cHqSs9WjBPAwjLBx2962PEQsa
	rh5YSJ8W79YQFiSL2FT5nLI=
X-Received: by 2002:ac8:2302:: with SMTP id
	a2-v6mr1421215qta.180.1529674876626; 
	Fri, 22 Jun 2018 06:41:16 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.41.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Fri, 22 Jun 2018 10:40:34 -0300
Message-Id: <20180622134036.23182-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22a
Subject: [Qemu-devel] [PATCH v2 12/14] hw/net/smc91c111: Use
 qemu_log_mask(GUEST_ERROR) instead of hw_error
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vVknPl0zKBta

hw_error() finally calls abort(), but there is no need to abort here.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/smc91c111.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index c8cc5379b7..9094c0b47c 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -11,6 +11,7 @@
 #include "hw/sysbus.h"
 #include "net/net.h"
 #include "hw/devices.h"
+#include "qemu/log.h"
 /* For crc32 */
 #include <zlib.h>
 
@@ -478,7 +479,9 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
         }
         break;
     }
-    hw_error("smc91c111_write: Bad reg %d:%x\n", s->bank, (int)offset);
+    qemu_log_mask(LOG_GUEST_ERROR, "smc91c111_write(bank:%d) Illegal register"
+                                   " 0x%" HWADDR_PRIx " = 0x%x\n",
+                  s->bank, offset, value);
 }
 
 static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
@@ -621,7 +624,9 @@ static uint32_t smc91c111_readb(void *opaque, hwaddr offset)
         }
         break;
     }
-    hw_error("smc91c111_read: Bad reg %d:%x\n", s->bank, (int)offset);
+    qemu_log_mask(LOG_GUEST_ERROR, "smc91c111_read(bank:%d) Illegal register"
+                                   " 0x%" HWADDR_PRIx "\n",
+                  s->bank, offset);
     return 0;
 }
 
-- 
2.18.0.rc2

