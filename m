Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp215456ejq;
        Thu, 4 May 2023 04:05:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4L2pM0TKp4F4mhHPddmgYZhi/YlrEQkb0SJXfVSTOxNNvMX1hMTfojOIslhus/MW/lwfkd
X-Received: by 2002:ac8:5d8c:0:b0:3ef:366b:5afa with SMTP id d12-20020ac85d8c000000b003ef366b5afamr4675367qtx.54.1683198319178;
        Thu, 04 May 2023 04:05:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683198319; cv=none;
        d=google.com; s=arc-20160816;
        b=OmrMdyF4U71FYcBAH4+9/AZlDgDmEXJaf4L10gZF2cHhEcvbxj4Bm8ogChu1R8EWMf
         XYxN4k/o582rTFp5VR9jLJzK0z5lRhnUJ2zuFjZmtsSppQY1CXdC+e2TDWb7gLTSn+jP
         WLBfFeUINnofYb4qzf3EYizLQAmKD2mWNgg/RskggKJOwuNxDxNybpr9zPS7xAekfAqI
         3XAl7xavpZ5rgGLl5muWU2iY1Hy9XeaVXbj4coNNDSWO3eRl7MAbYeEjPg/kUuwitpXM
         gJFryHhYkmsfsLtK6e3ctGvvaKWKvkouZBIqUeoZF+ku3KDh/WaAbcV0A40SuVa7MpZ/
         qSfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EqsWyKgIel10u0a8d6iD4G1u4ltjttpGWCj5zn8Ru+s=;
        b=IFOQrCQ4QxSlu93uZ+T+DrH3Yf8lLeru/6yML45JwUONIzPG7OufptIshp+4bizOcd
         7QbETb6EuTtbWLpLOuucAefl9SuN8k1FFa2EezZD2AO3NjAoiUW2C0D8rxgqhH/PCR5z
         I0+kIVcCuNMXJpe3Kjz6HE1EeFecVljVB1DFCkPZr4x/rkQLAgX4HvUEc9DScnyQFMLR
         CGdun4AX/M7Vw59MHV1QaX6Zl4VLUOI9hPlyn8pFdZf2xZBUc/RhI5GIroTwutLZIOPh
         qGgrczBTBUZl2Z3KB1McQDcjT6778D4Qr4mtCTJXwRn3GnVgv2oX6R98YF9MLAPfac/O
         16ow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VE0kgulN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020a05620a28c900b0074e020ff0f3si20331561qkp.221.2023.05.04.04.05.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 May 2023 04:05:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VE0kgulN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puWl5-0005fq-9p; Thu, 04 May 2023 07:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWl3-0005ej-CQ
 for qemu-arm@nongnu.org; Thu, 04 May 2023 07:04:21 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1puWl0-0003aR-Kg
 for qemu-arm@nongnu.org; Thu, 04 May 2023 07:04:20 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-965c3f9af2aso413166b.0
 for <qemu-arm@nongnu.org>; Thu, 04 May 2023 04:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683198256; x=1685790256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EqsWyKgIel10u0a8d6iD4G1u4ltjttpGWCj5zn8Ru+s=;
 b=VE0kgulNQj7h4yTR2HGiBz+Tboc5l9l7w9R7fTKDkfFIpSNOjCnfIVdHXCSM/L8YqQ
 Vie8IZf6a4wD/n5jcLGX5wKvCYmPdDFxhXOMsfT8eAyr3uwbILgdmzDyIBECuzb3Pqqi
 2rUjGw54t5/rt1PVM5xBJ7xGvn5mExET6DBfOvJjo+dOREiL1T/YrkoC4tmodo4ZHoNO
 zuuF9dySWlj0ATyXWRq7RNew1dF5lw8SLGi2hHIbh8EdmMmkr6X2e4D6OYcmoFyoQ7OW
 p/BntFVeV0iVlqNaE0aqXMkCl+ZaOpn4cvqucWy0WqvjLSsY8df5uPaM2hT1cppK6X5j
 CSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683198256; x=1685790256;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EqsWyKgIel10u0a8d6iD4G1u4ltjttpGWCj5zn8Ru+s=;
 b=RuxGR+pAHH4xIvlKQL6nuehyM5lpxlQ4qBc4YsNJ03GXkAhnIkNb1rn35qpfbPW5cc
 dwZenZm0l/uNQ8A/3Y59yzrxc4HwwrdY5pqB+IatqoA+sTkWc1f7NjbvbayOjcROXbWI
 HZyFQcOK/p5a3Bz4pNYEWDAUTqu6eeYeGV+Ga8TmopsHRHT+NejBqnM0bq4CX+Ob5aDs
 STcfctDrSv+Jc82x5P9j2PrJjve1g/I2dJaQN8zT9efSXaMluXrFU6TPCa/Qc0pn0LIP
 MePg/p59+aNgUh6opmRhgvg47f5Arg2DKeBge49Oz8ZCeiY9N4+8n6SninS1Q/uUyNI1
 UBig==
X-Gm-Message-State: AC+VfDziXl+UAKyDU9dUJFG44AQ/NHNLErt6c+ZPHqIJk3UFAZRArGUx
 mwdXrVG4elkEQ7zjCZJ83W2FxQ==
X-Received: by 2002:a17:907:743:b0:959:b745:d16f with SMTP id
 xc3-20020a170907074300b00959b745d16fmr6127030ejb.51.1683198255955; 
 Thu, 04 May 2023 04:04:15 -0700 (PDT)
Received: from stoup.. ([91.223.100.49]) by smtp.gmail.com with ESMTPSA id
 d5-20020a17090648c500b008c16025b318sm18626175ejt.155.2023.05.04.04.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 04:04:15 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 1/2] target/arm: Move translate-a32.h, arm_ldst.h,
 sve_ldst_internal.h to tcg/
Date: Thu,  4 May 2023 12:04:11 +0100
Message-Id: <20230504110412.1892411-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230504110412.1892411-1-richard.henderson@linaro.org>
References: <20230504110412.1892411-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62e.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eSezO/Qvw80N

These files got missed when populating tcg/.
Because they are included with "", no change to the users required.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/{ => tcg}/arm_ldst.h          | 0
 target/arm/{ => tcg}/sve_ldst_internal.h | 0
 target/arm/{ => tcg}/translate-a32.h     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename target/arm/{ => tcg}/arm_ldst.h (100%)
 rename target/arm/{ => tcg}/sve_ldst_internal.h (100%)
 rename target/arm/{ => tcg}/translate-a32.h (100%)

diff --git a/target/arm/arm_ldst.h b/target/arm/tcg/arm_ldst.h
similarity index 100%
rename from target/arm/arm_ldst.h
rename to target/arm/tcg/arm_ldst.h
diff --git a/target/arm/sve_ldst_internal.h b/target/arm/tcg/sve_ldst_internal.h
similarity index 100%
rename from target/arm/sve_ldst_internal.h
rename to target/arm/tcg/sve_ldst_internal.h
diff --git a/target/arm/translate-a32.h b/target/arm/tcg/translate-a32.h
similarity index 100%
rename from target/arm/translate-a32.h
rename to target/arm/tcg/translate-a32.h
-- 
2.34.1

