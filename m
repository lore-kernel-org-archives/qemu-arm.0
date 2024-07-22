Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2050339njc;
        Mon, 22 Jul 2024 10:31:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9rlsItVMs8qOJiGXwxliHFUAqbsmgu3d31rskOSl2yQwhQcw9uCf/2AWh7eWC2pJoRu2hY+zKo72Y/mswBpsG9H1LfRSQ
X-Google-Smtp-Source: AGHT+IH6VpJbX8j4cZJyC7P4UoJNfrXsdWQEFoTPDP5laEerIHiBtLdXE4vQLn8JzpyAr22vmicI
X-Received: by 2002:a05:6122:7c9:b0:4f5:202b:6220 with SMTP id 71dfb90a1353d-4f5202b6dd9mr2849945e0c.0.1721669470570;
        Mon, 22 Jul 2024 10:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721669470; cv=none;
        d=google.com; s=arc-20160816;
        b=nF7jI5ERgXNfa9RKr9X2ULxwI5xY3brdIHvDWlqKBIZTzBFtqtt/FqSoexXxxTWarJ
         3Q2uaOpRV8F5SkYx/UwIxxypsEqbQfK7xIEy9/zehiP0nLcCnigfCClxqDdaj7GgvrFx
         J+ZySBLjB43TkU0atfdHQZIYZtPF+FjzhKeqXOJUGJ3ZSTupgNVO9KLByBmDgCBgRs8p
         VSIwr3NQTHWmPrbHuubadoT71IPf7Ud8vMjCR89zoipoqa8e26T82jrlRU68WDmsNC1e
         Z0TAuQoILRsprugkhnbzu9YgnaYz/xtcJGwdmD7KTouZT/eaJTqtBX42mtvuZo6fxWzc
         GCmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bf7ARIytQmQRzsKfx3SaAbLzTh/grrFtr44A30HzPU4=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=BZhFXqLq68Q43fFJ8VhZQ4t5kLQEV+yui8DY1/360Tluh3SHwIXiTYULzZq9j5z5NN
         0eRsrDqYc0/7DVFjQgGRhudvGch0DrvxYU2CfmdChzPR2UseU8dn+/5vwq3BFa9P+iYj
         nGeUFruCJZUxv6eEobNXDLh3IQGDdk23oKXkNVKQgObjGau6y7i0mIYayabsgwSOzzke
         y0ZRPTVd8QMTQFwGgo4p/bWbp8AcpgI+8Xlv3uJav78wX5usULd9paXy2iMgBwgc6Wgj
         mEhkfgeP84fPZRK4lZHouJxoDFQBmaYNzbA9jWU0IFYG8jQ2YNJayeNrz9BJgfgH0ZVp
         t04w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SEf5FqNR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-4f52574bc8csi403216e0c.195.2024.07.22.10.31.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 10:31:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SEf5FqNR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVwrd-0000Xl-5e; Mon, 22 Jul 2024 13:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVwrZ-0000Hw-J9
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 13:30:17 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVwrR-0006OL-Co
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 13:30:17 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4266f344091so33592775e9.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721669401; x=1722274201; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bf7ARIytQmQRzsKfx3SaAbLzTh/grrFtr44A30HzPU4=;
 b=SEf5FqNR1Kdi9mAFGhw0ttVr9xsmgCnV4h8F/5x2NiHuy37gME1nKEBiS1YMH+NXvh
 LPpjXwIcOXTIzgtuG+clshOdC1WxZMs+S5/l197iPSvX2Hu73T59VDV5T4CPEhFhjbsf
 Y/YA/IcV1tXGcK9aF/is/Gbv4D1Cdvzk+/I5+eecGcoDDWLpOPQxi61vxeVFxL9XDdI/
 S50gbxhzcAE5HsdEcJrqMixmb8LcWYpNhmBsi9hrQKXHBnp4tO7H0rRhYUUEHIOdO/Te
 XaNh5e8uqkLuiyfq8N+ENAw+DT9IWbYFn3pZcdOojXz/uCY2TbQz6q3RyU7et4cNzNvw
 pePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721669401; x=1722274201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bf7ARIytQmQRzsKfx3SaAbLzTh/grrFtr44A30HzPU4=;
 b=aU+SEEWc78YcoOY33bOQJwQ7RPKRHHFbTuvys+L44ErhvljrWx2a4cYEnUlNNCED82
 S578tiFhPKFyjIy0pPkWmyNv4zQSVJAbDL1EBubJxV66b1gQSe67XEiWdGI7YSSzC03d
 6epVUWYHII7XgiOCKczmntGwdssi4EaK6pHvONRJoPPxC8/s8ObF6LIcPE/L9eZIsJU4
 DqnrClBUVFQn5J/TXhgIU2B26HU5iL6D898MhiVbHW23mmMjTxBt17eiWBBqywHRtRIW
 QhlsuNqQKbdF/pLQOdStw3zIn8tDN42OgEa0rnmiFnbZ4Md3x2rYRPIDqpatm3W9xY3a
 iMOw==
X-Gm-Message-State: AOJu0Yz8v/e6vuit9xtwFauJHKB+crt6mikIIdWcCmSxPqDghR+zAsQI
 XrfGndj1j1nQQ3LdOsiBu2Tv5AE0Aqn/j7HZap9leTIYUbpsbi3AMV+MjRlyW2yanHh+YQxYt31
 0
X-Received: by 2002:a05:600c:1c27:b0:426:62c5:4741 with SMTP id
 5b1f17b1804b1-427dc515f90mr45072115e9.2.1721669401439; 
 Mon, 22 Jul 2024 10:30:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d68fa493sm138035665e9.10.2024.07.22.10.30.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 10:30:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 4/4] target/arm: Ignore SMCR_EL2.LEN and SVCR_EL2.LEN if EL2
 is not enabled
Date: Mon, 22 Jul 2024 18:29:57 +0100
Message-Id: <20240722172957.1041231-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240722172957.1041231-1-peter.maydell@linaro.org>
References: <20240722172957.1041231-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 04AKzI759gNh

When determining the current vector length, the SMCR_EL2.LEN and
SVCR_EL2.LEN settings should only be considered if EL2 is enabled
(compare the pseudocode CurrentSVL and CurrentNSVL which call
EL2Enabled()).

We were checking against ARM_FEATURE_EL2 rather than calling
arm_is_el2_enabled(), which meant that we would look at
SMCR_EL2/SVCR_EL2 when in Secure EL1 or Secure EL0 even if Secure EL2
was not enabled.

Use the correct check in sve_vqm1_for_el_sm().

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index ce319572354..8fb4b474e83 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7232,7 +7232,7 @@ uint32_t sve_vqm1_for_el_sm(CPUARMState *env, int el, bool sm)
     if (el <= 1 && !el_is_in_host(env, el)) {
         len = MIN(len, 0xf & (uint32_t)cr[1]);
     }
-    if (el <= 2 && arm_feature(env, ARM_FEATURE_EL2)) {
+    if (el <= 2 && arm_is_el2_enabled(env)) {
         len = MIN(len, 0xf & (uint32_t)cr[2]);
     }
     if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.34.1

