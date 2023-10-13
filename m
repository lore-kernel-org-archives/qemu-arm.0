Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1331445ejc;
        Fri, 13 Oct 2023 00:52:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDwnC+XryBkbZ0dqxFJn6087NBBE5hYyPrd4G2SGW3p1nwJ88/e+7MNQTxraVR+/05e68R
X-Received: by 2002:a05:620a:4415:b0:775:9a30:f2d8 with SMTP id v21-20020a05620a441500b007759a30f2d8mr34747964qkp.24.1697183569771;
        Fri, 13 Oct 2023 00:52:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183569; cv=none;
        d=google.com; s=arc-20160816;
        b=LjXrfekKk7/ab/7A/uD94ZYKwpC6rgevACZ/ImkyFX6dkL+JpU/P14eaKDPRVpxNH4
         4ydyrYPv512MtN7jqdLFdMEYDTFQRYN2o2IqsIprMg2n7773w0bT6t3dXfP5xruhDXC6
         XXOgRMkxsxV5ZSLV69pJRkBC5P6TATq+q393V5kLMxVv/LUaRA4TzCMa1JwFVea4lla0
         0hI7Rq9zsdMrCDa1b5eDjm+IA1fw86dHUv7Wl29ZdC8OykICSSsMuCtx4qRij/LImyK7
         LrGxviAw2zHUKlKzszdSRGR9ljhMYdoBJhYmvfRwXSHgDNPcFwwDdCK6VFlwxwfOit1R
         2aDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V6QeJL4Wo8y/3eJ5tOXyyC3SVwifvmBvfOxaBUO5XBE=;
        fh=vLvpSlw1+lBMm+q/nzf+BaJvp9XgxQ3MGYzWL1Gpu4g=;
        b=WnE1guFO24dv2mCAgvHWFoyeqaGiCIZ7CfGiffNua2RmY0xgpdmwC+xMZ/4AvrtOrZ
         AJ8b5UqU5P3fidD07r9KRKk2in2GhnwCaSQg5l8sFV++e4/51yMRU9IhFfzcU1SphMYH
         UuYY1if0vf00CaxXCNqix477hNqugKAOsv0ZdhB9To+37rjaVEUHKg1GDwWCFP74casC
         VqHXME+1cs50zU6o5H37RnTh+u7KiXt9qzNANfnwluGfVlCK7Ud31SbBdj1IPOUqb5xU
         LjsEHQ22qXc4WTT5u2oMvZJbWZOU5XljosJmtXQFBDyFk+qU8XarCMDDC3qQo5bW/yAn
         Ymug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wizn7Jn1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lz4-20020a0562145c4400b00647290d544bsi823849qvb.296.2023.10.13.00.52.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:52:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wizn7Jn1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qrCxk-0000Pz-Ee; Fri, 13 Oct 2023 03:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwz-0006FT-Te
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:51:14 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCwk-0004uD-6k
 for qemu-devel@nongnu.org; Fri, 13 Oct 2023 03:51:12 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-406618d0992so18927145e9.0
 for <qemu-devel@nongnu.org>; Fri, 13 Oct 2023 00:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183456; x=1697788256; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V6QeJL4Wo8y/3eJ5tOXyyC3SVwifvmBvfOxaBUO5XBE=;
 b=wizn7Jn1SeEU1VTh/TVsFWehmDm3E1Eeh/jy9i9gnAAvMSHcTrl1m/Ge4Uol8RbJLm
 oSOzeFusbdQcTgBxKVh3bLLqtIoXjSI5R9dlDxir0zraXusk/yFHsXng5SYqb5cYuKjL
 9aanvnFwur7Rek1V3IppVpRSZ/kEtWPYPiqqNbce0PJ0sE1H1Jgsj3EHGFdwvAGHE2rl
 pFQ2wfPqv+V0qupQYht1decEER0RO6PqVmx16caurvivjJ343nlTmH8r5E0Bx0MwySnM
 9jJhmgdLA0BoSVdgQljjckGNbwWl3d75gHjrNr9QQJN1+zLByokf1GRkyDlMx2DpqN/O
 1q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183456; x=1697788256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V6QeJL4Wo8y/3eJ5tOXyyC3SVwifvmBvfOxaBUO5XBE=;
 b=Ar9V7F34r4VACdEsAF85WxjAuysyrFU8fDWIgff5hTxDl9EG32m8a8AAkRUchrkQFS
 3sf3Q18D1FuIiF4MPRuHxwFsPKvChq2cHlR1ZK2bJfcgs69frUlYW3zsXvzCO+mKH6E0
 1m3Qn0wBPN6Cc05fV49sYQI3JJlcVfuJc0q0ozO5pzmpAzgmuJp7XYuTJrHjeqJaHZ+R
 4m0lIeYLieFnwDWBgth9y/+DANdA6viJfHKHcXlXdELJlfTbl05WTgkedQ/yw+ELiwpL
 VcS44tixWW4UYqQKpmlqK3vQ4fO4RSME24xs+GxvFY0ecic8XaBz9q1zvjtxWSyj26nS
 IHow==
X-Gm-Message-State: AOJu0YzdqtA7LkKKtrGLFEvcoZB8TDl4ztveO8TeUkQmP5+/Lk5u33Y2
 SQf3wRQYt9L1BrfHH3RWj29++P/lGpaDikGvcI4=
X-Received: by 2002:a05:6000:49:b0:32d:5cc0:2f0c with SMTP id
 k9-20020a056000004900b0032d5cc02f0cmr8641029wrx.40.1697183456434; 
 Fri, 13 Oct 2023 00:50:56 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:50:55 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Stafford Horne <shorne@gmail.com>
Subject: [RFC PATCH 36/78] target/openrisc: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:40 +0300
Message-Id: <2961833b638056d4af03da7531f085ea618e45a6.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C/K9/A9Gt5or

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 target/openrisc/mmu.c       | 2 +-
 target/openrisc/translate.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/openrisc/mmu.c b/target/openrisc/mmu.c
index 603c26715e..7ed744e81b 100644
--- a/target/openrisc/mmu.c
+++ b/target/openrisc/mmu.c
@@ -141,38 +141,38 @@ bool openrisc_cpu_tlb_fill(CPUState *cs, vaddr addr, int size,
 hwaddr openrisc_cpu_get_phys_page_debug(CPUState *cs, vaddr addr)
 {
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
     int prot, excp, sr = cpu->env.sr;
     hwaddr phys_addr;
 
     switch (sr & (SR_DME | SR_IME)) {
     case SR_DME | SR_IME:
         /* The mmu is definitely enabled.  */
         excp = get_phys_mmu(cpu, &phys_addr, &prot, addr,
                             PAGE_READ,
                             (sr & SR_SM) != 0);
         if (!excp) {
             return phys_addr;
         }
         excp = get_phys_mmu(cpu, &phys_addr, &prot, addr,
                             PAGE_EXEC,
                             (sr & SR_SM) != 0);
         return excp ? -1 : phys_addr;
 
     default:
         /* The mmu is partially enabled, and we don't really have
            a "real" access type.  Begin by trying the mmu, but if
            that fails try again without.  */
         excp = get_phys_mmu(cpu, &phys_addr, &prot, addr,
                             PAGE_EXEC | PAGE_READ | PAGE_WRITE,
                             (sr & SR_SM) != 0);
         if (!excp) {
             return phys_addr;
         }
-        /* fallthru */
+        fallthrough;
 
     case 0:
         /* The mmu is definitely disabled; lookups never fail.  */
         get_phys_nommu(&phys_addr, &prot, addr);
         return phys_addr;
     }
 }
diff --git a/target/openrisc/translate.c b/target/openrisc/translate.c
index ecff4412b7..de77014d60 100644
--- a/target/openrisc/translate.c
+++ b/target/openrisc/translate.c
@@ -1588,53 +1588,53 @@ static void openrisc_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 static void openrisc_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
 {
     DisasContext *dc = container_of(dcbase, DisasContext, base);
     target_ulong jmp_dest;
 
     /* If we have already exited the TB, nothing following has effect.  */
     if (dc->base.is_jmp == DISAS_NORETURN) {
         return;
     }
 
     /* Adjust the delayed branch state for the next TB.  */
     if ((dc->tb_flags & TB_FLAGS_DFLAG ? 1 : 0) != (dc->delayed_branch != 0)) {
         tcg_gen_movi_i32(cpu_dflag, dc->delayed_branch != 0);
     }
 
     /* For DISAS_TOO_MANY, jump to the next insn.  */
     jmp_dest = dc->base.pc_next;
     tcg_gen_movi_tl(cpu_ppc, jmp_dest - 4);
 
     switch (dc->base.is_jmp) {
     case DISAS_JUMP:
         jmp_dest = dc->jmp_pc_imm;
         if (jmp_dest == -1) {
             /* The jump destination is indirect/computed; use jmp_pc.  */
             tcg_gen_mov_tl(cpu_pc, jmp_pc);
             tcg_gen_discard_tl(jmp_pc);
             tcg_gen_lookup_and_goto_ptr();
             break;
         }
         /* The jump destination is direct; use jmp_pc_imm.
            However, we will have stored into jmp_pc as well;
            we know now that it wasn't needed.  */
         tcg_gen_discard_tl(jmp_pc);
-        /* fallthru */
+        fallthrough;
 
     case DISAS_TOO_MANY:
         if (translator_use_goto_tb(&dc->base, jmp_dest)) {
             tcg_gen_goto_tb(0);
             tcg_gen_movi_tl(cpu_pc, jmp_dest);
             tcg_gen_exit_tb(dc->base.tb, 0);
             break;
         }
         tcg_gen_movi_tl(cpu_pc, jmp_dest);
         tcg_gen_lookup_and_goto_ptr();
         break;
 
     case DISAS_EXIT:
         tcg_gen_exit_tb(NULL, 0);
         break;
     default:
         g_assert_not_reached();
     }
 }
-- 
2.39.2

