Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CAE10F284E
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:45:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6AJA-0006jc-OT; Fri, 27 Mar 2026 12:45:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AJ2-0006eT-9D
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:10 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AIz-0003Kk-G2
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:45:07 -0400
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2b06c43e6a7so12069285ad.2
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774629904; x=1775234704; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HIcfvrH1mrscajbqrnw45GLeLRQ46NncRATLpy0ZTNM=;
 b=HRYGGj3BQLuwVWT3MR3teMFD8qV22ZgWC01wYAjb+QV/BeDtpytWkyqHx2R2WODM7G
 lwP+PDUcJB2WTIP2Bs9Zb1bP6uIe3wDQA6TPJNVTRKW76IljtC6oXNOE8fJFPdJiK+gX
 /AYUs3MEzRsEmQ8dkjbqm2GGQH3GSniSSrIqNz9/z1QZwPNjbj8WVA7SddTNpzeI0Ax0
 VxFekxj63V9LMyJXWqjnYX3SH2+bIKwKwt0OYHx4AnWRHfyakEjNh3zXMvc4P1aQ9ymc
 F9rnwnvRNAX4aa70pnBJH2fsXP0ODn9nYevbuKgIt78JH3ktT9csg3uFC0gCpmPG+EFF
 b/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774629904; x=1775234704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=HIcfvrH1mrscajbqrnw45GLeLRQ46NncRATLpy0ZTNM=;
 b=HYTg4lXx74WsQFUKgVePHDYUiV5fQF4lUxpfWa/tNsRtBqBRB1z++HJw06cmfPDtQp
 1850Yv12ecXI9MohShmST/UDrVS17tnEVYgT0EmGiMjwzjgqg/yOFXHUZrRX8VwvIGZi
 zm+sJQyBqsoL8L2FdcRyYeZl9NQcBW8y7jEY8X0AxYlYpiR/KQqoTnTX35iCzjUdN+oj
 ZhvQVESkYKqiG7oDw0ZQuBPIRBMjn1qWHVcW+WkoIs1FJv/SeQjxcqYXqRpfYY3kGImp
 rAFqQxNv7OsJzmdDQ2lO/5lNbbEorSlJ+DAT6IOUo10fUke5sKy4GfjMuKBI5VYhPwQ0
 iNWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrsNqMpZVuCU5d6DvyV1OZF+9x/DWfIh2wlekW6LwPU0Om+3zpBoKf/tr9fFTvAvOIlW5d4rNsjQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywe3V2OnLDlVwQAowqMcxzH+vefa+Wh+Gwi/wWrpr1dbvJ1bP0T
 g62mMn9rcMh0yFq+6kbK898VaJGjSbMFZpaFAgUguswN6xyXZT4Kj97ux1iJHG9WA1Cj5JQMw3r
 kbtMdNHc=
X-Gm-Gg: ATEYQzzI0vVKNXY4PdThMDvtQ23niGTvY7tpMYphRJQvVCgxXa0ts2PaW+tglfdGMrG
 O5dcQv8bgcV/fs1zHn61hBs8C2bB7H6e1XtrZxodGIUf68NK1a3LEHmMfxwtlzPM39Awe1pcf7q
 NNr4T78Q8gwoBimrn4l7tDmj6saAEwpQTBsottUi8BProDncy9f7G0Ce5zcLZ2DZhSG9k8amy0X
 7n/WU2WXVYr0FqxHrMI+jC3jYfeXEEbDQf27OEx5DTTkicLoXmhb+1SoTAcrSNny7N4PUoZJmnb
 qekiyEL1EWe8lzKUeDqogEYLiFubcAifcg6zpY9VSWc7X3wIpo1cDhViVeXdl8vPKbd7dfWOwXQ
 pFGStLH2RcS49sLxfTKGkin1q2MCpYS1VxYzEsL1o4W10nqsSeo82S9AJMEN3nn8AmVygEp2beL
 CA8bjYPc7yfGJDnm4doantTH4AMDwNFsYklHOSBGHltPATj5Xkd2HhIXvhlG19+VtkaZ4+3d34q
 0xb
X-Received: by 2002:a17:902:cf03:b0:2b0:c451:aea8 with SMTP id
 d9443c01a7336-2b0cdc2a006mr32009385ad.14.1774629903861; 
 Fri, 27 Mar 2026 09:45:03 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b0bc882339sm63890655ad.43.2026.03.27.09.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:45:03 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, jim.macarthur@linaro.org,
 qemu-arm@nongnu.org, philmd@linaro.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 10/12] target/arm/tcg/gengvec.c: make compilation unit common
Date: Fri, 27 Mar 2026 09:44:47 -0700
Message-ID: <20260327164449.596767-11-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
References: <20260327164449.596767-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x630.google.com
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


