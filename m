Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp44294wrg;
        Thu, 13 Jun 2019 11:07:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwCY+aCdgScbo+oQuNIgii7fShz+ajjCN0jepzn2l6HWSC7zaayRRrUeeUWM3CgCb3TXs0h
X-Received: by 2002:ac8:197a:: with SMTP id g55mr40358112qtk.320.1560449245051;
        Thu, 13 Jun 2019 11:07:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560449245; cv=none;
        d=google.com; s=arc-20160816;
        b=mITIReAkqEkD/YcGc/CvpaotUyqht93kPse/uRQvZQz/zFSKMBTD2VphsbN5/NvzTe
         4x3D5M9J07q6IkSxG9lbyWMy+bSaOOgQ6+mesd03Z37CqCW6CkJTIvO0xUMZlrkHgOCZ
         9sOK65/z2GXDHTFLhZ4t2tKLY1rzGird7hq7uJJxdTU2+aLn+Es2GWRrDR3r07xMkCZ9
         IkhREmfkDs6A4Z2AzlarZfZeBQXGBR/o+9NRaYTG6p1TKxN1lq+XDzBW8+pMQPF+yOli
         DtY6VxdnYW5DuXIzK0KTrUTYn5JikjyLpd2lYUZxdm8LoeFoB0HJsFRvwGTY8Cjbq0Ly
         0pkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=rimcTwT3jseYgOecETEoK3gV+MP4oaaAWnNA90CS1sc=;
        b=ns2I7Uas5jeoN2zFfuDKFefu2kQAAHxoj0pKAnPbs51JFslY16HiNWQkYJ3TPKewIn
         jgBjUsbfRJppPCm6zI74RIZQRM78ne+0PGe7zX9kynQzmLpFYAl5Ptopj197IR9/1Zbw
         sBau54V43OA0ry/OytPs6hR3ieQFXJoQctTHDS9qKg4m8rVDU5s29RGo3jU2vRzl+BY5
         ADj86y9Bu0XcAiv4eNgMM8ZYntF2H1fNK1nu3c5MrKrd3vBL7/Ez6s4CFs8OKUX/BkQP
         Voay5mJ8SwAr2tLX0IhC/0fFenwZcIcJVj2AuCBrUlqckbHKnuj2EHUsMIPVj5N/BQNW
         De2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="WUC/NR/r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si205400qvg.60.2019.06.13.11.07.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 11:07:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="WUC/NR/r";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbU8C-0004eD-JB
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 14:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53854)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlK-0004AC-Rj
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hbSlG-0003LY-28
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:42 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42202)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hbSlF-0002O7-KY
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 12:39:37 -0400
Received: by mail-wr1-x441.google.com with SMTP id x17so6209983wrl.9
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 09:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rimcTwT3jseYgOecETEoK3gV+MP4oaaAWnNA90CS1sc=;
 b=WUC/NR/reoeIEelJq/6TVn2rSH/Q5u9ChWO0s5e5z2VaAs/2A6a5/RRqKidEVi6T8J
 EeG6g1KJ3Ynlg5Cms0UYtrCGGGMty1ukQmn9FxJW6qv+RJ5vD1xcNLMPmdrHMYNjwloG
 e9wO83nv4MVf45s3I6/kEt8WTSY1kCjuuYWRNtn1qjUlRujjhE3Vdk0AVRwiuDQqC9gU
 kz8CWoLZdOY4Je9mwOORyOViqWL4xuGhLqoU5zXu2p51MJ84KWzY86jVieZJhliATfCx
 ZdpKJaue3OMzZ1X0eHS+8UAD8La9ESQQKAP5HbYtIuKrosQrkCbWEsOl7qZGgLDroTg7
 XeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rimcTwT3jseYgOecETEoK3gV+MP4oaaAWnNA90CS1sc=;
 b=PzgLntBpUJW1tI1iR3qtzWHCr1NJd/WKSKxfkHwQ9X4D8JmxJlCmnncOgJ9rc0bJGb
 rnBG/KbntAkiQFcN/L34JbFRI5hpneaaYEJiG73TGobsOFiJL9zH8Y7X+1OpSEIqt7Zb
 xjaZXbClJ3wpo5qT2zHxu99F4IrqGEM3/8I0q0tzf2iapJkI/zN+eN0PGSL739kDmImy
 WAVLeU5z3L34oNx4PIObAc2QNXNx4Q78zBHG10cSQqqq602BJmFZL/i57C3yz/m50+Yi
 zllE0wvQtc2IxZPG0ouz3rCWcWTz2ujkFxbT9CoWD0IqPoZquXugmXfKGwvxAoNcsqhO
 mKtg==
X-Gm-Message-State: APjAAAUFo/LhODtqIn2CKsqC9e0yVyherDEDqe22TdqyVaVR9S5jG03F
 g0TjwLXNO23PFmeOUoZvbUUHPNeujN8dmQ==
X-Received: by 2002:adf:e9c3:: with SMTP id l3mr37413931wrn.148.1560443965631; 
 Thu, 13 Jun 2019 09:39:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id f197sm358747wme.39.2019.06.13.09.39.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 09:39:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 17:39:11 +0100
Message-Id: <20190613163917.28589-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613163917.28589-1-peter.maydell@linaro.org>
References: <20190613163917.28589-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH 06/12] target/arm: Stop using cpu_F0s for
 NEON_2RM_VCVT[ANPM][US]
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
X-TUID: KlvENBKy8nlV

Stop using cpu_F0s for the NEON_2RM_VCVT[ANPM][US] ops.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 243dbee8357..124045a9ef6 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4181,8 +4181,7 @@ static int neon_2rm_is_float_op(int op)
      * what we are asking here is "does the code for this case in
      * the Neon for-each-pass loop use cpu_F0s?".
      */
-    return ((op >= NEON_2RM_VCVTAU && op <= NEON_2RM_VCVTMS) ||
-            op >= NEON_2RM_VRECPE_F);
+    return op >= NEON_2RM_VRECPE_F;
 }
 
 static bool neon_2rm_is_v8_op(int op)
@@ -6818,10 +6817,10 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
                                                       cpu_env);
 
                             if (is_signed) {
-                                gen_helper_vfp_tosls(cpu_F0s, cpu_F0s,
+                                gen_helper_vfp_tosls(tmp, tmp,
                                                      tcg_shift, fpst);
                             } else {
-                                gen_helper_vfp_touls(cpu_F0s, cpu_F0s,
+                                gen_helper_vfp_touls(tmp, tmp,
                                                      tcg_shift, fpst);
                             }
 
-- 
2.20.1

