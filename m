Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9E8C55174
	for <qemu-arm@archiver.kernel.org>; Wed,  5 Aug 2026 19:14:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wrh37-0008C2-E6; Wed, 05 Aug 2026 15:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wrh32-00089z-2p
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 15:13:04 -0400
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wrh30-0005ac-9q
 for qemu-arm@nongnu.org; Wed, 05 Aug 2026 15:13:03 -0400
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-44ae14b4fd6so513547fac.2
 for <qemu-arm@nongnu.org>; Wed, 05 Aug 2026 12:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785957181; x=1786561981; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=RNFhbfUR1WOcPoOvXOca2/OPNo0/qbEsLy6lhhmDq1A=;
 b=dsIuuHfjztwPuSR8nJU2yRj6cravPie7J3m1x/t6Li9hHs7cmuH57V/3y+74axXy0t
 9FQXSQFGmiaJiYMHxQtrGE/ZhBAXSrwnp4T91HCK9qtaSQpfoBJqGzUUl/RDqpLI9+G9
 CKqjUE4AJwIVu2Yx8YII89BilJDwk11Gyg3wpJia1r2K/M7mPmTnyVeKe/TU4h97YiIW
 a8+IL6iWCKAQyuI3pqSoJnWn2+VgeqJUmq8PecsIG3xDjuamP28nmo5Qu6XyuI1TfLHs
 I+40wC+MaVu/hA7X4tpQY1Xqp//8osS3Tae79/myE9rkmw05MQSvMxnyBmy4rilrTTwC
 k2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785957181; x=1786561981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=RNFhbfUR1WOcPoOvXOca2/OPNo0/qbEsLy6lhhmDq1A=;
 b=TPPp3Jb93hVr+BSGuf5bwO8gUAbKG2DLRwRPw5RiyDyECGaW5WXPTne8Jqg/miWxtU
 mezeV/44v/xeM7lhYo71DrOxnk1Bkj2BcX4hHgJuM8XfTzwLe5t2s+kkzhmeiIKAfBVz
 8tq4Jgk3/9PZD6APgJ5A3oPz/+ebnxfQ+q9L4FqVshJy1V60wsmjFjVatWhR1skthCI1
 p0ek3jZu2Z2O8ENX3t9R+NnhBY74+ReBKtATqHdq8Z5WvpOkz/yItMKvrZ/RaqzWR6+V
 3s8ZdphbUEGa9SgQZ0FFofhqwgvgVqmpG9qEimA3epwTsa7DFzwDM7wz1JmXWvr2V0Fn
 RIpg==
X-Forwarded-Encrypted: i=1;
 AHgh+RopchwP/WhhalSsqtHWZK1FPcDm0RVshvEIxwUZK4NhSlHqEqQ6QUjUDxrtdxtkUF0+m1e1Biyb/A==@nongnu.org
X-Gm-Message-State: AOJu0Ywzy9bNzR5nrIscmfdGQzqk1MeG/9Su3sOUeuVBmWWl5tjSTjDS
 XYCLqQDEh0RxAmdb50DTQEQiiRIBZAfwyFSULGVG/7lEYfNtWOpJlAGT
X-Gm-Gg: AR+sD13Tlka+y69LxN59i9J7+KvyxwZCcWPToDkRHCnrItxsPsphIACIe5rKYiTc3KF
 UKwM3DV5Og4cmNoyt+83deRunkUr8LQtWJsASUfERyM7uXJt+43zHWEGx6QiJwazLqY13Pqa++S
 uVQ5s3rrdaFziuzkRBM9EdYZ1F0Ep+7US4ffZECViFr4OcaXbBVBq1yPbazTPXKOqNB8XOeg26U
 UzkdNVL2/CPidhqm377ccn6YEoi6dahUKpEwcVg58eEkGx/5ejss2xbyT1uQK4CnJ/noMTY4aO0
 Yk4sjY12pdHkchmo+k6Zfk4z4wVt00mrX46oD9YDQnXgd6xxGq17PfnCt85QXcFE3fgyZGDBuhm
 NaZDCVQS5SE9mlA+V/YqtCV3kpkdfGXx2kURdeOF3Qe9jV4ZI1N8Crj+JHOCnWuJJMxcNmLPVjc
 QG7v89iYAI8f2HEW/0HCW+juxbmeu2Sn8QuBYcLwlWMIWKSHP9flmV4by86Py5ltKov2/haCMii
 9sR3yDJJL7R5R8=
X-Received: by 2002:a05:6870:82a7:b0:459:88c:af5 with SMTP id
 586e51a60fabf-4599f1dfb9cmr4874134fac.21.1785957181063; 
 Wed, 05 Aug 2026 12:13:01 -0700 (PDT)
Received: from HPE-2MQ6131DV6.ams.hpecorp.net ([170.85.98.248])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4599dd615ecsm3494867fac.0.2026.08.05.12.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 12:13:00 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Simon Xu <simonxhy0404@gmail.com>
Subject: [PATCH 3/4] hw/arm/mps2-tz.c: fix AN547 APB PPC EXP0 MPC ports
Date: Wed,  5 Aug 2026 14:12:56 -0500
Message-ID: <20260805191257.11303-4-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805191257.11303-1-simonxhy0404@gmail.com>
References: <20260805191257.11303-1-simonxhy0404@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2f;
 envelope-from=simonxhy0404@gmail.com; helo=mail-oa1-x2f.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

The AN547 TRM defines them to be on ports [15:13], not [2:0].

AN547 TRM: https://developer.arm.com/documentation/dai0547/latest/

Fixes: eb09d533d87f ("hw/arm/mps2-tz: Add new mps3-an547 board")
Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
---
 hw/arm/mps2-tz.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index f101c1b7c3..81e64a91de 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -1048,6 +1048,19 @@ static void mps2tz_common_init(MachineState *machine)
     const PPCInfo an547_ppcs[] = { {
             .name = "apb_ppcexp0",
             .ports = {
+                { /* port 0 USER MEM APB0 */ },
+                { /* port 1 USER MEM APB0 */ },
+                { /* port 2 reserved */ },
+                { /* port 3 reserved */ },
+                { /* port 4 NPU APB0 */ },
+                { /* port 5 NPU APB1 */ },
+                { /* port 6 reserved */ },
+                { /* port 7 reserved */ },
+                { /* port 8 reserved */ },
+                { /* port 9 reserved */ },
+                { /* port 10 reserved */ },
+                { /* port 11 reserved */ },
+                { /* port 12 reserved */ },
                 { "ssram-mpc", make_mpc, &mms->mpc[0], 0x57000000, 0x1000 },
                 { "qspi-mpc", make_mpc, &mms->mpc[1], 0x57001000, 0x1000 },
                 { "ddr-mpc", make_mpc, &mms->mpc[2], 0x57002000, 0x1000 },
-- 
2.53.0


