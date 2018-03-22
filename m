Received: by 10.28.71.155 with SMTP id m27csp537659wmi;
        Thu, 22 Mar 2018 09:13:06 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+OJNtpCGbMJ1JepuESd5n2YwU8abpq+bpj6fD7qoyUacecrSDO73ZAEiHbhMhMip0j7tZf
X-Received: by 10.55.207.145 with SMTP id v17mr5006198qkl.219.1521735186351;
        Thu, 22 Mar 2018 09:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521735186; cv=none;
        d=google.com; s=arc-20160816;
        b=oh2fYGaZS7wSbA1lL0AdDw/ADxCn/A0cvHNXNB0eiUvQW9fuOowAf7JErfK4Hgowwd
         L2D/oZMzLXo9E9/jmmZdMES84LHZCdfBYH6lBmKK5IXlb38Mqnz0LOq+Qj+MoWFPHDfB
         HgTVIRyfKDHez993t4L0f20Rri1nOyDzjtOX661VCUO4NWmD+waQv54Z3X2oLxbHyI/b
         Nbx9TRW2cKl5ICFJf11uSQ2385iPcpkk7aM0rJ0/f8e8ytP0nW+p3jGPE4TfYhbbZeqz
         /WTxied2XCqz22JgAtqGcYq8Z3QeI/f9MGQbdLQk7uist3g/PkI/B8Bw4oAbrGtx6dHg
         JiHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=tmjAdmfcGAgYIQm9xm3M2nMv2y/U+Z8fnyyp6bJLs9I=;
        b=okOzqdayez+o6Y+kmXrsfdOo4M44AZLIv83xq7s5Uss/bBfcXJxwr4mhpWWq7klw1f
         I8kB/buTZ7U908nNFa8UiacEycE0S9HdxN2hp5stQpeNpYLL4EIN4ITZQw5Rka0iGJ0a
         HpnwT/sfPsKtbjEtwhe4Z8GtCQeE611sPDBuIHAQSjIlWFLPkV13Q+PGGvXNfrzBbQJk
         LjL+eHfpehWomdrDaoKmpie+FNgdWA4izUH/Zf/pDQKTquhIrY1+RPu6FP+pU6AAXnVV
         K++7unLO8A/65XscrKnBc4EiI9noBObw/TdYBp660nXH8TjYDQl3QEz5VAQvJ9hRJZba
         agBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f184si1302081qka.207.2018.03.22.09.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 09:13:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33529 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez2pt-0001q1-M0
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 12:13:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ez2pX-0001f9-MY
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:12:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ez2pW-00071e-LX
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 12:12:43 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36120 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ez2pW-00070i-Ec; Thu, 22 Mar 2018 12:12:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E0193BD87;
	Thu, 22 Mar 2018 16:12:41 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61AA02023230;
	Thu, 22 Mar 2018 16:12:36 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Mar 2018 17:12:23 +0100
Message-Id: <20180322161226.29796-2-lvivier@redhat.com>
In-Reply-To: <20180322161226.29796-1-lvivier@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 22 Mar 2018 16:12:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 22 Mar 2018 16:12:42 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 1/4] error: Strip trailing '\n' from error string
 arguments (again again)
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Eric Blake <eblake@redhat.com>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SVV4vtausQan

Re-run Coccinelle script scripts/coccinelle/err-bad-newline.cocci,
and found new error_report() occurences with '\n'.

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 target/i386/hvf/hvf.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/i386/hvf/hvf.c b/target/i386/hvf/hvf.c
index 15870a4f36..c36753954b 100644
--- a/target/i386/hvf/hvf.c
+++ b/target/i386/hvf/hvf.c
@@ -86,25 +86,25 @@ static void assert_hvf_ok(hv_return_t ret)
 
     switch (ret) {
     case HV_ERROR:
-        error_report("Error: HV_ERROR\n");
+        error_report("Error: HV_ERROR");
         break;
     case HV_BUSY:
-        error_report("Error: HV_BUSY\n");
+        error_report("Error: HV_BUSY");
         break;
     case HV_BAD_ARGUMENT:
-        error_report("Error: HV_BAD_ARGUMENT\n");
+        error_report("Error: HV_BAD_ARGUMENT");
         break;
     case HV_NO_RESOURCES:
-        error_report("Error: HV_NO_RESOURCES\n");
+        error_report("Error: HV_NO_RESOURCES");
         break;
     case HV_NO_DEVICE:
-        error_report("Error: HV_NO_DEVICE\n");
+        error_report("Error: HV_NO_DEVICE");
         break;
     case HV_UNSUPPORTED:
-        error_report("Error: HV_UNSUPPORTED\n");
+        error_report("Error: HV_UNSUPPORTED");
         break;
     default:
-        error_report("Unknown Error\n");
+        error_report("Unknown Error");
     }
 
     abort();
@@ -191,7 +191,7 @@ void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
     if (mem) {
         mem->size = 0;
         if (do_hvf_set_memory(mem)) {
-            error_report("Failed to reset overlapping slot\n");
+            error_report("Failed to reset overlapping slot");
             abort();
         }
     }
@@ -211,7 +211,7 @@ void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
     }
 
     if (x == hvf_state->num_slots) {
-        error_report("No free slots\n");
+        error_report("No free slots");
         abort();
     }
 
@@ -221,7 +221,7 @@ void hvf_set_phys_mem(MemoryRegionSection *section, bool add)
     mem->region = area;
 
     if (do_hvf_set_memory(mem)) {
-        error_report("Error registering new memory slot\n");
+        error_report("Error registering new memory slot");
         abort();
     }
 }
@@ -884,7 +884,7 @@ int hvf_vcpu_exec(CPUState *cpu)
                 break;
             }
             default:
-                error_report("Unrecognized CR %d\n", cr);
+                error_report("Unrecognized CR %d", cr);
                 abort();
             }
             RIP(env) += ins_len;
@@ -930,7 +930,7 @@ int hvf_vcpu_exec(CPUState *cpu)
             env->error_code = 0;
             break;
         default:
-            error_report("%llx: unhandled exit %llx\n", rip, exit_reason);
+            error_report("%llx: unhandled exit %llx", rip, exit_reason);
         }
     } while (ret == 0);
 
-- 
2.14.3

