Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1278622lfk;
        Sun, 17 Apr 2022 11:24:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0nc/TzfrFVMr+oIAAGyW3h4QbWuMEuebSMPfLKXOeTQIGdV0G3bCsPT3nOkKcRgSEcldu
X-Received: by 2002:a05:622a:138a:b0:2e1:ea16:4fd9 with SMTP id o10-20020a05622a138a00b002e1ea164fd9mr5171791qtk.527.1650219897189;
        Sun, 17 Apr 2022 11:24:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650219897; cv=none;
        d=google.com; s=arc-20160816;
        b=C7lUQ+KPwcQbXgXRMWaXq4/TB/QG2x95gaM+uMluw8ct/nBgpWIGznbS0Sr3w/FdtF
         +KW1L2gdhvstM2DACH/wN3NDcb3UDA9YdOsaNs427d4ypSf97zog48LpFXSHZfxoXoyP
         Fb0PokA1xs8ZVjoSzKSn3VKd3lYFgCofz0hM43GemGWdrd+Cl8COOGq9G7mRcI4LjOzw
         PdsSAsec/rBDpZCN1csbdOoZHFwaAiG0PU3gCcHnfscBWvbxocsNZ8qzZUaO+lX0Nct/
         wSC74Lr6ky0hH1gkZSMD2TYcSs/8eYZ5x9q1I1/ut/IozNm0Z+83GohuKkCBV2iq9Hy/
         oGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=QrZ4LAIma7K6buALjtxKDFsEKoasy1WK64ZnNEpjen0=;
        b=EZnmbJtwBI/M9E5tjXzQgIv0nik9SlyM2JuwWlgW0Zkne7Yq84AC1VO3nfJ5gzXRs3
         b1iOfUk18KkbrHyOfF0lPoRy0CURKqdiAoq6Vmnzg5QP0dsBsaEYi1d1gM62YJmaqowe
         Hb5KVWb4ZuyG1zEnhfAY+tLWlPnJbOEF+7xfbWKwQS11yuzrtlUEQPltPKXnizKR2NVn
         4QpsDMDmr3g/vb9kMwUU2qxcp0Zg3fOozoEwWJxzEYn0XqxIU0G5gulycSIed02sbv/E
         nf6/hgiBog8/5CrwCVm4RMQ4YOknLlTUDiPWu6j2edRZwdR2xGCBQsPMHI93pFcsDFe7
         n/Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dh+0OvM+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t64-20020ae9df43000000b0069a14412e91si2309311qkf.217.2022.04.17.11.24.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 11:24:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dh+0OvM+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng9Zw-0006ou-MB
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 14:24:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90Q-0004X6-T1
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:14 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:37522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng90P-00043b-0l
 for qemu-devel@nongnu.org; Sun, 17 Apr 2022 13:48:14 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 mm4-20020a17090b358400b001cb93d8b137so15541256pjb.2
 for <qemu-devel@nongnu.org>; Sun, 17 Apr 2022 10:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QrZ4LAIma7K6buALjtxKDFsEKoasy1WK64ZnNEpjen0=;
 b=dh+0OvM+1fhLJ5bLIEGS34EBfRXobJqfZ4g+YfjBUCBNpnDWxyhwJusLJ4uQoofIXP
 huKVukvqdIuC3uTFs3MfQq6GrGEkEPA3CI7QuSTVjE7D3ZE5yomy1UoO4iooxmXalve2
 SIkHTviXYlJzQsGxF2fYheHU7Zrw6eaa+GGRgNeEj4t6pX1+7dNlmv43nPFLcyMl7eGk
 Vi0gv2mNUd8trkS3EvvIcjgNvrPYK7voooZzRq/tkseFkSseOJfR9ap5OregW3rP334X
 NnrrEd+IQnc4PFKPTyvP/SPvX/NFeShcrSRclFPGKt8PWWvME00nu93SCgzwQjAowfHs
 s8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QrZ4LAIma7K6buALjtxKDFsEKoasy1WK64ZnNEpjen0=;
 b=7KSgOudYzNy0KiatftXkVtRPAODA75+gF9kJ+CEUua8Z7pOCu/ElfQvJCxdsYpt7F/
 ay+6Dp9KE2K/8qzx87PZ8Fhq5Qj5QCf2H+9nggyiP0SbzAnIJv9l3NtGOyG6Rzs0cApM
 b7J/Up/e+gRa+VrnbhmLzzqA4YDQySB2DnHJ+RI9H4p/rGnt3gLCepupH8Wa3Co4gOQe
 QfmMN82PyPOd4Wc6XtXF+y4f5x0jNsVC/rs+TdeEJ+/Z7kOzAw3pldT1YgEmft+NJ+sK
 4qQ837wnm3eJvbMGoQKKAT6J+S9KfUzFYAFe2LK/wec8ZemAt9jym1b3/jciKlItuyIM
 UsMA==
X-Gm-Message-State: AOAM530cortTe1D+nIHnK/3sK+LDBp37ODdNcdS1+4HLAk/8WvEF/qFO
 +u+yGJC6fArBIhHgcyIuVeFcfF02nxxvzA==
X-Received: by 2002:a17:90b:255:b0:1cf:39e7:a7aa with SMTP id
 fz21-20020a17090b025500b001cf39e7a7aamr9111100pjb.137.1650217691657; 
 Sun, 17 Apr 2022 10:48:11 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020aa78c4e000000b00506475da4cesm9372055pfd.49.2022.04.17.10.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:48:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 48/60] target/arm: Add isar_feature_{aa64,any}_ras
Date: Sun, 17 Apr 2022 10:44:14 -0700
Message-Id: <20220417174426.711829-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 97wrVMckXYV/

Add the aa64 predicate for detecting RAS support from id registers.
We already have the aa32 version from the M-profile work.
Add the 'any' predicate for testing both aa64 and aa32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 20bf70545e..d71edfc1c1 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3885,6 +3885,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
 }
 
+static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
+}
+
 static inline bool isar_feature_aa64_sve(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, SVE) != 0;
@@ -4107,6 +4112,11 @@ static inline bool isar_feature_any_debugv8p2(const ARMISARegisters *id)
     return isar_feature_aa64_debugv8p2(id) || isar_feature_aa32_debugv8p2(id);
 }
 
+static inline bool isar_feature_any_ras(const ARMISARegisters *id)
+{
+    return isar_feature_aa64_ras(id) || isar_feature_aa32_ras(id);
+}
+
 /*
  * Forward to the above feature tests given an ARMCPU pointer.
  */
-- 
2.25.1

