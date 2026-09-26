Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACEDC98335
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 08:18:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xANZs-000840-Mu; Sat, 26 Sep 2026 04:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANZq-00083I-LE
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 04:16:10 -0400
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANZo-0006mp-Vv
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 04:16:10 -0400
Received: by mail-dy2-x0e.google.com with SMTP id
 5a478bee46e88-34182b58c7eso1241551eec.0
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 01:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790410567; x=1791015367; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=exZwZi6kUGYGpdAf583ubd0KYwWAqRs91Lhg3wPcRlQ=;
 b=K61czQywXx8jWhWILNe+WgP2lub2PudojG/E7eyKCN3p5qFHHcViEerSLUD5BtB/lL
 c+YwFg4PJH5+hiE43WPR2/97bPSj9YIgAkIycCFd87CGAMnRLCosHNn6XdhnvDxuH0aN
 CfUKDenajkA3QoLAPa7nhALxIxudS8XdvAferE7tSXWEe+vKWUKpYa/0cv7TJT5kpck9
 GeyRLuGz4UiiE+mo4l0VNUUyho9cgg+naRWUkt/51rFQBsEdTzAnM8XrpfxRUaTnE7Zv
 J2HPJf9Yv3Yu5m+DOfdBDQF4I1d/cwk1nFDyMOKa8ULPtcNmB0SAuuNNbJ5s8PzJ7cuB
 F7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790410567; x=1791015367;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=exZwZi6kUGYGpdAf583ubd0KYwWAqRs91Lhg3wPcRlQ=;
 b=SivuT1iCnyWl8fYnBnNyPO3bcZ39nhwKN1BMEN7A1Z0DeoDbAuAY8TK6bICZK9fO8c
 yRv3k9Z0mLm6Virf5gHDyKViLg8hjNTNlzq1ouCIrU9k+PGDRlYWRd5dbp168zFtruEf
 ydlgXaK5sbdaV35wBPM0+S85ra6F51/qe2ZekEe/AvPQ6m77Ow2IumBZggq3zqjmZbWr
 EN0Ja4vkHwSpRanV0Us1YVc06q7+XVyoRAfxOHqyOwCjCMtNFKtSluACjqG2M2J8h5FD
 +jzUBn62erD6S8o7jNEp7qkoh4SqpulCkzSRgXxz8F9JT3mU1VEZ9iEFTbzwAaU9Tut1
 85XQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwX6Cavdd/+pLWNU+CF8y2NC6C+Hfnb5CvFxcL+O1pU/DhJcoU36ISBVTyPtzA1xUKVKf0drJKRIg==@nongnu.org
X-Gm-Message-State: AFuF++mF68I7dkPq6XxlxKnNIbShzj3tUIL7WPE1yLswo4AvX8xzxcQO
 TnRjcS6Okm3WZ9qtwt1V3RxtX4mtxN+81+cCWlEz5sv6LKaJ1w+Hyli0
X-Gm-Gg: AYBFou3twd6jU+uOK7uJkoe8xQ3eAAUMbK/iScxl8M/YA1RRV8mEr8OumXvoQKF2EOl
 G+qOwDMO6kDvnIfhSxekB0BhEVvpqQip02JGznC7ed+WxxvKBB4olnUNPepz+uZxR6E4Mf32XjD
 l9jfgHdqFWfSC1+zUDBSxsA1oAPvR0hCObtnnaeKmRYgb33htZk8jc4a5qiOHFr054NXjHE9vuB
 UYwkOCehZTo9SsKgmL4qxIhnEiJ6jVzKQQAwWvGAtqVZfzSR1t+Ms7m5jDqVK6MrEIqdzIM3Yaj
 3butnjjIonfbwZic4zDAsTgWcXSmgeG6ufKU5epeSRrf00CGLSPBIi50+WpEHEMVnVQ9dC/fvHV
 Fc0Fl3Yx6qts3V+pYRSP0EbVPsHM6g5wSQPK+EXXb7ScRQm+FTP/nu8Ny/5EBIyYcBHGHLDXDAX
 +UWbxZzgje3DMNZhgOgB44d4EJ2AJ9KMVQlYAMBoqv+OMCmGnUGWbDX/r3GmFEsI677UmvbTJoh
 D/tjqEo9+LoPQmyx9rPTlsZqXkmr0fP
X-Received: by 2002:a05:7300:4728:b0:33c:e82:70c9 with SMTP id
 5a478bee46e88-34272c4f38amr1974119eec.32.1790410566579; 
 Sat, 26 Sep 2026 01:16:06 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34144f4eb9esm11970568eec.19.2026.09.26.01.16.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 01:16:05 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Song Gao <17746591750@163.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 01/10] machine: allow -M name to differ from QOM type
Date: Sat, 26 Sep 2026 16:15:41 +0800
Message-ID: <20260926081551.29-2-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926081551.29-1-luoyonggang@gmail.com>
References: <20260926081551.29-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

- Add machine_class_set_name() so boards can keep a stable -M name
  when the QOM type is uniquified. machine_class_base_init still
  defaults the name to the QOM type without -machine.
- Document that MachineClass::name is the -M name, not the QOM type.
- Sort -M help by MachineClass::name so order matches the printed names
  when QOM types are prefixed (arm-virt-11.1-machine vs virt-11.1).

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 hw/core/machine.c        |  6 ++++++
 include/hw/core/boards.h | 12 +++++++++++-
 system/vl.c              |  8 +++-----
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 92f7be52a13..6b933f2302d 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1215,6 +1215,12 @@ static void machine_class_init(ObjectClass *oc, const void *data)
         "Memory size configuration");
 }
 
+void machine_class_set_name(MachineClass *mc, const char *name)
+{
+    g_free(mc->name);
+    mc->name = g_strdup(name);
+}
+
 static void machine_class_base_init(ObjectClass *oc, const void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
diff --git a/include/hw/core/boards.h b/include/hw/core/boards.h
index 3b86724cf00..851140ad052 100644
--- a/include/hw/core/boards.h
+++ b/include/hw/core/boards.h
@@ -36,6 +36,16 @@ const char *machine_default_cpu_type(const MachineState *ms);
  * @mc: Machine class
  */
 const char *machine_class_default_cpu_type(MachineClass *mc);
+/**
+ * machine_class_set_name: Set the -M name when it differs from the QOM type
+ * @mc: Machine class
+ * @name: Name used by -M lookup, help, and migration
+ *
+ * machine_class_base_init sets MachineClass::name from the QOM type with
+ * the -machine suffix removed. Call this from board class_init when the
+ * CLI name must stay stable after the QOM type is uniquified.
+ */
+void machine_class_set_name(MachineClass *mc, const char *name);
 
 void machine_add_audiodev_property(MachineClass *mc);
 void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp);
@@ -269,7 +279,7 @@ struct MachineClass {
     /*< public >*/
 
     const char *family; /* NULL iff @name identifies a standalone machtype */
-    char *name;
+    char *name; /* -M name; default is QOM type without -machine */
     const char *alias;
     const char *desc;
     const char *deprecation_reason;
diff --git a/system/vl.c b/system/vl.c
index 468a9fc247a..0d52c5d0a46 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1538,10 +1538,9 @@ static gint machine_class_cmp(gconstpointer a, gconstpointer b, gpointer d)
     if (mc1->family == NULL) {
         if (mc2->family == NULL) {
             /* Compare standalone machine types against each other; they sort
-             * in increasing order.
+             * in increasing order by the name shown in -M help.
              */
-            return strcmp(object_class_get_name(OBJECT_CLASS(mc1)),
-                          object_class_get_name(OBJECT_CLASS(mc2)));
+            return strcmp(mc1->name, mc2->name);
         }
 
         /* Standalone machine types sort after families. */
@@ -1560,8 +1559,7 @@ static gint machine_class_cmp(gconstpointer a, gconstpointer b, gpointer d)
     }
 
     /* Within the same family, machine types sort in decreasing order. */
-    return strcmp(object_class_get_name(OBJECT_CLASS(mc2)),
-                  object_class_get_name(OBJECT_CLASS(mc1)));
+    return strcmp(mc2->name, mc1->name);
 }
 
 static void machine_help_func(const QDict *qdict)
-- 
2.52.0.windows.1


