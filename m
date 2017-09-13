Received: by 10.223.172.38 with SMTP id v35csp1104458wrc;
        Wed, 13 Sep 2017 07:21:16 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QATvJ1krG4Yy/34hQYnYDvXKfJUxh9mk1oQHAR8RjRLqL6ifZEOtUi3awOqSiDDVfYVZDF+
X-Received: by 10.55.40.152 with SMTP id o24mr23192914qko.235.1505312476707;
        Wed, 13 Sep 2017 07:21:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505312476; cv=none;
        d=google.com; s=arc-20160816;
        b=k9BE/h/7o8uiJZVPSIY2KTiDO8QKU5OmWLCkNaUr9GkLo5WAdycN9wxLaCRvZ3jS00
         L6OWjqPdXuk0+Tbb94Pu3//ML7oUrsE0UgbU+Rmht9IjLR+YCbnVe61bU/IZA8ytrYPX
         xj64MFSnfz8IEhJsIj2Qn8HwcK+FCGAZZnaFq8mGbSxh04e2oXEwkABkdXxsHTzsjs2v
         GE1P1v66FSjoQJcLyxNqZ/yGru/xx4YDRmVvyw2U6otZf/NDGuqdv1LN8EF2B8Bu+qeH
         8JTdB/iamn/CroxQS3QdfBXfeg0zO57S5OTyX1X4iNq2vsxfkS/A3olrHKOMuZLwfuQn
         H9Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:arc-authentication-results;
        bh=gKY0h8tLGOtD6Bmhboa448crIvcKqR+lZ9IMbWUhJ2s=;
        b=HF1X/fBEqYUcL9XyHMw8pdRs5mjRvlvvrARC66FlUxkRsTP3dSKLjdjioA0TFvddwm
         ARHsa6EQKiZ9cBKBQ6ozAgiuuWzgQlJKCqGubP4i8MfPIZ8md3+XIljaOZYIDvV/kejo
         nmbUeKZm81QZAOocbGteORh6f6ALPVmyeh6/3LpEHqQlTRAVoXcqQGnj8UzVfAAUzs5v
         Qh/vlpsBunP9dE3r2G7ONQ/4i3R6qYdhw0K1vsSIy6aqqvxP88VrEdth0Nz8htYlU5QB
         qTri00SLIbyguXpWAE8twvGglej9LS5yp2AwX2+ZDSqozJrZrhSLAOzWtOQAw+DlRLh3
         kRjw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p4si594841qkc.285.2017.09.13.07.21.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 07:21:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42775 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ds8XS-0004fE-Au
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 10:21:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds8X6-0004a7-25
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 10:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ds8X2-0003OP-9O
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 10:20:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55396)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ds8X1-0003Nn-S2; Wed, 13 Sep 2017 10:20:48 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD5E47EA84;
	Wed, 13 Sep 2017 14:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com DD5E47EA84
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=lvivier@redhat.com
Received: from thinkpad.redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DC866062A;
	Wed, 13 Sep 2017 14:20:44 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org
Date: Wed, 13 Sep 2017 16:20:34 +0200
Message-Id: <20170913142036.2469-3-lvivier@redhat.com>
In-Reply-To: <20170913142036.2469-1-lvivier@redhat.com>
References: <20170913142036.2469-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 13 Sep 2017 14:20:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH v4 2/4] hmp: fix "dump-quest-memory" segfault
 (arm)
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Greg Kurz <groug@kaod.org>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a0pmIAj4p9fF

Running QEMU with
    qemu-system-aarch64 -M none -nographic -m 256
and executing
    dump-guest-memory /dev/null 0 8192
results in segfault

Fix by checking if we have CPU, and exit with
error if there is no CPU:

    (qemu) dump-guest-memory /dev/null
    this feature or command is not currently supported

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 target/arm/arch_dump.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 1a9861f69b..9e5b2fb31c 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -273,11 +273,18 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
 int cpu_get_dump_info(ArchDumpInfo *info,
                       const GuestPhysBlockList *guest_phys_blocks)
 {
-    ARMCPU *cpu = ARM_CPU(first_cpu);
-    CPUARMState *env = &cpu->env;
+    ARMCPU *cpu;
+    CPUARMState *env;
     GuestPhysBlock *block;
     hwaddr lowest_addr = ULLONG_MAX;
 
+    if (first_cpu == NULL) {
+        return -1;
+    }
+
+    cpu = ARM_CPU(first_cpu);
+    env = &cpu->env;
+
     /* Take a best guess at the phys_base. If we get it wrong then crash
      * will need '--machdep phys_offset=<phys-offset>' added to its command
      * line, which isn't any worse than assuming we can use zero, but being
-- 
2.13.5

