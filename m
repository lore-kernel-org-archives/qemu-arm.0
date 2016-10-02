Received: by 10.80.163.71 with SMTP id 65csp1169855edn;
        Sun, 2 Oct 2016 09:04:26 -0700 (PDT)
X-Received: by 10.200.46.176 with SMTP id h45mr16710377qta.133.1475424266847;
        Sun, 02 Oct 2016 09:04:26 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 90si6824219qky.217.2016.10.02.09.04.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Oct 2016 09:04:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59945 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bqjFa-00055F-AN
	for alex.bennee@linaro.org; Sun, 02 Oct 2016 12:04:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjBu-0002XZ-3u
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <digetx@gmail.com>) id 1bqjBq-0003CT-0V
	for qemu-devel@nongnu.org; Sun, 02 Oct 2016 12:00:37 -0400
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:35787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <digetx@gmail.com>)
	id 1bqjBp-0003CC-N6; Sun, 02 Oct 2016 12:00:33 -0400
Received: by mail-lf0-x241.google.com with SMTP id s64so7954973lfs.2;
	Sun, 02 Oct 2016 09:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=fuBe+6wNjT266p1lxCRF3MQSchsVqoycNndi3/KDPFA=;
	b=lbFCj+hEy1Evg9EliPAAad9aBmVbzAU7CJSWbP42uCLxE40kg8jPVHH3NNzJirCuA4
	fW5B5Vr+1eMFU6jG3VRF571Xx9WS/9wZ/kpW46ykydjOsMQqE+dRtegLL2/NLWLSovIv
	Mq8DZMrL+gwZHGEfIlRdEc28g/gjboPK1SKMcBrr7Vo6wajhpBJe1vlB78c9tkvdV5n8
	KEQplpeq0aQ8MxST1rFIeU1M08H+am8EMSx1gSN6B6o5xKVL9GRqXQ4/CZT4aiYk/CbB
	f6ej2geXMYvtIlU3LYepTKGxvzeLscCWLFM8AOmQMcnzeKHMnVrK/KOJKEhaOmvi+1jU
	sr+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=fuBe+6wNjT266p1lxCRF3MQSchsVqoycNndi3/KDPFA=;
	b=m0vGClcJjDa8RHCbBmv/C8OOioLi/KyFnjSxtqo14LsqyOPyJWxCY8G6WV+XZHeITa
	dbvFNnXcEhdkEAB9rl2EmhXmF9Hno1YQ1hKV8HqSTOj0un6OaE5wOWhAkir6xE1f/Yoo
	Dy+GmKnFHWm1gl3TcZqRKbdOQ44ejCM7w44eBVBuU9nkcMid7oZuAnRXu0DV/5GvkbbW
	5zpijd2bYb17AH8sE9WIdYol0Npd64qrKBVFW8ceM8i5f5qtTyj1B23eXJNhYc7V7GP6
	OvZXAUnTk2gP8fuqBqCwiRIgp54VvGlGCy8dVB6RipzhsXNikAFhxvz8JFJ0jZYW19r3
	tkPA==
X-Gm-Message-State: AA6/9RkWnGutKKAOoSTfhK+NYqzl7OdIBbdK3cvWQKs8oD7MQ34sHa7Czra8c+eXfHCqbQ==
X-Received: by 10.46.32.169 with SMTP id g41mr5155240lji.33.1475424017243;
	Sun, 02 Oct 2016 09:00:17 -0700 (PDT)
Received: from localhost.localdomain (ppp109-252-52-17.pppoe.spdop.ru.
	[109.252.52.17]) by smtp.gmail.com with ESMTPSA id
	o84sm4864679lfi.34.2016.10.02.09.00.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 02 Oct 2016 09:00:16 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org
Date: Sun,  2 Oct 2016 18:53:43 +0300
Message-Id: <9d8b626f462d4a5094b1945fbd763b8a2e28dd86.1475421224.git.digetx@gmail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
In-Reply-To: <cover.1475421224.git.digetx@gmail.com>
References: <cover.1475421224.git.digetx@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::241
Subject: [Qemu-devel] [PATCH v17 11/14] tests: ptimer: Change the copyright
 comment
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: innsPe6WXj8z

Eric Blake suggested that use of "Author:" in the copyright text of the
files created by individuals is incorrect, replace it with "Copyright".

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 tests/ptimer-test-stubs.c | 2 +-
 tests/ptimer-test.c       | 2 +-
 tests/ptimer-test.h       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/ptimer-test-stubs.c b/tests/ptimer-test-stubs.c
index e028a81..21d4ebb 100644
--- a/tests/ptimer-test-stubs.c
+++ b/tests/ptimer-test-stubs.c
@@ -1,7 +1,7 @@
 /*
  * Stubs for the ptimer-test
  *
- * Author: Dmitry Osipenko <digetx@gmail.com>
+ * Copyright (c) 2016 Dmitry Osipenko <digetx@gmail.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
diff --git a/tests/ptimer-test.c b/tests/ptimer-test.c
index 1bd5924..47fccd3 100644
--- a/tests/ptimer-test.c
+++ b/tests/ptimer-test.c
@@ -1,7 +1,7 @@
 /*
  * QTest testcase for the ptimer
  *
- * Author: Dmitry Osipenko <digetx@gmail.com>
+ * Copyright (c) 2016 Dmitry Osipenko <digetx@gmail.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
diff --git a/tests/ptimer-test.h b/tests/ptimer-test.h
index 98d9b8f..09ac56d 100644
--- a/tests/ptimer-test.h
+++ b/tests/ptimer-test.h
@@ -1,7 +1,7 @@
 /*
  * QTest testcase for the ptimer
  *
- * Author: Dmitry Osipenko <digetx@gmail.com>
+ * Copyright (c) 2016 Dmitry Osipenko <digetx@gmail.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2 or later.
  * See the COPYING file in the top-level directory.
-- 
2.9.3

