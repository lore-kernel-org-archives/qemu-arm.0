Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp742930lfp;
        Tue, 14 Sep 2021 07:34:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn1cvTLNcOpIVNCd01RGS1GbxOLVR0HR8E06ztFh5EriwS6vFtyG9iyA2pVC10Qekd73Ui
X-Received: by 2002:a05:6512:12c8:: with SMTP id p8mr13528685lfg.208.1631630095739;
        Tue, 14 Sep 2021 07:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631630095; cv=none;
        d=google.com; s=arc-20160816;
        b=KOAbZvVhNg/r7Hs18l+xKKL2YejrUKItkxzQKeq7b9ookro3YKTsCtlndbbhSEBltS
         zdAOS8bZBNSAik6PNnEaP/Urdpak/rzvHrcWEBO1QZUmb7Nt+aU/8PgDVGOZ0ZD3mrYU
         Pmy2ZsIJfmTR5SgpkENcy2G3agH/1MrJRlTPJtEye5uuJSPQhPzJb7VhLDw260zNwbeF
         6/d+Kn/X6dZRHDidmtXVfy0OicG+5i4O9WlxwMCHcgscpIUoDLtdd+841TO3tpMvCPM5
         GagS0FhdvEaxSvlIg1Z8m+N1Egmce3FNR1rQYteD3uZNF0OaunzVohtNjbyhC5VD9u8p
         QmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=tog67gS4drGXdUxWrkIWCLaJgHomsSxvNugMDYrI6tI=;
        b=g/S4pZF/UHe2LrJbuv96ufcxXMARCne7z8MX5OB5YoxRHNmyUYBZpPfHI3osfz8KdH
         jzjCryUrh7KrwzSjFIYO2ceH8EA6VQOfujt2VEPAFePEqbBNnOkSfFV2Rdvk0brxUbiO
         Q7sS9aKW6dmU8qqy+MpoER04WWcKDplqG2GpQK8BLAYKswYvA8RDANIucBfZ7b7MrILj
         OhhYLsBfiYLFBWpXjBfHSDOkbUe3Y0+sbv15+35gc4Ufzjs6VeDRlgLgPSwmao7ycRtD
         OFGUz6Gu9GvBvNqh0/NpcO/M9cPJTYVJDPhgNIBoicSB3f+DAtP8jlq6ve5eqdCaJAzU
         3Dsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EXDDFyZd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si10447081ejl.583.2021.09.14.07.34.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:34:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EXDDFyZd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9WQ-0002aU-NL
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:34:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9LA-0002J7-Uh
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:23:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9L7-0004YU-RU
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:23:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tog67gS4drGXdUxWrkIWCLaJgHomsSxvNugMDYrI6tI=;
 b=EXDDFyZd10jx19s/zrVhVfNW7h1AkU6fzvn+7VHV8Vg0+Cf4FWlha0TaZ3gtzZbro4Ho7g
 szNXI3QS9K1GTuFsOeTUH0SRgMkg724xN1Y9GE1YzcsYkWWlgeuIRP2XNRsWDjN5tuOCMs
 hDtfeMxXAX8FcuaoEITLsI/SKRTzKYI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-A9bwwun7PU-maqSTdeQ_xw-1; Tue, 14 Sep 2021 10:23:12 -0400
X-MC-Unique: A9bwwun7PU-maqSTdeQ_xw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4729784A5E0;
 Tue, 14 Sep 2021 14:23:08 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F14E5D9CA;
 Tue, 14 Sep 2021 14:23:00 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/53] target/alpha: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:19:56 +0100
Message-Id: <20210914142042.1655100-8-berrange@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nQhz+2Xc8L6J

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/alpha/cpu.c    |  2 +-
 target/alpha/cpu.h    |  2 +-
 target/alpha/helper.c | 28 ++++++++++++++++------------
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index 4871ad0c0a..d0cdda9554 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -239,7 +239,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = alpha_cpu_class_by_name;
     cc->has_work = alpha_cpu_has_work;
-    cc->dump_state = alpha_cpu_dump_state;
+    cc->format_state = alpha_cpu_format_state;
     cc->set_pc = alpha_cpu_set_pc;
     cc->gdb_read_register = alpha_cpu_gdb_read_register;
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
diff --git a/target/alpha/cpu.h b/target/alpha/cpu.h
index 82df108967..9e3c80ebcc 100644
--- a/target/alpha/cpu.h
+++ b/target/alpha/cpu.h
@@ -278,7 +278,7 @@ extern const VMStateDescription vmstate_alpha_cpu;
 
 void alpha_cpu_do_interrupt(CPUState *cpu);
 bool alpha_cpu_exec_interrupt(CPUState *cpu, int int_req);
-void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags);
+void alpha_cpu_format_state(CPUState *cs, GString *buf, int flags);
 hwaddr alpha_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int alpha_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int alpha_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/alpha/helper.c b/target/alpha/helper.c
index 4f56fe4d23..6ed80e8a27 100644
--- a/target/alpha/helper.c
+++ b/target/alpha/helper.c
@@ -451,7 +451,7 @@ bool alpha_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
-void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void alpha_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     static const char linux_reg_names[31][4] = {
         "v0",  "t0",  "t1", "t2",  "t3", "t4", "t5", "t6",
@@ -463,25 +463,29 @@ void alpha_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     CPUAlphaState *env = &cpu->env;
     int i;
 
-    qemu_fprintf(f, "PC      " TARGET_FMT_lx " PS      %02x\n",
-                 env->pc, extract32(env->flags, ENV_FLAG_PS_SHIFT, 8));
+    g_string_append_printf(buf,
+                           "PC      " TARGET_FMT_lx " PS      %02x\n",
+                           env->pc,
+                           extract32(env->flags, ENV_FLAG_PS_SHIFT, 8));
     for (i = 0; i < 31; i++) {
-        qemu_fprintf(f, "%-8s" TARGET_FMT_lx "%c",
-                     linux_reg_names[i], cpu_alpha_load_gr(env, i),
-                     (i % 3) == 2 ? '\n' : ' ');
+        g_string_append_printf(buf, "%-8s" TARGET_FMT_lx "%c",
+                               linux_reg_names[i], cpu_alpha_load_gr(env, i),
+                               (i % 3) == 2 ? '\n' : ' ');
     }
 
-    qemu_fprintf(f, "lock_a  " TARGET_FMT_lx " lock_v  " TARGET_FMT_lx "\n",
-                 env->lock_addr, env->lock_value);
+    g_string_append_printf(buf, "lock_a  " TARGET_FMT_lx
+                           " lock_v  " TARGET_FMT_lx "\n",
+                           env->lock_addr, env->lock_value);
 
     if (flags & CPU_DUMP_FPU) {
         for (i = 0; i < 31; i++) {
-            qemu_fprintf(f, "f%-7d%016" PRIx64 "%c", i, env->fir[i],
-                         (i % 3) == 2 ? '\n' : ' ');
+            g_string_append_printf(buf, "f%-7d%016" PRIx64 "%c", i, env->fir[i],
+                                   (i % 3) == 2 ? '\n' : ' ');
         }
-        qemu_fprintf(f, "fpcr    %016" PRIx64 "\n", cpu_alpha_load_fpcr(env));
+        g_string_append_printf(buf, "fpcr    %016" PRIx64 "\n",
+                               cpu_alpha_load_fpcr(env));
     }
-    qemu_fprintf(f, "\n");
+    g_string_append_printf(buf, "\n");
 }
 
 /* This should only be called from translate, via gen_excp.
-- 
2.31.1

