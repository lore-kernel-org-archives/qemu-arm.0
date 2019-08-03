Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2201154wrv;
        Sat, 3 Aug 2019 11:48:37 -0700 (PDT)
X-Received: by 2002:a65:6859:: with SMTP id q25mr18142104pgt.181.1564858117781;
        Sat, 03 Aug 2019 11:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858117; cv=none;
        d=google.com; s=arc-20160816;
        b=mAupt0a3ybtb6tXFOC4iDnPsCTf3Ns6iWVVhV/DJklAWJClsOejs9TWXqko0DlrwUV
         8fmMJbywFQqeCg8ypzScAJt6dPInxvdhqmPJMuIybOzLh8S+C1+Mtf5NIHy001SHYOwS
         qPPge9A4oE+o4nq99PJUhpQTvk2b0KuirRLabkeWbpWeknz/qyu2AW1IpzB4R8oITwlC
         +X8bdlhYUHQHrRDG+LHrCpnDauMiixtxH4tzis0CwlxeSdzi5sw/zhkYNoKE30LPPhuD
         xAJ1t6ZTMMhaSog7Gd0uPyu2Wy4Q/dnSV9IQP+IaU18DjFXwCEfz6Q+8pemv93Jp4+DH
         xYAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=4Ze85vH/aQjxlcuWsjYuHifd5A5xyc14ioC1rkP0Yto=;
        b=THSv/Y8HP53JYbhkdWPiVLjivJO/NlTIh7vkbZFERsgu6GAxC5GEPQ90lv+ihlq3rF
         kafAmYMzjvJdZzPE1KVVwZ+O/o3dR0Gp0NTJLasjYRgpj6Ogjr+S+/Zautc02QwF5LuH
         toovnT0P5Nrwirf1J+yKdp93q8Z62xhuXL54VS8TWB3go/Ua1iRBOEoDes+ejoryrjE+
         abeMpZ9hLCkiGsDmCXXJjLWGsgmA4q6HnZY1kmyA3AyhS5YuG1KwXCSu6a3yepjKCRN8
         AXXn+HEYj8nNHYav3t/2YF83fOaxevRsjbKMivYc+qPLt7OzSIlwx1EWEy9yNKXyWjgG
         PJ8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B/K5WUnn";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y1sor31273269plb.65.2019.08.03.11.48.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="B/K5WUnn";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4Ze85vH/aQjxlcuWsjYuHifd5A5xyc14ioC1rkP0Yto=;
        b=B/K5WUnnGiy111NPTwOaiQW0NtyN9hpfo4MH+vcSVcsOM/2oss8u0hV3oRVIh0AYHT
         Q9X/yodCD/1/kDno63G/LcVovJJW9iHlyBX9ihwk5aeRS+mLvzxOt6LWUnYKffOMdALc
         8kQ9ZcY0bj3js5usQnd1daxvaGay8B7k6IRXr0W24a8TIsrx9bnj3IwL5yBIa2aCyuKT
         J1HSY9fImd3SmYU/7JQN3uWubz7I6BH++g0KihvBQT7bQEx2AAeNwOLZzSRTVLUjF3w0
         L+JnCj9eer4GkI2V/tXWBV8W+bIl6bil4kr89MYOhpuVVxpEKi+uHWL4KIYumKvxoUev
         468Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4Ze85vH/aQjxlcuWsjYuHifd5A5xyc14ioC1rkP0Yto=;
        b=eLWKmnZ5WhJuFzat9Txb1n18JoUHxJV5XAbFJcvA4bd6a3zYSqpU0d7VPCUxoeJmEn
         5gs+lQw20lObjzDI+tJDS9/nlW7pv/nUMlIccE+dNHIhsbd8kK0xsifpaHXzOpgEI+Lh
         N3y6kTMpkUP1ylcfD7kfBh0Eqpr3oPSi8gr9fPwIxmpw+3hR31Qx3OIj0G0ULevj0Snu
         +vqEBR3vSC/RJU5L7KN5s+AgoUYAhdYAKEYtWQAbudLnYkwe153nWAZLcboQB9gltNbf
         rCwvAwxM7gYSibzs70cuTA6N+ydP7Ihw6CkmcqnlSy/zk7cqD1oGZQSCgrQvtME5qo7o
         i38g==
X-Gm-Message-State: APjAAAUHha+mxnG1C599ayJ+apyUn/rhPbvEpHxfx8HwrhCA+wHQwd/s
	RCho6AtQujMggXj4lAjRCVzojGM2/2L1KQ==
X-Google-Smtp-Source: APXvYqzJFO+1FmGoDSJ9r7CICKD1CR4xMc85MG0BDcvENkf1v3+QwuGOrezYuv0NcVNbI0lt6Kk2OA==
X-Received: by 2002:a17:902:9041:: with SMTP id w1mr23791104plz.132.1564858117384;
        Sat, 03 Aug 2019 11:48:37 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 29/34] target/arm: Update arm_phys_excp_target_el for TGE
Date: Sat,  3 Aug 2019 11:47:55 -0700
Message-Id: <20190803184800.8221-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
X-TUID: /u1Pgc0ng8qn

The TGE bit routes all asynchronous exceptions to EL2.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 984a441cc4..a0969b78bf 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7968,6 +7968,12 @@ uint32_t arm_phys_excp_target_el(CPUState *cs, uint32_t excp_idx,
         break;
     };
 
+    /*
+     * For these purposes, TGE and AMO/IMO/FMO both force the
+     * interrupt to EL2.  Fold TGE into the bit extracted above.
+     */
+    hcr |= (hcr_el2 & HCR_TGE) != 0;
+
     /* Perform a table-lookup for the target EL given the current state */
     target_el = target_el_table[is64][scr][rw][hcr][secure][cur_el];
 
-- 
2.17.1
