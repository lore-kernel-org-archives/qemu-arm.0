Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp2073321lfh;
        Sun, 29 May 2022 01:27:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxC1GAE7Y7iPsi/72E6M9aRKyU4nGbZfohwIrH4D4ZAyxScuw0fkLYTI1pzY35N5NEEI4fE
X-Received: by 2002:a05:6214:20ec:b0:461:dc16:163d with SMTP id 12-20020a05621420ec00b00461dc16163dmr41552953qvk.40.1653812854706;
        Sun, 29 May 2022 01:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653812854; cv=none;
        d=google.com; s=arc-20160816;
        b=UGg/O2I36fabNyRqr9BPMiiNS2WrO8QRgfcJkCeioRsIqksceIuCkFSoEdCIINHTBu
         JeazP2jjLVgbF+livWwEDx/my0O4QaBjMlghhejOHZiSHMKzflD1CHnW6ZqN+wURYTP5
         LYgf9Fxu5eaKpQehObbXCwy3J+IXt8CPmL3HJPCqWy9xPIWTuUqHkQPbJscKcKvDuWgb
         rg8CQ/IhckCWdE7hF8HrjbEilZFQcgMKzH6n3NDAf59z8ioyUAHz4BGGegJLyUS9t17I
         VHOZ3JS1G4zE9NHmtACzBJ0I1Hr+Hk2Rewlu3gFRvcsP9n5szduiKrsBine7pDV8oyDS
         XVmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=kdL09LF0wEk8mBmd/CcNhvuPXhBu3MYDhubty9TYOPA=;
        b=S3/mCNrPQc/knjQ3T9v/Wd48bIWZgBAoqIkbIy9N9Asv/ziqT1LccpJOg43gzFLlkc
         LCvN7xd3bu+/h9ubnhksSHlGowg91xsiC06Q2meKoz4J6cLMtx8Cq5UiwI6ea/tpJHYq
         s4ltlug5qHdM5qyo1iJRpZN5rEYrZDcmYfOwveoWmqBiXtfyc51s8fciugoOHO8prkL7
         nX0SbHprkgDDNUeEaq8Hcw5YUXGnKyaVxmnuHeNEZQhG/+TOB69b9rMlojXgYTNJew3Q
         LDLc5sR2QKXUXzWgynVAOj8Xs6dJ2FnLQq50I/e/m16Iss/zbMlgA5DgSo/o7MxLnqvB
         zGQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=p4l19WG0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bn13-20020a05622a1dcd00b002f3f4a2f3f1si4494796qtb.518.2022.05.29.01.27.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 29 May 2022 01:27:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=p4l19WG0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nvEGs-0003AG-54
	for alex.bennee@linaro.org; Sun, 29 May 2022 04:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nvEGf-0003A3-51; Sun, 29 May 2022 04:27:21 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1nvEGd-0000D8-GZ; Sun, 29 May 2022 04:27:20 -0400
Received: by mail-pl1-x631.google.com with SMTP id q18so7757905pln.12;
 Sun, 29 May 2022 01:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kdL09LF0wEk8mBmd/CcNhvuPXhBu3MYDhubty9TYOPA=;
 b=p4l19WG0ICgNwt/E8ONZnRcuZMuZ2M5tgRM1W19fe5z9sN8yalCiSP+6lUHJjfPFMb
 G1pc8AorNtpczE/D3C1zkB0/23FNTIoyJATM2sFjqquMWGtmWBA0CgMzf9mOalrBFAzJ
 1SULlouzkxCCg16XWxF07cYP/elmSegDqzE4Oo3VRNOaGNtUijmHLzjR7jssWNw7oI/Z
 t48uOECQrY6hiLJo2Iazgy2kcdz6p6LtXhd5wJCsp96eCSuEXjITRoMnZsx8cNvm+APD
 0sFUfvL1/FaSbvMxs4qDB1Cgbbp4AI7s1uH7Qrs/EK/3nzmyTxUSDkun4n9g/P1ORiBf
 ZdtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kdL09LF0wEk8mBmd/CcNhvuPXhBu3MYDhubty9TYOPA=;
 b=qBJofpedEL2BYk3zE4NJs/yi1X13iwmEZ3F5ojW0/3vU4rqHvgLanWRMI/30oCrCs6
 16Vf98rn4GHobjKl0bUbOW7K4lNOjQMbfg+7i0Z3cf/hOGlLNwy82SYTLn9Mrjwu676E
 PMExAq7/Gm2fqRSHElo/dHzBBrlYeGOZ+MDm6gKOjmL5/ty3OC2ijehn7ct4+/81UAy+
 7SHkEEJIFXfzwESZAx/Svb0apkK9cnQLuRMSU9PazbRhazf0M50aTXA0cJyK/FN/SHq8
 tj27n5kP2jz+5qt+Wy/p94J2lhLwslREIT/cepxX1rqXakSe+BuBW/cXLMKgk+0r8Tdx
 pKTg==
X-Gm-Message-State: AOAM532xTSnpCJfpaM+3oQalE9pdAvLDCL8fvjQ8TBjmO2RAotAYJpMJ
 tCshFkksUNwgNdhVkhiaocI=
X-Received: by 2002:a17:902:e9d3:b0:161:aa01:b956 with SMTP id
 19-20020a170902e9d300b00161aa01b956mr51024684plk.110.1653812836980; 
 Sun, 29 May 2022 01:27:16 -0700 (PDT)
Received: from localhost.localdomain
 ([2400:4050:c360:8200:2838:873c:bfb7:88bb])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a170902a71400b0016232dbd01fsm6756921plq.292.2022.05.29.01.27.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 29 May 2022 01:27:16 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@gmail.com>
To: 
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: [PATCH] hvf: arm: Include target/arm/cpregs.h
Date: Sun, 29 May 2022 17:27:09 +0900
Message-Id: <20220529082709.89190-1-akihiko.odaki@gmail.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GAiGL1170Tpc

hvf was missed when cpregs.h was split out.

Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 86710509d20..e595da31b9e 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -25,6 +25,7 @@
 #include "qemu/main-loop.h"
 #include "sysemu/cpus.h"
 #include "arm-powerctl.h"
+#include "target/arm/cpregs.h"
 #include "target/arm/cpu.h"
 #include "target/arm/internals.h"
 #include "trace/trace-target_arm_hvf.h"
-- 
2.32.0 (Apple Git-132)

