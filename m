Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp491496njb;
        Wed, 4 Dec 2024 12:31:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWqNEtDd/Y4mMuI3jyACS861jqBObLyntT1/F5UARsdkn4CRImP9xWNfeN/CwVMbLou0Fi2d4a0DOIFKA==@linaro.org
X-Google-Smtp-Source: AGHT+IE7r5xcrFyArSidAP+yPnlvpYCzz6hopuso0sAYgX/T195RM6xJbPlLhNmK8hLbibfBa8xL
X-Received: by 2002:a05:622a:4c6:b0:466:adbc:f1e8 with SMTP id d75a77b69052e-4670c3c752bmr112230741cf.28.1733344293929;
        Wed, 04 Dec 2024 12:31:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344293; cv=none;
        d=google.com; s=arc-20240605;
        b=R/IMmc6yDNLew0NWlZPVdnAE5HZdizE4D2a4tdn0Hh13M6nfQukIHOyvBO+45DEgV5
         Ysxagzx02j1QyTzOLmHzu6B2GDQI/4Y1MhPP9JZWa2RIr55moaP+oSZNIR7YBrv2o60n
         DFyr/IfEOgTYqhTy/7Qw7p+tX+38eWjMKXmAf2DBMlrFfFJtdsiFNIT5ChDih6yRwior
         XiuXMczQ6JJYA8B1RjKRXAsQ8qlIqIIYSvmyU0PI+m+qSBPILaH6x1SKKDAxzGgvHAxy
         Jivti3un9kVTpvzPq2r78mDd/s1UICvyNY7NQdB0s3ccN+3F347YWeOQl1Xis1WwTeyP
         GjHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=r6SfGh7GwB5WuWE7gr65NVDyXlneJEDYoQOKqsCWiWk=;
        fh=Dl44rSXwdz4EGEUuDNYKRB1SzUePCxmxZ5SDYRCt4pA=;
        b=ZVKrq+Afl0UhfANG0Ud1t+g1bIkAceIy6NG32FXf07LgN1DqqUSZdA1pDXJFoKVz6a
         k9naPEvCX62htpAjgwNHLH17Q92PnfiyzTnVKqOX0quVSzf6I99y4ZRqpyjiU8DLwzFy
         3aKvEleNx5D/pdoC52GspsBXbH904kxkEzjXZujs1rx70zm6zYv3Dt0Y/XbNp7KOrFLX
         gHzjIQSby4WTJBbkmvmKh5x5aIeRrIbNGJKO7SMJHGZI2ppEWBhdi33f8C4CTZFCOchk
         htp/zrESy3Da1jj0qIN8AriPcER1jpcopUjCPRWGQWC9h66LG8wCdtSiVU6OjzrwDgvW
         xisg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sT0hZJDC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4225eb7si50927711cf.423.2024.12.04.12.31.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:31:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sT0hZJDC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIvxC-0007YJ-UB; Wed, 04 Dec 2024 15:26:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvxA-0007Wu-QZ
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:26:33 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvx8-00072Y-Ao
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:26:32 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so1313515e9.2
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 12:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733343988; x=1733948788; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r6SfGh7GwB5WuWE7gr65NVDyXlneJEDYoQOKqsCWiWk=;
 b=sT0hZJDC+GwnGQlQVDh4fYQpoLq6MW1ldnlYoK3cSUxFKXPsAP/IYMRrnC3FqUQNkh
 NpVUxnTZox4Z9SEnKyJLsjNjivPPUOyNEd8MyEkRxV6n313r5PKGWtLR/gvbGKw2jMNc
 rf1mxdU3zEJlBqd0iROokOEhzLpTzE7/dXWus5vrqRfrXZsbk2VMjOUBuczuHL3w2mCB
 mbrz7G2Ur8xbot9vcZ6rcawkxpo42Hi4fmm7VU/yfPBUKJ1RoKS3AMM5rJhD7zx8NMYv
 Zd92TCeELqglX2OasuGl+anxG5rRDyU3t/ObbABb6D6rcfNmwtSU8VRCdnVp4tKFeWcB
 qDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343988; x=1733948788;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r6SfGh7GwB5WuWE7gr65NVDyXlneJEDYoQOKqsCWiWk=;
 b=vOmrN1mP74dQiCqNZ7oJuoEwiRlqvUILPSOebT4JMxmIFNuatBddEGq8SEGUUhD43Z
 BoSS+Fla1xPc1YvsJSNSA11TdmXdJEjFEU2PDuxsRIRNfQ43BTtM/9PN6W8p6EoiPxT7
 HiYQMtq//9fOS0/8m8WhRVshgTUMG6XJc6081vmAakWwtGvasEm89H0kJA/LY7fclKkZ
 MCb1kJqjHpHVK3SFh58cJdMFaPPhBlMzsDb35b4bfPW2XIJNC/3+qydb27MBOztE/731
 HpKTSQuajoT5/c7U1CkxaI8PqFcxi91J0ooT1fvp5QyefI0lcULVtk6kOrM+un97hzUm
 rkhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWYMigqahgB/ZobzZ7olBW/HJ0dWAMYswq3we4eLW0I5uuTqTdSoOXH/vEoJSPr2m6+aFtM/1g2w==@nongnu.org
X-Gm-Message-State: AOJu0YyhTo2PNmICWPWOodjM2IPYPTpthVQsiEQCKJDEc0qtlOnMYzfO
 9940RWNnpBe3sT4aLa64M16JTMAW/g/oeL9Mf45dSwoALY3u+5rTuxWTsKvnuk8=
X-Gm-Gg: ASbGncu+OYGBo0ieSf57DPln0U6uqEU9xZOTnHYbLAQnnh/YUdWAXwFpMkbTLgpD7K1
 ttHrB9t0SEvuWTV5V3mQFtofF4ur4sGkUfiHEx3BweYEt/FFaX+nCyHO9l8hSA6v2NuycJBMrCa
 KP1IXkw6V9jW3OdYfLZqUvvRofT1rVNIK66wPPqfblsA5nIarQN6UKn4jAqFlbUtTef1hyE4m/r
 w5nU50AEimV79u9dg0C0OVVU6v1eL2rP6dTcGtKU3rhKRk0R7hJdquAOkdv9AUNMdnHFmlwtN7Z
 aTbsJWz6n+3PX9uxBv5T0zaO
X-Received: by 2002:a05:600c:1c07:b0:434:942c:145f with SMTP id
 5b1f17b1804b1-434d0a1cdb5mr64737145e9.29.1733343987773; 
 Wed, 04 Dec 2024 12:26:27 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385dfb2d7e0sm16066857f8f.44.2024.12.04.12.26.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:26:27 -0800 (PST)
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
Subject: [PATCH 04/20] target/ppc: Register CPUClass::datapath_is_big_endian
Date: Wed,  4 Dec 2024 21:25:46 +0100
Message-ID: <20241204202602.58083-5-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: hILi9wfX22PM

ppc_cpu_is_big_endian() already returns whether
the data path is in big endian. Re-use that,
exposing this helper for user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/cpu_init.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index efcb80d1c25..9650acb4850 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -7285,15 +7285,15 @@ static void ppc_cpu_reset_hold(Object *obj, ResetType type)
 #endif
 }
 
-#ifndef CONFIG_USER_ONLY
-
-static bool ppc_cpu_is_big_endian(CPUState *cs)
+static bool ppc_cpu_datapath_is_big_endian(CPUState *cs)
 {
     cpu_synchronize_state(cs);
 
     return !FIELD_EX64(cpu_env(cs)->msr, MSR, LE);
 }
 
+#ifndef CONFIG_USER_ONLY
+
 static bool ppc_get_irq_stats(InterruptStatsProvider *obj,
                               uint64_t **irq_counts, unsigned int *nb_irqs)
 {
@@ -7407,7 +7407,7 @@ static const struct SysemuCPUOps ppc_sysemu_ops = {
     .get_phys_page_debug = ppc_cpu_get_phys_page_debug,
     .write_elf32_note = ppc32_cpu_write_elf32_note,
     .write_elf64_note = ppc64_cpu_write_elf64_note,
-    .virtio_is_big_endian = ppc_cpu_is_big_endian,
+    .virtio_is_big_endian = ppc_cpu_datapath_is_big_endian,
     .legacy_vmsd = &vmstate_ppc_cpu,
 };
 #endif
@@ -7455,6 +7455,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
                                        &pcc->parent_phases);
 
     cc->class_by_name = ppc_cpu_class_by_name;
+    cc->datapath_is_big_endian = ppc_cpu_datapath_is_big_endian;
     cc->has_work = ppc_cpu_has_work;
     cc->mmu_index = ppc_cpu_mmu_index;
     cc->dump_state = ppc_cpu_dump_state;
-- 
2.45.2

