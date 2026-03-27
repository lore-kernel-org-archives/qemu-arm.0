Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BE410F284F
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:52:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AP5-0006Zx-VN; Fri, 27 Mar 2026 12:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOn-0006Dy-6b
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:51:06 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOh-0005Hi-Dg
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:51:02 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-82bae83318bso1125843b3a.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774630257; x=1775235057; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HIcfvrH1mrscajbqrnw45GLeLRQ46NncRATLpy0ZTNM=;
 b=g80gdofRiztd43pkN5/UomqWFBO49x/A3It8Mtjw/kdhhC23+5+Ph8cIkLo+/XN7ys
 hAyWhEoymCFjDrjipT8qok1Rj4aYOJih/el4EDPXbBLW5MHHHuYj/FgP+hErSCFzU2fu
 4x1II7zJ9TK0KlZsgnhR2eQYonDOMabHcRmyCGL4pV4ASIHYdBhXi4UofjXMPOFmgoBO
 coRHMe4g7NDVPmHs1CxCYETELbDiYu1tgRjuN68I2ueJnrsLoB5amVzXPsjs4eBQ/B2n
 PhZm45sTsSXQd5jzrNYF9UHPylhZEFvmtlw9ZJMWLSiSjLJ2kVCdyEm+i9RIwoeFFXOs
 eboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774630257; x=1775235057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HIcfvrH1mrscajbqrnw45GLeLRQ46NncRATLpy0ZTNM=;
 b=A+vE5l+L0uwHHn7ohQhELdR3bT726Z9t1JxmIgYZwhFWORV0oEbPuMiFkX0muPBSaS
 vHzoYJsDRdZZjoB0mbR0fShRNLNDDIKs5YMW960SN/iOYrU2mTbJSCvzrtBGtEqEOG/7
 +KvRnYoJ7jaacsnGaGLyK+9AbAb/mo3K73JN9awtFw/BTz5YLDzo1mKP9/9mENKcAGPm
 lOtigG+kFCrBxTaG/SofJfK05FS0xttHmA9BzGems2VNcGj1LMXJRGHNSyCGporpsf5K
 JDwX8+UUUnGfzIBATnfX/WjwnQ3TL2SXhO6lXGTOkrOs+XjAWtIiYkTIq4LZ7XPxrLfF
 qU0Q==
X-Gm-Message-State: AOJu0Yxtw4MXRu/NFdLBIWm/41RCgtYj9mH/ORgpBGnZP4UGgsOcP9Qr
 TDyZ2Y9zmQzIdLKEPn4ikF6eHRNOb14kLAu+hf9NDVR3xCDgWbOvL7Bt67965fUxxoE=
X-Gm-Gg: ATEYQzwA2SYyQOEG/EOiKTpu6XNkE4BL97Takuow+41ef7wyHP/nreKUsAt/ej+Wk/+
 UJnIa59AgJ06jxgP+uiVIPPXBCRFsEIF+PeWqk55sJQRgKoAo2c17G6Xlrpzd4qBUy0/Iz06H+N
 3gxFlsZ3ykzikcgle1CtkkG8LuW0nDpxGRhIRwq7Ak+3+qnrJsw/8DHZ0EuAqlTkf5ufDdI0NU/
 ZnNZzcIBjgLFZM+rN95iooMd7jVRtf6PIy04rqHZASbkRCEOL1aPvqIyR6X6BQeKDkvAl755van
 Z/v5Ll7uSuT9uTfzl8iF4KejufAqcXJuMr2W/z6OQaD2aTpWrBzNlBRf2PL0hS9JYg9BElt2SSO
 z1uK3VliUOEwqO6858AhoK6t8I00V3j5WOON/q4C01zwKc+JGtVhSw8JrOPk28nGdGESpVwt10I
 TUVNk658JH85I8h1b3R7s2O0/PppMp3jXLrMAZ4/j6qALthto0gYufTfufjIR1uGuZYiWZ0KN4a
 dub
X-Received: by 2002:a05:6300:210c:b0:39b:f292:d7c0 with SMTP id
 adf61e73a8af0-39c87b6aed6mr3274481637.58.1774630257499; 
 Fri, 27 Mar 2026 09:50:57 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c767399e0casm5514038a12.31.2026.03.27.09.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:50:56 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 10/12] target/arm/tcg/gengvec.c: make compilation unit
 common
Date: Fri, 27 Mar 2026 09:50:40 -0700
Message-ID: <20260327165042.604105-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/arm/tcg/meson.build b/target/arm/tcg/meson.build
index a2b944e81c4..70e6d8a96f0 100644
--- a/target/arm/tcg/meson.build
+++ b/target/arm/tcg/meson.build
@@ -25,7 +25,6 @@ arm_ss.add(when: 'TARGET_AARCH64', if_false: files('stubs32.c'))
 
 arm_ss.add(files(
   'cpu32.c',
-  'gengvec.c',
   'translate.c',
   'm_helper.c',
   'mve_helper.c',
@@ -67,6 +66,7 @@ arm_common_system_ss.add(
   'cpregs-at.c',
   'debug.c',
   'hflags.c',
+  'gengvec.c',
   'neon_helper.c',
   'op_helper.c',
   'psci.c',
@@ -81,6 +81,7 @@ arm_common_system_ss.add(
 ))
 arm_user_ss.add(files(
   'debug.c',
+  'gengvec.c',
   'hflags.c',
   'neon_helper.c',
   'op_helper.c',
-- 
2.47.3


