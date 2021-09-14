Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp738177lfp;
        Tue, 14 Sep 2021 07:29:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxo7ivUWvWONNUNtUM/VLnksMvjcAxiUVnj0bJj6t4H9eMxaQRiyezfP5u1yiZqJ/VSxJWw
X-Received: by 2002:a17:906:1f81:: with SMTP id t1mr19370036ejr.510.1631629779927;
        Tue, 14 Sep 2021 07:29:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631629779; cv=none;
        d=google.com; s=arc-20160816;
        b=nSIDAJP4Bd1wiRrlBiOdOZDGXRgA776Sq+ZriEBY6aBCxJHzr+jS0G8nK2aAo/LoST
         MV1EXJgoIHTx02olh7CN6dwxF9R5TvqJrsGlduqy2x7NKhEnKxtTM0to30tHJLa/1a4F
         ictojT1/dWRYS+B+uQK5UfHIDuELphhzs4hA8NOewaDSzvciX15sTe+OsVuN9nWVBpck
         OcILpJPwrNWFzBVK70Ye86KyoPXhLItc5rgol3zqe1fn/3stlHdhsaOXyvA7P1r6E0gb
         ihg8MRYKxAhYsYAlkK5VXtkZTPFFkweCsD4q8crtiMeqYWqpj8U+tvNQuVnEI7ndlTBH
         PPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HvKtDY8hvhL+Mhb7T4tthhDY0w2UGu81fBbKj8Ukk/M=;
        b=skwrnYH7cq88LmsEalk9l3OebHUmkdAm2ZlWIFwRWGvM1I/+KsUQ3XNPXvQ0zPN+su
         /Qfk6ncMzrNtrxCQt9xGRbmwqBGLLHyjN6Kf+Tycebu2X60nDT3zMrFG1TUKfL13mONn
         Nk1LToMNYj+fdJnb8/BBJxguhdSYLgpDn0bknBFcIm29+RU+tyGJ8G30H0yvA1VSvhzf
         uBakDVBjBWLPjPsiXN+oogw9z9+UjiQCd9kJP43j0I7IOgcvbHJZSGV+rFweNIZeNjXz
         LaktcmGJ+wHCS6m4Ptmb+dHc1Fpolq1ch4CBJgKHXFeTe9/6lt2baOz0vmicn8uXdMjr
         3kFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hbAL62Ag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi20si10919513ejb.575.2021.09.14.07.29.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:29:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hbAL62Ag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9RK-00044t-Tl
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:29:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9La-0003SJ-LT
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:23:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23112)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9LY-0004qm-9V
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HvKtDY8hvhL+Mhb7T4tthhDY0w2UGu81fBbKj8Ukk/M=;
 b=hbAL62AgzNnhVRYWC7yZrmVtLMTSYmgXTuNIJXm9oNp74Mo0kDQgHQ0R5CPDMtbOxNqd3k
 3rpxUHC5FOAAqU3bVt6I1z03bVrNaIzBZHieK8P0hEHDkeEDJ8k6peLYgNQqeWWwZHputQ
 2vUAXQFtJHwjkoelOYjKCrO8molzss4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-6RGKKmbnPumDTWSfTJDAMA-1; Tue, 14 Sep 2021 10:23:38 -0400
X-MC-Unique: 6RGKKmbnPumDTWSfTJDAMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BEE81084685;
 Tue, 14 Sep 2021 14:23:34 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 535C05D9CA;
 Tue, 14 Sep 2021 14:23:27 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/53] target/avr: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:19:58 +0100
Message-Id: <20210914142042.1655100-10-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KknA0oUyAdDu

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/avr/cpu.c | 57 ++++++++++++++++++++++++------------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/target/avr/cpu.c b/target/avr/cpu.c
index ea14175ca5..17ff21f8be 100644
--- a/target/avr/cpu.c
+++ b/target/avr/cpu.c
@@ -145,43 +145,44 @@ static ObjectClass *avr_cpu_class_by_name(const char *cpu_model)
     return oc;
 }
 
-static void avr_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+static void avr_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     AVRCPU *cpu = AVR_CPU(cs);
     CPUAVRState *env = &cpu->env;
     int i;
 
-    qemu_fprintf(f, "\n");
-    qemu_fprintf(f, "PC:    %06x\n", env->pc_w * 2); /* PC points to words */
-    qemu_fprintf(f, "SP:      %04x\n", env->sp);
-    qemu_fprintf(f, "rampD:     %02x\n", env->rampD >> 16);
-    qemu_fprintf(f, "rampX:     %02x\n", env->rampX >> 16);
-    qemu_fprintf(f, "rampY:     %02x\n", env->rampY >> 16);
-    qemu_fprintf(f, "rampZ:     %02x\n", env->rampZ >> 16);
-    qemu_fprintf(f, "EIND:      %02x\n", env->eind >> 16);
-    qemu_fprintf(f, "X:       %02x%02x\n", env->r[27], env->r[26]);
-    qemu_fprintf(f, "Y:       %02x%02x\n", env->r[29], env->r[28]);
-    qemu_fprintf(f, "Z:       %02x%02x\n", env->r[31], env->r[30]);
-    qemu_fprintf(f, "SREG:    [ %c %c %c %c %c %c %c %c ]\n",
-                 env->sregI ? 'I' : '-',
-                 env->sregT ? 'T' : '-',
-                 env->sregH ? 'H' : '-',
-                 env->sregS ? 'S' : '-',
-                 env->sregV ? 'V' : '-',
-                 env->sregN ? '-' : 'N', /* Zf has negative logic */
-                 env->sregZ ? 'Z' : '-',
-                 env->sregC ? 'I' : '-');
-    qemu_fprintf(f, "SKIP:    %02x\n", env->skip);
-
-    qemu_fprintf(f, "\n");
+    g_string_append_printf(buf, "\n");
+    /* PC points to words */
+    g_string_append_printf(buf, "PC:    %06x\n", env->pc_w * 2);
+    g_string_append_printf(buf, "SP:      %04x\n", env->sp);
+    g_string_append_printf(buf, "rampD:     %02x\n", env->rampD >> 16);
+    g_string_append_printf(buf, "rampX:     %02x\n", env->rampX >> 16);
+    g_string_append_printf(buf, "rampY:     %02x\n", env->rampY >> 16);
+    g_string_append_printf(buf, "rampZ:     %02x\n", env->rampZ >> 16);
+    g_string_append_printf(buf, "EIND:      %02x\n", env->eind >> 16);
+    g_string_append_printf(buf, "X:       %02x%02x\n", env->r[27], env->r[26]);
+    g_string_append_printf(buf, "Y:       %02x%02x\n", env->r[29], env->r[28]);
+    g_string_append_printf(buf, "Z:       %02x%02x\n", env->r[31], env->r[30]);
+    g_string_append_printf(buf, "SREG:    [ %c %c %c %c %c %c %c %c ]\n",
+                           env->sregI ? 'I' : '-',
+                           env->sregT ? 'T' : '-',
+                           env->sregH ? 'H' : '-',
+                           env->sregS ? 'S' : '-',
+                           env->sregV ? 'V' : '-',
+                           env->sregN ? '-' : 'N', /* Zf has negative logic */
+                           env->sregZ ? 'Z' : '-',
+                           env->sregC ? 'I' : '-');
+    g_string_append_printf(buf, "SKIP:    %02x\n", env->skip);
+
+    g_string_append_printf(buf, "\n");
     for (i = 0; i < ARRAY_SIZE(env->r); i++) {
-        qemu_fprintf(f, "R[%02d]:  %02x   ", i, env->r[i]);
+        g_string_append_printf(buf, "R[%02d]:  %02x   ", i, env->r[i]);
 
         if ((i % 8) == 7) {
-            qemu_fprintf(f, "\n");
+            g_string_append_printf(buf, "\n");
         }
     }
-    qemu_fprintf(f, "\n");
+    g_string_append_printf(buf, "\n");
 }
 
 #include "hw/core/sysemu-cpu-ops.h"
@@ -215,7 +216,7 @@ static void avr_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = avr_cpu_class_by_name;
 
     cc->has_work = avr_cpu_has_work;
-    cc->dump_state = avr_cpu_dump_state;
+    cc->format_state = avr_cpu_format_state;
     cc->set_pc = avr_cpu_set_pc;
     cc->memory_rw_debug = avr_cpu_memory_rw_debug;
     dc->vmsd = &vms_avr_cpu;
-- 
2.31.1

