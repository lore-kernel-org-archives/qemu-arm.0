Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2696910eja;
        Mon, 6 Nov 2023 03:46:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGb6+LXA9cXzjwsiUTMxvDWyAxTdDjnstal8L/4lWvAyAcGYtcE/qUIRvl2kEJw0N2PFSxt
X-Received: by 2002:a05:620a:1237:b0:777:dd5:6045 with SMTP id v23-20020a05620a123700b007770dd56045mr27119425qkj.73.1699271184127;
        Mon, 06 Nov 2023 03:46:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699271184; cv=none;
        d=google.com; s=arc-20160816;
        b=PY+N479bclFFAz3nNE1GnVOgHnVdDmYFQ/FBUXsaF85ANvjm0I0q68r8KcM4LwUcdB
         p+QCT7g5xAqSVhYlN0aVBer8XZTNcftb+Mf5hKsldMhQfnojwEPN4SiNOBT2MFyRNvfs
         QyMs0s8O71x1kS8uuEK7bIoscgkepuOW9gjoO2m0SmZjlazrYOeYu/sNB8xgcUskO7C5
         T3Clc5yEfx5VlZKMwIpls4SKpAIBx8MvDhByxUcS7Ikj1+8H17QPnC70ub+LQsxFB82K
         qLEDVqeOtKGcddSFAP4n7owUhsDzZkNFxwc4thjEavjWlcomEXn9HU8zElb1IBrWegSt
         4Zkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=y64pfPV7NL7E0LJgFX4bNE9NqKWBU2sOyHjVdfLQkVI=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=09prGQTOS8VxoxAzp3V53u7xCJE6kQSH+kGBJfUhMP8a9owW5zmJkheiZbKkbe2YYu
         4imdwwWQAktJfBgw4yQLpnuETAHWc0Qh/glZyDXWe1VH8bPSMkQTKUCGnJsFxt3y/YT0
         evZzwPmO3D1ZCl81C92LtEjAXcchjXRcFEWzGQowmP72LKP1XDEYH9/wxlNWpLEWCko3
         jJMSfPYoTJM3VIN/auljZOVdrSJHaF2oB9XqybnuiWZEVhXYvwZ89JRlTK2wUES+7Jmz
         YNf1Ybm0jeTDWDxY/6TXHrMZ2a4nklECxEkWwuyk4aMenIdsDHhZbkgQp+gXPHzITL5v
         NWPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v5XVa6ct;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o5-20020a05620a0d4500b0076cb047fa2fsi5211340qkl.619.2023.11.06.03.46.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Nov 2023 03:46:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v5XVa6ct;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qzxsc-0000Rb-Hb; Mon, 06 Nov 2023 06:34:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qzxsZ-0000Le-H3
 for qemu-devel@nongnu.org; Mon, 06 Nov 2023 06:34:51 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qzxsX-0002nH-0z
 for qemu-devel@nongnu.org; Mon, 06 Nov 2023 06:34:51 -0500
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-32f87b1c725so3074335f8f.3
 for <qemu-devel@nongnu.org>; Mon, 06 Nov 2023 03:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699270486; x=1699875286; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y64pfPV7NL7E0LJgFX4bNE9NqKWBU2sOyHjVdfLQkVI=;
 b=v5XVa6ctx66hL64ooEiHCXFKyO6ggC5kFvrpuE9szKKCMVKTW6ErD5i7C9Vx6E46Vm
 rkcW4YLmgm9Hj5WWqp2B28oqiTWgMwG54R5iHW6skqutBXGjLKMMoQB+4v6ps7GWFwWP
 sBId9mDfQtZVzdj0rDhOq5/RUm2Dp6nGw7q7t/o3UhmizhuoODcU4MoK8KzOei2Ho7ws
 Lh+J5jx7zrw6kyWhwX7c8Tgoiuqoz5YKiwG4WChrtchfohdLxSNLmu788fMTiYztg7nN
 Ypmkdy6jIubFC0aTrnwReg9XTFpKHvcCXn0vQFMsQcGjnv7u3iQC/Ix9ZAnq5SpisKJE
 cRtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699270486; x=1699875286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y64pfPV7NL7E0LJgFX4bNE9NqKWBU2sOyHjVdfLQkVI=;
 b=Vt6GzBZrAQAZI8xoKv2cD6KZb0VDuDQHXtb7RzXZ1bXYrH3MatCTpN3d6EAfDKzH+I
 3Gr6NQaM111bnyqga22x9anpRTjIfi8V2IK0rYj9WQs5Jz+0yVVotaYQ/88f+kbJmnu8
 4vb0qgC05uvHx7lelHQSmJ08pawAA+9TB8etKtDD0KbIeyb3MFJi7rYw542WnAFMF2Qp
 EsjgAHqIxoeztXhdUmGO/oN6UxK0j9RmsjRCDK6vt6j63NsBwtJDoBy+X5r4QnfvjfVV
 Q8nkYw/8U6corcNkF5tvIHPc6IWNN1KcHqeKqSJbF4J9Z6cTTtZ48yC775FWZZLfJce4
 PmRg==
X-Gm-Message-State: AOJu0YxB/ZDdpyGJOi6MWc8t0HGLPUoxAVJhKTxDumBVIhwsaZfL54EJ
 4oa1lBTaNe2viwXns5KDoPROEw==
X-Received: by 2002:adf:9c91:0:b0:32d:adda:e8ca with SMTP id
 d17-20020adf9c91000000b0032daddae8camr20493258wre.22.1699270486442; 
 Mon, 06 Nov 2023 03:34:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p12-20020adfe60c000000b0032d886039easm9113752wrm.14.2023.11.06.03.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 03:34:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix A64 LDRA immediate decode
Date: Mon,  6 Nov 2023 11:34:45 +0000
Message-Id: <20231106113445.1163063-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CJmsHvSCATdQ

In commit be23a049 in the conversion to decodetree we broke the
decoding of the immediate value in the LDRA instruction.  This should
be a 10 bit signed value that is scaled by 8, but in the conversion
we incorrectly ended up scaling it only by 2.  Fix the scaling
factor.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1970
Fixes: be23a049 ("target/arm: Convert load (pointer auth) insns to decodetree")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate.h | 5 +++++
 target/arm/tcg/a64.decode  | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 9efe00cf6ca..3c3bb3431ad 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -205,6 +205,11 @@ static inline int times_4(DisasContext *s, int x)
     return x * 4;
 }
 
+static inline int times_8(DisasContext *s, int x)
+{
+    return x * 8;
+}
+
 static inline int times_2_plus_1(DisasContext *s, int x)
 {
     return x * 2 + 1;
diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
index 0cf11470741..8a20dce3c8f 100644
--- a/target/arm/tcg/a64.decode
+++ b/target/arm/tcg/a64.decode
@@ -462,7 +462,7 @@ LDAPR           sz:2 111 0 00 1 0 1 11111 1100 00 rn:5 rt:5
 # Load/store register (pointer authentication)
 
 # LDRA immediate is 10 bits signed and scaled, but the bits aren't all contiguous
-%ldra_imm       22:s1 12:9 !function=times_2
+%ldra_imm       22:s1 12:9 !function=times_8
 
 LDRA            11 111 0 00 m:1 . 1 ......... w:1 1 rn:5 rt:5 imm=%ldra_imm
 
-- 
2.34.1

