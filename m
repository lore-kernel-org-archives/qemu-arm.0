Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4907311lfm;
        Tue, 25 May 2021 16:01:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoLLpfoRd4PF3T6n483aa1vlEzt7mldWf5oJNSSg1Oip0KikySWobfVKZs60BgjJIW2xjq
X-Received: by 2002:ab0:c07:: with SMTP id a7mr16393290uak.120.1621983718380;
        Tue, 25 May 2021 16:01:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621983718; cv=none;
        d=google.com; s=arc-20160816;
        b=WQHa8zsWTKNhSIBsKi/gq6AGWR9lio7pdnAx0bDEbNGTwQTM0FIZdsI0+KHwVndzRE
         KcobFTOc8XOh4UELr7gl9HNJn68VRC2yz4NG0/pGFidt2Uat9+vW1f0RnOIEEOQuR+9h
         NcKOzw+iwgH7Rpl4jiPIYas/rzJvjlRglYbA3/l09om1gEm+PJ8MNMM3B46eNl+weUr/
         ASB17e4sR1lokhlqL7Z1kaPkKva8AgxHh42JIAyyXEuRdOKHeFelyGHjefgkSiO8Yatj
         SeVeoI4pvaEfIPgCV9YNU4d/rFRwfGLSEAN57EQLuCCkg549xkJqodjDRqhvalR7IWpV
         ybRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=sbiH4B8cDwF4+AJH0qZkvnuJ9P1hwbVxNhJbCa4tUSo=;
        b=F4V7nXBrkCH7qbOMVr6JlHrmIsEap8dMDyfIGWlM2GAoxlRiBjcyc5YVyOb1UtOAph
         D31CsZtTWgWR4rvh1me3+sz6EA8gC0FqvDEPXGrbkVYNPLURyOz22qZErlHoh2kueZGz
         dGgiAR9N5jS5DGuGhhKNA9vgGbQ5f8AwGCa7etOQDLmeiCQyhz8KXJj/5Tp46ju3OKtJ
         W745i78xWEo5JzKyPwFCM7iIdQ4vFli4o0VakUMTNzOY+17Rz/cEQagNae0POddOPCSH
         qKT0ybc+0g/pMO7rnwBO+nnRMl2WqOwPLLW75LF2smJ6TQa/xckAHorAuV5EaRBRrb9t
         i6Gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r4QJTz9A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o186si4427085vsd.246.2021.05.25.16.01.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 16:01:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r4QJTz9A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llg3h-0002HN-L3
	for alex.bennee@linaro.org; Tue, 25 May 2021 19:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0Y-000310-PB
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:42 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0M-0004rP-LT
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:42 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 ml1-20020a17090b3601b029015f9b1ebce0so4823216pjb.5
 for <qemu-arm@nongnu.org>; Tue, 25 May 2021 15:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sbiH4B8cDwF4+AJH0qZkvnuJ9P1hwbVxNhJbCa4tUSo=;
 b=r4QJTz9AFyAFUCVnt/zfvO0QbBvlQDBHQNDm2SKMjN9+YzS/H9TXk4TUdzRDTopo0x
 zr39DKYBzyybxcpTN5O/+vxHD+2bTwiPaQM/PwQUCp7XQLJJkF6TZ5bw3SYoROYfiQgt
 V/+F7Hnm/Y51bLOId4u0j2ltv8OgBgWAB2l+aEh31YLzG0AIkxaiuiTinBEekKIRUD93
 WkK2qH1bE3FR9MVphPee9Z5hxTiFNEDZ99JpPA5wa95hW10Ny6OJZutfZ33GWWdhQmLA
 zY81A9Q0oxSywYVmylcas5tC3UreGshOxzmsSzJTjCxwIoLPKeDLgOvRj+EJa4OG0Cw6
 cYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sbiH4B8cDwF4+AJH0qZkvnuJ9P1hwbVxNhJbCa4tUSo=;
 b=JeqssbPa0fJGau/+pQvuW2M2kJRGzO44nRvlk9X6qDXQZMHk8bRUo2wXN/8iApmdH2
 IZXavp+8rwU4xMauW8ctp9fmMv9+4Y53jGWY5H1y58/r3p61RkB6xkUa6ii91tl8hjEW
 PI9ZRYobi10nPyGmSN/w8phM1rj+rrCYx556W4cYT0W/Exxu4i2ALVbnTK2EUwCx1vrN
 72fcnNXu74JZE7LEufvSATmwut4cWUvIHBhILCszlBrwlX43wndk9ltf0Crumr11/5Lj
 LmzKKRAMC3xzv9W2EoD77N8ClosQYdvrDljjGIzGZ/DLRyNqeEBd11f8pSo8RoDBMZwW
 t9iQ==
X-Gm-Message-State: AOAM532BnoZzI6leoZdPoFTJBAwJCD3u3pI2XcaWJLmWUsk8FKknfKrb
 nBC3aDU4EFLZAR4/udv6025P6A==
X-Received: by 2002:a17:902:7792:b029:fc:e490:ff9f with SMTP id
 o18-20020a1709027792b02900fce490ff9fmr2428756pll.27.1621983506246; 
 Tue, 25 May 2021 15:58:26 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/12] target/arm: Enable BFloat16 extensions
Date: Tue, 25 May 2021 15:58:17 -0700
Message-Id: <20210525225817.400336-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KNo9VibvL1Uv

Disable BF16 again for !have_neon and !have_vfp during realize.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c     | 3 +++
 target/arm/cpu64.c   | 3 +++
 target/arm/cpu_tcg.c | 1 +
 3 files changed, 7 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 7aeb4b1381..cfc03c550b 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1463,6 +1463,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         u = cpu->isar.id_isar6;
         u = FIELD_DP32(u, ID_ISAR6, JSCVT, 0);
+        u = FIELD_DP32(u, ID_ISAR6, BF16, 0);
         cpu->isar.id_isar6 = u;
 
         u = cpu->isar.mvfr0;
@@ -1503,6 +1504,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
 
         t = cpu->isar.id_aa64isar1;
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 0);
+        t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 0);
         t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 0);
         cpu->isar.id_aa64isar1 = t;
 
@@ -1518,6 +1520,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
         u = cpu->isar.id_isar6;
         u = FIELD_DP32(u, ID_ISAR6, DP, 0);
         u = FIELD_DP32(u, ID_ISAR6, FHM, 0);
+        u = FIELD_DP32(u, ID_ISAR6, BF16, 0);
         u = FIELD_DP32(u, ID_ISAR6, I8MM, 0);
         cpu->isar.id_isar6 = u;
 
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index d561dc7acc..1c23187d1a 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -661,6 +661,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
+        t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
         t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
         t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
@@ -708,6 +709,7 @@ static void aarch64_max_initfn(Object *obj)
         t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
         t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
+        t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
         t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
@@ -731,6 +733,7 @@ static void aarch64_max_initfn(Object *obj)
         u = FIELD_DP32(u, ID_ISAR6, FHM, 1);
         u = FIELD_DP32(u, ID_ISAR6, SB, 1);
         u = FIELD_DP32(u, ID_ISAR6, SPECRES, 1);
+        u = FIELD_DP32(u, ID_ISAR6, BF16, 1);
         u = FIELD_DP32(u, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = u;
 
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index d3458335ed..c8a12bc2d6 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -968,6 +968,7 @@ static void arm_max_initfn(Object *obj)
         t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
         t = FIELD_DP32(t, ID_ISAR6, SB, 1);
         t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
+        t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
         t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
         cpu->isar.id_isar6 = t;
 
-- 
2.25.1

