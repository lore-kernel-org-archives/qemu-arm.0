Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp771695lfp;
        Tue, 14 Sep 2021 08:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxs+lqu4jV/JNNW7QQRthQ2Ftty9KzCbZkGvh9VdnUzHJIFOVc0IKtMiEtsXqjwbnfIjbtt
X-Received: by 2002:a17:906:368e:: with SMTP id a14mr19056795ejc.60.1631632035083;
        Tue, 14 Sep 2021 08:07:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631632035; cv=none;
        d=google.com; s=arc-20160816;
        b=j/9/torbWClTeXmw5P9/zGtfZXKSjQ0pKylXI9ZrToU/z7CkQHvBy/ON6OxQ6VuYwv
         7K/I5AJrTgu5JDOXrFYWMxK5LUDrMTnyMEwsULPeJBT9RFR7V7nT55tBpFEZAdQQzsqB
         kAHfESsnX/I2MZz2VMjqsvrP2d8kmSXiDNhB73RRkx8c+jYdHOIiBe1yNjWrr/aIi6AY
         KCmeQt/sY/jt/ammkK6+bB3vZuHhpsWOgvuJ0AsVyxIdbUgkHrLDHqcb1MpufUGIzJDF
         U26bqK5IJrTQuSZAKkYDLim/0C+Dh8Eta54DRUyZ8/PNMCTVSCOlBDLdLzr98L7gOvVO
         rOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qmRjzYwG+Lqfcps3G17xaNhRzRStWHGYP7XEVvjTzcM=;
        b=hAy2QfJ2EZ2RIkJDlJizjzmfJZ0Z/MLi/YOTHauSNhn+CxfCTgmVijZSYig5xP817q
         yJUFXPNKtyQiw767ChNkGwKLJ56Ni4+J04zQR3DeH0se2f+G1UEUyy7Pk6GjUbSkSSjb
         Pff+RESpRmXsH7l3Ovv8mUVF2tkOW9Esg2ZuSUUiAbYScEm2mnDogmoMhLuu380y0w/z
         VOHExrp6W4vnmZPQpoZ07GdGY0C6NkIQ2T5dPGuL2ssrcrBv42HhtDdwfQLC/n+Gf+OH
         Eoh+9sk1zxZIrcrOq1KSaSvaOqpIyEe8/xUqgJLjg49xdcabQbFZj1KpC8xQ9YI32WDM
         x9AQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aD9lNuCX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m1si13525946ejj.198.2021.09.14.08.07.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 08:07:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aD9lNuCX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQA1i-0001nw-2B
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 11:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Qc-0002im-V4
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:28:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9QZ-0000GP-QX
 for qemu-arm@nongnu.org; Tue, 14 Sep 2021 10:28:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631629731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qmRjzYwG+Lqfcps3G17xaNhRzRStWHGYP7XEVvjTzcM=;
 b=aD9lNuCXnA3NfKFIRR7jpQfJanT4MLYd52X5tmfN59NqekPvFJGrj3uBEj73nJlcm9S7VZ
 vbqi9y9jLQ/3pjveqLT0tHTYqUARl1HJCjg8pBHaaM81j6wCKYSNpAlXrqwsWYXsANt67z
 OcugroLO2b4DnGnAtJ+v5mX07IQQAG0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-yKE_4DFNPHKCIDnj822tIg-1; Tue, 14 Sep 2021 10:28:49 -0400
X-MC-Unique: yKE_4DFNPHKCIDnj822tIg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B2DFA0CCD;
 Tue, 14 Sep 2021 14:28:45 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AE295D9CA;
 Tue, 14 Sep 2021 14:27:57 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/53] target/rx: convert to use format_state instead of
 dump_state
Date: Tue, 14 Sep 2021 15:20:11 +0100
Message-Id: <20210914142042.1655100-23-berrange@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: UdJ7H1YiKiLR

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/rx/cpu.c       |  2 +-
 target/rx/cpu.h       |  2 +-
 target/rx/translate.c | 14 ++++++++------
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/rx/cpu.c b/target/rx/cpu.c
index 96cc96e514..f7f158cfa5 100644
--- a/target/rx/cpu.c
+++ b/target/rx/cpu.c
@@ -207,7 +207,7 @@ static void rx_cpu_class_init(ObjectClass *klass, void *data)
 
     cc->class_by_name = rx_cpu_class_by_name;
     cc->has_work = rx_cpu_has_work;
-    cc->dump_state = rx_cpu_dump_state;
+    cc->format_state = rx_cpu_format_state;
     cc->set_pc = rx_cpu_set_pc;
 
 #ifndef CONFIG_USER_ONLY
diff --git a/target/rx/cpu.h b/target/rx/cpu.h
index 0b4b998c7b..97fc1b9ed6 100644
--- a/target/rx/cpu.h
+++ b/target/rx/cpu.h
@@ -126,7 +126,7 @@ typedef RXCPU ArchCPU;
 const char *rx_crname(uint8_t cr);
 void rx_cpu_do_interrupt(CPUState *cpu);
 bool rx_cpu_exec_interrupt(CPUState *cpu, int int_req);
-void rx_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
+void rx_cpu_format_state(CPUState *cpu, GString *buf, int flags);
 int rx_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int rx_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 hwaddr rx_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
diff --git a/target/rx/translate.c b/target/rx/translate.c
index a3cf720455..2d3bdabce4 100644
--- a/target/rx/translate.c
+++ b/target/rx/translate.c
@@ -125,7 +125,7 @@ static int bdsp_s(DisasContext *ctx, int d)
 /* Include the auto-generated decoder. */
 #include "decode-insns.c.inc"
 
-void rx_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+void rx_cpu_format_state(CPUState *cs, GString *buf, int flags)
 {
     RXCPU *cpu = RX_CPU(cs);
     CPURXState *env = &cpu->env;
@@ -133,12 +133,14 @@ void rx_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     uint32_t psw;
 
     psw = rx_cpu_pack_psw(env);
-    qemu_fprintf(f, "pc=0x%08x psw=0x%08x\n",
-                 env->pc, psw);
+    g_string_append_printf(buf, "pc=0x%08x psw=0x%08x\n",
+                           env->pc, psw);
     for (i = 0; i < 16; i += 4) {
-        qemu_fprintf(f, "r%d=0x%08x r%d=0x%08x r%d=0x%08x r%d=0x%08x\n",
-                     i, env->regs[i], i + 1, env->regs[i + 1],
-                     i + 2, env->regs[i + 2], i + 3, env->regs[i + 3]);
+        g_string_append_printf(buf,
+                               "r%d=0x%08x r%d=0x%08x r%d=0x%08x r%d=0x%08x\n",
+                               i, env->regs[i], i + 1, env->regs[i + 1],
+                               i + 2, env->regs[i + 2], i + 3,
+                               env->regs[i + 3]);
     }
 }
 
-- 
2.31.1

