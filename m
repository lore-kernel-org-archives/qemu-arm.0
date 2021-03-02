Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4349476lfg;
        Tue, 2 Mar 2021 02:30:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHIPDWXRryMY1dvvqv3jkAl/Dm/VGK0Xv5Hi9rEEgpxw0jPqMNxOIDzhFSW0xJoPKjaA4O
X-Received: by 2002:aca:5783:: with SMTP id l125mr2687675oib.79.1614681051332;
        Tue, 02 Mar 2021 02:30:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614681051; cv=none;
        d=google.com; s=arc-20160816;
        b=K5mMhPcMfoTOU6pDuuKY0Oqt7i8pJYbIy9iXraz5Sa4xAEJPV7hZMlQSY8nrFDmD95
         zIZ/QZT8NIeopZfVzgp9rI6Fy7kmFNLxn0jRKlFLIVUk7txyEdt7zXliHHsSWHS1QSoM
         0tRa4UYTKDILiZZAWFeg2POOeaERHMURUiAcCiXGu9YjwhHnAQq1WfJCNipq8jMct4AO
         F7sdVyrgNDqZFrT7xSyYQADmbrFEkUO1pMmonIPXrOFwORKUgLZXjTFYHAoSFP6+1xoU
         TPYSKfoVnbtnRzFLEzsOeiHrv2stKvqvyfr4GFBgAplA/w8hrv+gG4cWFzE4/Wi4TLY6
         XL7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pjMzSGB3VrIz5KxFOb+6NNQW9N2HU550cTaWwJDZ/8A=;
        b=guYeM22eIkI2lPXSqXvfpRFTjc+lOQWlVeJXKKr4VTRjkdRYPhHI8SjtEuxhg6qL1z
         HFEkRqYHLRDMekw/U2PbTHWi1Ie4SAQAiyAY/NdmRqoKyB2fq4PmatpXtPZyX8JLcjd/
         BS7mtfAUom8zu8Po7N0ucIpwj/sMITKqO6hI3KvWKXQOXSX82smhb1gYDAoa2UDBpcXc
         mq0XdANXMruH5IubsYHSMUiFEd/yWXrpvbZGqLCFfSDHE91R75DAsUcCWExA3lcXRKPF
         73f1QyvrRfKNRyD4RHqTn1mUGOMuukvdv0rxWePILYEDqfr+IPgsuyWyWt/GcnDhpX/u
         p5OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G5cW5AUR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j24si13060045otk.225.2021.03.02.02.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Mar 2021 02:30:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=G5cW5AUR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lH2Ik-0005gB-Hp
	for alex.bennee@linaro.org; Tue, 02 Mar 2021 05:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2GC-0002FR-VH; Tue, 02 Mar 2021 05:28:13 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:39566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH2GB-0008Tq-GZ; Tue, 02 Mar 2021 05:28:12 -0500
Received: by mail-ed1-x533.google.com with SMTP id h10so24442467edl.6;
 Tue, 02 Mar 2021 02:28:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pjMzSGB3VrIz5KxFOb+6NNQW9N2HU550cTaWwJDZ/8A=;
 b=G5cW5AURekQmkyrJ6xeJCQv3edRRJ8ZowZ2/mHrshd3o/HOnTy8r0r1Wkrd93i0mF+
 mtmII75SZLx6cturdLpzSNbUx8PdoKT9uFWuDmfad1KxrZQI/LWFwv2TPlpn9YPCweFW
 8IKjAQKz+PUtSpW56WCBYuIjNm76Gm43hEVc10r4j4Ah40F8Bf2xfMvqnX9meZ02ZnTN
 6q6cem4/2iK5QTzWNuKHcpzkSq5CFfAG24luNZ+kj+BeIrcLKzbi86cmK/hfLEvTHWhc
 PkdROXLdXdue86d7PetG3j2V0RlsS0/FmKH0fhgHn6b2bQGdyDw3eQcuA7KXp8y3DnDH
 6mFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pjMzSGB3VrIz5KxFOb+6NNQW9N2HU550cTaWwJDZ/8A=;
 b=m+fYmg0ua7LU0Kr82KXhBwsRM+k+J8GKnjtKYKJMlC2SZqxuJXWBdXOmo/FTH6qVfv
 7QsZ+X0z6bD3mWD4Wt9DOy2pg5fQPSDHcJxv6qVu5euraaVndxciKpzBE/kHYldyj2aS
 C1QZGJb6GBtGp/fFRsupb6+BihmbXsAiXI0gtLLgTTWbTp0gzmK+0QBKfxUH1V9utkdA
 givlJE7CO/NGFH5iYPhn0BMOOytyZR53XEfG8xfoJDLWnmVB5c4l52If9L+tfYzUAkFu
 detveRDVkuPAdOFeYZUd50ZBAxfvZ6OVtGgUtoWEY4Y3vWYCAhGx3NzZIRkEsucGgQLZ
 0P3g==
X-Gm-Message-State: AOAM531OHHM4TVQVTurirQPlsjWBnjvQ8Dg06gX+V/0liMDvRBkLgh9/
 jv5qsU0iRp3s6nrOgcxRCjYbvN6VaZ4=
X-Received: by 2002:aa7:c9c9:: with SMTP id i9mr19642808edt.160.1614680888521; 
 Tue, 02 Mar 2021 02:28:08 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id br13sm4397210ejb.87.2021.03.02.02.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:28:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] target/s390x: Move s390_cpu_has_work to excp_helper.c
Date: Tue,  2 Mar 2021 11:27:34 +0100
Message-Id: <20210302102737.1031287-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302102737.1031287-1-f4bug@amsat.org>
References: <20210302102737.1031287-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pqEaBOfilNuM

We will restrict the s390_cpu_has_work() function to TCG.
First declare it in "internal.h" and move it to excp_helper.c.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/s390x/internal.h    |  1 +
 target/s390x/cpu.c         | 17 -----------------
 target/s390x/excp_helper.c | 18 ++++++++++++++++++
 3 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/target/s390x/internal.h b/target/s390x/internal.h
index 11515bb6173..7184e38631c 100644
--- a/target/s390x/internal.h
+++ b/target/s390x/internal.h
@@ -263,6 +263,7 @@ ObjectClass *s390_cpu_class_by_name(const char *name);
 
 
 /* excp_helper.c */
+bool s390_cpu_has_work(CPUState *cs);
 void s390x_cpu_debug_excp_handler(CPUState *cs);
 void s390_cpu_do_interrupt(CPUState *cpu);
 bool s390_cpu_exec_interrupt(CPUState *cpu, int int_req);
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index d35eb39a1bb..91142db1097 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -56,23 +56,6 @@ static void s390_cpu_set_pc(CPUState *cs, vaddr value)
     cpu->env.psw.addr = value;
 }
 
-static bool s390_cpu_has_work(CPUState *cs)
-{
-    S390CPU *cpu = S390_CPU(cs);
-
-    /* STOPPED cpus can never wake up */
-    if (s390_cpu_get_state(cpu) != S390_CPU_STATE_LOAD &&
-        s390_cpu_get_state(cpu) != S390_CPU_STATE_OPERATING) {
-        return false;
-    }
-
-    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
-        return false;
-    }
-
-    return s390_cpu_has_int(cpu);
-}
-
 #if !defined(CONFIG_USER_ONLY)
 /* S390CPUClass::load_normal() */
 static void s390_cpu_load_normal(CPUState *s)
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index ce16af394b1..64923ffb83a 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -28,12 +28,30 @@
 #include "hw/s390x/ioinst.h"
 #include "exec/address-spaces.h"
 #include "tcg_s390x.h"
+#include "qapi/qapi-types-machine.h"
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/sysemu.h"
 #include "hw/s390x/s390_flic.h"
 #include "hw/boards.h"
 #endif
 
+bool s390_cpu_has_work(CPUState *cs)
+{
+    S390CPU *cpu = S390_CPU(cs);
+
+    /* STOPPED cpus can never wake up */
+    if (s390_cpu_get_state(cpu) != S390_CPU_STATE_LOAD &&
+        s390_cpu_get_state(cpu) != S390_CPU_STATE_OPERATING) {
+        return false;
+    }
+
+    if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
+        return false;
+    }
+
+    return s390_cpu_has_int(cpu);
+}
+
 void QEMU_NORETURN tcg_s390_program_interrupt(CPUS390XState *env,
                                               uint32_t code, uintptr_t ra)
 {
-- 
2.26.2

