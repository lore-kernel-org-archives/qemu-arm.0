Received: by 10.28.91.67 with SMTP id p64csp1283254wmb;
        Fri, 16 Mar 2018 13:44:13 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtxOCwZIEFX5Y10fq/Th7jPcfZ5J2lut/dxCnKNigAbTHINrj0pXggB1kDIKVylbnLVS0hF
X-Received: by 10.55.161.130 with SMTP id k124mr4886548qke.113.1521233053395;
        Fri, 16 Mar 2018 13:44:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521233053; cv=none;
        d=google.com; s=arc-20160816;
        b=BofrlRtN4f7tXgVcDygpoHbDBqsVsY39/XCHmdr/XQcnyjyMuCPDrKGEUQuC//PNoe
         86aiavMuOpAmqMtQkVYJ1xevfsvMZAanp1uwTOWLE5t3veUeh5WgUXxV73KsP7gaSCTb
         e4XXT1/KEiNRA/sovkYXIrWo4SubmehXuDHPwMBBT2Py4Q7R5BhmMMtuth6cm6WxBhEH
         /aLJO653gOxj1CzhJXq35ASMhSdFnQan3ZDNoWaHkzdjBL3eLXdxfFTW4f59TSf0iAbG
         WglkZf+1MkfaFYjfAleJ9Zupw8sjPY8nBTx5D1nRVy6zZilSxmgToFRSbsM47OgQrtxK
         zmeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dmarc-filter:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=kEjJzaZyzvrlW+shoiS9gDcZWl7tggTJF6mpnYBZmN8=;
        b=uKdCcFHAQwPUkFf2YWNWyS0RBI89yrJPmhZ0MDTbXP/K94nVd4xl4PEwMve56SXLxN
         mEbrkj34uvy19dS1bRp47cnbLQG0xOpM9DQ8FGf8Vbwlrbq1of2J6I/5lJRlh0jCMmAV
         FYJhOMmNqTmIle6bk4BEugSc3pksLoGJC1XIIKvdHDGxiwKAh7akXjczGYWJptASFwXq
         Fr8J49LIlouZ/YT3HxxSFPBjpQSSZR1WbCeBSgQ4BZd8ujybGoFnKkv75l+6sSs50zYv
         e0Fp7jGE+m3uOQeb5ubF4NcjsdooGN9DXH16LYfqTRgmxqdAV3YuihyruK8HFZuDGm+3
         EF+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=RUbvExjy;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=gAakCXul;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i64si1780957qka.71.2018.03.16.13.44.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Mar 2018 13:44:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=RUbvExjy;
       dkim=fail header.i=@codeaurora.org header.s=default header.b=gAakCXul;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59516 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ewwCy-0007ut-Pj
	for alex.bennee@linaro.org; Fri, 16 Mar 2018 16:44:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1Q-0005ra-9W
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alindsay@codeaurora.org>) id 1eww1P-0003KK-5Q
	for qemu-arm@nongnu.org; Fri, 16 Mar 2018 16:32:16 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56030)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alindsay@codeaurora.org>)
	id 1eww1O-0003JS-T5; Fri, 16 Mar 2018 16:32:15 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
	id C7ACA60F5F; Fri, 16 Mar 2018 20:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232334;
	bh=H4BJ0JtiSDLo4BBdMiQXq3me1X+hprXnYd3d0940vl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RUbvExjyK8uuIB8VJB+5uTWvoREr1tMr9eR5rGoSxabntj/CCXdn283Iwmio9nUAv
	2E6IgZKQFMaCsryWuq/Gg4DSkM+K+dRA6GBvuQsZpcv0ZP6fdnf5T6TyhpI+T09AgK
	8s1HisVoNJdOqaB117htuHkswcby18LAM9VlRG1A=
Received: from mossypile.qualcomm.com (global_nat1_iad_fw.qualcomm.com
	[129.46.232.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: alindsay@smtp.codeaurora.org)
	by smtp.codeaurora.org (Postfix) with ESMTPSA id 6633C60F8D;
	Fri, 16 Mar 2018 20:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
	s=default; t=1521232329;
	bh=H4BJ0JtiSDLo4BBdMiQXq3me1X+hprXnYd3d0940vl8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gAakCXulPwI5/b16r8iFbYsRkyuhHfyQozbLA4KU/VFdir0RGn9/2CWuZBhRv8P1b
	vNT8fVIOcS/fcQ+cRHCwZqsWZeHUylUtohUVHrD78vU7cRQYBoI6S4Z95DLci4DDbt
	t1zhvsw6uvjMkMin12iZU4plMCMvI94GoxLRLUWA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6633C60F8D
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
	spf=none smtp.mailfrom=alindsay@codeaurora.org
From: Aaron Lindsay <alindsay@codeaurora.org>
To: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, Wei Huang <wei@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Date: Fri, 16 Mar 2018 16:31:08 -0400
Message-Id: <1521232280-13089-11-git-send-email-alindsay@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.96
Subject: [Qemu-arm] [PATCH v3 10/22] target/arm: Allow EL change hooks to do
 IO
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	qemu-devel@nongnu.org, Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U1BOQyTR1e4N

During code generation, surround CPSR writes and exception returns which
call the EL change hooks with gen_io_start/end. The immediate need is
for the PMU to access the clock and icount during EL change to support
mode filtering.

Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
---
 target/arm/translate-a64.c | 2 ++
 target/arm/translate.c     | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 31ff047..e1ae676 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1919,7 +1919,9 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
             unallocated_encoding(s);
             return;
         }
+        gen_io_start();
         gen_helper_exception_return(cpu_env);
+        gen_io_end();
         /* Must exit loop to check un-masked IRQs */
         s->base.is_jmp = DISAS_EXIT;
         return;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ba6ab7d..fd5871e 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4536,7 +4536,9 @@ static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
      * appropriately depending on the new Thumb bit, so it must
      * be called after storing the new PC.
      */
+    gen_io_start();
     gen_helper_cpsr_write_eret(cpu_env, cpsr);
+    gen_io_end();
     tcg_temp_free_i32(cpsr);
     /* Must exit loop to check un-masked IRQs */
     s->base.is_jmp = DISAS_EXIT;
@@ -9828,7 +9830,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                 if (exc_return) {
                     /* Restore CPSR from SPSR.  */
                     tmp = load_cpu_field(spsr);
+                    gen_io_start();
                     gen_helper_cpsr_write_eret(cpu_env, tmp);
+                    gen_io_end();
                     tcg_temp_free_i32(tmp);
                     /* Must exit loop to check un-masked IRQs */
                     s->base.is_jmp = DISAS_EXIT;
-- 
Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

