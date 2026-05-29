Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB49BCD5BD2
	for <qemu-arm@archiver.kernel.org>; Fri, 29 May 2026 08:31:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSsbK-0001OW-L2; Fri, 29 May 2026 04:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSsbJ-0001Nz-7k
 for qemu-arm@nongnu.org; Fri, 29 May 2026 04:29:53 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wSsbH-0005QE-Lj
 for qemu-arm@nongnu.org; Fri, 29 May 2026 04:29:52 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45ebafde87cso4698405f8f.3
 for <qemu-arm@nongnu.org>; Fri, 29 May 2026 01:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780043390; x=1780648190; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+G/zHWkR0QCdbSyAQf68yG2AhF714TiDMy1VuhRq9nA=;
 b=pSU0+LeD1KrtzdaI1GfPkbeeQMdTwV/897hnmjKybkQVzSCRsjC53WViVOb0yyLW04
 FI/TWMlBxMO4/+CsSIJMZMi200vy0WkwQbIJRTUy5ZjO5f6dLay9dOnE6PxkSb6kYR5l
 g0QKBGyvpI4YTATVbvzCQ4t4xyhgIg+FXWTZkqIkZJzpyR45pmKK4yhCI08wM3R9mbrx
 Zy/C928KKt+pfXVtSggkkZqUlTWBeNdJFpqu9Wd/rwTDptCCrzZiqhAvx55faDl+hido
 52n8XlYSuvxNOqE8CumhZCXXheNODmwnrhYFslN8Dx/AYTaMbdhWfeMMorrGdOHv7ww5
 985Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780043390; x=1780648190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+G/zHWkR0QCdbSyAQf68yG2AhF714TiDMy1VuhRq9nA=;
 b=jA1h+o7Z4RUmo1Dsv34Yy8O80PVrjSwlPdPangmX2L1O3MdZsyDjC49/SI9bIw/nqN
 N5G3IlfS5RrDnF+mVaaS28h+UgtU+WzHDZext/P+xw8nO4SesKxh6YwdCN10XdFpkE3B
 zwa+VCbYxPM08VmtSeYfoKTFACv6mcWjeAp5E2z+NzSAvqCXTlkr0F6bZ+avJNJ/xkJH
 6gzmf0nWpwkUw2ZK7+3UjmUttVIwe8utJsY0xbVWmXOYkIm4lRuoyMwZrDfK8duM5dqA
 wNuPNCAHzWgxa2zue0n49pNQUiSToAh/oi9uikuI+5OzwLa8lcBFxIYAQnS767BsDfhQ
 U0Lg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Co9ndvUURW8mgYpxZbC5xaqAaPuaJc0QdQKWXSDmHm/kY5vWCYBmwsvBf/rOTjqkhWIJMWkyKcg==@nongnu.org
X-Gm-Message-State: AOJu0YxMppxRrZfyZ2Hen7OQHUKRZt2RS4aHWZRZpgBSjDOCfseXhsnR
 i9+zwJ53+GIQi5XVQ8udeQ2X3p6mlMUdQV27ISCunc82y4uAdJHLDMlIYzJujWwfzuw=
X-Gm-Gg: Acq92OEOXyN53DozJ4TYEO9J0uhrof/65a6cdvDR80COy5tyHUg/OLnuv9Q2JWCpG63
 Aw38pj37sl6t4lJQa6Sy4mk1dgwcqhdrBWWdV4Il9wq3w89S6lE/pqeTeH0I+VHqD3sUtY1O7SF
 pynb3ed3idCQl1P6+UGI7nfXqPzWAnpiSink7YnlUODxwVavu8UstPLnJBBSV7JiiGA9HY/3EPf
 ZsSfEeItaR5e/U4Qqf+wdmbsmGgN2muey2MuxUnrmqdGQDys5V8nhV8akB1D/aDwGJsCOOfcVUk
 CL2dL2kvVPyJ+WiYCXt4wavc3MvzgwwNYIhCCnR+/Ht5lJWKJ8lXimu7yzho/BBzPpMsymiVP36
 6JwRu6w58/X/rC4FFifrqjfwaNBGuxC9Qsck+XUuPxNdzIRRQDNRqVW+YzaMjk2rM9oCy0SYPBx
 B6TX6RyfMSyVVDlJAyqiWWmkeiBi00QZVvjK2V2zDPEUVR
X-Received: by 2002:adf:e612:0:b0:45e:edcc:f6dc with SMTP id
 ffacd0b85a97d-45ef14053e3mr2409052f8f.6.1780043389791; 
 Fri, 29 May 2026 01:29:49 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45ef34a0403sm1967087f8f.6.2026.05.29.01.29.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:29:49 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 386435FA5C;
 Fri, 29 May 2026 09:29:48 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v7 1/8] target/arm: fix WFET typo in syndrome
Date: Fri, 29 May 2026 09:29:40 +0100
Message-ID: <20260529082948.363931-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260529082948.363931-1-alex.bennee@linaro.org>
References: <20260529082948.363931-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

A stray x slipped in and we didn't notice! Fortunately we haven't
implemented WFET yet so nothing is affected. But we are about to so
lets fix it.

Fixes: 4575da5ecb7 (target/arm: report register in WFIT syndromes)
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v7
  - mention how we got away with it
---
 target/arm/syndrome.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 4d1f1c529e2..0eb54c15ce7 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -674,7 +674,7 @@ typedef enum {
     WFI = 0b00,
     WFE = 0b01,
     WFIT = 0b10,
-    WFET = 0xb11
+    WFET = 0b11
 } wfx_ti;
 
 static inline uint32_t syn_wfx(int cv, int cond, int rn, bool rv, wfx_ti ti, bool is_16bit)
-- 
2.47.3


