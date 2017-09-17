Received: by 10.223.172.38 with SMTP id v35csp3193844wrc;
        Sun, 17 Sep 2017 16:30:04 -0700 (PDT)
X-Received: by 10.200.25.124 with SMTP id g57mr9237304qtk.60.1505691004875;
        Sun, 17 Sep 2017 16:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505691004; cv=none;
        d=google.com; s=arc-20160816;
        b=FPUDRchYzvYrAwmnaxsRH88okiwEfot1SoTP/OAiDC3+sFYAvirdeg2I375gKT+bcV
         bvLJP+Hlmao4QR2xaciLZBkt+P0SWg7Nini+dp8geya0Wwhbhl/CFldOP5YCYnY4oLo9
         q7sxAICm32Wp+jL1iJ+xiyX00hM6EyktQ1e09mOe1/1kYoT8AHUi2yq+U74/t6xL0ket
         KRW8iuAKI1sxAO/N9uDPuI5mcuBbHJcSPtyH8PJfGyHAkhtxCsFev3bgip7T0PVM+m0f
         BsbI8Ixkny5O+W6y3hUNrlwyN8b/KvLxo8B2Vo0qlNNfGH6udHEeNEYKEc3lUuw/VtRn
         G9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=zOroSb19kmoQU/bQT4aanpA9QRWKuBpUwRPCcWUTVfc=;
        b=hi41wKCXln8UB66Z2m5XanUvPh8LTQZJ/4koIhY+iUvlbXzpNKzv92pHJKGG4i7/jq
         aHz7h3mnaUUXdAAanMVj3BdIFvkK/IZ7gJKN+DTXfVTsySyuCezn5sN744dpgBOZ4txs
         cbaHGD8HSsb2lhTZbwtvSrxGNeoD0BpUFNS5Uuz/RfYNZHwQ6R1vlgqt8JLqq6NLwJdd
         8yEyDIZeSZF98Oo9cgW7lZmJG0p0nJUTlLTZPO4L/LDH9fTxSwGpM7yeg5AmRZCAtNwA
         v/Fq0/M+LS/j33oUxXwirAx1EUov0igATyUHLJdS8PMH2ytpQc1iM8PjBsAaHNgj6bed
         wjCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s1C6qcO9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e92si5790917qtb.380.2017.09.17.16.30.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Sep 2017 16:30:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=s1C6qcO9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33990 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtj0k-0000DH-L4
	for alex.bennee@linaro.org; Sun, 17 Sep 2017 19:30:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtizo-0008FU-TH
	for qemu-devel@nongnu.org; Sun, 17 Sep 2017 19:29:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtizk-00056p-9c
	for qemu-devel@nongnu.org; Sun, 17 Sep 2017 19:29:04 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33285)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dtizk-00056e-4v; Sun, 17 Sep 2017 19:29:00 -0400
Received: by mail-qt0-x244.google.com with SMTP id b1so4720160qtc.0;
	Sun, 17 Sep 2017 16:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zOroSb19kmoQU/bQT4aanpA9QRWKuBpUwRPCcWUTVfc=;
	b=s1C6qcO9tVTLkcKtetF+YWa1XeM6BlXyliGf0dpaZyMIAGOmz27jtA8wmLSh4H1gk0
	NZkWYqR3aVgDApsYhIV9Z2dzYiRF87rOz9nNlEIGqd9aFiPwTBRMon9W4ztLOzhoUpe3
	4mU2kdKxqvl09SgQxbCUqMgjJLKyxPrHGCapXDN+GbS+E41go9n83ArMLc2/Q2seBl40
	Lvus+Dxy3JmSMbYz+BZNWmKopc/SWUrIpBKKT+sWqGOC6bMXFJE5XgeCd3v+9ipco2kl
	IA0ot0PdVE1oqzcYz8dmScHw8c9Sny9srmw3ANUlWek8SdNTkFWSvPAl/+k5SuaAamw1
	i8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=zOroSb19kmoQU/bQT4aanpA9QRWKuBpUwRPCcWUTVfc=;
	b=A5U54aOTNLiymPqWu4CoVqYXzSUgA811vRNHUvK9MFlLrPPzYaTeS1eFQfBMgSugB1
	57LEtwFuLuo409nWKND98Vgo6DDYksOUzJxAtaaaKRZB1OHb/YsqTLybXrHV7MSqoYiP
	RMysanXVC+GrrqUTIL5sBOhMOJZYWvq0Sxg1wbWh35mfFntT0Ovf0EKrVbVGuwkPutn3
	xRgmKWj3myJUedN7gNNujNoXlCYpoQ0h+rIZRWKCC4kdyh7ubY9X4bUdxC8EcGly9NTb
	hZw1yzLOOICXgwVnWLb9sA5dFKNWDKbib9eONsnGIQHF5m9i/aIeiocvI6Qs8J1TUizC
	gg5w==
X-Gm-Message-State: AHPjjUgONJ2vrIsHXBYLl54jjDs4pT5Z1LevG4JXFrQP2+Ojf5dvWztX
	jx5ii3wUVkMIww==
X-Google-Smtp-Source: AOwi7QDTmJipiRIA7tpmUDAMhb1yLVao+rS5Bxi9BGL5MLBK+ydix95rDnM+nSrTrCF+qJM9A05p+Q==
X-Received: by 10.200.15.132 with SMTP id b4mr49202021qtk.127.1505690939552;
	Sun, 17 Sep 2017 16:28:59 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u133sm4162279qka.92.2017.09.17.16.28.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Sep 2017 16:28:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Llu=C3=ADs=20Vilanova?= <vilanova@ac.upc.edu>,
	Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	Anthony Green <green@moxielogic.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Chris Wulff <crwulff@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Laurent Vivier <laurent@vivier.eu>,
	Marek Vasut <marex@denx.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	Peter Maydell <peter.maydell@linaro.org>,
	Stafford Horne <shorne@gmail.com>, Yongbok Kim <yongbok.kim@imgtec.com>
Date: Sun, 17 Sep 2017 20:28:42 -0300
Message-Id: <20170917232842.14544-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH] qom/cpu: move cpu_model null check to
 cpu_class_by_name()
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SRVxo2eNdmFU

and clean every implementation.

Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: 20170917232010.14183-7-f4bug@amsat.org

 qom/cpu.c              | 7 ++++++-
 target/alpha/cpu.c     | 6 +-----
 target/arm/cpu.c       | 4 ----
 target/cris/cpu.c      | 4 ----
 target/lm32/cpu.c      | 4 ----
 target/m68k/cpu.c      | 4 ----
 target/mips/cpu.c      | 4 ----
 target/moxie/cpu.c     | 8 +-------
 target/openrisc/cpu.c  | 4 ----
 target/sh4/cpu.c       | 3 ---
 target/sparc/cpu.c     | 4 ----
 target/tricore/cpu.c   | 4 ----
 target/unicore32/cpu.c | 4 ----
 target/xtensa/cpu.c    | 4 ----
 14 files changed, 8 insertions(+), 56 deletions(-)

diff --git a/qom/cpu.c b/qom/cpu.c
index dc5392dbeb..411d8cdd2b 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -311,7 +311,12 @@ static bool cpu_common_has_work(CPUState *cs)
 
 ObjectClass *cpu_class_by_name(const char *typename, const char *cpu_model)
 {
-    CPUClass *cc = CPU_CLASS(object_class_by_name(typename));
+    CPUClass *cc;
+
+    if (!cpu_model) {
+        return NULL;
+    }
+    cc = CPU_CLASS(object_class_by_name(typename));
 
     return cc->class_by_name(cpu_model);
 }
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index e6c6aabdf0..b8a21f4e01 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -127,14 +127,10 @@ static const AlphaCPUAlias alpha_cpu_aliases[] = {
 
 static ObjectClass *alpha_cpu_class_by_name(const char *cpu_model)
 {
-    ObjectClass *oc = NULL;
+    ObjectClass *oc;
     char *typename;
     int i;
 
-    if (cpu_model == NULL) {
-        return NULL;
-    }
-
     oc = object_class_by_name(cpu_model);
     if (oc != NULL && object_class_dynamic_cast(oc, TYPE_ALPHA_CPU) != NULL &&
         !object_class_is_abstract(oc)) {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 412e94c7ad..ea219c2dde 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -906,10 +906,6 @@ static ObjectClass *arm_cpu_class_by_name(const char *cpu_model)
     char *typename;
     char **cpuname;
 
-    if (!cpu_model) {
-        return NULL;
-    }
-
     cpuname = g_strsplit(cpu_model, ",", 1);
     typename = g_strdup_printf("%s-" TYPE_ARM_CPU, cpuname[0]);
     oc = object_class_by_name(typename);
diff --git a/target/cris/cpu.c b/target/cris/cpu.c
index ceebfed79b..88d93f2d11 100644
--- a/target/cris/cpu.c
+++ b/target/cris/cpu.c
@@ -69,10 +69,6 @@ static ObjectClass *cris_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
     char *typename;
 
-    if (cpu_model == NULL) {
-        return NULL;
-    }
-
 #if defined(CONFIG_USER_ONLY)
     if (strcasecmp(cpu_model, "any") == 0) {
         return object_class_by_name("crisv32-" TYPE_CRIS_CPU);
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index 2b8c36b6d0..bf081f56d2 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -246,10 +246,6 @@ static ObjectClass *lm32_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
     char *typename;
 
-    if (cpu_model == NULL) {
-        return NULL;
-    }
-
     typename = g_strdup_printf("%s-" TYPE_LM32_CPU, cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 55bf24bae6..8c70e0805c 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -87,10 +87,6 @@ static ObjectClass *m68k_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
     char *typename;
 
-    if (cpu_model == NULL) {
-        return NULL;
-    }
-
     typename = g_strdup_printf("%s-" TYPE_M68K_CPU, cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index 1a9a3ed94d..c15b894362 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -166,10 +166,6 @@ static ObjectClass *mips_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
     char *typename;
 
-    if (cpu_model == NULL) {
-        return NULL;
-    }
-
     typename = mips_cpu_type_name(cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
diff --git a/target/moxie/cpu.c b/target/moxie/cpu.c
index 748d02f29e..30bd44fcad 100644
--- a/target/moxie/cpu.c
+++ b/target/moxie/cpu.c
@@ -89,13 +89,7 @@ static void moxie_cpu_initfn(Object *obj)
 
 static ObjectClass *moxie_cpu_class_by_name(const char *cpu_model)
 {
-    ObjectClass *oc;
-
-    if (cpu_model == NULL) {
-        return NULL;
-    }
-
-    oc = object_class_by_name(cpu_model);
+    ObjectClass *oc = object_class_by_name(cpu_model);
     if (oc != NULL && (!object_class_dynamic_cast(oc, TYPE_MOXIE_CPU) ||
                        object_class_is_abstract(oc))) {
         return NULL;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index a979f0bf8b..af9cdcc102 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -108,10 +108,6 @@ static ObjectClass *openrisc_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
     char *typename;
 
-    if (cpu_model == NULL) {
-        return NULL;
-    }
-
     typename = g_strdup_printf("%s-" TYPE_OPENRISC_CPU, cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 6ce7cba5a9..252440e019 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -133,9 +133,6 @@ static ObjectClass *superh_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
     GSList *list, *item;
 
-    if (cpu_model == NULL) {
-        return NULL;
-    }
     if (strcasecmp(cpu_model, "any") == 0) {
         return object_class_by_name(TYPE_SH7750R_CPU);
     }
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 0806d699e6..beab90f3e6 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -730,10 +730,6 @@ static ObjectClass *sparc_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
     char *typename;
 
-    if (cpu_model == NULL) {
-        return NULL;
-    }
-
     typename = sparc_cpu_type_name(cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 5ab5b56454..871eb35453 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -120,10 +120,6 @@ static ObjectClass *tricore_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
     char *typename;
 
-    if (!cpu_model) {
-        return NULL;
-    }
-
     typename = g_strdup_printf("%s-" TYPE_TRICORE_CPU, cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
diff --git a/target/unicore32/cpu.c b/target/unicore32/cpu.c
index c9b78ce68e..138acc9dd8 100644
--- a/target/unicore32/cpu.c
+++ b/target/unicore32/cpu.c
@@ -44,10 +44,6 @@ static ObjectClass *uc32_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
     char *typename;
 
-    if (cpu_model == NULL) {
-        return NULL;
-    }
-
     typename = g_strdup_printf("%s-" TYPE_UNICORE32_CPU, cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 85897df0a8..dcdc765a86 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -83,10 +83,6 @@ static ObjectClass *xtensa_cpu_class_by_name(const char *cpu_model)
     ObjectClass *oc;
     char *typename;
 
-    if (cpu_model == NULL) {
-        return NULL;
-    }
-
     typename = g_strdup_printf("%s-" TYPE_XTENSA_CPU, cpu_model);
     oc = object_class_by_name(typename);
     g_free(typename);
-- 
2.14.1

