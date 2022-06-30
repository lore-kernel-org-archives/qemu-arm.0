Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp34123lft;
        Wed, 29 Jun 2022 21:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sSQYsxcOoffOJmrwH0P1PZ9fdu9qiUehRbHylrnBbAjZxOqaPzYpdBmLx1yIKoN7dMf1e6
X-Received: by 2002:a05:620a:459f:b0:6b1:f5c1:6e61 with SMTP id bp31-20020a05620a459f00b006b1f5c16e61mr1673280qkb.436.1656564955730;
        Wed, 29 Jun 2022 21:55:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656564955; cv=none;
        d=google.com; s=arc-20160816;
        b=Kbvoreo/INB4qaTgupxlNKwCMkbiMn/wiRylLqy682Tt8GDKTMX4+GSmOvHNSEz2S9
         Kci8ssgQRcvOdktQKkiRYxyVJwkP0YHf63JF96xjvzLQKZzmNqGGFMxueB1hSqVm368i
         XTcF8GsdFEyKyoo6CWP+9szBWVFIYIuMxl7qJ3lXs3baqiPkejTkXUdsqs5W0lObZog6
         jsLbbiz95WTP2DT4628jK/SnfpgMv9d+ZypupJb6zUIyGLkk8SunvkylWXjggmL/fEbv
         6vIoH4w1H0uRLz+HW/AQOGYomw5N4YfJYLj0ZpHNpD4rCx+dCImwANq0QWqkmLhBP7y1
         JUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=Lw+1g+XzIO5FqGC0pP7rAAEex6IHNU163XV6+BxRlio=;
        b=yAyDkuaMNpex9EMJRh01tji7rfIXAEo2v6cvr4DZfo/6mMEp0X84tpuBfc5ptk9QFy
         MJPblRJcP6lEevFn0OQxZl9A50vE0H1O2DLTx10SUM/PABQfv0htKkMCCTgCHbXSyHZz
         ljEzyxpt27YneIYxmIz5vJEqzWDTmQXv/gXSF+p2NvxVMbxsRreMH3pW7TaqLq6Hf9VE
         2j4WrVXEJVG7d6c4jfmdaSHLWcXi+qLPVqxyCT80a4VTHdQ+yYmm2i5vzJquW1GS8z6E
         G2DtTDISlg8t3T91gps7pFwxp7fgrd7tr06YICChY60HWJ3+yRFD1uhsr06zyslzCxzI
         ktTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=kbKYQka7;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=XTEoiOv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n14-20020ac85a0e000000b002f935d30083si844298qta.433.2022.06.29.21.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 21:55:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=kbKYQka7;
       dkim=fail header.i=@messagingengine.com header.s=i9e814621.fm2 header.b=XTEoiOv1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6mDb-0000Uo-8D
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 00:55:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9e-0002T7-Tw; Thu, 30 Jun 2022 00:51:50 -0400
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26]:53073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <me@pjd.dev>)
 id 1o6m9Y-0006vw-NV; Thu, 30 Jun 2022 00:51:50 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.west.internal (Postfix) with ESMTP id 5F64E2B058D6;
 Thu, 30 Jun 2022 00:51:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 30 Jun 2022 00:51:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1656564701; x=1656568301; bh=Lw
 +1g+XzIO5FqGC0pP7rAAEex6IHNU163XV6+BxRlio=; b=kbKYQka7lt8EbPtcsU
 R+mffm23RExXJpaKuxeunlwo9zMVcHcCIORaxLhEAli6+92OHIO5uM97Dv5Q1JQj
 Q+Wbff59ZLmIyEPy5CcgYSU7pJAeFnnqjienjq/KoAGqoYxJrfEaQ8cD9Dg6Z5/j
 aKO7Vv6gsLCzgye+QiK7ImpbWWr5TRc3/Nro3norY1aQyZ06J4mAZIcJj82e3gMi
 CK+g2GTBFgbtWrEOOzfVNUbVJQAwipx79ioArde/xw5IZ67IoGmde1doCUqqdAHG
 G6FdiYNJIrsqgLuZmFu4HTkAsBx8C/AVvFmH0brN3v9A34k4c6ACWVk2qqZkpJl2
 8abQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=i9e814621.fm2; t=1656564701; x=1656568301; bh=Lw+
 1g+XzIO5FqGC0pP7rAAEex6IHNU163XV6+BxRlio=; b=XTEoiOv1M+qtXJqFK/L
 zlb75zaPmuAsOH8Dt+TO9YvHfIyaqQs4uZgRbWTxn0d79s/kJwRyhaD8GuaTtBVw
 I7BWKDJ8820c83RiY6DA+fh7IKtlDLh1Wz0uCfI2vHkD8ujKimjgtbqMO9sx4CfI
 KLfuM7B4b300zS98jDoAbULDNduRyPktZ53LO9VYyg63+2kKAklfM7Z/7JK4B3bv
 BOfBrL2cI/bFH+n8hnUclUCD+0wk/U/U4nxRNkqjVwuSxzWYmrJWTF4wr4noW2QZ
 AIUV/+siyta8eqggHkOtnWoqOVGeLi3Pva7hk2mZUYaV4kipLUjbKLx/7Y72ETIm
 1Mg==
X-ME-Sender: <xms:3Su9Yvp0iL1xiupbHky8vQ2-QviXNpco4n6_gipKQMEhzxSlf2OT2g>
 <xme:3Su9YpqGoDatSEB-EaLKAhaLzeoIc2if6CPsdZbumw_8tcW7j2BHQnzwQjX45wqC7
 mTbFS-V2nPR3EXLMj8>
X-ME-Received: <xmr:3Su9YsMDoBS7eninwz8EoOzXX34Bjr3dsUkjtWJMIzmDdw_yqiYf4pyzNvYB3CYyUmgIeOmKmZO91hxdyYbs-Mp5BHXOjOOJ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomheprfgv
 thgvrhcuffgvlhgvvhhorhihrghsuceomhgvsehpjhgurdguvghvqeenucggtffrrghtth
 gvrhhnpeetleevtefgleevleelteekffffvdekheekkeejveegheelveehgeeufffgtdei
 leenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgvsehpjhgurdguvghv
X-ME-Proxy: <xmx:3Su9Yi44KmL7W0iGvJSnTQoKQUE59ZKKSANI3_sLq2PgBdyw0tPw-g>
 <xmx:3Su9Yu4DH6VchiBXMYRCVbmr_kzNvnD1J99ASjyh1SaPM2hLuTkGsQ>
 <xmx:3Su9YqgcC7CKiL3s8pFf2EaHGqMhI2IgX543bkEXHu75ORSuEpDHDA>
 <xmx:3Su9Ygtjs4j-ExWdPw1w4IjrEEcySVbRt9deien5WlluRT_8G-VbqPbmtuo>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jun 2022 00:51:41 -0400 (EDT)
From: Peter Delevoryas <me@pjd.dev>
To: 
Cc: clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au, joel@jms.id.au,
 cminyard@mvista.com, titusr@google.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, zhdaniel@fb.com, pdel@fb.com
Subject: [PATCH v3 02/14] hw/i2c/aspeed: Fix DMA len write-enable bit handling
Date: Wed, 29 Jun 2022 21:51:21 -0700
Message-Id: <20220630045133.32251-3-me@pjd.dev>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220630045133.32251-1-me@pjd.dev>
References: <20220630045133.32251-1-me@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=64.147.123.26; envelope-from=me@pjd.dev;
 helo=wnew1-smtp.messagingengine.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FROM_FMBLA_NEWDOM=1.498, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QPORWMWwO4d6

From: Peter Delevoryas <pdel@fb.com>

I noticed i2c rx transfers were getting shortened to "1" on Zephyr. It
seems to be because the Zephyr i2c driver sets the RX DMA len with the
RX field write-enable bit set (bit 31) to avoid a read-modify-write. [1]

/* 0x1C : I2CM Master DMA Transfer Length Register   */

I think we should be checking the write-enable bits on the incoming
value, not checking the register array. I'm not sure we're even writing
the write-enable bits to the register array, actually.

[1] https://github.com/AspeedTech-BMC/zephyr/blob/db3dbcc9c52e67a47180890ac938ed380b33f91c/drivers/i2c/i2c_aspeed.c#L145-L148

Fixes: ba2cccd64e90f34 ("aspeed: i2c: Add new mode support")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/i2c/aspeed_i2c.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index ff33571954..cbaa7c96fc 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -644,18 +644,18 @@ static void aspeed_i2c_bus_new_write(AspeedI2CBus *bus, hwaddr offset,
                                                      RX_BUF_LEN) + 1;
         break;
     case A_I2CM_DMA_LEN:
-        w1t = ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
-                   ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
+        w1t = FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T) ||
+              FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T);
         /* If none of the w1t bits are set, just write to the reg as normal. */
         if (!w1t) {
             bus->regs[R_I2CM_DMA_LEN] = value;
             break;
         }
-        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
+        if (FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN_W1T)) {
             ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, RX_BUF_LEN,
                              FIELD_EX32(value, I2CM_DMA_LEN, RX_BUF_LEN));
         }
-        if (ARRAY_FIELD_EX32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
+        if (FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN_W1T)) {
             ARRAY_FIELD_DP32(bus->regs, I2CM_DMA_LEN, TX_BUF_LEN,
                              FIELD_EX32(value, I2CM_DMA_LEN, TX_BUF_LEN));
         }
-- 
2.37.0

