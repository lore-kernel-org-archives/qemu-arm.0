Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp3643297ejd;
        Sun, 21 Apr 2024 07:15:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWNd71fhunGMvpm+XWChXfmCEM4UDACozSPdSeSM40rb+MT8wpu2sv0z64FLif1Nw3OIC+fTQmVCa00kgXIrhRQsYb/y5vR
X-Google-Smtp-Source: AGHT+IH0BmkX4hOSwSYheXrk2SzGQG02U+tQBUqI28Wj+uJCUOTLcVJlNZ2uIE2e7VJCLFuOk+UB
X-Received: by 2002:a67:fe8b:0:b0:47b:61e9:b6d6 with SMTP id b11-20020a67fe8b000000b0047b61e9b6d6mr8160630vsr.23.1713708957983;
        Sun, 21 Apr 2024 07:15:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713708957; cv=none;
        d=google.com; s=arc-20160816;
        b=BWIeILhx9ywjZWItqI3EX66OCiPugcmwJQlj56FjKlilOqxFv95TWWprxMUWmK+oUY
         SGmCBSC9LEZwNxCzywA+9eeUzqFksDUpz4WCco37fJQJZ8sCL4m6znp6emP/bB4YlMPK
         D3VKWLMZ9SBswygc0eLKvRBp5fnVPtWgXmy4nw4cmzGcPtvjF8uu/o9TOFa5XFInLqJg
         krD6oha7qDNBpQWg3KImLf5BerMGW4xE4gOuUe+faL7SBnBgIksO3mMy3HkzXaBDUGG1
         cBYpUoccQRrNnpebBPMvm9bjw0Ct7m3AA2PGJqD2RRU0la7qVWGu7dRORoMia+uI8Wpo
         FLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature
         :dkim-filter;
        bh=g0/8oYtYtCE3CzTawtDsudcNlcw/CRxYUBxIoT8mGVk=;
        fh=UqCteReP5SOZr0swl/Z0l504TnQKYXpgGDlWwsBN4Mg=;
        b=BKOFPrPyJWG8ZL5HUX0q8WznwCRCx3TxUH6bR2He1S5WKZpjt/LBAsKRniXCjAaN00
         jJ1dG7W0ctc2ocSjkjLc9nu6m9zH8cdxwclDycY+1Hb4NUQkMq+Ywcy94TLF0OTsl8f7
         MhkJOnK5JTAbdHK85ILMT3MU00sQNs3ktZmDOqfvJexKY0G5dYyn+2mY7Lh2is5SnO3R
         8V4fLosZmPnWK2HynDkkJuy7+7QRQcfoXj1vFUJ+PE8dpw2UqiGOH/TC91ZCXazQ3I1A
         9ymbyC76UrcOrUCW7ePvf00niPibl5tf0srqqdYT9KCgOGzJcycXCp3TcPXojYA+faAj
         eh2w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=6kSGk0+N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r12-20020a05610221cc00b0047885742228si1218145vsg.184.2024.04.21.07.15.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Apr 2024 07:15:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@telecom-paris.fr header.s=A35C7578-1106-11E5-A17F-C303FDDA8F2E header.b=6kSGk0+N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=telecom-paris.fr
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ryXyP-0006xD-Th; Sun, 21 Apr 2024 10:15:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1ryXyO-0006wk-Pk; Sun, 21 Apr 2024 10:15:16 -0400
Received: from zproxy1.enst.fr ([2001:660:330f:2::dc])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ines.varhol@telecom-paris.fr>)
 id 1ryXyJ-0001Sy-5q; Sun, 21 Apr 2024 10:15:13 -0400
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id 66A25C0CA6;
 Sun, 21 Apr 2024 16:15:07 +0200 (CEST)
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10032) with ESMTP
 id fJOKSlKg9st8; Sun, 21 Apr 2024 16:15:07 +0200 (CEST)
Received: from localhost (localhost [IPv6:::1])
 by zproxy1.enst.fr (Postfix) with ESMTP id E9386C0712;
 Sun, 21 Apr 2024 16:15:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zproxy1.enst.fr E9386C0712
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telecom-paris.fr;
 s=A35C7578-1106-11E5-A17F-C303FDDA8F2E; t=1713708907;
 bh=g0/8oYtYtCE3CzTawtDsudcNlcw/CRxYUBxIoT8mGVk=;
 h=From:To:Date:Message-ID:MIME-Version;
 b=6kSGk0+NKKjhyKH/6quYk5qVi5nOqwRpymrwujDWmCDPfNOtkRQZiVsRsTZ1SiyD8
 f9FeZGAl5sPK3mrPySAnMFKMngo4i5+s3KEg+WKvZpJzLmAxRWqpAMy+S62UOXUocE
 uuTj09QPzuzIIR8TLDnYnhYwnT8Lwl4od2pXIi7k=
X-Virus-Scanned: amavis at enst.fr
Received: from zproxy1.enst.fr ([IPv6:::1])
 by localhost (zproxy1.enst.fr [IPv6:::1]) (amavis, port 10026) with ESMTP
 id kr2wYH-Sbvf5; Sun, 21 Apr 2024 16:15:06 +0200 (CEST)
Received: from inesv-Inspiron-3501.. (unknown
 [IPv6:2a02:1808:204:e56c:d081:2a7:415b:bbbd])
 by zproxy1.enst.fr (Postfix) with ESMTPSA id 3C70DC060B;
 Sun, 21 Apr 2024 16:15:06 +0200 (CEST)
From: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
To: qemu-devel@nongnu.org
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org,
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/misc : Correct 5 spaces indents in stm32l4x5_exti
Date: Sun, 21 Apr 2024 16:14:23 +0200
Message-ID: <20240421141455.116548-1-ines.varhol@telecom-paris.fr>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2001:660:330f:2::dc;
 envelope-from=ines.varhol@telecom-paris.fr; helo=zproxy1.enst.fr
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: /Pk+Sz+Nx+Dq

Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
---
 hw/misc/stm32l4x5_exti.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/misc/stm32l4x5_exti.c b/hw/misc/stm32l4x5_exti.c
index 9fd859160d..5c55ee4268 100644
--- a/hw/misc/stm32l4x5_exti.c
+++ b/hw/misc/stm32l4x5_exti.c
@@ -59,22 +59,22 @@ static const uint32_t exti_romask[EXTI_NUM_REGISTER] =
=3D {
=20
 static unsigned regbank_index_by_irq(unsigned irq)
 {
-     return irq >=3D EXTI_MAX_IRQ_PER_BANK ? 1 : 0;
+    return irq >=3D EXTI_MAX_IRQ_PER_BANK ? 1 : 0;
 }
=20
 static unsigned regbank_index_by_addr(hwaddr addr)
 {
-     return addr >=3D EXTI_IMR2 ? 1 : 0;
+    return addr >=3D EXTI_IMR2 ? 1 : 0;
 }
=20
 static unsigned valid_mask(unsigned bank)
 {
-     return MAKE_64BIT_MASK(0, irqs_per_bank[bank]);
+    return MAKE_64BIT_MASK(0, irqs_per_bank[bank]);
 }
=20
 static unsigned configurable_mask(unsigned bank)
 {
-     return valid_mask(bank) & ~exti_romask[bank];
+    return valid_mask(bank) & ~exti_romask[bank];
 }
=20
 static void stm32l4x5_exti_reset_hold(Object *obj)
--=20
2.43.2

