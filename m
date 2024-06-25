Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp699112njc;
        Tue, 25 Jun 2024 08:09:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU1cesZ/D2fPogvzgCwrAWEQ2oK3PPZCth6A7lu2xCp74eNqhMFZvi3YYT8GmFFTXnm/J+Wz8WpfG7RY8tmxMsra5r6FI1o
X-Google-Smtp-Source: AGHT+IFz3u1W5+otMn75acGtqZMieYuDHXyqIUPCV2efL8ieVuskeIH9KyttgbmJASyYrPJmUpu+
X-Received: by 2002:ad4:4f42:0:b0:6b5:51c2:9808 with SMTP id 6a1803df08f44-6b551c299e1mr62658536d6.26.1719328189111;
        Tue, 25 Jun 2024 08:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719328189; cv=none;
        d=google.com; s=arc-20160816;
        b=slkd/oPVojQMTgyqI9a/9HMNgrZEQ3REzJ1pERnPAG4YL4tu7u2jAHZr/+xwnAI/2w
         +y7n7sdjsPs3dUQZBR6Drm5sEvcaSo3dt/Zop1O/9o2pElYgk+PqfCNh7zgTFVmuPEbO
         3jySRyAZbnrE2aYiQu3K/YN461lTtcRtUqdx7MjP7KsWzag8PnQLFnBSFwK6Ith5gz1W
         4sowQ+p2YAhCqJbKeJCyFepOoGdVjkZ4m6QVe0TjkFQ56f+NUWs4kYWUfTdaWflIWWj3
         RZw6yJ+8u71sPgfVcrSGBKvKDLGT8u1mTl2jYqBDU1Sxc9sR8nQlU7Y4U4OORYOXcLMH
         rgAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PRln+4308vpV60KhA9A1rXBcQH2LHd5SKFisrtf+G0s=;
        fh=x0oiYYYu4sNHznkBZ/msH1eMT7BzEdiEUeKnWtFsuPw=;
        b=myTqebU1NnytuzUt5tFsbGXBDiypxiMGnXawXH/reUNRnqd55A7ESNS6XSTvMR1a3T
         iH33KLlr7fpsjhKxdVZ8EQTT+O3nQGdLIf5rDr9jjsIIhecwhapujYDA++0Or4+HMwqr
         P9cw4/WUIjLJ9cko4+bZ2OQnJ1RzJ8Gl9PHnfpV7vjLoDTUb9ca7ijQAN2nLP4/Urasp
         WC+x82awr44o6RiYm2cMDWLtU7WbcJCmwJDEahB1Gs4TQCyGqrm059CojxiDC8YwYICl
         12VpM8X3TwuFpeeS4Js9Jd/Tjb74CpH//c77wagmJh9W6fLipnd1uKsmQNhWAKkf4g+N
         ZbzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=GvKXCBwb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b51ef2be2asi108898396d6.455.2024.06.25.08.09.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 08:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=GvKXCBwb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM7na-0001fx-G0; Tue, 25 Jun 2024 11:09:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7nZ-0001ei-ET
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:09:33 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1sM7nX-0006X7-L4
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 11:09:33 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-70670188420so2317686b3a.2
 for <qemu-arm@nongnu.org>; Tue, 25 Jun 2024 08:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1719328170; x=1719932970; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PRln+4308vpV60KhA9A1rXBcQH2LHd5SKFisrtf+G0s=;
 b=GvKXCBwbYwPFlvTJb+duBHznQvGAXovNsF+M+nf9vl2TO0+LIOCrBCk/2MOoBy+PoL
 nfoQm+nOqR6t2bZfh4kO3JGfbmxHKJ0zVGlNLZc2N+f3fitoeZs2dTS4SXRBeAuDs56d
 QAve6LgdfjWCKoSJnlRPjWKyuJFdgr2/8D1BQ+KstnQBOfwrkiIaHNB7SpGD/dFOLGCs
 NpLdJ8QrbJYUIJDL0+CagtYpJB5Zyq6NVZADIj2NvOD8HHVQNgoMeXn+hvzB6DuRJK11
 6J/6fHXYbElbC3I4PssslPLJpsEWP/b1DIQTLKfgU8kPrwcLCXMAPFduPScMxqCgK+Cc
 VyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719328170; x=1719932970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PRln+4308vpV60KhA9A1rXBcQH2LHd5SKFisrtf+G0s=;
 b=T+RMKTWSKuIrpD0ziHhdxSGWY8EmlvgTGXfhfHwKUVOJzGkOfGxP7jLIKRcsyp8OWS
 D27+VJzhT8iCZ4hON/BxIkRyEX6WlZ/ANSVbrpoBS3JfCClxcEnCB5kv/E6pdoAcsS1H
 kvtBfxL4EG6x+v+wOstFyWWOmv0iAS3/Mu/YurvlNZoBOIIIO51tIbSKZ3lZ7ut6Z4kf
 TqHldhndBxi6jMOYlD8+j42d6Gy6Id7MPl/mlDLR5/h3pHSqpYIO2Ewh4/7zpc/UN11V
 JrZlhXtxkmJAkf1vpYDvYesZvBhAJUOO94Wh3P4DJ5PvY+FqHAEoh7ffhdqAtlz+CtrR
 6jNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTPPqer8B0ivuq1eNZvo2dovB4lPn6oZVq8r1eSVHlxgoPK/HUImg2C4nXwhxXGnaU5jRm2x6s6ikQEQviJZwVUAeb
X-Gm-Message-State: AOJu0Yy4kaXkbCAfxGaJH3RLNuAfSwUwRRHOao3MDmwfezLyNEOtr4xh
 n+Rez/l9/YvA2S0gms9P7/7nAy4OentUozywouqndElJGxkuIz8Ws9BO5SiYoYQ=
X-Received: by 2002:a05:6a20:3c91:b0:1b4:c499:788d with SMTP id
 adf61e73a8af0-1bcee6ebcdcmr9481045637.15.1719328170158; 
 Tue, 25 Jun 2024 08:09:30 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.187.237])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70681722219sm4142636b3a.73.2024.06.25.08.09.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 08:09:29 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sia Jee Heng <jeeheng.sia@starfivetech.com>,
 Alistair Francis <alistair23@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v4 07/16] tests/qtest/bios-tables-test.c: Set "arch" for
 aarch64 tests
Date: Tue, 25 Jun 2024 20:38:30 +0530
Message-Id: <20240625150839.1358279-8-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
References: <20240625150839.1358279-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pf1-x429.google.com
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
X-TUID: mVvUvvjmm+Qd

To search for expected AML files under ${arch}/${machine} path, set this
field for AARCH64 related test cases.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/qtest/bios-tables-test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 29c52952f4..007c281c9a 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1591,6 +1591,7 @@ static void test_acpi_aarch64_virt_tcg_memhp(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1684,6 +1685,7 @@ static void test_acpi_aarch64_virt_tcg_numamem(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1706,6 +1708,7 @@ static void test_acpi_aarch64_virt_tcg_pxb(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1779,6 +1782,7 @@ static void test_acpi_aarch64_virt_tcg_acpi_hmat(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1935,6 +1939,7 @@ static void test_acpi_aarch64_virt_tcg(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -1954,6 +1959,7 @@ static void test_acpi_aarch64_virt_tcg_topology(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .variant = ".topology",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
@@ -2037,6 +2043,7 @@ static void test_acpi_aarch64_virt_viot(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
@@ -2213,6 +2220,7 @@ static void test_acpi_aarch64_virt_oem_fields(void)
 {
     test_data data = {
         .machine = "virt",
+        .arch = "aarch64",
         .tcg_only = true,
         .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
         .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
-- 
2.40.1

