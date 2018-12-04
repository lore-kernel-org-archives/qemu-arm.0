Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp8077356wrt;
        Tue, 4 Dec 2018 05:37:39 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vf4PhpfuzkxM/PSiteJsmX0xMOz4gfGmM/KbWzNegXlEiO8X+hVS4lhyqn1KemtvfAO34p
X-Received: by 2002:a37:99c5:: with SMTP id b188mr19365543qke.100.1543930659247;
        Tue, 04 Dec 2018 05:37:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543930659; cv=none;
        d=google.com; s=arc-20160816;
        b=xUaqxlSK8T/Fmr+OoqTF5z3fYz0Rkr1QIURyTcLLwfjtI8zu0Xj3SKYKYWxMaaTZWF
         2hcgJiLIBrW+G3ViLEGoFKXz/zza2JzRExRCsWp8mqwLYb9hG40GRo2espwkOGfOhqYS
         mxkaBqiOobIve0jYfHHZ14IgRpZ5ovHyxZ9qia6AKBotZPXVY1lzs27SYqvmRtFbhKcH
         lGMqOvbgc4Bc+9VwrBVeHNrG+x1GyL7Twc1nDPla0gzHnyzwBAk0t11d8vigrsuy6trl
         2TDeRljnL1JHNTYVd3mwsoIaHLAdjXcOkuOWzk8GLV3TYi2Lv3GeZGmSwFxPjlEM4i/G
         OTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=tgeGFH4aZVMT8632qLLPuEGDel/p8eo3fIWvMbqVlg4=;
        b=b5qM62FbR1nihoA/7Z9AwrzKi2NaCUAQhPwMPFsP80J4gMj284hjUU15w6aqeN5ulG
         3PiKC/lACTm1grmWSrCxCJ9VnEulazNxG4d2hhaobSu0dkIexbrh5PBpIqhSbT0kg0Ml
         nieTv37h/O1rYL/KtlBlSdqluj0FF9rxTGpWx1rRZyngnDXnEbRbCkU8FafS+/3jvKiV
         Y6C2nkMmd52OdlB3pPvgYhbZYGMRutz+NbqVkqp3OpKK6g9y9eLCFQxDW7HeEjQ4xasz
         qLCI+ZW4DrRnUEZuTTlm/1lD3jrMsfIvrr7rLk7hERyn9aUpqxQ3AGTKbaurMjsvW/V4
         8zUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y47si2289294qtb.175.2018.12.04.05.37.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Dec 2018 05:37:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56798 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUAtO-00068g-C4
	for alex.bennee@linaro.org; Tue, 04 Dec 2018 08:37:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gUAmE-0007sQ-Ma
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:30:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1gUAm8-00013z-Un
	for qemu-arm@nongnu.org; Tue, 04 Dec 2018 08:30:14 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:53236)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1gUAm7-0000pO-4L; Tue, 04 Dec 2018 08:30:07 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1gUAlt-0008Bm-Iw; Tue, 04 Dec 2018 13:29:53 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  4 Dec 2018 13:29:48 +0000
Message-Id: <20181204132952.2601-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181204132952.2601-1-peter.maydell@linaro.org>
References: <20181204132952.2601-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/5] target/arm: Free name string in ARMCPRegInfo
 hashtable entries
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YkYgttT4wz6O

When we add a new entry to the ARMCPRegInfo hash table in
add_cpreg_to_hashtable(), we allocate memory for tehe
ARMCPRegInfo struct itself, and we also g_strdup() the
name string. So the hashtable's value destructor function
must free the name string as well as the struct.

Spotted by clang's leak sanitizer. The leak here is a
small one-off leak at startup, because we don't support
CPU hotplug, and so the only time when we destroy
hash table entries is for the case where ARM_CP_OVERRIDE
means we register a wildcard entry and then override it later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 60411f6bfe0..b84a6c0e678 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -642,6 +642,20 @@ uint64_t arm_cpu_mp_affinity(int idx, uint8_t clustersz)
     return (Aff1 << ARM_AFF1_SHIFT) | Aff0;
 }
 
+static void cpreg_hashtable_data_destroy(gpointer data)
+{
+    /*
+     * Destroy function for cpu->cp_regs hashtable data entries.
+     * We must free the name string because it was g_strdup()ed in
+     * add_cpreg_to_hashtable(). It's OK to cast away the 'const'
+     * from r->name because we know we definitely allocated it.
+     */
+    ARMCPRegInfo *r = data;
+
+    g_free((void *)r->name);
+    g_free(r);
+}
+
 static void arm_cpu_initfn(Object *obj)
 {
     CPUState *cs = CPU(obj);
@@ -649,7 +663,7 @@ static void arm_cpu_initfn(Object *obj)
 
     cs->env_ptr = &cpu->env;
     cpu->cp_regs = g_hash_table_new_full(g_int_hash, g_int_equal,
-                                         g_free, g_free);
+                                         g_free, cpreg_hashtable_data_destroy);
 
     QLIST_INIT(&cpu->pre_el_change_hooks);
     QLIST_INIT(&cpu->el_change_hooks);
-- 
2.19.2

