Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp651049ejf;
        Thu, 11 Aug 2022 10:16:41 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4BaEudZea0mWbjUS5p9RCOqA5chu7Jp8JlVwm+qZKK9+9s/jSBwRnMzDdTmirloLero4Dj
X-Received: by 2002:ac8:5dce:0:b0:343:605c:be24 with SMTP id e14-20020ac85dce000000b00343605cbe24mr98702qtx.123.1660238200867;
        Thu, 11 Aug 2022 10:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660238200; cv=none;
        d=google.com; s=arc-20160816;
        b=gH3hToE1y6BbzLok6bS6+Uryt9thzRxRO2YsEupP9TVet1cwtoRUkGE7OzoY3YiFMa
         YtyWDWuwlGEnhLFQLuXxvtDWpLmV6UnQn0J7iezQ00Jdx4kMBXy3Y5JWdcz3GiwAVOrG
         6QMWDTfekDQjfwONXbBVxr4W9LU9CZQUjK+qvVqlhanNlkRmglUsBwSPxg2ix/Tew2qh
         vzVuXydNoiK8W+IiK9BfNB7IuoNKhIqequHqwYaIP/ft26CISO0twL/9z7XXTzYUmu5Q
         gyneARkULXyn4KoJpSk3d04oFa4nCbxOqNc6k/gYq5k7rZsSPuS65KDjOyudmaiPD5Zy
         UZ5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bBQi63nUBjyD4P8li6gSvAkrvfkoQz4taZFgjQpefug=;
        b=IENbMUqxc+30y8xn+bg0bOeXPG+1SN7KZXiL2S0daESxGKLXk4tItkwmAJh3nLJoYB
         vx89Xep4R5NuE119vilOYwc+hFq+Xyycclb+8uTQ9Ax9A6xVsCBF7vI1C3RH1yaYn6NW
         JDLa7AYNv9Smb0aCZSgTVgmr9BJF4zWumwwWdrtY0gkP6QU4adC/SrtLvHaacMliFD1+
         COhS6I1fL7itJxMYXEDI0uXZPL2WYeOuVti4xVzDdx8OEqmIgjcfymecJJvVFPM1VTyX
         PM0qK+yOgV1YTezsEM5euBvE4ocKi8eQeKOnBWerQlT8ZEMOtoc46DfDyqi2gbuKLuXh
         KGzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PbYn+Imq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20-20020aed27d4000000b003192a70cb93si34312qtg.127.2022.08.11.10.16.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:16:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PbYn+Imq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMBnU-0006le-Bg
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnF-0006jV-QL
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:25 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:33489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMBnE-0000sP-2c
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:16:25 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so3020813wmq.0
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=bBQi63nUBjyD4P8li6gSvAkrvfkoQz4taZFgjQpefug=;
 b=PbYn+ImqxRrZalnxqoq/L7G3eeVOoA1PJW/yAjviXUWAX+SeJOcxBlEcleqJiCZMpN
 FrLIdXdmMJzuy4ZYThI8Cf2Bv/VTFdyeDK0Uak54EHTMy/FH9qzaAUZc0Sn4f4aYtIio
 KXyZAa4mgg+atjvuZShVXpjgTnyyQ4sSINOT53lo5uEc4HHfrfaA80potRaKMlqq5QSS
 j1KbJajodGlcLI4pIFPOQsRucVtFaagMSu48mmoA3e4EO+DBvsy27PH3PVWK13MbK8eQ
 0vAa9g+l0huGd8R6ZD7RqYlo3AsoX9jdqnBnMg7gJNEUo4JSSFJ/tinXBkPiq+2Equhd
 5RsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=bBQi63nUBjyD4P8li6gSvAkrvfkoQz4taZFgjQpefug=;
 b=zDsBrXVp+o6fgnan8/usCb+TuF88zTWQkYkeeJRuB6lYiLjXVfqA/SCMeea+7FIsLM
 RQhA0SwyWBq5OQSZGeRGDj3VJzGWNyht4oClfqYqcWBqPwyCgX65NFDl3kFfikIgWLjK
 MrLyADk/hKjbmV0EwaFvfFpWwOlfnqPwKmugeUnDglYowvXrXtRcFbkKPQVT7dIwIa4h
 QCCHSPYUcqi4KqKYd2zi/lOpJvdNm6DFM1eLQx//7Qi2nFlnNHJ8FkWTbd59nDrHZ9Pg
 fqwhNQei0vrXXNumWu3Zlazfp4zXngXYRGJ2d5/p2mvvUUyZfrdlIFTSwYOk6QIIzedT
 QfFg==
X-Gm-Message-State: ACgBeo0iqc5aofiV66ESzV0sTbeSSGHc8zCQ9y+bsblzPBpsuPSnB5WR
 ybOo/J5TmKrqzedgoeiYmYM9ZRDsL28DFw==
X-Received: by 2002:a1c:6a0a:0:b0:3a5:bcad:f2cc with SMTP id
 f10-20020a1c6a0a000000b003a5bcadf2ccmr2907305wmc.74.1660238181983; 
 Thu, 11 Aug 2022 10:16:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a05600c4e0100b003a2f6367049sm6633918wmq.48.2022.08.11.10.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Aug 2022 10:16:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/10] target/arm: Don't corrupt high half of PMOVSR when
 cycle counter overflows
Date: Thu, 11 Aug 2022 18:16:10 +0100
Message-Id: <20220811171619.1154755-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811171619.1154755-1-peter.maydell@linaro.org>
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: rVgvJqcdZQZh

When the cycle counter overflows, we are intended to set bit 31 in PMOVSR
to indicate this. However a missing ULL suffix means that we end up
setting all of bits 63-31. Fix the bug.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index d7bc467a2a5..87c89748954 100644
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
2.25.1

