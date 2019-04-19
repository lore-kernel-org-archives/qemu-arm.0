Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1489584wrx;
        Thu, 18 Apr 2019 23:20:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzWiJkgPZmeCDspaQCzQXlY3rBELl6cecCWyfR1NPP8vWT6VUqQJ9eV77EP24CCiXACyJU5
X-Received: by 2002:adf:ea45:: with SMTP id j5mr1560250wrn.89.1555654826182;
        Thu, 18 Apr 2019 23:20:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555654826; cv=none;
        d=google.com; s=arc-20160816;
        b=RuOeeR4z5lsjAhK2xGgQOH4WJ2+mSEbMpp014Sb1ANiDvia4QKVOzyGF0onzHn6DSi
         OkbUy+EDpr0uLPHIFToMwmjxpDF19ZYRLRnp2MPGlsskPQOAUgkpQgIQHDWRYv4ZtW6R
         9gUWge6hPZLbki8POXi+C7scMB3uh+ecSJO1iTDDF1iQNOZ1NfPcY0VPxTCcjkSqseJL
         SoDGsp/IHaB/fo15buRKWQ/11v+ODWvPFNL9jaI8N2sG7wVC/IpTz06FSG7XON9eKl1Q
         PxBU8zoq9VkF73jTGafuirIVc4ruudDFbjnKyT3f+j6JCHU4j7fOvdOSgrCY06eO1SAH
         Vuag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from;
        bh=2nmovvxNflWsPJvGTHaZ6uFoJ8EUaBVgZv8nPalC2jY=;
        b=PLpnA2FRlnCaZy5X5heN3h6BPivMRqBnFOzTr0jp5rjLG60A4hMWP33hiQGdfn+Vkv
         7Hps33lxgBukVce2rf2C99+tkBkoq622Nz56esO4w8lXaQhpJKbIa9wVVdl30TYIbym1
         PAC0URfNEZjoJWI3afRbSZRQkdstiZqxRTSFgYSgTjaFUmNeoPBiDn6FjpeE6eoS2VNf
         GrwtgTzWsh7YZKlZRSmnqPdT3pTlhg2uqQjH05dws0YwAendl8mi5OIq3zZRZDxttSL2
         q16UkP7HQj53hdibqhzMRRub0Q4Tw0MkNE+sWLz1huLLmzGO54mBMX4H846EtzBGOzGS
         JwiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c126si2968817wma.181.2019.04.18.23.20.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 23:20:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHMsr-0001eb-53
	for alex.bennee@linaro.org; Fri, 19 Apr 2019 02:20:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hHMnM-0005nh-4v
	for qemu-arm@nongnu.org; Fri, 19 Apr 2019 02:14:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hHMnL-000557-5v
	for qemu-arm@nongnu.org; Fri, 19 Apr 2019 02:14:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40426)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hHMnL-00054q-0Q; Fri, 19 Apr 2019 02:14:43 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44B2588ABB;
	Fri, 19 Apr 2019 06:14:42 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CAD46600C1;
	Fri, 19 Apr 2019 06:14:41 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 19 Apr 2019 03:14:26 -0300
Message-Id: <20190419061429.17695-5-ehabkost@redhat.com>
In-Reply-To: <20190419061429.17695-1-ehabkost@redhat.com>
References: <20190419061429.17695-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 19 Apr 2019 06:14:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 4/7] arm: Remove special case for "any" CPU model
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
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bA+EysdGjZmZ

We already have an entry for "any" at arm_cpus[], which makes a
"any-arm-cpu" QOM type be registered.  This means the regular QOM
type name lookup code already works and there's no need for a
special case.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
---
 target/arm/cpu.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 6848d9c94d..dcc65093d9 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1213,14 +1213,6 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
     char *typename;
 
-#ifdef CONFIG_USER_ONLY
-    /* For backwards compatibility usermode emulation allows "-cpu any",
-     * which has the same semantics as "-cpu max".
-     */
-    if (!strcmp(cpu_model, "any")) {
-        cpu_model = "max";
-    }
-#endif
     typename = g_strdup_printf(ARM_CPU_TYPE_NAME("%s"), cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-- 
2.18.0.rc1.1.g3f1ff2140

