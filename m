Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp821916lfr;
        Fri, 16 Apr 2021 16:59:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygaHXlNX7hQzR1J4bkrcOLgSHdB1FdWttgLNefl0uhNh1O7+kEu/+y1LXC9r9CQHf/cnRL
X-Received: by 2002:a5d:9959:: with SMTP id v25mr5587991ios.85.1618617589778;
        Fri, 16 Apr 2021 16:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618617589; cv=none;
        d=google.com; s=arc-20160816;
        b=mcLM7Hc/OF01qVcmn+cDQFn0XgMAZTRrikPgBsUuwo6bjHi11vEqSM/CNNM2yIIqtz
         lPD4vzHARS7TdpkdZQyGxz3GXyk/LJrCJi5cq33VMNg4WWkfN/OX4QFr4JvDRbxpfLVb
         v1Ajie3orInl3sdMSCxSCAW0baZfLZ8ja4lN6rx6YfD9eFm6nEgrGCZyY8+noR2Dn7f3
         F5QVD1mLHRDTQWMAHxplr52eIHHm0VLqjG+RqTOcWtlMyEmeLrQrgXDbcVRFBLdqiwFK
         U8QwEs+uvUEP4KGZcJUNJSG78gjOZHVlptR9/fT6bvyWLVFrCgstCyqNGMsEtEJUwS3S
         WLdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=unKgkmmxr7goKYi3rp8VTPEkn4g0CMVgXa5W1kzSLnA=;
        b=FH9cM7DGnhhBDlGDsCsnCvo/nWVDJqFoOVOq4Q2gVs3RTyoiKry98J4ahMgjwDUAAs
         zngrYN9VYjBzfgr4jF4vGrk6i6QyV8JAi5w6y/xwNktC6fRomU+PaIWPtj6PgmkfU8ce
         9d6qQP82wKDgntVptKUk5PKFFVaAuQfWLUr3WuIL8zyYXqNyP0tvYwHvY1PVZoVJiMSH
         0cs+c9UJ9q/437E6KUFF8xJDIspeid5jCOiQQmJeodB2HBJ5/esM02+mmKPbmjQ+EKtn
         u8iz0hj71M+VMjUqCOBfEEddJ4m2UJDP6zkNT475DYRiIqqnuYOMqLaBcf2g052Fi1rU
         ZUug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eZCVj1PJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19si6968481jam.40.2021.04.16.16.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 16:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eZCVj1PJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXYNJ-0005FH-4L
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 19:59:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN6-0005AO-9z
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 19:59:36 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXYN2-0005aO-Lb
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 19:59:35 -0400
Received: by mail-pg1-x52e.google.com with SMTP id d10so20216938pgf.12
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 16:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=unKgkmmxr7goKYi3rp8VTPEkn4g0CMVgXa5W1kzSLnA=;
 b=eZCVj1PJtk+yFRxOos4AGGE+rvC4ryIdjJ36PaCx2bNm81V7TG7fYy5jB1zVRBVM3L
 fJKiKpfripfA+BsGUzSAMCij1t3sPJnbK2VkwgEVwycFyUdl0j7ouHfAoUK4ISbbKWDC
 uJE94Nrq6hvdvFwqsRVb5TYVKNMjWHN0HTa15iUtmsyLfbFrWhTIIrOUZc5UtiTM1T1I
 TEDkqmyiqjKM8RD9aZI2QsTPWS8wHohfth6M+f5AE+BQjnYrmRCxtMwHSp12jzN5f5a5
 s/XJa9ZhhfprvMVOIWwn3vKzKJj+iCIS22FNNuLbppCpJ3/4tvJHuaDYpxVXmYrMdHWZ
 gazw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=unKgkmmxr7goKYi3rp8VTPEkn4g0CMVgXa5W1kzSLnA=;
 b=mdh/f+RDAv9/WWm0+Hi93MrzKqyh3RpAc/+TYa1H2BHhchdkjnKFBVmcpGs1GmhH6w
 na4SkObT1GDNR0IBBDaLZwsaTv24qOdd2dkyDbUKxS3KD0uDCf2k1cNr7GVAtTWHFAJL
 TKwhL7RPl+TUWaFwk1U6rkVoDVG3JnBMaTxtPSuSI1qpWqipu2lAMxtGxWlw+owy9eIy
 E3MUfAYpcm21RhzGzDBIVHEGxx9eCUaozatYhfCtB4r77h05lffoQhXYbOwEoQ6mTE8u
 ivfG9GLQulpyU+1dUkigaJSvC+ABFXTpGlkyZIKqgSNXDievFH1WHQMvs+9oETs1NeRg
 HJfA==
X-Gm-Message-State: AOAM531K5WJnkLcE50Uw2sEHBrZN+9bXAXwSdlT3B6XOdJcTs+PILBad
 UqGNn85Kyr3v9i26vMlqdZA6BQ==
X-Received: by 2002:a63:70e:: with SMTP id 14mr1297073pgh.202.1618617571468;
 Fri, 16 Apr 2021 16:59:31 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d71sm560853pfd.83.2021.04.16.16.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 16:59:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 01/11] target/arm: Add isar_feature_{aa32, aa64,
 aa64_sve}_bf16
Date: Fri, 16 Apr 2021 16:59:18 -0700
Message-Id: <20210416235928.1631788-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416235928.1631788-1-richard.henderson@linaro.org>
References: <20210416235928.1631788-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h+7fjQ2mxebh

Note that the SVE BFLOAT16 support does not require SVE2,
it is an independent extension.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 134dc65e34..38db20c721 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3783,6 +3783,11 @@ static inline bool isar_feature_aa32_predinv(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar6, ID_ISAR6, SPECRES) != 0;
 }
 
+static inline bool isar_feature_aa32_bf16(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_isar6, ID_ISAR6, BF16) != 0;
+}
+
 static inline bool isar_feature_aa32_i8mm(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_isar6, ID_ISAR6, I8MM) != 0;
@@ -4112,6 +4117,11 @@ static inline bool isar_feature_aa64_dcpodp(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, DPB) >= 2;
 }
 
+static inline bool isar_feature_aa64_bf16(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, BF16) != 0;
+}
+
 static inline bool isar_feature_aa64_fp_simd(const ARMISARegisters *id)
 {
     /* We always set the AdvSIMD and FP fields identically.  */
@@ -4256,6 +4266,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BITPERM) != 0;
 }
 
+static inline bool isar_feature_aa64_sve_bf16(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, BFLOAT16) != 0;
+}
+
 static inline bool isar_feature_aa64_sve2_sha3(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SHA3) != 0;
-- 
2.25.1

