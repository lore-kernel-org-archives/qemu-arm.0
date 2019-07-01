Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2653040wru;
        Mon, 1 Jul 2019 06:25:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw9QzkvK5aISYAdtEVDWmChdjvUcZQguSApKwmMdhME9MYgRwxLf1P0fBYxI2ZkXu8/44nU
X-Received: by 2002:a37:2747:: with SMTP id n68mr19169029qkn.447.1561987553467;
        Mon, 01 Jul 2019 06:25:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987553; cv=none;
        d=google.com; s=arc-20160816;
        b=jr68kmyerXGzv8bYaj2WJe3J4+qFS7qU2jVGLiptVyea4EFQjVj2bf32QogiA8VEUO
         gcby873Jxv9ndxRdjU0RhRpg0/Dkv9PmgsBZFpPWztL/gmf0q0lvoQQs050YYloDWbhi
         MncBb/XL0pHqnF4GrsqYHHfXK8GQ4AMqeNKghN9RW0OotJr/M2jrfAn+mh+oa35fYoKl
         uBYxS037AVV/srQ7D16MCe0PARnhAN9UTC3X1TFM1MT5wXDZcquKRxwTxgHXOZrfQTIX
         wNpqLwpJfXP5+KgpX04UVC2GVyAnYtttLsmIh+itlKywRVZDMY8nJzhwtctTUNb32mTV
         0LuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=gA3rTNHA+NcCen0+/fpwMmOlKSpbgls2IhCtkVqkDI0=;
        b=sNRYZT1xS1X11kdWYTMv22U17OydquJlaaCqqMaeKcXxKiegNId0qnvtkRMYSg/3/c
         rF9LXjOreTKAkKatJzVPas9WO0++/7rJQLTymf4eTcYAfEZKMrI6wMe0zVF9+NGp9sn4
         V//9RaovssTBnI3+2y7VV/+TuL9iJwRoB1zjDDCj6RIZT7ASQMWq91GZ/HlTq4+0R9fB
         SlCOn7rqGerXRJt+r788RU7PEwrUyohPGbKGtFRyQcc5NAUBMAXqbMTtUKC06GGVIsQi
         d+BFSI86awk71FbI3QbzgrACQb6JpoD0R0VsAQdVBTsnXZelfaiffTVbZ5ytPy+IKcYi
         Vm+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id j27si7746207qki.118.2019.07.01.06.25.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:25:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A17B83086204;
	Mon,  1 Jul 2019 13:25:52 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E9DA56085B;
	Mon,  1 Jul 2019 13:25:49 +0000 (UTC)
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
Subject: [PATCH v3 06/27] target/arm/helper: Remove unused include
Date: Mon,  1 Jul 2019 15:24:55 +0200
Message-Id: <20190701132516.26392-7-philmd@redhat.com>
In-Reply-To: <20190701132516.26392-1-philmd@redhat.com>
References: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 01 Jul 2019 13:25:52 +0000 (UTC)
X-TUID: JzcUuU4sb7Pa

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/arm/helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d3f3cb57d5..ca4d4a57bf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -14,7 +14,6 @@
 #include "exec/gdbstub.h"
 #include "exec/helper-proto.h"
 #include "qemu/host-utils.h"
-#include "sysemu/arch_init.h"
 #include "sysemu/sysemu.h"
 #include "qemu/bitops.h"
 #include "qemu/crc32c.h"
@@ -26,7 +25,6 @@
 #include "hw/semihosting/semihost.h"
 #include "sysemu/cpus.h"
 #include "sysemu/kvm.h"
-#include "fpu/softfloat.h"
 #include "qemu/range.h"
 #include "qapi/qapi-commands-target.h"
 #include "qapi/error.h"
-- 
2.20.1
