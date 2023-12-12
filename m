Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp865422ejo;
        Tue, 12 Dec 2023 04:36:06 -0800 (PST)
X-Received: by 2002:a05:6512:4c6:b0:50b:fa2e:f4bf with SMTP id w6-20020a05651204c600b0050bfa2ef4bfmr1813312lfq.156.1702384566010;
        Tue, 12 Dec 2023 04:36:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702384565; cv=none;
        d=google.com; s=arc-20160816;
        b=gaTl4qia4VCnU/2SYrSe0ugylr8yawqdKERRw4XY2wU9/4T6VitS5R2kyve3/R71Vv
         kku7w2cx7Kzw21kEwYs4/gob75L8rwhf1stjGQANJaqPxFtteXTx5XAlt4uaIUi2Mqag
         fWri/+0hrethwYYLGmH7GjTwjTivAdsChZobVcoWWgkny6qbNlt5wGq8Aji2aGrZbY9F
         YqyM922bHNlcRIC/yc9uIUjNMnYcMlARlGsRnd8+CSnEY94KjP7nsE4YHmyQRVoZ6ucM
         tmeaovqVMovReRQ2eDGgN7AbK+4d9Ykzn3IXz2TZkh1X1VuO1LN/cCxr+qMjiJddNCtU
         XKCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jCN6XEpRfBzl6QRBVexJQczvz29R6MzglzJSIvh3kCU=;
        fh=M2BdSD36/TfwCDHhFsDB97C4HExw20REPHBMR3y2OwE=;
        b=ZsrDPqkFqg4lQeGuLKouMEG4wHHUIYsKl/oohcyuZlNW4hXT7eajEayaR9f2F0K2GB
         LB92ZOAADy/87jpcaDS1Wr+DmiBb3AZ+gWa0PleUtsdmNA+a0lHjWC/NnDRITpZBV+G0
         Mv3sDeVRzAM7nWwNMth6NM02vYjb5oCR2hAcuN3woMwgKRZ11kYRFJCQHCrTclylhwvN
         fOfvbFglsCkKaI7uDz8jOf9BwBX/4efMbBxiENO9L/gdLUyvgn6KRukhUXDezYn23Jlb
         FFudkvm7N/Q79S45m5ZFlXekNbhT/X5bp58BUrF6srv1WwYA5bVgu13yyRgoB8bk1LBo
         oz2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FV1g1HNu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f7-20020a193807000000b0050c0d724e08sor1937503lfa.1.2023.12.12.04.36.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 12 Dec 2023 04:36:05 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FV1g1HNu;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702384565; x=1702989365; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCN6XEpRfBzl6QRBVexJQczvz29R6MzglzJSIvh3kCU=;
        b=FV1g1HNuqzTkNqfRSp/qZD7cVo7E/JTHi7HbaLgnB6qGiL5iADtCqFFWoyy09WQH5s
         LcjZclEIotDFStp6l64l4xxFTenMQ9NTS4FBdZ2qdt3MmC8hUxsQwKf0kVGIPhXClQ6p
         9C23S8yULarknGMaOW6TkDQOujBLpYYRISr4MJ90RCbhoBU4VeM20mj2e+okpApQWnqp
         jb5ukGf3Jw5tkU1oRYrEtnk1W2QZkzoFms2Cs9YgVcQRWyJFxfEz/q8Nt7nq8VzXRj+h
         6Yz3tSqDjLknKg60u494ed5SKGvfF8F6aW/E2DLhkMF/PEpi09NrLar6kU3YQJUYxJWL
         YT/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702384565; x=1702989365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCN6XEpRfBzl6QRBVexJQczvz29R6MzglzJSIvh3kCU=;
        b=wjTWiAf0MJ+CWm0xzotT3SkcJ03akpDtit+m73kGvm3RtZCr5JnGcv04GFcJae1DiZ
         YZAPKzuzumHzt+EKPymvjdwHgA/zu4kD0gpmPvnbYCDWOZriX8EXCIhKt+bcwbJjQi8G
         m1wBiFs5Vrkw0xP0uEmdJpIcC0m98QK6hhCrCh0G1d37Z8FX27sUudV6gnGO1duQXkVr
         dlPAEIyAyr+0j+4JMi/MYfYB1USxdq8AdbZAFD0HWGxn0QV8079M39mFlB0Szo+H3vFc
         Rql76f50EUSVPqFxVLBma8ShdNjBOxtZt9NptKuuB1ezW0e/93yL4cn5ap5Aila1UZkP
         uzYA==
X-Gm-Message-State: AOJu0YwsiOvX/zIOt7Boa89OvP5jKfDndmwICcrO2YBKAJZdBw4X+Wyk
	RHS9D1+jelT9Xip2avY1MlyDczU/
X-Google-Smtp-Source: AGHT+IFmeBvWgvvBbzYGkF+zYPl5+e01JLIWWNuas4xPI2HT4LsHsl0TWRedv0QHFzvG+nl31n4+yA==
X-Received: by 2002:a05:6512:281e:b0:50b:f9b2:d00 with SMTP id cf30-20020a056512281e00b0050bf9b20d00mr2195977lfb.22.1702384565627;
        Tue, 12 Dec 2023 04:36:05 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.175.193])
        by smtp.gmail.com with ESMTPSA id dn20-20020a05640222f400b0054cc22af09esm4672659edb.46.2023.12.12.04.36.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 12 Dec 2023 04:36:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-riscv@nongnu.org,
	Brian Cain <bcain@quicinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	Warner Losh <imp@bsdimp.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 17/23] target/ppc/excp_helper: Avoid 'abi_ptr' in system emulation
Date: Tue, 12 Dec 2023 13:33:53 +0100
Message-ID: <20231212123401.37493-18-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231212123401.37493-1-philmd@linaro.org>
References: <20231212123401.37493-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: +lj+KudSnll5

'abi_ptr' is a user specific type. The system emulation
equivalent is 'target_ulong'. Use it in ppc_ldl_code()
to emphasis this is not an user emulation function.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/ppc/excp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a42743a3e0..3d7c9bbf1a 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -142,7 +142,7 @@ static inline bool insn_need_byteswap(CPUArchState *env)
     return !!(env->msr & ((target_ulong)1 << MSR_LE));
 }
 
-static uint32_t ppc_ldl_code(CPUArchState *env, abi_ptr addr)
+static uint32_t ppc_ldl_code(CPUArchState *env, target_ulong addr)
 {
     uint32_t insn = cpu_ldl_code(env, addr);
 
-- 
2.41.0
