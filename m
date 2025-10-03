Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 243E2CCA471
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Oct 2025 17:44:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v4jH2-0001bJ-KD; Fri, 03 Oct 2025 13:08:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jH0-0001aC-5m
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:08:50 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v4jGU-0006GF-CG
 for qemu-arm@nongnu.org; Fri, 03 Oct 2025 13:08:49 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-b551350adfaso2276036a12.3
 for <qemu-arm@nongnu.org>; Fri, 03 Oct 2025 10:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759511293; x=1760116093; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pjDdAknr01k7YxkbZX1BtFHr9eMT0hUzaWlnonFMe1U=;
 b=Gu4ff+GdR57q0bvm+ZrSbKFZLDkn8W14XHb6mkvNMyLAKBgnnDtmtmooHQroaR4WG9
 cUsphHz0cbOq12jCNU3438XO2IBU+nauQ5CD+vVQN7E5xNqMYyLoaYhiNzD1EqZ5Dhlv
 SUoitsmG1VXWnANkcyER300EfQG6gbaM0pyO6Mgt6PMsriEiKhuBQkNjx0xSEBF8g31S
 eIYwhdbDyPr3WrD7A79b+Qff+GHl753+vG+G2+hdK6JBRTqVS9DCBjXwy4ASxNy5EMVw
 sr9kCv7Lqujpry0xVFEK+P1/6LKKU/b8L9j3j666vITcBQpNvXJdpfzu1k3ijNJyVDcY
 1veA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759511293; x=1760116093;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pjDdAknr01k7YxkbZX1BtFHr9eMT0hUzaWlnonFMe1U=;
 b=gNEW5ZIMzn7TscOOeEDKO9jWJUTknBm3ifR8BtWbrDdEQsevJs70ehVOaVYxTuJuVm
 kXgbl+YsUR/ZYCaxfZtR4m4JmgT6e2muLL5bTtXUboZRXHLGla9SmbpPMSRSUQjRgOSN
 JgSdkRhRdQenFsWKMRCYtR+NoczFuv5ggcZR+1y692FZKH8tGowONdec6u4uRggHy7rH
 TdeKrd8g7RehsOjrSpCCnM9dr7ubmoDpAfZAfX9hZE/jbEq68+D4j2Fag9SDgnVBkBVA
 CkbR68KlvHp8P3MTvCyAg+KsVh+20dv6RSjQvA2asQO8P1DSoXGj6++HwbpPr1W+ySXj
 RlLQ==
X-Gm-Message-State: AOJu0YzD2+QSTw5HlXbHefvo7xtMbfK67S5+bb8W45dLtkp4HseN5gLA
 HW7ZGr47m8D5QO1fDrMR1KkcjgfloCFjozo0CEo5Stx0DW8ejgMXP4oSpbxidSr8+OQ=
X-Gm-Gg: ASbGncufr651ryxySTMjfQUVraJzjLTtrTmhQJNqgqhmkp/Kr7+EJ6r7y7e7hwBgIRO
 e5r7UoVtFRUhIZ0qr9tGyy4oeDwOKYLn5RfvHwGPI3p6Bp6nBGwFj5TSy4mqjCo47pBsc105A5P
 3hl9VFFVMMDJ8ytWfBf+ky65lmMDy9kZ50p3nryUg8lCLUAhpSjtCjUIMheukCEQPMTvVSQw1f5
 EP47i6j2AcDLq1SZBBUxKd1QkxZfIfJ+fiSjevFPExqz7WEEfyhmgRJKbmhezz/IgSWeXLhFc5S
 ihMUuWCeeL1sgt1tZB53Oi2DWAW7mKI5LpmvLpln6gBl4oAJxOPlYHUgYhLdBZz2/B74LelkVfA
 b1lVz3Cy+k/WRI+S1kMSZ8cIqGUq1LH+O++p/PGguIscz7RO4kR7wcaQr
X-Google-Smtp-Source: AGHT+IGKXwgtMDLS5kT7nVwrbhWP9lenr3DICGBR/qIAz/T1BY5P8QQaP+TT0r6zZfyTLb+vMcGWmw==
X-Received: by 2002:a17:903:3c24:b0:263:b8f:77dd with SMTP id
 d9443c01a7336-28e9a6b1caemr44484245ad.57.1759511293426; 
 Fri, 03 Oct 2025 10:08:13 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-28e8d110d86sm55327115ad.6.2025.10.03.10.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 10:08:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 13/73] target/arm: Enable FEAT_S1PIE and FEAT_S2PIE on -cpu
 max
Date: Fri,  3 Oct 2025 10:07:00 -0700
Message-ID: <20251003170800.997167-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251003170800.997167-1-richard.henderson@linaro.org>
References: <20251003170800.997167-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c        | 2 ++
 docs/system/arm/emulation.rst | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index abef6a246e..76193826ce 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1253,6 +1253,8 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64MMFR3, TCRX, 1);       /* FEAT_TCR2 */
     t = FIELD_DP64(t, ID_AA64MMFR3, SCTLRX, 1);     /* FEAT_SCTLR2 */
     t = FIELD_DP64(t, ID_AA64MMFR3, SPEC_FPACC, 1); /* FEAT_FPACC_SPEC */
+    t = FIELD_DP64(t, ID_AA64MMFR3, S1PIE, 1);    /* FEAT_S1PIE */
+    t = FIELD_DP64(t, ID_AA64MMFR3, S2PIE, 1);    /* FEAT_S2PIE */
     SET_IDREG(isar, ID_AA64MMFR3, t);
 
     t = GET_IDREG(isar, ID_AA64ZFR0);
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 6b04c96c8c..94a6192fa9 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -122,6 +122,8 @@ the following architecture extensions:
 - FEAT_RME (Realm Management Extension) (NB: support status in QEMU is experimental)
 - FEAT_RNG (Random number generator)
 - FEAT_RPRES (Increased precision of FRECPE and FRSQRTE)
+- FEAT_S1PIE (Stage 1 permission indirections)
+- FEAT_S2PIE (Stage 2 permission indirections)
 - FEAT_S2FWB (Stage 2 forced Write-Back)
 - FEAT_SB (Speculation Barrier)
 - FEAT_SCTLR2 (Extension to SCTLR_ELx)
-- 
2.43.0


