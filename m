Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3517921ejb;
        Tue, 6 Jun 2023 07:13:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6bm75JcKksr6CjsEP/SXSPxNzPbfBeNyEuHUJCfzRNvCuwXyXrYdB2NGi7VRpiqjVB6Q/H
X-Received: by 2002:ac8:5841:0:b0:3f4:eb26:6d42 with SMTP id h1-20020ac85841000000b003f4eb266d42mr2287968qth.63.1686060818039;
        Tue, 06 Jun 2023 07:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686060818; cv=none;
        d=google.com; s=arc-20160816;
        b=nWsukYIVUtEYLERPOFwdNCFEHdDw2B6sBRKMltsZiV7vCHqSD2hCLZBJy7/I6kdHYg
         behD047ykntgYi4YWO106cKhEukD/PGi/kCLF5s9bBUDG++NR1myrUTpG5+4KrAOjiIS
         RaAhvDVVh/HVQyY89tJQpcHeWLj+QuqFjqiXbygCKDaJSJ4o9kWeY60tVvuDLtyaBEsO
         ZuKslgr0WAZw+2uwxi4hh382UJRDxAFOWxPnfMGkH58Fqjw9EXt+vvjZ88k4IHarXXww
         W4KBwGC9/yFm1HIl30SOvWzavnSREKzNJU2LQVYZetZYog9WHX8dUH9EX6z5Vpyxjsol
         87Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vM4MJj/z0alc8hubdwq0cm43Ebd3YBftyjtiu8qEFRQ=;
        b=aeo85jvt219FRzlqjgU8IPbmtuL8nlIt74WlJBNa9Vi313LyHZrp00Q3X+bqESrdN7
         NaueJLT7ZY/iyHhk3kzqJMzWm6khhP+ZiPIyvmW7KpOixJFAHPXLgMVB/qzSsAMBiPWq
         JXv9Cf3n5xbkV45/xkCBDX+E9LkFOgH3z48iMgzBlJ35gvyTK8E/fqs+k5b2GpVMf4eq
         6mReGkzDLvHxjhHk61Mflv2LopPHlb7O0Tmzmrx+OfLHn58xC33Zrznh7CGEAJfbsNO+
         qv12K4dLgfdxXLq0+GamHOsJyAGdnOP0QKWnSH37iJyaBeVkuPboFEdZCkiJLQTJY+Ux
         dWOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oeqtuk+y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020a05621420e800b006282077b3ecsi6285614qvk.517.2023.06.06.07.13.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 07:13:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oeqtuk+y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6XRC-00047Z-LB; Tue, 06 Jun 2023 10:13:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XRB-000468-Ej
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:13:29 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q6XR9-0005cK-2w
 for qemu-arm@nongnu.org; Tue, 06 Jun 2023 10:13:29 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f6e13940daso62839995e9.0
 for <qemu-arm@nongnu.org>; Tue, 06 Jun 2023 07:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686060805; x=1688652805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vM4MJj/z0alc8hubdwq0cm43Ebd3YBftyjtiu8qEFRQ=;
 b=oeqtuk+y44lQZZaihF7z7kKap+ioNkZFFKeoXer0NT0osQJHcb9C5FTWyVRhkyIpzi
 i5MhC/c4/iDLBeqK3JTkGJg7nLIKvCahJx0ty99ETQOP6PW54E3o3/8+iiZf3MANu3vJ
 NgCQ1sIMfYbPGk7rAfA3HBJkTBqlBJ03DlXyRVPyX3O5nApuZSCtdopbIGn7KeYF6AuR
 h2/xsm4Krh4rwMHVCr/8rnC2ltwyBBci0Sl5wwYNkPnhpaZXnL75Z193zHFOPasB6yq2
 4w4bccbTWyCFBsVs/Lu083lcOFdo/uKdhywo8c+43fq3NyT2fH25/Ndo4f5lyn66hHy1
 p6uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686060805; x=1688652805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vM4MJj/z0alc8hubdwq0cm43Ebd3YBftyjtiu8qEFRQ=;
 b=gCzFTxhwHrECLIrJS6Oa8F4PsHt4pOmqinJqg/pVFNMTcs6w5/WB8aq+8viLDJKCRK
 pt9PjgvhRaodn3M6KSiIULHesEbPDZyoL+DYkqK/ShPgI36goxMEy2TANpNbhgWroV20
 h3lvywtddYbVFaq6jgpSiWQyA3wdXwwTpY+3Y8uNVXss4Q45655UrcAnTIKY8CCVdy3d
 wuZ1kNklPD0UAOuYa4b1ddflAUMgbaJyQu1yb7rGzj1E4lpZ7KnmmlbdylcB092bf3KA
 Fq1xZSzvd4B7UsIj0mYhO7PPF3TSGXXQEu1XI0jp66N3GRa93HSc7PsALJZmdgaJ9NLw
 /r0g==
X-Gm-Message-State: AC+VfDzd1Fql1NeLtlhMAQ6OMLgnLHkDc9k5MaJb3xGx+1OLQl3IHCwE
 0SCWTG0mK/yO5xBSCgek0maXQw==
X-Received: by 2002:a05:600c:202:b0:3f6:1474:905 with SMTP id
 2-20020a05600c020200b003f614740905mr2701053wmi.29.1686060805454; 
 Tue, 06 Jun 2023 07:13:25 -0700 (PDT)
Received: from localhost.localdomain
 (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr. [176.184.50.104])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a1ced11000000b003f4266965fbsm17802853wmh.5.2023.06.06.07.13.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 06 Jun 2023 07:13:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/5] tests/tcg/aarch64: Rename bti-crt.inc.c -> bti-crt.c.inc
Date: Tue,  6 Jun 2023 16:12:52 +0200
Message-Id: <20230606141252.95032-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230606141252.95032-1-philmd@linaro.org>
References: <20230606141252.95032-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: z9mzll18BsIr

Since commit 139c1837db ("meson: rename included C source files
to .c.inc"), QEMU standard procedure for included C files is to
use *.c.inc.

Besides, since commit 6a0057aa22 ("docs/devel: make a statement
about includes") this is documented as the Coding Style:

  If you do use template header files they should be named with
  the ``.c.inc`` or ``.h.inc`` suffix to make it clear they are
  being included for expansion.

Therefore rename 'bti-crt.inc.c' as 'bti-crt.c.inc'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/tcg/aarch64/bti-1.c                          | 2 +-
 tests/tcg/aarch64/bti-3.c                          | 2 +-
 tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename tests/tcg/aarch64/{bti-crt.inc.c => bti-crt.c.inc} (100%)

diff --git a/tests/tcg/aarch64/bti-1.c b/tests/tcg/aarch64/bti-1.c
index 61924f0d7a..99a879af23 100644
--- a/tests/tcg/aarch64/bti-1.c
+++ b/tests/tcg/aarch64/bti-1.c
@@ -2,7 +2,7 @@
  * Branch target identification, basic notskip cases.
  */
 
-#include "bti-crt.inc.c"
+#include "bti-crt.c.inc"
 
 static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 {
diff --git a/tests/tcg/aarch64/bti-3.c b/tests/tcg/aarch64/bti-3.c
index a852856d9a..8c534c09d7 100644
--- a/tests/tcg/aarch64/bti-3.c
+++ b/tests/tcg/aarch64/bti-3.c
@@ -2,7 +2,7 @@
  * BTI vs PACIASP
  */
 
-#include "bti-crt.inc.c"
+#include "bti-crt.c.inc"
 
 static void skip2_sigill(int sig, siginfo_t *info, ucontext_t *uc)
 {
diff --git a/tests/tcg/aarch64/bti-crt.inc.c b/tests/tcg/aarch64/bti-crt.c.inc
similarity index 100%
rename from tests/tcg/aarch64/bti-crt.inc.c
rename to tests/tcg/aarch64/bti-crt.c.inc
-- 
2.38.1

