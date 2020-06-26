Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp58047lfm;
        Thu, 25 Jun 2020 20:53:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPogRDn9i7aRo664yA+o3LyRVV0B+j/1AJUIhIdFd1+MQP4d3viqsvQpSLbE5myiW6lBeJ
X-Received: by 2002:a25:6981:: with SMTP id e123mr1755183ybc.317.1593143597658;
        Thu, 25 Jun 2020 20:53:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593143597; cv=none;
        d=google.com; s=arc-20160816;
        b=r6H7PeEkIsKz3LxlJW+G2DXnQBDEWNlNhiugF0IQA12Tj2p/qKiyw9bQ2rX9EIYd85
         XkQAmNMvoV2+jomC49z061EpATIrmAgahc8IY4E0gN+UP/EZdSOUbhdpvwAdmxxQ1gak
         E9LM8yKAcPHV5ZS8GjQ/o23g2UhfxrDRFPI6uoRQum068SoGtovQlQZK0cY1472EvrAI
         bT6P14Jtaw/KR2eXceLUkBLMW1IL6sDZFe2MFEo+LCjjyD7Lw8Zsk5L/GTO7mIn+dPUs
         s/9ywTgGj4S7pcQBrdKzwrQmRBrq34cUjWP5ZyH5l+zJO6uZo1XnyENUpKVFdU1Dw2uE
         b3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JXq//EY41qOxgUUn2iV4AqQzVXGmUlIHXAR8u9hZfo0=;
        b=iwQ451ykmbDC0f4jckkK/PtjqYb7ZA9aVsa9Gnhk9PPhTYnlUY/KTd6BhNd2SWyPuG
         Sgft88fsLSgG/GIIdw/4cOuDvIGE7KhoemKcDAKw+3xve/R+uRhSuGk8rD6xNwp5LWX9
         ZHi822cFFbmhKnXo5p8LfwPKCin9oyhrzk/mHcAeq6fCsk1hA/d2zpphxoJabVphDAV2
         Hx3Hb3D24XL9cfWFb/8p6y6Febmlt7BTVlTGvXaPDVIrT43GZomb6wNfL0n+uQE4FE0i
         x5Ix6YtVu8pLDKXXh89nFO5pgTnO0RMlnpTohtEqA9CKp8bzRvc81YabGx5wjuOvem1w
         GgYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cyf4cnla;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g64si1175782ybi.438.2020.06.25.20.53.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:53:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cyf4cnla;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofQT-0003B2-2Z
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6Z-0001IM-AG
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:43 -0400
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542]:35414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6X-00026x-Be
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:42 -0400
Received: by mail-pg1-x542.google.com with SMTP id f3so4367345pgr.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXq//EY41qOxgUUn2iV4AqQzVXGmUlIHXAR8u9hZfo0=;
 b=Cyf4cnla5cVLfmql57rJS+R6jzHdzsAy1Im54V6l+MCvraieqKliZWagn1CPTzu48I
 tx+FUloVSn5h5DFvJDxB4OLweVGUCzdGvjHHH+sGbrZG3GElF2ptEbo8+X5f6IPeCzeK
 ewTIFpVxazQaHb7zQ0AbWFf4MXfkKTXRI/G6duOct6qKEJ/+HFxLzLo22/oStkM0SC5o
 7jul4WYcwNCXZWtOgVIaWQhngnKNGQzJmPkCwGMCSxT6FZsM07Tfl9zIP4wq7lHXwSG7
 LWpk/lA/2WMpOMGWjT+lgQ/GlCrgDNkDaxdaKhy6x1sU5DY6UFZUb4FcjhbAZgbSlU+w
 vcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXq//EY41qOxgUUn2iV4AqQzVXGmUlIHXAR8u9hZfo0=;
 b=sn135VVKY6ZJVYqQN375+kOMmZTzpoYBOQiNQipgFwdApcwLP/KNpIju3we3jpmgJ5
 +rzxEgQivczKLQa5+/oaSqwHrT7ZURHv+WF59670sdJDgWBQTzuE1zLAKwvRbvYZUsjI
 V3mb2pT1z97ftJ7UY7RQyUhjzC9o1kPO3pzZcQIGnYFW1cPiUmhSGEkkH4JB8S3ZeKy4
 VFL1lpbCXRMhE6wwFrZYRlkqhirRR3eNODaGO0h7BKxEnVirWFlsuBOl0RItIgFxqoWT
 3xV31dCj5bPFRSg+fmYuDx9lRKvWeuRs3Lt187/Ui5SRJOA/+/uAH+KWh9Ijv1g6EYpE
 M5Uw==
X-Gm-Message-State: AOAM533Px0wzWufQNmSZjqZVRxP7R9foMKo5Ne7CuJEIOR8oVdhWYYpr
 KHMYl7tLeRA6AZcJToa5rxkTZg==
X-Received: by 2002:a63:7c56:: with SMTP id l22mr901141pgn.127.1593142360083; 
 Thu, 25 Jun 2020 20:32:40 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 40/46] target/arm: Set PSTATE.TCO on exception entry
Date: Thu, 25 Jun 2020 20:31:38 -0700
Message-Id: <20200626033144.790098-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6iIKTnUcQQfJ

D1.10 specifies that exception handlers begin with tag checks overridden.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Only set if MTE feature present.
---
 target/arm/helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 23cf44fcf4..d220612a20 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9704,6 +9704,9 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
             break;
         }
     }
+    if (cpu_isar_feature(aa64_mte, cpu)) {
+        new_mode |= PSTATE_TCO;
+    }
 
     pstate_write(env, PSTATE_DAIF | new_mode);
     env->aarch64 = 1;
-- 
2.25.1

