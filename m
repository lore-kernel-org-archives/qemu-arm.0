Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp419990lfb;
        Thu, 2 Sep 2021 09:17:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8gRtU/2Y22biHMFKLvFqgm4Xkhf69dsBwoJ4BwBthLkqhAJEY/Ksmw9Zny5rQ/oUsz0/K
X-Received: by 2002:a17:906:1bb1:: with SMTP id r17mr4590074ejg.533.1630599452006;
        Thu, 02 Sep 2021 09:17:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630599452; cv=none;
        d=google.com; s=arc-20160816;
        b=lKKgRP2/VQRaFXwGPseBg0tvSjkCZjwzcaZ6jbUiaST5e6bRYJfEdahjopEAb7zG10
         kykNMqou3nAx30CLQamdVixSuMegrt+1YhLYp2ctSCM7tXPqFubINs13RZoVVjOBi2or
         od5bwJ5lSbLd/xlVgzQzHSMhHSr5rkasANyAbnpflz+wW1Ofgp05x6h7TIGB7YrQmNe1
         0ycKlLAPw3kiGvcSbMXQgxUtDZmyaDAjQWZQRNtekc1mpdBCQWVMDa7MCOSKAgv+hVQT
         Cz99BBcn1uvlbEbtdGEHU7rhzWsjLrBpYruqgDRG7hwbOdegose68MYFgS81JaoYFHws
         22eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from:sender
         :dkim-signature;
        bh=DdBo63POokH5fIMDIDGd3vZfaCJQwybOZKNS3BGh4nM=;
        b=ABYhkc2dPHaVow6VN4EHSwk36CUa4G+BXyRcXqCTL6OA6n9wxtJ19ZjHWGme9zrhu/
         UqI8UHK1zZtcYn7P6NR6UkMIxGJeO+Z2s0i4VbDxFhTAqaHs0UgocsezHU+pAksNvS8B
         dbyGKrTCwQzBg+/AfuSZi/TGxBV5bEC+ic3UG004Qkeh3Rh3cJd6JhTm25HM5y/O+3nD
         NbPUmHrVbumWXGRhZL8R/5wzL0cnCZLKcaCI9LEHx3uImSI/jSaM9+uw4S9wN8s4tPiw
         7WvX+29UWM9EDvo08mnz7GsLn5Nrmikro+ZpAGkxC0NWQ+zn+3mMD4SlRpN1B8gwI2SP
         aAMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=SdUILgJd;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id 8si2243468ejl.416.2021.09.02.09.17.31;
        Thu, 02 Sep 2021 09:17:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=SdUILgJd;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346276AbhIBQS3 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 2 Sep 2021 12:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346108AbhIBQS1 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 2 Sep 2021 12:18:27 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1A6C061575
        for <kvm@vger.kernel.org>; Thu,  2 Sep 2021 09:17:29 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so1746315wml.3
        for <kvm@vger.kernel.org>; Thu, 02 Sep 2021 09:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DdBo63POokH5fIMDIDGd3vZfaCJQwybOZKNS3BGh4nM=;
        b=SdUILgJd3l3KkosL5d+GJCCbjxa1kuvIi2eQH+QhbRZsxGZZeyT8B45EfAvb4vDqID
         Hvz12f+uLhG2sxeYjZh1eHobRoGFGmx8Vwc0IlXnnkf2IX5bx+BVhSr1cY3Ej8rlB7KC
         YO8ak4ncoqL6BecyY/e6YiTBs4ooYjlzwmmJGuU0TYXlpRik+gmohfcoQGfINeBVNh7H
         gfydQO5CesTCgYv9jzBSAmfhKaEn9YTmVKuXA9R7D2QLLI+i2p5DKESCrSigkULnbdYP
         q+rTwC0UOLH6fDszBS6ixFPljdENz9/dOQt5v2rlttm82OpvBLF+yYDt5s7Pj/jtLcYS
         Xgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=DdBo63POokH5fIMDIDGd3vZfaCJQwybOZKNS3BGh4nM=;
        b=py3ndFcdVP14i1ivUNctM4rNXGdmYlRSDJvZsJCSFBXMNSUvHLrVXr7EFAlPQradlr
         uWQEZOlfd1dKRBIQdNoVtEcxwPmQG2J9gLPZhaQQYRxEUGZCUWCRsopFx4EH/N7WfaVn
         gg5t4bb3LwmL0UfhEdRgjit2IdhfLPcSNrKU7xj2DmvbU+AemelGYf5n3UJ/DGH6rX2E
         DEuq41zZbJ63aZrMntWKNFMqoBksLd+ZmV3tsFKktsQzomOXTFnZC69liXM/d06dY3mb
         KcJNJQfKbqXJDUSRkGc0WdFfI4ToIaNCMfzcOP3dgN/c0NuXSmRacgImx1XkLSEIbgvb
         zxtg==
X-Gm-Message-State: AOAM532cB1ZfDiw0TQ6mio5pFQ55kLZ166aheLHexG7exkQnIupC+Yu7
        4MqugmUJltxM2rmK/dO16O4=
X-Received: by 2002:a1c:a50c:: with SMTP id o12mr4082621wme.4.1630599447661;
        Thu, 02 Sep 2021 09:17:27 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
        by smtp.gmail.com with ESMTPSA id f18sm2080257wmc.6.2021.09.02.09.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 09:17:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= 
        <philippe.mathieu.daude@gmail.com>
From:   =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To:     qemu-devel@nongnu.org
Cc:     Bin Meng <bin.meng@windriver.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Greg Kurz <groug@kaod.org>, haxm-team@intel.com,
        Kamil Rytarowski <kamil@netbsd.org>, qemu-ppc@nongnu.org,
        Anthony Perard <anthony.perard@citrix.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Michael Rolnik <mrolnik@gmail.com>, qemu-riscv@nongnu.org,
        Paolo Bonzini <pbonzini@redhat.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Thomas Huth <thuth@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        Chris Wulff <crwulff@gmail.com>,
        Laurent Vivier <lvivier@redhat.com>,
        Cameron Esfahani <dirty@apple.com>,
        Sunil Muthuswamy <sunilmut@microsoft.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Taylor Simpson <tsimpson@quicinc.com>, qemu-s390x@nongnu.org,
        Richard Henderson <richard.henderson@linaro.org>,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Paul Durrant <paul@xen.org>,
        Peter Maydell <peter.maydell@linaro.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Alistair Francis <alistair.francis@wdc.com>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        Roman Bolshakov <r.bolshakov@yadro.com>,
        Laurent Vivier <laurent@vivier.eu>,
        Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
        Wenchao Wang <wenchao.wang@intel.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        xen-devel@lists.xenproject.org, Marek Vasut <marex@denx.de>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Colin Xu <colin.xu@intel.com>,
        Claudio Fontana <cfontana@suse.de>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Stafford Horne <shorne@gmail.com>,
        Reinoud Zandijk <reinoud@netbsd.org>, kvm@vger.kernel.org
Subject: [PATCH v3 16/30] target/microblaze: Restrict has_work() handler to sysemu and TCG
Date:   Thu,  2 Sep 2021 18:15:29 +0200
Message-Id: <20210902161543.417092-17-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: pg99c0kZ2VUK

Restrict has_work() to TCG sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/microblaze/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 15db277925f..74fbb5d201a 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -92,12 +92,15 @@ static void mb_cpu_synchronize_from_tb(CPUState *cs,
     cpu->env.iflags = tb->flags & IFLAGS_TB_MASK;
 }
 
+#ifndef CONFIG_USER_ONLY
+
+#ifdef CONFIG_TCG
 static bool mb_cpu_has_work(CPUState *cs)
 {
     return cs->interrupt_request & (CPU_INTERRUPT_HARD | CPU_INTERRUPT_NMI);
 }
+#endif /* CONFIG_TCG */
 
-#ifndef CONFIG_USER_ONLY
 static void mb_cpu_ns_axi_dp(void *opaque, int irq, int level)
 {
     MicroBlazeCPU *cpu = opaque;
@@ -142,7 +145,7 @@ static void microblaze_cpu_set_irq(void *opaque, int irq, int level)
         cpu_reset_interrupt(cs, type);
     }
 }
-#endif
+#endif /* !CONFIG_USER_ONLY */
 
 static void mb_cpu_reset(DeviceState *dev)
 {
@@ -368,6 +371,7 @@ static const struct TCGCPUOps mb_tcg_ops = {
     .tlb_fill = mb_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .has_work = mb_cpu_has_work,
     .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
@@ -386,8 +390,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     device_class_set_parent_reset(dc, mb_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = mb_cpu_class_by_name;
-    cc->has_work = mb_cpu_has_work;
-
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
     cc->gdb_read_register = mb_cpu_gdb_read_register;
-- 
2.31.1
