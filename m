Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1226511lfb;
        Fri, 13 Nov 2020 02:17:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzH0Va9C9HwDq9r8XDmSRca3hl4sZePIywpkP2cNiz9CQI9uocJ15/oOIpmUbNMWAcnHsAW
X-Received: by 2002:a25:df8e:: with SMTP id w136mr1694686ybg.230.1605262662390;
        Fri, 13 Nov 2020 02:17:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605262662; cv=none;
        d=google.com; s=arc-20160816;
        b=KxPo+e5Cw9QyHgFbFztmwJT+iaiqS+m8A8kRMAa4P2ETHKdiED+weFqVg0UqZf6ORs
         Pkk8CFDEFwRzNOLSE/6WmcefItgUlaW6C+tzgGWxBSz32YshUTQxhCtb11YbPjDh2GlP
         NosUJbHVS28Q6FHwiHCjkzs3UZOda8xiDxjcKnZCf78iftDsDXtC93m1DGGIvnGHJMZj
         546OQzyoE9A7FcVY0u6pXbW6CczgeZe62tEMVW64NV/AMnRZOocuiEeicNfaEasr+rdY
         /9uYmG+5eDzu6yY+3uVbSH8IkIFDOEGGgL1MFP5hff5IZw8kYc/kAyzLQU1LKZGqrchq
         ZK8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=DrZZG5jmSiQnnHIn1NqKMicV5UuGzvfg9THg9XdXTqY=;
        b=oSbwvNUWTLvnK4OrndxDT2UrD0R/rKWfn+XB0ErsnwE67KvuJDJ/QhaJiJcH5aVP+I
         +OipDsGFN0afMDKZS3muK5GGM0CPIu6yKrSeCN5pF6x/DmfDN4eYc4Ti2gvaUNNmd7Rh
         Hsu3AmtqyBD9j+F3v1mKHC2yp8xr5IM4Nk3Mi8W/GvaOEGxExRy8Ma+bs1JVop1Zuaj1
         XsM7g/Tmup7ubSNNfPVdxbqlFhXxkB52lODbbNxf5c7aUDH2t0rtab0m9T7wpicJKFPU
         jnjd14vw0kZYB/m3y95KkHQa0Q8j0OBasmmOR4cd2xgMW+bJls9bo0I+6/dEY/XcZg9j
         FJjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a40G1qlm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si6893798ybg.96.2020.11.13.02.17.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 02:17:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a40G1qlm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdW9F-00089r-N6
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 05:17:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8p-0007op-P5
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 05:17:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40370)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8n-0003q5-5g
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 05:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605262632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DrZZG5jmSiQnnHIn1NqKMicV5UuGzvfg9THg9XdXTqY=;
 b=a40G1qlmZru6ySG+YOvOc6chY5tdUhoDrncbhYqnsw0Is6RXafQLzAIH70qFY4EmBQ73R0
 21faB4PQzAGIcbf0ePuqFzeiFuI1u2U/9aYnERFfqjn+P6y5PfLNtsR+Lpx40ah2qbuw00
 66vh7G8+cuk77sI7hGxnc8znnud0dkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-nKeTh2fAPpCV2cD3TeN33w-1; Fri, 13 Nov 2020 05:17:08 -0500
X-MC-Unique: nKeTh2fAPpCV2cD3TeN33w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4817380476D;
 Fri, 13 Nov 2020 10:17:07 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7CBB6266E;
 Fri, 13 Nov 2020 10:17:06 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 004/122] hppa: do not use ram_size global
Date: Fri, 13 Nov 2020 05:15:06 -0500
Message-Id: <20201113101704.1438368-4-pbonzini@redhat.com>
In-Reply-To: <20201113101704.1438368-1-pbonzini@redhat.com>
References: <20201113101704.1438368-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 16:09:27
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AxiMvs4zyw6A

Use the machine properties instead.

Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/hppa/machine.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index 5e745d5ea9..7e41cb2462 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -97,7 +97,7 @@ static FWCfgState *create_fw_cfg(MachineState *ms)
     fw_cfg = fw_cfg_init_mem(FW_CFG_IO_BASE, FW_CFG_IO_BASE + 4);
     fw_cfg_add_i16(fw_cfg, FW_CFG_NB_CPUS, ms->smp.cpus);
     fw_cfg_add_i16(fw_cfg, FW_CFG_MAX_CPUS, HPPA_MAX_CPUS);
-    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, ram_size);
+    fw_cfg_add_i64(fw_cfg, FW_CFG_RAM_SIZE, ms->ram_size);
 
     val = cpu_to_le64(MIN_SEABIOS_HPPA_VERSION);
     fw_cfg_add_file(fw_cfg, "/etc/firmware-min-version",
@@ -288,7 +288,7 @@ static void machine_hppa_init(MachineState *machine)
                (1) Due to sign-extension problems and PDC,
                put the initrd no higher than 1G.
                (2) Reserve 64k for stack.  */
-            initrd_base = MIN(ram_size, 1 * GiB);
+            initrd_base = MIN(machine->ram_size, 1 * GiB);
             initrd_base = initrd_base - 64 * KiB;
             initrd_base = (initrd_base - initrd_size) & TARGET_PAGE_MASK;
 
@@ -316,7 +316,7 @@ static void machine_hppa_init(MachineState *machine)
      * various parameters in registers. After firmware initialization,
      * firmware will start the Linux kernel with ramdisk and cmdline.
      */
-    cpu[0]->env.gr[26] = ram_size;
+    cpu[0]->env.gr[26] = machine->ram_size;
     cpu[0]->env.gr[25] = kernel_entry;
 
     /* tell firmware how many SMP CPUs to present in inventory table */
@@ -342,11 +342,11 @@ static void hppa_machine_reset(MachineState *ms)
     }
 
     /* already initialized by machine_hppa_init()? */
-    if (cpu[0]->env.gr[26] == ram_size) {
+    if (cpu[0]->env.gr[26] == ms->ram_size) {
         return;
     }
 
-    cpu[0]->env.gr[26] = ram_size;
+    cpu[0]->env.gr[26] = ms->ram_size;
     cpu[0]->env.gr[25] = 0; /* no firmware boot menu */
     cpu[0]->env.gr[24] = 'c';
     /* gr22/gr23 unused, no initrd while reboot. */
-- 
2.26.2

