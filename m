Received: by 10.28.71.155 with SMTP id m27csp555883wmi;
        Fri, 23 Mar 2018 07:36:33 -0700 (PDT)
X-Google-Smtp-Source: AG47ELv5ZnhXwRmv+MCo9/5JWpp/Q54KVfudxdpK8VQfPDXBF7eG0NXur3oBNWLFL/HAPgc+VloG
X-Received: by 10.233.214.8 with SMTP id r8mr29045340qkk.109.1521815793470;
        Fri, 23 Mar 2018 07:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521815793; cv=none;
        d=google.com; s=arc-20160816;
        b=pcDuJ67irwOSMO2AkiSbCIWMsUYg40g22vETBcE+TjxeaiiiAtkJSYXy1C9grnaR84
         WNgl738j5X7ppz3DfcwfeuBUefjnbM55Zc1120UfOgmarpEiOZi7PXAUv6/D8VRg9GrR
         J0GXtFqG9JqgeRl3Ws/V22ls5vSd+WYQ49Q8kGeNVW8/jt8V6wPP6FPTzP9kWl1oHOcq
         lZhp+CvcEx5jjW4WXtzKcvR2I5S18diglqlW0cM6FL6b5rOOpKeTYiMpxZz/R3qyNHau
         hVZ0gU0kTEv6RtG2idYr4OGT6b8XDFzwhwCOp+NWkV6sxymj38p45vCTCv29u/ph013U
         RgHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=tmjAdmfcGAgYIQm9xm3M2nMv2y/U+Z8fnyyp6bJLs9I=;
        b=i9N+RE7XjT7Df/ghnJZMsPOs/JtFZlz80a+Tuh2vXBc8kngKmVVa04Y1oTI9VEaHwd
         /cYzFJaSFcBMbNsop+L6OA8z0okUNJsEOP8FTdhsWmZSRKtVxjS+lbCUgXX1s8Ek2hUJ
         HWhTrHA60GSC1KVW9mXF9ygMrbnDcHqmha1r+8yzUidBOBxMLL+cd9kiAbtRzMLgDh3/
         vi2e0j1GR6b3pGraFxZRTgEFCW9CoMJzEip3lbwvr7flCU1Ho0UVMqCxgHVSBcfMeKc5
         UqRuZ8tAXUBAnrLUfs8shuP0VejgIdzLdHbQcvrsENeXueV/7Pd9B7GadAc2jtlaFMoV
         5UMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b17si1390066qkj.55.2018.03.23.07.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 07:36:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38367 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezNo0-0007cD-WF
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 10:36:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNk5-00044d-G4
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 10:32:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1ezNk1-0003AC-MM
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 10:32:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58270 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1ezNk1-00039z-Gx; Fri, 23 Mar 2018 10:32:25 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF4008151D49;
	Fri, 23 Mar 2018 14:32:24 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-204-35.brq.redhat.com [10.40.204.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 34F0F2023233;
	Fri, 23 Mar 2018 14:32:18 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 23 Mar 2018 15:31:59 +0100
Message-Id: <20180323143202.28879-3-lvivier@redhat.com>
In-Reply-To: <20180323143202.28879-1-lvivier@redhat.com>
References: <20180323143202.28879-1-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 23 Mar 2018 14:32:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 23 Mar 2018 14:32:25 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lvivier@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 2/5] error: Strip trailing '\n' from error
 string arguments (again again)
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
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, Eric Blake <eblake@redhat.com>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Yongbok Kim <yongbok.kim@mips.com>,
	Markus Armbruster <armbru@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Z964o6OYo2n8

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

