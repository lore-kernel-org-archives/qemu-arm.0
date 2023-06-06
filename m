Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3672451ejb;
        Tue, 6 Jun 2023 11:25:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5PsKaCBK3EY9T1NE8nPfGGKPWAJgtzxLzGObukqT5evdAbw34gKFx39t2Jpzxfup5xbCbJ
X-Received: by 2002:ad4:594c:0:b0:625:aa48:fb75 with SMTP id eo12-20020ad4594c000000b00625aa48fb75mr363932qvb.63.1686075936730;
        Tue, 06 Jun 2023 11:25:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686075936; cv=none;
        d=google.com; s=arc-20160816;
        b=XmTco5TXkkmdWtmvhrzLKLKFXZCe/5S385KpkASad2BFwB26NKP//+sugHyReQHcvG
         gY1zy1R5FUp6L+I94RX3sFXLAfkCQ7TGBAhkpg0eqjN3BwkhtQ7RAzirzD3Fs9HSZTyL
         b5DOzvIrNWngAaW6kyQdv+yfRR7B+iCzjGIhm6dXzX7nQpjxlzjaOx9jtRTSOfTK4bgQ
         nuILwdeSeCuX01KFtouKUPMETC6xtqNBgM/mwOu9ov4RGp7HZFPpR73/4TRg1Kot4UTc
         r3dj8bhAVdXp+J9j9iJtZZDjoFGPyDIuU8mYa8CB1rNoD21d8K183sjJ6oPR1P+f/Pxd
         dfwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=GczvD5gCRyP8M/QoglUTk2k8ZKRaY1cyLgOJxcG1dFo=;
        b=LGdAFcT4s3vwOBZlqdrURE/WriwRxgo1RjZ+4UE7Bp/LG17mdxOl3fFvlq5U5njBF7
         33p73H24Jo3hNq+1LSAGDDdPNw9jYI4Z9wgx3d7DaG8xekliro7nBtABefHb467lX5gH
         EOv9YQld0/HPK+4ZmHaGfeyg1h2jFEtpIKhhqxbepsrCAfnDzleINR8/pVisq9sWJz/k
         74PVIwQTIeugah/krRc5bm1jYnAvJUKaBo5DKI//4fuYrR+AYi0jD6ZSg6+VOlIMnLb7
         3mD3MvYTvzVQDMj+ofDElkSkvFf9a5Ay7WQ7E71LXIBB4g4Wu6qaXZdtS4IbhSUB8r2a
         QMyw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ge2-20020a05621427c200b006239147634fsi6692020qvb.64.2023.06.06.11.25.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jun 2023 11:25:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q6bMJ-0000j5-7B; Tue, 06 Jun 2023 14:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6bMF-0000hk-A9; Tue, 06 Jun 2023 14:24:39 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q6bMD-0004ZJ-Jx; Tue, 06 Jun 2023 14:24:39 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id D4878260AA6;
 Tue,  6 Jun 2023 20:24:34 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01ptiW0dLUVo; Tue,  6 Jun 2023 20:24:32 +0200 (CEST)
Received: from applejack.lan (83.21.93.182.ipv4.supernova.orange.pl
 [83.21.93.182])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B7866260287;
 Tue,  6 Jun 2023 20:24:31 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, qemu-arm@nongnu.org,
 Shashi Mallela <shashi.mallela@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 0/2] hw/arm/sbsa-ref: add ITS support in GIC
Date: Tue,  6 Jun 2023 20:24:12 +0200
Message-Id: <20230606182414.637467-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: LKvoaEd+7Exb

In 2021 Shashi Mallela sent v8 of GIC ITS patchset [1]. At that time it
was decided to do platform versioning first.

1. https://lore.kernel.org/qemu-devel/20210812165341.40784-8-shashi.mallela@linaro.org/

Now we are going through our list of changes for SBSA Reference Platform
and GIC ITS is one of early ones. There was decision that there will be
no option to disable it and platform version will get a minor bump.

First patch is refreshed version of v8 one from 2021. GIC ITS is placed
behind GIC Redistributor in memory space to allow use of older EDK2
firmware.

New address will be placed in DeviceTree for firmware to use - that's a
job for second patch. Which also bumps platform version to 0.2 version.

Trusted Firmware will read GIC ITS address and provide to EDK2 via
Secure Monitor Call (SMC). Same way as it is done with GIC addresses
already.

Marcin Juszkiewicz (1):
  hw/arm/sbsa-ref: add GIC ITS to DeviceTree

Shashi Mallela (1):
  hw/arm/sbsa-ref: add ITS support in SBSA GIC

 hw/arm/sbsa-ref.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

-- 
2.40.1

