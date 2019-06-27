Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1694447wru;
        Thu, 27 Jun 2019 13:28:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGRiy3MPQXmzg4mCxiOxSHmlyvq2UJ3PaPx9NjtsV1Sogo7hEM465plRgL4JXhUn471wX7
X-Received: by 2002:a37:bcc7:: with SMTP id m190mr5131857qkf.433.1561667329336;
        Thu, 27 Jun 2019 13:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667329; cv=none;
        d=google.com; s=arc-20160816;
        b=dcvbhgN4tdJB7XacTcFrl67QUiuvAWsz1mMNVOKqdKF/NyOBj6jV0zjsbUdiXh7lGv
         1X6+9IJtkaF3E9vbPxwj9uOXQcMFBJAxXl/P4hXtJJAXWeHuyLMmUb8ty7GGV6W6UFRY
         x2xVBv6Sd+daG6jngAOoK/Xijso7Ygs0YqzFRqiaBhBCgvSwDIgARKAi9fFGCUqUIusi
         RWsgt7dlF+WKnXodqUVhaWG49c+EJyBG0jb1Dmp6Q1X1igoiLAjjwHktUWErc3yxCqgL
         Ku/aLKtHRNW9UxuMnrSeRhfzPtVm9m9u+CtpeIQ2SFc6ed5thU+5kHqcL0zEYT3pHFzc
         JnaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=IsnwOxrbqjlfVqBNsMFWQxyLEFlGOqQrYSE4SbpLATk=;
        b=HA1i7zVTsaw/wDaneX8yBwoOjiSikIA/NuVVPRw0/o8o+9KTazFtEHSA0trTo1B9++
         pgl4u8TlNcKx9IfnG9o2aDJFaR2QmhatEh4htu0Szx10omCqNP3tnZH9GVvuwgpLlpG0
         Ku+H+ITNxfWnBKASsFjFtltLDcyER9RNi5sIgd3du/xSFQ0pbB5qqABHlTtVUBzfErQd
         bYgsBFWNZmuc/0/a2SqylXmMHQTZvnz7LqgB6NhIs5iifQaJ5xU20XssFy84q1UFJsX1
         nJBi9weNc4izuRC4tcIibcj7ur8emkfUGSb8ybK2iCwOXxHCW1QpPExQp0l5yjvnFfpp
         p+SQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v41si87224qta.348.2019.06.27.13.28.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:28:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 722303082231;
	Thu, 27 Jun 2019 20:28:48 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C6BC600CC;
	Thu, 27 Jun 2019 20:28:43 +0000 (UTC)
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
Subject: [PATCH v5 09/28] hw/block/pflash_cfi02: Use the ldst API in pflash_read()
Date: Thu, 27 Jun 2019 22:27:00 +0200
Message-Id: <20190627202719.17739-10-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 27 Jun 2019 20:28:48 +0000 (UTC)
X-TUID: 3+PdWbSPhfQJ

The load/store API eases code review.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[PMD: Extracted from bigger patch, simplified tracing]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 32 +++++---------------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index ae38ed0bae..49afecb921 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -196,33 +196,11 @@ static uint32_t pflash_read(PFlashCFI02 *pfl, hwaddr offset,
     case 0x00:
     flash_read:
         /* Flash area read */
-        p = pfl->storage;
-        switch (width) {
-        case 1:
-            ret = p[offset];
-            break;
-        case 2:
-            if (be) {
-                ret = p[offset] << 8;
-                ret |= p[offset + 1];
-            } else {
-                ret = p[offset];
-                ret |= p[offset + 1] << 8;
-            }
-            break;
-        case 4:
-            if (be) {
-                ret = p[offset] << 24;
-                ret |= p[offset + 1] << 16;
-                ret |= p[offset + 2] << 8;
-                ret |= p[offset + 3];
-            } else {
-                ret = p[offset];
-                ret |= p[offset + 1] << 8;
-                ret |= p[offset + 2] << 16;
-                ret |= p[offset + 3] << 24;
-            }
-            break;
+        p = (uint8_t *)pfl->storage + offset;
+        if (pfl->be) {
+            ret = ldn_be_p(p, width);
+        } else {
+            ret = ldn_le_p(p, width);
         }
         trace_pflash_data_read(offset, width << 1, ret);
         break;
-- 
2.20.1
