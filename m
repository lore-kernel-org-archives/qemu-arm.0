Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp682010ejb;
        Thu, 15 Feb 2024 08:31:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAjIr8WDk/UFpJo0wV9ssn9dBQzxomz+nPKxn26QU2lDjD+5SBfOY8kyGjj+HAFOD+CsI5cJxsDb/fX5AtTtOGHHHxkeIJ
X-Google-Smtp-Source: AGHT+IHJH9cZLh0H7d5F1wOMne6ii11DSaq81uCNWpsKpOq/xvlNtHB/9ijjiEkwqu4HTxKJ4ndm
X-Received: by 2002:a67:c788:0:b0:46d:372a:d114 with SMTP id t8-20020a67c788000000b0046d372ad114mr1622704vsk.16.1708014672796;
        Thu, 15 Feb 2024 08:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708014672; cv=none;
        d=google.com; s=arc-20160816;
        b=GKRgwhkZ5A4U9jt0xR2iHum03CGS3nsEUhTbVtvGDtK4iPQjA/fW9pO/z9r6uThidU
         S1AbM+BHBVT+09vE4a9NVxZW9gOo/Ji5lI5xHtDtj6dHponJFU1kRa6uYZGrEmj+UNjj
         Jw7iz+REnP5Q1hQgyEbDoSp5oZvypAmI93EMunfg+QzZz72AQF0mRm0CX4sgHKMQKkOe
         XzZ6yV4/el8F8rL35bf221XFax1allCr9RSmJa8Zsu5ENiSqN3+UhyOAX4X9iaVy4xOx
         DC1HxlLFZ4sYcV98M7kHoEtCXp7/9xYWcJdUEI3pQdq8cOFscqFEXord1OLvVfCKIJGh
         qhkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=ZxJ82GKHsUgKCva8HlVuPOEU7TH3AeI5O3T89aBX7P0=;
        fh=Z8N+w7CAEblwq9KYpl4JRBPYzI/90IdS8kqBQlDP49A=;
        b=ANLCHOd2GtA6p8CKA6622OutakgIzF+FEpDhREP+fTX2ET3vEUuCWtaT4FNbeWw+da
         fKN+9zHsBFlJw1VzNNm3BMcDX5HO1zZQx+Hr7UMrp8ezFMQHcuzWrmdKcBjDX8/jJ6MF
         PJ8ZfjDwkeXobzzhJ7pXNROUftZslJOcFH5kNO7kw/3TkhIq39PuOtxVy1cR7XY/1dY0
         VWLEzR4pxXThwDoREx+8/5rk2euSG7nvYXcAlJRDmDifoN4l0YjVs2K0Zk+VOOPV8U3W
         PFH6/G9QMyeQJayIVQ68GT/DLnOXyTEBkFqFhUht0f+Q3FYXr3C3OYQSUzAVIeym3/pv
         oDWQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jz1OP7sI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x26-20020a056102091a00b0046d65b547c8si325822vsh.50.2024.02.15.08.31.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 08:31:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=jz1OP7sI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1raedU-0004dj-Lp; Thu, 15 Feb 2024 11:30:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ijXOZQgKCGMBSEC+HJUHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--ardb.bounces.google.com>)
 id 1raeBr-0001am-UI
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 11:02:23 -0500
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ijXOZQgKCGMBSEC+HJUHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--ardb.bounces.google.com>)
 id 1raeBp-0001rr-24
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 11:02:23 -0500
Received: by mail-wm1-x34a.google.com with SMTP id
 5b1f17b1804b1-410d0660929so5287145e9.0
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 08:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1708012939; x=1708617739; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZxJ82GKHsUgKCva8HlVuPOEU7TH3AeI5O3T89aBX7P0=;
 b=jz1OP7sIt8hbtsqIKGvG5du/+F7FfgDUqSOI0T7KTQRhp2iz1S6/kuArnVzm7AO8/f
 MKyACRpnaE3IvtHKzu9Eg7VBy/0W1BHJJUSsHSPmyIKUsYHqbyaGJx2FAR/ddcp9Du00
 Rs7xiKATHUXIMBp2MKltLSLnY0DmRjf3O7vw2IoGJ6CrHS392JQ2XxHwgOXSj+Iz+Yr+
 RtPegCs1H4WQXZq9N0R5BNgyZznf0M8cEM9AF6V6mN2dKicVu0ld4AQLL2+ibhJaO29i
 2qUT771MmG2hH6DKP+UWlaUkhcscyblKXHCHbFUcId0sxhLzGtvyI8cA1fQ1H7nJWJQn
 1/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708012939; x=1708617739;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZxJ82GKHsUgKCva8HlVuPOEU7TH3AeI5O3T89aBX7P0=;
 b=s1EzSKaUPT6EeHGvZX+WvxxFPg7jN3aoT1f5Lp8MHWbWolUSy0fzfcwWYNDuWlRSYk
 Nc5AnC2uB1478z5l1SG807zfogXjrLmc3J+vqFglPEo/k9LrljOaItGOjap1nULFyx2e
 zMSUK1d6JiqO+IaWO3dXLgibdhaKHQY0thA5fzCLiOrwRTNCjNhI1iFSEOMKsNA5j3lb
 /k3kDAkr4vyqsVbL4qjY7SFxMsBUkut56QfpbUq2bAv6lmx/IlXlmDyu5Jg+e2i/3E7J
 OJc8BKSIgwHgoZ4T3+L7/8J3h1M4WVy+1z9ECsvqcegV0G6BAAqKV93iNwktWLKcCstI
 FYHA==
X-Gm-Message-State: AOJu0YyAIo+mXnoJqrDG7DFzXEs8jKpF1788LA6ny5GTNMiz9OWnwfB8
 jFIayVS7YwOFKK6pKcZJvPzcs9JDnQbz6hO7HoqR9f+P3solfa/00VBnpA1XNxizCEJrZOKeUGL
 KAdHMZ5YtzSNWPIijNnqnkJdCaIBVhZes4qwxVsABsnIesPaszgx3GabxZoAKiG6XVsS3OiejY1
 fo9E8HlLGpBsGryMmylw==
X-Received: from palermo.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:600c:3512:b0:412:913:54c7 with SMTP id
 h18-20020a05600c351200b00412091354c7mr76803wmq.4.1708012938539; Thu, 15 Feb
 2024 08:02:18 -0800 (PST)
Date: Thu, 15 Feb 2024 17:02:02 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Message-ID: <20240215160202.2803452-1-ardb+git@google.com>
Subject: [PATCH] target/arm: Advertise Cortex-A53 erratum #843419 fix via
 REVIDR
From: Ard Biesheuvel <ardb+git@google.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@linaro.org, 
 richard.henderson@linaro.org, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::34a;
 envelope-from=3ijXOZQgKCGMBSEC+HJUHPPHMF.DPNRFNV-BSNOPOHOV.PSH@flex--ardb.bounces.google.com;
 helo=mail-wm1-x34a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 15 Feb 2024 11:30:55 -0500
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
X-TUID: tJDqbcduaDZS

From: Ard Biesheuvel <ardb@kernel.org>

The Cortex-A53 r0p4 revision that QEMU emulates is affected by a CatA
erratum #843419 (i.e., the most severe), which requires workarounds in
the toolchain as well as the OS.

Since the emulation is obviously not affected in the same way, we can
indicate this via REVIDR bit #8, which on r0p4 has the meaning that no
workarounds for erratum #843419 are needed.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 target/arm/cpu64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 8e30a7993e..0f7a44a28f 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -663,7 +663,7 @@ static void aarch64_a53_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_PMU);
     cpu->kvm_target = QEMU_KVM_ARM_TARGET_CORTEX_A53;
     cpu->midr = 0x410fd034;
-    cpu->revidr = 0x00000000;
+    cpu->revidr = 0x00000100;
     cpu->reset_fpsid = 0x41034070;
     cpu->isar.mvfr0 = 0x10110222;
     cpu->isar.mvfr1 = 0x12111111;
-- 
2.43.0.687.g38aa6559b0-goog

