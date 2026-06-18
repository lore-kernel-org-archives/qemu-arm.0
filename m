Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78A9CD98DE
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 04:09:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa42R-0000z7-0z; Thu, 18 Jun 2026 00:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa42H-0000r5-Ht
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:07:25 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa42E-00044s-RC
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:07:25 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-36b9033d230so254515a91.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 21:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781755641; x=1782360441; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WpNsYyWVmO6gKZzGAp86+C2RznIhc/M7mB9FSTXEfXA=;
 b=tw7FTZjAXZGJ9BxZkv1AvuAHnpHzgoj3rJQ7XCHYHvCmHQSHvT1P/yHreW3pb9dNm3
 HDGKOTONxMDPByQfewtcRSLW1GzW7OzD6AB8pHGopRyUuouG4s63bF3n4EyOrd/254MH
 JtHoH6sHGf5MRWXPqeQXHjkWuUu4qLUMcDAv3DR9w8pTwmxSZCxyaQGK5HvoIfk6gCNP
 jKEiU8rzAXN41N1XVfp0IJLURofi7DGzRxUHoZzoi6cEoqOJuKRTd06gHfh1XOiE0SPq
 c6in7rllG1I1W2kmAveGdjvJ9Yu8lvVwde2xeX8flK1fMy1LmH/AGLjniOY+NlEmyaw8
 2NHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781755641; x=1782360441;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WpNsYyWVmO6gKZzGAp86+C2RznIhc/M7mB9FSTXEfXA=;
 b=mUgnfXeiToaqC/ZsyS4yN2kwe/okGF8LQGNv+/+/VtGwgF3J7VB0gRt4M/slWOCv5C
 Bt0Fc2uKn8F+X+2qY9GQhXUHGgn4QxVLxk6EI68zGFBPQawALqUuQNV6A+ebIzAcnyOM
 p7X44lmov9vq6Fs7SHU0hgkyEaivHzDQNvg1lCeLDdwzwPG00HnIev7mz9BvEpeXf2Wg
 VVqAguryp5tCD8FpZ1ODXx+zqF8+WmIbpFKQCnhArlnsFTRVI9wDs3zBXmU6FRbsWI5O
 FRJ2lcYe4Ix+sGJUqniXq7fu6LSHc1EQk8aNkwaHXMoW22MGXE8bwED4kTLJKqUUw5za
 WbXQ==
X-Gm-Message-State: AOJu0YxSxJATZEJDfdcugxAs5Pyryfp9mY52m7AKtJZ4c4AuHgz77V6a
 bgoD0Ri9DxOcv4uGKNUDJIS4rLa/jc3kQlrI8w4hq6vAp3WrsG8YbVpeCBsjzsD2NVPVNjku/Tm
 LeJqT
X-Gm-Gg: AfdE7clN8GOt9mG1iXdkK6SjpMZ6VR+HwYsodT1M61PvGCTikwlgkYirGvkiadpkVhU
 V3Sixia0wMp1F9pq6PEfgSdgfRbfKpCS7YLK85qclYGFITzBAFOJsGOvh+GD6l6bFB5yX6FnX5P
 JySSHjW+MYbUuuWZjFfbFPb5V8MqyKNvs+THDSSkkmezq7ZqEvsB+lVOyPR4gFFVi+BxWlQdD8L
 j3ezHWJUCTPlLRY81uV2+R0FB+uTNWjyppX/WAIuGE9BQvat5gZuHugtmnoPCOLHgsBlKlP2ZWk
 piumLAEgC0b4UexOTLuZS5PXUZU7cNwlY8aSZ+0LVU0gjpGn3wpfdRnG8rPc8lnEx0X0+Jrzozj
 5j5+2zQIq8WL5Ladit8mtTaR84rMl0zAHeKhOjDhRLe1OGkhUorqo3ki1A3KpmNMTmKXnCv4MMS
 0kr30Joh6D4a/i8RlkDSQKmjkZp4fCVIGiJRPXAS+jodR3RwWDuCaE4Mbvqszm
X-Received: by 2002:a17:90b:3846:b0:369:7491:7b24 with SMTP id
 98e67ed59e1d1-37cdbcc985dmr1759249a91.6.1781755641231; 
 Wed, 17 Jun 2026 21:07:21 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37c5222e042sm8830476a91.16.2026.06.17.21.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 21:07:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Dillon Sharlet <dsharlet@google.com>
Subject: [PATCH v2 1/8] target/arm: Enable SCTLR_EL1.EnFPM for user-only
Date: Wed, 17 Jun 2026 21:07:11 -0700
Message-ID: <20260618040718.572950-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618040718.572950-1-richard.henderson@linaro.org>
References: <20260618040718.572950-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

We advertised linux-user support for FPMR without actually
enabling access to the register as the kernel must do.

Fixes: 2430d49a17c9 ("target/arm: Enable FEAT_FPMR for -cpu max")
Reported-by: Dillon Sharlet <dsharlet@google.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 419e0b3ed4..da93f24774 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -421,6 +421,10 @@ static void arm_cpu_reset_hold(Object *obj, ResetType type)
         env->cp15.mdscr_el1 |= 1 << 12;
         /* Enable FEAT_MOPS */
         env->cp15.sctlr_el[1] |= SCTLR_MSCEN;
+        /* Enable FEAT_FPMR */
+        if (cpu_isar_feature(aa64_fpmr, cpu)) {
+            env->cp15.sctlr_el[1] |= SCTLR_EnFPM;
+        }
         /* For Linux, GCSPR_EL0 is always readable. */
         if (cpu_isar_feature(aa64_gcs, cpu)) {
             env->cp15.gcscr_el[0] = GCSCRE0_NTR;
-- 
2.43.0


