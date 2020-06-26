Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp47607lfm;
        Thu, 25 Jun 2020 20:32:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpCU2Ag2jVZ7kJiinX47I5hphzqkL64lEq8ednI6vJVdpZhkgvcb1jQtb4TDzNsXRCTrOh
X-Received: by 2002:a25:e8b:: with SMTP id 133mr1731061ybo.102.1593142323753;
        Thu, 25 Jun 2020 20:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593142323; cv=none;
        d=google.com; s=arc-20160816;
        b=pHCWSgvuVRVyyqWnL6ICu+eqGWYnTv9qii0P4YpnnzgbNa2dRRErzLxgLo8HzNk9gj
         2hNN1KWXAr5bqIts/4tbg62+X5Mmjacz0MCY6IEYT1Cfi+Kx+YlLFkndTi7I5nJTxKDo
         kfXm0Vhj/b65vvBVMkwC1pW3LKl4yqT16SNQha6GSsveYLtxXFS7knyOEuAkZB3kMAVX
         h/4B/kkdxiX+odHHZYwpMHPPcJf9lGniCbCXhUCbfj0EkhOK25yVfUUDqibw3x5GkJ2Z
         DarAjmEDQiaVd7zc0Yqh1kinz50nkSM8u48gkDdAwHF7kVRbLNi0v2lYSlooiQjOt9T7
         jCzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Wq85XPdwWHXx5G5Rb/Fdn/pZNR+DRC8JYM81MVGPwCQ=;
        b=b147QizSchB3BMPjNQsVhDOzSTWcViOzrVWeupBSohuHvrHDCuo+H1+W2k1j96LiI+
         dJptBRTWJt6w1x+vesU7npxzOG5ziUnKLuiyIEHj18XHNbar1dquA+WIISVP11iz+IOw
         KgFzEGxSXHorRNxcVa0qWGgaoBjCS2Xlj4ApD7D3frEhANCzP2BP68bOuPB7zwn3fVLC
         c65VW4PM3Z5UXOuq4VF41NLZS0PvUMzz4hROezS3AhNspfGv/Pw5db06yJQB4t0WP/Av
         YeeLsjJHU/EqSWRVIzyyTwcPVQkYXATH/9hrXKFklVXMQAg2rGwhxEZwG9AXcH/csKaA
         8Gdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GY1hZqsZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14si24893181ybi.103.2020.06.25.20.32.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:32:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=GY1hZqsZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jof5u-0007gp-W4
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5j-0007ff-BM
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:31:51 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:35372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof5h-0001gl-3x
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:31:51 -0400
Received: by mail-pf1-x436.google.com with SMTP id h185so4065098pfg.2
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wq85XPdwWHXx5G5Rb/Fdn/pZNR+DRC8JYM81MVGPwCQ=;
 b=GY1hZqsZ2Uhq6t5lk+3tsRrGIU09JoB+OlWnLtzuphtZuv57jzvyclJFz7R1QiJ54D
 G3hWszSHfLONCC0+nPFMWelAlh7ibX1U9m2yTZh5KFSSa3AxjxOy9v690IPBe+bl3dPZ
 pylSdNsejgEg2Yj7k1zA94E+YJXxhm7C7uHyCVikNEaxaCxYLIlvHc51ZUJ5mlShH1on
 b0EV81n8siF7Z1ICRwHnHRUVleXAi8uUaPgwl4wYsr3lGUX6+J3XE19TL42LFFUQw68Q
 XX8uhs1RFqJJ8Sn9hAfbao6iozgZBCj1IHziSlxuwAo8ro2pcv7u5K4GUM9XUBREKYab
 H3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wq85XPdwWHXx5G5Rb/Fdn/pZNR+DRC8JYM81MVGPwCQ=;
 b=JCgacFWsIy/oojGD3ao5Lo40snHPzw73JxBkfXBkbtl1uE3CaXbkJaaHfVSvL7Z8mp
 t88+monqGP/qVUk/gZcLbZWjebrRk+Bbsu5UwWd6gHWO5+PajE3x8/by2tvXi/3hPVUK
 XShNqYEmgIeE/kkMa4G1n2+sG8M1BN6kPfRrELOHAr1QcEjXUYkePqrCjNab2eLQ7aWS
 Go2GgvM+DQp7DIGgZK+m7cx/CJrJ5J5Hlr9rR+XMMNKf3qhojWCgA5nW/L7m5VZHROyX
 IHctZFv+1jm/oUKV894yYjq6Mv7MykWu7CIbVASorQDiFQiXZTJvVLJiKlokx64qLdHp
 rjFQ==
X-Gm-Message-State: AOAM530dms9YCx2rubxhjLKrWUumukFQuoYzzqyodyL4AdN9gafXNKvz
 WqWjpc5xFlgaE+NO0FSRHNRXwg==
X-Received: by 2002:a63:7c56:: with SMTP id l22mr898001pgn.127.1593142307849; 
 Thu, 25 Jun 2020 20:31:47 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:31:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 01/46] target/arm: Add isar tests for mte
Date: Thu, 25 Jun 2020 20:30:59 -0700
Message-Id: <20200626033144.790098-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sISy6PDVSyT8

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cf66b8c7fb..ff70115801 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3814,6 +3814,16 @@ static inline bool isar_feature_aa64_bti(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, BT) != 0;
 }
 
+static inline bool isar_feature_aa64_mte_insn_reg(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) != 0;
+}
+
+static inline bool isar_feature_aa64_mte(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) >= 2;
+}
+
 static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
-- 
2.25.1

