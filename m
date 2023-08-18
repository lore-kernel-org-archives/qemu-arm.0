Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp2117496ejs;
        Fri, 18 Aug 2023 14:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdx7mMhU1mWnWx5MdRdYfHNw+xzKwNgn8WRJZaSEr0kCxD0q3x1j3+GXuEKK6CPwgRhQ+d
X-Received: by 2002:a05:6358:2806:b0:139:9dda:8344 with SMTP id k6-20020a056358280600b001399dda8344mr675475rwb.19.1692395016551;
        Fri, 18 Aug 2023 14:43:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692395016; cv=none;
        d=google.com; s=arc-20160816;
        b=aHYa7anY6eWTIysruGrH3Koa5pScq7kTkdeYf8VBcI/vJv2/tQX1yOmp66gzUYUG3O
         IOEeCr7TsebuJzkGA7WySD2OegvkGM5X6doUciwLuJA3XnkZKKEy41UnC4r+FvV6ZIOt
         6PB2i3qWjiCzzQNdDaiwnMawqgptjSmLdp24SyilTnd11ZP6FPGyIuJJsd+ihNMNVB5z
         dJmHaREPd/zuBmzZeYYi7USGGs1JqJHKLsE8ozs99uVF2y4iUGBqd8Bx09dXoUZOs1Na
         qg780R/JlnyNUDcOkHODh6S3J5T6e79daEmE1WQGUm6g5gxipdW326rgZa8URuQtX8Bb
         1lhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=tf9Jzo6/6lt0bMLI+m86t2rXgiczmZf9K4SenvBJf6A=;
        fh=j4Z1An09Ve/stdydd/yoEYU5jCtTlZP/o+LZJGsiADc=;
        b=RxKKi7vC7DZn9zyn975h83F7Q/5lpcLMMf8DSIj5xt269y9eXnirYLAMc1nuxGsP9m
         iOqtNMFqo1APvMMPnc5G7EmkJSr/rBM0t8W0UIT8rwHkamEG8+H3KXUp4LZKsYcRYaLk
         ksTPPQsMOzDQ7UAYYshrrAUR1L/yZ5Fsu6yZdUxvmFrPUMgc2Bw/XJvFRNxT3nvycKz+
         +O/ok78vANEj7NhUt6KvyJgNtppg9869HnNl7Dot4hGPlFI5K9w8jBmvRwiO/oST+GMJ
         Mg+kkvjbPmj3hvGOsPohqjcl8DAXPwvoAccE8oQa9G9gcfB5sTxrC3b5QZtFs7nh6Ao7
         t47w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dPNPzo3/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020a05620a27cd00b007623a3a109csi1692094qkp.101.2023.08.18.14.43.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Aug 2023 14:43:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dPNPzo3/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qX7FZ-0007Z0-1J; Fri, 18 Aug 2023 17:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qX7FX-0007Ye-CR
 for qemu-arm@nongnu.org; Fri, 18 Aug 2023 17:43:19 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qX7FK-0004Rx-7c
 for qemu-arm@nongnu.org; Fri, 18 Aug 2023 17:43:10 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1bf3a2f4528so8907485ad.2
 for <qemu-arm@nongnu.org>; Fri, 18 Aug 2023 14:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692394976; x=1692999776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tf9Jzo6/6lt0bMLI+m86t2rXgiczmZf9K4SenvBJf6A=;
 b=dPNPzo3/sGSPgNxdHgM50skhTAd7/sFnejnLhntAUvbDsekzYZ/Al8/+ocJ6FM1otl
 Suoq0FEr+8sKYb5PAgamt85pLGayv/oIfIvTJ3wZyyPcj6sQ4KOHblW3vATl6pJm2kKk
 tH21NM/XBpzr48fadFg271HEQpHXgRK4fGHnED4wXTKXBw1ODF4WckDJ/sMHeKBu7TA3
 2D5nEf6ZZ6UtBkdPTz9rb/TfB0V2YmwgvIzitMQzB10QQs6YSZgPCuyVaZi2otWKgqLx
 wi0MxFDQgdNriuvKpJxK2XD1Hg6l3uT7cUPKBIGM2CGSNO4EeNL48OGbCAtqbNaroO+K
 NABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692394976; x=1692999776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tf9Jzo6/6lt0bMLI+m86t2rXgiczmZf9K4SenvBJf6A=;
 b=Duh2KuLOaDUtXDpkWLA/eQrdlYhX1aUXGEgswISJtt94qOEfrzMKI6S+7AlhSPjFRB
 xmiEXyUrWz6YV1ZYo3YUuLAAudxLfafhV+ySEdPrwe4CyZPCbiN48BDnT6RC6G1RrLO3
 91ZncoYLsXWt86zhnrWOE/g+J6WlwNxfNiVnCYrETl7U/Qwm5LpY/37Ull/zEImPXuRe
 n0IsFDzPzXZpP5m0SymjHgE8VwUXXkVgAaIwuJ2M6kgyq3ysN2WeuSjuG0/85l/yGPVd
 x+mB6KDH+2qIAzttztgrCOLsPqNVKWomOxpVKrxv4KucabHkMGBpptGBql05itTGjJu+
 DGEQ==
X-Gm-Message-State: AOJu0YzY3bOIIcGz9Jdh9gtvGhZdJnLxCjPPnyKXLSgUv3B3bbVTreBc
 wlkrIgW0+h4cO+0qGgSLMvveaRejTw4ATHRbKIw=
X-Received: by 2002:a17:902:ced1:b0:1b8:33d4:77f8 with SMTP id
 d17-20020a170902ced100b001b833d477f8mr550351plg.23.1692394976353; 
 Fri, 18 Aug 2023 14:42:56 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:cf24:6daf:2b9e:7972])
 by smtp.gmail.com with ESMTPSA id
 g19-20020a170902869300b001b896d0eb3dsm2209856plo.8.2023.08.18.14.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Aug 2023 14:42:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix SME ST1Q
Date: Fri, 18 Aug 2023 14:42:55 -0700
Message-Id: <20230818214255.146905-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-TUID: 4rw3YLati1NI

A typo, noted in the bug report, resulting in an
incorrect write offset.

Cc: qemu-stable@nongnu.org
Fixes: 7390e0e9ab8 ("target/arm: Implement SME LD1, ST1")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1833
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sme_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/sme_helper.c b/target/arm/tcg/sme_helper.c
index 1e67fcac30..296826ffe6 100644
--- a/target/arm/tcg/sme_helper.c
+++ b/target/arm/tcg/sme_helper.c
@@ -379,7 +379,7 @@ static inline void HNAME##_host(void *za, intptr_t off, void *host)         \
 {                                                                           \
     uint64_t *ptr = za + off;                                               \
     HOST(host, ptr[BE]);                                                    \
-    HOST(host + 1, ptr[!BE]);                                               \
+    HOST(host + 8, ptr[!BE]);                                               \
 }                                                                           \
 static inline void VNAME##_v_host(void *za, intptr_t off, void *host)       \
 {                                                                           \
-- 
2.34.1

