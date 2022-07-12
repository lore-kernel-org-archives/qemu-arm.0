Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1714198lfp;
        Tue, 12 Jul 2022 15:29:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sFTdak90Nyq4gZODWaXEemIZ3gqhibJQGRkxt4n93X4FSOVUU9D47uWmyFlMeqsUYAoAEl
X-Received: by 2002:a0c:cb86:0:b0:473:37d:9f48 with SMTP id p6-20020a0ccb86000000b00473037d9f48mr224411qvk.81.1657664998433;
        Tue, 12 Jul 2022 15:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657664998; cv=none;
        d=google.com; s=arc-20160816;
        b=pAW/x8XgUZzb+C2biUEQDBIYSUaj+EZzb+/Ry0sNxnNKxSERYookdVUG0e9tJk7cd+
         0ddCdJecoCr6+04JmpTXDrDuAx7BgqoXL0FSBFTVhEHMnQ8Sl7tKAwTDF8A17G/wzce9
         wqJIFxKma5qPwDrMb8JXmqE+qeDIwO8/soDGrbx7ktY5QyR4y7Mog+vcOtPxPhrqSpm6
         PqFKF4ACLKiWVnU8S+8gzqrQ0jsHAyoinLR+Fwdn5ZJjv1XyY1/U7/+1uZzQ7mmp0clS
         LATuH++3s39RWE6irJrIjVu7MvMSRMvTetyfieHy5udVRG+hNBBIi6eXIzNrakGVyPiA
         Jk3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=0CoI6KZ6avna/eIj3WpIJ8W6RFVeKBzEJk7ld1BAT6k=;
        b=EgkDDd3Ioza4OYvjvksbDCRp4q1nFsuJLcP3nrZvOC2XDucKdUKS43hlR7buHO9XO6
         U5/PgpmXwl2UVMHylB7aDIXk/sEDgeH67z4pmBYGRKoPoi3f/BzLxtpRFXuvWEDGntPh
         DApgXlbf4Gm8TVelXFVpZqsP6BgsXE6i3JeArGeBNjKfALS6U6l6gDXRUNwJGhEULpmQ
         5uTpKviN53W2HFrroGBgVGh5b93lWxZLz+BLnbD0ONk44tZtVA3jJ5RhjvbNxpYl46CV
         JhzBo97FK4eqF2xgNP2cbwBmr1/AYu1UBy06zc4WVQhQd07oVsNg46If71h2kUaenfMM
         77Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=os4wykSM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d4-20020a05620a240400b006b57b073ba2si6663555qkn.439.2022.07.12.15.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jul 2022 15:29:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@ilande.co.uk header.s=20220518 header.b=os4wykSM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=ilande.co.uk
Received: from localhost ([::1]:57562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBOOC-0002B8-QW
	for alex.bennee@linaro.org; Tue, 12 Jul 2022 18:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqg-0004bg-WF; Tue, 12 Jul 2022 17:55:19 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:42488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNqf-0007yn-LA; Tue, 12 Jul 2022 17:55:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0CoI6KZ6avna/eIj3WpIJ8W6RFVeKBzEJk7ld1BAT6k=; b=os4wykSMQGSNDaRE/+ytqrzqmu
 hssCc+WUTh0JWkuN2kgNhEEjqDJ16nIpNN8CtGJW5UB7YGWm1aMU7yKZV1pHdNa5svg1iv0maMHHA
 5GmgbdDrQwcA02feCLe8hilWUOqoucNxmuU2q/naqlHCHixDr3UfGrBzi/SOPqlNK/3qSG6b8qa/Q
 0ZhzBdsXtIJ6rbB42sb31rvy6Fwe7Dms8VF6aUQLmBMUqX3KZ2Ww9vVWgynYsFNJm1hAFUOkm0LuK
 VKXduqaaqEW1xh9vd0w5aIKUqYghP46rcEA5YhvA24rj3e/QkR6UqcgJwWROApXp3aKbLtcRPXf3v
 CdZd2CEbNJEtwS9ID9vwytKcQyZk4R21rvyE+ZWvU8B8wrReEuKKQW3Dk4xLfFH9kVIOqTr0F6IRg
 bRghOL2nFUDQ8E280g6N8UiCrUa5VBqBRanCB/ygnbP1CayiRlWFxEWC7fX/9lcQNrcIJ3iG4yVDI
 7jBF8+OREt73aXN1Hw9/TL2fJvmsdLCgWLKUnj/3jrf5JOXQBnVQ1TbiAj2nxaaiHMYALLgkCWx80
 7f74GlLN78WtuZg98zwUOXXxi9TWx60SFv/1M4Mwic0BTXQrNBgzINGaSlI8H555p86BJncnhzlhY
 iy6JMncygjG8E+kskye2WaPaIxoV0+EP9Ouj70Xlw=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576] (helo=kentang.home)
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBNou-000Bqt-DT; Tue, 12 Jul 2022 22:53:31 +0100
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, hpoussin@reactos.org,
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Tue, 12 Jul 2022 22:52:42 +0100
Message-Id: <20220712215251.7944-32-mark.cave-ayland@ilande.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
References: <20220712215251.7944-1-mark.cave-ayland@ilande.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: [PATCH v2 31/40] lasips2: switch register memory region to
 DEVICE_BIG_ENDIAN
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: CUle3FV7jumM

The LASI device (and so also the LASIPS2 device) are only used for the HPPA
B160L machine which is a big endian architecture.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Helge Deller <deller@gmx.de>
Acked-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/input/lasips2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 09d909c843..7bf6077b58 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -245,7 +245,7 @@ static const MemoryRegionOps lasips2_reg_ops = {
         .min_access_size = 1,
         .max_access_size = 4,
     },
-    .endianness = DEVICE_NATIVE_ENDIAN,
+    .endianness = DEVICE_BIG_ENDIAN,
 };
 
 static void lasips2_realize(DeviceState *dev, Error **errp)
-- 
2.30.2

