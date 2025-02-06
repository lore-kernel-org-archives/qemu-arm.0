Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1783946njb;
        Thu, 6 Feb 2025 12:07:45 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVKtRSbd9x6bppO+bsaF3A25ihthzJ3Ua17ULnmKWsCIID3pySr561QbLdnzJwHUJCICcq2lhbqMiT0Hg==@linaro.org
X-Google-Smtp-Source: AGHT+IHPiHQ4aBZOgfN7XGZ8HmcpxcSPGesrODin6EjGI94iHBOsyfCZH+jOg6L+vfQEE25/Io0a
X-Received: by 2002:a67:fd72:0:b0:4b5:b20d:9613 with SMTP id ada2fe7eead31-4ba7209019emr2425120137.7.1738872464900;
        Thu, 06 Feb 2025 12:07:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738872464; cv=none;
        d=google.com; s=arc-20240605;
        b=JJiKII1tn84xvIuVC4HJJJuUR7/Vdhid6+ise8Oo2dkxUJtJbtUD69aq7uxje2qtiD
         qCYtMbXkmm4XVa0R2rtqdkeQIpDuh2AriBttTzGMu451g1JLId8ICKTg1WJv0GXtocAo
         iVQWExUOUCpOwm59iQhnDD/UUEtWd87QgYiGi8N6YqXnv5TC5i5yyqr6VK5QT/XRvuYH
         K+wyxcgxJxa3rBAXQ1MBv0+YNqS66rGUYBMdf+aK9lpBTGfRYKsB43lAokPmn+UD3/PN
         FNrJc0dwDbPBLxsPah6N8UhBIuBC3OKE7TylDVZ1wOscbxFz8tz2bF8frh54d7AjWw9k
         qskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wtpn5n9qXIA6WrzyWlHtGWHkrsroVW+VYWmFEyr6GTE=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=X0kAWfRf+h2s+eFxkB2y3OoxjxwdIRCk38F6UOttcaS3AAsvNhaDvXzzve2WPQQ4nK
         49s6vHrxB6RbF6r5nlt+d9O/Q2cS89Hj32XoXwZMXz9ZwiCZi/oCpTQcS9XiLvlCLnCG
         RKDEEZFdmD2RSuc5SHaWJXuDifxG5PFGARx1WpP7OQUp6DQThAmOBsi6mgO6s6HGpJg4
         fUHZOAkEbM8sBOGS2KIFlbwaPN5QKluOdqkO6zKto+MNEl5kaeNz68JYUSRQE05b/tHu
         W8Gl/z8pyT8rYCVjRVMVXHbv2FnaLZ2L7igsDdeYa3ZZqMlfeMenW7hsh3xrRYYskPUv
         BMug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xv8OaC9O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4ba778c432dsi419412137.457.2025.02.06.12.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 12:07:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xv8OaC9O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tg85J-0001re-Kt; Thu, 06 Feb 2025 15:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg83i-0007u9-5U
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 15:01:15 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg83Y-00019q-Cx
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 15:01:05 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-2f83a8afcbbso2136936a91.1
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2025 12:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738872055; x=1739476855; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wtpn5n9qXIA6WrzyWlHtGWHkrsroVW+VYWmFEyr6GTE=;
 b=Xv8OaC9OsCQzaCqzuKV5veAcPv1jc7j9N9EYmihs9tVK6aKMGDLWvqxIKuAZDTuKt3
 DbcIw2hdJRIwPZvnYJlZmusx0KZKKp/+IgK5jjW+xtK5YxVmt4qg7POU9xH1cAVY4Z2H
 1towSjHgzGcGwIPJu1F3aKeW04+xm+xB3xMQaJpnVyV9K+72XEBLSxhV7kqH2RaplUZM
 WRH/AwJljNUk7mA1IyivjhhIPHLvbNwHbOy5z0EnWxwWj7rzbQeLvNEnG3k9PqANrbOa
 N6v0kqKpY/yyfYq3elkDFK0EmqZHloMDbp2KYjGkO44juNY5C2ryPPqaucJ6Vq4pFMhl
 Tf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738872055; x=1739476855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wtpn5n9qXIA6WrzyWlHtGWHkrsroVW+VYWmFEyr6GTE=;
 b=g6bnnvlN9m4hE1km3b6sBrqJlUdv1n+hbmX3sVjeAgnNRml6vnXUGKYdAIeUj/wO0l
 kPDA6rzQqBRxB2Cp1uu8zYgfEHG3sD2GHyPBWK9z/7HB+qT+oqNHTWEEm5Ov7MnLEYYx
 bfJrdzCvc0CBmt4ZIQe61FiyoElMzuExjyc7+93zpkV0lYUfjj548/DYOYqsWqh38bO6
 A3zE2SX+03caiSnsZkAiZVgOZSsYFn5gTWPj47XmDyJ8Eb42vuiZiGJDVVLyht5o+oIX
 VCOK+N1QGtS/3LovDIFJc3gafx0DkqEiCpujxxqRDQi/Heb0fZomRNNHqLoWvGyHntth
 3w3Q==
X-Gm-Message-State: AOJu0YzQHgkSnrHjSLlA2bxYIiLJCAknacoXl+a0H3qRRe2pprmpxs3h
 Fjk0VkHyHrMQVb8y/SyJvQPhWov9MI9Y4MZZwq8xdWUV8rbGEQvFHz6Rbkay/nICBSaxtsqt1cB
 a
X-Gm-Gg: ASbGncuX6jJp4QNsf5iiRdndbh54qT1uqyBM+nmabkVPCAoulWhqYRW9JE8A2xafje7
 UDRYBv+Ub9dRtYK7Tty8R7d2nMhf66sYe/Tva/uD+gFG2gjrqomcUfuRshN8TRU01Qk9rris76i
 P6T26zMx0ibF+gA70v8qb5Q/AvVqqLpPFvkDkoNggAFWCGJSVioOGT10bgMrgnNY3P1jmdxi1mN
 8uNYkXnNEEoLcByOaju8SXUB5WrC/gS+BqBRLspnMi7gZanPbDNKqvR1VNgFyRTTFfLvjRg+tfB
 ExlMYdYYkTeJoR3EkQkjZTSNRI2IaqYxYUkLlajl4howwzw=
X-Received: by 2002:a17:90b:1905:b0:2fa:1e56:5d82 with SMTP id
 98e67ed59e1d1-2fa2489865cmr338244a91.17.1738872055094; 
 Thu, 06 Feb 2025 12:00:55 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fa09b3ee24sm1808857a91.36.2025.02.06.12.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 12:00:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 51/61] target/arm: Introduce do_[us]sat_[bhs] macros
Date: Thu,  6 Feb 2025 11:57:05 -0800
Message-ID: <20250206195715.2150758-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: NE3SJQYNcSB5

Inputs are a wider type of indeterminate sign.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/vec_internal.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
index 205f85b8d3..ad6fef03e6 100644
--- a/target/arm/tcg/vec_internal.h
+++ b/target/arm/tcg/vec_internal.h
@@ -221,6 +221,13 @@ int16_t do_sqrdmlah_h(int16_t, int16_t, int16_t, bool, bool, uint32_t *);
 int32_t do_sqrdmlah_s(int32_t, int32_t, int32_t, bool, bool, uint32_t *);
 int64_t do_sqrdmlah_d(int64_t, int64_t, int64_t, bool, bool);
 
+#define do_ssat_b(val)  MIN(MAX(val, INT8_MIN), INT8_MAX)
+#define do_ssat_h(val)  MIN(MAX(val, INT16_MIN), INT16_MAX)
+#define do_ssat_s(val)  MIN(MAX(val, INT32_MIN), INT32_MAX)
+#define do_usat_b(val)  MIN(MAX(val, 0), UINT8_MAX)
+#define do_usat_h(val)  MIN(MAX(val, 0), UINT16_MAX)
+#define do_usat_s(val)  MIN(MAX(val, 0), UINT32_MAX)
+
 /**
  * bfdotadd:
  * @sum: addend
-- 
2.43.0

