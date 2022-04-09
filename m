Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp172516lfq;
        Fri, 8 Apr 2022 17:11:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdkEjaSzS1sppYf23BIeIj3jlfKOGNhWtgNrfitm83cGWxPjf2aOIe7ua1GoDTHweKxM/P
X-Received: by 2002:ac8:5d8a:0:b0:2e2:f0f:4308 with SMTP id d10-20020ac85d8a000000b002e20f0f4308mr18366538qtx.618.1649463060907;
        Fri, 08 Apr 2022 17:11:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649463060; cv=none;
        d=google.com; s=arc-20160816;
        b=iYxFIOuyCWUt8VGP6TVeFZWuW39SmpaFK2ETKyYqrCqhexxn7XnOUJ+uQf3QLdrhi+
         r4aHH/HF2Dzz0Vt0KF1hjIy90hJjwp+3eKnSzRSofOP1ahEtNGWOI33smORghoWKcZ9B
         g0wYym6V9mlq4kQcJGc+xcACAyAWNq/xRD7xGZ5ycTWFQvduJ8WBtzsBYj+w1mqEHxFF
         5Zj8ztHzv1gFASP9UD4sfDvIsx9fAWn+Emo71KeHv1Tl9L+pIhnqdv5k/JPtSctxiVVn
         uDNTNB3pHQDoLA7WNDmg2aKb1ekRgU16KZ0ulcnaBcFRvg24V9dD3ee/5NRmYJ0UPW7w
         6hJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=d2bF5Nr0rwxv79nY64ioUunD/Z2b0emNBLOrA8/hvIQ=;
        b=DrZD7RGNJK6ZmRvIFlIy8JBrf5ioeUqW08MEcaMgCy0gS0E1sf/sQi2kP1b7OJZkgU
         RMgopu0vb7Nc2MeeQF8nyRy/m3ZWe56pGE73XRCrbN1/YaCJnzxOiMlYkLpW/tBKg6+B
         Od9oLSKlm5S+iswbfAH7KrMfdedmFLuSLLE8MtoFu751+vEDyKbUFrkfgKa7gHeg8YMu
         9QqanTtnt6xThK/OzqGoSsxXmL77SfPvxaOJIHnOdTpiaHTGc2pPOBtL9hP9SWlJmIdc
         ORgHlz+6fAtguaovUZWbdjIdiCEQmaSxUw+ANnC0qQMbTpAlmYKYPtQN4izIFhwl3HMK
         SXfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dhtm9mZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020ad45bcc000000b00443cfc95db5si1202192qvt.84.2022.04.08.17.11.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:11:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dhtm9mZg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncygt-0005eI-8J
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydp-0008Bv-Rk
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:49 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydo-0003QN-AO
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:07:49 -0400
Received: by mail-pf1-x42f.google.com with SMTP id bo5so9788722pfb.4
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 17:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d2bF5Nr0rwxv79nY64ioUunD/Z2b0emNBLOrA8/hvIQ=;
 b=dhtm9mZg0TIdFZEFeKCvOtc1WY2lqY3eZ0b1jp3xI+9KYfK5Hd8kT0iWhvGbBpHaoI
 ctJrRJXufe9HaQMbngSZuXG6LeylrxXNLH5/u5fS/yHd3oEwEVqN5RbX7WXeymeYaCvI
 opcYvUSa34+lvY4DyLOl3TNPSte66uXePCHTJDHyhxl7Z1kKgm97Geni7FfVtvoEgfvK
 4ybrO7786w6dOHxsCNlYIO0oZkX/Y1COMpS/yycb0SbOY8DVyJcJRYmg1MySNet2WVVt
 EKQ7Z6oT4M5igS7myrCyXq3n+Rn/ocMBZ981CHXw5yU0ac5RuTsObAEJCy3IjeBf8ney
 jLrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d2bF5Nr0rwxv79nY64ioUunD/Z2b0emNBLOrA8/hvIQ=;
 b=j/nd96XBhL68ezFmAB2XDW1/FXylVH0EsXjWjaJoq9n4cK0tKtky7aGy57+Jbsz1sM
 DrgETfKERVPvTKYDczww9OL/m9vqtojEran17sTsnRN4o4SFcUuTAGC+WI43P7AkJuFF
 pHWTb7Xzkt0A1VdSzLGaAFpOvLV8K1JO7BhmeSeFEPaKHMKgh1U0oW5Jvh3LTEHurfqp
 3c3hlCz1pxbclVtdze1yS/GGU2dhsXGMPHTknaRvXMF6xxqkL8lBjuY6hS0hBFYzyoXk
 1KQZYKj8lNHF7MNjg1u2lbrj42Q9/nS73EkSrtBNalnt4Vmq3skMXY1BoiiEuekxsc67
 7/CQ==
X-Gm-Message-State: AOAM531fHUuQSoIoKRJxZ8y08dateo9X7KQ+ZkOSRg0wUJ2434EgeQlQ
 hTo03j10wbSR6zDo2ORw2FWe6fyFWL1EuA==
X-Received: by 2002:a05:6a00:985:b0:505:9b3b:3fd6 with SMTP id
 u5-20020a056a00098500b005059b3b3fd6mr797141pfg.30.1649462866894; 
 Fri, 08 Apr 2022 17:07:46 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/16] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm
 -cpu max
Date: Fri,  8 Apr 2022 17:07:30 -0700
Message-Id: <20220409000742.293691-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FKArtBnZ3lbl

We set this for qemu-system-aarch64, but failed to do so
for the strictly 32-bit emulation.

Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 43ac3e27fa..9569e496e0 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1029,6 +1029,10 @@ static void arm_max_initfn(Object *obj)
     t = cpu->isar.id_pfr2;
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
     cpu->isar.id_pfr2 = t;
+
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
 }
 #endif /* !TARGET_AARCH64 */
 
-- 
2.25.1

