Received: by 2002:a17:906:4a0b:b0:a45:b507:d90a with SMTP id w11csp990342eju;
        Fri, 15 Mar 2024 06:11:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyt+Urv6/IV9SCCQ2UpZtEIhRKUFwt6P//mpcTa13jjC2J3GRd9YEeV72DnTUxO/ey3Zp0PwSLRriltVfT8bc2/5pSxevO
X-Google-Smtp-Source: AGHT+IFH7ve2vjnxUDchoxEmmiL5FwiOVrWAo4uf1ZaPIYuNEZYBFSSI3NS1QwygrD266+1sTHWL
X-Received: by 2002:a05:622a:648:b0:42e:def6:3d31 with SMTP id a8-20020a05622a064800b0042edef63d31mr5111597qtb.49.1710508280638;
        Fri, 15 Mar 2024 06:11:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710508280; cv=none;
        d=google.com; s=arc-20160816;
        b=ubY7TWLOWogkbM27XhMd/LKcwDy/8CvUMHlqZbVdj613gSCrXpnqWxeNydJxuJKsUC
         RNXbIU7cIbK3fXVuYMaQbajMLjyC0PXsfweizlvHy/eWHSEhcGn1IV7B8ezRy942p1/6
         dIYiZVZ43lfTPSNG4BYPyLrMD8dxi2VuQng9w/ZCVyUw918pyp+g89gCKNs8l9bBf3VO
         3tDycGJg1dJjbKXzkZzV6+fEmSiLV/Hp/aLEUIFFbBI6TxhXkCtt8RR3EPj2w3AyPvb4
         bcdeGemgVEfUHCpYPzAezn9WIlvl/QIRVh8MgIWbP2rmfjtE006rHC1DyY+wK+uteiVl
         /wgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5sxhd0rb4V/HdCcNYSiwuf6DPCAi6g3IEdE6KnOG7L8=;
        fh=4lKl71M+EZqdMhmb8d5pYEfiLDUrHPKCRoyhvIH2j0U=;
        b=zrNCChfrKJnatmTtOW7CHdtmOoD2EPCHp/PYrAX0PL/uthucEPhTrlIeKN9zbgBLPI
         Iqudt+UfNdh0SXwjNcrG70phE4LX/NY8gb4eSvXf28dF6/XJqAuTMSSQ1JKC5PTeyE0b
         5R7HDTLDcgocplRJhIhHN2mFMxz+/lboUEX8ampvDj9QZxQwqkT1Zk6aMNmsf5WJGzk/
         BaDYb1MGCNqqf79NAKpKJ7TwtGINcUumGsgYTmFM4bixTY22B3pTmu9929cuaWjgup46
         6oCNBx9c6Xd1h/nwhEkDMlFapJCjzyVvpB6VLv69CWpKFm0xBVjERHoCKKZCBL3u4LSh
         dy5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=WkMssXfp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19-20020ac85bd3000000b0042f0d2d2b75si3618432qtb.71.2024.03.15.06.11.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Mar 2024 06:11:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=WkMssXfp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rl7KA-0006ZM-G0; Fri, 15 Mar 2024 09:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7Jk-0005s7-FD
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 09:09:49 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1rl7Jh-0007jB-KC
 for qemu-arm@nongnu.org; Fri, 15 Mar 2024 09:09:48 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1dd9568fc51so18573515ad.2
 for <qemu-arm@nongnu.org>; Fri, 15 Mar 2024 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1710508183; x=1711112983; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5sxhd0rb4V/HdCcNYSiwuf6DPCAi6g3IEdE6KnOG7L8=;
 b=WkMssXfpQ72/546c6pyY8+dYrdEaCQmvalRNFzut6jAw+LNz3bNan/gotAO3MPX7Nu
 GA64tUdLJeSuLtCzEfbg7Fz7FWvBgfRtiGiFTY9jHrGo38dxD759FsnBwUxca/CIoEVV
 UXH5udjMpKnkN6umtNiIwDldsISyHwZ96uAbwERajHP2372iSSUMwjoU7s/5w0tzY8N+
 K2AcTob0iMtgk6gb3NbcXrg9AbkV76qxVTzbOu/t16c5YMJdVFqkab9cNZlos+BXCCA4
 q4mLJg9L2q4Owvtg5C44ny82k7pRaLYG/T/sP4Pya9F2Rn7Mxpttr6iF4rl3yBdYTuFh
 z78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710508183; x=1711112983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5sxhd0rb4V/HdCcNYSiwuf6DPCAi6g3IEdE6KnOG7L8=;
 b=n7d6ZxNpPFuv7CKFiCp3jBDHHM6rZ6vsSNHKUw4ImDpWhY+Fq8HxE/PCmKY1OE59ya
 pJHVRGhdy0s+EVlTzYrdAomTYgDbkZ8AOo7oFOn+FIkEqp/CcwfRGEGhtj1ZtxWkb+b7
 APrfg9RH1iUao1dExOVp1AbtqiyIHhn/iDREmLwVQJF3q5EJK8VuDcS0CoaHNYRZlf7D
 w+Pyv+T4fab58XdbknAGprD3DybOZc++C6tSK/eJF+6w3dpXe1LaP2aKNxZXWykxqTty
 eVubZtb2UVoCboRvYiTNd/RA5MiOx+ohMGHnuKPCiVTSIbKjwX/flqQETZcjzNbOLVrS
 p1rQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCryawRoGjnJY212mn0G7gm8GHaiCa45k+K8SvzPaG6SQBV4s2hluPiuyOcOCwoJrNl7HvqO8osQOM7L0yNXW+gJ8u
X-Gm-Message-State: AOJu0YzEy1ZNCMHb3Ps07pFTOLVBG5Q8dA6H5As3/37oh3hCA2BtMYj1
 +CE8mBJ7tOHVwy1niHLg22e8zYYfZM8hYEYm7B6aWhRK34sB9U+mT7HRhrEHQEk=
X-Received: by 2002:a17:90a:e016:b0:29c:403b:ea2e with SMTP id
 u22-20020a17090ae01600b0029c403bea2emr4309258pjy.49.1710508183338; 
 Fri, 15 Mar 2024 06:09:43 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.184.12])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a17090ad40300b0029c68206e2bsm2886663pju.0.2024.03.15.06.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 06:09:42 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alistair Francis <alistair23@gmail.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Haibo1 Xu <haibo1.xu@intel.com>,
 Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 05/12] qtest: bios-tables-test: Rename aarch64 tests with
 aarch64 in them
Date: Fri, 15 Mar 2024 18:39:17 +0530
Message-Id: <20240315130924.2378849-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
References: <20240315130924.2378849-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 5pSNpAqRs5Qg

Existing AARCH64 virt test functions do not have AARCH64 in their name.
To add RISC-V virt related test cases, better to rename existing
functions to indicate they are ARM only.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 tests/qtest/bios-tables-test.c | 35 ++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 21811a1ab5..ea3ba1992b 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1557,7 +1557,7 @@ static void test_acpi_piix4_tcg_dimm_pxm(void)
     test_acpi_tcg_dimm_pxm(MACHINE_PC);
 }
 
-static void test_acpi_virt_tcg_memhp(void)
+static void test_acpi_aarch64_virt_tcg_memhp(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1650,7 +1650,7 @@ static void test_acpi_microvm_ioapic2_tcg(void)
     free_test_data(&data);
 }
 
-static void test_acpi_virt_tcg_numamem(void)
+static void test_acpi_aarch64_virt_tcg_numamem(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1672,7 +1672,7 @@ static void test_acpi_virt_tcg_numamem(void)
 
 }
 
-static void test_acpi_virt_tcg_pxb(void)
+static void test_acpi_aarch64_virt_tcg_pxb(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1745,7 +1745,7 @@ static void test_acpi_piix4_tcg_acpi_hmat(void)
     test_acpi_tcg_acpi_hmat(MACHINE_PC);
 }
 
-static void test_acpi_virt_tcg_acpi_hmat(void)
+static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1901,7 +1901,7 @@ static void test_acpi_microvm_acpi_erst(void)
 }
 #endif /* CONFIG_POSIX */
 
-static void test_acpi_virt_tcg(void)
+static void test_acpi_aarch64_virt_tcg(void)
 {
     test_data data = {
         .machine = "virt",
@@ -1920,7 +1920,7 @@ static void test_acpi_virt_tcg(void)
     free_test_data(&data);
 }
 
-static void test_acpi_virt_tcg_topology(void)
+static void test_acpi_aarch64_virt_tcg_topology(void)
 {
     test_data data = {
         .machine = "virt",
@@ -2003,7 +2003,7 @@ static void test_acpi_q35_cxl(void)
 }
 #endif /* CONFIG_POSIX */
 
-static void test_acpi_virt_viot(void)
+static void test_acpi_aarch64_virt_viot(void)
 {
     test_data data = {
         .machine = "virt",
@@ -2135,7 +2135,7 @@ static void test_acpi_microvm_oem_fields(void)
     g_free(args);
 }
 
-static void test_acpi_virt_oem_fields(void)
+static void test_acpi_aarch64_virt_oem_fields(void)
 {
     test_data data = {
         .machine = "virt",
@@ -2301,16 +2301,19 @@ int main(int argc, char *argv[])
         }
     } else if (strcmp(arch, "aarch64") == 0) {
         if (has_tcg && qtest_has_device("virtio-blk-pci")) {
-            qtest_add_func("acpi/virt", test_acpi_virt_tcg);
+            qtest_add_func("acpi/virt", test_acpi_aarch64_virt_tcg);
             qtest_add_func("acpi/virt/acpihmatvirt",
-                            test_acpi_virt_tcg_acpi_hmat);
-            qtest_add_func("acpi/virt/topology", test_acpi_virt_tcg_topology);
-            qtest_add_func("acpi/virt/numamem", test_acpi_virt_tcg_numamem);
-            qtest_add_func("acpi/virt/memhp", test_acpi_virt_tcg_memhp);
-            qtest_add_func("acpi/virt/pxb", test_acpi_virt_tcg_pxb);
-            qtest_add_func("acpi/virt/oem-fields", test_acpi_virt_oem_fields);
+                           test_acpi_aarch64_virt_tcg_acpi_hmat);
+            qtest_add_func("acpi/virt/topology",
+                           test_acpi_aarch64_virt_tcg_topology);
+            qtest_add_func("acpi/virt/numamem",
+                           test_acpi_aarch64_virt_tcg_numamem);
+            qtest_add_func("acpi/virt/memhp", test_acpi_aarch64_virt_tcg_memhp);
+            qtest_add_func("acpi/virt/pxb", test_acpi_aarch64_virt_tcg_pxb);
+            qtest_add_func("acpi/virt/oem-fields",
+                           test_acpi_aarch64_virt_oem_fields);
             if (qtest_has_device("virtio-iommu-pci")) {
-                qtest_add_func("acpi/virt/viot", test_acpi_virt_viot);
+                qtest_add_func("acpi/virt/viot", test_acpi_aarch64_virt_viot);
             }
         }
     }
-- 
2.40.1

