Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp144899lfp;
        Fri, 15 Jul 2022 05:33:58 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sGlA4K4ZLAMitNPKIFeJ9LvCg54m+/agpy/ZrmJSh7lY+ygq4TM1HFx0daEcTuJB3Bc0gZ
X-Received: by 2002:ac8:594b:0:b0:31e:c570:d2b5 with SMTP id 11-20020ac8594b000000b0031ec570d2b5mr12145470qtz.96.1657888438307;
        Fri, 15 Jul 2022 05:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657888438; cv=none;
        d=google.com; s=arc-20160816;
        b=i0X8Lvl9Vbu+qhmWwaC9FMU0DMdnvhN+oKunYfLAN0RhpQPE/bq7NTZECzVaNUWdhf
         Qp809/dr3tEprNq642Ood/uI3KWDi4xvsG24R4cR3/Pkk2YZ2gGYe3P3kRPYTMuXtcUC
         4ZYuDWpg2Draiq3ZcjQ+3RoFlEAXBCz5YSW28ydhws4qI0Kat+G3M6BfvXdCEFVz/vnn
         xusAQpy9+DKGKmFP76pk3U6uXDM6bbb4EcphINFoUfvN2BjD8I2N6EIPQV7T87FBRi1p
         zGSDtdRYtNuzQe6RuE2WhgBwqoVQEXGYdGSU/7Wu+9LerTqnUAVeEt2lb739P8//bP1w
         O8XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=yuRbk5CWRfM03M5yrd1oq6pfXGgzYo68VWk+Ro2YMl8=;
        b=ZWprXxuP07bsxqbpFRyiP1JIJpxLFXdZu1ZFC49CY7LbpipJfoWR5YyV0EctzZheTm
         LPlUuYyR9JWHZUlz3jTLTiyLv+ahBKYnWpXfKEwMLkIH154JVDCafNc0Xb5zy9TZGROb
         Qy76CYJOqgEPrPWp32k+TfIfN/QPfXqFoNQ20nIp1Yjmn5/VtmcIS+Smn81y2ETDFWuS
         VdQwNDRBrgcB3weA+qVoMb0JtAedazDYigDvZnQ1vNMOxBH6MNhvmiTJtRwa5o5eLFOW
         0GYHI1kwTETVql/BBliZInsAGTMZ2z0O8s6/NNC8cJIopl9w0XRc5Q06UW1XVhV7fNFq
         cS1A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r1GWN6Je;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9-20020a05621420c900b004705caf87b7si2280154qve.574.2022.07.15.05.33.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jul 2022 05:33:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r1GWN6Je;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oCKW5-00045A-Pu
	for alex.bennee@linaro.org; Fri, 15 Jul 2022 08:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCKVv-00044r-HV
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 08:33:47 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oCKVf-0002RB-GF
 for qemu-arm@nongnu.org; Fri, 15 Jul 2022 08:33:47 -0400
Received: by mail-wr1-x431.google.com with SMTP id d16so6531833wrv.10
 for <qemu-arm@nongnu.org>; Fri, 15 Jul 2022 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yuRbk5CWRfM03M5yrd1oq6pfXGgzYo68VWk+Ro2YMl8=;
 b=r1GWN6JetqLl1ugnzacjTi/aXxegnPXgNMKnmTsS6NljZp4rFkpLypWmoyyzk7z2kD
 BQlqNY3t1w5zh/fRRJiAlpbttm65j3isAWj6rrGeObXjoWAWOWaoBwOxyg/jW/PMGhw2
 nAonSCEQR5Jft5Jaq+oRjmZAdqRs3ZMoYRlTpjlWFI+8K9AGyYxGFz2z9nsDQyC4M42l
 IqF9EXc3F6lUjJOoNHY46boAHdmzTYpJOzqXaHYPiWdn4lJKPTBS/EHmW4kUUk6Sgqnx
 oNut83eg+o3Wj1gh2fvyGVop4xJAB9mzkWILHl0l5TBx+2m7IQVQZ+pDwcgEErpBfNPO
 +P+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yuRbk5CWRfM03M5yrd1oq6pfXGgzYo68VWk+Ro2YMl8=;
 b=V5g5DUmPVdfyi59CvFoZCVN1ryh+SXIieLWrNUhf2FVvHtGZfd5N23xHJwdjdOgwzp
 81jGXE/6HzaKB4oWnNUQpzjasso5bVeEe1SH7UrQoW0enlC3CcieZzUoQjACYzUrzmjZ
 JRhQv1YDmHv2mkQCtFeNj237jX9cvBBci7OvCSUPN5JZArpdj3gBieZCx9CuYc8EVygT
 Kp2PpFn6HozjfF7wRO2DZ1T0U5Faxq1sGygm9fcdg9JjZswsLMNxayxiy9RBHEAfLr1O
 pIddtQ3RYKQMqeXKv/s8XOXP5gvKsq2ivP7fE0C1c246kr97xtLhdypcZY4zGO6VQn5/
 ZJPg==
X-Gm-Message-State: AJIora/Nb8GylKmA3fmcbUOBUnLP4xIrtM48IRkkskA+eCO+d83QIsup
 oKMyTaXrWOQbqQy744P6vjAGjjvCXJKSmg==
X-Received: by 2002:a5d:598e:0:b0:21d:86b2:f35 with SMTP id
 n14-20020a5d598e000000b0021d86b20f35mr12877646wri.54.1657888409576; 
 Fri, 15 Jul 2022 05:33:29 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 m185-20020a1c26c2000000b003a302fb9df7sm4832616wmm.21.2022.07.15.05.33.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jul 2022 05:33:28 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Don't set syndrome ISS for loads and stores with
 writeback
Date: Fri, 15 Jul 2022 13:33:23 +0100
Message-Id: <20220715123323.1550983-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MFx8uXReU5hY

The architecture requires that for faults on loads and stores which
do writeback, the syndrome information does not have the ISS
instruction syndrome information (i.e. ISV is 0).  We got this wrong
for the load and store instructions covered by disas_ldst_reg_imm9().
Calculate iss_valid correctly so that if the insn is a writeback one
it is false.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1057
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Tested with RTH's test case attached to the bug report.
---
 target/arm/translate-a64.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b7b64f73584..163df8c6157 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3138,7 +3138,7 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
     bool is_store = false;
     bool is_extended = false;
     bool is_unpriv = (idx == 2);
-    bool iss_valid = !is_vector;
+    bool iss_valid;
     bool post_index;
     bool writeback;
     int memidx;
@@ -3191,6 +3191,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn,
         g_assert_not_reached();
     }
 
+    iss_valid = !is_vector && !writeback;
+
     if (rn == 31) {
         gen_check_sp_alignment(s);
     }
-- 
2.25.1

