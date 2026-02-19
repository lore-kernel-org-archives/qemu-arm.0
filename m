Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D2FE9A04C
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 04:03:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsvFQ-00005J-Uv; Wed, 18 Feb 2026 23:02:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvFA-0008Q3-2H
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:24 -0500
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vsvF8-0001GP-3k
 for qemu-arm@nongnu.org; Wed, 18 Feb 2026 23:02:23 -0500
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-2a79ded11a2so2819645ad.3
 for <qemu-arm@nongnu.org>; Wed, 18 Feb 2026 20:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771473741; x=1772078541; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P+C4usfFJxntIkaYUwqttNHLWY0mMsZx1f8GtcALX8k=;
 b=GxTnLFwjBB3f4g7D5kvDDilPjfhJXtgJoOW46N/O5LqVJiNOUX/mUqXJEcaJXZ3/tx
 mFaxCGiA+gMx2n3FSngIMx3qROL3cYNNQ+pap5j2op0fiegGGnd+Lhex2Gj2y5o8VVQS
 dJL7fAdH60dxvDW45A0Ea/5fyGguyIV0GxsLxrCsL49z+yo6ONqGe8N2Q1rPWMnsHz5z
 dxWOl93L1BFJ+ZHWwmNJ80yssrxTYwg41ReMTnPCgsraMd7GpYMjQTFosctGkVSdKb/2
 X+seJVEDVHbDZVKUHBbe9mWZYS7CcA0n2Dw/CMjiT74ApK0Tv8Np9u/NVDLdUdzy2lg2
 T0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771473741; x=1772078541;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=P+C4usfFJxntIkaYUwqttNHLWY0mMsZx1f8GtcALX8k=;
 b=OS9dGmhOtCiWSxNvfplpHJ6U5xT46W4WaO0TvyLSnE76I0reoOad4/dhzWf5Osc3i6
 Xw3S2OExJ6OhtNbgLSQZ27+Kp6uIoLCjDSZc6woI/ACrLkuDZ7+jrTCiTA4hVRP92YRb
 9Fseh8Q36Q7li+8mwO7xkR/oPt4B+9FNHEfihabPmimeeAk9Ud0lSuTpkzplxL368Ko0
 bj87oa7qy3NAnWNaqmG9WUYenWAeclmvrSYLUHbm7cpennC5gA593vgLb5VfAl3tqCjy
 pr3ZZViQcdkxb6dr4rwJVLvZ23jjVxZX/nu0yxXWYvqgZ4nJc2+j9xHmpxTi55NS9bog
 LO4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx9iuZwTfmjx8JZLYxpbzQDy4zBrNfL/oZRofT6KVqc0RWnf2XV/RPHqscWprckHbnHdygg33jOA==@nongnu.org
X-Gm-Message-State: AOJu0YzfXu3uzl/qsmk3UHfb6vxY1j+WN4SHUH4PtRi138BQMMYyK0GQ
 ZO6yVoj5v9RSs+jgn7nlDeQLZi9g8Wb87ifn43qtBwiVG5IW3EWKGnxail4IEQkatSI=
X-Gm-Gg: AZuq6aKqVJ97qF0GlE20f6gqLXXdDVkc5zUe2nnn/qSgCkaLOyLKsNPMpLFWn+UuAnJ
 9fZ/RyKID9LKRwmUUUvL3C0S6rPGLVWtoX8kiRQI0OWKX4dxadFHm/efh2BKHkYilT9bcnRYVPE
 zhhexQybwQkPTL6kQVLBci/KCWtkCj5fii4Bxse8YMxEvv97B8u6YZKHD4KhZUfmjoJaRor5axU
 oX/OUrLwYBAPj/aAsezMuK+uPD+YMFD5iHZuLe9E4LHqaX0UjbHaNTDYX3Gu9mHdopGhQSVatlQ
 OCmfhunPw+P24Yjnk5etV2psgvdStlBGcsRIBNvksCnEDZIMHKzmEhigEMCH8fJU78F46bnApnz
 oamn4Ht7MD6kh7w6Y+e59AjGMuMPQOA/GcY0N/0J0bzNrwpv3Ezo912Y2MqQa76cySSlzPea4/s
 rq8p4nzoeGnlZDW+OU7st4US1377VpxKgidbagJvmNvVBJtZjrqf/REjU+GJiWxyE7iy+Rw7OfE
 Oua
X-Received: by 2002:a17:902:f687:b0:295:99f0:6c66 with SMTP id
 d9443c01a7336-2ad50f63477mr40064175ad.36.1771473740760; 
 Wed, 18 Feb 2026 20:02:20 -0800 (PST)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a73200asm147636225ad.36.2026.02.18.20.02.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 20:02:20 -0800 (PST)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, anjo@rev.ng,
 Peter Maydell <peter.maydell@linaro.org>,
 Jim MacArthur <jim.macarthur@linaro.org>
Subject: [PATCH v4 12/14] target/arm/tcg/translate.h: replace target_ulong
 with vaddr
Date: Wed, 18 Feb 2026 20:01:48 -0800
Message-ID: <20260219040150.2098396-13-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
References: <20260219040150.2098396-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62a.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/arm/tcg/translate.h b/target/arm/tcg/translate.h
index 027769271c9..2c8358dd7fa 100644
--- a/target/arm/tcg/translate.h
+++ b/target/arm/tcg/translate.h
@@ -18,7 +18,7 @@
  */
 typedef struct DisasLabel {
     TCGLabel *label;
-    target_ulong pc_save;
+    vaddr pc_save;
 } DisasLabel;
 
 /*
@@ -42,7 +42,7 @@ typedef struct DisasContext {
     DisasDelayException *delay_excp_list;
 
     /* The address of the current instruction being translated. */
-    target_ulong pc_curr;
+    vaddr pc_curr;
     /*
      * For CF_PCREL, the full value of cpu_pc is not known
      * (although the page offset is known).  For convenience, the
@@ -56,8 +56,8 @@ typedef struct DisasContext {
      * pc_save contains -1 to indicate that relative updates are no
      * longer possible.
      */
-    target_ulong pc_save;
-    target_ulong page_start;
+    vaddr pc_save;
+    vaddr page_start;
     uint32_t insn;
     /* Nonzero if this instruction has been conditionally skipped.  */
     int condjmp;
-- 
2.47.3


