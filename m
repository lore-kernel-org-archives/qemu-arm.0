Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1144038njb;
        Sat, 1 Feb 2025 08:45:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWrqNRXaPut105xAO4EKDXHU+0WNbDaohe3+fRzCk1PKpfGis2ZelXL3hvlTtxnem7dU9WB6kjdH3amDA==@linaro.org
X-Google-Smtp-Source: AGHT+IG7iwzJ6cdYrjhL9sfocwNZ25WkS7+eO7LVT/YFO6BdPO7eHJazS058dN6M9LLhpJNfFXog
X-Received: by 2002:a05:622a:143:b0:466:85eb:6123 with SMTP id d75a77b69052e-46fd0ac0867mr161421591cf.22.1738428322979;
        Sat, 01 Feb 2025 08:45:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738428322; cv=none;
        d=google.com; s=arc-20240605;
        b=QfUcTUzf9Vyw7LELm43fGqO7W4gSVEToUneRkL0N2SICgEvZiATSkcxr6/xiUa5poy
         pJRvmDdT0PlcBq7zkG4NWHN3EzK1eHjxZO9qYx48jwox+BjMDYbIx7/2i0cTeJTKB3G5
         cyLoV4uH298nomJrreGXd9awQmlE8F54aA3Z3bQhQ1tJpqdvb4PML0fXtG623Ikn3W+3
         FSLLGSgCxPTqxNqwQVwYpUeEObA2gGGz9JDG9A7BOFaTEL1xfe5VuxzipwY4rst9l1Ap
         a1GQ0NogHgeJjuHPsxQkVeMWW+BswydC6x+Majjw7F6aSVeu8SF6OltKIKCDeWBLkWbW
         8h4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=qymzXrO+9F4JBSFIAl0zaVLUHcekNoeWY0bsti7Y49Q=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=MyWI0UR0YYaKc/wGOqADgHmGfjT/6RNUGxarknsk233nA3n4xVqmcn98J5PwkRSIKC
         gv6lZ9qpdvvXUNWX9EPlQbjyDCmeNKwRHl29LSTnWas4sELoqCD+UuFcJcv54VuLIcp/
         lDjbQvtaxZIsmfWDldnkMYRU+HLxCTtMq5Znz8+4RFim/9eDHIUgeSe0qBe8uV//9ELp
         tsAnxni5i0iVfefqmiwtNOO929dWwi4KrUEJpz56/0emRvJuqWVxBdSbcSlTsfMpqp2c
         KNysQQr9X5OYV6PlsZPGxkzD6vtZtWrmW+r0MMtkVh4t+d5whLdhyOn+iDJFxL92yF69
         0kGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PcbTa1r7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46fdf0d8133si68612571cf.154.2025.02.01.08.45.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 08:45:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PcbTa1r7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teGYy-0007xD-NX; Sat, 01 Feb 2025 11:41:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYf-0007P8-2h
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:27 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1teGYd-0001Jv-Bj
 for qemu-arm@nongnu.org; Sat, 01 Feb 2025 11:41:24 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3862b40a6e0so1894880f8f.0
 for <qemu-arm@nongnu.org>; Sat, 01 Feb 2025 08:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738428082; x=1739032882; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qymzXrO+9F4JBSFIAl0zaVLUHcekNoeWY0bsti7Y49Q=;
 b=PcbTa1r7Czsw2GvxssBQV4Mh/wHgQ/Ik4f9eTPTYW24m0hGETmjMSU2OfIFBCHLffY
 3FOHiHhquz60eEvagQZh3EEBzyelbbhGC/UTJlyaAT4zoD3TelE88rlGmsgAKFYNhmFZ
 /TAsiBEOb6puOXe8eLqbiTG6vn5crWQxmGcUj5QKXFsd5ZP2seK6g6L/iAmOKMjnOzpy
 tDoI/K4N9/A8Cq2y7Q9hOSwtZXnJGfojzczqGBo9azHxEkGjF8BxtnGgzQmCRtVttehh
 tHD8IEE/91UWhyiCvyEA011y2SMU6YXY+BSMYrTXdBidmZ3Lz9vtZ3mqnGs1H7DjqmeD
 2KJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738428082; x=1739032882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qymzXrO+9F4JBSFIAl0zaVLUHcekNoeWY0bsti7Y49Q=;
 b=iWoXuuhcQzzf6mHyylrlWBnRjJrsJgVct+54x3eGwXqG21kFDYl4zuHYKlR3oDYlV+
 MlbeUIkNLN40mpYpEX9JK/DZ8IPFUmsZcyEAAQWtLjmdMOxEpzMnARnLPFXoSkxUxIcM
 3WqM/SxDf4pzH3zVV63NexYAFy8kDUplpNuOZtdgOC6E1ROc4itXnNj/DRiMozEkQewU
 BmnHKkwYNCinGkexxLeoPXVkT/qJkfP94nenDmTJdcTdK4DAizx87Y2aVDkHzA6kokD3
 nZRMNd3bT/RKsi/L7otojPiS43sJFkIDYNGZrlIn7OO+T8v+XH7qz7Ju7hQN4OydEeoZ
 VrcQ==
X-Gm-Message-State: AOJu0YwMqZSfztFLmhhhwEGwt+0bIqU/Fv8ybb1uO7Qj7a+sy8on3bjc
 1DghrucOfd8vNAKqlO83j1ruN5yTHPHjLbmYbTrKrhD2Roc5nMYufQRFnEjsK9VjbJnglp+nsqm
 4
X-Gm-Gg: ASbGncu23jPhOSzP/686PaWnftsOjf+U2mA3eZGeFt3dsgJnPjb8G0vt3iSTtAAnWAl
 sFcyC+KaRQGBJrd7NoeBAc7bP6TcQQhDOBI3hZuAC2DKaZ6d6pT5VXB8LJlY6GjJGQLJrQ3XFEL
 jkidyXHMBldX8eoZpJ+M0HtamDfvFrsudylvV0wOLFfCNuYnA93YCmGdflUH5CzyMXPY5qyce28
 RPouaPxSylTwnfE6KTwVtNkJ0Vakyaqc6P5lk/CRMHBywi7TCaVU+1OBjrLaVenmShwJY6hu3OW
 fs9K8opEBLZRntgdnohu
X-Received: by 2002:a5d:6489:0:b0:38c:246f:b0b3 with SMTP id
 ffacd0b85a97d-38c52097871mr13913178f8f.51.1738428081810; 
 Sat, 01 Feb 2025 08:41:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc81d74sm127401525e9.37.2025.02.01.08.41.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Feb 2025 08:41:21 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 52/69] target/arm: Enable FEAT_AFP for '-cpu max'
Date: Sat,  1 Feb 2025 16:39:55 +0000
Message-Id: <20250201164012.1660228-53-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250201164012.1660228-1-peter.maydell@linaro.org>
References: <20250201164012.1660228-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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
X-TUID: nlFmqs0KM4ag

Now that we have completed the handling for FPCR.{AH,FIZ,NEP}, we
can enable FEAT_AFP for '-cpu max', and document that we support it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/tcg/cpu64.c        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 60176d08597..63b4cdf5fb1 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -20,6 +20,7 @@ the following architecture extensions:
 - FEAT_AA64EL3 (Support for AArch64 at EL3)
 - FEAT_AdvSIMD (Advanced SIMD Extension)
 - FEAT_AES (AESD and AESE instructions)
+- FEAT_AFP (Alternate floating-point behavior)
 - FEAT_Armv9_Crypto (Armv9 Cryptographic Extension)
 - FEAT_ASID16 (16 bit ASID)
 - FEAT_BBM at level 2 (Translation table break-before-make levels)
diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 93573ceeb1a..0bc68aac177 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1218,6 +1218,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
     t = FIELD_DP64(t, ID_AA64MMFR1, ETS, 2);      /* FEAT_ETS2 */
     t = FIELD_DP64(t, ID_AA64MMFR1, HCX, 1);      /* FEAT_HCX */
+    t = FIELD_DP64(t, ID_AA64MMFR1, AFP, 1);      /* FEAT_AFP */
     t = FIELD_DP64(t, ID_AA64MMFR1, TIDCP1, 1);   /* FEAT_TIDCP1 */
     t = FIELD_DP64(t, ID_AA64MMFR1, CMOW, 1);     /* FEAT_CMOW */
     cpu->isar.id_aa64mmfr1 = t;
-- 
2.34.1

