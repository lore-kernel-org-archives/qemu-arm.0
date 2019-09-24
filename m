Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3990598wrp;
        Tue, 24 Sep 2019 07:35:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy/gDGlvxJeHezpyC5S9cujAB0sobOVsNeUzcA+r7ULeaeb7j3So+mEXhCMGMbBSQIUW61G
X-Received: by 2002:a5d:4582:: with SMTP id p2mr2647947wrq.305.1569335722745;
        Tue, 24 Sep 2019 07:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569335722; cv=none;
        d=google.com; s=arc-20160816;
        b=UjTlp45bQ1sciahkrIgVzG+Xp55839SKp60u9nGLX0DgwDM17iUSDcWsqH/jqj6xJN
         CruEhXwQcNCS5mXRJTrK5kV+58m9ZW/rqT2/dxMFDyCz4VNMej5VzCipnNjyqb4I7DLF
         IUNM3SWWR4Kz35aLBwuom21e2yN+9/jZuJ2UUOZMgZKc0JeRtus8UJfL/i0B2Wf9quko
         wWR06GoRY4XO9jCGgMAM3GKkHD+U+t+czdZ/yMXfOOyFWZfh8cQj0BCeG259ZHJII4/2
         y4eWvhC+N5mig99F2EVKd+xTdudqHcFyaHEXLvvDUxClXDZg+5pclk/FZwDpgTd9GvdD
         dFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=86I1tsrpFkq9PrinBexRunLeXs+0nqltYJUZsUIywuk=;
        b=X2qww2Pvz+kjLRU4lK73cTTyI7neYGUoBoNrbjyZtR4MDdgWrDrCsPUjnZyVZsgpFw
         oF8NjANjKqarsJVmKbcFyi1l33tU9JusliCcfAAW7YaJsNP5H1DTst4FDik+aUzSJT9H
         +h58ibDCyGfCvKh5IvVWxea0uvS8CE/iyQU2FpSQZ0VUjVhaDXHj9UE+N85aSi/y7YjL
         mrkFgGxTBHIvleXZxEOnJWA5LSvx2i2FwEzQf/wt7h6aYd+gPx5UkZ3iZBB+OWje8zVl
         +9n9kq1zpIfZ2wyOBrBJEuI0ngifXew+Lri4FkHixGmCk+2RFdUK+V20YSzuKTZKHE/K
         8IGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a23si1333418edj.201.2019.09.24.07.35.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 07:35:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCluT-00046U-5k
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 10:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37939)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iClYX-0008CB-HO
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 10:12:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iClYU-0007na-1j
 for qemu-arm@nongnu.org; Tue, 24 Sep 2019 10:12:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35338)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1iClYT-0007n6-Pp; Tue, 24 Sep 2019 10:12:38 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8471230A7B89;
 Tue, 24 Sep 2019 14:12:36 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 990645C1B2;
 Tue, 24 Sep 2019 14:12:31 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/timer/pl031: Add warning "do not use as model to implement
 a RTC"
Date: Tue, 24 Sep 2019 16:12:28 +0200
Message-Id: <20190924141228.25009-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 24 Sep 2019 14:12:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TA56et9PWez1

Peter said we should "not use the pl031 as a good model of how
to do an RTC, it has some definite flaws."
Add this information to the PL031 header for other developers.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/timer/pl031.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/timer/pl031.c b/hw/timer/pl031.c
index 2b3e261006..da453b5b04 100644
--- a/hw/timer/pl031.c
+++ b/hw/timer/pl031.c
@@ -1,6 +1,14 @@
 /*
  * ARM AMBA PrimeCell PL031 RTC
  *
+ * Note from the maintainer:
+ *
+ * Don't use the pl031 code as a good model of how to do an RTC,
+ * it has some definite flaws. x86 or ppc RTC handling is probably
+ * a better place to look.
+ *
+ * See https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg05399.ht=
ml
+ *
  * Copyright (c) 2007 CodeSourcery
  *
  * This file is free software; you can redistribute it and/or modify
--=20
2.20.1

