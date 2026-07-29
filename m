Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86164C53200
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Jul 2026 19:17:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wp9mH-00056k-Dc; Wed, 29 Jul 2026 15:17:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wp9mG-00056R-1G
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 15:17:16 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wp9mE-0005OB-Fa
 for qemu-arm@nongnu.org; Wed, 29 Jul 2026 15:17:15 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-84862b0d5aeso1570321b3a.2
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2026 12:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785352632; x=1785957432; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=aZkBkOQjOM1X/AWeGppY99mxTnO3tZqFw3DKs+FRBlc=;
 b=J7bM+Yc1ZPHnTtOzIS9vnLT6NC33Nijbk/5jQhhVQWfMWjH0mrceYTgOHzB2SpNIzy
 4vA4MC8ZL69DbV+VWKvSd4YzNdvTsmf/2GyEGogG9ktQR/ouWlqt5vZuSmsAOextKLRS
 4+GQESyV9EziSBOlGG8qMNsz2zny6XDpOKhwcqLFAvA3iF3HgFMYfHGVHyy3e3SspynM
 LqiXaAKs+XITbx9Ek9bqSmX6b9PrZHVC/O5i72fuZZpu//w7+M0l54/5WKFxjG4sC5er
 /0RDPuHunqKdSFZqADyMN7Jtwjas3HSsoXE9rbXe2/lM8W9a1yT9HqiZqZvb7/8OR2AD
 9mvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785352632; x=1785957432;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aZkBkOQjOM1X/AWeGppY99mxTnO3tZqFw3DKs+FRBlc=;
 b=Jt8W/624O1W+oN2LyXmYJ6tZMoSMo2/fDsazBQvXmEZWiFWhlC1x2BFMUx+n4vOolZ
 yaMRrqY8yyTn2JyzKO0OGQGKSN10n8cfRRQSvi5kwoGFmjlxV77OcB2xPLD8mQdCCtwl
 mp8Ojdi/9ke12uQLSCmGCfb1Ii529Sc9G4th/2ATBcbHtH506G0cG7PN45EnflFgItgQ
 GA7yWvvfCcQRCG8nUT6t1QckRLbiyeWBg6Wpc3Y+NE0o/hB7ExfX4SiP1YZ8YqlGHed1
 AXlISYDOQK2JiaoDBXS9YfFFnBduZY+qMFFu8p2K6stdZL9LXQymk+8ZoTDPw3MQIdT4
 qmMg==
X-Gm-Message-State: AOJu0YyG907kgmEyhIP1S7TiMfeHsrgxj9kxydj9zZ2FqRhW0hnbrawW
 TpuVZnPj0UqlNmChURUocA2Un3BtRg1f61QMiEBmJ4R1l9ONH0sqoUrnp5KCMveI0gc=
X-Gm-Gg: AR+sD11sWYrz+yMlQeoXZbNPjSHn8DRzX8oa2EiBcEeuIytLa5gkM4v6/v3Pw8meE6U
 odm/MrHZ8QaAcOtFjlEfOLqU1B1GXGwP8tfh4T3RpwP2Yw53bqIQsHgXkkLNSvfJRtfiWyoZfdc
 JAv/UymyMKRuMCgDRFLg9Rx0kNABJOlWWcUXDBUBdunUrLi1g2thlWsFaBb3Q6vP0/xe4tiVrv8
 wHFWBO7ARdNRVy9wOC1MQlaAOF/hL6pIr/CHRVZ8ROaOdYMi+9/As66orLbyw7Q23Ys2WDmuzjn
 kz9d/IWkkKCZiN7L3tWH/5faClhqL7PLJVSGyUpOjfz27JsdIpX/Nlh1Gw4Cw5MUOaB8RcUpb7G
 2auN/uz++0RTIbv193MwvCl97nPF1uKTGPIaXcX5GNs0MHsKK6q6uJ8+bvpmc5agyDtlHFifSk8
 zYpuUKeRj7h2gWO7dgZgFbOMtvKDLs2osTcUg5HnFmxWJtAUpZ9qj7hOA8QS9PE2TqJwnQbRFPi
 wM4yD9EB5TyiNEWw9Ag/SXB57GhO+0=
X-Received: by 2002:a05:6a00:94e3:b0:845:bcf0:118 with SMTP id
 d2e1a72fcca58-84eba1b2e9cmr26245b3a.41.1785352632436; 
 Wed, 29 Jul 2026 12:17:12 -0700 (PDT)
Received: from stoup.. (174-21-93-59.tukw.qwest.net. [174.21.93.59])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cbdb7a99a7dsm1290390a12.5.2026.07.29.12.17.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 12:17:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, deller@gmx.de, pierrick.bouvier@oss.qualcomm.com,
 qemu-stable@nongnu.org
Subject: [PATCH for-11.1] linux-user/aarch64: Fix SHADOW_STACK_SET_TOKEN
Date: Wed, 29 Jul 2026 12:17:10 -0700
Message-ID: <20260729191711.71217-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

The token is not computed via TARGET_PAGE_SIZE, but via a fixed 12-bit field.

Cc: qemu-stable@nongnu.org
Fixes: ad1afe433fa ("linux-user/aarch64: Implement map_shadow_stack syscall")
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4106
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 740142825d..097d886b06 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6906,7 +6906,8 @@ static abi_long do_map_shadow_stack(CPUArchState *env, abi_ulong addr,
                 /* Leave an extra empty frame at top-of-stack. */
                 cap_ptr -= 8;
             }
-            cap_val = (cap_ptr & TARGET_PAGE_MASK) | 1;
+            /* Note the 12 bit field is unaffected by current page size. */
+            cap_val = deposit64(cap_ptr, 0, 12, 1);
             if (put_user_u64(cap_val, cap_ptr)) {
                 /* Allocation succeeded above. */
                 g_assert_not_reached();
-- 
2.43.0


