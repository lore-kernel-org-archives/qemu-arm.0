Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3674615wru;
        Tue, 2 Jul 2019 04:03:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxA56gNcOupSYBPLZsz88xOSzSryoLtsqvdFiI7WFxjUjX+XlliXlWvGueBkVpjc+xTZ8yp
X-Received: by 2002:a17:906:45d7:: with SMTP id z23mr27555566ejq.54.1562065424591;
        Tue, 02 Jul 2019 04:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562065424; cv=none;
        d=google.com; s=arc-20160816;
        b=Q07QuW+Ldr08ZloWg/wdYFGkIubNcfdvRWaloXl2vP5Z0PBDBLI3ddhP82sESIP0bz
         be0+7bFwx7VXjAN2FxG2427gT890YPQcodBgv2fjRiPeJHmtS5SztdQn+iWc0FX4iMgR
         /DawOJLyjG/E/AFBYMEqirw4wAcJKFWVbJu9FaKERpI4G0WosMgbM+PjZgUzS1b8xFNb
         dNG46HdbXXtGaw2EnzH/CW7Z+gET8OhAPKTQAAEToD2QsoG/HmrPPtFBu/pz8y2Qv1CV
         5ONF5kF83goMo/wtJfp7kAuXNnpKayKhmHaejxvQKI/c4LfJQjXCqBac0JOjHRvKsyXj
         ZVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=YeHRPGYbA8ZhQrAnDrwK7ooN6IkOvQIyHvP1gjf9j24=;
        b=k6BzWUWSKb1YkUiY+MjB4buOnR9IRXsXHyYF7T/WCeDYf96c/u4yMJjfSKR7IHhRDm
         zsY/VUqGvH6tATT7pvMZpI61cBJm4eUH7ZOQbHmnxoumvPSXJZxadgDX3FGOSgrskCwn
         SH1LMGDLHZLSpybbuLx/ZBTsR4Px3R7SHx1JWTMROFAbqByZbSaWhrvEenJXhBnZ3YDc
         wewz3p4M8l0/0Vh2S5xFPzctopYfnR90Z3/EoFwTNpPTKQuFqwQIkYoutiGkMDzRPfCb
         ofJQ1lsXvHEdSaq080hbTYbk5fLWTyCEgVTWQHicDtu3TFHPxYbAEOsSqhsDyikHUdGc
         sckA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XGibDmxU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17si8843400eju.276.2019.07.02.04.03.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jul 2019 04:03:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XGibDmxU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hiGZb-0004VJ-ML
	for alex.bennee@linaro.org; Tue, 02 Jul 2019 07:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51624)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hiGNj-0000oo-3F
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 06:51:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hiGNe-00057f-Vj
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 06:51:25 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53467)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hiGNd-000516-Ik
 for qemu-arm@nongnu.org; Tue, 02 Jul 2019 06:51:22 -0400
Received: by mail-wm1-x342.google.com with SMTP id x15so383874wmj.3
 for <qemu-arm@nongnu.org>; Tue, 02 Jul 2019 03:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YeHRPGYbA8ZhQrAnDrwK7ooN6IkOvQIyHvP1gjf9j24=;
 b=XGibDmxUDYjPiY8630ypUeh1Crjc7UzuBDzvEKoKarSVnT3IAtcUkUHxSd9Od+mgtB
 pgFAJTfbO5ZkErOkyp8CBKFk9FTjYVUSh//kvs1yfqH6Wa4X/plg2xI+s7TzC6AKtbKB
 0+wn/h81QKma2XTRKwbHrKknQ6y2d+qnvGim+wwVKUp5NsjB0dX0ps6f1dkR24f2ypw/
 +GB1N/2Xxf0xOZkonrgOxya4ZkInOULEq7hPQmmcg/rNd4WxZ++AQek1ygJqe16hdXeU
 Xu33olZV2/h84RQUz9oapdyWnbwcbMge+7OZcimc4IsOBYl5yOlVC7uSEufq/hmGonrC
 Ie0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YeHRPGYbA8ZhQrAnDrwK7ooN6IkOvQIyHvP1gjf9j24=;
 b=pVz88w1Fky5JLCq/PY2DpqFPaiEwzeinPAQWqGHkytc9ak7XA4B0WELxniZrW3ncdX
 jTj6XBFb6nAm4B0I7agq161mzdagnMNaC1+fgte8aru+cJtLECUGJ6aIxs6VDkcirVZf
 U5t/wr1XSwVVrbsEVv+bat+O0s4PsDJyW6kJM7TXax+zokO6WtXDEf7MGmJWCfI7BTUa
 xpuMet9zmfa3m0nuTPyXyDIC+hm7rkGTwMnqIrdt03qYUA1/nO9cwScVrm9nlgBFQDMV
 TOHAFX1KEuXX7mVPwwsZdaWO6qtZWw1pS8M2hk1ZmnG3XlFenUR7H9HoMIC0iHkR/nPm
 7eag==
X-Gm-Message-State: APjAAAW0DTXdmjXWMGTuFqzZKugmOflM0desguEArsaIIHCCtSuaQojE
 9iykTVGsnBKvHGqrCAewsmoUcCON81ELRQ==
X-Received: by 2002:a1c:dc45:: with SMTP id t66mr3193545wmg.63.1562064677072; 
 Tue, 02 Jul 2019 03:51:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y133sm3219710wmg.5.2019.07.02.03.51.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 03:51:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Jul 2019 11:51:15 +0100
Message-Id: <20190702105115.9465-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-arm] [PATCH for-4.1] target/arm: Correct VMOV_imm_dp handling
 of short vectors
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VNEwdC//dDse

Coverity points out (CID 1402195) that the loop in trans_VMOV_imm_dp()
that iterates over the destination registers in a short-vector VMOV
accidentally throws away the returned updated register number
from vfp_advance_dreg(). Add the missing assignment. (We got this
correct in trans_VMOV_imm_sp().)

Fixes: 18cf951af9a27ae573a
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index deaddb04421..092eb5ec53d 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1971,7 +1971,7 @@ static bool trans_VMOV_imm_dp(DisasContext *s, arg_VMOV_imm_dp *a)
 
         /* Set up the operands for the next iteration */
         veclen--;
-        vfp_advance_dreg(vd, delta_d);
+        vd = vfp_advance_dreg(vd, delta_d);
     }
 
     tcg_temp_free_i64(fd);
-- 
2.20.1

