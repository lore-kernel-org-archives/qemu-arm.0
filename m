Received: by 2002:a0c:fe87:0:0:0:0:0 with SMTP id d7csp2048519qvs;
        Mon, 8 Jun 2020 04:40:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVvt2esa74eyYHOssC8DS2ZBRAJZ5F1J1LcYmBwDCags9+W4pXh4KFHyz+5QXvuG3b+A5q
X-Received: by 2002:a25:3295:: with SMTP id y143mr36693660yby.321.1591616454529;
        Mon, 08 Jun 2020 04:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591616454; cv=none;
        d=google.com; s=arc-20160816;
        b=RUPGcy4NE9v6QyvF/BUAn10MtxWcntVDHwifoRKUW4xDtTSO6FYlfoIt5w9HuR9ior
         W+AO46vgmd0zo38FxfctUEFBiJNU+xTnoLidTS6RsPqqEj3Kl4Bjs/PXZ0klfEyvvw7C
         Edp+gMUflCyrrME+DX1pjLUAqQye3K3oTwGM515Bvm9Mjhvb6d7CnE2y5kUrpvfw301o
         OGd00PMaj1+9u7J01bXY2hiD2eKDJskKgmYDkc/J41ExmjclVCn0YFjVAnXvZ7w94532
         zWeLWjYr/egCxLsKRgHFnYZvtn+KRK9v3fvsPtoltun6X8GZqIYK7zA2WhjoZUDrtPaF
         Pwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=r1862+GaCeD5wjtcdsVBrJdgJrDEKBNZHNQ90XZwnrY=;
        b=I3H/d9eLyu3PdovViFFEMJhUgv6Sht+lGL5XWh6iP3r6N8lCLd7Nn/AOPg9sFX5lLf
         ulv+zu5kDqIdb/r1K5a3CLKz+LX99bjQHRazHfCPWBTRK6j5vM7OF82fv9ZRiOCltbdX
         Sk4R32n1QmxcmoIjsHCGs3n9vVG7p3NaDOXKH4oJdhucQE33aNWVR9lbDHKBwtO+dhhY
         n+ZP8OX4unMzaryZc4risZX/ekSv30ywlAzEQ4um7j4NeWtcBpcfQhKbhxZ1FFPXHETX
         2B6RVo3C4zvVPxefR3qoRg+zBkv1eJG9qJh8SwSpjdSXQarVpFJHCZmTBStqikMOT2l6
         vmZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=xL+R7nqn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o137si6946747ybg.278.2020.06.08.04.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 04:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=xL+R7nqn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiG97-0008CX-Uz
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 07:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jiG8p-00088W-VM
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 07:40:35 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:46852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1jiG8o-0003cv-K9
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 07:40:35 -0400
Received: by mail-wr1-x442.google.com with SMTP id x6so16963780wrm.13
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 04:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r1862+GaCeD5wjtcdsVBrJdgJrDEKBNZHNQ90XZwnrY=;
 b=xL+R7nqnPTn/XmS1NNzKgIxtOkDDz4dJJViyl137ms4PuuS1x+jwT+qYCzLwpuVmkh
 w87WTK5XyCQmQDoMxJE1gq+JJ74iTkJjf+rMKoHyOXXwW2xgYUrr486S3XQ8fKeUGPnO
 YzJ5BXLLxLy5eHuv0XKiUnmMKKN7xQOvhblxV4CWXzRxwPqDGhaG1xGsqeWdbpbApRRA
 +/hpl/WCuMQ5HyuGd9qfm+AwWm47a3iZUGOIH8lYbRj4/r+sJXM0iO6054yNkUd0Lvhz
 DEjqubtxD165ZEt0l6BvupxQ4m481ZrO4S3JJK99K8omRFg/CRwtDrCQssM9eiPln5Ru
 HUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r1862+GaCeD5wjtcdsVBrJdgJrDEKBNZHNQ90XZwnrY=;
 b=fJckdOKYnysCdBmT7yZwWgRwcEccTzyS0/2vACa3z+wT9lbH0GHPAkf4+uoCIRt+0R
 ViA/eAcjcx1YsPbDmE4ygpNIV4xrI1Q9qZkNCExlF3tEUOkk4s03WI4PqrC+IC4sSCco
 SNDfzvBjTwpzJQ4JQTcCI1cMTqVdvSHuR/7RNkh6aLBORcxlFJecPyNHD1bbMXQ73Lyl
 6A5hHl0nlFE8kA+K4LwuOc0ScPs7kR20EBBV/PFN+/UVeX+JX032Fhg/2CHV5UBnW1Os
 5gG7Ui7zPA4+z8Dpvu3DV7F7p8M/bcumZ2wgaU0EH1Nb8yA2ov4zwyuk5HQ58vs0vNWN
 keRA==
X-Gm-Message-State: AOAM532sbtWcif4/uIoKTN87Uadjwnv8h/KhvWtm6HoQ3xHNFFfmYXlk
 v4GcwNcZadHqcN7OnjBW/6yef/lkqOU=
X-Received: by 2002:a05:6000:1c7:: with SMTP id
 t7mr22944357wrx.14.1591616433083; 
 Mon, 08 Jun 2020 04:40:33 -0700 (PDT)
Received: from vanye.hemma.eciton.net
 (cpc92302-cmbg19-2-0-cust304.5-4.cable.virginm.net. [82.1.209.49])
 by smtp.gmail.com with ESMTPSA id y5sm24225932wrs.63.2020.06.08.04.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 04:40:32 -0700 (PDT)
From: Leif Lindholm <leif@nuviainc.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Subject: [RFC PATCH 3/3] target/arm: use cortex...common_init for cpu64 max
Date: Mon,  8 Jun 2020 12:40:28 +0100
Message-Id: <20200608114028.25345-4-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200608114028.25345-1-leif@nuviainc.com>
References: <20200608114028.25345-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FfcbEm3rGczf

Drop the call to aarch64_a57_initfn from aarch64_max_initfn, replacing it
with calls to aarch64_cpu_common_init and cortex_a72_a57_a53_common_init.

Cache and GIC configuration is now set directly, using aarch64_a72_initfn
as a template.
Set cpu->dtb_compatible to "qemu,aarch64-max".

This has the following effects apart from the ones mentioned above:
- kvm_target will no longer be explicitly initialized for cpu max in tcg
  mode.
- id_mmfr0 will now be set to an architecturally permitted value.
- define_arm_cp_regs() is no longer called, since those registers are
  implementation defined and specific to the supported cortex-a
  processors.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu64.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 9927c1f75d..452efe78bf 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -561,26 +561,20 @@ static void aarch64_max_initfn(Object *obj)
     } else {
         uint64_t t;
         uint32_t u;
-        aarch64_a57_initfn(obj);
 
+        cpu->dtb_compatible = "qemu,aarch64-max";
         /*
          * Reset MIDR so the guest doesn't mistake our 'max' CPU type for a real
          * one and try to apply errata workarounds or use impdef features we
          * don't provide.
          * An IMPLEMENTER field of 0 means "reserved for software use";
-         * ARCHITECTURE must be 0xf indicating "v7 or later, check ID registers
-         * to see which features are present";
          * the VARIANT, PARTNUM and REVISION fields are all implementation
          * defined and we choose to define PARTNUM just in case guest
          * code needs to distinguish this QEMU CPU from other software
          * implementations, though this shouldn't be needed.
          */
-        t = FIELD_DP64(0, MIDR_EL1, IMPLEMENTER, 0);
-        t = FIELD_DP64(t, MIDR_EL1, ARCHITECTURE, 0xf);
-        t = FIELD_DP64(t, MIDR_EL1, PARTNUM, 'Q');
-        t = FIELD_DP64(t, MIDR_EL1, VARIANT, 0);
-        t = FIELD_DP64(t, MIDR_EL1, REVISION, 0);
-        cpu->midr = t;
+        aarch64_cpu_common_init(obj, 0, 'Q', 0, 0);
+        cortex_a72_a57_a53_common_init(cpu);
 
         t = cpu->isar.id_aa64isar0;
         t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
@@ -680,12 +674,24 @@ static void aarch64_max_initfn(Object *obj)
          * and enabling SVE in system mode is more useful in the short term.
          */
 
+        cpu->reset_fpsid = 0x41034080;
+        cpu->clidr = 0x0a200023;
+        cpu->ccsidr[0] = 0x701fe00a; /* 32KB L1 dcache */
+        cpu->ccsidr[1] = 0x201fe012; /* 48KB L1 icache */
+        cpu->ccsidr[2] = 0x707fe07a; /* 1MB L2 cache */
+        cpu->gic_num_lrs = 4;
+        cpu->gic_vpribits = 5;
+        cpu->gic_vprebits = 5;
+
 #ifdef CONFIG_USER_ONLY
         /* For usermode -cpu max we can use a larger and more efficient DCZ
          * blocksize since we don't have to follow what the hardware does.
          */
         cpu->ctr = 0x80038003; /* 32 byte I and D cacheline size, VIPT icache */
         cpu->dcz_blocksize = 7; /*  512 bytes */
+#else
+        cpu->ctr = 0x8444c004;
+        cpu->dcz_blocksize = 4; /* 64 bytes */
 #endif
     }
 
-- 
2.20.1

