Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp2052261njc;
        Sun, 17 Nov 2024 05:50:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUlRTUoS8SPZEuUEwp4ZoGrhGO8FU4uyGTKBg9prJLfW4ShbaqcEon45Ty6RTEcNi6aGfqQCNba63qTrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHmR3AHrOeBr83l+MsGu28MrNOAlA/z2wLxTRG9Axq07Zj7cV1YmEm1ho8bH1Uqn9P4u4l3
X-Received: by 2002:a05:620a:450b:b0:79f:197d:fe6e with SMTP id af79cd13be357-7b36234354dmr1239548985a.45.1731851419326;
        Sun, 17 Nov 2024 05:50:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731851419; cv=none;
        d=google.com; s=arc-20240605;
        b=CQHx9DPBn84OE1XrZMsTxINxn2r4rYw9+t4WwIqNUHjcbad8m46+zy+seGVIYMd6hT
         Gp3d09cPcGC5FZoZZX/naxjRlCbKW3ljc6P4LirSyzVKRDMX6Wx5pgpQX9/p4iCtk2U0
         dWZFHVtgTo/l2lNJnpoboq48IqsUNb9CXdYM+U0E0lGlJnzBn+J/RYLINuz6qPO99ca4
         3fhSt8TphTcqhOQ3oR4ACVIdzvo9mjFBcgb8j96Rcxz6ya8Kv3NipKDlVOCnmujCWaSY
         Q6i/bAt6i85A/24s+tg8py1F4qCiTibMNogPYvbwUFROHw1bYpwrjV0Xf+ZH+iN9BYID
         yDMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=hQmuiHYA/hhqCVxwD2C2oGlSh3k9WVXtPYarRqLv9pk=;
        fh=8mM4QI61jifMA+pEzQwLqskMftYK2HWSzIezHWe5+i0=;
        b=HARkS3JYq+vE0UsyNQ9fl2U6uoqnRkMTrcQ487rdD0vrJGqQiNDolAGBUNv8c5cUc1
         t5Gvi8Vi102i0NCNOR+hDwO/j54ywY4+ACztQH36wNm8MGSE4ORhm4PjN3/67m3GlxxR
         ZULwiUUIgnBropALs2gTlfwG+bILiNlfj30oF4gXYfq4oslc/QkDamHabb4fSf72uHPA
         dgaoWI1JvhJ3vzSEvHOVAA7s8/n/z0VPkI7tgtIxyaMJ8Qdyno5WiCt76gFJGMx424Nh
         LCyLBNxyVQ54gYSXyo508iTBqp8xD0k4TDTAiRCjBc277H8+nda8bsBhxH//+l+sd/sg
         eZTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="h2z0t/m+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b35ca28860si896766085a.237.2024.11.17.05.50.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Nov 2024 05:50:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="h2z0t/m+";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tCff9-0005xQ-EP; Sun, 17 Nov 2024 08:50:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paskripkin@gmail.com>)
 id 1tCff8-0005xC-Fq; Sun, 17 Nov 2024 08:50:02 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paskripkin@gmail.com>)
 id 1tCff6-00023e-L8; Sun, 17 Nov 2024 08:50:02 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53a007743e7so2395566e87.1; 
 Sun, 17 Nov 2024 05:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731851398; x=1732456198; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hQmuiHYA/hhqCVxwD2C2oGlSh3k9WVXtPYarRqLv9pk=;
 b=h2z0t/m+xSGLlqCaqMGS7toS4YcD+iZI6G2UCq1xgtnZazMotEL1RoCyRoeUWpPAl0
 hAIOdCk50XK+1coaGuiOUK2aUWW8/pZON4zL+NMmfcBWyjgKN38EBC7Je7c3uS3taIne
 +NFLWChm2Lsx4/SvH93QW7eddKDoa9l5KUTJbQRh0IsswTbuZ10VoQzDOrxweQWvj3oy
 ardsC1u/qWacFHKA6VnXky0oUUlFaJMaZlQVUXtTDxzKKfYz9c1JNt6t6g67AmKnXJFm
 i9RoH9bsko2J8lXb1qMr4nulnynUYD3H55Ntr5DkFGKou4XmbZOOOfa+t/tSIaNAqEMm
 kz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731851398; x=1732456198;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hQmuiHYA/hhqCVxwD2C2oGlSh3k9WVXtPYarRqLv9pk=;
 b=FaO0Zrr0p2PWqv5MQlvNLEplE4CsQH9cAseqSuRZJ/fcx3hkVu4vToc8b2DfPxJx84
 Q3b9qAvXe4SeVRWgSCicXORYm34sRpbvtBghR4uMLzxdXNc2Wv8j+QBJnzKeRuPdyPGg
 xDTciaC1cceSY+ufoLnu3MDhCNIUMYW9N6BQ8TFdDUiEj/0ggDm/ijyvns5m9LYQOBct
 /RBtBe9yx/0oT/bQHwnURHCG6kiT/uX2pwFNGy00SjW6EBPqDxfVuCye0o1yPASASBAe
 PTF/DNIvZEmzibGo8sLIzCahZ4QlWKW1K+F4O9kySIz4tqMm/MzzAFPJJsmNu2yQJT42
 v13A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3lhiGmssnYukIo6fklcXr3sbHvMKeHyeKmIk1L0gpeACRfvN38XPMLopm4/VhXltIOWskJaurc7wH@nongnu.org
X-Gm-Message-State: AOJu0Yxb8cdzmMIqUbJCbOh6HHViF4pcauxrPGiuEiiJNUOIDryZx0e+
 pvgxggazqlrgRdkEkcyk7s05vA/4liULnhVJMeY3pz1R2FykHt4U
X-Received: by 2002:a05:6512:3989:b0:539:ddf1:ac6f with SMTP id
 2adb3069b0e04-53dab3bf70dmr3419722e87.46.1731851397467; 
 Sun, 17 Nov 2024 05:49:57 -0800 (PST)
Received: from fedora.. ([2a00:1370:8180:90b:d00f:257f:ffb:ac70])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53da654e33bsm1285366e87.276.2024.11.17.05.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2024 05:49:56 -0800 (PST)
From: Pavel Skripkin <paskripkin@gmail.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v2 0/2] arm/ptw: fix missing sctlr.{u}wxn
Date: Sun, 17 Nov 2024 08:49:31 -0500
Message-ID: <20241117134931.37249-1-paskripkin@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=paskripkin@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: c74dD7fX3YN4

We observed failing WXN tests in our OS which we tracked down to missing
WXN handling in qemu.

The problem was in that short descriptor format walker did not respect WXN
bit. To fix it, make it possible to call get_S1prot() from
get_phys_addr_v6().

Tested localy that all permission-related tests in our OS passed on
following platforms:

- arm64-virt
- arm-vexpress (v7)
- arm-virt     (v7)

Changes from v1:
  - Fix style errors
  - Add cover letter
  - Use get_S1prot() instead of open-coded checks

v1: https://lore.kernel.org/qemu-devel/20241114165900.6399-1-paskripkin@gmail.com/

Pavel Skripkin (2):
  arm/ptw: make get_S1prot accept decoded AP
  arm/ptw: use get_S1prot in get_phys_addr_v6

 target/arm/ptw.c | 54 +++++++++++++++++++++---------------------------
 1 file changed, 24 insertions(+), 30 deletions(-)

-- 
2.46.0

