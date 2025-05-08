Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp430396njb;
        Thu, 8 May 2025 06:42:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVB6FcOSP1zi26N1PYpxfuPd4U1zrPyxV4rlYTkTUmkmbf1okbwSQ4F/2tBbyXTyKYwSMeTGCA+heeCoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG0RZS46FR46JJkHuSOmRCUK6x79dPTqAqE4egE0ikd+8C8frL0TGJgutPQRzpCkop6OpNN
X-Received: by 2002:a05:620a:2588:b0:7c0:b490:2c26 with SMTP id af79cd13be357-7ccf9963d07mr553993885a.12.1746711772663;
        Thu, 08 May 2025 06:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746711772; cv=none;
        d=google.com; s=arc-20240605;
        b=froT54uyZ8Q4GwY0Do3tQ7zEK+ja8PDhC9BWIOH401bRa0ZLcGyiN8Oks1B/FNHxrf
         HtJEku/XsC+PkzMKLD8YL2afPGnNabH133LUU6ayc5b4mY+5l8hoIj6e1CpfxB/JD89W
         YgIH98gA7vt2beQMaRo70dOdJT5ecizOqeXryI14b0ihxAXtXGpIcoRJM+5Ziif88Qk2
         wZdQEse1FedRz+Frw5Yj+akbrOc/tWovnyhKCtU6oFnjmmng9VtOy+JpblYD64MKu0b+
         eywGQRi31uj7rKjylbvj7/twbLIvnKTgXS6NwJCvxslLmGe50+bBJUMmxw/YB/VDTUpI
         47jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zEKZAR/VZgMFUr6PYFqtHtppbGxXvaRql4Q5kTcH03k=;
        fh=ktwPVSaa06pmtQDpsCI+6K2otWvaKMEb07avjedxYd4=;
        b=TGDo0tNyC/Uh+RWbAkxBICBJj+lYDCjMPlBLTkBPEYOx2GgmnKZDz5FgUag/IO0JjZ
         7KEcbFKOqYOEozQt+cQQedpgmpDdrTFfE1yGBpmcRi5R2WIb6Jpt+33pAn0GfoQSMdPT
         wtEPae9K+GsGbFwda7plTBcWTrVyPCCtl+ghiI6W9vMsBDN55EyYtrTQp9GNpmCsC5xV
         S/SvfFUblcYfB/uE8gUnv3q2kK9qcTjX/ueQOxYwb8nFUIuZBsSh5EybJMm70N1M2d5c
         tnAW6PyLhdad6LZyIMAWb/ieAOPgBYZrVkUA7KfMZPrTgCbg3M+B6scgpQV9mCEzPqRS
         R9lQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QDlobytF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf7596a93si437929685a.285.2025.05.08.06.42.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 06:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QDlobytF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uD1WK-0003r7-5G; Thu, 08 May 2025 09:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1W8-0003kf-Pd
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:42:31 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uD1W5-0004ga-LK
 for qemu-arm@nongnu.org; Thu, 08 May 2025 09:42:27 -0400
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-b200047a6a5so432845a12.0
 for <qemu-arm@nongnu.org>; Thu, 08 May 2025 06:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746711744; x=1747316544; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zEKZAR/VZgMFUr6PYFqtHtppbGxXvaRql4Q5kTcH03k=;
 b=QDlobytFiUCP5MMBsbHeXpXcF3D7zGK+ybfv/zzhMfY86T0316LdO8RMI8Ak45i26U
 a6sE/C8hEGADJni5eQ3J81k6AvANmlGEru1ID3fKcJ2N/+Mk2j9vn7a0FUD/L7uhTKfM
 rCkHjqMhLDUHE2kVATpmEd0h80dK1YqfuWK8WBYe0XZSKrH1TGDKYhz9JGdr2OxvYM41
 iipdGn+1oP/RDRhnbgJxqKPz9irTeON9Xt66BFO5UEO6b+FWqz2Si0Zf69k6FLeKKCou
 PMhsmZ1N4KzHrRebgn3UKIiRwcUyA0aqQtSghMIt9ctZkZeF9tn/Y6DMQ4z2RUlJHDTO
 3hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746711744; x=1747316544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zEKZAR/VZgMFUr6PYFqtHtppbGxXvaRql4Q5kTcH03k=;
 b=YIzKFaTFCWUmKLjxlZVFpEOnAVRVUmky3Q4ksuPSezGTGCmipA1VZCalA1suEKc0yQ
 PH46d1UsopQveQ/h3OQLaSm/NEXBc/ro1tdHY5slc4tt77TyoxSlfezPIzAiH2cu0a4e
 j4qDsFgtGWUUaAlztrdyfT8q1uCixRWldqM9e0AXqFZovYwp2csRLNCmypKR9ahZLysr
 Rpiv7f6IXrJ6+2t5bCdd4uO0w9Mx99adITmTt+DOrXnB4Hec4K2wUtCkEdb8alYBACOT
 jPHNwTqG+86KnOd6V8LSwy9W/MD5ubJiMdZY85be9hI886+DSKpLUN0mDLqRglkPC9lH
 YQvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmJssYdnMJadYeF/qyZIEbDOgHlfDehf/yorpBAHhrXu1b6Lh9lPbLmJmGAoithrvhsrv2RR9soQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz72yFJ2rEpY/5sq0j1oGMmpe5qc8gHSVo+VMJMQlp6qViPaBDQ
 //6LGQf4QLE4N1AFOFY1286Q+A4cE5hcgnteFm1D1UF3jEiJYO0foGjCfc5ufE4=
X-Gm-Gg: ASbGnct7vlJRrZqQGZqi9TYkBI2K6HSnci9CDRFSC+Iei54hebu9GTR4sGJkQieWpVp
 w2UOO4ooga2pUaHrO2H1JUx9w/XaTDqknEmVJ8FiYEOP9MgfFoSjhxaLTwoJlnquntXwA+dJXiz
 a324laU/p9OMGqH2y9JtuP6GyV3toC4yuyZORcMeUJaKX16HxDYbgS4tYEzMYQgb4OTHxqLlYK4
 CeLN0XLcJ7N4d6aVby3Yr4MiSnD0f3DHztg0l06bBD5nMclmUK8rRfdmj0gsjfLg/IUW0zOlgno
 kjuyS/+apLjLySlZo0c4q8SqNFPIWeBdQH1k07QZHNvXg4m1gLI6BCTszGeNeQ2OEBEIQk+0+5P
 BoHBYHdu9vmzpvqg=
X-Received: by 2002:a17:90b:3b91:b0:2ee:8cbb:de28 with SMTP id
 98e67ed59e1d1-30adbf18acamr5563077a91.8.1746711743871; 
 Thu, 08 May 2025 06:42:23 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30ad4d2f15dsm2382033a91.18.2025.05.08.06.42.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 08 May 2025 06:42:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v4 17/27] hw/i386/pc: Remove deprecated pc-q35-2.7 and
 pc-i440fx-2.7 machines
Date: Thu,  8 May 2025 15:35:40 +0200
Message-ID: <20250508133550.81391-18-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250508133550.81391-1-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=philmd@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: +HOHowecp50i

These machines has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") they can now be removed.  Remove the qtest
in test-x86-cpuid-compat.c file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/pc_piix.c                   |  9 ---------
 hw/i386/pc_q35.c                    | 10 ----------
 tests/qtest/test-x86-cpuid-compat.c | 11 -----------
 3 files changed, 30 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 98a118fd4a0..98bd8d0e67b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -755,15 +755,6 @@ static void pc_i440fx_machine_2_8_options(MachineClass *m)
 
 DEFINE_I440FX_MACHINE(2, 8);
 
-static void pc_i440fx_machine_2_7_options(MachineClass *m)
-{
-    pc_i440fx_machine_2_8_options(m);
-    compat_props_add(m->compat_props, hw_compat_2_7, hw_compat_2_7_len);
-    compat_props_add(m->compat_props, pc_compat_2_7, pc_compat_2_7_len);
-}
-
-DEFINE_I440FX_MACHINE(2, 7);
-
 #ifdef CONFIG_ISAPC
 static void isapc_machine_options(MachineClass *m)
 {
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index b7ffb5f1216..a1f46cd8f03 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -648,13 +648,3 @@ static void pc_q35_machine_2_8_options(MachineClass *m)
 }
 
 DEFINE_Q35_MACHINE(2, 8);
-
-static void pc_q35_machine_2_7_options(MachineClass *m)
-{
-    pc_q35_machine_2_8_options(m);
-    m->max_cpus = 255;
-    compat_props_add(m->compat_props, hw_compat_2_7, hw_compat_2_7_len);
-    compat_props_add(m->compat_props, pc_compat_2_7, pc_compat_2_7_len);
-}
-
-DEFINE_Q35_MACHINE(2, 7);
diff --git a/tests/qtest/test-x86-cpuid-compat.c b/tests/qtest/test-x86-cpuid-compat.c
index 456e2af6657..5e0547e81b7 100644
--- a/tests/qtest/test-x86-cpuid-compat.c
+++ b/tests/qtest/test-x86-cpuid-compat.c
@@ -345,17 +345,6 @@ int main(int argc, char **argv)
 
     /* Check compatibility of old machine-types that didn't
      * auto-increase level/xlevel/xlevel2: */
-    if (qtest_has_machine("pc-i440fx-2.7")) {
-        add_cpuid_test("x86/cpuid/auto-level/pc-2.7",
-                       "486", "arat=on,avx512vbmi=on,xsaveopt=on",
-                       "pc-i440fx-2.7", "level", 1);
-        add_cpuid_test("x86/cpuid/auto-xlevel/pc-2.7",
-                       "486", "3dnow=on,sse4a=on,invtsc=on,npt=on,svm=on",
-                       "pc-i440fx-2.7", "xlevel", 0);
-        add_cpuid_test("x86/cpuid/auto-xlevel2/pc-2.7",
-                       "486", "xstore=on", "pc-i440fx-2.7",
-                       "xlevel2", 0);
-    }
     if (qtest_has_machine("pc-i440fx-2.9")) {
         add_cpuid_test("x86/cpuid/auto-level7/pc-i440fx-2.9/off",
                        "Conroe", NULL, "pc-i440fx-2.9",
-- 
2.47.1

