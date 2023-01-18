Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp135369ejc;
        Tue, 17 Jan 2023 18:43:42 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvCSFWmOlTNti0Yd5Uvo+UL2TIkIZFw2B9114plZ3NIRHm5rJfBGtkhuHencP8luhHoQX80
X-Received: by 2002:a05:6214:2e82:b0:534:8c24:9c92 with SMTP id oc2-20020a0562142e8200b005348c249c92mr8320451qvb.38.1674009822266;
        Tue, 17 Jan 2023 18:43:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674009822; cv=none;
        d=google.com; s=arc-20160816;
        b=XFl5zotyNTqrHObLI9pyDBN3XFMehJZTjLNKu5HhZKV6M/q+WB2noYRIZ2MTjmyusx
         cBloguhRYV18llTM+WFiKsBmb4RPDMPhMAfbJqxymVN9ajINKsjCgpPTuSbBhmfpI/Af
         l9mflvJKFdZda4VmcI/+7TqGS+W/nExcVnuaj7nTxoSMmmSVu23wUeLrLsWCYC8gNUXi
         l9U712Irb5SVgzFwnDT2FGcmyVlnH1UzU1KNuJNGzOntmPWuGjNbb3jhJwVj77Yng9Ay
         41TibF3vrcGjHZMAWeHC2jXyxso+ONOJfqzfjMkdI2rEekPXGvn1FVUH7wCZzZo+s26M
         nLPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:feedback-id:dkim-signature:dkim-signature;
        bh=Z8b4TuMq0IyBoljG29VQAgDtZYdTTN29FtaPFHe089Y=;
        b=CEXtpoOP0j07V8t4ZypFeUCb7fXmBeeBhRDZKoJozGOvZmnlYR8aj380DgUQLAWV4C
         IOGcHE8zWP15uHcXmguYwQzUXqqLdZxjqDmoTnJz8AQ5PPb3QAsIA73+si2vWqWS1SPn
         yO3R3JJZitg46+8DPobkfFNy/X0NLI4QYZgLTQFMCIvcLkMJPpbSMNlgneHS3vUOioHj
         p6Ck3Ph4bBSOODel+KUedHD0Wo+/+fg6Ba7K2IxdTWhKGwuBYk21MRp3rQt06xtgDnsf
         0H6HbB2kyPTdg9i9V0vA03LtlwR7pK5D4auu4Ek7Av1WJ4FeLvnGbbflufLD9aAWrj3u
         Wnfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=wW0fx4xz;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=GMoxywx5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv11-20020a056214240b00b004c704932562si19532109qvb.74.2023.01.17.18.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Jan 2023 18:43:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@pjd.dev header.s=fm1 header.b=wW0fx4xz;
       dkim=fail header.i=@messagingengine.com header.s=fm3 header.b=GMoxywx5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pHyPI-0005WJ-8r; Tue, 17 Jan 2023 21:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHyPG-0005VE-2u; Tue, 17 Jan 2023 21:42:30 -0500
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter@pjd.dev>)
 id 1pHyPE-0006s4-El; Tue, 17 Jan 2023 21:42:29 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id DDDA15C0116;
 Tue, 17 Jan 2023 21:42:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 17 Jan 2023 21:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pjd.dev; h=cc:cc
 :content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1674009746; x=1674096146; bh=Z8
 b4TuMq0IyBoljG29VQAgDtZYdTTN29FtaPFHe089Y=; b=wW0fx4xzpT+fBpuZMG
 2qGL1pYpP1Cu/wGeTrTx0boyYCRnupYxiRlh6UfIRR1M7j2uK1du0s+W5Lgu/2Ps
 mA4SQvfBtmHCL6IAvSlq6vSOJT1E4hYLt3gTLz61Gwb5+ylSQMwg6rrhWdPkyhEi
 ZeszjYdF1pMjy6EX9hikk9nHGBonG0IEZbOgqKvcU8lK5E368C4Nap6Whp/CI6cW
 /pyO7PmDx/EIJPBtln0eqAXZTmqYqvBcMLwHUAaH7QjE64YW4Y205F8CKXHS56Er
 z48itJjyVKFhAAkZ21Wq1HPYZNXV43rizudQthT3z+uWBhSEjxOkFlEBjyIhfLfc
 4nsw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; t=1674009746; x=1674096146; bh=Z8b4TuMq0IyBo
 ljG29VQAgDtZYdTTN29FtaPFHe089Y=; b=GMoxywx5vqd4M2joGmW6H0t+nf94V
 NSkJ71uZx160Q8zv7i/s1XY50wwvVS3fJTrVp6PrZTnmTT88f+0Z8CsI/b11WHRn
 f+kxOSSrU+TfumYnnymDY3JgCeURtTvg2JHsv86w1uIyhgUJyD1qOw3/bX+GNM5Q
 X/YNAb2ppKn57LhCuymXqVYu2IsOVJiX2IelPfcmF09vNpEZ7rGtbXkMVy+BvEHB
 EQqmDb9FclJNLcLnWRUB2Xpef0BUblyfkDiQiRZ42FioSzj6SBrf5VMPRcDA5uau
 MrOaa0UQ3skLfQtYuNThjrrx69BUSWIkMwgMj+BLmxpLPtEwtH4CDvTxw==
X-ME-Sender: <xms:klzHY20ZfI7LDsCiIVTZSYeqvUKo9X-q0KBYDtarqiLyPwk1vgm9Vg>
 <xme:klzHY5HdIGhvpdujGfXu9rpG9b_-mQBujra60y7tR8hAecyFjalEz3zEjfij0aEh-
 3k8kKvwfw2hGgjgOa8>
X-ME-Received: <xmr:klzHY-70GtTc4j8zt8AEExhZluJdqXr_1OEJonHxzIwm9bMliMN-2UiY0oYxcXlV7OTTZjLsWauz4DC474qrBF3GBWBaWpuu-vGcyIn5mw4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddtjedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftd
 dmnegoteeftdduqddtudculdduhedmnecujfgurhephffvvefufffkofgjfhgggfestdek
 redtredttdenucfhrhhomheprfgvthgvrhcuffgvlhgvvhhorhihrghsuceophgvthgvrh
 esphhjugdruggvvheqnecuggftrfgrthhtvghrnhepteelgfeuleeffffffeekiefghfej
 uefgtdfgteeigeekvdefffevieekvdelteevnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepphgvthgvrhesphhjugdruggvvh
X-ME-Proxy: <xmx:klzHY32J0_txIZ8p69P-OCa0gcReiEyhsWP6UpDgblJ0bcgj4Flj5w>
 <xmx:klzHY5GcF6gXDpatYFxOgjfYQKdaLGT8k1nO7uA2hZ1XJ9Dt9LYAww>
 <xmx:klzHYw-MSl0ankL6rpmEHKtGeujcInZ9zqQC84m6tYbVS3aefslQnA>
 <xmx:klzHY_b0SIQP_AUjxar9RjfEZ82AqmtTIOwP7yjUM41mNQVvIrYlJg>
Feedback-ID: i9e814621:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Jan 2023 21:42:25 -0500 (EST)
From: Peter Delevoryas <peter@pjd.dev>
To: 
Cc: peter@pjd.dev, clg@kaod.org, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, hskinnemoen@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, philmd@linaro.org
Subject: [PATCH v4 5/5] hw/nvram/eeprom_at24c: Make reset behavior more like
 hardware
Date: Tue, 17 Jan 2023 18:42:14 -0800
Message-Id: <20230118024214.14413-6-peter@pjd.dev>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118024214.14413-1-peter@pjd.dev>
References: <20230118024214.14413-1-peter@pjd.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=66.111.4.26; envelope-from=peter@pjd.dev;
 helo=out2-smtp.messagingengine.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 6FjyKFPIhkye

EEPROM's are a form of non-volatile memory. After power-cycling an EEPROM,
I would expect the I2C state machine to be reset to default values, but I
wouldn't really expect the memory to change at all.

The current implementation of the at24c EEPROM resets its internal memory on
reset. This matches the specification in docs/devel/reset.rst:

  Cold reset is supported by every resettable object. In QEMU, it means we reset
  to the initial state corresponding to the start of QEMU; this might differ
  from what is a real hardware cold reset. It differs from other resets (like
  warm or bus resets) which may keep certain parts untouched.

But differs from my intuition. For example, if someone writes some information
to an EEPROM, then AC power cycles their board, they would expect the EEPROM to
retain that information. It's very useful to be able to test things like this
in QEMU as well, to verify software instrumentation like determining the cause
of a reboot.

Fixes: 5d8424dbd3e8 ("nvram: add AT24Cx i2c eeprom")
Signed-off-by: Peter Delevoryas <peter@pjd.dev>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 hw/nvram/eeprom_at24c.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index f8d751fa278d..5074776bff04 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -185,18 +185,6 @@ static void at24c_eeprom_realize(DeviceState *dev, Error **errp)
     }
 
     ee->mem = g_malloc0(ee->rsize);
-
-}
-
-static
-void at24c_eeprom_reset(DeviceState *state)
-{
-    EEPROMState *ee = AT24C_EE(state);
-
-    ee->changed = false;
-    ee->cur = 0;
-    ee->haveaddr = 0;
-
     memset(ee->mem, 0, ee->rsize);
 
     if (ee->init_rom) {
@@ -214,6 +202,16 @@ void at24c_eeprom_reset(DeviceState *state)
     }
 }
 
+static
+void at24c_eeprom_reset(DeviceState *state)
+{
+    EEPROMState *ee = AT24C_EE(state);
+
+    ee->changed = false;
+    ee->cur = 0;
+    ee->haveaddr = 0;
+}
+
 static Property at24c_eeprom_props[] = {
     DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
-- 
2.39.0

