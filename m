Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FFFCAC5B0
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:37:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jKx-0006Im-5H; Fri, 03 Oct 2025 13:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jIl-0002sF-7j
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:40 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGs-0006Ja-32
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:10:37 -0400
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-b5565f0488bso1615433a12.2
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511307; x=1760116107; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ePluHC0H/NP5Mr3iGwvDk85qezCPg64S4ISl6e9Zi/A=;
 b=IEBV7ex2uwp9J+ofhnB9QbQQkXzSmYQ7aXiDCmvEpz2/RClNxzkGIfS1RM+gl/hUkK
 aZFRulz9rTFMpAhH+r2+rO8TnarYvNPVXasdMKk12x/1kGolM44gGFk5cehhnsn8IDXs
 jzXpRPYxhTTtjdi8HcaHSYDrVPE16ZOXonpW7PE0/t9D7pgREG1MgfZDv30s2NDBJbqJ
 l/tAZH6rfB39QmbmHyHEtVZKbGzauwaPdGkofajuSrADZgpi2LQlz5Xzso4MfX2JDS4Q
 SsaqJEIbdat5TtgTqPv21fiyhuFD7aMX00qiqz4Whkk/WBut+UuWip9xHgHx4pbt/ajn
 9tKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511307; x=1760116107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ePluHC0H/NP5Mr3iGwvDk85qezCPg64S4ISl6e9Zi/A=;
 b=shEyBfj8+3+A9TJZkQXlh/WfpgRxjbWaa6ZgH4kkgjpXtNiM3dv9WK51Q+yU0Ts1dR
 dK0xVsr3FrrpVzRDLfFQ1TmhxWEMkPeqXLPxaRjLRCDRsrA0DKANFKg8prb2JD3FgK31
 BmLISE0VnsaoPY5u8EU5hIUd7q9Sg3NCJZv3FKtwwUK3Oi345vn/0ocierZMSFgE9mNQ
 73cBaiZXCI/blORhjUpvmEIEt2sqZd6bTDsqv3CqIiFO4MaenVQOmZwJLqQ86LT/O9qK
 i2fdnJ5sAqCgTTSaC1ilAbXc5zyxVtdd9tcpmIU+V+onsnnEqmRpeqqW154I5+T78VtD
 6tIQ==
X-Gm-Message-State: AOJu0YxbAmnk3zvZ8foWOsXRtJIS8MzQeK2Y7u5Zko2Smq1bERLSPxkT
 XJTN/YYc97Mins3/3IcVk/R+x2Ixk/a8n7LnjcfVCnNyoPqsvU9HIyODSBo2jY8OaRo=
X-Gm-Gg: ASbGncugH72wFN6MqM0ih8HQ2ZTQSB3NX+g/RD9ALDaKtcwWmACUHLi5Xwytnfj0L9K
 xtmPgvhhvnAJDJvPB7zPPzBZ2DIRdorcj3Q2ogG07gy3IiHZ5ky58Vx7XBEj0HUxIVDv3ARMeb0
 8o4pgLsfEGYP3cxUHCO2HrFlyhyjmZDC3aSTqIJCgO62CcgUxICjFNulIJm0GYdTywslZ7HH73d
 CJ508jViFCZxBC0S86kBi8ztf+caHtHXtWjosnVlJKdj8JyAwiaw9Jv8jGVoXEuhUDtqSxYD7Vb
 JYYwrpHQxBNBmBaRQNzUWH7rzFrldQvnr7MCFfWrKOsEUkp0E/213sBDmBiFTDZyIRojK6XQutn
 OTEJ6oSEhdLqKWsuEFFMQjR8LfAm/o7fcSsy3SFm40JNLr38bQYZwGaya
X-Google-Smtp-Source: AGHT+IEFMLsMp34swcTZi4Seywg3BQN7qAjDY75WsEdsxXxhyiByIK85Yx9O+KVNBnQHljrxY/N66A==
X-Received: by 2002:a17:903:2f0e:b0:269:a75f:e9d5 with SMTP id
 d9443c01a7336-28e9a6486b0mr49029065ad.42.1759511307564; 
 Fri, 03 Oct 2025 10:08:27 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 29/73] target/arm: Support page protections for GCS mmu
 indexes
Date: Fri,  3 Oct 2025 10:07:16 -0700
Message-ID: <20251003170800.997167-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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

Take read and write from the s1perms.gcs bit computed
by the Arm pseudocode.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 16ca2b6187..bfa0aeb4c0 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1583,12 +1583,16 @@ static int get_S1prot_indirect(CPUARMState *env, S1Translate *ptw,
         }
     }
 
-    if (perm & PAGE_WXN) {
+    if (regime_is_gcs(mmu_idx)) {
+        /*
+         * Note that the one s1perms.gcs bit controls both read and write
+         * access via AccessType_GCS.  See AArch64.S1CheckPermissions.
+         */
+        perm = (perm & PAGE_GCS ? PAGE_READ | PAGE_WRITE : 0);
+    } else if (perm & PAGE_WXN) {
         perm &= ~PAGE_EXEC;
     }
 
-    /* TODO: FEAT_GCS */
-
     return perm & PAGE_RWX;
 }
 
@@ -2241,6 +2245,13 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
              */
             prot = get_S1prot_indirect(env, ptw, mmu_idx, pi, po,
                                        result->f.attrs.space, out_space);
+        } else if (regime_is_gcs(mmu_idx)) {
+            /*
+             * While one must use indirect permissions to successfully
+             * use GCS instructions, AArch64.S1DirectBasePermissions
+             * faithfully supplies s1perms.gcs = 0, Just In Case.
+             */
+            prot = 0;
         } else {
             int xn = extract64(attrs, 54, 1);
             int pxn = extract64(attrs, 53, 1);
-- 
2.43.0


