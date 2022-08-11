Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp512588ejf;
        Thu, 11 Aug 2022 06:16:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6XUe5b0oyDxM9nw7itDZdweJVccXtpNeb19gfH77jcys5NloA20y3jIjfheReOonh3K1zF
X-Received: by 2002:a05:6214:2685:b0:477:1d22:f017 with SMTP id gm5-20020a056214268500b004771d22f017mr28759812qvb.96.1660223787086;
        Thu, 11 Aug 2022 06:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660223787; cv=none;
        d=google.com; s=arc-20160816;
        b=k1MX64m5M5gC75a2hL4j069H/idqsdYXl1iSSRcbsA+22sxxTjC7Cv+4Wh4lJjgOVl
         5THiWoYP8YaltEHWOJeqTFiLLkncft/CVR/Q/S+qNBTbK35Q1BL6jjy9/YFprmOkVMze
         RUYrkGH6Cetqdt5waAIKUC2Tz4ut13foexPqPBYWs0Qb57kYwviZGieayCGOL6P0FfPq
         F81iUsqYLw+NbOU3kWjgI1egZYlw7VSyppd+7Ct/NWDqhqV5hDFh7kpxT7A9gYirL38w
         dnIKYYqyTqzHku6j0v/PxwWLjRP/fciepUn0GdsUzJPsqU+YmzRTp4IfzdNeJTLu2k8A
         YRvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=k68GJCsXzp4pYyzictD/vspk8Hpg7R7QnHN8rfSxOlU=;
        b=mnRaGpBI98qUORoWSNslLvvuyrozixuThKSopxl0SEQ7geIsy5Xx1t0AZeLsist4qQ
         wtxhWVHrlU+MWF9cd6A/3b/KOXSqdZ6QMn4t4sHkwaCJDNgGiQyNgkPDTnXwHOSS0Clm
         JB9nN1dGCaRMwdmNfRQcgrKmQEl7WiBIxw8eUvIXE5HJhtiYyH2GpPqzzFQc+NjDgGEV
         tFG5x4gg1HH+pG0VfxJJOXXO+SotWcJ18hZWCmqObb9CWOc/vwzby4uYqwWecyO+KdOi
         2MrqKwCUPwHZKIj75WuPzGkvr1JpBOJKhKg3EmZ6LJ2qD8zDKjsxpbt04V8AprmTQkVQ
         oXpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBTQiJIC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs7-20020a05620a470700b006b5fabb4c7esi1656816qkb.537.2022.08.11.06.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 06:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZBTQiJIC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oM82z-0003h7-7J
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 09:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oM7yH-0005PT-Oy
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:11:33 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:43757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oM7yF-0002S5-Sg
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 09:11:33 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 ay39-20020a05600c1e2700b003a5503a80cfso2651688wmb.2
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 06:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=k68GJCsXzp4pYyzictD/vspk8Hpg7R7QnHN8rfSxOlU=;
 b=ZBTQiJIC215CmXzdV37UFZ4WCS42JrrBrEZVMf2Hp7Xo43l3MuX3fKDOC73dljc5WD
 qQEfb79zsPeeddg1O+UkdspzHmiMhpD8F1WLv5pcwTXFZDFC4qFvymHMk2cM5+C80yJ+
 1DoesFboaPFvNf+Czl4vXHjctZIxOBzICxOy1ZYO10BNVtcJcEP1vwQt50w4/NlsYxRw
 hu8AoRwAcOzYLCJBLztYpzEu19t3+xa3AB460K7ef3wq51gMBQRrN/+13mkNaGqarxc4
 mKwK+JB6wFtIAVh3jLJbcNRJeEfJfuLc2vMwm0Z4NAsRbzfU7e7mFY0O7+0XnuJl+Xxk
 77pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=k68GJCsXzp4pYyzictD/vspk8Hpg7R7QnHN8rfSxOlU=;
 b=B20xiFVYj1aUN8/eJxzekRHUt1Z+XloQgMUqCe+HnkB+9tXVLf9rls/mpkkRZ8LXGy
 J2uK5VcLHofUO2pbdidw9gqFrgPQqMpyhVgQtYbbxY+pQ7b/VodJumsWnN4MdTzKtXmN
 t9Ov24+fioBgcgO2puRRCwX8Ua+UxAgEIOEoEATABzZp2Km3PgHYnohNLc79K9s/xJdp
 O/szgICjAVILx08L1rmASqKc4AofjdS0nI8QBQFRPIc6WLyQqOnMZ7oEI3d7IE/Ke98i
 ypgVfoRuDl4EtpimdKb4/LK2UjLjaRAo5hjil6dFlGHFK/lGMDQcgyuvlPyPqlpSI7lc
 pl3A==
X-Gm-Message-State: ACgBeo3NUV/ffkm8e2lA+IpAvpqU3h6GIQjrrtIs/97+ihsj1iPfHEax
 9ypcf+XDe3Xd1OwyoIQ20YF90w==
X-Received: by 2002:a05:600c:1c83:b0:3a3:2631:2fec with SMTP id
 k3-20020a05600c1c8300b003a326312fecmr5448604wms.155.1660223490337; 
 Thu, 11 Aug 2022 06:11:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a05600010c300b002206261cb6esm18785693wrx.66.2022.08.11.06.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 06:11:29 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH for-7.1] target/arm: Don't report Statistical Profiling
 Extension in ID registers
Date: Thu, 11 Aug 2022 14:11:27 +0100
Message-Id: <20220811131127.947334-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 02c3Z8X5qPHS

The newly added neoverse-n1 CPU has ID register values which indicate
the presence of the Statistical Profiling Extension, because the real
hardware has this feature.  QEMU's TCG emulation does not yet
implement SPE, though (not even as a minimal stub implementation), so
guests will crash if they try to use it because the SPE system
registers don't exist.

Force ID_AA64DFR0_EL1.PMSVer to 0 in CPU realize for TCG, so that
we don't advertise to the guest a feature that doesn't exist.

(We could alternatively do this by editing the value that
aarch64_neoverse_n1_initfn() sets for this ID register, but
suppressing the field in realize means we won't re-introduce this bug
when we add other CPUs that have SPE in hardware, such as the
Neoverse-V1.)

An example of a non-booting guest is current mainline Linux (5.19),
when booting in EL2 on the virt board (ie with -machine
virtualization=on).

Reported-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I think we missed this earlier because it happens not to be hit if
you boot the kernel into EL1, only EL2.
---
 target/arm/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 1b7b3d76bb3..7ec3281da9a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1933,6 +1933,17 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 #endif
 
+    if (tcg_enabled()) {
+        /*
+         * Don't report the Statistical Profiling Extension in the ID
+         * registers, because TCG doesn't implement it yet (not even a
+         * minimal stub version) and guests will fall over when they
+         * try to access the non-existent system registers for it.
+         */
+        cpu->isar.id_aa64dfr0 =
+            FIELD_DP64(cpu->isar.id_aa64dfr0, ID_AA64DFR0, PMSVER, 0);
+    }
+
     /* MPU can be configured out of a PMSA CPU either by setting has-mpu
      * to false or by setting pmsav7-dregion to 0.
      */
-- 
2.25.1

