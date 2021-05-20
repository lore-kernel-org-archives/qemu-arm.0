Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp279911lfm;
        Thu, 20 May 2021 08:39:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb5rp2OvhFG/hWegXKZTsQlxReRA4tEsO7DhkkI3znUZSDYjkdi8UWyNDrXYXw5vh5rKgK
X-Received: by 2002:a92:60e:: with SMTP id x14mr5691171ilg.42.1621525150141;
        Thu, 20 May 2021 08:39:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621525150; cv=none;
        d=google.com; s=arc-20160816;
        b=k6Uu7UMoneS93Ao10EDVmcsW+SKDhDLryamMfl4JzrnZtZ9xXpLuy8sOF8wIP2l1iB
         Dkck0F+FxYUF2oSrYNU7Wj4MCdNcHRAHXtwDjCqzMA8pzHMyZUHY/YQ+jC/Iv87Id0Zw
         R1CvKBFK1A0IfodsKgeHnaWJXHdiLlR3xHsbobUEuVwggOCYaBhcrITYJ80nczhCjFa9
         jZ/vdZQ7dmZGVQR6onn8ihN6XPtdhX0KeCADN/1fPmQmzv3WF6YtWuPznO74c2Rb5LI6
         Jwpx6CUrYSYibLYLeUgk0Um7GgzxqzlVbRGQu/+1XxK6+13ayGTXpiR9GIyl+wMGaPoS
         7WfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Kn3QkvhPIEBYzulaH/PbJ8DasheOBiuundvI2boBDto=;
        b=jHBj1zMMiKY7ZBhBsnv+frZe1x38728Onjkr/e9Ffq2Kb9oHAU1ldrMtV4FE4L6sGN
         8piaDCI75pve95vMrQMTfnJYwwrezH65xd0UD54zwDigP5aBHQmTZv5vQISsYAw7ry/O
         +FIJyRJszfu/ee64gF71rwOXNbP5gxHlAV1FEEc/JLP84IbIF6pvPB4KBX6sRinmSKlG
         TXR2yWqOVSqCkoKqztReVoBo8Ecert2b7hOnm4gmwzA1DRTOJP20DUzgw0QwU2YpvRzL
         O+ByjAmgJBGaziZ204sQ0Mf/lYUtirdzCZ7UnMR/mAEklES3sAMp/ShunAyexPE0aM/L
         dTZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qyzc2Mpj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si2391107jam.26.2021.05.20.08.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 08:39:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qyzc2Mpj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljklR-0005rR-Ei
	for alex.bennee@linaro.org; Thu, 20 May 2021 11:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbS-00080L-Ke
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:50 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:36511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljkbP-0000g8-MU
 for qemu-devel@nongnu.org; Thu, 20 May 2021 11:28:50 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so5701290wmk.1
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 08:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Kn3QkvhPIEBYzulaH/PbJ8DasheOBiuundvI2boBDto=;
 b=qyzc2Mpj5+XhPWOzuw0+RbtK2QCHdDQHMJD7NT29FDS1ANQqgW/0f5j80+yj9hjjEW
 nSjSom3wSBxc519uZXu6yVAS9z2Nh6+jmSkBjKwLBzr9ivdKxjq5MCR84h0r+ESbP75i
 FjbZ0Ck9mTsQCPfu1BdzTNCzUz7ENwlKdkn6yC3wYlCY7LF5eMv2tMQoejWmhoxZ9tOm
 nJCKjgzPukmo6c1sT4wZftiMD951yD+68EJcGTt1efMHGfScBJ6ANp+ClqBUM/9zA0De
 cQ6dpg92KOkvhBK/BjTKU8Fd0e4nxBgTBz1YNw9aqYUsQlo3PHxCqESSn6c/LjnyfEQ/
 dnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kn3QkvhPIEBYzulaH/PbJ8DasheOBiuundvI2boBDto=;
 b=sKZD+rSocWjxpjXdxdd58k5ZATwtJjNE33g3tN4g9OacBEAhWbR4OzEVodDThR1kBh
 XU3Vx0jH/ji42YYXzCepAXIRd9vf7FW3kZvECcuhFpDs4JlwpR3xBey6hovj6T/a1gQ9
 d9Gx4ok6gBAZyyBdeb0cZ3hd35VGnqAYk/KYeylQNSckMG4Nui+Is+JKygEzIWEFqr1p
 5YHYuH9n2C9Hqnd7SOEFvMWVmg1IslveiDfHoJEyyKpDfgvz420XrkPJaxxnvXawQ5B7
 NnrAfUvjz2waXs9MVqRJLyM6DMuWI9ltB2yN7yhUfiZlP2y6EjeQnkUmKYCWvV79ZvBQ
 oO0A==
X-Gm-Message-State: AOAM53117rQSEuV5UyPxChMdHDqhx11OU4NOGzlWyRDggyFMbEstZzU3
 xMMIsyh1oqZkqXfOLhhOLgt/szVoeH8I6xQR
X-Received: by 2002:a1c:7313:: with SMTP id d19mr4294854wmb.14.1621524526146; 
 Thu, 20 May 2021 08:28:46 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id r2sm3916126wrv.39.2021.05.20.08.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 08:28:45 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/9] target/arm: Fix return values in fp_sysreg_checks()
Date: Thu, 20 May 2021 16:28:36 +0100
Message-Id: <20210520152840.24453-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210520152840.24453-1-peter.maydell@linaro.org>
References: <20210520152840.24453-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
X-TUID: p65OpgMHyFYK

The fp_sysreg_checks() function is supposed to be returning an
FPSysRegCheckResult, which is an enum with three possible values.
However, three places in the function "return false" (a hangover from
a previous iteration of the design where the function just returned a
bool).  Make these return FPSysRegCheckFailed instead (for no
functional change, since both false and FPSysRegCheckFailed are
zero).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate-vfp.c b/target/arm/translate-vfp.c
index ac5832a4ed5..791c4f5f70b 100644
--- a/target/arm/translate-vfp.c
+++ b/target/arm/translate-vfp.c
@@ -691,16 +691,16 @@ static FPSysRegCheckResult fp_sysreg_checks(DisasContext *s, int regno)
         break;
     case ARM_VFP_FPSCR_NZCVQC:
         if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
-            return false;
+            return FPSysRegCheckFailed;
         }
         break;
     case ARM_VFP_FPCXT_S:
     case ARM_VFP_FPCXT_NS:
         if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
-            return false;
+            return FPSysRegCheckFailed;
         }
         if (!s->v8m_secure) {
-            return false;
+            return FPSysRegCheckFailed;
         }
         break;
     default:
-- 
2.20.1

