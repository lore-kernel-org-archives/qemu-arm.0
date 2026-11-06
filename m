Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B2F606A326
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Nov 2026 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wde75VUy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xPMwv-0005yX-A4; Fri, 06 Nov 2026 11:37:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMw4-0005pL-Bj
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 11:37:09 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xPMw1-0006P9-CX
 for qemu-arm@nongnu.org; Fri, 06 Nov 2026 11:37:03 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-491846221ffso737143f8f.3
 for <qemu-arm@nongnu.org>; Fri, 06 Nov 2026 08:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793983020; x=1794587820; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=oUo4+D9Mg8LRDc34U8PXawCEJelkdTLuEOZ0iDVwa0o=;
 b=wde75VUydq1NjKsbaQYp/l2wZ4G1wHI39sCx6CR4zXcqNOcce4eNDc71Qu4NiH8kSu
 Hqi9TPrfiFUFrjWv2KmTn8KagG2SvsBhaNpymmnGX5np+/8Hu16MsA4aJ68EIlmlwCk6
 EtKGODnKGxeznTId4WtGFThpxKM2IcuEVOCK41CL48UpPbpcVX52yNF1zIRRVG/uTLHT
 CXN51edRu0w/MvE3VcPLbbzGryFxvTxorOTQb41ixHGSOBBfZPLvo9PSxW9zL0AjFEPX
 /H2jPoxHqBCf67TlkVQXhlci5C6pgiN5eYBise+xt5DEY5YPtvN6sUbnWOYFYlWzPa9P
 joCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793983020; x=1794587820;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oUo4+D9Mg8LRDc34U8PXawCEJelkdTLuEOZ0iDVwa0o=;
 b=fmol4lGzrgspXlC3/gsDvYj65B5nTQO2ePNP2RiOpZ+FV220aiMPYMdSTN+ULpgzcj
 4rpPozlDk28fWarLvzXitErm9XUwIXkBa8el5JYNz9Q1N4FS3qgUERnX7QfkNATlHfOv
 mg1d32Lbt2P/HQRvgIutozMWvb854Nb4IuKTSEbWxfauE+y99Cx+7pkx49KdSAeOjK2y
 ULF5wpMM+UXwcV8EmThATBWyKJflzO+7KeuNRjCYnad/H71FS52XqSGUJ4J/Z16kfrsW
 66zUg1CZ910t+dF0kydIP0svioafDIEp2jQfU5U48g5uxTD75sRhWr8C8b/A8Nw6NwTZ
 7nHA==
X-Gm-Message-State: APuU4Z8R+vKjm3VNgecuDXjk2eetE0VRtvJz7k0NPlwekcZLghaHQMr/
 ryq8QKEx2n37xk9vxPMTs4DpD8jXT/QB4aCQFoNzx0ljDljjsN3XOOvuuV/Vvo9wLgi+x8VHcMd
 ntxRxD1o=
X-Gm-Gg: AYBFou3K5AAGzMBRLHvpS8zCA5a/Cc4iWPUyv+z0E4KKfYc45nDKceqZtfxTrSJc/K3
 d5KKt+FSdre3b9YN2XRwtehu5nX74mdXP7ZHdC++KxDPCL6cFJv4Re1tAzyktIxpXBP5mMlh41U
 5KMkBHPEGTbyi2dEMhYWF2+Osrnh7Oz3Gu36SFgY8CYkV1Yqylj6qX/a2bFGld7bRF7ys3W4pV/
 UrQMn7zEsEgsRQ3e1qYMWp9qcCQUMMLKdv9wfXdux5f2V4GIdlif6R9hcLz8362M9U9xSRYdw3h
 ikGwx0UwtJ4ZHqASDkJtvLyoaRxFykayzcWFbhM7Tu3GThUbvtY8YsjaqPspL/ov8XrtV9bl/tz
 Ep128my0nvwdY1/0gcne5IUamr5ttnhHY8AhoRqK2pgH+Myjewxe2I7zxSC3unU5K/JwQwF828E
 UNrhTowW0hp7NgmYIXtgh4gdInWaR903v4fz3mCbWkH5IXb8o3FEElyQ2Lzap+fGXZQWmkIoEWO
 pdHXHrFBY3+N3/OgznIz6fcnkAWzAVTBnpHwxEqhhSHpufHOb6v7iVNQ3SwWf5sq4WYZEm36z33
 k1pfHlwnpPnGwwqlCabqjf2eQ+gXY0xt0tBJ72bmVQ8kUmgIcjOMt+o6HkvbqfbW1saKP3LgYbO
 x1VqP2UKwtVJokfPPo8iUKXIrH3T5NsJLEg==
X-Received: by 2002:a05:6000:2c03:b0:493:28c4:331e with SMTP id
 ffacd0b85a97d-49328c435cemr3559926f8f.28.1793983019907; 
 Fri, 06 Nov 2026 08:36:59 -0800 (PST)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d3d60e78sm4517912f8f.1.2026.11.06.08.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:36:59 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Chao Liu <chao.liu@processmission.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 for-11.2 1/2] hw/watchdog/wdt_imx2: Set vmstate
 minimum_version_id to 1
Date: Fri,  6 Nov 2026 16:36:56 +0000
Message-ID: <20261106163657.3825938-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106163657.3825938-1-peter.maydell@linaro.org>
References: <20261106163657.3825938-1-peter.maydell@linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In commit d9abd0253be90 we made a non-compatible migration state
change, and set version_id to 1.  However we forgot to also set
minimum_version_id to 1, so the state struct now incorrectly claims
it can accept migrations from the old version 0 format.

Bump minimum_version_id also to 1, so that attempted migrations from
the old QEMU fail cleanly.

Fixes: d9abd0253be90280 ("hw/watchdog/wdt_imx2: Remove redundant attributes")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/watchdog/wdt_imx2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/watchdog/wdt_imx2.c b/hw/watchdog/wdt_imx2.c
index f8129625e58..abb8edfae25 100644
--- a/hw/watchdog/wdt_imx2.c
+++ b/hw/watchdog/wdt_imx2.c
@@ -224,6 +224,7 @@ static const MemoryRegionOps imx2_wdt_ops = {
 static const VMStateDescription vmstate_imx2_wdt = {
     .name = "imx2.wdt",
     .version_id = 1,
+    .minimum_version_id = 1,
     .fields = (const VMStateField[]) {
         VMSTATE_PTIMER(timer, IMX2WdtState),
         VMSTATE_PTIMER(itimer, IMX2WdtState),
-- 
2.43.0


