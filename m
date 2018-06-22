Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp851853wrq;
        Fri, 22 Jun 2018 06:45:44 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcUliT1wEH4ySOIyg9XZA3EzwQ94+nL4vfrt3VIMXP7vuU2aX0x107fG6rCohHYoG1iYnjU
X-Received: by 2002:a0c:f806:: with SMTP id r6-v6mr1455041qvn.214.1529675144083;
        Fri, 22 Jun 2018 06:45:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529675144; cv=none;
        d=google.com; s=arc-20160816;
        b=eJ+TQZ0WkkQ4iYcYSoP09RNzLwntUmzXg6P4MIOmVce8etCBXEjKTv8U1qj6XtrxE1
         bJ1As5gfMr3FDXI0uchJ+tAsotejhrKoCQxl/e4CJPZIyKqtnwHfZF8PHro1hPVemctL
         0KuAQ18NoY5hAUO8OhYYJovwS/ZDvwYXuXX19+m/SrLQaGE8kdcFvVkoeqAnlVrqmWiV
         MAuctO9tX8lritKdoxvbMtO3eDuMthlq+jg0ASzxhmCpZZsrtYoq3nO6s8SD8XpNvIQq
         EUaAibRLHK8b5mzJN1lKPQbWQTwgVMgzxb2l1i0THN786AD6yLWKlN1mbPAasVMoIJMa
         d1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uRGpaP9vdmbS62h1hqhwUmyNT6CxmmALvdK2uBT+F0w=;
        b=PnskzA8Rkba7FjMG1bRr+AJVROfKon10gP5BkorNL4PIkKoYnTq/5q84YeHpJnrj+u
         iWXflXgdMfbTJtGFZ4z5lYXhTYFi50uGCDwQmnquXI9Untq5NGJAoB1hyJn5GuT9X2eF
         QFlEGvOn/WyKi/H+Nh08KPyUhUXuh5rs4Ehh374Q8J7G6kGPRxq9iszky+WOvzRMC5v2
         5151lEHUN/lbTe890PzljH5AYZzvHcOr/E7dtSfLOTwuTUED8Z+E+n/3xpTfQXI6ls6h
         SknQEogUHUI8nfrqFiR/NUmQQhckOVep8jvUgoXOQPNnJfPy15aThWU0TsnQx8JBtIB4
         Y53A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YDTeY0k9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 50-v6si5380158qvi.158.2018.06.22.06.45.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 06:45:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=YDTeY0k9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34043 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWMNj-0001MK-8r
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 09:45:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJC-00063T-Hs
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 09:41:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJB-0003JC-IP
	for qemu-devel@nongnu.org; Fri, 22 Jun 2018 09:41:02 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:43057)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWMJB-0003IA-Di; Fri, 22 Jun 2018 09:41:01 -0400
Received: by mail-qt0-x244.google.com with SMTP id y89-v6so5899367qtd.10;
	Fri, 22 Jun 2018 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uRGpaP9vdmbS62h1hqhwUmyNT6CxmmALvdK2uBT+F0w=;
	b=YDTeY0k9OxY2ngRZhTxeKECzsEbYi0v7gQrJnwyr02pGpZUnaSK0eBB+gO+INPOAeO
	pS2wLlqlo3nncJ00ld7vXEwz7ge8uIzql3VB2pH+rLkumlJMSKwGou+bxwpPY+b9r8lw
	qHEPN6mn9U10/rsmzYvt1vHFg/bkDJmPS18IHrw96iyTLJzK+PhOFNNp4AE6MRheW8pS
	qnNdKztAnxcL1XzwMO+vqkNYyfPfli3rTEdRRjBe8b9wlb/ppwE9dXUk+4vm3/cfIu4Z
	l3ck4lMwUkovWncy1wk3CVfe5MgwVfbTFZUZpqTTKbvb3ghXGGm2xYwIwDZUJnFL1fJm
	CKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=uRGpaP9vdmbS62h1hqhwUmyNT6CxmmALvdK2uBT+F0w=;
	b=XEUf5IDJq2C7NG+jUhgn8ne3FhuxZBLdO8hI/F0FCgHzn7ZXSLApUlOZ4Cm/iyo32p
	oJIxACbk74BwGZUxaJTw0CRCMtZQ7J3SBp5ky3O23f5vNJzw2EK8ZBv00vRSsPdmB7d8
	bHKNf4l3LE1s3XswqGPjFtRo9BI/P04LbBjhCL1rCAqB8g2/NJtpdJRhcur3O3fSdn8w
	KwbowXs2Cb7/kZ+4JH6vIcZ9L9d/dTpxPBwck3TFgL4EJZuymw8aBijiJZWJ7iOvuu1w
	CpC3tO98aHFQrbBAvI+w+bm//RkcP8vKONqWoQJ2SaMgrDuPSgNveXGdR73gcSkVkdJd
	6sWg==
X-Gm-Message-State: APt69E31Vl6UKFhUgLTFTiIFc2saaAFxPoscrhxthLLiWsu10zIYmy/1
	7xAmm/rC29hq7RlkglX/wJE=
X-Received: by 2002:a0c:e0c7:: with SMTP id
	x7-v6mr1411553qvk.113.1529674860903; 
	Fri, 22 Jun 2018 06:41:00 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	s39-v6sm6006629qts.42.2018.06.22.06.40.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Jun 2018 06:41:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Fri, 22 Jun 2018 10:40:28 -0300
Message-Id: <20180622134036.23182-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0.rc2
In-Reply-To: <20180622134036.23182-1-f4bug@amsat.org>
References: <20180622134036.23182-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v2 06/14] hw/sd/omap_mmc: Use
 qemu_log_mask(UNIMP) instead of printf
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
Cc: qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i2Obhnhec3zn

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/sd/omap_mmc.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/hw/sd/omap_mmc.c b/hw/sd/omap_mmc.c
index 5b47cadf11..aa2a816f76 100644
--- a/hw/sd/omap_mmc.c
+++ b/hw/sd/omap_mmc.c
@@ -17,6 +17,7 @@
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/hw.h"
 #include "hw/arm/omap.h"
 #include "hw/sd/sd.h"
@@ -449,10 +450,14 @@ static void omap_mmc_write(void *opaque, hwaddr offset,
         s->enable = (value >> 11) & 1;
         s->be = (value >> 10) & 1;
         s->clkdiv = (value >> 0) & (s->rev >= 2 ? 0x3ff : 0xff);
-        if (s->mode != 0)
-            printf("SD mode %i unimplemented!\n", s->mode);
-        if (s->be != 0)
-            printf("SD FIFO byte sex unimplemented!\n");
+        if (s->mode != 0) {
+            qemu_log_mask(LOG_UNIMP,
+                          "omap_mmc_wr: mode #%i unimplemented\n", s->mode);
+        }
+        if (s->be != 0) {
+            qemu_log_mask(LOG_UNIMP,
+                          "omap_mmc_wr: Big Endian not implemented\n");
+        }
         if (s->dw != 0 && s->lines < 4)
             printf("4-bit SD bus enabled\n");
         if (!s->enable)
-- 
2.18.0.rc2

