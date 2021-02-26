Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1444219lfg;
        Fri, 26 Feb 2021 08:56:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzrIebkjEeln/Kdrp2kE2SR54PfM44XMQ5nEz3DynWAuwvcbD46ov6t9zIDE5pwBMaGLcTg
X-Received: by 2002:a05:6e02:b4d:: with SMTP id f13mr3080609ilu.138.1614358586912;
        Fri, 26 Feb 2021 08:56:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614358586; cv=none;
        d=google.com; s=arc-20160816;
        b=v2lgZ3Fk9nUGMEfdL0EiIIPRH+1M+RWYMfhByQwnVNi+QCGgszZufEBiWaS9LSS57w
         EYRSTKsMp+jKpF9+GYEQicbqEznmpigLfck3Utde6sYDtjsrNJAh9amWKZFoP+r0dMPQ
         fOLQnBkFAny/UbB0P2v+Q5mKtFA14zpI1b7OHx9rv++MMEQ9VL+gESBv6/6ujDpq83xp
         kS2EkRiYXvP86/4hDFWAXJ04oO0k2OCv6xFz+runFYVZy7jDTyzfm8QAD1WbKuZytJZm
         BTRf21ZmyyjXMN4NV0P6I8u1EagH24uau28BGxvwplKLs6z0SzWJzG5WmI0XsS2aYsZe
         Y/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=yTanq6JfzM3gaBH0H5tWyaeDUZu7wVaLTH7Xl4MKE/E=;
        b=q1BghvnCJWAqpfv0+qQB0gXKFr5pqQRCauAAgR3AE2rFEAI0TpzHf8/p+I7a7hrx+A
         EqVC/4qva8exkosNZn8X6vEh89i17h4yue2rWpMOrx48CSRiO+UF9aI8AruIT2PhKgay
         Cpre88ZDxSVNjNe8UQPyZ+cV54t2ipq+eywKehnptX8WHXKYnfnpWgoPHJV8y2vjpURR
         TZuGfN5K8/wBO5wqaeKtRxwQGauzv5xHD5ru1ZZwLIjA6N3Vjq1KwglxuqQrirquXH2M
         v3ta054C95rJaIhFt6AUu0me4zlu7NsEPTOTSRZz6+Tcl2tK36KGSvm+79y2kgAytAEF
         tCKA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ITu5LX2Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d8si8404504ila.40.2021.02.26.08.56.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 08:56:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ITu5LX2Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:56546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFgPi-0008DV-2z
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 11:56:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg45-0005Dq-Gj; Fri, 26 Feb 2021 11:34:05 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:38490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg43-0007tb-SX; Fri, 26 Feb 2021 11:34:05 -0500
Received: by mail-wr1-x433.google.com with SMTP id b3so9163700wrj.5;
 Fri, 26 Feb 2021 08:34:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yTanq6JfzM3gaBH0H5tWyaeDUZu7wVaLTH7Xl4MKE/E=;
 b=ITu5LX2ZI2JgkpR4iVu6NfsUJpxJeZlNMyg46p/tmS8LfsT0HI9bbllQfQXKzN/+au
 RZGdcIN8W7aOgtLTLnEWb98wEp6p3YSWO+lOZ05WetzYcUN0mXSa6nHpbVofD4YkbYqg
 se+HthTebJlRMrhwqLwYGOp8EmPYADXUn/UjfiraVZh0cnrf3kmFzHDMRjbLYCxVfg8y
 wNqq7iitezppheyLnerS5ErdJbcFnwoni/JotWF8hXuuQWDF0jbSnCuGLMiTuw4rEsyy
 F6xFGtzYVbqMTwq+bvv6EGGPPMps2AsERWWFn/kCVt6q0AI4dQgaNucHk6p2mWCa7NC2
 IYbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yTanq6JfzM3gaBH0H5tWyaeDUZu7wVaLTH7Xl4MKE/E=;
 b=Ixz4j0OXbt91d4+zcSA/PeeuvrdajtFKVuuG3v7Yp2RpSQrRskLZ6Tv4FLk2O8/9P6
 caZXkLDya6cOL5lJMMn6xMw/WhF5i6Wvt5QCCDadiB11YS+CkTmuExwDPZGvOQy1N9lK
 iSuW0aq58+GDkJbG0vmWddp8FxpLFrUy6ACt8rmtkOSj+iedTi2BJnE2cqDGxzFRy+JW
 aRt4D46+xyGya48oKRSrUGP1K9c8mynu0LYdjytpHnWxsREoujeFeFj1ofmgUFA5rRK/
 3hSGLKNNpEUho+MeARPzfDAsBnG8RGptw96kr3D/LD7IzS2iVo1sQMMJ2PHFkhYS5SUF
 gWww==
X-Gm-Message-State: AOAM531vuMkhQ7+E+5d/ADAS5ZB7FgdY2yhGsYjbOxOm5hbrTymTsU4V
 iJonpaFvMbdFoLfbphMTj1jmrTycauA=
X-Received: by 2002:a5d:47a8:: with SMTP id 8mr3981793wrb.180.1614357240762;
 Fri, 26 Feb 2021 08:34:00 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q18sm14489461wrw.91.2021.02.26.08.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:34:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/16] cpu: Move CPUClass::get_memory_mapping to
 CPUSystemOperations
Date: Fri, 26 Feb 2021 17:32:25 +0100
Message-Id: <20210226163227.4097950-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ONOnbLYrd8EP

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 8 +++++---
 hw/core/cpu.c         | 4 ++--
 target/i386/cpu.c     | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5bc66653c19..caca5896592 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -84,6 +84,11 @@ struct AccelCPUClass;
  * struct CPUSystemOperations: System operations specific to a CPU class
  */
 typedef struct CPUSystemOperations {
+    /**
+     * @get_memory_mapping: Callback for obtaining the memory mappings.
+     */
+    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
+                               Error **errp);
     /**
      * @get_phys_page_debug: Callback for obtaining a physical address.
      */
@@ -157,7 +162,6 @@ typedef struct CPUSystemOperations {
  * @dump_statistics: Callback for dumping statistics.
  * @get_arch_id: Callback for getting architecture-dependent CPU ID.
  * @get_paging_enabled: Callback for inquiring whether paging is enabled.
- * @get_memory_mapping: Callback for obtaining the memory mappings.
  * @set_pc: Callback for setting the Program Counter register. This
  *       should have the semantics used by the target architecture when
  *       setting the PC from a source such as an ELF file entry point;
@@ -201,8 +205,6 @@ struct CPUClass {
     void (*dump_statistics)(CPUState *cpu, int flags);
     int64_t (*get_arch_id)(CPUState *cpu);
     bool (*get_paging_enabled)(const CPUState *cpu);
-    void (*get_memory_mapping)(CPUState *cpu, MemoryMappingList *list,
-                               Error **errp);
     void (*set_pc)(CPUState *cpu, vaddr value);
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index f0c558c002e..606fc753bf0 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -83,8 +83,8 @@ void cpu_get_memory_mapping(CPUState *cpu, MemoryMappingList *list,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->get_memory_mapping) {
-        cc->get_memory_mapping(cpu, list, errp);
+    if (cc->system_ops.get_memory_mapping) {
+        cc->system_ops.get_memory_mapping(cpu, list, errp);
         return;
     }
 
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index f6f5c333b7e..92691a22de5 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7419,7 +7419,7 @@ static void x86_cpu_common_class_init(ObjectClass *oc, void *data)
 
 #ifndef CONFIG_USER_ONLY
     cc->system_ops.asidx_from_attrs = x86_asidx_from_attrs;
-    cc->get_memory_mapping = x86_cpu_get_memory_mapping;
+    cc->system_ops.get_memory_mapping = x86_cpu_get_memory_mapping;
     cc->system_ops.get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug;
     cc->system_ops.get_crash_info = x86_cpu_get_crash_info;
     cc->system_ops.write_elf64_note = x86_cpu_write_elf64_note;
-- 
2.26.2

