Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8B6606A32A
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Nov 2026 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Sl1YfHVP
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xU5ig-0007Z1-CJ; Thu, 19 Nov 2026 12:14:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xU5iX-0007Wt-AO
 for qemu-arm@nongnu.org; Thu, 19 Nov 2026 12:14:40 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xU5iP-0001NK-ET
 for qemu-arm@nongnu.org; Thu, 19 Nov 2026 12:14:34 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so19086725e9.3
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2026 09:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795108467; x=1795713267; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lpvWYMwp0TsV4MHcEs4e2IgMJEKTJw3Kk55W69mntzo=;
 b=Sl1YfHVPRiJF+6ruMSm5j39C++Km8+6RdzZONEKEkbrEBzzaTI5l95O95PtF8neSOY
 jbGtFep7M/X+18wDV+cLcq8xJaNKSDtSrNXxvgRVPJrjjwor/IBmz6Y7/9zgTWwLdMNH
 TZbsU6Hjub4CMdklFEZkkelAtCkLZW2bEfFCeDdCKt5B3mPWvtzr+OhHLrzAFWBn1pPl
 NfYkkydswVL+4LksCSX+v70VxmTLFQWJz0datkv9S0UB9ZcRZrXShSvvlX+IhRcrgOPN
 71N2S9k45fiBmrxB1sivUaMo1Bc4BgG5ffvewwU5pLgDmx2mjk1SmAeOA2yyLG6tY2/6
 rcRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795108467; x=1795713267;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lpvWYMwp0TsV4MHcEs4e2IgMJEKTJw3Kk55W69mntzo=;
 b=sXnay9OokjLzdaz8vPZqiT0UAi1P4iNIigf9l5FXn5ZgdqgmlbXt/JADdNcXEbc3ii
 uKsmfC8P+kFIW1C/avMSs9fCIL4BcEE5fliP6i59j478KaXonPNjtYsn8a5aRcQXcZyi
 RIwnEFVtUdid4sBZchty85edz2DQI0d5mXS/S9fqqo8zuLaqa+GTyy8FAqNRsPiS5UHF
 16gGdnQsm5vFmehIDkiCFxEj9+9jiHs6/uTaQXVdTbYvo1x7hqxZNQqL480kq2N2s3nH
 wnVcKXcvy9MOzDZcDsSf4ef1NrHTe6mI9fzwM8JZRirjQf/lA2x4fy2oabis3RBrsIRU
 9Mcg==
X-Gm-Message-State: APuU4Z/5arTdJuyo9xJhhoCjr3vxI7jq1HxRut+h9UX+Gbc0YwjKZ6Dy
 jCfstODgjh9MXUcltbCRPr2VRJAjDwjdx1CLN+ZkwpQ/t/Y3nMAtAY6E4JbRjHocXwfEueD9Roz
 nGFxwuk0=
X-Gm-Gg: AYBFou31p59UOdr005ayGuyfzbk4ckiB0W/XAgQj1gYpQcPyhYJvI9i8VoMPQWlA2Dm
 GyilmqlSJlS8wdOZ56v06ZnY+fqH0N4qErX7z/MhPifArHdTUPSI26QDHpNWHZxzzw2g3iVgs8E
 4P1HDBjNseOLjH/UHGg+tKuiD85t34bH1TzuOznrC/KZZmIxVKGhxFxaqGXF+FsWiME2ImO5o2d
 3K2mq15l4hf93ky29uqTu55S9Z7CXH+rwgrBN5cd1iPRhUuaL0orhmR9vH0GccElvQtzFVGIdkm
 ENDv3wYzcK0paqEzudLFJURuesJx+mVxVjb5+JdkwWgTCn2LU1mfkTwxie0Wr6xjBb0P8j7nws/
 7U8C+JXsQb0ZPGSzBavXZHv2EK3mOMBvdPmYJbKmihBnQ7HBLKRxz87ym/eCAzwZeV45GRhNKvn
 gEd/rKEH8VkHMeiOqoBY4EKzUxH3tIadsyPcrIGcC1W7tevAXK85GEMbjKwZt/qdPX5OiFiSJaY
 pRhY79hUkm1Kj4EhUVjeObz5FrBllh5XgAGwkA6zsEhdJ/INjj1WNwtm2WZnPoU5nBWLW9fyKXm
 wcD3jrwrCveleZFtU+wql+/HEOSKraJXzkQCr/XBIctgXxp81COjBCZH7VJ+K/YMyF2RSktNcre
 IMFG5Gvs4OUx/mjr2WZcecaJB6AduiDoszA==
X-Received: by 2002:a05:600c:6218:b0:4a0:1b14:e283 with SMTP id
 5b1f17b1804b1-4bb887c341dmr5093475e9.1.1795108466904; 
 Thu, 19 Nov 2026 09:14:26 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884ab091sm15717655e9.11.2026.11.19.09.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 09:14:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>
Subject: [PATCH for-11.2] hw/ssi/aspeed_smc: Correct minimum_version_id in
 vmstate
Date: Thu, 19 Nov 2026 17:14:25 +0000
Message-ID: <20261119171425.3186790-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In commit 29139270d8ad70f2 we made an incompatible change to the
migration state for the aspeed_smc device, and bumped the version_id
and minimum_version_id: this is because we increased ASPEED_SMC_R_MAX
and so the regs array is bigger.

However, the old vmstate was handling migration from a range of
vmstate versions, with version_id = 3 and minimum_version_id = 1.
The change to ASPEED_SMC_R_MAX is (intentionally) not compatible with
any of those older versions, and so it should have moved
minimum_version_id up to 4 (matching the new version_id), not merely
increment it.

The effect of this is that trying a migration save on v11.1.3 and
then a load on the current head of git fails in a confusing way
("Missing section footer for aspeed.smc") rather than clearly ("error
while loading state for instance 0x0 of device 'aspeed.smc':
aspeed.smc: incoming version_id 3 is too old for local minimum
version_id 5").

Since we now don't need to try to handle migration from versions 2
and 3 at all, we can drop the complications in the vmstate struct (an
unused field, and field only present in version 3 and up). Clean
these up and set the version_id and minimum_version_id to 5
accordingly.

Fixes: 29139270d8ad70f2 ("hw/ssi/aspeed_smc: Add Data FIFO-based flash access support for AST2700")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4880
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/aspeed_smc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
index ec9ad0f747e..f82947e752e 100644
--- a/hw/ssi/aspeed_smc.c
+++ b/hw/ssi/aspeed_smc.c
@@ -1218,12 +1218,11 @@ static void aspeed_smc_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription vmstate_aspeed_smc = {
     .name = "aspeed.smc",
-    .version_id = 4,
-    .minimum_version_id = 2,
+    .version_id = 5,
+    .minimum_version_id = 5,
     .fields = (const VMStateField[]) {
         VMSTATE_UINT32_ARRAY(regs, AspeedSMCState, ASPEED_SMC_R_MAX),
-        VMSTATE_UNUSED_V(2, 2), /* was snoop_index/snoop_dummies */
-        VMSTATE_BOOL_V(unselect, AspeedSMCState, 3),
+        VMSTATE_BOOL(unselect, AspeedSMCState),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.43.0


