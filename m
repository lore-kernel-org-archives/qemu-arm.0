Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653019wru;
        Mon, 1 Jul 2019 06:25:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQnN5zqxIfVZHt4lxpE+znVK4upqwky/nk5vduNRT3XQR6wdFsTsUrRMHL8l5pbVu9r8ze
X-Received: by 2002:ae9:e8ce:: with SMTP id a197mr19660496qkg.484.1561987551712;
        Mon, 01 Jul 2019 06:25:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987551; cv=none;
        d=google.com; s=arc-20160816;
        b=GOpQKOk7eE5Q8T+ZaJUD1qRznVbLSai77blcsPwYtiknhUYp6nAj7jfGTYLohqBkyo
         4aKuTr9GOpxi9Y7Xucc89llFmvGihvKtEselwDE81/MMQlXJiKtMjsk4AAJi5MBlwWJ5
         6s0cZRJnjUoLONgxQCg/z8g7oLoOKOcGWcYzrGGY74E295Y6OWuXY0SQREntmqkIXbqW
         G/pP3vaTo5GVaEMsIPQ6VSc95lD/VDfNcwXahpyiXsHmSSfU1datwEkE2ytr+/sTzAX5
         TGcWrZIlV5VDA6R06M5q01W1DOo9nsKZXcn7nYwkIT1rO45e93KtAML9RK/3HpGJxHjT
         QD5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=WAqFmYS9psg83IUUnlEeh314Fv4BKQmFOwY7CkHVDOE=;
        b=GHk7D93aadeVwPPSx9tjOdZUbPk73AZz99yN5hNX+reOrzAH1WmtgVpFOXnIbRER6K
         3B0ZgAV8C1GI0iRDaKJVQhMwGN61cUSreeVgrIa7BsbvxdGsRZjDb5nTvLlZe9o+OSDx
         +0zewWT0R1oli3n1ILqrpO2jKewesEYlNNEtpGjgfA+2wY2hVkYJp3mBHRZFD/gwznrQ
         m/gg2mCkeDKkcWisFgjU2FEY96tDgI4qYTZEGv+wRF77ym7G5dvVhZnZNEUAZ3zHuHA7
         hxjErEqKs0GpO4b2LcQgjolirCOTWEERYLlcCdYWNS6/5m+OGulVIXX3BXMwn/tk9wJB
         5FGg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v23si7247299qto.398.2019.07.01.06.25.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:25:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75EFA30BBEA6;
	Mon,  1 Jul 2019 13:25:49 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFA5117A9C;
	Mon,  1 Jul 2019 13:25:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 05/27] target/arm: Add copyright boilerplate
Date: Mon,  1 Jul 2019 15:24:54 +0200
Message-Id: <20190701132516.26392-6-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 01 Jul 2019 13:25:49 +0000 (UTC)
X-TUID: igHyckIiFInZ

Reviewed-by: Robert Bradford <robert.bradford@intel.com>
Reviewed-by: Samuel Ortiz <sameo@linux.intel.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/helper.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index df4276f5f6..d3f3cb57d5 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1,3 +1,10 @@
+/*
+ * ARM generic helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
 #include "qemu/osdep.h"
 #include "qemu/units.h"
 #include "target/arm/idau.h"
-- 
2.20.1
