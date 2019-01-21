Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6413327wrt;
        Mon, 21 Jan 2019 11:36:52 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6Gl98+Drm2Jrd3M+yYTtPXAVHG1GcW+94e81LSj0035bq8INFeVP5vlK9PN//0/Pbwbsd2
X-Received: by 2002:a5d:6647:: with SMTP id f7mr29365309wrw.225.1548099412881;
        Mon, 21 Jan 2019 11:36:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548099412; cv=none;
        d=google.com; s=arc-20160816;
        b=oqY9fZbJlAr2NNpUOmCRzmzuJlCipVjgfMqkxiXQlvmw0ZPyivWfL7mI9L3QaW7rtS
         i8/AsnJ1idmlW5CZ1h7fMBetwEH2tW6u8MYQ2GQQWGIqrjsYblUcP4cExKB1ffGbvV06
         7PBIC1KOCLH5EESHj7hJHXR07F8BRzyjrsSiVyfnl1T5N07pAyB4lio912TT0ApqOAdW
         CPlmB2W+tWwuGuwP5N8dHfVQrbV6y1e5S1az9ANrxv/bShFtTdOIJ7Bl6Efk0YLMC3U2
         hsj0xLns7WKo/2wN9c+/X3Hf9AJvScym1CDnrttgmQA73vsTfh+vPaQR5/3qgigqyhoj
         7x0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=hxN9w6vB/LiDEV5gzGDXQH/dDiAcrkx41p69PfQpSas=;
        b=ruFqVt6y/XjO6KkywTVW0MBZI99LcZ9VFKZk87AqVro581CP9RHyHWQTZRIZijEc5a
         wBAyklFTm8cPdDS9zlWPY+mwm1GhdalQBxacy1Yt14HsE1P6NSrmM3fCtdeu2THkLxt0
         n9JBvLj7LMSGV6ZCNKLH/emvjybYmnOA6AW5iO0xbhaCupjDhQhHr90Bxn7vAIb9Msyy
         6eshYN2yZqTnc/6xiTX3bIV/bj6C9/g6alckfr57ocgvS1lE8VvPZhKPQlhNNqog3okR
         vNgE+QKXKnd4wBfuG3jBZhEMX4By+nd6qZBXOHtzfUqv5vuN6DWCYxh6VE2ikudT24dg
         vfpg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=czH42x5G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si64535463wrw.334.2019.01.21.11.36.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 11:36:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=czH42x5G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58787 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glfNL-0005h1-Tx
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 14:36:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glevT-000854-2z
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 14:08:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gleff-0002t1-7w
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:44 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:54199)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glefe-0002fw-QL
	for qemu-devel@nongnu.org; Mon, 21 Jan 2019 13:51:42 -0500
Received: by mail-wm1-x342.google.com with SMTP id d15so11828499wmb.3
	for <qemu-devel@nongnu.org>; Mon, 21 Jan 2019 10:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hxN9w6vB/LiDEV5gzGDXQH/dDiAcrkx41p69PfQpSas=;
	b=czH42x5GG7hu82urZ1qyzXtX0PdCCEGBdww4vSZWEk9jkvtCRhQaIcvOupgjxp8P9o
	H8TDD10vorRCkBfzamXuZjCt0SbF3jT9NifOw9nnqbbxXJJeaAKHioQbjDVlhaqokLs4
	lntdSHJc1OwoFJzZfgv57zVRJPva8RG0DQTMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hxN9w6vB/LiDEV5gzGDXQH/dDiAcrkx41p69PfQpSas=;
	b=iIsrnvWyHEaZpCbQkVO7lUZkyUrHiyRLW6JGaGOMObj9Src4LIBE1BqjKGormQVgml
	wpTWxR1M0+tPIchk99HaVOAxLvckU+QJYESfKjtINPcdxn42+uBoAXsOEhwFmyme9O9k
	jooTpyPhQIKwjuhchKqHadLdblvYZ4W1BAzFB9OljS3gzNQ0iSa/sCXwa5q32lus4eO2
	r5NFJyOylixsZEubrd16ZT+0jgp9qcJ6XyUR6cxXUJXZBShgJRPxppns4uMnzo3uuiDv
	xGXpWwyLXtiJdWACj7vkMymFhZMZfJirZexTDD2KOl+oVcLq9wM4AX9S5QAAsCHsZWRN
	3Iug==
X-Gm-Message-State: AJcUukd5Pmn+dslRBNZdvZQXgxGnrCyJEylY1Tx+8p9qpLiBKvs8E/vi
	9kurhA6XchYmX2pOUaU1w7Yhrw==
X-Received: by 2002:a1c:bd86:: with SMTP id n128mr588135wmf.22.1548096694400; 
	Mon, 21 Jan 2019 10:51:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	n82sm50386660wma.42.2019.01.21.10.51.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 10:51:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 18:51:07 +0000
Message-Id: <20190121185118.18550-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121185118.18550-1-peter.maydell@linaro.org>
References: <20190121185118.18550-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH 12/23] hw/arm/armsse: Give each CPU its own
 view of memory
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GJ6Hc9SScANz

Give each CPU its own container memory region. This is necessary
for two reasons:
 * some devices are instantiated one per CPU and the CPU sees only
   its own device
 * since a memory region can only be put into one container, we must
   give each armv7m object a different MemoryRegion as its 'memory'
   property, or a dual-CPU configuration will assert on realize when
   the second armv7m object tries to put the MR into a container when
   it is already in the first armv7m object's container

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/armsse.h | 10 ++++++++++
 hw/arm/armsse.c         | 22 ++++++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index faf5dfed252..89f19a971f4 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -135,7 +135,17 @@ typedef struct ARMSSE {
     IoTKitSysCtl sysctl;
     IoTKitSysCtl sysinfo;
 
+    /*
+     * 'container' holds all devices seen by all CPUs.
+     * 'cpu_container[i]' is the view that CPU i has: this has the
+     * per-CPU devices of that CPU, plus as the background 'container'
+     * (or an alias of it, since we can only use it directly once).
+     * container_alias[i] is the alias of 'container' used by CPU i+1;
+     * CPU 0 can use 'container' directly.
+     */
     MemoryRegion container;
+    MemoryRegion container_alias[SSE_MAX_CPUS - 1];
+    MemoryRegion cpu_container[SSE_MAX_CPUS];
     MemoryRegion alias1;
     MemoryRegion alias2;
     MemoryRegion alias3;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 5cb2b78b1fc..2472dfef3a1 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -153,6 +153,15 @@ static void armsse_init(Object *obj)
         qdev_prop_set_string(DEVICE(&s->armv7m[i]), "cpu-type",
                              ARM_CPU_TYPE_NAME("cortex-m33"));
         g_free(name);
+        name = g_strdup_printf("arm-sse-cpu-container%d", i);
+        memory_region_init(&s->cpu_container[i], obj, name, UINT64_MAX);
+        g_free(name);
+        if (i > 0) {
+            name = g_strdup_printf("arm-sse-container-alias%d", i);
+            memory_region_init_alias(&s->container_alias[i - 1], obj,
+                                     name, &s->container, 0, UINT64_MAX);
+            g_free(name);
+        }
     }
 
     sysbus_init_child_obj(obj, "secctl", &s->secctl, sizeof(s->secctl),
@@ -332,7 +341,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      * 0x50000000..0x5fffffff  alias of 0x40000000..0x4fffffff
      */
 
-    memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -1);
+    memory_region_add_subregion_overlap(&s->container, 0, s->board_memory, -2);
 
     for (i = 0; i < info->num_cpus; i++) {
         DeviceState *cpudev = DEVICE(&s->armv7m[i]);
@@ -373,7 +382,16 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                 return;
             }
         }
-        object_property_set_link(cpuobj, OBJECT(&s->container), "memory", &err);
+
+        if (i > 0) {
+            memory_region_add_subregion_overlap(&s->cpu_container[i], 0,
+                                                &s->container_alias[i - 1], -1);
+        } else {
+            memory_region_add_subregion_overlap(&s->cpu_container[i], 0,
+                                                &s->container, -1);
+        }
+        object_property_set_link(cpuobj, OBJECT(&s->cpu_container[i]),
+                                 "memory", &err);
         if (err) {
             error_propagate(errp, err);
             return;
-- 
2.20.1

