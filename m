Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp927521njk;
        Fri, 24 Jan 2025 08:30:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXwFP9ep/kEKgYQruliQVgJ72dWJ4Cj5EoDnP+QSTsbi7FdIyfRpdFtFB5/JpFcJ/UNX23obCDwFKzbKA==@linaro.org
X-Google-Smtp-Source: AGHT+IGY/1wrqGHka1fvGPMLnVyKdJT8ZiebuUfpqrXekPSaUjioCJX1sPveOOyPCO7PdXDj7T3Z
X-Received: by 2002:a05:620a:2807:b0:7b6:6826:2032 with SMTP id af79cd13be357-7be6325182cmr5223153285a.47.1737736247235;
        Fri, 24 Jan 2025 08:30:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737736247; cv=none;
        d=google.com; s=arc-20240605;
        b=hP31ZlcIX5YyfuP2+0LrAP0EFzCqZsUnqcum0zy0+TtBBHj2IwBjxyPKbGWYwCQmv5
         yBN4vCozrvAzirm6WDe54f/gesonhEhIhUbTfH9qMioXFWZi8cLSsTcqbbtYbiGWGlaM
         onUjHeyxcBcxNzZt6FZX2NMODO7D4Kr94gGnGvNlW+C5geyIGRPUiXyUxtJB0e1DCqKp
         pHJtoYs/ZjARORZL0vf8pV6qsfxpIf04iKIVWsMnfSVfS5d1kD6IkgxLcQpgg/RnorzS
         JmzA1k329aF15wyxIzmIFpiBHlKYmvuRvhXwBq78rcQwBx4RdG19RCq9EV1xeFMjAmJF
         lPOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=bk8UKy/5UtUVN5mexJL1A3Tm3jtSo3Xn1L8OQBTpPsg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=dVt7+xsKFxiLYCzi2/Xt/r7TBn7qoTq+gCsCqGJoOqMmPbiGMC6It9iwZQ9wxjmqkP
         a8UfS1mtKlpzN6sTljSiq3YfVjLiCwjDqdwgCjhnCY17efKdsIxCV6bfCCD4LdMoeOry
         XhGnAbWJkhLH0NN+DT8s2lVP0GFqDoJdi2OWADX+K0o7SgsJmxKebQalXTHOShyoUy6J
         m5+ShwC+GUUFmK/WphgxujYKLoRyQCnCjIVDBbpY/ywtK4AghDXRxYpw9qTPLHVQu6Kp
         8aexNxH9EziweZ9AhYdX3jhy2K+NIBsLNO6I6XSL2aDvC1QO17mfCiHWSXKHll69Swzd
         wrVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1X7Ukzj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af2b817si265875185a.634.2025.01.24.08.30.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2025 08:30:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M1X7Ukzj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tbMYH-0003nZ-Hn; Fri, 24 Jan 2025 11:29:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYE-0003hC-Op
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:28:59 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tbMYB-0005O9-2x
 for qemu-arm@nongnu.org; Fri, 24 Jan 2025 11:28:57 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so25814375e9.0
 for <qemu-arm@nongnu.org>; Fri, 24 Jan 2025 08:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737736128; x=1738340928; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bk8UKy/5UtUVN5mexJL1A3Tm3jtSo3Xn1L8OQBTpPsg=;
 b=M1X7UkzjhmbvqqqHJUNt3OWJI789SnF2nCqj+jYz7tonNT9OgzONQHVibvZ/Z7dHOr
 KEFhVX1+NMRysusmCWIwIM9bR2huXtbN3HMFjpVIPzlwR31mP4symGWYlIg+S2/ErN/N
 taCaqWxvHuAFC+lgK8YARqT53n0no8MNqj+vLq5rc5sEwlgyd4AjPVLRc8zCIvF2WBjE
 ZV6hEjT2nKtv/UUH/faoQxAYA7PH/YQVSZLHluIhARJhS50hFZ/wWKT7jJKOgkNESZj2
 wPDpuovbxlWsXthiVAU3r6xdkb8Wz4W1JRyGy1fpqsEBvf8m0HgPp1P78vKuuTnmtj3/
 Ww0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737736128; x=1738340928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bk8UKy/5UtUVN5mexJL1A3Tm3jtSo3Xn1L8OQBTpPsg=;
 b=kHqaZtff5M9ue8MMAek8gJJb7tDaqsvulbLRpKH0RymnJv1gDZcGvRen0uiM0+X5gX
 /82jv/xjHRCo0LayTVc2/ACZMAX209etHFyLFNAcN2ii/C2A88XepHZmd0MgqHQbrORg
 FLZ9gCyUeAb5RWI0fcrHNEevI3/34cAStmXnHEdahhySYPRJnxpVl4ywhKqJQL4qCR1I
 t51F5hRvyLsG6SuLb6u64A6J0jtkBb8axaGr0DbOIXCBCj+xlaP/OeoQY0BZfm4kLeVD
 UKP0sp/x7fQq2bMDi2eRPw9bz1HkOMSfLxc2dRl0eChbFYk35312h64C+BYtexgQjbGr
 qoUA==
X-Gm-Message-State: AOJu0YzvAIA2okJpDvt5W+9HQ7AYf4QcL/XAddpO2lBJrXFhv9+ZL8Ci
 SQ/z1S6n9DVl543q4F602hG0vZgja1DWsaaA71T2NoI9aI2hPZpKVQ44vgxYTiJAqbnyP5W5ORr
 B
X-Gm-Gg: ASbGncsKdv6ZGdlQYZp/JjlQ2oe9OtJ+ALma/v+oB1Qpwq2al/ZW8ic8hAisvCy4oj0
 9QSfK6DtKhgI7t2RoQ+cCbwPkxjjDX+HgjuVLv8Optt2dnU1rvawEmP47nhmDrfBaPZCAAj+XQO
 6kvHu5amrfnCFgSiq0jJskarnub1LKlU2aYTitzfKNBnIwl+/pbmtOM/vKlZ7rxGdqpiNob9w9f
 9yCSK1fNAauUKrD2GFBsml8dfxCr11y/BbqZSB7u0wbzkmlMjLZbj2smpgydCW8iSIGo1eopz6/
 fzI0JLebp6w=
X-Received: by 2002:a05:600c:1da1:b0:434:a202:7a0d with SMTP id
 5b1f17b1804b1-4389141c227mr256881565e9.22.1737736128268; 
 Fri, 24 Jan 2025 08:28:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd47eecasm31683025e9.6.2025.01.24.08.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 08:28:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 08/76] target/arm: Use fp_status_a32 in vjvct helper
Date: Fri, 24 Jan 2025 16:27:28 +0000
Message-Id: <20250124162836.2332150-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124162836.2332150-1-peter.maydell@linaro.org>
References: <20250124162836.2332150-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vl2gnRDGkYpY

Use fp_status_a32 in the vjcvt helper function; this is called only
from the A32/T32 decoder and is not used inside a
set_rmode/restore_rmode sequence.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 7475f97e0ce..0671ba3a88b 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -1144,7 +1144,7 @@ uint64_t HELPER(fjcvtzs)(float64 value, float_status *status)
 
 uint32_t HELPER(vjcvt)(float64 value, CPUARMState *env)
 {
-    uint64_t pair = HELPER(fjcvtzs)(value, &env->vfp.fp_status);
+    uint64_t pair = HELPER(fjcvtzs)(value, &env->vfp.fp_status_a32);
     uint32_t result = pair;
     uint32_t z = (pair >> 32) == 0;
 
-- 
2.34.1

