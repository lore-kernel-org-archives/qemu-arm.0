Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4E3CD4F50
	for <qemu-arm@archiver.kernel.org>; Mon, 18 May 2026 16:04:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wP0SV-0007Dd-5f; Mon, 18 May 2026 12:04:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wP0ST-00076U-Mr
 for qemu-arm@nongnu.org; Mon, 18 May 2026 12:04:46 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wP0SR-0007dr-Dx
 for qemu-arm@nongnu.org; Mon, 18 May 2026 12:04:44 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-48fe26a177cso17667575e9.1
 for <qemu-arm@nongnu.org>; Mon, 18 May 2026 09:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779120282; x=1779725082; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ufefbwsKMhzpZARdFsQrTqHVtQOsOsH0aXUUe4C0qkg=;
 b=RenoWLfHyBKwIEoQIfqyEexuep41v11BbB4VQv7x37IQsGqv/9lvp6NuD5zO4aKcle
 s6qc0IIHyqz9GR4Nsltcofpd9SXX4XuYRCh0gxCDpVUmZ+vnfOv0vJ8wKUBjhS1GPFFb
 rFwXaGj4b68U/+iFFfaYFlGAgylOl5nKDy70KV+7j79DdPSYwRBiwyt1DXK8ga+c/92A
 VIxq8e6csUKFvICj056aPd0de/B0D5Bz/100p4i3qPK1zcn1iHj2v2FGO28a+Sgtagc8
 c6tZrNDlCR8EgFTLjU2B2IHHcFRq3pklDQr9QJcDTQMUwvWDlN9ChKpqNNsPiMMbnOK4
 of4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779120282; x=1779725082;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufefbwsKMhzpZARdFsQrTqHVtQOsOsH0aXUUe4C0qkg=;
 b=P9ljPwUO83rZuxf8RiNGlQa+ZH6oKKlXsKAhXAXYkeqXw3/sz/hSEaM7JQLH/WwelK
 OGkfmfgtPdf32tqU0BvOjseaFzlwUkd3scH/AFjxzTit+Nw89QApbMVaITSZ6loWvCGF
 g+cLdIIPqUQFKBeB8Kc10eyTtYfJ/H6g2pmAPN+5yEfV5d0jPvFev0xlMLvi/EG1a0Wy
 diGmfhW1wa0Iohr+AN9+EMSsGOs7tX/SG9rX1BvOZ181Xd4oMTw0mEYVhmGAMmv2PNRP
 AHvoR3fmVMjgpTuDLTIxpzn+AY5OjHAbuKv5MPsuc/thFp2qRlxbgyf5IMLRsV7WtJMt
 87LQ==
X-Gm-Message-State: AOJu0YwI/4f65LBKSrUsxIfglapSqDf4j/YNPTniqBhDqEHr3l+lQhUD
 6znoiS1pEsJnyqETRBKtxNBvzN2iZtwy+m9l5H+gCSZaAwI/5RIwKBymrrOg31nSDcy3fF9Aygf
 ztzZU
X-Gm-Gg: Acq92OE6P7dHTHXXtV4ThcTGqXh3g7mZbLCjlWkF5Hcxy75mx6t9Dw+sFoG2+0Ygu7y
 Bd8XB5N1uYIdlJRllNBLfaemDR0DG7Vo/6ZyzoWYOO8Ms5w/68sOqondad0g33PsV769UqT+n4o
 oMCseybjloNhLVMsmV8IB2l2UzFwMMFVZShSOAiLH516bxKm5Y1GhCwav2+Fi+jVqhvzi4u5Zql
 lqqjKYVsSvViu3/9Y0+X2ZaxSNcHa5QwMmkO5WdGuO474HTpkmRyqPA515YAlsjlmroYDW91rSW
 GAdNPgEklj4DVfdJlNv0hwRwPDqd78ulmM+ByTUUHpYcbUS99M4n5MDP5tLbefduF3kEEUVRAt1
 c72KFNm0dcN0RdnVwB/K/qKkAfYegVevsjZHqlDjWNgjCLwGWd/oWte/m5mF+lSYkwbrJFYgnp1
 DxSe2zE2F4m5Nzm7LQX5K0Hxcgg219SIsUGtAVOUbOL4kPCOMHdcVgkHqj/hX4QB6liGnZq8R3p
 cZIPiyE6ngmXQRzi4KRGWS3GCiwgExRioHJgJ/0rw==
X-Received: by 2002:a05:600c:8599:b0:490:778:4fe8 with SMTP id
 5b1f17b1804b1-4900778509emr84516355e9.25.1779120281864; 
 Mon, 18 May 2026 09:04:41 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45d9e767cb9sm37060577f8f.2.2026.05.18.09.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2026 09:04:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] tests/functional/aarch64: Bump up timeout on vbsa
Date: Mon, 18 May 2026 17:04:40 +0100
Message-ID: <20260518160440.1037245-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

On a debug build, the virt_vbsa functional test takes about 2 minutes to
run on my machine, so it tends to time out. Bump the timeout to 4 mins.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/functional/aarch64/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/functional/aarch64/meson.build b/tests/functional/aarch64/meson.build
index 9803f66299..e81afd6c39 100644
--- a/tests/functional/aarch64/meson.build
+++ b/tests/functional/aarch64/meson.build
@@ -17,6 +17,7 @@ test_aarch64_timeouts = {
   'tuxrun' : 240,
   'virt' : 360,
   'virt_gpu' : 480,
+  'virt_vbsa' : 240,
 }
 
 tests_aarch64_system_quick = [
-- 
2.43.0


