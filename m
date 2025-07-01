Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3056195dye;
        Tue, 1 Jul 2025 03:33:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW8d79V8xo9U+DfOY4xgxIWHeCbZyMiMNIAESjnZVRCBr4EdD3F6FsgGyaKRGZGzexF/W5+l0VqaTxY9A==@linaro.org
X-Google-Smtp-Source: AGHT+IHK4Y+DjRB5PBtCqwgFnOhQ2Qi9PupmLtuMDoDmUpRilyi/pvoYDkVuONoZIbCjLH+REBbo
X-Received: by 2002:a05:6214:540a:b0:6f8:aebb:71c1 with SMTP id 6a1803df08f44-7000174d5d5mr309694316d6.4.1751366002455;
        Tue, 01 Jul 2025 03:33:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751366002; cv=none;
        d=google.com; s=arc-20240605;
        b=AK+g49l7IM7nT6lL52eS4IcJy3WqJ72L8YoXEg21130ohn4BY8uMEQnI4cv2jMo1aW
         Wb/rDoYG0j4gb9vXP4UPRZORxx/nMvu8qwyIZ3LjSkx79PuXp7t6dn2Ludhpxdn1DFq/
         UhcSBKciJsdOQwvpBDGLr6pmMNvn9g1uuJrFQBcINicJI2Ymt36eSCovnoKJl9t7Hgj+
         QcNuo3CO3EhwuQH5wCZCBM9ZkK/FlU8yfh2cCozGC45rVlh6RxJg9gCjt11qexpCPFoo
         aw8FAPriDburx2w/W74VrCRM27Rz0SX66kdIRgcToH3oYEuV4JD2A7GOCNKgzY8em1Ck
         FmNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wnu/gBrofYGPtwFVydQpKrmYxzDenOFmEobdvM+2Gm8=;
        fh=YY9nUc5w24cMHuHgTFjcuo3GC73LQtyUYEufVd64Hvs=;
        b=cXr2rAZmtwiY8/gpZ73eHGtI8PyYDcYlqNVURqLkcxxKYcQJ7JPvLvfJLXlBjOEkgC
         6MxqfPyIqDju+uL/Bld5g6iHAVjUs+YRpvSrPwABow3WTsVYac+vuHRtSVd+DhPLFFfr
         +CPb/UOKCRtppkTpFuUzhEuaePuCBzJ92b32ge4QLuRb1i143Z4zpVgrOUEYcoVD5nxR
         05zAZ3Blds8ouwIAaeXf+e8v6951CUnlcXKiFtr0WJ0FNeUKjQg4vRtwjtsN980w5iA8
         MhNGIDPp3D7jh0PQBMiDjZiQqD1RZ2+hqVzFXrSUQ/uRvD/zbx+ef54yrIcv5FVxCBwH
         MT3w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=EPqbGeW1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd77394852si123349716d6.441.2025.07.01.03.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 03:33:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=EPqbGeW1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWYIJ-0004hx-VN; Tue, 01 Jul 2025 06:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWYIH-0004ai-Iy; Tue, 01 Jul 2025 06:32:53 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kosasihwilliam4@gmail.com>)
 id 1uWYIF-0002H0-Md; Tue, 01 Jul 2025 06:32:53 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b2c4e46a89fso2844098a12.2; 
 Tue, 01 Jul 2025 03:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751365968; x=1751970768; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wnu/gBrofYGPtwFVydQpKrmYxzDenOFmEobdvM+2Gm8=;
 b=EPqbGeW1vlk+Qkeas2Y2W9DpUXGs2R9z3SoZGfnTPnU/maUmz2XcIVoOZtYHxEFobd
 BxMjFoHdoPpRO30kEnsh3ZthlJtnggDZYBAxvtqOSmMiAvL7ki1sH5WioX8PRXMmjQ+O
 Vx/702c+egZpDftzBT4Vw++l04ei3MVrb0QH3eqTeNg9savPmwAYdMDYC1r8knyaMj17
 qwpMgODgsxTp+ONspahZ+nrP7yJEAFV9vs960qlkm7qJI9b6annJnn6xkG2QCfYIWTQ9
 E5M5esmRzfsH7prnRI7RMB1hLeDQZDQ3CQaKfyJzI80VpSBBGgztipO3PFtVhCNUBmgq
 fw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751365968; x=1751970768;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wnu/gBrofYGPtwFVydQpKrmYxzDenOFmEobdvM+2Gm8=;
 b=jEcNHnM79yY5ehk8HrBfbHHi/YKc05+XCkooXWrgAiep2bScCkuPlwM/+QXimW1KhM
 wILXJ9XHg1x1Ok9iRBGVjcRPhnhq51SkDwWnKHzfMiJwtVDgPRc9DEoLftcbDykjcEkm
 nQgBhxei7gjKc9AkbOhFH7RnEySFOARCH2UJlzo4QLFb77UDfw6Ylz8dp1xeSENZzkZQ
 j6xA54grRHaSd6vqntpzrsNF+hn2yx1llEBaW/rSSmztpVYhteRZwS6Ad43VAd64A9E/
 ws1f0nSjn1V/aExJNamfrHT1UL0YPa+rxTL9w7DQoGTgW7G12oh/VYAhqPZ6uE9aHhFx
 YKeA==
X-Gm-Message-State: AOJu0YyGK6F751BDmzXMJRWmFmsBwEOUdF1/kpUm0rENYbcRFdie3XXI
 7X8JDgHlZxGODWdF+EKgin40gOZYjWt8Aq46zl9zf/ni5DkMl+jZucqAQ8RzLjKZcl8=
X-Gm-Gg: ASbGncsSWCMgExJ9rGgNRx++qFdNQ73E6qrcX+fOOOYz1iOdtsNisesGshz2oEBE8c2
 qJGn0yzpfFEeal82gX12caLW5m0NmUMLDdSHgUgnfHzpGw0FINM8LB4cNXPQb+td6IQtgBTLd1z
 qfL7CDRwGk3cEMln4AF3aaAb0CRFA2hNHlc5VaZY9QhfEPM0/1q9qqW7Nnp4fksdDqzjgYz2dP1
 HnI+StGE3KZFGffIdNdJ6vxfSmnxGbjLLCgcUi0cf+2KLHixQkqag7zD0AItdMLBUm+WUicPkZM
 3gMio4XPRSUDnJmj4dUzXm0T0gDj/HCcl8ifa2fKA7QZZVJzbUGrC1zvTsDc5sJm1uHocQf0xc4
 wXB9XIRSBxJJaNGemwYke6gz1Nc9Dz5jIp52pQZmxa/I=
X-Received: by 2002:a17:90b:1f89:b0:312:1cd7:b337 with SMTP id
 98e67ed59e1d1-318c911e00dmr23172062a91.5.1751365967787; 
 Tue, 01 Jul 2025 03:32:47 -0700 (PDT)
Received: from localhost (pa49-178-74-199.pa.nsw.optusnet.com.au.
 [49.178.74.199]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-318c14e18bbsm10938410a91.23.2025.07.01.03.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jul 2025 03:32:47 -0700 (PDT)
From: William Kosasih <kosasihwilliam4@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 William Kosasih <kosasihwilliam4@gmail.com>
Subject: [PATCH v2 03/12] target/arm: Fix function_return helper load
 alignment checks
Date: Tue,  1 Jul 2025 20:01:50 +0930
Message-ID: <20250701103159.62661-4-kosasihwilliam4@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250701103159.62661-1-kosasihwilliam4@gmail.com>
References: <20250701103159.62661-1-kosasihwilliam4@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=kosasihwilliam4@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 2ZT3ZEvyj9q7

This patch adds alignment checks in the load operations (when unstacking the
return pc and psr) in the FunctionReturn pseudocode.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1154
Signed-off-by: William Kosasih <kosasihwilliam4@gmail.com>
---
 target/arm/tcg/m_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index f342d93489..28307b5615 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -1946,7 +1946,7 @@ static bool do_v7m_function_return(ARMCPU *cpu)
          * do them as secure, so work out what MMU index that is.
          */
         mmu_idx = arm_v7m_mmu_idx_for_secstate(env, true);
-        oi = make_memop_idx(MO_LEUL, arm_to_core_mmu_idx(mmu_idx));
+        oi = make_memop_idx(MO_LEUL | MO_ALIGN, arm_to_core_mmu_idx(mmu_idx));
         newpc = cpu_ldl_mmu(env, frameptr, oi, 0);
         newpsr = cpu_ldl_mmu(env, frameptr + 4, oi, 0);
 
-- 
2.48.1

