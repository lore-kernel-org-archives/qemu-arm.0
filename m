Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2291094ejc;
        Mon, 9 Jan 2023 06:19:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsprL0zkWcx5/+9ewwaDn6fL5Ck9jwSyL3+8A0rlGf2OhX4o2vNMeaALiJ85tqEmmm2+BF6
X-Received: by 2002:a0c:e642:0:b0:531:9342:3693 with SMTP id c2-20020a0ce642000000b0053193423693mr61700924qvn.43.1673273947841;
        Mon, 09 Jan 2023 06:19:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673273947; cv=none;
        d=google.com; s=arc-20160816;
        b=kV7djN82jlG7ZNuHYNGQp+3tIr+97nruwt2yHaIKLYlS94VtM+H42EgwzZ5IpPeJmb
         YPwX9chokHO2jMNPYEv/NlebLplLhdOaPbVLtKcQ2nWRaIbmBcoIwWW57NsnaZj0fdTd
         sLsY3ldtirtAIP4JwmBPM6t/tdOlJ6UkkU57IdAK34hneZsWXr31kb1loWB1Bsbom1WL
         F/dODA06YQTzva6ju8A4ADRsXkMAcK6myfkZhz++EbaQZ6CIzd7fib8dVFTJT4e/vMxR
         wFyhrAz12gYR/1zbB+6Pc4S0bKg057wHyeRlr6Prc8i1PpxuKThpvy1iOxWUIR2xQwxE
         N2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7BFQYTotXMIsrw/hyKX+oi+c+rZBE8f8yezrJmKudvs=;
        b=RiFoZraWtytWxE37tYhPpI8QgCaerpvAX844iH1XqW9Jvk2/5+3CvzUtAR6wi+VLkL
         YOmCnM3XJOx3aHXFc+Y4nlKwmDh06kWqLVUQEQoHL23MQfh/pfohAROSRWyxPeRirF/M
         2zgDep1AENY88ydID3INwCi88UuQnq2gLzEW1kiH2VOgtM+RWmbOiKeg2BOHNN4GaBYP
         dV8MLV2SSOfQres8W/6LqlkNm7utldWPu9smVYKeChJwSoTtjJn1ezf8ElgmXGeh4bLn
         eINInGP+DrA2YOJ2il93OE3K8n+iYQyT0qCEsbyd1CD09OGUxJOSLH6y2tEWMFArKcpg
         t3dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X0Lve+yN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ey3-20020a0562140b6300b004c79aae1a74si4778502qvb.504.2023.01.09.06.19.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 06:19:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X0Lve+yN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEsl4-0001pE-PV; Mon, 09 Jan 2023 09:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsl0-0001mE-V7
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:04:13 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEsky-0006ye-UD
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 09:04:10 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 p1-20020a05600c1d8100b003d8c9b191e0so6841928wms.4
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 06:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BFQYTotXMIsrw/hyKX+oi+c+rZBE8f8yezrJmKudvs=;
 b=X0Lve+yN2jV2HlrkcE0RiLBXetXm5XbVn/pIRfzyp5PEoxSgfn+Z1EJyezUwse8F2R
 zX8WgUuVM296gZSqJb3SxLK2xDjv0aQnKjm+cUXWKTgiyaTB7RDVreDMCf+iuHswCQGx
 EpKdqKzZcmglNXA0KQMXD2CXzMGOtYhsgGw68BDh2kc4ePoK5tvasKuaY6O/p1QWhS3Y
 s1Izai2Xsz8CBp9XpLvnsjqjPmiMY1b4P83BA1FJXLIX5jOwDXRAS/L+Z3djoSkLwrpY
 NeUslyD1we7hObvLTdk+yiv8Hpm8El1H7tlq8p1YVcAVZm0a2i7gYIsQYwEf3WgUT89I
 9LCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7BFQYTotXMIsrw/hyKX+oi+c+rZBE8f8yezrJmKudvs=;
 b=dgQQTrddOwqtvBgB1VmzU3lsXBZNAmQAM+0U2PhIi/uoKpTPg5q82KKNAKW6JiUScF
 y9slHnBjOST5QIacKtyHAhYfXGLmRo0PeDcq8UEKmnHOLylBjwdqYT5Rv7dm5QHk8NBM
 eHNLD+GMU2OP4tS3kEv/w1SEmpHAEBxy6JbxNOAIMsic8MAISPd4l5AJWIRAQscMVSgE
 dDi1DemLcvFsOLR9YLyA3/rJ++3Y6gnGNJz2D6FOLTc5Y/N4O7Wvh/dBdVm3kTmvGfAR
 LiWSpshszREJxJUGyVsk9gaC6zpJzQrqseYwBUg/vE9SXRhmF+VVkvFD2X6B+BmqiZLs
 lofA==
X-Gm-Message-State: AFqh2krg1p/HlTqld116RJDXI5Q2n8LhRsN0lHYM0EpeuFcasEB7t2id
 evRL0tRBFQ2cGBZpbtpeq3ceSg==
X-Received: by 2002:a05:600c:5024:b0:3d3:55ad:a114 with SMTP id
 n36-20020a05600c502400b003d355ada114mr46999823wmr.38.1673273048229; 
 Mon, 09 Jan 2023 06:04:08 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a05600c314f00b003d99469ece1sm17126842wmo.24.2023.01.09.06.04.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:04:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 12/14] hw/misc/sbsa_ec: Declare QOM macros using
 OBJECT_DECLARE_SIMPLE_TYPE()
Date: Mon,  9 Jan 2023 15:03:04 +0100
Message-Id: <20230109140306.23161-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: d4Ptv12kxyXQ

This model was merged few days before the QOM cleanup from
commit 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible")
was pulled and merged. Manually adapt.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/sbsa_ec.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/misc/sbsa_ec.c b/hw/misc/sbsa_ec.c
index 6f19c21195..86b23a5372 100644
--- a/hw/misc/sbsa_ec.c
+++ b/hw/misc/sbsa_ec.c
@@ -21,8 +21,7 @@ typedef struct SECUREECState {
 } SECUREECState;
 
 #define TYPE_SBSA_SECURE_EC "sbsa-ec"
-#define SBSA_SECURE_EC(obj) \
-        OBJECT_CHECK(SECUREECState, (obj), TYPE_SBSA_SECURE_EC)
+OBJECT_DECLARE_SIMPLE_TYPE(SECUREECState, SBSA_SECURE_EC)
 
 enum sbsa_ec_powerstates {
     SBSA_EC_CMD_POWEROFF = 0x01,
-- 
2.38.1

