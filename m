Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp1104670lfg;
        Fri, 9 Jul 2021 16:07:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwixyTbcS+wLA8yhYJzcryXa6jlaoVaf9G4y6JUryYqES6Ug2d2L1x5f5IdeIpvQ9BTMzmW
X-Received: by 2002:ab0:7443:: with SMTP id p3mr21215170uaq.138.1625872029806;
        Fri, 09 Jul 2021 16:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625872029; cv=none;
        d=google.com; s=arc-20160816;
        b=TWIrZ4K8R13z49++ZA22Ec/SjVO0zBrP5H129STC9rewz+x8pqlyCn2yqTrlADKnR9
         m6yhsA1Z2kfuoyIty1sQc8v1sIgiwjX6WqC/AQUP61lemh0RgQPzTZ8f0Fd8zzJPtncD
         loARHv3SmU0zVndN6BJVVzBeaOoHWu4bY09AWgs84QroDXVL2me/HOXjdv+9Ccy2fK6J
         081X2qjyRrPHuaTvpzbcPw8OH3yMCa68NO/R1GZpbrVxajoYuFS+Uc+iZMSA9KNsI2Cg
         ZcuEOgJB/oY8NPetMBf004LL/aWcrKu1axqVrX6ysfDDv2mNzWIAGhJqliTMs3OQDw8q
         LD8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=P/cNFkCTIiADe6eqNZOM9+2HNoNfArmqqrxm5+r47oM=;
        b=s0sfdWMS0w8zfK/zh2eHgDyLBUi1h7Wt25Ouiq0bD2DX9GDaq078k42zxrl9mceZn1
         YHooeFo/BNPpZ1Lg9jR+FKvHSmQ03riMhed9wQYy4hr85IRfFy6YlXK8acpRyyGcn3aj
         hFJeeg2gJGnw1cYMgZZz6qu20hFkhSSl9TJ+RCywKFKj4ltM5wH7jrMdpBVksRnlfhKq
         wHCAAXGBKRvR/U0asq1zy3uWE6Nyc18eSwPEc530kr3WRlphEAxvJh9ersVHWyg3nyO0
         K2iLn6GVuGgsMc0To5Df97/Z/BckGT7rAEx7FUmupMkAzO7+7W53/c/wx51ayi1+EeP4
         jEsA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UkdwHndF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w129si7545132vkg.38.2021.07.09.16.07.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jul 2021 16:07:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UkdwHndF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1zaP-0000Mz-59
	for alex.bennee@linaro.org; Fri, 09 Jul 2021 19:07:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1zZi-0000Mg-Ot
 for qemu-arm@nongnu.org; Fri, 09 Jul 2021 19:06:26 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41635)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1zZg-0004iS-M4
 for qemu-arm@nongnu.org; Fri, 09 Jul 2021 19:06:26 -0400
Received: by mail-pg1-x530.google.com with SMTP id s18so11417748pgg.8
 for <qemu-arm@nongnu.org>; Fri, 09 Jul 2021 16:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/cNFkCTIiADe6eqNZOM9+2HNoNfArmqqrxm5+r47oM=;
 b=UkdwHndFkv6MjeoEsUm7ZjnSuKDj3ykEZ9kjjsVwCX9yGe9X7EZHETIYPlyKwhWtgt
 eeP37Vz2HsQXa3oqnewbWUSYutxDLp0Vo+Ska8mWozwPSJKPcq20prydM41aHKtqJcam
 u+rAuFywqXtbiHT6c54bZYjTuLq6X/lros8PY7Nxg74esE8S5ApA0SXwcyrinnSIeA7W
 REbbZm32FvwzGMn7J83ITYXL4GBxHn5J8rN/tg7B7AfzWTx0VJ9Aut82Gsz554/0a2wc
 R+av/2Cnd9gNbZ9DdbqhQWttbdeOwicfrKsw4/1DqfM8GvhO4BRRpA3fPSPszZJDMVum
 0FEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P/cNFkCTIiADe6eqNZOM9+2HNoNfArmqqrxm5+r47oM=;
 b=kFygIXqEVc7uWQ1rOJv/xu8gzzyCS1hD5WlOVzd9eMcJftnCycS+H8pGLzkQUKaBE9
 6pLQwebo73XGAHbZX3bV9aX18BBf6H6na55pAS0ha/Ubgb6BcxZvoH/j2ACBGzd4i5IJ
 m/PWeGncXNVM8sNKTvXHOIVH57Bqor5p44YF9KqfmpKNU3jkwztO5RcOtMTjAiJOf9uA
 fGy6pB61Xvikkkq/z/YCqyWTMRvC/TkajbqZMDA+2CKRoYZlabaSEQfmwkIEwox0SRn9
 ZSnWEf2QC9dNv6Fy0iZTejJlUUqyXHGJM0ZtpKdGYaNfRNwmnPvPGhe3uThLHr3XIMEy
 ucIg==
X-Gm-Message-State: AOAM532cseacuYB3b4sZyILy0cqRR6XywdmzW98F8oeiEefCNN5uE5Sn
 2vaMVZ+ErFVRlruCte33jYQ0CA==
X-Received: by 2002:a63:43c4:: with SMTP id
 q187mr40218505pga.172.1625871982757; 
 Fri, 09 Jul 2021 16:06:22 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d20sm7270414pfn.219.2021.07.09.16.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 16:06:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/1] target/arm: Fix offsets for TTBCR (#187)
Date: Fri,  9 Jul 2021 16:06:20 -0700
Message-Id: <20210709230621.938821-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kOpH7rHYN/Hz

This one patch fixes boot_linux_console test_arm_virt.

It does not fix all of the failures.  The next one on the
list is test_arm_emcraft_sf2, where the cpu boots fine but
the net device doesn't work correctly.


r~


Richard Henderson (1):
  target/arm: Fix offsets for TTBCR

 target/arm/helper.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

-- 
2.25.1
