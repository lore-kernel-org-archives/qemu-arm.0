Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp289360ejb;
        Fri, 9 Jun 2023 03:48:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5OJ+VsOiOpg1qZV7xHE058ohPktZv/YJilzRY5B7Z69PBcRqKfBIyvnqeOQvm4/feXAgII
X-Received: by 2002:a05:620a:4608:b0:75b:23a0:e7ce with SMTP id br8-20020a05620a460800b0075b23a0e7cemr916896qkb.47.1686307717560;
        Fri, 09 Jun 2023 03:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686307717; cv=none;
        d=google.com; s=arc-20160816;
        b=SXx25LAJrFY0LfBCSyWtUbSz1iv1IT9F9cunZC5K4+zEtBXpsTj7v4+sFpn9ZWy1O6
         KsECyLfjspZXDQFzrgW3ILEX+XtkImq3Jtx6ES/as2JUv4frllQsAdnPu3auJG13XrtC
         JDWwuAEoGytmShL5uJTAHuKDyFvLRT770AyOiqxqpFuEcYHa9VU9xL0S+Gv8GkCdCQeM
         vWM7qKTG3LGS8Qh2cHE+/kDjiQYaI8iR1QwrdV78Vp2WPVe2DYDU/ITTRKULOu9GTH8+
         TC968YKV4ZaNLZPZdV3WYBf/O//QVW/75nnp2zqMYsp28DMsfmObn9qlDTH6bePPD8sg
         Ek6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=uQVMFnSnRrSFcc+z/a3bT1hs0FZjoEq6vgTJcq2cEQg=;
        b=mbgxIg8FAbCk477sEV+CuzMaS/AK+SfqQZzuoWdsBMDGXRosMf5VcrWTUeNrVaYFKp
         TCOkEdkrF+ezfq/kCW+mfgmbeOfQKcmOqRtfA6dP4mcaBcJkjSusPcZFY6NtP3Vcp/MO
         HmSZw7ofw7iAKp0KFB+yTuBRYtrg6dMps2CtakpNJ7PMjQpSA08FyZFD/reRVfw+vXFa
         8hnQbLlW7/I3Rq/7KuB7/ymqWoEbfRN/bLY5YC82EbNDwrdvkT1D0Nfi0IbhCIPCODro
         Y0WsZpgA7X1jT/JjMWQ6N18nHOwBJifeMcBo1MI4/yN37cLDU0mUWnzRtNShdkMVcHVs
         yPvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MHdemmay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20-20020a05620a13d400b0075ebf7d8942si1843574qkl.640.2023.06.09.03.48.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Jun 2023 03:48:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MHdemmay;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7ZfT-00029d-EC; Fri, 09 Jun 2023 06:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7ZfN-00022P-6f
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:48:26 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q7ZfJ-0001UH-LB
 for qemu-arm@nongnu.org; Fri, 09 Jun 2023 06:48:23 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f4b384c09fso1961864e87.3
 for <qemu-arm@nongnu.org>; Fri, 09 Jun 2023 03:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686307699; x=1688899699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uQVMFnSnRrSFcc+z/a3bT1hs0FZjoEq6vgTJcq2cEQg=;
 b=MHdemmayQ5ziEGP+L/Ai1iXPHkVN9FcLp3CfiSA11dr3mJciVZFNDMnzGD2tv00fT9
 vXeQwMGXRX0lPZZNYsA7V8Ag60NeR3dA2bOpwzMTKsjozaxiPyoHpoiwmgoIj5mLAvwd
 lrknnV8fw2bgv/6iP3D67oIZB1dz0P8nEGB8+3RblAOw4mhLhAWqlkWMBOfDMSvoD/cU
 RtM0StqH9dqmxF4aGQKCSqP8p28JpVkNK65zBhXK60ZQfcXrNnIE/VKXSJkx3oXfj3iQ
 cnsk4rEBdHrpIKJBvLBgLoZ/acc5TuHe8CHW2Zhu4hBNvafQjNAuqUZgchoSqYkG7RDx
 GRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686307699; x=1688899699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uQVMFnSnRrSFcc+z/a3bT1hs0FZjoEq6vgTJcq2cEQg=;
 b=aYjFhQ9KKoNK+VCSr5TOyHXJiVReT88KU7jSaE2fZsduSoDH0CcgL9wCdvwXj9o8cg
 ALwurUXF+qxiHCFKRSpjgem5oXa2QwDgrly3MBOBL3cFFgFh8A1MkWhaFpA+YIpnf3j0
 zR/tTPVTeBxGF6Tm9SaCT5QWtQ4fcJTsjGzjszZD/TWRHLvRELjgdsGkTpWnvNVTHcMo
 BrgrAimsaoILBOnqE9H2T0xTx7+BgQGO4c11VX7hnY8oOkIofYR3h9/0qp87IjnG3VKl
 UxR9FazbgtPsz4WPr+t2yd/EAIHzlpfZPE0qCl2xFM3c3os0Fhn3XIhyv66smDTUZXTm
 R3HQ==
X-Gm-Message-State: AC+VfDwIqz/KaIcAJsO0omdkP+Qtnkgfr5iu3lLpuHNQKJirZuu1ZlVm
 rhTRx9kiIk3NRTaezll6y1aIcWmzO+Bmh2U9y7vjJA==
X-Received: by 2002:a19:674d:0:b0:4f6:43cc:5857 with SMTP id
 e13-20020a19674d000000b004f643cc5857mr643148lfj.19.1686307699785; 
 Fri, 09 Jun 2023 03:48:19 -0700 (PDT)
Received: from localhost.localdomain (23.171.88.92.rev.sfr.net. [92.88.171.23])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a05600c204700b003f7a562ff31sm2325064wmg.6.2023.06.09.03.48.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 09 Jun 2023 03:48:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 09/22] target/arm/tcg: Reduce 'helper-iwmmxt.h.inc' inclusion
Date: Fri,  9 Jun 2023 12:47:04 +0200
Message-Id: <20230609104717.95555-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230609104717.95555-1-philmd@linaro.org>
References: <20230609104717.95555-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xSKaS42akKDD

Instead of including helper-iwmmxt.h.inc via helper.h which
is included by all TCG files, restrict it to the few files
that require it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/helper.h               | 1 -
 target/arm/tcg/iwmmxt_helper.c    | 6 +++++-
 target/arm/tcg/translate-iwmmxt.c | 6 ++++++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index c4a321c0ea..dd12fee107 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -949,5 +949,4 @@ DEF_HELPER_FLAGS_5(gvec_uclamp_d, TCG_CALL_NO_RWG,
 #include "tcg/helper-sme.h.inc"
 #endif
 
-#include "tcg/helper-iwmmxt.h.inc"
 #include "tcg/helper-mve.h.inc"
diff --git a/target/arm/tcg/iwmmxt_helper.c b/target/arm/tcg/iwmmxt_helper.c
index 610b1b2103..fa84b5f672 100644
--- a/target/arm/tcg/iwmmxt_helper.c
+++ b/target/arm/tcg/iwmmxt_helper.c
@@ -22,7 +22,11 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
-#include "exec/helper-proto.h"
+
+#define HELPER_H "tcg/helper-iwmmxt.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#undef  HELPER_H
 
 /* iwMMXt macros extracted from GNU gdb.  */
 
diff --git a/target/arm/tcg/translate-iwmmxt.c b/target/arm/tcg/translate-iwmmxt.c
index a054064c98..d241f64835 100644
--- a/target/arm/tcg/translate-iwmmxt.c
+++ b/target/arm/tcg/translate-iwmmxt.c
@@ -21,6 +21,12 @@
 #include "translate.h"
 #include "translate-a32.h"
 
+#define HELPER_H "tcg/helper-iwmmxt.h.inc"
+#include "exec/helper-proto.h.inc"
+#include "exec/helper-gen.h.inc"
+#include "exec/helper-info.c.inc"
+#undef  HELPER_H
+
 #define ARM_CP_RW_BIT   (1 << 20)
 
 static inline void iwmmxt_load_reg(TCGv_i64 var, int reg)
-- 
2.38.1

