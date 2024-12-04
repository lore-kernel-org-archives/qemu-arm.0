Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp489689njb;
        Wed, 4 Dec 2024 12:28:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX45gIakSlPMgQ65ckZbG0OLxHFsvpf5avl/GPcX/I8LcrfML0Zh8O3ZPD94WjGHawsTHFSHxjtr3OB6g==@linaro.org
X-Google-Smtp-Source: AGHT+IGe7BUpo6kaSuUJXw0B983yHI4zqW8EbULsRpPHd+SxwfyaTHIrHpDhbdo/YxjBLmVQngCh
X-Received: by 2002:a05:622a:198f:b0:460:aa51:8411 with SMTP id d75a77b69052e-4670c370b74mr103443621cf.24.1733344115202;
        Wed, 04 Dec 2024 12:28:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344115; cv=none;
        d=google.com; s=arc-20240605;
        b=ag8esXhue14i7M/5qFp3bM4TPKmZhFZR4XzjheDDL1PeMWkWQr7bJLnbXi6RStRHRt
         jT4PGWHCMVlVBKjiAy873Jyq5Z6dMQ7qgR7zaFVyJw5bqPbCOAXyahK0HwFrFzJi66P4
         4ODUNIQdH5qzZCsNY/WFRgou8qoczaYbxGz9zZCZfTvCADxe9NuzFxIPpPaow4U/jLJ0
         OpyyD/1ZAqLQArUAoxHZWzcHOvJV5CQu5S+oZpKI/xf4KKd93m6Xe2k9/7kLk71o/mUD
         MNUkPJ/9nExU6lChKWVjVmYga5ZmoYdAGiZ6fVtyjSThU5NTpEqD5nxSDH/A8zyRy3zp
         qO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9QewNS2KrXYFKBtSPrML3uVF3WnArNvnPbDN/XKhdgc=;
        fh=oiAk6JLUO6bLiXlawhBtOkEIwj8QHQtko6Uvy3Ip4jg=;
        b=SLV/hkv6nnP1x6xetznbPUgCWPT1GIR7b1fKTS++AxVEgM2abXYMKkZ/kIQFAQ2m1J
         Xj2OuRS9+NDXrEzKX0f6+sRRH6odNH/vpYvoj3traZwWMrLTVrYrDURFNhMLLper8Pcd
         oRhe6Q48qP/1Y8fiOuIE4GMxwceBD/hUpmviqcKNDCDYBRSOv8aXPw+AAtFOWfMOQvSH
         1IQVNmUb3Xqg3y3PuNBNwsl8EHaLnFDtfLWTpM8mGY3SR6jzrLxk/knD21PRjFRSTWe0
         dCMnwNtlMoPFm8NXSvMcq+f6knCp9+K9Kt5CjANyHQuGAi0qCr2aTcpy6XIhZX04JBju
         U5kw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zkLXT/c6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4054f75si170014581cf.136.2024.12.04.12.28.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:28:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="zkLXT/c6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIvyp-0002MO-NQ; Wed, 04 Dec 2024 15:28:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvyh-00027G-Si
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:28:08 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvye-0002GE-PU
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:28:07 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-434a1fe2b43so1891955e9.2
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 12:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733344083; x=1733948883; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9QewNS2KrXYFKBtSPrML3uVF3WnArNvnPbDN/XKhdgc=;
 b=zkLXT/c64uMGH6KoQQilbT/8TWzf8HL2stHfoI6fw/h/gWz/rbUOn79145ycxguHxg
 tzx0cH5x/CB+IEioYHkwGk1WN9mkIof1DS3n7NfBAbRPdGo4qZavZWmbo+cypYh+cLIo
 woGq8GmOB+1v2y6UOKu6QgEz3KiYvF6W8re13R8EmwbB4dTsLuJJ8e9stlfpFilxBg8C
 Oqn2Lae3nQ92+WaBuRkitAj7m8orJBvUW+OZvd4gsZBtuQOFJgtitYU2JsXfZC6BrpKh
 xtmGCYJoRbU/nJy8XPCtNaiW/alvumlyZa222Pv5aGhmECLQGiaPC5ux5I89VD4HXAbu
 s2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733344083; x=1733948883;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9QewNS2KrXYFKBtSPrML3uVF3WnArNvnPbDN/XKhdgc=;
 b=vsBZ6Zop5PkiSY3YWBw++gP+ZEVux2N5YrvUx7HKAHvRJVcdLXvMheBZOlrRe8vaVi
 OZkCM3S2c5TvdcPJ0XYXn5ObhF8GtHIl+13wFZX2wR/JK07rpR9Sbrw69GXjexdpwgz1
 B3wBeZOlYx3c8kSHWujgxjqmdelqRAf8ClLPHcG8ULLNN3N3Lucjl7Hh42WZeUICvtim
 Aa0Vi+bPwnZgyosRgOM2w0ej1F0PIAnHfpOT60k0cPs3xGfEpL1zd058qQWpEe7GI4dU
 EX2PLqCOk4KZ9a7yiO3Nn0U96ORts8oHPoSC6wi3PSZDOpUVexTHmNcN9pYBxqDEWa44
 tn/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRgs8OjVlLt594RUoMBdKLtdc30WrdpwKGFN60BC4DEkOsqEiAjy48W/zI/gjuHsaTEHb9j3ofzg==@nongnu.org
X-Gm-Message-State: AOJu0Yw/OKW9YSCgtVeEAXnsM4RoerQ6jK+zSoSI4nhP84l9hiXy3DYu
 dYSYkyKTZwax9SFQIfiE2P6Pz/mmISQQQJGTVsUnunUAHN6NjSg1GF2XlvQ7jPU=
X-Gm-Gg: ASbGncstaj4YBqwNmiFPjKA233vke2BTcLsBaUfFRlmtn8SjE0ISzoNKYhkic4TmGOn
 t+YdtSCnoFqIaPcIp98rHXVn9wYqi3A5QHpqgopdgDPPsbqmkNB+wk/pcf5uQFDwZtCaRJ759VE
 /ZYqL02WhDwLsvpIooEZKbvHFelZsFHVwXYfpG/j5v4ceHdGSQLEfaKZ2UYLybA0pQoHep7Ep0W
 rh8WS876Wwmg70xEIkrV/0W6jZn5URIMDV/e5KmzX7bNp+YP2mRFiTTZrVN2n4MPces91Qvpc+J
 AypdPXfXYNBpUkHtyYd5vARB
X-Received: by 2002:a05:600c:1ca2:b0:434:ba13:e52b with SMTP id
 5b1f17b1804b1-434d0a14a83mr76478475e9.31.1733344083303; 
 Wed, 04 Dec 2024 12:28:03 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d526b158sm36718205e9.8.2024.12.04.12.28.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:28:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 15/20] target: Implement CPUClass::datapath_is_big_endian
 (big-endian)
Date: Wed,  4 Dec 2024 21:25:57 +0100
Message-ID: <20241204202602.58083-16-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: f8XTLRNROx21

For all targets which have endianness architecturally
predefined as big endian (built using TARGET_BIG_ENDIAN=y),
their datapath_is_big_endian() handler simply returns %true.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hexagon/cpu.c  | 6 ++++++
 target/hppa/cpu.c     | 6 ++++++
 target/m68k/cpu.c     | 6 ++++++
 target/openrisc/cpu.c | 6 ++++++
 target/s390x/cpu.c    | 6 ++++++
 5 files changed, 30 insertions(+)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 020038fc490..6407ed80c59 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -245,6 +245,11 @@ void hexagon_debug(CPUHexagonState *env)
     hexagon_dump(env, stdout, CPU_DUMP_FPU);
 }
 
+static bool hexagon_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return true;
+}
+
 static void hexagon_cpu_set_pc(CPUState *cs, vaddr value)
 {
     cpu_env(cs)->gpr[HEX_REG_PC] = value;
@@ -342,6 +347,7 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = hexagon_cpu_class_by_name;
+    cc->datapath_is_big_endian = hexagon_cpu_datapath_is_big_endian;
     cc->has_work = hexagon_cpu_has_work;
     cc->dump_state = hexagon_dump_state;
     cc->set_pc = hexagon_cpu_set_pc;
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index c38439c1800..8ccd224f2a4 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -203,6 +203,11 @@ static void hppa_cpu_initfn(Object *obj)
     cpu_hppa_put_psw(env, PSW_W);
 }
 
+static bool hppa_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return true;
+}
+
 static ObjectClass *hppa_cpu_class_by_name(const char *cpu_model)
 {
     g_autofree char *typename = g_strconcat(cpu_model, "-cpu", NULL);
@@ -245,6 +250,7 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
                                     &acc->parent_realize);
 
     cc->class_by_name = hppa_cpu_class_by_name;
+    cc->datapath_is_big_endian = hppa_cpu_datapath_is_big_endian;
     cc->has_work = hppa_cpu_has_work;
     cc->mmu_index = hppa_cpu_mmu_index;
     cc->dump_state = hppa_cpu_dump_state;
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 5fe335558aa..52f8db41d5a 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -24,6 +24,11 @@
 #include "migration/vmstate.h"
 #include "fpu/softfloat.h"
 
+static bool m68k_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return true;
+}
+
 static void m68k_cpu_set_pc(CPUState *cs, vaddr value)
 {
     M68kCPU *cpu = M68K_CPU(cs);
@@ -571,6 +576,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
                                        &mcc->parent_phases);
 
     cc->class_by_name = m68k_cpu_class_by_name;
+    cc->datapath_is_big_endian = m68k_cpu_datapath_is_big_endian;
     cc->has_work = m68k_cpu_has_work;
     cc->mmu_index = m68k_cpu_mmu_index;
     cc->dump_state = m68k_cpu_dump_state;
diff --git a/target/openrisc/cpu.c b/target/openrisc/cpu.c
index b96561d1f26..16e39b43ec4 100644
--- a/target/openrisc/cpu.c
+++ b/target/openrisc/cpu.c
@@ -25,6 +25,11 @@
 #include "fpu/softfloat-helpers.h"
 #include "tcg/tcg.h"
 
+static bool openrisc_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return true;
+}
+
 static void openrisc_cpu_set_pc(CPUState *cs, vaddr value)
 {
     OpenRISCCPU *cpu = OPENRISC_CPU(cs);
@@ -257,6 +262,7 @@ static void openrisc_cpu_class_init(ObjectClass *oc, void *data)
                                        &occ->parent_phases);
 
     cc->class_by_name = openrisc_cpu_class_by_name;
+    cc->datapath_is_big_endian = openrisc_cpu_datapath_is_big_endian;
     cc->has_work = openrisc_cpu_has_work;
     cc->mmu_index = openrisc_cpu_mmu_index;
     cc->dump_state = openrisc_cpu_dump_state;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 514c70f3010..eda1e3b286f 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -44,6 +44,11 @@
 #define CR0_RESET       0xE0UL
 #define CR14_RESET      0xC2000000UL;
 
+static bool s390_cpu_datapath_is_big_endian(CPUState *cs)
+{
+    return true;
+}
+
 #ifndef CONFIG_USER_ONLY
 static bool is_early_exception_psw(uint64_t mask, uint64_t addr)
 {
@@ -390,6 +395,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
                                        &scc->parent_phases);
 
     cc->class_by_name = s390_cpu_class_by_name,
+    cc->datapath_is_big_endian = s390_cpu_datapath_is_big_endian;
     cc->has_work = s390_cpu_has_work;
     cc->mmu_index = s390x_cpu_mmu_index;
     cc->dump_state = s390_cpu_dump_state;
-- 
2.45.2

