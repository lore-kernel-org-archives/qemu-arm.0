Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp592149lfc;
        Sat, 20 Feb 2021 13:29:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz1YsuE7k1oMzQ9sq94ZO1tMp3Mfk6FQvyf6U6G2FgosVLxyEVcSVciiLKMcTGDyJrF2CgL
X-Received: by 2002:a5b:147:: with SMTP id c7mr23239544ybp.332.1613856571335;
        Sat, 20 Feb 2021 13:29:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613856571; cv=none;
        d=google.com; s=arc-20160816;
        b=NdWjE79QDjDKPY6POyGs3P15dznZGUvIteZiJ/J5ygfKXIsuAldVclPmjfGMsRoUBx
         flB4DRCk5bamr6l7mwmRbq9W5iGg9bVGUr9qQQdPma7l5XPjF4C2yOmDL+C9/oIzhtPR
         2+x2HcMgrldTjGUwolTo3Ep3L91SzR8GZglgh2H8KS/ZrTXS3hVPnNrPJeuj1RJHDTl1
         6RkPqfOTTEeoRKDiWLpdHPrlwOb3TKn20ChaOcjXr+TrbXS0CSHJrm1X0wHZ3tQUNtJZ
         0CS6MbG0gk1IFcm/XHrujpSU2fQj2r3QVmFZnZKAH10mTMHnawwQM0SOjv2KIAdO8TWx
         zIfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=dLexcMILAt1/IGDNeNA5OV8M1T9BYJMPZPpNc1gxVi0=;
        b=o0tf0gkYFuKmG9pi+udNR+mxJFQSAEHbMTvgMoCaOe3VBRA77HP5CcYqkIfqhUWMu8
         pY4RWWxEoXAhm5vVCQ3CJoaxzbqeiDjFASmcXoCzDIUHn4jMVwrEIpeWKCb5d3EanbO6
         ImuKAXYl8j8CzI1xx2aOG/+wxevOkJeVSbYLT/xc5f1zpgTfYvGHRVO1WvkjOysvacQN
         0HzUpB0y10VfycKrAER8xG7LyHaXIdzo6jmbOu4IICQSu9x1HvfSV9BBT5eyW9ctL6sP
         lBDh/GcBtyLhqgc81sWzFvGTyVRU7VfGwRG55zaxQ9fqudTlp9Hs5TE1oQTMK7kVOyVi
         pUXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXZg2ORW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r13si12447436ybl.422.2021.02.20.13.29.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Feb 2021 13:29:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gXZg2ORW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDZog-00013H-PO
	for alex.bennee@linaro.org; Sat, 20 Feb 2021 16:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDZoK-00011a-Fw
 for qemu-arm@nongnu.org; Sat, 20 Feb 2021 16:29:08 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:45860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lDZoI-0003mB-HR
 for qemu-arm@nongnu.org; Sat, 20 Feb 2021 16:29:08 -0500
Received: by mail-pg1-x534.google.com with SMTP id p21so7643468pgl.12
 for <qemu-arm@nongnu.org>; Sat, 20 Feb 2021 13:29:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dLexcMILAt1/IGDNeNA5OV8M1T9BYJMPZPpNc1gxVi0=;
 b=gXZg2ORWCQV70Ed6rdOdBKnkRNFtSzXBPCkYwhmEK/pRY5jbG0a1Is7BMmcHU8iErj
 T2Kg/yyLtA7kyBzNEzxVymFgBRwMIUWXrgzsDv2qMXMC69r/w0lozZQg+3Q/S9SJGwSa
 ++s5MEru3kpflfY7bu0u39FwQ3zxr5/cAEe8We7pR6uPQW6jg4Rk6mPQNdBBKryPYChM
 zXvKPzetdv2cCKXuZJmSzm0axzCUJZE0pCAUwMHcVlqwEPpjWPnkR27etEQBhmwwYnCV
 8WDA42MMNBoNHI/ZLj20r/lVnuHrmQqhYQuqILZT6Hb4N+n5kGW6eiu9fJc6t+ECQL1q
 wwZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dLexcMILAt1/IGDNeNA5OV8M1T9BYJMPZPpNc1gxVi0=;
 b=jtzYr7wbH7BsWoTczNVT0MxhBn9K03kCSQ/+cQGoUupDlR1GcCUn+kJb1B+K4/RXuD
 0fTJOBQprliecXEDURch+yhQQ91hSc4a/SyraNyJg23wJ+Rd50fksCs/fAXIxfGOCVx7
 qYaT5wtsllwak0mDpUJ8iP4cU0NfYrNsrsvPlgvjzk89LsVV+9B1EkRuXpdBKA0d9Xl7
 LPH9umps5aXtteO2li8LQdleLOm8QcELlyb8/UucUeCwlgvsrUYdSQHSEF6Kihpwlj59
 t0Png8RllyBX3I5ea0OnjDPs/7CpCaMUr3W2woOIQ5rDtosq8sYzDSgdaMnaAwzj784c
 IyyA==
X-Gm-Message-State: AOAM532NJMaN/90GY5Z7bszrfVWXx2OBirMxhSkL1nQR+1HnReFqtKcI
 feHYsdFAcHfEHc8j/r672FCX8w==
X-Received: by 2002:a65:64ce:: with SMTP id t14mr13854024pgv.36.1613856544842; 
 Sat, 20 Feb 2021 13:29:04 -0800 (PST)
Received: from localhost.localdomain (24-113-145-216.wavecable.com.
 [24.113.145.216])
 by smtp.gmail.com with ESMTPSA id h186sm9726559pgc.38.2021.02.20.13.29.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Feb 2021 13:29:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] tcg/aarch64: Fixes to vector ops
Date: Sat, 20 Feb 2021 13:29:01 -0800
Message-Id: <20210220212903.20944-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: +GvqSOffZ2u7

I guess it has been a while since I've run aa32 risu on aa64 host.

The launchpad bug is something that should have been seen from the
beginning, but the similar aa64 operations are expanded as integer
code, not vector code.  The aa32 neon code has only recently been
converted to use gvecs.

The cmle0 (zero) bug has been exposed by the recent constant
propagation improvements; previously we saw a reg/reg compare.


r~


Richard Henderson (2):
  tcg/aarch64: Fix I3617_CMLE0
  tcg/aarch64: Fix generation of "scalar" vector operations

 tcg/aarch64/tcg-target.c.inc | 213 ++++++++++++++++++++++++++++++-----
 1 file changed, 182 insertions(+), 31 deletions(-)

-- 
2.25.1

