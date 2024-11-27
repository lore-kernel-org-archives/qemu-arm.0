Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp850484njb;
        Wed, 27 Nov 2024 07:07:26 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWneN1W+t+IGMeZjkf+68aJG62YX0GAEnrBzVrMkY8bLq6PcSI6c7m5XJIsibG/E2s8C2XIms0XF/MheQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHVbthsXCySM3tCw3DryFTEljYoWsDmgoH4MgOq4kTUdHN+srk7/6hhbGTCYESUphv6Iupd
X-Received: by 2002:a05:651c:b14:b0:2ff:5c17:d57d with SMTP id 38308e7fff4ca-2ffd5fcc09emr31044471fa.2.1732720045726;
        Wed, 27 Nov 2024 07:07:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732720045; cv=none;
        d=google.com; s=arc-20240605;
        b=JQWfWT/+z8ywEyGZ9amgNoRvY2wgoIK74mxdX77JnBd7VB4OuBzeiUHZmEJTdmb9cR
         9WOqa1CgoTXTO8QhrxisITcuwUGQis9xAoSmfO54r/C2ioRhkrNB6EuZFWRhxq/Em5ee
         Qo5Vk3S6oob+pYZV2Cx5n8qW9Ex33uhFXG6rzJrrXT3/Pb9MFmnm8dV+0GVHzM5J1hVc
         XEh8ciGze7n2Q4ooWsOFMMALI0jSVlMKDDMUesWLF43aoFdbnJB8Dc6P+rHYtxsOaWdH
         KjkTLJQbDMv6aauBauazshtlhNHq/HLK4Mjjewi5NlZTW0yUQUYIpactudMpNMn5zsmt
         Q7RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jHwSaHBvDOuggNzApud1KzwY/aX4UN5MIxFwz/8i6yU=;
        fh=LxHY9PyUKc99u2iwAOuST92LuvgHGdYzcqYl38IWuDc=;
        b=KszTnj9cYAIQx2eXtwWMwi/RGijBN72mWts5M7W0po5kZK5m21cit0fYRi+BEfD1LZ
         0Q1BjKk1PLhoGQR/ZfYcUlfqiM8RPObRvxAsQK0DTb61sRQHiCyX7IUXSM84axolvgER
         tfynPd9CqEo4f4NcodvglneMYQ+RKnjP5aJI2/iqvuIHwVXY5yTCPeNPyvpP1Jc21i4T
         4ndBWoibVwY1jQ/oxyUBqAEid+4EBdpBbwJdwjYOk6YjksgMpM80FoDDHC6V0ijZNfxQ
         uonUY8JzgunTV7XNEEHvjOGZO3T6GSBW381jbYlbgufo3M0Gw9EslgnckeSISFV82yRo
         c+0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=F9FP6Y8s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 38308e7fff4ca-2ffa5390257si43784501fa.418.2024.11.27.07.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 07:07:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=F9FP6Y8s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGJcS-0001PQ-4i; Wed, 27 Nov 2024 10:06:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJcF-0000oy-HB
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 10:06:09 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJc9-0008GP-Ow
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 10:06:05 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-434a044dce2so36132225e9.2
 for <qemu-arm@nongnu.org>; Wed, 27 Nov 2024 07:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732719957; x=1733324757;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHwSaHBvDOuggNzApud1KzwY/aX4UN5MIxFwz/8i6yU=;
 b=F9FP6Y8stHxnJe4qGsCeTTwNuH4xMwE6hM0qPoeOFtsajPRvxHsSbJ2asnBwph9s+d
 dpa50Is6XlVOBrDqQ+h7xlIZXcayueVBJbuYDTKit20zrw0VQZEXHUTRR6oDgsEV5Q6U
 kEEJ6VTq0RaIYk+Mw1odB7G/UoOSWyqnIG81Vya9MDsNH/1Fj8fz2LyKCtF+b4b54JtG
 P+DlS+2H7nhNROoTx6vi/w2+MO1xuDfiMHgsDbloNxx8XdsMssW8aBJvg56QHmJ5g60Q
 gRLEgAVrXGuLkf8LWgyrRUtJvvIc6qM0aRvgz0PacP3BMLfHisDT/hw2DpFbewQmcp4n
 ZEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732719957; x=1733324757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jHwSaHBvDOuggNzApud1KzwY/aX4UN5MIxFwz/8i6yU=;
 b=G2LH5I2TDq17z0etAufju6JLjmCyAJE4rf+5MgMniwGw7jcMuqCTF4TUWWX5JrkJok
 RLRzaKcwK1UcsGPSn28GvMg2Qam2GcLNJu+tIDbAFWujDHLT9ntjsgId+deZPezNoIU5
 3lMBNloF0smpSqZVw/eLaaLOKdWx1bQSfBbBtO9v5SAYVaNJ0dofaNFYDmP9uTVmbLo6
 7bPY/PFm3EKW38mna+XHAiv+sM3aAqTVy6p/JnXeevTz4HTsDBaYlStObRbWrqUZIAZ1
 BAYNabCo1mnMA/TWP21GvnEmpm//Y/fhS8rtMwEfKSt5R+cvxy8nNP+gMmuyS3+j8uij
 mDgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWigA4BEFrIBqY+5yFmbbkyq988kI2U0ikzVedF8SM5k0JJxlcW1F5wYa6JKb38U7jz+ymKgalDQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx30VtVGL+NcFudR67iKDSEB3UxJYvUnB9/F60J/g1EAnFmN9gQ
 hFOQtYI+43Eq8Ijc0WnJXa4HPn0RVeSO+riY0rvgTJacMHDy6w4VJUW2eJLXPQ==
X-Gm-Gg: ASbGnctztFawh0QijTBinNg+Mh4GHtDSFwzgTroqpHH+lUcpnhF3tUJYnXC5gjFZxOq
 zKGsZQa636lCwfgehabGQ2VMd9bC/Jkht/O9sEqv70ptTi7BeZuN0ANxHmtedU00Bo3J9JZTeXz
 bWBbGEgBXz4VORY0JHtcXSnqPnM1vrZracvL9ZdFRsJE8+smAfmK46/VgXMxOEzqUP15Uvl4sg1
 rEdrQphTjcCjzeTFh+GlRSMBmNTEvO0viuEQgbimCKfob4pf7JQa8FgqH8D59q06eCUSQByElnI
 5aZSt1lGjC6LskwQ+5GqUXQfXw==
X-Received: by 2002:a05:600c:3590:b0:431:5f8c:ccb9 with SMTP id
 5b1f17b1804b1-434a9dcf254mr39924575e9.17.1732719949435; 
 Wed, 27 Nov 2024 07:05:49 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7e256esm23339155e9.32.2024.11.27.07.05.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 Nov 2024 07:05:45 -0800 (PST)
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
Subject: [PATCH v11 08/15] hvf: arm: Ignore writes to CNTP_CTL_EL0
Date: Wed, 27 Nov 2024 16:02:42 +0100
Message-Id: <20241127150249.50767-9-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241127150249.50767-1-phil@philjordan.eu>
References: <20241127150249.50767-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::32e;
 envelope-from=phil@philjordan.eu; helo=mail-wm1-x32e.google.com
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
X-TUID: /EJQOd43PLmN

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

