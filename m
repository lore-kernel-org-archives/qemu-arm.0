Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1437079lfg;
        Fri, 26 Feb 2021 08:46:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxaoajmDn8iDK/6dBCEgqK4SFfcOs5x6v9WOLGiM1gm1nwMR+VXTCbR8V/FMrHBEtQsZiRw
X-Received: by 2002:a05:6e02:1544:: with SMTP id j4mr3148196ilu.29.1614357972279;
        Fri, 26 Feb 2021 08:46:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614357972; cv=none;
        d=google.com; s=arc-20160816;
        b=sDQXVOSHT3xjVi8oVx4o0/erkLCqebuIaAwpQTEG4g2LDbhR6B6EtfqMyKt0fRmuOO
         rX4j7RYDCHlj51veTxCKOeGh2XsJbEi+zdyUNOUoiRAX4vJU/s80wylaIu9HHDV5bKdU
         eqf9GGPoIXPKvk7gzdj4xBu2WvLbaZgAHKJ0BjaKg5rfkW/8qVH/mcFVyRKW611pVhLi
         X+G8JlFYLbCwx/1SAMUyw1MogD93Uj8iy7eazq7Em/ZPMnLe8RCarvGsHyMketiMCc3N
         qwq1kd794lc5d0lHuH4x1tdGNPO9xMIuhgKEm1e3gErfMGR2KFU4SHf+PbPEqysALzrm
         gxCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=R56Oi6nr8e9B0WiiV+if7tvwfnjn9mxxVgPa8IGhuYc=;
        b=TXGKdf91J5X2L73gzdvCQweak58mYBwnv5Ig4b9buUtFHOYBQ5ttlQ/j6BMBjRh3S4
         /okc5Gy6sRsDp4fDmsyo8cdrkpZjHcmXo3MXDoqsBWyp8Y9FkuLQaxK50x3K8eCO+xqq
         5dFNEViCt6RbJ1KH0rKLtM0wb1TVGBM2k13q3Byj0mKiZ+F5qN5lsmL5dqrXoA/L5B/I
         3PLPGtApJPLUjJJSqpa0AK11Tq+nMsRLbVNbauJle+f3eHuSJxfAAqlFThohweH6JlPE
         N6IrrWwsKh6iSyOxsNa3Hys+0gfjqwEbc02+FcwE1rhVvfWpETSFfk8dCfkkThN1RpWH
         vn0Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GIK9QnVG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h30si8244024ila.51.2021.02.26.08.46.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 08:46:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GIK9QnVG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFgFn-0006Zs-G5
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 11:46:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3Z-0004tM-3B; Fri, 26 Feb 2021 11:33:33 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:40923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg3W-0007kM-OX; Fri, 26 Feb 2021 11:33:32 -0500
Received: by mail-wr1-x429.google.com with SMTP id d11so9156767wrj.7;
 Fri, 26 Feb 2021 08:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R56Oi6nr8e9B0WiiV+if7tvwfnjn9mxxVgPa8IGhuYc=;
 b=GIK9QnVGxJj+2JyxxpSs2kwEIQSaQgByN23qMxB9CnyIZlfO11v5Cy1mdDF7/FZg9S
 hT+clxlxxrXwtpxbNMie7alBa+EdYWAPFEAIaFZlxCQ4PMR4QUAAbyeidWQs4SugWkBB
 NkiTYrLn8oYYy6TZzgU6+066q+Z5gvVDK2YqIxJPrMgcsA2OjQTLDskYj5SgvzExQkfi
 MWS5BPvufyr6ibMRkbheWeD1oYk1KUxGr2CNrhDeezx0guNLLylObuwgI+JZL8gary51
 h5FgfO14/4kLCyrquBEp/OMkE2yq+6lPMzxvemYCBDVaTIokK+szjW0RmD93Pv6362SI
 NmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R56Oi6nr8e9B0WiiV+if7tvwfnjn9mxxVgPa8IGhuYc=;
 b=nZnpXKX2e+eaOhhnKjLxLwFsXsPnDeUJ3cBvNRsMfthh0HMQynACX3+zdFlYyLLtba
 cJ/KjXPtXViKq2s9TvbRrhTmgYfiQzZzIBxrpH/r7U4+pYvqeZ96LC3hpSGnAEoa3dAF
 stsAC++dj3Ohux50eyv+o53fxCqKNAbE9T5A5diRJXkDzuHplFEmGObYrZHgxmUVZNom
 +WLP2G9UlgjMJHTeQ6JlbZpIKMoCn3pVh463EKYlXnLB59l2LzCtSvrwlJ46Q/cfeVtF
 zGM2Xdj7JUR0nCPUeI3l1UFkvAgafhlb6ql9T45ldyOQKByi9XzltL1IRd0G0jhgPTOU
 /elg==
X-Gm-Message-State: AOAM530BdVL/C/gMC+U3aUUpOT0W0VV/HrYeMExt7FxY/Ey5z75goVJN
 ceICxt/2xCOgDKLbhkw1NMUhDan4IPY=
X-Received: by 2002:a5d:570c:: with SMTP id a12mr4117870wrv.209.1614357205310; 
 Fri, 26 Feb 2021 08:33:25 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m6sm14242583wrv.73.2021.02.26.08.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:33:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/16] cpu: Move CPUClass::virtio_is_big_endian to
 CPUSystemOperations
Date: Fri, 26 Feb 2021 17:32:20 +0100
Message-Id: <20210226163227.4097950-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
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
X-TUID: uEo8GHCOpgm8

VirtIO devices are only meaningful with system emulation.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h           | 13 ++++++++-----
 hw/core/cpu.c                   |  4 ++--
 target/arm/cpu.c                |  2 +-
 target/ppc/translate_init.c.inc |  2 +-
 4 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bd1cb3b0d37..fe85a1b81e6 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -84,6 +84,14 @@ struct AccelCPUClass;
  * struct CPUSystemOperations: System operations specific to a CPU class
  */
 typedef struct CPUSystemOperations {
+    /**
+     * @virtio_is_big_endian: Callback to return %true if a CPU which supports
+     *       runtime configurable endianness is currently big-endian.
+     * Non-configurable CPUs can use the default implementation of this method.
+     * This method should not be used by any callers other than the pre-1.0
+     * virtio devices.
+     */
+    bool (*virtio_is_big_endian)(CPUState *cpu);
     /**
      * @vmsd: State description for migration.
      */
@@ -97,10 +105,6 @@ typedef struct CPUSystemOperations {
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
  * @has_work: Callback for checking if there is work to do.
- * @virtio_is_big_endian: Callback to return %true if a CPU which supports
- * runtime configurable endianness is currently big-endian. Non-configurable
- * CPUs can use the default implementation of this method. This method should
- * not be used by any callers other than the pre-1.0 virtio devices.
  * @memory_rw_debug: Callback for GDB memory access.
  * @dump_state: Callback for dumping state.
  * @dump_statistics: Callback for dumping statistics.
@@ -159,7 +163,6 @@ struct CPUClass {
 
     int reset_dump_flags;
     bool (*has_work)(CPUState *cpu);
-    bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
     void (*dump_state)(CPUState *cpu, FILE *, int flags);
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 5abf8bed2e4..86b65624a9e 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -204,8 +204,8 @@ bool cpu_virtio_is_big_endian(CPUState *cpu)
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (cc->virtio_is_big_endian) {
-        return cc->virtio_is_big_endian(cpu);
+    if (cc->system_ops.virtio_is_big_endian) {
+        return cc->system_ops.virtio_is_big_endian(cpu);
     }
     return target_words_bigendian();
 }
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 11505e1db10..3cbb17a5879 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2300,7 +2300,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug;
     cc->asidx_from_attrs = arm_asidx_from_attrs;
     cc->system_ops.vmsd = &vmstate_arm_cpu;
-    cc->virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
+    cc->system_ops.virtio_is_big_endian = arm_cpu_virtio_is_big_endian;
     cc->write_elf64_note = arm_cpu_write_elf64_note;
     cc->write_elf32_note = arm_cpu_write_elf32_note;
 #endif
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 65c45e7870a..2e5c272190b 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10909,7 +10909,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_core_xml_file = "power-core.xml";
 #endif
 #ifndef CONFIG_USER_ONLY
-    cc->virtio_is_big_endian = ppc_cpu_is_big_endian;
+    cc->system_ops.virtio_is_big_endian = ppc_cpu_is_big_endian;
 #endif
     cc->disas_set_info = ppc_disas_set_info;
 
-- 
2.26.2

