Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp6255090njc;
        Sun, 10 Nov 2024 13:57:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8OjerVdgv4hxYSwadKdGIn0S6eUGOBOtkdbd3+ntsf4/HYr8En771E2+XcK5JFEG2qXfXVl+0IIJHng==@linaro.org
X-Google-Smtp-Source: AGHT+IG+szETSbe7xPtaVDzAqc7fsKIhtHf/Hc1LkVNqA2dHihJdYww2POEWW9hOa3jCdcn3C80q
X-Received: by 2002:a05:620a:f0e:b0:7af:cfc0:7822 with SMTP id af79cd13be357-7b331ec6088mr1463372885a.33.1731275822521;
        Sun, 10 Nov 2024 13:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731275822; cv=none;
        d=google.com; s=arc-20240605;
        b=iy9Q5CBWu9ATOJf9VQ0MhNlQNlH3OQsLApHrRgIt4rGCAKPXggleqaj6mhORb0UDr0
         sAcrEwsnUbPZFvsK/x9pj8ltAIbVLy8XKBQCIfdLiSzpUYBEBOE2czOshBc/+G+iHNVy
         I3e0QN9MqOoK0DFSZatTQa1KxdCaSQJNuz52t0vz4qLupaq+Kr9X9RxfRv/mvken0tsg
         RF6ZqAuB8PK10h9lj2nfnUENmnl9oTZht93z9ggJ2a6vdFTFasTXKnGFDgowVPV+zgYb
         nN0PWhjWUlncfT9mLSraQEsa3joSwGiL+HJpxRgvqi1QTAivY9XJNleNspRkGobb5dDY
         xnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
        fh=ikWsutu/FqWIu0FbGuNpMqazAFrBA9qjR1fhcO752ew=;
        b=NI39RqCFxVunk4+b6c5XV/KFcNgmazsDUCajDcCCA0GsqD/i3R8kPJA7HIsrxSdsDx
         rpiZWhjQcYCmlTCleNU243ggJ6xiLK9bhmd6QQczth7yqlVTILaXZw+2ObF8Wig35z/5
         v4aWvcbVte9Jeg5gQDRBoahRpmjrwAurInlPf8u41T1wMFoZ1SvASl/DUBj55kNOptE8
         0m23FaKgnpJUV+YFoo29jFawNKYKEicdiGGx96VXEXYKQhl51AuORjtDrtnwas5jZpQM
         Bfi91wapAC4CozNWeGjJMphMfWBWst+SvT1Jfcoyk6ITGee/m74n/dMy3pBhb8dL/cJs
         XU6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=fkzxlQcx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32acf8cadsi1031238785a.461.2024.11.10.13.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 10 Nov 2024 13:57:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=fkzxlQcx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAFuR-0003tW-QI; Sun, 10 Nov 2024 16:55:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tAFuM-0003nG-P4
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 16:55:46 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tAFuJ-00040Z-JB
 for qemu-arm@nongnu.org; Sun, 10 Nov 2024 16:55:46 -0500
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a99cc265e0aso609917966b.3
 for <qemu-arm@nongnu.org>; Sun, 10 Nov 2024 13:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731275742; x=1731880542;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=fkzxlQcxU547idvGrXJ+MC5R7FX+23Gbvfs39lgS5u8G5mF60FfB9R/DyqOs8hWLPq
 3AjZyOUYpUZZWDNNd2xt3OcDGZHEe4PhjAiplJnfcxVqFTZkifotAtZboL1zQdOBAZ3c
 VTRJPaYukcWq6oby/OAqA3pr+4pXuP8a5q1AguONORXJvUB04A+Evb6gC94855QMc0pG
 vibOx2GE7e4nGMce6mWnMpP1zpaY+CJC2WOm+HRbWNv8UJFyNHt4kG+th4YwXGRLqKJ8
 D859kLuNpxafxuyRy7WrH62WECRygaOQfBF+gw5gAxv8i15c+ZhxZ+eGFLDSP0GrEGtG
 QJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731275742; x=1731880542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IOlf/wzEJ+wM7g5BTurCACeEWddAq/2jF0kyAkwof9o=;
 b=Xn+AaFil1mFPA2MJaBYEv/l2Rz29VW9BWIV2r/i4e4dM858ds7mByp9+ELWt2H31Dh
 9ODWV9/QCGSHilkmcRYUdl/fF1aACWECWf6PHnJxUZ2LHhAF6K83kA3mwMTqSfUTO8Xc
 GLk6MD/JBn/Aj0L5hnoEZ+y+/Lxag0l2HZvV92alUW/7DUfd9Dblj6dYShlauB2CGGhm
 SNVdxACr6zYMR68U3WQ8AyOtbQNIWOb5xt01YedYMT78ZsGou9F/blTGXAZc6to7DVpE
 nyCYG3op1/r4Sp0pAngcz7XToPDM/5ayHZerQ0of/AKlp9to0goY+vcKjriYBolNIYXq
 U9Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfSy8U7PBLW/cG1yp/zzCP4Nb3H/gL83FaLLnikmDQtYF2zFTWyjh9Z1PEdVrEMXCVG4NcVW2azg==@nongnu.org
X-Gm-Message-State: AOJu0YxIXdET7KgtiA1jgNQFlBT3hIjILAASrgb6Y+K5g6hSMR2DpxXO
 DpVjHAvxbETIvKSPk3IO0NOcxJ84Ys7Ci6GXQCnkHlbGVjTXCESpKqUIA0KaOA==
X-Received: by 2002:a17:907:318e:b0:a9a:cf6:b629 with SMTP id
 a640c23a62f3a-a9eeff4458amr1035374866b.29.1731275742123; 
 Sun, 10 Nov 2024 13:55:42 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0e2f731sm523715566b.189.2024.11.10.13.55.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 10 Nov 2024 13:55:41 -0800 (PST)
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
 qemu-riscv@nongnu.org, Alexander Graf <graf@amazon.com>
Subject: [PATCH v9 08/16] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Sun, 10 Nov 2024 22:55:11 +0100
Message-Id: <20241110215519.49150-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241110215519.49150-1-phil@philjordan.eu>
References: <20241110215519.49150-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62c;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62c.google.com
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
X-TUID: 7wdu1oJpbmVG

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

