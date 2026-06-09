Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC37CD8CB9
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 14:01:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWx0U-0001UI-0X; Tue, 09 Jun 2026 10:00:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wWx04-0001M3-Ac
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:00:16 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wWx01-0004Iw-S6
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 10:00:16 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-45eedcdaeaaso3835487f8f.3
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 07:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781013611; x=1781618411; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oKn4/Y05j5aFLbptqRJwElMuwb+RlJwVJzygdUf5l70=;
 b=mC3gGtv7YRqnqzn8QdbNnyRdyvK/c5Vthe77VJ411pI9CDjbr227i9HWIigTCBtHPg
 DXixs62QFpsEKIJa+yyO79HtX2gT/lXtahc824nwSb2/c2xNzhnMVf9IB/Urb5nxGpoP
 DGUEl5sOGdjhZ+gryp706fCNTTFJ+T+8fz7MQBTBl5k0I191MfRIskxUT7KXFegeqeod
 ddhlzGAA/9x/mMHdu9kammV73wEeOMoODDN+qFIsCljaiddq4lgTyoh6+dyTOjs7+Y+X
 ylZRILfmU3oQyWrAc8JDJ0rLjUk44g+mnWsNgVR+bFca8BSFQq/u1dM7Ff/CSVSvrXmQ
 aKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781013611; x=1781618411;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=oKn4/Y05j5aFLbptqRJwElMuwb+RlJwVJzygdUf5l70=;
 b=SJ5vvW9Q7WsSlA87PAK4lc5NNfuhsqqS16pPfoa3ytucQ37nlIybgSmbBO9pwwG2lD
 qz9xy4uzg58I9ev3foPIsve6h5Uwx0DZwj191Vi+KZ3aV2YIz5/xSY5T6FbHvW3+KF7z
 aobo+gnnwfsyCBzQgmwfH5GXLZW0WHcNqV5KHtrGSJz5Uh/FPiaCrCKsQYC5vD1JNRpB
 dsijimIMuELsuGI9/7iq8FclYXR56YJwq/H7zISM14ar/BHI/cNjEEPCxa3xmAYk9n1+
 nPfPIU/+Dh3QngZ+NZsHh4h/jXXe78mQDI/4p1OmycnqXVCSiRTpy01ufVISt7uVjE3A
 7Gjw==
X-Gm-Message-State: AOJu0Yx/05RVGxro2RpEoKa7Q9NNT2+30ObnAed+YKUvvzRb3fcrnbhT
 mkNqJ/ZRKpvwyJW0fOzeOqShDcXplLJHP+X38ljsgzHtXgI5ShMvViyTxQ9GcsPBUpk=
X-Gm-Gg: Acq92OFCYF2lmMe2nd1/vqxZSUy416amlD9JpwIlAlsJ3RkNBH/59bN0JHk+TOn93qA
 QzNdFMjZp8xjxb4dJ4Wf7PdaNtjalYsbD1zVUN85nDNUuK+isQVGO59U7TQbbIhKxrEWmoRchoi
 mOjQ/ajXtrozErpyM5Z8k1taOlZvr39D5kDEu1YDdiaOs1uOV2EVToTafhZBCAL7fKVlaXSSZgd
 aChdIhNqgN887X+Cccnch6BL5Mz/AaHlRP/L5uQcp8bwZhzDem8bptmxY5mC/QwaYJoV40vzF8e
 wbBu9oxgaYt0oHRPQXXqqO2/+UM9tT9bS7GQUeXFLv30aNP1FbTtTroYBoKvOfTJUA5lQ2526AO
 28rfp5rELdkW4Fp2CuFxD3ACj+n8hhYpEj6ONjSlUqov0f/AY7JT+RDEek7rur09b2qYSEqrCeV
 9u5exOyRG8ctu5GqPy9PLsTsAS5kSfjorKmA==
X-Received: by 2002:adf:e00f:0:20b0:45f:f142:d55c with SMTP id
 ffacd0b85a97d-4603063a8ffmr22276531f8f.22.1781013611313; 
 Tue, 09 Jun 2026 07:00:11 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46028a6dce6sm55397748f8f.30.2026.06.09.07.00.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2026 07:00:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 8F4CD5F9D4;
 Tue, 09 Jun 2026 15:00:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 1/5] target/arm: split evaluation of CNTHCTL timer IRQ masks
Date: Tue,  9 Jun 2026 15:00:04 +0100
Message-ID: <20260609140008.3206970-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260609140008.3206970-1-alex.bennee@linaro.org>
References: <20260609140008.3206970-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Whether the physical and virtual timer IRQs are masked are independent
of each other so the checking of CNTHCTL:CNTPMASK shouldn't depend of
not changing CNTVMASK.

While unlikely to be seen in real life we should still make sure we
behave correctly.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/helper.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 9dd8fdfa41b..f4aae0a4072 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1802,7 +1802,8 @@ static void gt_cnthctl_write(CPUARMState *env, const ARMCPRegInfo *ri,
 
     if ((oldval ^ value) & R_CNTHCTL_CNTVMASK_MASK) {
         gt_update_irq(cpu, GTIMER_VIRT);
-    } else if ((oldval ^ value) & R_CNTHCTL_CNTPMASK_MASK) {
+    }
+    if ((oldval ^ value) & R_CNTHCTL_CNTPMASK_MASK) {
         gt_update_irq(cpu, GTIMER_PHYS);
     }
 }
-- 
2.47.3


