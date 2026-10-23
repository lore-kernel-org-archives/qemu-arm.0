Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E04360A2620
	for <qemu-arm@archiver.kernel.org>; Fri, 23 Oct 2026 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gQgs8zpK
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xKHFN-000771-RD; Fri, 23 Oct 2026 11:31:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKHFL-00072H-Km
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 11:31:55 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xKHFJ-0005on-Sk
 for qemu-arm@nongnu.org; Fri, 23 Oct 2026 11:31:55 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a1e3098ee2so11906515e9.3
 for <qemu-arm@nongnu.org>; Fri, 23 Oct 2026 08:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792769512; x=1793374312; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=nq6mGa1U1Jb7hN/w0fwb8Ul5pywvrDXTmWYtbo9ODRY=;
 b=gQgs8zpKFxcAVG9U+HG4XBJF67Yj+ojV+f90IRjJ1Ru/oiJh68Sz4Xk8+Vg2ise6yI
 3sPU9A278fNwkWKMApf2+aFLTxQS6NSD6etwtUIUW7eh0Vhcppn+zfMVgS3VdjnFdhWU
 5cbBrCLaxD4gRDgpLbmgrUUJC+Cbe5rzxeEUyzYR8psU7jC4cM5EX2gUC6hypMa8+1bQ
 FSwMeNuPTizzHGapeMr7G8JHKYPJ+RxYPUyUT7NLHzj9e+f7+0l8WAek2JJIrJNVifKD
 dxABMyysVKd/JBPWAp4O6rbYedHuge6z9IWzabMmo2eFRkjzGgftMiJSXUBMd4yTj7iE
 KkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792769512; x=1793374312;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=nq6mGa1U1Jb7hN/w0fwb8Ul5pywvrDXTmWYtbo9ODRY=;
 b=Hy4OKeu4/o8S3n8JupppUNPcr1NWxuFkJjOaA78iMJW8QaeKhY9nXZcYD3tkSogQb6
 LwkqQBQ1A3eL0YvLS+o2dKHT5fxlefov+aZOmlHXPDHtKDyO0XtG1F8k0lUPA1K5giUu
 oxawK1g9EtOF5JIEUzatbMYWhsY/aBjBcXHDfW1273Rf5t717fcVAJDEfYsMiH3/jk9M
 ZhaDvHdwFDDTY93xLuf3RbsPnnLTeUK2JZpj3Ek5ptGpopuL6dLdN1YubeaLr3CiJE3+
 +OVJeEUmX0LStjpKH5eWa9LRj+sGXQekFamw1taoDq06rPOG+HhymUsp3jn1wbFgbXfK
 Nv8Q==
X-Gm-Message-State: AFq9FYIJuHivaEjKuRgNzl3uyIlazxpFmnkzuUHp56FmtExbDwDA6+WM
 59g24FnH/aSrr6HRIaeFoRdMVts4YmyOkaAnN2bxtFuyxeXB91bqo0CqxG3gJk+WNE7ckwT8xq8
 yFp6zccs=
X-Gm-Gg: AYBFou3YVp2kq1mE1lYE+BpxpeLxZJUrRxH2ZTTu36dVxtkMOj8sbufSj4y9fZjW7+w
 Oivz8d50lurx/Vzcf161z7mCZHrw+aFmgIiV/PVZkYHcLtyy9vrAccYcuL1p0l3OsOl7Lb0sP88
 W6/wRl2XWtOexhz6RBRqXx2jI0egLI9iTOyxoAqDm2tb0ozW+puEKfQkpdQLZ30oiW3gqai72D2
 Hgurd+z2Q+8BHj4GZP+uMhu3/PEeF4h7hOgK7CKy6j7zwucGZIK5rRCINQE7SOPxBRSPNPPtnkJ
 +irCn6SECUGLcu2wy0JmzicSPxLcyOrOp+jX1G5BpDHtNMD/SExjSlqYNrt3Wl4Zbh+mbs+9kWO
 PcYz3copGauqpn11/UOzmgXB8m8LmL1pldKX5dEn+VcaJKjwJPYyMDQlWFqU1wEoQgqbkVdWPgZ
 dLC2Gb+j/QcEbFE0GPhdXXlqXuy7BNwb5JnSZN52E1BYBwBZmjPlmzxq66BF5h7l6M1QExxlJv6
 BsL0Ycg/+2/bHx/0/W4qzABBDXpSo+O+Aoxy2cBUO1B4DHgnQdBpKnpMqsLbtq0M17eh9O19gXt
 QRTLPHcRUC/O2pwSq8TtCRy7/glq1o/n+Sr/Y3LjQj93MrAdYUvs+jAQgn6p
X-Received: by 2002:a05:600c:3b18:b0:4a1:ddca:8b66 with SMTP id
 5b1f17b1804b1-4a211f2bf92mr41367035e9.31.1792769512294; 
 Fri, 23 Oct 2026 08:31:52 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a2b062a277sm12920335e9.7.2026.10.23.08.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 08:31:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH] hw/misc/allwinner-h3-dramc: Avoid shift by negative amount
Date: Fri, 23 Oct 2026 16:31:50 +0100
Message-ID: <20261023153150.1710372-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

In allwinner_h3_dramc_map_rows(), we take a row_bits count from a
register, and calculate (1 << (row_bits - 3)).  If the guest programs
row_bits to less than 3 then this is undefined behaviour.

Treat overly small row_bits values as "doesn't match actual RAM
size".

Fixes: b71d0385e97e ("hw/arm/allwinner-h3: add SDRAM controller device")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4210
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/allwinner-h3-dramc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/allwinner-h3-dramc.c b/hw/misc/allwinner-h3-dramc.c
index 10d929a3039..2a4b33aa182 100644
--- a/hw/misc/allwinner-h3-dramc.c
+++ b/hw/misc/allwinner-h3-dramc.c
@@ -78,7 +78,7 @@ static void allwinner_h3_dramc_map_rows(AwH3DramCtlState *s, uint8_t row_bits,
         }
     }
 
-    if (s->ram_size == (1 << (row_bits - 3))) {
+    if (row_bits >= 3 && s->ram_size == (1 << (row_bits - 3))) {
         /* When row bits is the expected value, remove the mirror */
         memory_region_set_enabled(&s->row_mirror_alias, false);
         trace_allwinner_h3_dramc_rowmirror_disable();
-- 
2.43.0


