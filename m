Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDFE10F2853
	for <qemu-arm@archiver.kernel.org>; Fri, 27 Mar 2026 16:53:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6APY-00078Q-TB; Fri, 27 Mar 2026 12:51:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOn-0006G4-Qb
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:51:06 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1w6AOj-0005I5-6u
 for qemu-arm@nongnu.org; Fri, 27 Mar 2026 12:51:04 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-35a09e0dd63so2212772a91.3
 for <qemu-arm@nongnu.org>; Fri, 27 Mar 2026 09:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774630258; x=1775235058; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/IALcLXX/d7LO0liU9vJMgW15Lrt2XEwGveOJyMimkI=;
 b=RlW6k7oypgtKNlqHDdo52kAjRFL6rIPtXqz2oM/040X/Fr7Du3P8njREX1XIIIMO+n
 FC/KEHNdtG/0OZUuSFjut+kV/NrtTkDRa6cuiR/vju2kT+2PHjTzi7EB3Hl9xBWnVxr8
 gsr1hkQVXija+V8XFwDPvjZVBkErSOZlpxwKoTY/Yvz0NrcU5amh5PV6+EJK4+P/an0Y
 yE24P+mGnU216UczUHBpPw//KgKdpUb3/ct18l8L6qi98gyag6KVNQLqmVNRoazngHge
 YFGIz88pciqRsWC0EDjkXT0bbcLbE7woqomUPPAWU+iV+Z8jRkgBvCUwEU3CWhb/L4GE
 ynkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774630258; x=1775235058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/IALcLXX/d7LO0liU9vJMgW15Lrt2XEwGveOJyMimkI=;
 b=nS7eDrbCipKChNAEv5HyCl9bnMAS6qs6/4PmaFOaC3+XM+m2Sf8Eo05wUkiKxL4f7C
 pCdBJiOIzo3rPHINDQnHrpnzBVBmbaZvZtwkhngypyTzrsxee4XaWKwpodccp8MgUfo1
 opX3ngQUOxximj3ikHdlDYti8r8NY8d+9A9rbUZmNHApoSPjzlBBfzn7cB0itjm0Pp0/
 qtvuIqHAflBjmu28Z50pTexSOhWTXOJGu8Y/VaCh6/EWIt5mxKgMQ5tGwOr1YxKXW/OD
 /9lNADWHPVZNsCm1B4ulFDbGddjvUsBT+Z9F9bXfMpGZRX5cfqvKPUHKO67ofISJViRp
 z8Rg==
X-Gm-Message-State: AOJu0Yz0D/qS2dXMWe8Si2p4TQf4YWc54XrtqcdW+e6HjxuttxbuNiAc
 wss4qjdn5WQv6PQJtbnidYNsx9/j0cxCGOQJ60zRe71O9cNMDx0itNZaKpL/tW5FSu0=
X-Gm-Gg: ATEYQzxq6+pdTmvyfLfgaik/ii01EYA7u6hRcORiAmYvuEpPF0+nbyZ3gw/rhzETxr3
 lRbxfDcvCYqB0JM8DKmCEnorakkaMlSYt+SPhCo+T5tblQ2RX3LWCeL3ygZt/lBOi5sRqKKQkdZ
 6H4udg9G5SFpRPjpp1ge3PAFvJ6j1YyJadDZkl0aRc/Pj/PjyqTWIFO4Y6YrYYpisqaXqpG9V+l
 Q3/nnpoYAaKqqoRkn2/XySVj6H6z66Q4giXDBij/YQKrrbhvuD7NOgorWOXjphK/PH1EeDTMUiJ
 J5MezHEDAB+LbKEUkGs7MwuH8ev3h3lO0vhCv0TLIjRobwj/sbkmLPaZZS5bLBZvE5KZDeiAANl
 sg7XDSlMB596n+yINKJUe+AMnz8UJHtHdu5VkdiM1slEq+J4m5KsXDL5er2aRCboRLeXN7LbHyl
 elx3t2ewvnATJKp7RtBNfwQ1rV3iQAvP0DJOIIlLZrMoqDMm52CizrNRtl3VyqZTtj0X1i9wtwR
 NFt
X-Received: by 2002:a17:90b:510e:b0:35b:92c1:8a39 with SMTP id
 98e67ed59e1d1-35c2ffd0f07mr3389470a91.8.1774630258277; 
 Fri, 27 Mar 2026 09:50:58 -0700 (PDT)
Received: from pc.taild8403c.ts.net (216-71-219-44.dyn.novuscom.net.
 [216.71.219.44]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c767399e0casm5514038a12.31.2026.03.27.09.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2026 09:50:57 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, jim.macarthur@linaro.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-stable@nongnu.org
Subject: [PATCH v5 11/12] target/arm/tcg/translate.c: remove MO_TE usage
Date: Fri, 27 Mar 2026 09:50:41 -0700
Message-ID: <20260327165042.604105-12-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1036.google.com
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

dc->be_data is already set just above in the same function:
```
    dc->be_data = EX_TBFLAG_ANY(tb_flags, BE_DATA) ? MO_BE : MO_LE;
```

Cc: qemu-stable@nongnu.org
Fixes: a729a46b05a ("target/arm: Add wrapper macros for accessing tbflags")
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 target/arm/tcg/translate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 56ef1e0eb59..4546bbeeeff 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -6344,7 +6344,6 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
 
     if (arm_feature(env, ARM_FEATURE_M)) {
         dc->vfp_enabled = 1;
-        dc->be_data = MO_TE;
         dc->v7m_handler_mode = EX_TBFLAG_M32(tb_flags, HANDLER);
         dc->v8m_secure = EX_TBFLAG_M32(tb_flags, SECURE);
         dc->v8m_stackcheck = EX_TBFLAG_M32(tb_flags, STACKCHECK);
-- 
2.47.3


