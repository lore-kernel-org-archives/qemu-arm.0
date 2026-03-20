Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032341098783
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:08:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3ZYg-00036E-W6; Fri, 20 Mar 2026 09:06:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYY-0002wR-CF
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:26 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYU-000647-Ge
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:25 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-668e8df29b5so720304a12.2
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774011981; x=1774616781; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yHKpdEI4cGFEScBIdDOoiuJbpmPrPZGyT97rrFJXrBk=;
 b=Nydrcj3LYrVhled/UHzgOyjn8zSXy141g5wpKd3zQN5gCXhQXrRCFD2HJ7UiUttDwq
 RceajZiB7asSKLmNRt3S1YJt1dpjvGlvjdiM9iDwyl43lleHqrIkx0EggJKHAS1p1CJI
 3W5VA1gsl+EmnBJYMgsrbRptXX7HLjaofOqjhRr6ShDkA4E97fK8v0i37oxKoSNZsOjA
 yhSdYFyUWlsZ0RfWuDjmQcFp8NIlji63knJTfnw7CnsAeAuB9Da7SmzVfYGA+KtyImui
 zNOqGHgsUYFrObBrh6IikjDfwG9BsuHkxLYtW0rNCgtcAKpf4o8alYnjOrAMPbV1CtrY
 2IPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774011981; x=1774616781;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=yHKpdEI4cGFEScBIdDOoiuJbpmPrPZGyT97rrFJXrBk=;
 b=NIiGOkS0QiPF6qOL5MHEg8hiCyeoKzCOvvL6fXBg5y0gWLmPsGQlOvZ5eKENkUVXWN
 3y+Fdy3Ujn9XLkcEmAfXSSa85LYMjt0XplL3ZUm6F9VPHudaDt+Rz7Ci1gsyZbpy0ce9
 DwKw2qBGwDfh4np6fDNEJUZCDHMBn8M7e8w/I5+KBBBzQuI6G3IRCj4luh0Qyz1u0Cib
 C3e3cx0cQSai7dLZu6MDuvQFHmDB0o5ysmPofDbw848eKEf5j3tygTQj9sjYM34VzFYo
 yqcJhxoPLrh9YpfKGNTLEbZpg/jbxIhp4YlFN1k/xM2w8OTsEYD7hiI0mjqE61GV+0LV
 njcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2MBkpENp6HadsXjvcZZFrx77kfAuaUTEC+LEjbC5P3o9nWs0L3aZF3gbQY9sxgaLzBiHZ6bRCLQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywas2/kEYr6IK3RoWDtKaaTMfuKaE4Wixvq+E3og59ykEJllVlO
 CSey0w4gdToHWo6lWMjUSNbc2U5n8WDxTn9KehVnVupB4CORyJ6cbj28lYitgH4ikvE=
X-Gm-Gg: ATEYQzwrEPpjlvDKpiqY+j4rl5TC3ZI43sZqwpBjxxsKHqN7adX/JB/gFHSvhubef5N
 ByzY/6BFVqk0E59rKW3SLNyDXY7UxJa/I5f5etlxzHSSOZPxjkT5f0veW2kay6SNhw4sYPt/oht
 J8QxOnfO9/qO0QbMSHMnh/LHV7pLawtZveaIDP1lw2ySCA21+d7m9bMMm7BlyQOTEoewKbmAyQl
 52it15rw//wijIDrt9oSLxTsuTtpXyulGd0CkACJU1tToXLPqifH5P91izkDVEQunHl/80uHAwA
 MvVpBr1waoBzJ6d5fhkj6CVOwb3q9PL3GITSQ2nKAhe5MuAlURB7YqjuX8enoKaQmjdZezlK/Wa
 agmbULL8WJscJVmAZpE6UIIqgkwvWMtI9Rn1iwcfI/SBqbVrACNlMAFdLOsNi5j7yMhzsRth8IR
 lLtKTEnGxZWkOMqfMHGu+rKiAy13e8qejiWQ==
X-Received: by 2002:a05:6402:44da:b0:661:7ba8:a47c with SMTP id
 4fb4d7f45d1cf-668c991c4ffmr1571729a12.23.1774011980527; 
 Fri, 20 Mar 2026 06:06:20 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-668cf4f8874sm1316852a12.5.2026.03.20.06.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:06:16 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 752FB5F94C;
 Fri, 20 Mar 2026 13:06:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 11/35] target/arm: migrate debug syndromes to
 registerfields
Date: Fri, 20 Mar 2026 13:05:42 +0000
Message-ID: <20260320130607.2071996-12-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x533.google.com
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

Migrate syn_swstep, syn_watchpoint and syn_breakpoint to the
registerfields API.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 54 ++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index db92a8020e3..3bd98a30367 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -595,22 +595,64 @@ static inline uint32_t syn_data_abort_vncr(int ea, int wnr, int fsc)
     return res;
 }
 
+/*
+ * ISS encoding for an exception from a Software Step exception.
+ */
+FIELD(SOFTSTEP_ISS, IFSC, 0, 6)
+FIELD(SOFTSTEP_ISS, EX, 6, 1)
+FIELD(SOFTSTEP_ISS, ISV, 24, 1)
+
 static inline uint32_t syn_swstep(int same_el, int isv, int ex)
 {
-    return (EC_SOFTWARESTEP << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | ARM_EL_IL | (isv << 24) | (ex << 6) | 0x22;
+    uint32_t res = syn_set_ec(0, EC_SOFTWARESTEP + same_el);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, SOFTSTEP_ISS, ISV, isv);
+    res = FIELD_DP32(res, SOFTSTEP_ISS, EX, ex);
+    res = FIELD_DP32(res, SOFTSTEP_ISS, IFSC, 0x22);
+
+    return res;
 }
 
+/*
+ * ISS encoding for an exception from a Watchpoint exception
+ */
+FIELD(WATCHPOINT_ISS, DFSC, 0, 6)
+FIELD(WATCHPOINT_ISS, WNR, 6, 1)
+FIELD(WATCHPOINT_ISS, CM, 8, 1)
+FIELD(WATCHPOINT_ISS, FnV, 10, 1)
+FIELD(WATCHPOINT_ISS, VNCR, 13, 1) /* FEAT_NV2 */
+FIELD(WATCHPOINT_ISS, FnP, 15, 1)
+FIELD(WATCHPOINT_ISS, WPF, 16, 1)
+/* bellow mandatory from FEAT_Debugv8p9 */
+FIELD(WATCHPOINT_ISS, WPTV, 17, 1) /* FEAT_Debugv8p2 - WPT valid */
+FIELD(WATCHPOINT_ISS, WPT, 18, 6) /* FEAT_Debugv8p2 - missing WP number */
+
 static inline uint32_t syn_watchpoint(int same_el, int cm, int wnr)
 {
-    return (EC_WATCHPOINT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | ARM_EL_IL | (cm << 8) | (wnr << 6) | 0x22;
+    uint32_t res = syn_set_ec(0, EC_WATCHPOINT + same_el);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, WATCHPOINT_ISS, CM, cm);
+    res = FIELD_DP32(res, WATCHPOINT_ISS, WNR, wnr);
+    res = FIELD_DP32(res, WATCHPOINT_ISS, DFSC, 0x22);
+
+    return res;
 }
 
+/*
+ * ISS encoding for an exception from a Breakpoint or a Vector Catch
+ * debug exception.
+ */
+FIELD(BREAKPOINT_ISS, IFSC, 0, 6)
+
 static inline uint32_t syn_breakpoint(int same_el)
 {
-    return (EC_BREAKPOINT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-        | ARM_EL_IL | 0x22;
+    uint32_t res = syn_set_ec(0, EC_BREAKPOINT + same_el);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, BREAKPOINT_ISS, IFSC, 0x22);
+
+    return res;
 }
 
 static inline uint32_t syn_wfx(int cv, int cond, int ti, bool is_16bit)
-- 
2.47.3


