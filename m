Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp526271njb;
        Fri, 13 Dec 2024 07:28:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUElItW0l9LEiitrQ4f/XCoNkwD7Hc/y3bBHR36AehdtXGRDr1FJx/dq7OgGbgTM54SyVepcn+4vofoBw==@linaro.org
X-Google-Smtp-Source: AGHT+IHvlX5fcvFqm9T8r5eo/0+1oDuy527Use+8tOIYSLpUYwdHK2K1DMVV0R1bnW7joGXSDmkn
X-Received: by 2002:a05:620a:40c6:b0:7b6:e931:45fc with SMTP id af79cd13be357-7b6fbf44412mr487224885a.59.1734103722466;
        Fri, 13 Dec 2024 07:28:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734103722; cv=none;
        d=google.com; s=arc-20240605;
        b=jPphr35Eae1fQo4YNY9KieE+GLCLWKmvB5t35eCiRyfDtfNZhDuE/gqXuJJM87Ku8F
         bFJ56IHn5ROR4g0Dq8MHW3sw5DLyJ80WJXUeJiNtxPOSUiwDIiscMPPIqLx0woea1zeP
         gpkqOOfrjSBjgFo3/Qm2TBxRyRWNTESUny5Nk0akVr/UMCrZX7ivyFSA1SXkj+/tXegN
         GK1z7M1ORdo/xfYuk3s6OJY5r5F9CMC/sxFEmPStfR9mpaaSi4FyJxtOpWqT8wkABvzk
         mCD7QYpc9Ehz8YjrzlUL+O7+aB+1Npn7OhO8ZSES96iAPHQYzGNJS/FI8WoUuM8T3Wmi
         +WuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
        fh=X7ZwogIEyHB/6JeVfvHrPwxlogWgZqbf2m8LKzFJk5A=;
        b=eqo9nW2gLgO56bGRnDiva2O8HSWKoQnBGcTtq7DP9OxpsIgxIS20NytqLG2Vn/Kmwq
         6uYAqzJmhe2+Y6qyY+iU9Ndc6cooCHnYw3bsVNDj7oYK9jPFUncqhIXDex3qCYjeVYyC
         77CAi6yOkdSARNicsgwTtzkFRnzoAxKcVmDF8i8OT/LYDCc5oCHjfjGahmtDXbFnqv1I
         9D+gTUt/UZuUTHdhevBFk7mUqkKPfcXF34p5jCFFRzW0Wf9GIQ4SfSY65An6j374o9cB
         5hALDuo46pMvN6RHY3Po2kaBBaRsII2iu7Z744Os2AnNdbMdklkmpYFdCJzpUITqWUh4
         HJJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="Mg/48fs7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4677ef07563si74289511cf.104.2024.12.13.07.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 07:28:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="Mg/48fs7";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM7SE-0004zK-U8; Fri, 13 Dec 2024 10:19:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RY-0004QP-TY
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:19:06 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tM7RP-000597-9c
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 10:18:59 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d3e8f64d5dso3335974a12.3
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 07:18:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734103132; x=1734707932;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
 b=Mg/48fs7F5xz9lLSIsD7ur3qb5fJt+LVbDjCqR450zyt+5+xCZwAwqy72LY8/MGdmx
 nYS3kyldjBoum04UNsDV9dM8Pt+XAJP6b4TkcwSNgNTk9PDKyCxTCfo3h8jbyubvv0K9
 tfCa+TFI1Dpg9sSilvRH2PPpRWqdhXFQCMf/Pxq7MLYMVljL8lGLF5NOLv3XhqP6QZiw
 FyvP3cyPgX2zjkqCoxS0zcgYsCW36zFQCVB+MkSKxR1Zt2Xh9LdZMqSEoWziXC7yeQIf
 5KLTK/qT2vKLQAYVi/hY446QDxeBwFfBwvqkK4v+XPd8B3SFtBxU4w1dsCcj8PihMQvn
 aDYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734103132; x=1734707932;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbiG06Qj2eVtNM1RZ8Zpr4IJcnCvDLdL2ENhuYJnNHE=;
 b=gOpuJvoV61OmF0anRZ6XyA6pScS3Kr8QeoKwSnvXDfBfCh4BzetG1GPAMqzUqxk4Z9
 49Lrx+v5xgKtAChxnKizwBOt4WPqplrVqKuqYqbjYT2mQtRTF2qUIt4RA8XcmNLrDfkn
 Ty/lU8IkU4hdEQ1ukThg8kgljvhfsGwKgMF+o4Hcu17JyOW77rX4bkMspg4LHYszOYh+
 bEnwbiiuCQqC9QHxl4GGHgNEAoA4i8onNzZ5JQY9KdaJBn/9YD1EiVUAS9ilQy7g4bSr
 haed7d/b/U7Cwh86whv3m5K/UrY6S6SrdQzOFRY5FLV0py1dq211SMzOGuSrHbpWcYFt
 LgVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLJdleeXOR9WNEBs/2k2WAQkEnGy7VYY//WcJn3T1qqHnPs36zvFx6pKZaNE6rSA6CX7Xb3YSKIw==@nongnu.org
X-Gm-Message-State: AOJu0YyY4kWEQduKIanM6Jn6ersrybCOz7nxHxjkDsg38lYcKH0OSbrA
 F8sbqWhKRcHOhPrG+qFuKQ6bO04o/spR3xbrRbDkNSVg7Hcof/QCAb62kLp2eg==
X-Gm-Gg: ASbGnctKUDs6pfK+z6tBbGx6dEOlLVahdQ1T1DWujY7oKiM6v34xcILkyBdjVmtK6OO
 UNDwQ/zdSwAN6ctM8E5KKEx6kZGGG5omQmufYKF3Gj2pS9EYnfIbP5EOiVl5C+MlmWyntaPeLuH
 BOoc31k1TBHxR64HoJPIVBGG6w6qAyLqMlmxwvE4CpP7ylfDLMeDH0UX+2C0TrnAVS1cWorZETu
 43xdZ7nxN+12o7IVp2WEEBkcTdmlXkbA/7LpSYLOFX6vaL0tjMHEBxOAk6zla0/KP1I81nSoiTK
 sKWw23y64BtEXXma73fou92MtxSfxAOv
X-Received: by 2002:a17:907:a08a:b0:aa6:8bb4:503d with SMTP id
 a640c23a62f3a-aab778c9cc3mr328990866b.2.1734103132294; 
 Fri, 13 Dec 2024 07:18:52 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab8dd35b19sm29284166b.33.2024.12.13.07.18.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 07:18:51 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, balaton@eik.bme.hu, Alexander Graf <graf@amazon.com>
Subject: [PATCH v13 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Fri, 13 Dec 2024 16:17:58 +0100
Message-Id: <20241213151821.65748-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241213151821.65748-1-phil@philjordan.eu>
References: <20241213151821.65748-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::531;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x531.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: HGhRRCbRutOl

From: Alexander Graf <graf@amazon.com>

MacOS unconditionally disables interrupts of the physical timer on boot
and then continues to use the virtual one. We don't really want to support
a full physical timer emulation, so let's just ignore those writes.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/hvf/hvf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index ca7ea92774a..d75e504dcda 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -11,6 +11,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "qemu/log.h"
 
 #include "sysemu/runstate.h"
 #include "sysemu/hvf.h"
@@ -184,6 +185,7 @@ void hvf_arm_init_debug(void)
 #define SYSREG_OSLSR_EL1      SYSREG(2, 0, 1, 1, 4)
 #define SYSREG_OSDLR_EL1      SYSREG(2, 0, 1, 3, 4)
 #define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 14, 0, 1)
+#define SYSREG_CNTP_CTL_EL0   SYSREG(3, 3, 14, 2, 1)
 #define SYSREG_PMCR_EL0       SYSREG(3, 3, 9, 12, 0)
 #define SYSREG_PMUSERENR_EL0  SYSREG(3, 3, 9, 14, 0)
 #define SYSREG_PMCNTENSET_EL0 SYSREG(3, 3, 9, 12, 1)
@@ -1620,6 +1622,13 @@ static int hvf_sysreg_write(CPUState *cpu, uint32_t reg, uint64_t val)
     case SYSREG_OSLAR_EL1:
         env->cp15.oslsr_el1 = val & 1;
         return 0;
+    case SYSREG_CNTP_CTL_EL0:
+        /*
+         * Guests should not rely on the physical counter, but macOS emits
+         * disable writes to it. Let it do so, but ignore the requests.
+         */
+        qemu_log_mask(LOG_UNIMP, "Unsupported write to CNTP_CTL_EL0\n");
+        return 0;
     case SYSREG_OSDLR_EL1:
         /* Dummy register */
         return 0;
-- 
2.39.5 (Apple Git-154)

