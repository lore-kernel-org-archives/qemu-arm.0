Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp851409ejb;
        Tue, 18 Jun 2024 07:40:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUnG6+QEpGjdWAS3gt1Dq/kLGdlO/vx96mMp9dSkp3QyHYppXc5KW5HkxyiXqkWqU7XdiBGF2MDVCU1iquM4f3+4hR3nhoJ
X-Google-Smtp-Source: AGHT+IF1SlEcsry6jrATIwMx4qX7VhJNlMrg8as4zx4JqpWJItWnzYVFnmC1PtFoDAOLFrhZ3MB/
X-Received: by 2002:a05:620a:4411:b0:795:5615:8cc4 with SMTP id af79cd13be357-798d26a8dcbmr1585827185a.71.1718721637248;
        Tue, 18 Jun 2024 07:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718721637; cv=none;
        d=google.com; s=arc-20160816;
        b=iJU+sgeqjqElLJ00Qgya8cnzf9MB5iBCR3DOTJY9T+S6Zb4sMreVNcxOQ3XlVRtfcC
         a49S+piPDYrR4nkfWpvMz+3B3csc+gEL5QmQLN6ncOVmPxhtPrIJYjbih6yWJwx6HSMs
         6Aw3JPJ+NR1E7ndlse6+hvD2O97oW0Jo/P6v6Pfd4nxN02Zj5bY1OiG/6sw7TMpt/cDp
         kexCbL9nR1DPlTCiERoX6VaESju5hPuUB5GJyyyoKniFKioOGKOZE/hBeM+AuvgigP8m
         YjFoLT3RII/TCa3RN7/HskoW5LhcNFtSQvEXmsWlpWrJdGvw+sBhfr6Jl2kSfwRYyBtS
         T9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=uvBxpZFONpTNQR9KQhhThzpJaQH2JB8uCMKlkJSlgzk=;
        fh=Hf7d1nkzsvfyKsw6BovnrCULJryQtb2rYlB8aPv57po=;
        b=KdGPmgmU6ITNfUl8B4tqMuLXyGBVI2X69hxrFZghxLAMV/E3tPGphSuLxGzaVKsDfk
         ZRdDEXW7k1LdZ2itQ8fMthiWNOqs6Lu5n/Pz+YmGKkxKo0e325v2eS8qkbWNHYS2YXXq
         juc5F9QcnJ0glLrvvU9jR++2RfXxCzilac+4rKq4FOM/fhl/Myn6flitt/opHthiSVzx
         oYZRJjrZwlGmg+k4b7wmJ60QQ5BWJfhWpNUXvt5hVWp0sG7hDXB1nNUDg/pAHLBZztUC
         RtiQWkfysuN2HdCowlfm5OTz4sKPgyOn3K4Fq1/u4PfxrSuBE44C5lpBuDYXCgDXyAd2
         4yzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=is1tdFPb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79a42c580a1si711413185a.687.2024.06.18.07.40.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 07:40:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=is1tdFPb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJa0W-00005u-Mf; Tue, 18 Jun 2024 10:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zheyuma97@gmail.com>)
 id 1sJa0V-00005f-IE; Tue, 18 Jun 2024 10:40:23 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zheyuma97@gmail.com>)
 id 1sJa0U-0001RN-0s; Tue, 18 Jun 2024 10:40:23 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6f7b785a01so331729166b.1; 
 Tue, 18 Jun 2024 07:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718721620; x=1719326420; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uvBxpZFONpTNQR9KQhhThzpJaQH2JB8uCMKlkJSlgzk=;
 b=is1tdFPbjoURFcZRyUSfPKmJPzAeKieEJqHenx2nFQK8NSrSDtU/Oktil+huNN2UWE
 tsP/uOkGBgFDiksgY9b/XQnnFOPKQJk/Fw+axY0Z+AKLw40srsyf+A6NpJ5jrKlITYKV
 wFIuO6zWBg5EqkydeZ9uBi6tu0Lr+HqmyLl1X5FQYTSCPAjVD3orEqgP3rvBVlmtqBa6
 wrxYet3J7QX6V1Z56kOqaUDb/YbkTiNghgunubN0N5jT8if/n/HKM2MiFEWOMJu3j8Ml
 51uSe9qb4NA+Bi1RelIl7XA9yRVh2bFrT7uh2WuAL1BTJWfw5PonD5Za04PvnChrOmsq
 GBUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718721620; x=1719326420;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uvBxpZFONpTNQR9KQhhThzpJaQH2JB8uCMKlkJSlgzk=;
 b=gxOKNrczHfRx+TUqbK0FTgpPk6crMOXhr/IZxPp/l6igslseWFGmoZfn96CNtVbIFo
 BatCf47Mfz8TFw5T+KtxMnCNYRKBHkfNmGp4MePMs04UhKIpT/K5kAffijhyVGz+OKBO
 /815xjEG6zkQudy+xOQu8iAovMd6v08+URp/vQaA5ozS905z/tcILHl4PCRY+DXCcxHb
 k+kFU11MAuwz85bcqfgR/H8OA35hcYGI2aECJDlrpzkuqSHDFfcujPs9tFGBbl0AwK0J
 23qltH00QGwd+RN+ZWF3dSg2IFQ+c0t7TTDH/Xz60D+2mpyO2f5dSJfR6aNdKcE9+0l+
 pP8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi4iIu8LE3M7rdIT2TDWilDaW6irXNP9T2+za6S6Fjn7XnqBJNpgoHWONqr5yFCFV/89k/tMgu0Zo04ipva7bwi35ezIDMfet+u4lOA9TCdOz6uYdi/+dd9Ow=
X-Gm-Message-State: AOJu0Yw/zRzHUiriGOmCHjjImK2+RouUGp87YGf/d+4S/dTQlAjL8plB
 zRNvG/TgjKqy2a2kN3qr7CAG0lBPX0txwcm38XoRKU4Hf5W6Z0c=
X-Received: by 2002:a17:907:c00f:b0:a6f:6721:b06d with SMTP id
 a640c23a62f3a-a6f6721b860mr943923566b.24.1718721619942; 
 Tue, 18 Jun 2024 07:40:19 -0700 (PDT)
Received: from wing.epfl.ch (dhcp-122-dist-b-021.epfl.ch. [128.178.122.21])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb741e884sm7745066a12.63.2024.06.18.07.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 07:40:19 -0700 (PDT)
From: Zheyu Ma <zheyuma97@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Zheyu Ma <zheyuma97@gmail.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] hw/timer/a9gtimer: Handle QTest mode in
 a9_gtimer_get_current_cpu
Date: Tue, 18 Jun 2024 16:40:09 +0200
Message-Id: <20240618144009.3137806-1-zheyuma97@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=zheyuma97@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: o7bRhpQ/iPtT

This commit updates the a9_gtimer_get_current_cpu() function to handle
cases where QTest is enabled. When QTest is used, it returns 0 instead
of dereferencing the current_cpu, which can be NULL. This prevents the
program from crashing during QTest runs.

Reproducer:
cat << EOF | qemu-system-aarch64 -display \
none -machine accel=qtest, -m 512M -machine npcm750-evb -qtest stdio
writel 0xf03fe20c 0x26d7468c
EOF

Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
---
 hw/timer/a9gtimer.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
index a2ac5bdfb9..64d80cdf6a 100644
--- a/hw/timer/a9gtimer.c
+++ b/hw/timer/a9gtimer.c
@@ -32,6 +32,7 @@
 #include "qemu/log.h"
 #include "qemu/module.h"
 #include "hw/core/cpu.h"
+#include "sysemu/qtest.h"
 
 #ifndef A9_GTIMER_ERR_DEBUG
 #define A9_GTIMER_ERR_DEBUG 0
@@ -48,6 +49,10 @@
 
 static inline int a9_gtimer_get_current_cpu(A9GTimerState *s)
 {
+    if (qtest_enabled()) {
+        return 0;
+    }
+
     if (current_cpu->cpu_index >= s->num_cpu) {
         hw_error("a9gtimer: num-cpu %d but this cpu is %d!\n",
                  s->num_cpu, current_cpu->cpu_index);
-- 
2.34.1

