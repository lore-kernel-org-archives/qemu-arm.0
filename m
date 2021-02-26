Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1430680lfg;
        Fri, 26 Feb 2021 08:37:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcgDGlxIGvLeNb5YcoL3qSjgRV9+HMkPu+cT6//5lXT1PKwhi6ZMOpmw3A9LtMie8bf9C6
X-Received: by 2002:a67:ed4a:: with SMTP id m10mr2248318vsp.14.1614357462863;
        Fri, 26 Feb 2021 08:37:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614357462; cv=none;
        d=google.com; s=arc-20160816;
        b=tw2/RPe1PmW9X9LwfHRxb9/1e8IoZUvnFtJO5eT3oYgNyHD+9SbRapqzQStQFe0/vl
         2dHlcTe1KsPy+dOnvmuGc+SHKm52uIx505X8eVccxZtfEHzCB2srwp2OAdDLKaDIiWuh
         FddCVKs8bT+1ZWe/zaJTKcalcv53yGhdWES2PDqSCgIIURDm8GfRS9kWN/7UUC7cl/EL
         eCY2P6WSlBmS1wblU2ztUi39GEL5PkvNySJ2SiPmlqLhwrd2iTh9r2LahIH0CKnF9StK
         9jPtp+FTXSng3DQqmo7CKlMURi5o03OQwjMVCbbpxsTDv7ahjtAk5Fiam2eviBkGEzVj
         +xMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=UQM81mur+9UHjxbQN0Zv4wGjBmPMsrfz+L5iL9ZySpM=;
        b=fX/Ne+2PA1p00cUUQzj4tIwDBZBzi35DC3x6JHs8FGcaEMLJw08oEniRbwD2UwMoTN
         zxSt6+6ALrwak3wgMeYcHofahWWfn+oAA5hYnLD95IdrEVWDw2ZmLvr2wxoZMSyUUGy/
         5pJ6qTC8iMt82STGnw+UQWVjc6W62FKv/8aU2+M/9wuXv99D133/EiwW+qVHDTwMkBdP
         QRlx6d57LuJ1ctNPqNOQRvgBMtCn7MDv4rP0lA+6YZ3fThP0eqlUvc42rWkq1YJszfAG
         xPp+gQUDvlaSXdTIVioHwWTO3oDn0GWwi3sv2Z/hTSaaL8l/QafNoijzX1efBdyPuEpb
         TN5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="hS9C85/o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s5si1642403uap.217.2021.02.26.08.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 08:37:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="hS9C85/o";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFg7a-0000yL-34
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 11:37:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg2r-0003xo-32; Fri, 26 Feb 2021 11:32:49 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFg2o-0007Zm-Q3; Fri, 26 Feb 2021 11:32:48 -0500
Received: by mail-wr1-x42b.google.com with SMTP id h98so9140259wrh.11;
 Fri, 26 Feb 2021 08:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UQM81mur+9UHjxbQN0Zv4wGjBmPMsrfz+L5iL9ZySpM=;
 b=hS9C85/oo+y2Yc3FC6Hq/wW/6MOhCok3wlDBQ4fIK52mjwH2SNfsJdL9E4jDk6uF1u
 myIEPX+MIlA7yhaqncVRUft7WD5a2sGTSy4m7qD9w+Ru1ghouBPLbXMUkgjLKP9A/JwC
 f2yyUJC0cJrgj18U/TsJnGx54V7jPmV8qThIGZrRPXwNgvJn5RNqtobZfdSV18lKrNUv
 xxlbIfgP8O4+byfH+OTqYKKyhCRQUa40K3PfApfYwWiCfxVkVJlkR4gv6Q7BqxNSpGS3
 bF0XQKAEs3JNuYdCPFU8mSNjtKCJd2Y3b9FtSnXhfVBQz9ANK1K8pWc8MUCUunQh2p7C
 BfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UQM81mur+9UHjxbQN0Zv4wGjBmPMsrfz+L5iL9ZySpM=;
 b=kfzyH0huvtDR/GKrRZpzK9ZMESTxA4FYYFEjKdr1ShYjqDdxK4LrZON3cT7SMQsm4S
 e6pMMIbg65FaqiIbkj5ioTiTh7bGBjACSVnE+TskthLKvxGmdcfUNo9VRSxKj/AiiYOj
 2LhRvlFmp/w9YAxnWlqOy0maQuMJQQ0DeM1nz+uYwv/0Y3mgLWj1HrqdGdPJnJe3Mk8x
 983mIJ5VECe2AS0BqUdPRchq66NVCxRG4uLSGkofnPuwjoXx8bNcfr6UhNoM1w/7/JMn
 2NiW5gFuC1uTQcHf/hr9nOIp5Ap8TlVLyBbsCILMVXrDTjc2Hb8aeacQX5K9QWbhkmzE
 m3Zg==
X-Gm-Message-State: AOAM530G3N9gwgLVQCvxk0mHmDGDQuscdjJQb3VcS2aWJPNBm9N7rVFe
 xf0yEln1GDRgTvtA/IzSj4ODqnpbOHI=
X-Received: by 2002:adf:e60e:: with SMTP id p14mr4034695wrm.221.1614357163853; 
 Fri, 26 Feb 2021 08:32:43 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id b15sm14268366wmd.41.2021.02.26.08.32.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 08:32:43 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/16] cpu: Un-inline cpu_get_phys_page_debug and
 cpu_asidx_from_attrs
Date: Fri, 26 Feb 2021 17:32:13 +0100
Message-Id: <20210226163227.4097950-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210226163227.4097950-1-f4bug@amsat.org>
References: <20210226163227.4097950-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Michael S. Tsirkin" <mst@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nitP+N4jvl4w

To be able to later extract the cpu_get_phys_page_debug() and
cpu_asidx_from_attrs() handlers from CPUClass, un-inline them
from "hw/core/cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/core/cpu.h | 33 ++++-----------------------------
 hw/core/cpu.c         | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 29 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index c005d3dc2d8..2d43f78819f 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -578,18 +578,8 @@ void cpu_dump_statistics(CPUState *cpu, int flags);
  *
  * Returns: Corresponding physical page address or -1 if no page found.
  */
-static inline hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
-                                                   MemTxAttrs *attrs)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    if (cc->get_phys_page_attrs_debug) {
-        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
-    }
-    /* Fallback for CPUs which don't implement the _attrs_ hook */
-    *attrs = MEMTXATTRS_UNSPECIFIED;
-    return cc->get_phys_page_debug(cpu, addr);
-}
+hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                     MemTxAttrs *attrs);
 
 /**
  * cpu_get_phys_page_debug:
@@ -601,12 +591,7 @@ static inline hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
  *
  * Returns: Corresponding physical page address or -1 if no page found.
  */
-static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
-{
-    MemTxAttrs attrs = {};
-
-    return cpu_get_phys_page_attrs_debug(cpu, addr, &attrs);
-}
+hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 
 /** cpu_asidx_from_attrs:
  * @cpu: CPU
@@ -615,17 +600,7 @@ static inline hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
  * Returns the address space index specifying the CPU AddressSpace
  * to use for a memory access with the given transaction attributes.
  */
-static inline int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    int ret = 0;
-
-    if (cc->asidx_from_attrs) {
-        ret = cc->asidx_from_attrs(cpu, attrs);
-        assert(ret < cpu->num_ases && ret >= 0);
-    }
-    return ret;
-}
+int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
 
 #endif /* CONFIG_USER_ONLY */
 
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 00330ba07de..4dce35f832f 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -94,6 +94,38 @@ static void cpu_common_get_memory_mapping(CPUState *cpu,
     error_setg(errp, "Obtaining memory mappings is unsupported on this CPU.");
 }
 
+hwaddr cpu_get_phys_page_attrs_debug(CPUState *cpu, vaddr addr,
+                                                   MemTxAttrs *attrs)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    if (cc->get_phys_page_attrs_debug) {
+        return cc->get_phys_page_attrs_debug(cpu, addr, attrs);
+    }
+    /* Fallback for CPUs which don't implement the _attrs_ hook */
+    *attrs = MEMTXATTRS_UNSPECIFIED;
+    return cc->get_phys_page_debug(cpu, addr);
+}
+
+hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr)
+{
+    MemTxAttrs attrs = {};
+
+    return cpu_get_phys_page_attrs_debug(cpu, addr, &attrs);
+}
+
+int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    int ret = 0;
+
+    if (cc->asidx_from_attrs) {
+        ret = cc->asidx_from_attrs(cpu, attrs);
+        assert(ret < cpu->num_ases && ret >= 0);
+    }
+    return ret;
+}
+
 /* Resetting the IRQ comes from across the code base so we take the
  * BQL here if we need to.  cpu_interrupt assumes it is held.*/
 void cpu_reset_interrupt(CPUState *cpu, int mask)
-- 
2.26.2

