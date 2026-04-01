Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10712107639C
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Apr 2026 19:22:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8185-0006fl-Ku; Wed, 01 Apr 2026 15:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w8182-0006aH-KE
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:26 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w8180-00032e-VT
 for qemu-arm@nongnu.org; Wed, 01 Apr 2026 15:21:26 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 98e67ed59e1d1-35d971fb6f1so64290a91.0
 for <qemu-arm@nongnu.org>; Wed, 01 Apr 2026 12:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775071281; x=1775676081; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XqnRyG6zdU1ZH/l3FmD/wb66PtVxMf73YZ7rro8DuT0=;
 b=tEXDcgxuStCKb6kC+fHGwSVcEni8lTq8pjezx52iX7o6JhcVnv+lzeHzUZT876HOVc
 2eaz0cNBEUlib2fSqGotkFM2fqt9rxq27Di9IA63aN027dUZEJFHWcSPowVopJlBeKbV
 PeK9Dw6PpytlUmzxO6bbaDIf2gcE5HfuLrIpt1HjmNxXJHtOj4k2szXILG2fWKUrbD58
 djjEgGrKuNtrlgwZBKrosiBhnWoDurtgboZGoq6XreCpUZLNo4opnO24LjEF+KxwSKbW
 e7qSdOtiq4fHOjz4Q1qsmmq1ObRmHxeMt4Pm2UX1nt7T4SFJNbTZQjGoXSrpAa4uzQYW
 drsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775071281; x=1775676081;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XqnRyG6zdU1ZH/l3FmD/wb66PtVxMf73YZ7rro8DuT0=;
 b=QYju27cKlPYnqgqDZa0chUdnLKxoDCOB1lik2U22NuDf0DDmUEVtyWVteDxyQ6O4i4
 T+uPDqGieh9izi9BKMPzrnPnCIZ7ZsSMLrILH5SgBMaUFmG/DH/y8JdrU1pPG8H/4OXL
 mYLSh5xUH+GhOVBik148FTymu2bUB686hKxrRQ74hqXhNht1TwpFPTGeBhaLN63oi+BU
 K1rODOFbzH9Mjse6CJ8Wf1lnPsfVFeUZ2ZaDiSyFqlEBH4Y6O+d6XSWjsPJYHp4AdC3x
 nsHfkiOTo5XDucCta6u7I9dz5aXbC3u6R6Q64gaZ33D2j8DUnmFdNAaRW9NsSeFO8oVg
 m3xQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8TeWriyNtdFUjqAyH/BVMrMNQXARkNdIfHg+KgIIf7fGYxOqKoMv82lgvsozoTcD2qHCNLr16YQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw+ndPI7Y8DP7qjuN23cqWTZgUKEudvK++XDm40Xp6Ip/DTxAPq
 6Wgyg7J4QiIdtTzJ6hOFvo+sS1um62jQu8iCm8sDywSCsWfgbQVrOeerWY+aHo2yfLA=
X-Gm-Gg: ATEYQzz8pa2sqqklpUqBRP04pmJxuwJakogE8U+FHVkg7caqBXB9c976iiGleBGV7jv
 LZUiFKmbfp/lwPpgXjf2G3dzbrozxg6xDFwECdxwsYtsieO+rR0r+YRVctNSg2F3ey9b8tDXn5s
 qVQ2BxHIbtJSw+D2qVdmEBg7or43h9s4hlg6hvzpp3vbrtMa6pc282BhwdQJeN0OT/cDDVZAO1a
 3i8x3UW/0ge3J2F5PbX++DAUYeoTjOskdYC1m/2ct8wQL9j2NKpjnBx5cC4qLKfFDk50F9pKKID
 LN5onqCpuCX6jul8PohZvOvPAmax4ljPbJnGZMOo5sOs9DU/U1LFIIB4jlp2q956of2ZOCA8Od4
 ZoRWWhNLcS/GBFuB/vSTwiH1AV1bMdupt7KS3gtCDEmtngIS1ctcMT8Y3I6VhuodCDrzoHfXgrS
 FqYM0ZqwvOIEVvMuGCuH8f+Dstrpoo+Kr/hKPHecK9l2plCzlWEEgVNwcTVZW0/KWubIk9xom21
 ipp
X-Received: by 2002:a17:90b:2ec4:b0:34c:904a:d92 with SMTP id
 98e67ed59e1d1-35dc6fdd803mr4462580a91.26.1775071281103; 
 Wed, 01 Apr 2026 12:21:21 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe41b11fsm5633113a91.0.2026.04.01.12.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2026 12:21:20 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 jim.macarthur@linaro.org, Richard Henderson <richard.henderson@linaro.org>,
 philmd@linaro.org, Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 10/12] target/arm/tcg/gengvec.c: make compilation unit
 common
Date: Wed,  1 Apr 2026 12:20:55 -0700
Message-ID: <20260401192057.1182724-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
References: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102b.google.com
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

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index 1fa26670587..0740de92c1a 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -33,7 +33,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_false: files('stubs32.c'))
 
 arm_ss.add(files(
   'cpu32.c',
-  'gengvec.c',
   'translate.c',
   'm_helper.c',
   'mve_helper.c',
@@ -72,6 +71,7 @@ arm_common_system_ss.add(
   'cpregs-at.c',
   'debug.c',
   'hflags.c',
+  'gengvec.c',
   'neon_helper.c',
   'op_helper.c',
   'psci.c',
@@ -91,6 +91,7 @@ arm_user_ss.add(
   vfp_d,
   files(
   'debug.c',
+  'gengvec.c',
   'hflags.c',
   'neon_helper.c',
   'op_helper.c',
-- 
2.47.3


