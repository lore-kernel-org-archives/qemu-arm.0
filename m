Received: by 2002:a17:906:ca92:b0:a35:2c0b:b7b4 with SMTP id js18csp117490ejb;
        Fri, 26 Jan 2024 14:09:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7jNyfADx7ccKyZQ7tLMtB/Vh6WJSQfU0ubu56vdAdfQjw585BdPgHEC1W+pbTkzwzAdWP
X-Received: by 2002:a81:a110:0:b0:5ff:83be:893b with SMTP id y16-20020a81a110000000b005ff83be893bmr752873ywg.86.1706306956565;
        Fri, 26 Jan 2024 14:09:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706306956; cv=pass;
        d=google.com; s=arc-20160816;
        b=nd9w7LhpBRdqAb9L508ePU4NMtwCuYYZdMruLe8Wm/ruvLc0J08AxswdWKsMy9LTdV
         mp2W8vXVsynQHOodzkbZGw4+AmGiwyXcs4bb6UJmPS0n34M93Lkc3bGaOX/C/itHp3gZ
         eEIek0Jpl3wYvKwS/eZZ4QGOcBHGTGr7rbbtexs6Cc3DfqPJeVxGRKnUEkpcmtrflM4/
         sQc/rSk43VD3dH1/+OaGDtes56/tvU7cTprUPl/vQpyX1VIrIN+VynsPv7zmf3o9QXJ9
         ++ngdONNhjAROmSP6ZKdfmz2uQ8Tic6RZWenQLiH1sIORf14puGWjIl2I6SbzgSq+sh5
         ZBUw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=vV6dlj18pAtxWLV4KcwUuJD4lVU4OiaIF5yNARG5Efc=;
        fh=Vox//9eCt8pDAfzs70Ob3VgxSZnsBM3cPewB/LFmMXA=;
        b=XBGxe89T7TJmeFzQSneSBzJcDnLnhg+voIpLgimMZz0Kml949bYPpTQeAnuarjVPiS
         Y3jcOR2U+/mKEBjnSwGtcvrjjhFiXNLRE331P72XGacJEt9IOnkxUPzinODPJ9V9kAxb
         e14VcdHoJlH9JlcX0+orZqPtV+/aCMpIsJRD8RkNnJpo6ErFYQaGQbfAlA25KecbWDkR
         mQzKRBR7ek/krGnME5GcTu6wUeJoa/LIYwdR70tdha+9w3YzpJb5qNuzgOWnfbK1C9KF
         XnsFhHrRud8Mv0/CclCw7ncpEJ0kYvELTidBC3PeE9CJ8f6u9tUPpCOy/oHsUcaAYFKH
         Db2w==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ECh2SKRc;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7235-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7235-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7235-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id eo5-20020ad45945000000b0068686887126si2229644qvb.531.2024.01.26.14.09.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:09:16 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7235-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ECh2SKRc;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7235-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7235-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D8061C21799
	for <alex.bennee@linaro.org>; Fri, 26 Jan 2024 22:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F6B24B3C;
	Fri, 26 Jan 2024 22:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECh2SKRc"
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FF32555E
	for <kvm@vger.kernel.org>; Fri, 26 Jan 2024 22:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706306785; cv=none; b=P8KGN/EFiHGpxVhTgCgGxbrvgUDwVju8mf3O3fsajvGW06OHP8EVBCtLmV45wGKHF0jewuG3pIiItxHWhWOP0aDVaHADwUP/1aSEcE2UDDGzpiU7+TosgrpDIp95DKoyPiBVEdVUAu48ZlaNLOaz/U5pmNabOm/h+yHgxNY+7NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706306785; c=relaxed/simple;
	bh=kQIj/Okg5eAzamYjUoUwfm59wqdNrYwL8c1qYbBzRQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EQL94WQcOStHyu8xDGtpyz/93sUugCVru1XpMur07YLV3zwwyvK7cJlH7anj2dPNrgr42b+Y3bxwCst1/yrWS19dAxGOl61Jy/wNWjzPpqQdliEJZ9B3XLelrPU2xxAIeyb4OX0/lysS1MhGH5MWtWZ7TpLMNEwllJrMbbw1jc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECh2SKRc; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3394dc75eadso908727f8f.2
        for <kvm@vger.kernel.org>; Fri, 26 Jan 2024 14:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706306781; x=1706911581; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vV6dlj18pAtxWLV4KcwUuJD4lVU4OiaIF5yNARG5Efc=;
        b=ECh2SKRc5a18tNq6uDXQQudlGUb9ir6NxuINAgjSVFge4skCPSDAC61d7yDEivsb4+
         xEG6Iwllzm517Dws/zIZQaRW1QCHuV20lHUnMFn0OcHsDpY/1jKr6/VWFB2JC3D4mUR3
         /HRzmyZ3Zr3SwhtoSkUMZgJOhiBduzKQjqbsllTZ9Mp/sl819xGJttPYlBAxDxhXdoUY
         4hnIH01kIYYxX0YLNzvPWwsSL8txtkShHuobGHiptdaikfnh5C5qe78CN9MBjoNYTwT3
         H02aa6o3/esxjqV2V4OjyiBc53G3OQq7EkqmEc0IoshXUSdvYSlOM1ORLEv9nAnRTl4S
         9lVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706306781; x=1706911581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vV6dlj18pAtxWLV4KcwUuJD4lVU4OiaIF5yNARG5Efc=;
        b=Ftux8GLSNDaDdLzV2JOsSze5nD+QTM0bnYatax6/a7pjKh2HEmr3BpIfbi5wD04BLo
         jhGdk9Q0Z/oJNUHGUgBfhsNtmZRz6jN6IHgiev7FZzeV1fsYGHAGE1YqzTvlf1+xmrW8
         jIV+J9nJ0PHoPfxhlUxayytLRnnGv1eUjZ6jVXnR9RkIqBnY4dOYNYJkJfgp9XPXx+Pv
         naVau2ub/W7mOnkG+t05UKFVwVgeb6QQZMlgQDGsxpM5x5h7s34Y4+uNUjzU5/tOEhTf
         IVFHrokLjXt1yoAnFRvgzX6SSniB878ils2zhnEjpsyhiutkg1yhppyoQqEK0xnkiMYl
         //ZQ==
X-Gm-Message-State: AOJu0YyPOaTOCkLZrG9wQMDPs8uWQQ7jIzN4qYn65vPl/OL2a9fOxwgH
	yfDF+RK9YWnKAk67dODlubjMOIRzsDRQBpGTb9sxpuKVn/NhSCTkQGD21r+T6ps=
X-Received: by 2002:adf:f48d:0:b0:337:bfdb:5b8d with SMTP id l13-20020adff48d000000b00337bfdb5b8dmr216861wro.115.1706306781480;
        Fri, 26 Jan 2024 14:06:21 -0800 (PST)
Received: from m1x-phil.lan ([176.176.142.39])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d6b8e000000b0033ade016ba5sm1380477wrx.4.2024.01.26.14.06.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jan 2024 14:06:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-s390x@nongnu.org,
	qemu-riscv@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Subject: [PATCH v2 21/23] target/tricore: Prefer fast cpu_env() over slower CPU QOM cast macro
Date: Fri, 26 Jan 2024 23:04:03 +0100
Message-ID: <20240126220407.95022-22-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240126220407.95022-1-philmd@linaro.org>
References: <20240126220407.95022-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: DXmMi01w79cI

Mechanical patch produced running the command documented
in scripts/coccinelle/cpu_env.cocci_template header.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/tricore/cpu.c       | 20 ++++----------------
 target/tricore/gdbstub.c   |  6 ++----
 target/tricore/helper.c    |  3 +--
 target/tricore/translate.c |  3 +--
 4 files changed, 8 insertions(+), 24 deletions(-)

diff --git a/target/tricore/cpu.c b/target/tricore/cpu.c
index 8acacdf0c0..7f0609090c 100644
--- a/target/tricore/cpu.c
+++ b/target/tricore/cpu.c
@@ -36,38 +36,26 @@ static const gchar *tricore_gdb_arch_name(CPUState *cs)
 
 static void tricore_cpu_set_pc(CPUState *cs, vaddr value)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
-
-    env->PC = value & ~(target_ulong)1;
+    cpu_env(cs)->PC = value & ~(target_ulong)1;
 }
 
 static vaddr tricore_cpu_get_pc(CPUState *cs)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
-
-    return env->PC;
+    return cpu_env(cs)->PC;
 }
 
 static void tricore_cpu_synchronize_from_tb(CPUState *cs,
                                             const TranslationBlock *tb)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
-
     tcg_debug_assert(!(cs->tcg_cflags & CF_PCREL));
-    env->PC = tb->pc;
+    cpu_env(cs)->PC = tb->pc;
 }
 
 static void tricore_restore_state_to_opc(CPUState *cs,
                                          const TranslationBlock *tb,
                                          const uint64_t *data)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
-
-    env->PC = data[0];
+    cpu_env(cs)->PC = data[0];
 }
 
 static void tricore_cpu_reset_hold(Object *obj)
diff --git a/target/tricore/gdbstub.c b/target/tricore/gdbstub.c
index e8f8e5e6ea..f9309c5e27 100644
--- a/target/tricore/gdbstub.c
+++ b/target/tricore/gdbstub.c
@@ -106,8 +106,7 @@ static void tricore_cpu_gdb_write_csfr(CPUTriCoreState *env, int n,
 
 int tricore_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
+    CPUTriCoreState *env = cpu_env(cs);
 
     if (n < 16) { /* data registers */
         return gdb_get_reg32(mem_buf, env->gpr_d[n]);
@@ -121,8 +120,7 @@ int tricore_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 
 int tricore_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
+    CPUTriCoreState *env = cpu_env(cs);
     uint32_t tmp;
 
     tmp = ldl_p(mem_buf);
diff --git a/target/tricore/helper.c b/target/tricore/helper.c
index 174f666e1e..d328414c99 100644
--- a/target/tricore/helper.c
+++ b/target/tricore/helper.c
@@ -67,8 +67,7 @@ bool tricore_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                           MMUAccessType rw, int mmu_idx,
                           bool probe, uintptr_t retaddr)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
+    CPUTriCoreState *env = cpu_env(cs);
     hwaddr physical;
     int prot;
     int ret = 0;
diff --git a/target/tricore/translate.c b/target/tricore/translate.c
index 66553d1be0..ad314bdf3c 100644
--- a/target/tricore/translate.c
+++ b/target/tricore/translate.c
@@ -95,8 +95,7 @@ enum {
 
 void tricore_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 {
-    TriCoreCPU *cpu = TRICORE_CPU(cs);
-    CPUTriCoreState *env = &cpu->env;
+    CPUTriCoreState *env = cpu_env(cs);
     uint32_t psw;
     int i;
 
-- 
2.41.0

