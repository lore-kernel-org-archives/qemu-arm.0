Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7A8CCFA1A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 00:53:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vIz56-0004RK-Dv; Tue, 11 Nov 2025 19:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vIz52-0004OB-Ea
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 19:51:24 -0500
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brookmangabriel@gmail.com>)
 id 1vIz50-0005oi-Ad
 for qemu-arm@nongnu.org; Tue, 11 Nov 2025 19:51:24 -0500
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-88245cc8c92so2105036d6.0
 for <qemu-arm@nongnu.org>; Tue, 11 Nov 2025 16:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762908681; x=1763513481; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fh2aCIWghB8nM6pqcbl6fjKLvG1B2Pt65byvOBa9TDI=;
 b=ARCqhY95axei1h4oVn5t0MAN85DANYGP/1c2qBLdlBQLFLQ0bdYh/u8a20m2J0URua
 JexpO+fVlA9PVMgQDLtkazSKX3r0g0uhWcqHNZKejYmN7z+Pk9VmDhx7ke0wA/oZoccc
 2zyoTqnqzsgbdQ1ro4v48gV8bRaI1QXOVZzlCuWKlCwoCGMWGcFspp04emaFmEiIRz7L
 7nJNIXYDvMc/snaGKbAJ+uXU8qVLOiUXGSxeDuA3VWEnMvCQA627ZUu6DxIv9oUk+jwl
 RFSyp86RVZ1+WZVdQt1AhbgRYenCEPoTqYKxg/UntyU36xHK1cDo+iszA6UiR2c5SLF6
 Fmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762908681; x=1763513481;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fh2aCIWghB8nM6pqcbl6fjKLvG1B2Pt65byvOBa9TDI=;
 b=KG3JoI64IbcQ3AcLHBk0VcpJxmhonueVGAxwn2BN2yVdzn08EQZgHujHAFDLDLWRi8
 xQISZ0VXaWOj7Itw5JixHVNBIhHE4zFMUetRy051IDNLmfvR+jpBKd6QoV5QOaAyZ0XM
 +sz+Lxs5FJmVIl3LEkVV1SXHejUHKW8KnFCQVZMeDvj5Iv4vfBKjZog8kPgfF+nDoBIW
 wLDlcI+idNf+uTb+wNoh7zgiowIE68QnWwuOB5rUm1RDudTmLHbMujOgSGfZZvPaN3B9
 sgSdY6ikkp00lxGCbT0raaNyNtOh/RKvDY+Z7wTOf/d02SfAw86J/FN8uwzu57mq9Q05
 kZFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbJuCbLBjxkObqxUFituXXhkTFQPwz4adAeYmJKZWcTZyr5giyW+tRyTZRgn/U/yS1HqpGM0In7g==@nongnu.org
X-Gm-Message-State: AOJu0YxRRa9aYs3zc7MQrReb22sknnIA7PkKm03N4/Iu61xZwVK54uaM
 zRnnCnhFcJRNRsoNagQdUgTsdxvB/wAKHs9pC5vaoqMLwpP/5t6kpHQH9/IQ+tYB
X-Gm-Gg: ASbGncvo1tvUb59tGfnY7jffjIfLwbFsJOEx9TJ2M4/rzIi0oGod3eyPTVDn+6BRUI/
 AA71MVnXVaFyJCzfqykBjqlFNognuEPC0LBIl/PGCrBtgssu5OhzVUn74nlnOnchEUMBE41C+V0
 1YhKSCHWnan5LPYbSYOnh6FYbgsCkGfd+WR4/60Rpfuj8pnwleHrMSVgGVCH5Sa7XnfiI3leung
 bLTcbXY/lONodiX47jdtzJX3g4e7maCoifZjam7a0EqFG1hlWvg0iwR//TFh59PcYmrDo8MIvqV
 wiDxE0qvhNcH7/mdEbc78RFZLFlBgQ92C2RhcsdnEkCxO1y2YYlqt3cdpyqgyC27cFwE7893YRn
 NMeWzpnayJHvXm/A9V/9KYOnApvFhTNvfvpS8zxejivRMeiJiaR0eHECHSsSnDRFLfbYRV93d0d
 rsQVMY6wck
X-Google-Smtp-Source: AGHT+IHEQZlNMbOZeyg6L1zEC4NyBGv2EqktTdunIX7nPHcQZJ7X1voTjiYfcgNKTwFqJswcpY5trA==
X-Received: by 2002:a05:6214:d4c:b0:87c:1d41:575d with SMTP id
 6a1803df08f44-882718bae09mr18412996d6.3.1762908680834; 
 Tue, 11 Nov 2025 16:51:20 -0800 (PST)
Received: from [10.0.0.22] ([185.213.193.149])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8823892a79fsm81445096d6.4.2025.11.11.16.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Nov 2025 16:51:20 -0800 (PST)
From: Gabriel Brookman <brookmangabriel@gmail.com>
Date: Tue, 11 Nov 2025 19:50:52 -0500
Subject: [PATCH RFC 3/5] target/arm: add TCSO bitmasks to SCTLR
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251111-feat-mte4-v1-3-72ef5cf276f9@gmail.com>
References: <20251111-feat-mte4-v1-0-72ef5cf276f9@gmail.com>
In-Reply-To: <20251111-feat-mte4-v1-0-72ef5cf276f9@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, qemu-arm@nongnu.org, 
 Gabriel Brookman <brookmangabriel@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762908676; l=1752;
 i=brookmangabriel@gmail.com; s=20251009; h=from:subject:message-id;
 bh=diZ9mUz1IQ4dvWZ2C/1aTcAm0Esme9Dx1H9yg3kKA/4=;
 b=r5fa684PEoey00HtYsRByLb2cVizA5nbHy8Q4vu6XYIGVFe8qgMYiC0AYV8T/af9UM8352pwI
 wVRcIPXgtn7DbicNIrrCMFYpQthtQ0h6Mr+MNmZmyC4qk1tmswk9QsZ
X-Developer-Key: i=brookmangabriel@gmail.com; a=ed25519;
 pk=m9TtPDal6WzoHNnQiHHKf8dTrv3DUCPUUTujuo8vNrw=
Received-SPF: pass client-ip=2607:f8b0:4864:20::f36;
 envelope-from=brookmangabriel@gmail.com; helo=mail-qv1-xf36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

These are the bitmasks used to control the FEAT_MTE_STORE_ONLY feature.
They are now named and setting these fields of SCTLR is ignored if MTE
is disabled, as per convention.

Signed-off-by: Gabriel Brookman <brookmangabriel@gmail.com>
---
 target/arm/cpu.h    | 2 ++
 target/arm/helper.c | 4 ++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 39f2b2e54d..2c7c76777f 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1424,6 +1424,8 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_EnAS0   (1ULL << 55) /* FEAT_LS64_ACCDATA */
 #define SCTLR_EnALS   (1ULL << 56) /* FEAT_LS64 */
 #define SCTLR_EPAN    (1ULL << 57) /* FEAT_PAN3 */
+#define SCTLR_TSCO0    (1ULL << 58) /* FEAT_MTE_STORE_ONLY */
+#define SCTLR_TSCO    (1ULL << 59) /* FEAT_MTE_STORE_ONLY */
 #define SCTLR_EnTP2   (1ULL << 60) /* FEAT_SME */
 #define SCTLR_NMI     (1ULL << 61) /* FEAT_NMI */
 #define SCTLR_SPINTMASK (1ULL << 62) /* FEAT_NMI */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 27ebc6f29b..32fbb2e25d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3364,10 +3364,10 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     if (ri->state == ARM_CP_STATE_AA64 && !cpu_isar_feature(aa64_mte, cpu)) {
         if (ri->opc1 == 6) { /* SCTLR_EL3 */
-            value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA);
+            value &= ~(SCTLR_ITFSB | SCTLR_TCF | SCTLR_ATA | SCTLR_TSCO);
         } else {
             value &= ~(SCTLR_ITFSB | SCTLR_TCF0 | SCTLR_TCF |
-                       SCTLR_ATA0 | SCTLR_ATA);
+                       SCTLR_ATA0 | SCTLR_ATA | SCTLR_TSCO | SCTLR_TSCO0);
         }
     }
 

-- 
2.51.2


