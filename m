Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1695493wru;
        Thu, 27 Jun 2019 13:30:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRTuvIu6HHIb5woghWh9OFvdT7Kt5Ip5KPNNvR3k3gPfxMK06Ypf/7DDR3aKZS4VAPu2nf
X-Received: by 2002:a37:9e13:: with SMTP id h19mr5423822qke.435.1561667415029;
        Thu, 27 Jun 2019 13:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667415; cv=none;
        d=google.com; s=arc-20160816;
        b=oHuK31UxlkiiBI+EOq3/4fshp50Z+NnfOJ9SECfBuDHIbK8NQMNbJTpCm3Z6SudQh0
         1JP+yxxXRFWmJUx5RBqTylrHLNEC/gH7tTCFfyq9V1hUTcOx7ohgDIumHt3XwGg632a+
         ccpyGqpJVQ3sip8YNy2bkvyYLnKONzgfh59kMvxnZf3WUTzdD0VfMAIocsyYwG5AjEC+
         BPU6HHLix/rdRQAW5H5o+D8KXaSdd9rcA3UPTH+eVUz4GLwAaMWKcOAmu7FrAAj5N22S
         4EJQCW4yJiukZkmDGWtOgIkGSKcAqQUc/zXUFvWHK92NPtx9KxKlryXn4ZihV1UIde4w
         6Trw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=5MpkV6ZUVQwQWPLrEXWDcJIwg7y3uF80XM/Njx9f75E=;
        b=zQ/wSVMuyQO5FWNX30IOMToHwXGtiUECmW2GO/k9aEeZ9DmrjoVfbcSlN3d6Yss5D+
         PQDn6fc4vl2zNWCiSaXW7/E+NxKUX1W3UzlKMQFTZSuQHydDWXHsnI/Ge4jvBlf0OVAP
         ybnV7sZcVUTyL89b3NWMmVceSQ4fiyP5MGlG2KEiZ5QQprBR823ZIUTYxwDQc/apDY3r
         l74W0q7oXv7I0TGDdYWd7a7G0Tw3WNVLUEUKb93UAxENY2QLDhiSeAXcYlYd8iFuYIm/
         wx6OH4QuSaTf0hWVIzXLJ6dqsJQNovslGEJ85OMkaZ2EGAIB/ELNzdIEy5mvv8vrnYuh
         d/BA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v23si188287qvf.71.2019.06.27.13.30.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:30:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 16F2183F45;
	Thu, 27 Jun 2019 20:30:14 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BB4D6012D;
	Thu, 27 Jun 2019 20:30:06 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	qemu-devel@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
	qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 20/28] hw/block/pflash_cfi02: Split if() condition
Date: Thu, 27 Jun 2019 22:27:11 +0200
Message-Id: <20190627202719.17739-21-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 27 Jun 2019 20:30:14 +0000 (UTC)
X-TUID: cmvnhvcjg8xy

Split the if() condition check and arrange the indentation to
ease the review of the next patches. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index a0d3bd60dc..08b2bc83cb 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -309,8 +309,10 @@ static void pflash_write(void *opaque, hwaddr offset, uint64_t value,
 
     trace_pflash_io_write(offset, width, width << 1, value, pfl->wcycle);
     cmd = value;
-    if (pfl->cmd != 0xA0 && cmd == 0xF0) {
-        goto reset_flash;
+    if (pfl->cmd != 0xA0) {
+        if (cmd == 0xF0) {
+            goto reset_flash;
+        }
     }
     offset &= pfl->chip_len - 1;
 
-- 
2.20.1
