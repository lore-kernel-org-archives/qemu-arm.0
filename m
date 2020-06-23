Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4340932lfm;
        Tue, 23 Jun 2020 12:37:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzREzsbwuaf4tUISIHPc3nP4kAL1MeqP5mVkNpdbJSB41BTIXhLiDtjeEYDnRJOminHMiBB
X-Received: by 2002:a05:6902:1005:: with SMTP id w5mr42004464ybt.173.1592941038780;
        Tue, 23 Jun 2020 12:37:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592941038; cv=none;
        d=google.com; s=arc-20160816;
        b=xTUJXafhxaPrBBPe1ynhphNrGJyUXzqRRE0/QHWvNIJtVv3WtHfYRwZu7VtuBbvoB+
         OdPLi2Q3xyDWNa+JDbGeCIkjH149CCdw7VLkSfQcW39F8DhYJxtEGy42hmHJX8tRF5Nm
         MrGAZi16jm9xYduDPO6yKpZ2K4Z6xwn3o9SBqiYDpkDVzqvtqyXJgoN3+sqVA3mc7XtY
         3EyEFFBTDSdKgsY/71Hptt96LzO35ybssMumH/C+vtAy7LoWjv7PmR7EYrSP53oNhe6e
         XFG+F97uxlSkoOL9o95yNPNTJP3MzPMSo2X3WOfnbmkTOaSio8jsjf2NKqr5PPt2lJtB
         aR1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=udQrbI6Tw9/vGRMuSJ3l4nv9mjeaNNPNMMavnVln8O8=;
        b=H/D+Na63Gfe8/S+EdkgIl83L+sf+oH0n43Ql/2IRb+otY999SoDasB1swgf/qnWzUI
         vX+3Djc4nJaM1I6AtdJ9kjdL7O83BvHsxXEuFW1iCvRaYLKQckAtLsDggNGWCP1igm9d
         d3dncQ+ab6QkYWpAsp5rz6/l6KXrz7Zw39NU/TE85I2XrMAZQV7GV3nnMNJGkeq3qsJJ
         7RxCDnUsEkfONVuj4GXDUxZ9cS1vrPli1jncHfRQIkIRXautzlqXLxbuvcOeKyhe8MUs
         oxHPGA6zbDDhDNPlQwL3TE2QyTxADH2DEdJmK+/bAqGOQ5gQ663kHloNoq9rQlnZrRHh
         +stQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="T5RXR/aV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 144si16445729ybc.71.2020.06.23.12.37.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 12:37:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="T5RXR/aV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnojO-0003Be-34
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 15:37:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnojB-00039j-HY
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:05 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:44344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jnoj9-0005Ud-NZ
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 15:37:05 -0400
Received: by mail-pg1-x52c.google.com with SMTP id r18so4681pgk.11
 for <qemu-arm@nongnu.org>; Tue, 23 Jun 2020 12:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=udQrbI6Tw9/vGRMuSJ3l4nv9mjeaNNPNMMavnVln8O8=;
 b=T5RXR/aVcos3lQjNNAEVCLAyslHCr55JEJnwUyAkeoGbWo1k9Ww8KHGc/z2NTLQCCS
 P4rM4H1uQkyW80vkEUDC58/ksQuNbGVIkaYMZ0fqtOSzyEAk0IYYsUxAMpkMzNTxv+4W
 BamdiJxUO9bNAo22YJkfQDjT+eK1wfb6gOFQZD+pDl3ly8ZhxEG7vBARBoo5kx8UjjmK
 8sU+I0+2V51YiodztY5iIng98/tHMeav+EBo9tcfkDw6oMEbMvmZlRebem286tMAVz61
 GnBWsN5o+knHpnmRjFJ9C/6HmPZCr3s+rxLLV4K7bSArlC0HqIx31HeYBZ99Xnk6P9Bt
 p4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=udQrbI6Tw9/vGRMuSJ3l4nv9mjeaNNPNMMavnVln8O8=;
 b=C/VeP6ik26IyiTuJ6VNr/LfzjvyYLWzgYTkxsBytTXOsK7KSGu3nMEKlgOGovStv78
 BbUOTin/ajt7xhvFFtWfTEWklFCxd9Wq5b/yw/I77HsVAngHv/GWEb/x1BLFsCo+e4Ps
 ZDVYcKkbatjtnrBlzEH7VkU2v44HMbZeyx/3gIXuP6AYxaBOsb6Q/rl89AyGhOFF3rVU
 dgay5CsJnm5sRJ1lsO6zCl3tmkKzdmzSJq1kTllPvVk3bz8OKLo3HIixFEauN1m4CWiM
 RJvY/5CL0efHziseKcu0s3S38MSE1HNchomTMRaRCw0YuH1+L01vsQmLm7m7W0NWlrKs
 QbcQ==
X-Gm-Message-State: AOAM5319+j9+6SEwQSRsF2Xit+z/EsY+ZBbS/cDZYz7P4qQaH+zCnxYM
 QGHXD64E9vI0WmKQOB1zKx83Nw==
X-Received: by 2002:a63:e707:: with SMTP id b7mr19120038pgi.35.1592941022227; 
 Tue, 23 Jun 2020 12:37:02 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id p12sm17927642pfq.69.2020.06.23.12.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jun 2020 12:37:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 01/45] target/arm: Add isar tests for mte
Date: Tue, 23 Jun 2020 12:36:14 -0700
Message-Id: <20200623193658.623279-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623193658.623279-1-richard.henderson@linaro.org>
References: <20200623193658.623279-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
X-TUID: VlGpVS5Yx3Ho

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 677584e5da..f8ac11e73b 100644
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

