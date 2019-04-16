Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3904076wrx;
        Tue, 16 Apr 2019 06:06:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxg2pWsiawskaYMlJXaj+EMUIZrJBbtpEwgPu7h74LqSYC0P0QBLobTAa4B0FOoTgo7Frd6
X-Received: by 2002:a5d:6a8a:: with SMTP id s10mr54315425wru.66.1555420017359;
        Tue, 16 Apr 2019 06:06:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555420017; cv=none;
        d=google.com; s=arc-20160816;
        b=PMWNl/xST+i8qcW+nttprIEbdRYGKTvD85B0mVJIxFgPj27DoZLZqCOvi9LN1SsW53
         rNrVDR4y6JsOjrwOyRRwG2c8Ht0BvdDXlKfYejxBA8yuAyvLGIrUPhk3AmE8nWorPFSH
         menlH9U5yDiRBVgy2annd6vROVED+B7ElF8fnv9h4T0rldVsZssx63g2OvOqqK0J2IN4
         816heG9/1XAOH2FKvDag9IYjyGNWf2Wgtyi9vDPKtZ6PlzZKtcy1Bd6zwMU2Y+zy8g/K
         RrarimSRbPsh2zThuha2JW6fwfUjMwX2r+l3nsDG0Zp2FxsmZGnZlrtGt6+7AyY85hpH
         C2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=1XGXCtBKeeVzqgmtbhUu5EKggmcEdNkp9mStUCKfAYg=;
        b=TuZzAtP9PYV/eXgw6PCBgsl+uR6TMrav/bfBGxgZnb1ihwkN9W4hNbb7+OLxNJ+VJ5
         GQjp6G0hnlFgRLZO+8k4wNLXtIAzC5VGL/jepIXd3XsDwNvqE3MPe4vnTcsQgTpmCkIr
         3Eb5WG4svepPaHbYBLNpzYsIO2us41QeAtRODIofYrfYezgo8vm+bvmv8+D4SUgK/8KM
         ME0d5aZxVF7pr6rgeTrdAQftRQAw5KXW9qywyS9qmKOQfyhaG2wzSNMzNhHFSoBWK6XD
         47DCJf/msO9hAp154WVKHgxBpPkTBHXhl1qZux4q+q/4+WHs/3Chn5ERa7kzWFoMU07Q
         DpUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aQXh9TLC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si12900049wma.40.2019.04.16.06.06.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:06:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aQXh9TLC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36397 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNnc-0002ro-A6
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:06:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfJ-0004r7-PC
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNfH-0001Lw-TS
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:21 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:43399)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNfF-0001I5-Qd
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:19 -0400
Received: by mail-wr1-x441.google.com with SMTP id k17so22247627wrx.10
	for <qemu-devel@nongnu.org>; Tue, 16 Apr 2019 05:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=1XGXCtBKeeVzqgmtbhUu5EKggmcEdNkp9mStUCKfAYg=;
	b=aQXh9TLCiBDKxxFyc7z9c676WM+L2EGWTfMRBCFMewS+xTqueC6QV3JY+RO/rOdQri
	ei1Hz8LZ7SXdlnP+0obacr6NjovfYJVVUCJtH3O3OUrUVspkV5vqZzyz0TxP8JJIaGfV
	3C1s8WRE5W+InPTOebW+oCRxicrDZg5he7neg9m/AeWRvL8HjcHMuxlKamq9fJ5ZA+rG
	EOHaLy23Sr1Q8j4tLH5qz/BC2oX91/tzY3UW2l+0aG7re+wnwaGg8etVOEE/uoLjv7ys
	yFXEPIqo83/0MqzOlD3xHD8ASh01fIJyD/BLiQ832DYajG8co0IulFeWauGHHEaTCbW5
	RR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1XGXCtBKeeVzqgmtbhUu5EKggmcEdNkp9mStUCKfAYg=;
	b=U5+jmnfRuZ2iFrowJYtT49iM4/F5bBetmcFyCJ82NuS/DeQf26vMfaVM8yhOmJXpyc
	2PaV7J1LMqujlWlK+8KR0LWB9ZGjFvdazN5vM3KwKf4sNyDObbsBJX39hiBVdV8eoyeT
	KHnGh0Go2Bjr2h8XV/lN8m41/rDVCGrfaRV73f2xa6Q0Xkp+7gdQ5h1CVqBZkDxNxezQ
	5u7rnz0khC+/C5LI2AtvRbjWAbGJJM0QNbRHKso88tRVVRFXSqx65POzQHePgS5iWneq
	fTBbNeBlZyFXD4hr5nBypWRt8EPlRpY9UDhgHcrjkkQ3Shc/SFsudZoXCKu/xSnRAmfQ
	fEHw==
X-Gm-Message-State: APjAAAUPCqhhABrcmKCc1hYX6aMugcNJ0QYxVTeNkF+jQXrkYTFs/HkH
	dJ/96YqUTA5b4Y3Y96yx3p4ZAA==
X-Received: by 2002:adf:ec0a:: with SMTP id x10mr51756800wrn.193.1555419496176;
	Tue, 16 Apr 2019 05:58:16 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.58.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:58:15 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:31 +0100
Message-Id: <20190416125744.27770-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH 13/26] target/arm: Clean excReturn bits when
 tail chaining
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qqMijtZ/1sCv

The TailChain() pseudocode specifies that a tail chaining
exception should sanitize the excReturn all-ones bits and
(if there is no FPU) the excReturn FType bits; we weren't
doing this.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 8e72e1097ce..fe8e78fe36d 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8081,6 +8081,14 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
     qemu_log_mask(CPU_LOG_INT, "...taking pending %s exception %d\n",
                   targets_secure ? "secure" : "nonsecure", exc);
 
+    if (dotailchain) {
+        /* Sanitize LR FType and PREFIX bits */
+        if (!arm_feature(env, ARM_FEATURE_VFP)) {
+            lr |= R_V7M_EXCRET_FTYPE_MASK;
+        }
+        lr = deposit32(lr, 24, 8, 0xff);
+    }
+
     if (arm_feature(env, ARM_FEATURE_V8)) {
         if (arm_feature(env, ARM_FEATURE_M_SECURITY) &&
             (lr & R_V7M_EXCRET_S_MASK)) {
-- 
2.20.1

