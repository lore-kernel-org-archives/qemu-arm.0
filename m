Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp759093lfp;
        Tue, 14 Sep 2021 07:54:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMIxJWuHFrSjKjXEKhgzrkJ2ySLgt19OjhwWaD8QI6/bmXdFv+Gd03qlWQk2vz8O6JEeQT
X-Received: by 2002:a9f:35c6:: with SMTP id u6mr4603104uad.21.1631631240385;
        Tue, 14 Sep 2021 07:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631631240; cv=none;
        d=google.com; s=arc-20160816;
        b=FeAWEmkoPFDp1k/qWevJotohTUXzTBZ3fC0UO0X3KdeZWkDBx8jp6ScCRD69M5hQGj
         UlK99Z+ccT+bsAVnsRuGKcdCR9M4b3ed7WvbnsaNcwRKZo7Oozn9aQTthL3qSmBoBWCc
         J+d1PjGHyfYaZJ3CXK2gM7QnC/DwyT+lvuNMDi54+NcOoDJ4MH6Gz1NYhQKK8vPPtDnJ
         2avHyOV7YGsPtnP413sUqK7g7dng/ePpv7D8F2n7s23V3wTSgQrgkMKUfD5pzDUcE/5Q
         VfNGr3BXudN6qv9WzYlwtIeDcnoUhzdOizCe2hCXordQt99VeZja5rsMcV2Typ4EZTgf
         HQ/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+wDxv/ynJAT6bxB9NSeiHYS4UowdIUh6a7fG4sUwkpU=;
        b=PNcNOMDc9sYtzkaWzVDZbe6axRfAABx+w9BftCEjFpom81oKMY14Y0G73hTiJ01OBK
         pab4WQDErNUfSpob+0wPyr7Rpq4DHEYWYhRnVGVLWtHonGdAgzDgSQfanbrH/pKaRsTc
         12EN7WcHyWO3e+bwR7rsb82dyzsyyciNejF7ScMWnWS2lAIV0vvJYyCKWBbKkSe7F+PV
         JWFQJ6PmY4bnFiE74inn+fmZdOeIm09Ku40vHYWTq55v6udITvG4OK5zdoNNN7ThgpBX
         Fn9yCCCWHObi/BLeWqgOYVuIT1W1wDUFy3ycPNOhLsm5Cbg4J31heulrMp+73557oS39
         JKKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="H/W2ihAB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay30si1663993uab.261.2021.09.14.07.54.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 07:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="H/W2ihAB";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQ9ot-0001QL-Lp
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 10:53:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9P9-0000oZ-NJ
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:27:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9P6-0007X7-Jx
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+wDxv/ynJAT6bxB9NSeiHYS4UowdIUh6a7fG4sUwkpU=;
 b=H/W2ihAB9RFkqY/xLjWQLYnCeRmPPURRaWGmJ6IYo6L+d4lV8meKjeCWvd4A2New+xCf7/
 J8sK7/fVc7HtPXfqYa03Mp0JV2ZOWrwiMLqn1uI+1A3Jx9a6T0pSre2VMqHIK6PvkCNvHs
 us4x60+y8TJkz+4Gee0lfmHd4bCx/zs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-T2ixmEeIOZmDohW-2iSoeA-1; Tue, 14 Sep 2021 10:27:18 -0400
X-MC-Unique: T2ixmEeIOZmDohW-2iSoeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 120531084681;
 Tue, 14 Sep 2021 14:27:13 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 28BDB5D9CA;
 Tue, 14 Sep 2021 14:27:02 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/53] target/openrisc: convert to use format_state instead
 of dump_state
Date: Tue, 14 Sep 2021 15:20:08 +0100
Message-Id: <20210914142042.1655100-20-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.398, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: 2k96qJJ1P8e0

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/openrisc/cpu.c       | 2 +-
 target/openrisc/cpu.h       | 2 +-
 target/openrisc/translate.c | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index bd34e429ec..d60d248958 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -206,7 +206,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = openrisc_cpu_class_by_name;
     cc->has_work = openrisc_cpu_has_work;
-    cc->dump_state = openrisc_cpu_dump_state;
+    cc->format_state = openrisc_cpu_format_state;
     cc->set_pc = openrisc_cpu_set_pc;
     cc->gdb_read_register = openrisc_cpu_gdb_read_register;
     cc->gdb_write_register = openrisc_cpu_gdb_write_register;
diff --git a/target/openrisc/cpu.h b/target/openrisc/cpu.h
index 82cbaeb4f8..112b845b10 100644
--- a/target/openrisc/cpu.h
+++ b/target/openrisc/cpu.h
@@ -314,7 +314,7 @@ struct OpenRISCCPU {
 void cpu_openrisc_list(void);
 void openrisc_cpu_do_interrupt(CPUState *cpu);
 bool openrisc_cpu_exec_interrupt(CPUState *cpu, int int_req);
-void openrisc_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+void openrisc_cpu_format_state(CPUState *cpu, GString *buf, int flags);
 hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int openrisc_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int openrisc_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index d6ea536744..0155f2b160 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1723,16 +1723,16 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
     translator_loop(&openrisc_tr_ops, &ctx.base, cs, tb, max_insns);
 }
 
-void openrisc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void openrisc_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
     CPUOpenRISCState *env = &cpu->env;
     int i;
 
-    qemu_fprintf(f, "PC=%08x\n", env->pc);
+    g_string_append_printf(buf, "PC=%08x\n", env->pc);
     for (i = 0; i < 32; ++i) {
-        qemu_fprintf(f, "R%02d=%08x%c", i, cpu_get_gpr(env, i),
-                     (i % 4) == 3 ? '\n' : ' ');
+        g_string_append_printf(buf, "R%02d=%08x%c", i, cpu_get_gpr(env, i),
+                               (i % 4) == 3 ? '\n' : ' ');
     }
 }
 
-- 
2.31.1

