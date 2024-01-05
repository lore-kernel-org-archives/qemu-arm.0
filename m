Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp793207ejo;
        Fri, 5 Jan 2024 07:46:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUwIXm3Yfeyz5w2OQHRgJNU4wacQdVDXSWjqD6e0z/ALumFaFW8X7ghLKY0N3L0VfVLryq
X-Received: by 2002:a05:6808:f8a:b0:3bc:28d3:198b with SMTP id o10-20020a0568080f8a00b003bc28d3198bmr2462674oiw.10.1704469598850;
        Fri, 05 Jan 2024 07:46:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704469598; cv=none;
        d=google.com; s=arc-20160816;
        b=eK/ejORoxkphVK8OivxW6YZnrXkfKSy9HepQ0MGh4XVojimVdALthvnJZbq3+CB6l8
         1lQby35m8OpLMaN9sS/qYAhUX5cPdrgL664PxzT7hTPxgOI/CbAO+qJEJ3Q8UeCrHz5r
         EJ26Vs2INKR1cD3ZyWqSbS1enT08Wye4nT3aPJ4Ybr59lUNQE11QDFXGMiqKxX2m9iV3
         Tx4j8/n6yb+z2NnkQHeBrYrfp2DGfqpoNnS1Y9ELr+rv64XKfDr5RkPScwuFN9+4944m
         orXl62gXKrXxciq+saiMSPkZMqoLiyy6dnhAkOkTp1ShHtgInM8P4nppjypdMCYWaZln
         zCeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u+LOg4cE3e/L+FkF/kdo/NDds7gIy3v+MrTgt4iIEa4=;
        fh=zfC841gdzgCR5c4QsvEdZ2DqqzAfHUewN2O6+kLU50o=;
        b=02DCg8i3BF/usGW4frAjh8ejzoQHT6aDzm5mcVrBHc+h7Nq1vjrBDBAJ+e8nyCE8ea
         JZwsNjdZlOQ6IMAO9IQVjUym7pH01GqbD23kQvnbzZK7MVixUOTFeiWl5H2aV8HTkCjL
         LW+AOA8dyPkeWRIhNN4Zth1JthSsaIxhNI4YXfbA31JwDKlQIjcmai/SPtXBBY2m21Uj
         FeeUk5P2xKH5PPdq6ygmvV10RWej0Mz+r1lfwhe1dK9swbbiEAoT9LYTlM7GNH5XhwcN
         N9MkcMxPLrog3aelpEYpFO5ndgTUHKdutMfSWS9ch6Bb0xxhAGYwKSvqwVWaja1VXfTr
         aZ7Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n5kSfdb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17-20020a0cb4d1000000b0067f65e91c16si1991366qvf.172.2024.01.05.07.46.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Jan 2024 07:46:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="n5kSfdb/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLmNU-00005r-2l; Fri, 05 Jan 2024 10:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNR-0008Gg-6j
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:53 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rLmNG-0003Lz-PP
 for qemu-arm@nongnu.org; Fri, 05 Jan 2024 10:44:52 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33723ad790cso1318616f8f.1
 for <qemu-arm@nongnu.org>; Fri, 05 Jan 2024 07:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704469481; x=1705074281; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+LOg4cE3e/L+FkF/kdo/NDds7gIy3v+MrTgt4iIEa4=;
 b=n5kSfdb/lfP7oDDbyCG5oqr7XHssSJaEsPSnUqsTFei00qGvkLC5F377mhnpJvZE/v
 pe1zbxhC7rYsHfDr+65vayV6/AelRC1ynexpKTGiDSUJddWM6m/EpBQ/fCL/rFzq429v
 Ies5iUwKXbTH0oWxDVWR8sIqeA8DYXe/lkEy4V63Uw4u6nQcsA+Ux6uvLRFawF55WJKF
 XOOVx3bzHJaD8hdAwnT7WpEtelvVEmbKO0kap2TItCVTL5G24Prh+j14VtxOnPm8/QNR
 PKbWArQzkF2Aj28LuacMuelFJJFoV5OHawvWr39qMV+4vM0libGicCScHhvOfzhpSTP7
 4Rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704469481; x=1705074281;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+LOg4cE3e/L+FkF/kdo/NDds7gIy3v+MrTgt4iIEa4=;
 b=Cq3MrP+gn8sAXKJXodNrL3P92D9HcwvFPACtmasNWi29uaOv/vzLR41oxsyaha31ok
 HhrtY+vjlIdH8YmJO/Jn1+FoDiag4sfYlvjc8QCwl9yFu5pL+9/PZJOfYvovByybuQLz
 230rfQB8ofWdFB9Hyy1R7PDlFI9m9J5zPGrRAY8PaeDIZH14QmibFwmJvpOgLUxvkxUB
 etIQ/2Iow8pcI11xZ7FMV5aeBB0HMbcVgDUyGIuVeTfse8qfQBpwpcKBDZ21wxPm3cCE
 J/XNOlJpBdgV6GMs9hufiffloKNhIiwYS8dum+qyhZs2nCu9+Sesa/jBBMn4sBw0wSWc
 ppHw==
X-Gm-Message-State: AOJu0YwSEV1GNwFfa1LOy2aGbRD9tbO1PTHV2/IiJOp5Didx9bCbGqhR
 +K0UtMW2oS+Vw6F91cTVBzfTkOx7TyajfA==
X-Received: by 2002:a5d:6445:0:b0:337:4e86:ebe1 with SMTP id
 d5-20020a5d6445000000b003374e86ebe1mr837995wrw.42.1704469481467; 
 Fri, 05 Jan 2024 07:44:41 -0800 (PST)
Received: from m1x-phil.lan (juv34-h02-176-184-26-1.dsl.sta.abo.bbox.fr.
 [176.184.26.1]) by smtp.gmail.com with ESMTPSA id
 f11-20020a5d50cb000000b00336ebf27d59sm1604796wrt.78.2024.01.05.07.44.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 05 Jan 2024 07:44:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 Gavin Shan <gshan@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 15/71] target/mips: Use generic cpu_list()
Date: Fri,  5 Jan 2024 16:42:08 +0100
Message-ID: <20240105154307.21385-16-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240105154307.21385-1-philmd@linaro.org>
References: <20240105154307.21385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: mqjw2UD1DvTt

From: Gavin Shan <gshan@redhat.com>

Before it's applied:

[gshan@gshan q]$ ./build/qemu-system-mips64 -cpu ?
MIPS '4Kc'
MIPS '4Km'
MIPS '4KEcR1'
MIPS 'XBurstR1'
MIPS '4KEmR1'
MIPS '4KEc'
MIPS '4KEm'
MIPS '24Kc'
MIPS '24KEc'
MIPS '24Kf'
MIPS '34Kf'
MIPS '74Kf'
MIPS 'XBurstR2'
MIPS 'M14K'
MIPS 'M14Kc'
MIPS 'P5600'
MIPS 'mips32r6-generic'
MIPS 'I7200'
MIPS 'R4000'
MIPS 'VR5432'
MIPS '5Kc'
MIPS '5Kf'
MIPS '20Kc'
MIPS 'MIPS64R2-generic'
MIPS '5KEc'
MIPS '5KEf'
MIPS 'I6400'
MIPS 'I6500'
MIPS 'Loongson-2E'
MIPS 'Loongson-2F'
MIPS 'Loongson-3A1000'
MIPS 'Loongson-3A4000'
MIPS 'mips64dspr2'
MIPS 'Octeon68XX'

After it's applied:

[gshan@gshan q]$ ./build/qemu-system-mips64 -cpu ?
Available CPUs:
  20Kc
  24Kc
  24KEc
  24Kf
  34Kf
  4Kc
  4KEc
  4KEcR1
  4KEm
  4KEmR1
  4Km
  5Kc
  5KEc
  5KEf
  5Kf
  74Kf
  I6400
  I6500
  I7200
  Loongson-2E
  Loongson-2F
  Loongson-3A1000
  Loongson-3A4000
  M14K
  M14Kc
  mips32r6-generic
  mips64dspr2
  MIPS64R2-generic
  Octeon68XX
  P5600
  R4000
  VR5432
  XBurstR1
  XBurstR2

Signed-off-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20231114235628.534334-16-gshan@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/mips/cpu.h          | 4 ----
 target/mips/cpu-defs.c.inc | 9 ---------
 2 files changed, 13 deletions(-)

diff --git a/target/mips/cpu.h b/target/mips/cpu.h
index 52f13f0363..1163a71f3c 100644
--- a/target/mips/cpu.h
+++ b/target/mips/cpu.h
@@ -1235,10 +1235,6 @@ struct MIPSCPUClass {
     bool no_data_aborts;
 };
 
-void mips_cpu_list(void);
-
-#define cpu_list mips_cpu_list
-
 void cpu_wrdsp(uint32_t rs, uint32_t mask_num, CPUMIPSState *env);
 uint32_t cpu_rddsp(uint32_t mask_num, CPUMIPSState *env);
 
diff --git a/target/mips/cpu-defs.c.inc b/target/mips/cpu-defs.c.inc
index c0c389c59a..fbf787d8ce 100644
--- a/target/mips/cpu-defs.c.inc
+++ b/target/mips/cpu-defs.c.inc
@@ -1018,15 +1018,6 @@ const mips_def_t mips_defs[] =
 };
 const int mips_defs_number = ARRAY_SIZE(mips_defs);
 
-void mips_cpu_list(void)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(mips_defs); i++) {
-        qemu_printf("MIPS '%s'\n", mips_defs[i].name);
-    }
-}
-
 static void fpu_init (CPUMIPSState *env, const mips_def_t *def)
 {
     int i;
-- 
2.41.0

