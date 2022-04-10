Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp854906lfq;
        Sat, 9 Apr 2022 22:58:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUVsZfnMtw35JknNUBHXN32Gumod/0WxmeYCTLIyMluRPH3HwoXQMPsOlz/tdlPIjvHGrO
X-Received: by 2002:a05:6214:29e8:b0:444:a9f:43a6 with SMTP id jv8-20020a05621429e800b004440a9f43a6mr13155367qvb.99.1649570299071;
        Sat, 09 Apr 2022 22:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649570299; cv=none;
        d=google.com; s=arc-20160816;
        b=R0H0a5Psl3TPsbWgXzwGnPx85fgj4wXakaBCrA+K6yymHCqO7yJXef/nXyjTjfgKJk
         MEUgUYOad+WybCm4zfGg6LFn8obRonLiXUxy2yzi1x8zAv6L+Q0Suu4iGbqVp1nEsqzX
         k0M7pllFLNTwyIDkYNL7TTRO29v0PBhMRNb0KBKakKOJpJHkcuttU4bh5Atpo/+mdg14
         tEmjrWlJEPqIcP3J6Po3k9w7DFty4dRrkeioR5KUcMcOYT7Xk+Gx6ccLuR2t7Pbe6F5I
         jTnDHifdLttW2JzLbwwQ8aHDMwzM2gaaV5CsGCcqV5OmTw5pN88VQHhg7ZmSTg33PGnK
         LyNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=rLOhJvvj7gL9dKj7DvOFNAonGDNAYGQD5IOiVrmpC+4=;
        b=FvMeON9OROraw8m9msR04P5zxKOMsws8eE553QLuX4+5zRZftiD1SD4cddKGuXt8ax
         sJkwlEfBxk2ISSptqYj/71TxIQsdKhPQbCTdTMW7xvSeqerJT70gZnqd46A3hBUu2Q0/
         7dLxdCtqd/o6DrqsPRiD08H5Hc2py5pwyG/aORc1FVe3zmw9f2WFXlJWZgJBnf6RGrYs
         dOqbIkj+cYm9w6ERHwGXsrhz8HAZUfGEY/sY/ulR6J3l66cwAzZ3QN7OzQIvmb5cnzau
         eeRVYTJXBrYyOqw/8m9lctsAaTpX3PfRWeBO5QR623UhBpIEcNplCTNGSyO9L7OBp+1l
         A+Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gvf3jxfy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i15-20020ac871cf000000b002e216c47542si2534053qtp.707.2022.04.09.22.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 09 Apr 2022 22:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gvf3jxfy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ndQaY-0001yd-Iw
	for alex.bennee@linaro.org; Sun, 10 Apr 2022 01:58:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZn-0001wn-V0
 for qemu-arm@nongnu.org; Sun, 10 Apr 2022 01:57:32 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:45627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ndQZl-0002ys-9t
 for qemu-arm@nongnu.org; Sun, 10 Apr 2022 01:57:31 -0400
Received: by mail-pg1-x52e.google.com with SMTP id 66so11397072pga.12
 for <qemu-arm@nongnu.org>; Sat, 09 Apr 2022 22:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rLOhJvvj7gL9dKj7DvOFNAonGDNAYGQD5IOiVrmpC+4=;
 b=gvf3jxfymqplg7m2aamXw5cSmTrPxbG7H6v6wi+7bHPg4GIOObNmEKAhAYjh3jn7TS
 AqF6awPVYSUDKw6rMDEjNH1bN+K89Kq1wWBpySB1wx1s/gc37dG/+lupS35K78Cg2drb
 hVP5qAavydPuYP2YXFdVDZHVoRiD5iObgTZNanQlG4Voa72fUz9+VSKOPp+Gc0wF0zmo
 fT4/UQuwM3cJEpk9pYvGNYBDq6M6xEw4v30S1NOC2NVnTaHVxYp68+e+fjcoabJGvA5l
 Jm/zheF4rqh1EgeQUqemzAyn96gGrC6KbfL/U8c5XRGVQMRrt68L9ESG6l2RW7vaVbxR
 biDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rLOhJvvj7gL9dKj7DvOFNAonGDNAYGQD5IOiVrmpC+4=;
 b=RHb3kmGsQqMBO00UQHABDQn1/P+SuE1s3FRxHrq98POzad4/6yqWY2SLVTMd534e5r
 qabPFP9gjWJnESV/qd5CsW+UBJR/oieKzsYiDIDK4tGYMtG6zw6rdHyuMZAnLyBosi36
 IZUt7w4zMKS8dZHVFVYHJYGsfjvwlp/8KwdoAuvG5kC99O4e/Wk6+e2kZxd8MKKk22eg
 TdfPeNLgHSoz2+65b+d8kFZPvScZ2vCIA2On767Q+svLA+XsMnqs6akNDyultTfkc1NN
 lFgqydxwTPt9hCoxZUe+fI5lt3BNIZ6XAWi1SZUCQXA1+Yr2qYX2oypiYstrTURdq80Y
 rXqA==
X-Gm-Message-State: AOAM5337U2a4AszB+CScfaIPY89RMeV3vIos2L6u0L2cY9z7sFarc0o/
 Wk10Xk9/19pyMVkaY647QpUfWiY/qctJrg==
X-Received: by 2002:a63:535c:0:b0:39d:353e:64d5 with SMTP id
 t28-20020a63535c000000b0039d353e64d5mr2526210pgl.355.1649570247925; 
 Sat, 09 Apr 2022 22:57:27 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 l18-20020a056a00141200b004f75395b2cesm30481862pfu.150.2022.04.09.22.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 22:57:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] target/arm: Enable FEAT_CSV2 for -cpu max
Date: Sat,  9 Apr 2022 22:57:19 -0700
Message-Id: <20220410055725.380246-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220410055725.380246-1-richard.henderson@linaro.org>
References: <20220410055725.380246-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I/Vo6qskIZCh

This extension concerns branch speculation, which TCG does
not implement.  Thus we can trivially enable this feature.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c   | 1 +
 target/arm/cpu_tcg.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index def0f1fdcb..c1006a067c 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -805,6 +805,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
     t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
     t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
+    t = FIELD_DP64(t, ID_AA64PFR0, CSV2, 1);      /* FEAT_CSV2 */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index 5cce9116d0..2750cbebec 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -71,6 +71,7 @@ void arm32_max_features(ARMCPU *cpu)
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_pfr0;
+    t = FIELD_DP32(t, ID_PFR0, CSV2, 2);          /* FEAT_CVS2 */
     t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
     t = FIELD_DP32(t, ID_PFR0, RAS, 1);           /* FEAT_RAS */
     cpu->isar.id_pfr0 = t;
-- 
2.25.1

