Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A20CA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:10:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4dA-00067y-AJ; Tue, 26 Aug 2025 21:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4cb-0004iK-Ap
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:06:41 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4cS-0007Lu-Ou
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:06:41 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-771e1e64fbbso3798769b3a.3
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756256766; x=1756861566; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MNK4RwSNEHIMPmqrD7172d7GDCHMVFkY8KsTfaRpDOY=;
 b=s0l0hDcNt8/DcE+deJ0/XfH8u/ROiwuTh5LGRiR6ErUwa2ybah02Vdqrz7S+M20JjB
 w+12gt0UEixjF89KmUMtvXlW7lGIU0pTDEAxepG9BS2wVdQ2S7AD5NmSGAS8Wzlzcr1l
 syk8hhgv0rsDytZaSGuIS9vWMocMxt9V1ABZJ/j/fKjlQCSZSQAV3A/SsmaRKK3LPCQK
 hoIoHNuPKdeJHuNpgqQg15gXwP7JaaScIZYCLogKaNZRQZFkqbn3TIxWi1M+E48112iw
 sw6tEfYa204ikYVIMpLMutZwxUQKemiX89xvIAZ+yv1qVADW/zGRbj5moc60B8w8ZpFK
 oByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756256766; x=1756861566;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MNK4RwSNEHIMPmqrD7172d7GDCHMVFkY8KsTfaRpDOY=;
 b=mjGMzFqh/5+IYTNEtF6nzmnJtZae7l+BYHnrwpC7OCFrKixE/HPpE8cNNPk2QuiIcc
 0/48UN2ZaNNbsJ09CbLmVYJxiugQdYzZMOIfFuhwUTdT9cqAmO1oeWdC+mG7BW1sc6IO
 VRBQoOKi6CSssA5pUrXdE1OLgUsu6BsbXwFfzE4J6LtmFFVMXpRVi5qsjNiPkrXmOxrl
 9gcqGkjLT6FnFGjt9nfwbgdSrHApr3VpC1sSSHfXrUoi9hlrx6TOADg3VXm+KVRLxMWj
 d68RInNM6xry1kJgpi2CkOGR/ge4piYv0DMtMni7qBMrqo1kMoHMhlIAxn/2thc90IVc
 tqOw==
X-Gm-Message-State: AOJu0YyMrLh+1YBtcfPyhquZxA3f/rowKmtSOoFUw74mKG/GO8++tH1I
 t4YJaTuS9n+E3RJnbSZ//pikSIi/5zrPO0hf6A15gtr8rbCm+eTI3J9Z3fQkq0FGi1qI0NfYrIM
 8iBISyb8=
X-Gm-Gg: ASbGncv7uLc0Sls2Dp/PMg4WerpGxTfpFT2AV6ETd03V5eSHe1InL1rT5OmtKYTN9nM
 tAVmxCH08/P1hznjz27vFeBrks16AI4Caj/fTRUkm3LTGHUizf3G1b+i7lBzBfj425cM/sZ2PzZ
 k4gAUP9EKW90uY/i4DR2opHLrx8rH8sLNzwwM60CkkW8Bzd7ofbZFbb+R+OqSK0y+o/lOoYhClg
 gRQbSNrHH/HZg0U03+BYCOfU/20zKo3reYTV4mAZmOm4pP9Mz0cp2zKjvBIZ2MQqr4uNOD8+zod
 Ld7d2iGAKpEKINPyDd+PtjC5nto6G/6G5EttJFB7F004oO7aHUqNxICX8uad2s/BTLjYoLJdFpI
 HBJiCrUi0c9n5h/scIJLQmdFRgo6azTwAs9jH
X-Google-Smtp-Source: AGHT+IFLUsyh29Y1qWYTaS6y/mX+P7docc8VUfhYLI2Redz8MulE8ZzdVpvAM2bW5WKOWkud/xJWIw==
X-Received: by 2002:a05:6a00:138c:b0:770:2c2f:6435 with SMTP id
 d2e1a72fcca58-7702faafbcemr21147179b3a.20.1756256764783; 
 Tue, 26 Aug 2025 18:06:04 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7720274534esm1419241b3a.47.2025.08.26.18.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:06:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 10/61] target/arm: Use raw_write in cp_reg_reset
Date: Wed, 27 Aug 2025 11:04:01 +1000
Message-ID: <20250827010453.4059782-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Reduce the places that know about field types by 1.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index e2b2337399..ed40e102fc 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -192,14 +192,8 @@ static void cp_reg_reset(gpointer key, gpointer value, gpointer opaque)
      * This is basically only used for fields in non-core coprocessors
      * (like the pxa2xx ones).
      */
-    if (!ri->fieldoffset) {
-        return;
-    }
-
-    if (cpreg_field_is_64bit(ri)) {
-        CPREG_FIELD64(&cpu->env, ri) = ri->resetvalue;
-    } else {
-        CPREG_FIELD32(&cpu->env, ri) = ri->resetvalue;
+    if (ri->fieldoffset) {
+        raw_write(&cpu->env, ri, ri->resetvalue);
     }
 }
 
-- 
2.43.0


