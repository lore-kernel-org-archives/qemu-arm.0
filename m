Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp4905454lfm;
        Tue, 25 May 2021 15:59:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbkIrwHcfHykwMmNENQ13PUq114WXMKk38ZK1+puurEu/v+71CI6Cq9yJJ5iq4K0zhEJ+u
X-Received: by 2002:a92:3f03:: with SMTP id m3mr20682233ila.34.1621983543910;
        Tue, 25 May 2021 15:59:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621983543; cv=none;
        d=google.com; s=arc-20160816;
        b=r91A6g92nnrG137bPinyaRLAkci85t6JIYjBI/8JI8066GAHMejxB4PlWQVH2gENF7
         UdLmw8cR8gAn6Gizu/Ih66ysbOzJU5idORuqNrpc1wBCNRQkSRgDR7xwAp53ooZT1MNm
         UbXxPf4Sq0hcK5Yo94d7wYxxiTvuxw1h52wSsetSiar4vQ7YqM7T12QTkqMGz3LekQcA
         9yn931BeXnrhISbzYnjkYV+z/JWxnqmvaWmdZ/madUkjU4Y7nU6bMN73XKLSgZt2oUnH
         0xZHaJxylkcYfjEzLCPxWlqwSwRCkjfJKzhdQ9FA3Wx42zMhn9FwVwrxHZdWREtPAeHq
         zBVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8bLZEVg63JaCjb9TWm4+laNRS99dgK9U+MbZ27NccEw=;
        b=fSttnlFpy1f92NVismxQw46U4fcohXVlpMlAg4p488WUOp3tIL/r//xm1Nn6oQbLlZ
         Y4nFOABHEpgIcbD5+f9uHGXtluxaL2B5PxKyhxXzbfNM5Poxp0EumhK6uAjbOoVVzd2n
         cXjms5axluHHGs3ikA5jM8fUIyf+OBervMKee9vIRakKP3K3TbKko0YxcvUgmJtfFA92
         t8Wne2V2rGvF78SgXxuDE0rAwHnDULEcVKa0NoIVhzFUeMOc9ji3tyerxit7ET++pXwy
         avVQUlmaHSlayAl21qlAA2dpJRyPNBDh6FZqLU+1s6FN39APVm23NbvSCu9E8QPXE+dt
         RAbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TRb5zPZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11si21003172ilq.20.2021.05.25.15.59.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 May 2021 15:59:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TRb5zPZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llg0t-0003Jl-8v
	for alex.bennee@linaro.org; Tue, 25 May 2021 18:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0M-0002XA-Uq
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:31 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:37674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llg0D-0004mh-9A
 for qemu-arm@nongnu.org; Tue, 25 May 2021 18:58:30 -0400
Received: by mail-pf1-x42f.google.com with SMTP id q67so7722771pfb.4
 for <qemu-arm@nongnu.org>; Tue, 25 May 2021 15:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8bLZEVg63JaCjb9TWm4+laNRS99dgK9U+MbZ27NccEw=;
 b=TRb5zPZWkDydE5beewV/dSXXZDQXwFZ3e2LtR0n9k7trovaBOMyP8QaSywK/JPXU9j
 T2uXJZOLu8XJKwheNXmL7+Aj/IN+H85BnLsA2Zl9S7hR9J6rxbzKJ3cOD43KED5opHpn
 8a+4UDrr18tPwySL79pAsePR4MAjg0INEFwR0SPen43MNjxxEHNluhcZTzLVPbEXgbx9
 xKIinkP7px5aSMen3UyN+FnG2bQOHg3yOqdkG7akHsZGLKfH03XoNuRw6CRiVX0OE7BV
 T/+wdKHo1PODD0vX/CQBT7m2/6xh5xBiTLKrIOopvoJ7KeDVnhvuo2Xzkw1wRe6Ya/NX
 hcIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8bLZEVg63JaCjb9TWm4+laNRS99dgK9U+MbZ27NccEw=;
 b=GSvOYwi9TEpf1dbzwOO9DdM5W/3/zou/gLtdj1JIN0DGB4ImL8xj7JTkO+dzmm0WYv
 pr/feYMRtnVkZDlCRPij/LeW5RKMSpDFzjpQ4uoKvlOW/y50AXIxhgDsBiXFCVMN2Qr+
 0i/pXax0c5Wvn2qUuFK/ERvtoi3qOWoD9iPnqhjg2bb6t49kWYkbGQ81RwCgriNnQ2Fz
 Ped/R0dpxSn4OF1mAqtOMSee/FsuH09KLi7WrzIG79rFJHa1H5mvTQwMrkT8rbOZoinh
 mdT2SdI/wg2GN+wFCTN2GqAB+gFSgYYsxnHJWTnMg0Vy28zMypw6cXHf3PfjdMNsT3fj
 7uOA==
X-Gm-Message-State: AOAM532D6lW+ZQJ6DNvSv97lHy/pfjxPk6CzPnWpH1MZvWWHq1JIq+co
 jKwalMjrlXOGhO1m7cXeLChpKg==
X-Received: by 2002:a62:60c2:0:b029:2cb:70a7:a8ce with SMTP id
 u185-20020a6260c20000b02902cb70a7a8cemr32545879pfb.77.1621983499252; 
 Tue, 25 May 2021 15:58:19 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id l6sm1669928pjf.28.2021.05.25.15.58.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 15:58:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/12] target/arm: Add isar_feature_{aa32, aa64,
 aa64_sve}_bf16
Date: Tue, 25 May 2021 15:58:06 -0700
Message-Id: <20210525225817.400336-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210525225817.400336-1-richard.henderson@linaro.org>
References: <20210525225817.400336-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: t/+tRrixD2ZN

Note that the SVE BFLOAT16 support does not require SVE2,
it is an independent extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 04f8be35bf..d68275b15e 100644
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
@@ -4122,6 +4127,11 @@ static inline bool isar_feature_aa64_dcpodp(const ARMISARegisters *id)
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
@@ -4266,6 +4276,11 @@ static inline bool isar_feature_aa64_sve2_bitperm(const ARMISARegisters *id)
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

