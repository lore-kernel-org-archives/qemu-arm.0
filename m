Received: by 2002:a05:7108:5790:0:0:0:0 with SMTP id cd16csp5196843gdb;
        Wed, 14 Sep 2022 05:53:29 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5M4UpObc6P1lhqAS36Vr0nC1ZXBGY8Z5nMltpWxvgWJ4QIAV2eG1bok/HW0FV3O20UfdU7
X-Received: by 2002:a05:6214:3006:b0:496:ad87:6784 with SMTP id ke6-20020a056214300600b00496ad876784mr31430112qvb.7.1663160009825;
        Wed, 14 Sep 2022 05:53:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663160009; cv=none;
        d=google.com; s=arc-20160816;
        b=zbVmVp8OtasTpgi7jrA2C6QuFrlASAxIFozQ//dVtmHkSzXanS/dt8LeAk53Xw4YFB
         AvgA6SWp59xNbfpFthkJQeIZhOhLupa0XXY0m/WDVEkNk68RDsm5BVstB+QtHbaiYQ8O
         npRloqZ5hOYKyCEw0+kKabK2Oclaw8DciXelJ+e59kZzxuyrw/CUVbR2/2ptPGn5fltg
         F4jWaP+ARIFFClYTLCdLFdvi1xnqoplGOgZgi8yg3ueftceKnB84sK4y7088SBUriQ3Z
         I8CtQqWH87Mzqv3H5eXwt8tMVHca2N2LtN5eMAzzoc406txLHk4kFUjnrh/Q7EvXk19R
         1o5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dQ81od6doz03swvkUZvq7V0SI8zn3X9BL8rb2WfrUR0=;
        b=HDN7V9paHRrZnPjTPEcIgfD0dTbQQ+X6q6iKc6XLD1nFwrve49GGDfxFRpzLjR8o1i
         lZz9WTkWQJ32ropt7SpOyNeToAa7n7Jzp8HPTi5sRS0DHecBa+0tpgT6LO8fLhjVpDMH
         wltNovn+FHhWVZW9qUR1AwL2XVpsmC98CCjqXXu11bBI1TMfrmCMHd7lMWZEmsSw/WOe
         UqGrK7MzK8ewYK0fuYHtONXyawU4myA6g2ydZ38+g7Bx0+2qUTA/+kGyDPNJSuAr/Nxm
         Gq1ajGBbqdhnhK4kYTU7i0zxjVIR7cKUqEWjphfoEvpP0NFospEjrOq0tE2e1KEzpVbN
         qV0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bGOheQeq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv12-20020ad45cec000000b00496d0f8702dsi1233523qvb.392.2022.09.14.05.53.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Sep 2022 05:53:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bGOheQeq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oYRtR-0002N0-Bd
	for alex.bennee@linaro.org; Wed, 14 Sep 2022 08:53:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwb-0000Vt-Qt
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:43844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oYQwQ-0008WJ-3b
 for qemu-arm@nongnu.org; Wed, 14 Sep 2022 07:52:41 -0400
Received: by mail-wr1-x434.google.com with SMTP id t7so25249226wrm.10
 for <qemu-arm@nongnu.org>; Wed, 14 Sep 2022 04:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=dQ81od6doz03swvkUZvq7V0SI8zn3X9BL8rb2WfrUR0=;
 b=bGOheQeqcEuC0Ho8pO9e75ZjFaKUUUwmmviuoxlcDMTI8WRkmGpVKlbMPUfXdLo+Qi
 O5Jowt88Gvpg42qM9eEQ7rePMXKDUs0q6gHpGuLuQdH+KV8jnJ2MQdjrsL2PiNXGZaeM
 cjXdiObBEEf0y5xpZxf767XSWXhVhHHpa6yoIT9nspUds7UE1Dx5e4+XccFhTRKaoKjz
 3ZOU/P0xpH5fZxWYh+pq6+rb4VmbYa0ZIvl/hS5TJayZpukoWXHRB0dcDECG4qS/TYJu
 nA8u7NPezIi7qZ2HDOKncQTmpip81mg6tx2tPBVFO+Y9SLSgrPgL2Jx+WWTFRLXjmOqc
 OOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=dQ81od6doz03swvkUZvq7V0SI8zn3X9BL8rb2WfrUR0=;
 b=sPGTZW4qbeBNzzM21MjHUtaEhV6MAwBZdZAq6w/QjWsn9V28DDR8Tyu3HKEsDghzEm
 xYhUqfXkifHr/SM8/mOZxqBX/erPDyafU2rXvfjgoSlUQeAZB35mvAf/M1em1d5HMvhU
 NddrHFpLf0X5mjy/2mYftvO8ruGXICHqr1KRFrOId+MYt3jP6xqaI7nDB6l3njWIUOdN
 SWtH5O8K1CDNyemN7Pk4Kjk2i4KqFf0wtpxenR0aASlngon1LhkZtjjxntvvv3FVva7S
 +mfc58ehh7N4Axpc1wUBCQAZpqzukFgu6+tx5rZRta59JP8TRfFKnKBRUOAELltDjgm9
 F6Nw==
X-Gm-Message-State: ACgBeo20bOmCSXXJ3IG7lZkKN8ZCX2k/9Rv6laUriBqF6mekq2hdkmFY
 H7//Yp8QlBTM7EJiwJd1C/fZZQ==
X-Received: by 2002:a5d:424a:0:b0:228:811f:c1a2 with SMTP id
 s10-20020a5d424a000000b00228811fc1a2mr20436348wrr.262.1663156347534; 
 Wed, 14 Sep 2022 04:52:27 -0700 (PDT)
Received: from stoup.. ([89.101.193.70]) by smtp.gmail.com with ESMTPSA id
 t9-20020a5d6909000000b0022a3a887ceasm13712970wru.49.2022.09.14.04.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 04:52:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 09/20] target/arm: Don't corrupt high half of PMOVSR when cycle
 counter overflows
Date: Wed, 14 Sep 2022 12:52:06 +0100
Message-Id: <20220914115217.117532-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914115217.117532-1-richard.henderson@linaro.org>
References: <20220914115217.117532-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: b/B3S02+q5PA

From: Peter Maydell <peter.maydell@linaro.org>

When the cycle counter overflows, we are intended to set bit 31 in PMOVSR
to indicate this. However a missing ULL suffix means that we end up
setting all of bits 63-31. Fix the bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220822132358.3524971-2-peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7ff03f1a4b..e4824e01b8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1186,7 +1186,7 @@ static void pmccntr_op_start(CPUARMState *env)
         uint64_t overflow_mask = env->cp15.c9_pmcr & PMCRLC ? \
                                  1ull << 63 : 1ull << 31;
         if (env->cp15.c15_ccnt & ~new_pmccntr & overflow_mask) {
-            env->cp15.c9_pmovsr |= (1 << 31);
+            env->cp15.c9_pmovsr |= (1ULL << 31);
             pmu_update_irq(env);
         }
 
-- 
2.34.1

