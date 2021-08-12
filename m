Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp195568lff;
        Thu, 12 Aug 2021 02:42:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOVT5b3f45NqHzO0A08oT2t0OA9P8Yt6KsxycAj/VG0QVnPvdxnuehf0VJ6scKh1Vyh9J1
X-Received: by 2002:a5d:91c2:: with SMTP id k2mr2298673ior.117.1628761369242;
        Thu, 12 Aug 2021 02:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628761369; cv=none;
        d=google.com; s=arc-20160816;
        b=Hky2Ng8FviiIsvpPoLYL6bCV0BSC2HPZjWybNAwa3tZ+Z4K+uI7/Mg4QmZHU5TKZh2
         Bqmid8FfzehyU+0cYCUu+oSUJ5Zg13AeQqLtL09XGRhlUZ9nf8pY+P5nKLkibQrxTX8X
         xp5vVqXcqxVBhyrXGsMRp2WFO7yQu4ymhfrHxUovrM/TgQLvfPVTpnhojp77WoYkytTn
         yUMypQX0y7I+LjXWroWDikO3VIKWd6d6X2dHOMnNY1XIG6jERXSCFlPXe6jAD4KCA7hA
         D6v5nUWSCGzdw4SPcENg1ZcbvlYs/dm7spzPiZJC5IUKFEvz5CGw0/aXkp1OAP+j3yty
         U3IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=S85mczGKeYB6Z3kjaTFVhQoQPK+mNif0lbrV6vtdZ2g=;
        b=OMnvPVH2gB8Vd6gnxuFhnvOleWLVdwMivXqM1lWSZ01+n2TnDrTeK4JvkHQMRkD2Bc
         Uciz68vM/qD/i1sSt/3qsm23Ws+5ZUcLvewx8qqkmWoQPuwrIbiNtpO5y/oJZZXZaU/W
         Q1RoqvM//BHAq9npzxuNvcVDUy409Y/S9EBn2k8ilJw1JqrnYvnF2mFI1+p71wNt3RLs
         82tqukiSYBQqhDi+rZsYfLaqcbvhgql7NnCDjtwmS2c5HAVLyyzIbxvYeVHF/c5zfvGI
         P6IDCA7lSVQmej8P2Im5NdLQz+yE9eOK0vBGHbCNgPP57RzUVCEZt3h8Bdykew/GcCZM
         Rr9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A+niVkl7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20si2319853ioo.61.2021.08.12.02.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Aug 2021 02:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=A+niVkl7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mE7Ee-000787-KN
	for alex.bennee@linaro.org; Thu, 12 Aug 2021 05:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76X-00064v-75
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:25 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76T-00083m-96
 for qemu-arm@nongnu.org; Thu, 12 Aug 2021 05:34:24 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 c129-20020a1c35870000b02902e6b6135279so2590365wma.0
 for <qemu-arm@nongnu.org>; Thu, 12 Aug 2021 02:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S85mczGKeYB6Z3kjaTFVhQoQPK+mNif0lbrV6vtdZ2g=;
 b=A+niVkl7heApCx6WM+MSahWmhsNtnl/zzMMWg1nez2HXFsT13hGVvdF9Icp/kxXqF3
 x9W5AcMHV1fDHha3H+nDScX4Kr3vI2NAvx7xTVGSjfZg/S7COAcPLD5mSIInXmqRL7OA
 5nzn5xJvfbq8r6iR01HUtQPg0XjHfYrMUpxliOQynPGj7upG+3ClBjslku5/7BD69Zwq
 CoL3dgBpxIzFG0k+c235ZTwOKM/GYDjkate8beJ7TwJghjRkWsrlYdYfJbUWrFqINlkP
 z1tvAxzlPAjH6MgyvzHaoC3O6xj1omZCPi7kZdaJM0FvWczfWrdw7SvDbTYP41576mRh
 b/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S85mczGKeYB6Z3kjaTFVhQoQPK+mNif0lbrV6vtdZ2g=;
 b=t2rz3nNk0ED+zcauQtDK17XTLsGMRBt9zIR+DPeVZ3Y2LR+jFPOdjze9Fax4lJARVa
 TIr0JWEWdCZy4sej+oDtWVZidMXtNi0ujlGhEM0fd3JlZmekgA5GjeoYtfa1vJ4DcXKk
 FyyGThSfEejXIgeWXdNFGCpKvQ6Eh1s/JhNtdqPQZXOnsj5q9TWiOv6gVDQNNSsKf5Tn
 MZJPQlRMuCtTPljLiGooF7/ixWVtdih503h7P2jC+zwUlXxgrnyJMA/DoMlVp6dW2/Oo
 q2FFIrBoOW90yLxp0LGdItnti2R6rILZOsy75W2yFSt5iCro8fKjQxWiHd1CDf7EDxZP
 ktng==
X-Gm-Message-State: AOAM532kjrBZn2XAgqI6qEoMgqoB4sc9ARd8epWiFWiTNiL4qz0a4wuo
 g4lEiLp8DTH2hT9DnTzVpEq7EeVFP97V+A==
X-Received: by 2002:a05:600c:a49:: with SMTP id
 c9mr13057935wmq.159.1628760859973; 
 Thu, 12 Aug 2021 02:34:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 22/25] hw/arm/stellaris: Fix code style issues in GPTM
 code
Date: Thu, 12 Aug 2021 10:33:53 +0100
Message-Id: <20210812093356.1946-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4ZJglSmXggF5

Fix the code style issues in the Stellaris general purpose timer
module code, so that when we move it to a different file in a
following patch checkpatch doesn't complain.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stellaris.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 8c8bd39e2fe..a32c567ce11 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -97,10 +97,11 @@ static void gptm_stop(gptm_state *s, int n)
 static void gptm_reload(gptm_state *s, int n, int reset)
 {
     int64_t tick;
-    if (reset)
+    if (reset) {
         tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    else
+    } else {
         tick = s->tick[n];
+    }
 
     if (s->config == 0) {
         /* 32-bit CountDown.  */
@@ -227,9 +228,11 @@ static void gptm_write(void *opaque, hwaddr offset,
     gptm_state *s = (gptm_state *)opaque;
     uint32_t oldval;
 
-    /* The timers should be disabled before changing the configuration.
-       We take advantage of this and defer everything until the timer
-       is enabled.  */
+    /*
+     * The timers should be disabled before changing the configuration.
+     * We take advantage of this and defer everything until the timer
+     * is enabled.
+     */
     switch (offset) {
     case 0x00: /* CFG */
         s->config = value;
-- 
2.20.1

