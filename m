Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2175004ejb;
        Tue, 24 Oct 2023 09:36:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdBOkZkxJKoq0ThW7Q301llkffrH4KeeQm94gEWKpMLmJWAtg3OMZ3OVhUHffnLe0C0fKp
X-Received: by 2002:ad4:5765:0:b0:655:dd4b:d077 with SMTP id r5-20020ad45765000000b00655dd4bd077mr16083273qvx.51.1698165414959;
        Tue, 24 Oct 2023 09:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698165414; cv=none;
        d=google.com; s=arc-20160816;
        b=MpxX546oJwdBSjy4J6Jddn0PXxbr4arLFIxBlYeR/7hAVEwo06tFav4JeZNH3V9ZoR
         cIwtXPM4rFARGDNudO9Cx7NHKQr1oaBBoV/4/awJJnF0ZjKOD4ACY7K00pXlv9KeZ2/y
         jwDCR5V81a3pUSxxgZPOPvXfD9PGdhXBB8W2FXh7jnOMKH2GbsmNFScVGgG6N8rLpwyH
         SQW4UAouTQybaH6Ka8WDuitx98AN1VN4XRf9ftvNLtNkjMA4noHt5CAxZgyI31OqVkpU
         F+uJiGFYnsv6Fmt0sRXypKWS0NJL4QZYGi1XxVKZghT6sevldUCF1Xwqc4PSqqBMyCPO
         9GmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=G/+qcdpgBnjuo8dOvriQuYuuJGQAP8cL8Iq5TnOvFD8=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=B9DOFXtzQJYuWDS+KHchgxwWjDuR0nNXhF04bY6Nc4sq6bucsu2mqQJq7V3W7zd/zl
         hPi9yZBKLFiXlPibUdBXLJ9iyyKlBau2Hz/4iLUZGLrBMhXFnMdjdytCfefYr2Y583Q7
         ycxeo1CKeESKdipDEh05fwlhj5Q22Oj6SeSXg581Rq7t3s9o8ScjWfRnPmXFpMl0T/tB
         Wd6YAHLo/PiNrruHDRBMXZhwpwsbx0NDwXUbyMfLdSgdFDtTkVee14exoi/a4CcDmM+E
         s0QZwqbnv63dF8vA6PGpPM4TI0l/eehdDARIWqcQAH8IsS977dBoVF4r1XuOkEIsCHdg
         ZFvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fj5x+Q9C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13-20020ad4418d000000b0064711f7b6cesi7106188qvp.603.2023.10.24.09.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 09:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Fj5x+Q9C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvKNa-0002F2-LL; Tue, 24 Oct 2023 12:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvKNK-00023W-9k
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 12:35:27 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qvKND-0004Nm-Pz
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 12:35:25 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40850b244beso37068765e9.2
 for <qemu-devel@nongnu.org>; Tue, 24 Oct 2023 09:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698165318; x=1698770118; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=G/+qcdpgBnjuo8dOvriQuYuuJGQAP8cL8Iq5TnOvFD8=;
 b=Fj5x+Q9CE7aAi9+MxOlruJUes6rUve6HY/0qCt2Ck9n/OeidHuK7sd5sp7jM6BxFQl
 ZLCFpKBkiChm4YHXYyEFuOiS8EFvZxlcS/fJwFqHt7w0VgBY6PUBY2H0k9CgGp05k65n
 qmQYfCl2IXZO22CXQaM3NvKRF36AM0sOHWIxyEYKhKxORw7msPWbR/jrOq7DRk5uXzlr
 8IS9HwtMmAkQn77qYxfr/s2X6haUwMQARCspvoX2NFlMt0UTHlJjqJU1AblH7ezy2dbW
 3+TU/aCujxve4yl/5HQ2FJnPV2s7qzDE1HCyxRVG1DfbjPvTvHPXZ6uuWToyXc6A5kJL
 VgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698165318; x=1698770118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G/+qcdpgBnjuo8dOvriQuYuuJGQAP8cL8Iq5TnOvFD8=;
 b=lC5xoc/QLHaZBwelwxXrJnnKWVIeJCb1bNtvMfKW9Euq1o4v2Rqdk6o0YK2MR5TfGJ
 RC7uwkIyYH2W5JtEMC4ohliueftdbMP1w8eSdlojUb8vkd25inmQJzg3Bvh/eX+fcNqi
 dHk5pn1SlDee50oRqLLDaFasKquaakOeaBEJj5qxnyBqgkbLpklnOumVDokdDMCxgt3P
 X8/Q33qi2VMtT3gD0AnZw2rAqXPx4tk9i3KvBXRx0Y/0ZJPIKrM/kfVL/oa6SpPNFbBu
 tmoN+/k+jWW07ckGzqzz4QSaUAc4gNHAhtE5V7b30/PK059vNonrrxwGQxCzyH9rTZvZ
 +efQ==
X-Gm-Message-State: AOJu0YxCU6YTbwRVgpEdvEdDjhpJz0q4D5kt67qmB79RDXdufWESKHFb
 ACGNim3p0XxfV1aEc56YNI9z0w==
X-Received: by 2002:a05:600c:5488:b0:402:f5c4:2e5a with SMTP id
 iv8-20020a05600c548800b00402f5c42e5amr10928515wmb.37.1698165317710; 
 Tue, 24 Oct 2023 09:35:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c418c00b0040773c69fc0sm16860101wmh.11.2023.10.24.09.35.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Oct 2023 09:35:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 6/6] target/arm: Move ID_AA64DFR* feature tests together
Date: Tue, 24 Oct 2023 17:35:10 +0100
Message-Id: <20231024163510.2972081-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231024163510.2972081-1-peter.maydell@linaro.org>
References: <20231024163510.2972081-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: g4qaaTH3OaTV

Move all the ID_AA64DFR* feature test functions together.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-features.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 0ed05b8b19e..66212cd7ecc 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -857,6 +857,11 @@ static inline bool isar_feature_aa64_debugv8p2(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, DEBUGVER) >= 8;
 }
 
+static inline bool isar_feature_aa64_doublelock(const ARMISARegisters *id)
+{
+    return FIELD_SEX64(id->id_aa64dfr0, ID_AA64DFR0, DOUBLELOCK) >= 0;
+}
+
 static inline bool isar_feature_aa64_sve2(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64zfr0, ID_AA64ZFR0, SVEVER) != 0;
@@ -922,11 +927,6 @@ static inline bool isar_feature_aa64_sme_fa64(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64smfr0, ID_AA64SMFR0, FA64);
 }
 
-static inline bool isar_feature_aa64_doublelock(const ARMISARegisters *id)
-{
-    return FIELD_SEX64(id->id_aa64dfr0, ID_AA64DFR0, DOUBLELOCK) >= 0;
-}
-
 /*
  * Feature tests for "does this exist in either 32-bit or 64-bit?"
  */
-- 
2.34.1

