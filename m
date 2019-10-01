Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8377623wrp;
        Tue, 1 Oct 2019 08:56:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyP5236QbNOIZhzVr2Q/8P3vX0SiuHruGw+ldQ5AkOLdexkyoxqVpQDhDEc5PGb4rsXv5bP
X-Received: by 2002:a17:906:e088:: with SMTP id gh8mr24136586ejb.246.1569945365410;
        Tue, 01 Oct 2019 08:56:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569945365; cv=none;
        d=google.com; s=arc-20160816;
        b=lCnpdlomroUALf/Ncu5tWes1E1cyb6G5oIdMjPw2zTLwQQyXqUD0opj0VL4Nl1fVcx
         f2h0E9mAPSdBw60c06HsQS9AE6Bd9GDlpqwShF2qKJ9l7DJn1whulLlbVwjQbJ0G8cCW
         /Et5OwEqAzmpzTqivi1KqaRasjY+dc34MgeNFZEHC9cHDQez+1V9OJv80xorKeQggLsd
         TRBwU572Z6ve3UMybF3yzSzg2+DGPS2Qxedocq166QXrEOWNAXR4gKqdPNXL7aUctR/I
         41lDiG3oHcocz6iDrwxkM9YJGhsswyBxehNyHuw3XTgqWbWffpry92h/sA7wFoDOjnu0
         qGgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=xn+JqqqiNnmejTQu+kpj/N6R7u0SIEYkc6x41S71rZk=;
        b=rRwFawd5jMQx1L2Wgsl/DtOB3T0shGy0JuWvUOUfmyPUU+X6eHC9z67EJFSM1yUKbj
         5ARTlxWKdD0y/niJ0eF9FzEctQEUh2ZN220nqUjf0PpTawIWfTZGfY4prG5/bVBaavWH
         kvRGfJ89cuFq47WWZy88fuHV7dOlxJnP+G3qhx/spot93ay+z55OBcqvYLI1I/69IgmK
         wjWZb8iXPoyaCJlMINYAuIBXZQ8rOHwP7f2YMFNRanc57ik6K7ntP2LKmQvn7xFCbRJa
         2yRYLYmh5sB17jBIYS7Q68be62CevUwUbsGAkRQjSq+Elo7yOppJSFO1uWwulVdUyo2Z
         xVOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si9004984edy.48.2019.10.01.08.56.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 08:56:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:43948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFKVP-0001Q1-UL
	for alex.bennee@linaro.org; Tue, 01 Oct 2019 11:56:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49916)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iFKT1-00082r-Lb
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:53:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iFKT0-0006Xe-AU
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 11:53:35 -0400
Received: from relay.sw.ru ([185.231.240.75]:38366)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iFKT0-0006WQ-1y; Tue, 01 Oct 2019 11:53:34 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iFKSy-0004xb-4I; Tue, 01 Oct 2019 18:53:32 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/31] arm: Fix error_append_hint/error_prepend usage
Date: Tue,  1 Oct 2019 18:52:58 +0300
Message-Id: <20191001155319.8066-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001155319.8066-1-vsementsov@virtuozzo.com>
References: <20191001155319.8066-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NjY0LJUlL7Iw

If we want to add some info to errp (by error_prepend() or
error_append_hint()), we must use the ERRP_AUTO_PROPAGATE macro.
Otherwise, this info will not be added when errp == &fatal_err
(the program will exit prior to the error_append_hint() or
error_prepend() call).  Fix such cases.

This commit (together with its neighbors) was generated by

git grep -l 'error_\(append_hint\|prepend\)(errp' | while read f; do \
spatch --sp-file scripts/coccinelle/fix-error-add-info.cocci \
--in-place $f; done

and then

./python/commit-per-subsystem.py MAINTAINERS "$(< auto-msg)"

(auto-msg was a file with this commit message)

and then by hand, for not maintained changed files:

git commit -m "<SUB-SYSTEM>: $(< auto-msg)" <FILES>

Still, for backporting it may be more comfortable to use only the first
command and then do one huge commit.

Reported-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 hw/intc/arm_gicv3_kvm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 9c7f4ab871..e3b79d6179 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -766,6 +766,7 @@ static void vm_change_state_handler(void *opaque, int running,
 
 static void kvm_arm_gicv3_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_AUTO_PROPAGATE();
     GICv3State *s = KVM_ARM_GICV3(dev);
     KVMARMGICv3Class *kgc = KVM_ARM_GICV3_GET_CLASS(s);
     bool multiple_redist_region_allowed;
-- 
2.21.0

