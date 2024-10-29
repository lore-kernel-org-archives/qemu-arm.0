Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp539961njj;
        Tue, 29 Oct 2024 14:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWXVrJZKeI9j03CKTlOV/DIAizyZi82LjZCj8N+N7d4HuffppW4v47DN8TqeGRX9zPi1ex0AOlWx4Qmww==@linaro.org
X-Google-Smtp-Source: AGHT+IGOPVh0ttAEvgldhSbnHbpUk5REBf/J6HTtoPU5+5ds3D7092O5v1BnsoZx993kZbeJ390w
X-Received: by 2002:a05:6358:e4a2:b0:1c3:38a:212e with SMTP id e5c5f4694b2df-1c3f9b4b192mr694813255d.0.1730235619440;
        Tue, 29 Oct 2024 14:00:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730235619; cv=none;
        d=google.com; s=arc-20240605;
        b=cF4hLXFGm9aD96epLda8I03WrG/zFYlxVu0ArN9pC0VHHoaz9lWBLomA6aF5Q3STVx
         8P2pfUeY120SYQkumCj8TpgyPm4MrNvVhRhhR1WCxZ+LqBYMbiJr1ihuIzp4t1TC0Sju
         zJwfOm5aUVar9DRhOTV6foEnAgtkWljQ25GNP6K+lNp8Q3RPV1e1M4H5WppnIibZYkWv
         TLn2JcLhWezYemdrNfgT2w1jmgDaOzQansbe0lySckeyD3BWoLtd/eeW72HBVl7HA/kn
         DgatXhdNXV+i0yLxvZEbPWE1XEnIf3gXCrk6TbRoDzi54iG3PPkoGry6iI1OuLepS29h
         yeYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
        fh=s/oDKVTeEN0s1uZsIXJU9waQnNT9sbAJr67lzjyiW00=;
        b=P0s5OTCQ8MGMiLWGg1Q8cHMWPs/FxOrgy9LUfawAp/C+i1sslneNuDgkT7Ku7cZTR4
         SAGs5zPVGepwsWPGR6DnEdenFueX8pGqZqr+NMU/gG7Vs0b9fMYMuke5io+y9lp3tZ3u
         cE85D71ObWyp5C0DOkcZ90w4/+Bi7gti5iehjbvUOBzk1VFDLb9DRsMa8Ior9csW8hN/
         JOLOJdY+2mhG/wRCh/9iY7Wrn31yC85aTx10jfMwrieYoelg5wYaRk1mnff7ErcqpZog
         mgQR+WYKP9331HxPs5N5nSsW+bdhC+7AGY6qAGeOTMXwU2Q2krjnoZopIoJNUKQqZno8
         ispw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=kMlUSDpl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179a12203si119035206d6.291.2024.10.29.14.00.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 14:00:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=kMlUSDpl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5tIu-0003kW-N4; Tue, 29 Oct 2024 16:59:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t5tIr-0003hs-A9
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 16:59:01 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t5tIo-0005b3-QY
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 16:59:01 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c96df52c52so7413166a12.1
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 13:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1730235537; x=1730840337;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=kMlUSDplZlimCwjFF7xhjl0XDadd/qjZqJ0uw2ClH/ldiyQDRTGsdJ4Hiyw0ZxM7ZZ
 CQbARrvjlw8WTctNmYKaBpiKi0vcPpyLVVefOOj0CK9tnuY7o3HZWC/t83SO62ln3RcY
 ElGk4JdkEGwz9wiwaOlXO1xBwME+smJdwJtYjsPunkge3Ol390iyZ2uCUsMfZsEPFSxN
 TZoo1SyGnYQ6eugHkq08ScEpfsJ+OR116VGNq/5C46obf/otUzX21zQXIMu38jYZqZiJ
 6+ERjQRTLocdARM1hLDSwAp2Z24aL+0ep0QjACp7X8WY9ql+OqBqCiJHkMME3svQRNi5
 6sGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730235537; x=1730840337;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=mlzFHz0rgryafbzCcacnT1dfSSQxYdNVqJbPGRr6kfiyaxl79PUZuya0QjErMOwLLx
 hAaQih9JjWIH4ez4473oB425Sd9XQFCFvzJHsw9k/WPb2VxOeJrKlxR4jqYCnmVYc86G
 BFPgJPsx6F2+vigYEX6oxEt+ihdXcqHccZ9WkNorPy7DspSBsk4bnuX/5rTUL293em1a
 acXqp7QElPPFQBJzdP3iB3v99FGc23JeUH8J5NOC0lXlSEBfAYm+jgEcwRVOdgL7PA/F
 sk3k0SdDNwOVvxSKOYNrnVgmA9AQT0aCUJX33323Y0xBkixFe/39F5TNU56XakVy9WwJ
 lCtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/l7QtohDRP01zCrbl2ecTEpIEMDgL5DpCaAxpGjjUq5r7gK7I79lv6xBbSnY8aGsma+gO1Kkhdw==@nongnu.org
X-Gm-Message-State: AOJu0YwYitGhuNAaUXLNQUAQXWJ7Hb7W2oMzsryZSciM1mp2UzlGJOPz
 QPVPOcNaNper0V+uiYCBf32tKam4NJgsBU1moyso6ZLdXGYmq7BQ+cDIB6vmKw==
X-Received: by 2002:a05:6402:440a:b0:5cb:dcf7:fd35 with SMTP id
 4fb4d7f45d1cf-5cbdcf7fdb7mr6738813a12.13.1730235537139; 
 Tue, 29 Oct 2024 13:58:57 -0700 (PDT)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629d5besm4217341a12.33.2024.10.29.13.58.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 29 Oct 2024 13:58:56 -0700 (PDT)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 marcin.juszkiewicz@linaro.org, stefanha@redhat.com, mst@redhat.com,
 slp@redhat.com, richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Alexander Graf <graf@amazon.com>
Subject: [PATCH v5 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Tue, 29 Oct 2024 21:58:12 +0100
Message-Id: <20241029205819.69888-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241029205819.69888-1-phil@philjordan.eu>
References: <20241029205819.69888-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::535;
 envelope-from=phil@philjordan.eu; helo=mail-ed1-x535.google.com
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
X-TUID: GXgzmrfsCjLd

From: Alexander Graf <graf@amazon.com>

MacOS unconditionally disables interrupts of the physical timer on boot
and then continues to use the virtual one. We don't really want to support
a full physical timer emulation, so let's just ignore those writes.

Signed-off-by: Alexander Graf <graf@amazon.com>
Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 target/arm/hvf/hvf.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 6cea483d422..b45b764dfd0 100644
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
2.39.3 (Apple Git-145)

