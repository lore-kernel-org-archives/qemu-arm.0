Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1491472wrx;
        Thu, 18 Apr 2019 23:23:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwyHJXR/VFH+uLwO2lC9I1n1xC9xhTjpnOARn8/NZ1Ihx5AmjtLoIJDh9ib4xrLKwos+lCY
X-Received: by 2002:a7b:c353:: with SMTP id l19mr1383768wmj.12.1555654983827;
        Thu, 18 Apr 2019 23:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555654983; cv=none;
        d=google.com; s=arc-20160816;
        b=NrPR647LI9hviCN3a7b8RVMikFoH1JPBuTN6BAjt6ZeyvmQi6aZQowZNSKsm2HhaEB
         LcTHT+FSYoqWZTPopW6bZivjb2Np43NOFpAC17eaxwsPXAXdaVoBmr19r2VtxrFNn03R
         vPeFdOF1wdwBEIeGBBe48BDxLN7ggJPjpR2yj3zn0XyuzZPQfZl/+mlVP6C8uzv6Kt88
         5+GAoa9DlqW2vY7y5yHOWt0U+2lB57n2TW9HfQEz5KzT9fOf/7UYQaeylxi14agFGLcP
         X6z56dUWLo4FTSdL6lOXTFKmLRZeCywFIA4jtEMdRk8DBRr1xvx+J990SKFAXx5AUMCQ
         4BaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=2gNNcd6Yx/P/Zf3pf+8Q1AS01iBys+YszNeIUXTCH0g=;
        b=Y0jqIylSKlAmkU5ylbVtwMPjXoLIkGy/wBB3rOhKKVyMWgddFg+JqRO/I5zptxLY4t
         DlSvajVOkUsiq1KWHf6Yp8X8Al0K+z3Nwcxw2dUpzuVqgVQm7wpcs+78MidS9PgoBeUk
         rg3t0Nv+GL7XTrbDNOIP4eaYnGLwLZaL1bvNe+W++80bsN/JGZoNAmIPWrnxIyIsmebe
         1acOi5dETR8Mcl2Rmrb6ZGIOArKGF5Qdnci4VzSoSoo7ZnCmrPDZqHqVJhyAVHwu2fNW
         bfeGz2vgfJMqHuJe2ZSH/F9Ctx/7CniveXzyiIrb7go0cqatX7Hoe4ZswlBdQBYp4fYm
         NZYA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9si3456557wre.11.2019.04.18.23.23.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 23:23:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51964 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHMvO-0003vF-Sn
	for alex.bennee@linaro.org; Fri, 19 Apr 2019 02:23:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hHMnK-0005lJ-7H
	for qemu-arm@nongnu.org; Fri, 19 Apr 2019 02:14:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hHMnJ-00053u-6Y
	for qemu-arm@nongnu.org; Fri, 19 Apr 2019 02:14:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48340)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hHMnJ-00053Y-0I; Fri, 19 Apr 2019 02:14:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3981285550;
	Fri, 19 Apr 2019 06:14:40 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D9CC85C21F;
	Fri, 19 Apr 2019 06:14:38 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 19 Apr 2019 03:14:25 -0300
Message-Id: <20190419061429.17695-4-ehabkost@redhat.com>
In-Reply-To: <20190419061429.17695-1-ehabkost@redhat.com>
References: <20190419061429.17695-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 19 Apr 2019 06:14:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 3/7] arm: Don't split CPU model string
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
	Igor Mammedov <imammedo@redhat.com>,
	Greg Bellows <greg.bellows@linaro.org>, qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uQFp6hywPpY5

CPUClass::class_by_name is called after the CPU model name and
options were already split, there's no need to split the string
again.

Fixes: fb8d6c24b095 ("target-arm: Add CPU property to disable AArch64")
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Greg Bellows <greg.bellows@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 target/arm/cpu.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 4155782197..6848d9c94d 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1212,22 +1212,17 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
     char *typename;
-    char **cpuname;
-    const char *cpunamestr;
 
-    cpuname = g_strsplit(cpu_model, ",", 1);
-    cpunamestr = cpuname[0];
 #ifdef CONFIG_USER_ONLY
     /* For backwards compatibility usermode emulation allows "-cpu any",
      * which has the same semantics as "-cpu max".
      */
-    if (!strcmp(cpunamestr, "any")) {
-        cpunamestr = "max";
+    if (!strcmp(cpu_model, "any")) {
+        cpu_model = "max";
     }
 #endif
-    typename = g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpunamestr);
+    typename = g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
-    g_strfreev(cpuname);
     g_free(typename);
     if (!oc || !object_class_dynamic_cast(oc, TYPE_ARM_CPU) ||
         object_class_is_abstract(oc)) {
-- 
2.18.0.rc1.1.g3f1ff2140

