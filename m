Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566A6CD4F3D
	for <qemu-arm@archiver.kernel.org>; Wed, 20 May 2026 18:35:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPlZK-0007p4-M9; Wed, 20 May 2026 14:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYq-000748-F4
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:28 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wPlYn-0000Wi-CE
 for qemu-arm@nongnu.org; Wed, 20 May 2026 14:22:27 -0400
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-36a35e4eefeso463300a91.1
 for <qemu-arm@nongnu.org>; Wed, 20 May 2026 11:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779301344; x=1779906144; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RuUYRHuovVEbvZDKoFulOJ76CJMsJZBODEhgWcUkabI=;
 b=O9JL60rzyMjVOfD5f24uMFLmi+e0w4bez/r4ppHyIvVdGPt9GsOCYx8Z0L7MyMsas9
 h5iK5a7ET4UokYtIwrTgAxyYI32sy0HqQu0TesUKl/TUiEbIGAR8yGKn9ZKSQOVKkNkH
 WmUiV/NZqJtx1qztXnXfkYV6gTg83bZWoM02utmZY/xEm4zej8YWGHOBoay6Mvleq9zP
 vVRQ/fKbaOc/lu9rDeNte9ER8Ztyh9qSM3otcxOgKGQGtHgbxS0Qnn1eBnuMV8uNeKkL
 LW3iTuwoudLJv40fqulDCZMqX3NKMwelnGVcToPiHsNksU8v5Y9vhE1QYV98/QL5n+qK
 T+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779301344; x=1779906144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RuUYRHuovVEbvZDKoFulOJ76CJMsJZBODEhgWcUkabI=;
 b=hl3kxPeC+irrksWsbftAJyiRy8W+8Yl38amXZ0t31dTpUsvDzvNmx74PVJ++AEWrQ0
 UeY7nhK5S1BD0gnbimh5pBLo4Uizd6ovDXlK+iaITur7PU6cVr+9iVTzq0HvGpMN7UJS
 tya8duTMA2UYmWR0VA6589kVHH3PygrB7G7g7BwL3qTPqc7vvCHelO6b2hv3f+YDaZ41
 gR7iWyD/AFlE7rGTrZm8C8fGkPIp+geSpaPU+xf9oV50TdHGdibeIJlnjW99dr/HzO4l
 NSua38witqTczKm9JERBl1FkhBzc6LMQ1q+1EJgcSasv3cWOcNr0schobmS6LVaBkEiA
 9hIQ==
X-Gm-Message-State: AOJu0Yx4ykjFXbbmTwVYwPpsirIt+k2ELRW4p0CeSk9pH1TFnKVw/wtd
 TtRu5LNPMWc8s13XBTwQc5XvW0aiVUBIxcamdsNL9m60A0Va2busouwdG0ikJvkjV8E=
X-Gm-Gg: Acq92OH5EXM+PkMdpuncCAf+MKo1FCrkwaREzQN4SEBznoPxkTYqauMsW8DoEubKzrr
 OguiIYG543QO4KW3K2wdHC+NkTJPLCFOaQhuckcZwC3O4305rqYqqcipCZk7Aeuvf72STHEUD76
 ZyZRU13Pi1r4xvbFWS6ja753p9//Ug7vbAAAbuL7/g8EuR/nBE9W1Ya+CpgDIBYUfl2qOuIUQwy
 Ws56wgPbW/JBuED4+/09wAzIO0pXB4CaZvoJg2dxVhM3v/PNFCnPH9p4+0kzZAWtfBe4V+bPjuD
 cV2Ga56XH+mFjJIaBdHDhCj/0cWwzM91n+QzkfaZ9K9XXqOblvqagsg887dZNLpu7Sf8Zqq4l/K
 Me7180UhaU3CvdlE5Pr8aigpaQ/xvoD1OuN/YC9OPbftTSBOw84pwWjZBVUuBUJYmFZXOUchwEt
 cU+SI8GlaQTRmp1yCkxQfTsxkmPzc1FLtzAVvtBTw=
X-Received: by 2002:a17:90b:2549:b0:368:ac5f:d31b with SMTP id
 98e67ed59e1d1-36951b8708amr23103839a91.24.1779301343626; 
 Wed, 20 May 2026 11:22:23 -0700 (PDT)
Received: from stoup.. ([71.212.142.33]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36a3d210b4esm274764a91.17.2026.05.20.11.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2026 11:22:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v6 13/64] target/arm: Trap direct acceses to FPMR
Date: Wed, 20 May 2026 11:21:22 -0700
Message-ID: <20260520182213.872945-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520182213.872945-1-richard.henderson@linaro.org>
References: <20260520182213.872945-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index b013dd51cb..d2a4b0fadc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2899,6 +2899,10 @@ static void handle_sys(DisasContext *s, bool isread,
     }
 
     if (!skip_fp_access_checks) {
+        if ((ri->type & ARM_CP_FPMR) && s->fpmr_el != 0) {
+            gen_exception_insn_el(s, 0, EXCP_UDEF, syndrome, s->fpmr_el);
+            return;
+        }
         if ((ri->type & ARM_CP_FPU) && !fp_access_check_only(s)) {
             return;
         } else if ((ri->type & ARM_CP_SVE) && !sve_access_check(s)) {
-- 
2.43.0


