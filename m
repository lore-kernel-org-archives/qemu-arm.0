Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp489183njb;
        Wed, 4 Dec 2024 12:27:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXOuDzQdm8iz1p+/aG4huF51ixIy5fz38V0KLqUiMKHJ+gilSVq1CL8O0pzf6KAoDFz+G8gMJncotY1CA==@linaro.org
X-Google-Smtp-Source: AGHT+IGZnC5XjusFFbXcx3RtuoIAIY7gsqXINus+ZoVrREBObwNg2vDt1MXeWNz6O6+pV1h9MxTc
X-Received: by 2002:a05:6122:1815:b0:50d:69a8:f5d6 with SMTP id 71dfb90a1353d-515cf786776mr8097874e0c.8.1733344064003;
        Wed, 04 Dec 2024 12:27:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344063; cv=none;
        d=google.com; s=arc-20240605;
        b=KpTscP7ml6izihl8mmvdDoSZ5qCSUG0+UKt/rZhlL7jgjEOUCTN5zfXBxkpsUOrpyP
         L3QgQtF9kmnLDRoH+1BBc2alX6O/wLWJug0G5kpaldn36ZFYrVOE5uk09BntirZQwlgA
         rCIlxu7an0Y9NXGAOIXHLVLQHiJIY3GU/TosadSaBeBor4+gI2M/WXcdLoe61CUpgVzD
         sm3oN2UDsV4EMpy4Gq0fu71d0JEaZjmSH2orkJqb0OI2GKPL6yiOC3RFwamNIah9Sbwx
         GjD37MKH+86VBxfjMqtyyLCCuka+ra6GdcXfp6gtGWzCABSmWbt1CeGb5GpootgWDI5J
         DQgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HcqXxb9hdcFJ7l5TfHoNchwB1oNn7eM/DNMTs0fqYbc=;
        fh=V4+UTooBEB88aysVqR6M/zI7vMa5PT/nwAFNd+L23n4=;
        b=XUi/o9uD4BhKQhDvNWL9yYCOTT2XZWhFDr7S/JiDxrMQXUC0467uvg7JFavxrGDHU1
         04KCoy5j/Hzdp0vygpuWg1cODWfnraVLvqnidL0QgdKbGGhxEugwRXvSsWZkuhfC0ehS
         AWPKs2asiVgmgSgbWHSCvp18gB3GvEfxUaBOigFEIidfLe7VICKuNAH/d6nnepoaOkdx
         hMU1xnVtzl5D7F7Pxu9KwMow3kDXn1ymZpxx4KFKwwO9Hxieu3AXbgqBraubyr2/UDLp
         Z3kqQrb49F3NvBzdaz1mpOjcrIZY2TrlQE79HE7wuEwzze0ZH5c4jTJWe16G1LQhNOHk
         6yVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=huji3LWF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5156d10f4cbsi7896903e0c.189.2024.12.04.12.27.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:27:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=huji3LWF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIvxL-0007fm-MA; Wed, 04 Dec 2024 15:26:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvxK-0007eQ-4Z
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:26:42 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvxH-000757-Ns
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 15:26:41 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-385dbf79881so836935f8f.1
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 12:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733343998; x=1733948798; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HcqXxb9hdcFJ7l5TfHoNchwB1oNn7eM/DNMTs0fqYbc=;
 b=huji3LWFMRoMtbSsB44ClNzKogtWW4RICRcnr75VI1gp3u/bmBfB1S/OOZp8J2V7qc
 6Qd+zcA8GJGWSXhynrSp+WF1GSYxx5doiGV0K6HLEoLJnHutfDjVPg05dgrZ77v0kko8
 6FvcmIe6i2nw8f1OhJDrIxnJmMmDq+/QKUKti17I3M+SWa47v7xh5VmToiljB6e0zdDF
 AtyVh/6OEICIYPqIPjTXFlHXeAiLdHGcU5Evvaqaw/k7zVpmYk85gzQOR213EykQOmtn
 2rH0OlwxEflnm1YJSIB0Am3u9BgJtQzZWA1EoTrteKZM91XV9DubHzOnyuaROP78GEwe
 gKJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343998; x=1733948798;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HcqXxb9hdcFJ7l5TfHoNchwB1oNn7eM/DNMTs0fqYbc=;
 b=cNvXp+VYA8GMLVqhGK1yMURpu3Mszo9TrpWiwU7FqXQ+DN2POK8qc2y2NjVPTCQ3j8
 acjIQee/62Oe9NermYEf3zivrEq627cAzyJnWIaPzoXZ2fWYsrZ4sM8Dfoy3fRqA3wC7
 2cqh/SRZ1o670dIdmKEhNh4TTYTRonww2yYU6ceOdoVTXPp1vavlV1XytDqP+9Nkdlpx
 JqTSy6z39nPV8fd0PiQoS0qjfi5fnYGDX4JEywtnAOZjzP2YbY9FhqvOuoZzmx0zAW0+
 HSRA9ngYY9hRv3WCJs2SLCTLS7WEi5JZwiWgFcJhG+zUg8sB9yXKpAgdgXKiJS5+P3GI
 /Xcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUulENBBjFeDUSIf1r+X6XQH6HdYGVlYQkHTMUvDIImwn4y1urydqPlwsD6elA0DZOGDCDgLs2/5w==@nongnu.org
X-Gm-Message-State: AOJu0YyKKlTpQHnmKEy5Wt5qJAU6/aEk1xaCESMk85tYzgdAZAHRuZvI
 Y2LHCwcg1tvPTBhqlsYINKvJrXSJZ2K3B0VNiMntX49S4QvO4YATGw5n63B1LUI=
X-Gm-Gg: ASbGnct7vAJfEaQUmYf9vPALTbEnYdHwC8iJblntgx1licvARcY0OZ0XUkRoJX7MBZq
 xtgEtMxhsZfxhJXkfTjF7W0fMgX6lkJtsMF4aO9cUE98p3aweFH8zWudxT8a4ShrZAQ23HnvP0G
 HjK4xP9xtketXs1VnKju6iUiGi0kt+QzbxjwnQ82tJ+6Gx65vg0sOkNIeg5GsjyAWwgbMP25MK5
 InL1xCxuYlZywm2DwNV/7+hTlRvgM7OaPEt4yNnS7hLMJoNElUuZ1neqYLjhj9g8+HP4isPsr1r
 XeRWGQgljkJY/RAuqhc/V1Gg
X-Received: by 2002:a05:6000:2cc:b0:385:f138:97ac with SMTP id
 ffacd0b85a97d-3861bb5a565mr532650f8f.1.1733343998156; 
 Wed, 04 Dec 2024 12:26:38 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385df74157asm16690526f8f.0.2024.12.04.12.26.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:26:37 -0800 (PST)
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
Subject: [PATCH 06/20] target/sparc: Implement CPUClass::datapath_is_big_endian
Date: Wed,  4 Dec 2024 21:25:48 +0100
Message-ID: <20241204202602.58083-7-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204202602.58083-1-philmd@linaro.org>
References: <20241204202602.58083-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: ytF6TGZH3/FT

While the SPARC data endianness can be changed at runtime,
we do not implement that; only big endianness is used.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/sparc/cpu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index dd7af86de73..de0386dbf64 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -688,6 +688,20 @@ static void sparc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
     qemu_fprintf(f, "\n");
 }
 
+static bool sparc_cpu_datapath_is_big_endian(CPUState *cs)
+{
+#if defined(TARGET_SPARC64)
+    /*
+     * SPARCv9 has a couple of PSTATE bits that set the endianness:
+     * Current Little Endian (PS_CLE) and Trap Little Endian (PS_TLE).
+     * We don't implement that yet.
+     */
+    return true;
+#else
+    return true;
+#endif
+}
+
 static void sparc_cpu_set_pc(CPUState *cs, vaddr value)
 {
     SPARCCPU *cpu = SPARC_CPU(cs);
@@ -958,6 +972,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
 
     cc->class_by_name = sparc_cpu_class_by_name;
     cc->parse_features = sparc_cpu_parse_features;
+    cc->datapath_is_big_endian = sparc_cpu_datapath_is_big_endian;
     cc->has_work = sparc_cpu_has_work;
     cc->mmu_index = sparc_cpu_mmu_index;
     cc->dump_state = sparc_cpu_dump_state;
-- 
2.45.2

