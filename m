Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp858098wrq;
        Fri, 22 Jun 2018 06:52:14 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJqh9sj4mFq10ulyu6GOR9m8g3yPpIEG62YZCJW43Cki95qaY/UKbXgjOmPKC7XnTdid5Tl
X-Received: by 2002:ac8:2be8:: with SMTP id n37-v6mr1441248qtn.293.1529675534346;
        Fri, 22 Jun 2018 06:52:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529675534; cv=none;
        d=google.com; s=arc-20160816;
        b=tsLtRcPMFIuKIVtdreSt9Fh2n9BPr3fyHZ755bReeGsigCHPjwaq30AsytlAm8k5de
         sD0+WD/xd6yQnizsCbp9dfBiT3RezT244cI/ePNKg9zGZJqJBVc0Hg+7DkTfNqAIy9TS
         xiOiCsbSZeSN+7Rt61BEw47A98oiI8HgmQlfvMw2WOA4iiq07e5wCa7rNbiGXHM7L7NK
         i/2MXnE7hl9nwU+7qRDN/qmWjgb884HCc2uyx2a2uGZdlBX2XGhyWettGrA0FWnEuUxU
         kD2s/4cFV20wLaaMfs4snW+4x0o4Ss2hqTT4bg+xIa1qtY3hMZHOzVg+k7Wv6T1pm6lC
         0ukg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=YUhN8bGDi0zHsya44e31XrtEa0WibSxdo5h7xdErdEQ=;
        b=GWR4ImpjQha8+lJyEPLAonVuA8M91RjpLT+XYrgB+I7ypqVZbfymSvA5fFGdiz+BSX
         VcA/vC4VonuUO9xJwyA9afeMPOrJQhikWHDkPHQVq1oI3wArgbkw/vaOnWhuxG8UwCW5
         9wFA9FhzU5Sd8zmxjVlDeJfDUWGooFv8bMlguOOWEKaJgIOUhlRr+qm52WVEzf/LuCK/
         YqTPVc17YaCkw/e/gwHOP1AoMEw0Q7Nf9NUnxFyrSziNwykmLyYTEvj4TWRLTINZZyAz
         YoiQK/mHsIWiALUDNlEwWVN8hKBhQhOsAz2CDxUVt7069QZY+MKFmhFetf59ZEzJ3t0P
         +HlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MV8Tekms;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z10-v6si394351qvm.222.2018.06.22.06.52.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:52:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MV8Tekms;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMU1-0006TV-Nn
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:52:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJZ-0006QA-6j
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:41:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJW-0003l1-48
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 09:41:25 -0400
Received: from mail-qt0-x230.google.com ([2607:f8b0:400d:c0d::230]:38342)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJO-0003an-LN; Fri, 22 Jun 2018 09:41:14 -0400
Received: by mail-qt0-x230.google.com with SMTP id e11-v6so5336129qtp.5;
	Fri, 22 Jun 2018 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YUhN8bGDi0zHsya44e31XrtEa0WibSxdo5h7xdErdEQ=;
	b=MV8TekmsTYJqvCJmQ9/Yhxv9wpMyQwjpjG6jESanVPBgpsq7wcKUqtKNN89vRdac3X
	r8CVqFJ3G18+IVtjJyd9Iwu/7Eri53xbe+1ePy7MvXCGyAa68re80KJkl4IoWarv/NOF
	7G9La3ubRN33zZfj7HX/phVTT7uzHCLEQXK+ucvJpyKJmspta3MSoqYTbqmZs1F19UFG
	MFrAFckEYA+lQYx6544kF3EE3496gUZ8p/mbC9+u/2yZ3uh/dh7uPeLdr59QVdHfnkMz
	qAeB5ZhzzCuonyUAXIfDEqnz4UpZsYj4XcFDZEjbR/LECrEorpvz5TfZN6jAWYXtW1xA
	qcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=YUhN8bGDi0zHsya44e31XrtEa0WibSxdo5h7xdErdEQ=;
	b=WHwmydxKKEHMjJeGtIYD3BLGoAMt5rXelWfTkDzZYT/DY+fxvTphXzlGQmiDa96WOw
	NNnh9VYuRQjDMSNOov/ojlKNKecvz4ozfAmnYnnZJ0HsORs9vudjNOj24tuvo3HWhDLU
	0lNZvjFxOxTS6DWwe2FPWaTZFW5RNd/UiaPnpNTwgEO476uFBDFLOe6O4rfogaxEv9wE
	O69hWeM5z7ST5KrQ3APVnmlocp3pf9I7Qxq9tJNYOI1FKFWTV/MHnjY5hBSomgrI69L3
	e+Sn0gxpZxoLbESRV0p7d3jDsltTG6f0iqkWVCRgCKLm5YaRK8AKyYlsNBAe6zYe+TDH
	5Cmw==
X-Gm-Message-State: APt69E0E9CRoRP5uv9Dg28yuvQZwHJ6DW+HZf1978YaBDozK0jVnMmAQ
	ATF85mhrW5vtjZebQhu5usQ=
X-Received: by 2002:ac8:27e1:: with SMTP id
	x30-v6mr1385691qtx.51.1529674874059; 
	Fri, 22 Jun 2018 06:41:14 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.41.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Fri, 22 Jun 2018 10:40:33 -0300
Message-Id: <20180622134036.23182-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::230
Subject: [Qemu-arm] [PATCH v2 11/14] hw/net/stellaris_enet: Use
 qemu_log_mask(GUEST_ERROR) instead of hw_error
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z2SMjrZpvnnl

hw_error() finally calls abort(), but there is no need to abort here.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/stellaris_enet.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 04bd10ada3..f8edebdecd 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "net/net.h"
+#include "qemu/log.h"
 #include <zlib.h>
 
 //#define DEBUG_STELLARIS_ENET 1
@@ -343,7 +344,9 @@ static uint64_t stellaris_enet_read(void *opaque, hwaddr offset,
     case 0x3c: /* Undocuented: Timestamp? */
         return 0;
     default:
-        hw_error("stellaris_enet_read: Bad offset %x\n", (int)offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "stellaris_enet_rd%d: Illegal register"
+                                       " 0x02%" HWADDR_PRIx "\n",
+                      size << 2, offset);
         return 0;
     }
 }
@@ -442,7 +445,9 @@ static void stellaris_enet_write(void *opaque, hwaddr offset,
         /* Ignored.  */
         break;
     default:
-        hw_error("stellaris_enet_write: Bad offset %x\n", (int)offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "stellaris_enet_wr%d: Illegal register"
+                                       " 0x02%" HWADDR_PRIx " = 0x%lx\n",
+                      size << 2, offset, value);
     }
 }
 
-- 
2.18.0.rc2

