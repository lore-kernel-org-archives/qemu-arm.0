Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1088110lfc;
        Thu, 12 Mar 2020 12:43:09 -0700 (PDT)
X-Received: by 2002:a17:902:9889:: with SMTP id s9mr8896568plp.252.1584042189482;
        Thu, 12 Mar 2020 12:43:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584042189; cv=none;
        d=google.com; s=arc-20160816;
        b=IUYiU7NrMIQSKnjE5SExONeKKQQolv558yMzpazYysfmGYbkY0rGWAM++ud9quY8IT
         MBvyEE/qymNGRvwqy13laHaV2F6MP818GgRaJCrX96k9iRjHarnEzZjTl+FJUXTeIKuK
         3zFzE5Fz8jTsKYca9HIydAgr65qxcEhILYz7F9/hp5KCcm+AG5QA30HeJekQwIhsZC9b
         007FOschJOT4wsIxM1eTVbWLJPhvM7t/Zifxl0HzUGkurvtbmtLfXTc8eqcgeO8DW2x2
         40aMobe2h3YWRTn3tQUL+eX/g5TaKpyMgQEHEpvSe0NvqCqt5z6nTBtSPMF/3XJ5q+Ec
         GYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=bHE6PfAof8zpzhd8taI/sMJJmZWaYOR9yPhWHh2spmA=;
        b=wFIg3q1aUEeby1UZWNa9xbeAt6VUNY1o7+R8fQoboZ0KRrMBsIQ6AHoxo6SBz4OV8n
         uiug2b5x3DoY6Gt5IqdFfkgfN3N9Fe6jeKdMmA9IPy8+9Hs+rzoeX377nhnHuFTanCdq
         viun4jMX/vJphAiQK0wMnfKRAJ6B+bE2JuzzaHmwGKF5VsNISm0qJY5n3Yd6Fz4SBv9G
         KR5Iv7cGCpbTyWbJp28Bun/0QrljHeAzFFOxFOW81bcWkQVgvkUDvbFWpvhr+hPC4iJp
         4Rha8lypnDVAv2IMBauEnnBtEU4oN8oiexOMyjgbAIe9y6dd6MKKOr50Y/YA1aU5oaw3
         V+HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QuwmJb4R;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x11sor6259248pfc.54.2020.03.12.12.43.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 12:43:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QuwmJb4R;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bHE6PfAof8zpzhd8taI/sMJJmZWaYOR9yPhWHh2spmA=;
        b=QuwmJb4RIj4W/6T4Vycd0ColDfNSSMaDG5lMq6UnJOTSwjLCa79s2gFeztSiToDcGz
         PTJExOmK0HRJHJMhd7EYg3Z9L4MDxXSfn5ZfwyOWOTldK7zwC9w9mXl5RGmKIY67KySc
         Ot/s90pmfNnp4qSgTNHCQWJ+pC+NiKuv+kL0Cs7QO9SWHLSvWJdyap/e2W48+lvNJ2e7
         bq0LDLKfxyplyr2Jidy+3PCdRCjmuWiCNDrEE1yqHZA+AMPue3tt2Xi2Rs6o8Q/2lCSt
         q7Fjb+BWER4L8B3KGMSnWKPOB2IRQCJfqyLBBtVnli8yeFFTiRh9j/qmWhJ86XyT3rQM
         eAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bHE6PfAof8zpzhd8taI/sMJJmZWaYOR9yPhWHh2spmA=;
        b=PXPfe87cV96Mpp/TpmlbGrT3bZSHp+wvkftTObWgX1ufLVWrvPmh6nrPH9nTeAjUju
         He4bkAjGXdhaSDExac+gNFCh+yNVEVfpPE19iSH2A6ZFR4i1BfQ3sFi+8uQ5EePZ3BD7
         WuzlxYkQ3y3bo5lKzguniiaivjfcAzOwAbcvvA8aZ7+TvvU5wm1qZAOePqyq7yCiLSVP
         TEm/FFKWd4xzvHc9OA+tT65L68Fb7iCcdr+pSl1teRRUd1xp5fBRapPwuXyVAw6zdrp6
         lcfIQhQyEvcbfD7TsqNQ2vOtctFVuyO5y3izgP6epvpTkfNjm81sh+BqNQAUIAyntQJ3
         gQkA==
X-Gm-Message-State: ANhLgQ1DiclGytVrBxPCWmCt740HvpHTc1McoLXze5390I5Ng4Ie0It5
	1jQut49mWXO3a4tcYzvcVAhG0uLU
X-Google-Smtp-Source: ADFU+vuYRolq6Gp199hZVQvuNXTtt1qBC5nlJQgQ3TBfMMZSQEaqgJAmy8KUK5vl0tzk+U5hAi8wlg==
X-Received: by 2002:a62:be0d:: with SMTP id l13mr9759640pff.217.1584042188010;
        Thu, 12 Mar 2020 12:43:08 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id g69sm6824842pje.34.2020.03.12.12.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2020 12:43:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH v6 35/42] target/arm: Add mte helpers for sve scatter/gather memory ops
Date: Thu, 12 Mar 2020 12:42:12 -0700
Message-Id: <20200312194219.24406-36-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200312194219.24406-1-richard.henderson@linaro.org>
References: <20200312194219.24406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: PKVeFyaVnqvT

Because the elements are non-sequential, we cannot eliminate many
tests straight away like we can for sequential operations.  But
we often have the PTE details handy, so we can test for Tagged.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper-sve.h    | 285 ++++++++++++++++
 target/arm/sve_helper.c    | 185 +++++++++--
 target/arm/translate-sve.c | 650 +++++++++++++++++++++++++------------
 3 files changed, 872 insertions(+), 248 deletions(-)

diff --git a/target/arm/helper-sve.h b/target/arm/helper-sve.h
index 849478fc76..ddf9069c7f 100644
--- a/target/arm/helper-sve.h
+++ b/target/arm/helper-sve.h
@@ -1605,6 +1605,115 @@ DEF_HELPER_FLAGS_6(sve_ldsds_le_zd, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_6(sve_ldsds_be_zd, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_6(sve_ldbsu_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhsu_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhsu_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldss_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldss_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbss_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhss_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhss_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldbsu_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhsu_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhsu_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldss_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldss_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbss_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhss_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhss_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldbdu_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_lddd_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_lddd_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbds_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldbdu_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_lddd_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_lddd_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbds_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldbdu_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhdu_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsdu_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_lddd_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_lddd_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldbds_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldhds_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldsds_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
 DEF_HELPER_FLAGS_6(sve_ldffbsu_zsu, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_6(sve_ldffhsu_le_zsu, TCG_CALL_NO_WG,
@@ -1714,6 +1823,115 @@ DEF_HELPER_FLAGS_6(sve_ldffsds_le_zd, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_6(sve_ldffsds_be_zd, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_6(sve_ldffbsu_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhsu_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhsu_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffss_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffss_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbss_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhss_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhss_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldffbsu_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhsu_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhsu_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffss_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffss_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbss_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhss_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhss_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldffbdu_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffdd_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffdd_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbds_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldffbdu_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffdd_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffdd_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbds_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_ldffbdu_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhdu_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsdu_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffdd_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffdd_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffbds_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffhds_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_ldffsds_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
 DEF_HELPER_FLAGS_6(sve_stbs_zsu, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 DEF_HELPER_FLAGS_6(sve_sths_le_zsu, TCG_CALL_NO_WG,
@@ -1781,4 +1999,71 @@ DEF_HELPER_FLAGS_6(sve_stdd_le_zd, TCG_CALL_NO_WG,
 DEF_HELPER_FLAGS_6(sve_stdd_be_zd, TCG_CALL_NO_WG,
                    void, env, ptr, ptr, ptr, tl, i32)
 
+DEF_HELPER_FLAGS_6(sve_stbs_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sths_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sths_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stss_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stss_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_stbs_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sths_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sths_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stss_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stss_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_stbd_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_le_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_be_zsu_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_stbd_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_le_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_be_zss_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
+DEF_HELPER_FLAGS_6(sve_stbd_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_sthd_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stsd_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_le_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+DEF_HELPER_FLAGS_6(sve_stdd_be_zd_mte, TCG_CALL_NO_WG,
+                   void, env, ptr, ptr, ptr, tl, i32)
+
 DEF_HELPER_FLAGS_4(sve2_pmull_h, TCG_CALL_NO_RWG, void, ptr, ptr, ptr, i32)
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index 9e8ffb7062..566a619300 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -5518,7 +5518,8 @@ static target_ulong off_zd_d(void *reg, intptr_t reg_ofs)
 static inline QEMU_ALWAYS_INLINE
 void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                target_ulong base, uint32_t desc, uintptr_t retaddr,
-               int esize, int msize, zreg_off_fn *off_fn,
+               uint32_t mtedesc, int esize, int msize,
+               zreg_off_fn *off_fn,
                sve_ldst1_host_fn *host_fn,
                sve_ldst1_tlb_fn *tlb_fn)
 {
@@ -5546,7 +5547,9 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                         cpu_check_watchpoint(env_cpu(env), addr, msize,
                                              info.attrs, BP_MEM_READ, retaddr);
                     }
-                    /* TODO: MTE check */
+                    if (mtedesc && info.attrs.target_tlb_bit1) {
+                        mte_check1(env, mtedesc, addr, retaddr);
+                    }
                     host_fn(&scratch, reg_off, info.host);
                 } else {
                     /* Element crosses the page boundary. */
@@ -5557,7 +5560,9 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                                              msize, info.attrs,
                                              BP_MEM_READ, retaddr);
                     }
-                    /* TODO: MTE check */
+                    if (mtedesc && info.attrs.target_tlb_bit1) {
+                        mte_check1(env, mtedesc, addr, retaddr);
+                    }
                     tlb_fn(env, &scratch, reg_off, addr, retaddr);
                 }
             }
@@ -5570,20 +5575,53 @@ void sve_ld1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
     memcpy(vd, &scratch, reg_max);
 }
 
+static inline QEMU_ALWAYS_INLINE
+void sve_ld1_z_mte(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
+                   target_ulong base, uint32_t desc, uintptr_t retaddr,
+                   int esize, int msize, zreg_off_fn *off_fn,
+                   sve_ldst1_host_fn *host_fn,
+                   sve_ldst1_tlb_fn *tlb_fn)
+{
+    uint32_t mtedesc = desc >> (SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+    /* Remove mtedesc from the normal sve descriptor. */
+    desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+
+    /*
+     * ??? TODO: For the 32-bit offset extractions, base + ofs cannot
+     * offset base entirely over the address space hole to change the
+     * pointer tag, or change the bit55 selector.  So we could here
+     * examine TBI + TCMA like we do for sve_ldN_r_mte().
+     */
+    sve_ld1_z(env, vd, vg, vm, base, desc, retaddr, mtedesc,
+              esize, msize, off_fn, host_fn, tlb_fn);
+}
+
 #define DO_LD1_ZPZ_S(MEM, OFS, MSZ) \
 void HELPER(sve_ld##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
                                  void *vm, target_ulong base, uint32_t desc) \
 {                                                                            \
-    sve_ld1_z(env, vd, vg, vm, base, desc, GETPC(), 4, 1 << MSZ,             \
+    sve_ld1_z(env, vd, vg, vm, base, desc, GETPC(), 0, 4, 1 << MSZ,          \
               off_##OFS##_s, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);       \
+}                                                                            \
+void HELPER(sve_ld##MEM##_##OFS##_mte)(CPUARMState *env, void *vd, void *vg, \
+     void *vm, target_ulong base, uint32_t desc)                             \
+{                                                                            \
+    sve_ld1_z_mte(env, vd, vg, vm, base, desc, GETPC(), 4, 1 << MSZ,         \
+                  off_##OFS##_s, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);   \
 }
 
 #define DO_LD1_ZPZ_D(MEM, OFS, MSZ) \
 void HELPER(sve_ld##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
                                  void *vm, target_ulong base, uint32_t desc) \
 {                                                                            \
-    sve_ld1_z(env, vd, vg, vm, base, desc, GETPC(), 8, 1 << MSZ,             \
+    sve_ld1_z(env, vd, vg, vm, base, desc, GETPC(), 0, 8, 1 << MSZ,          \
               off_##OFS##_d, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);       \
+}                                                                            \
+void HELPER(sve_ld##MEM##_##OFS##_mte)(CPUARMState *env, void *vd, void *vg, \
+    void *vm, target_ulong base, uint32_t desc)                              \
+{                                                                            \
+    sve_ld1_z_mte(env, vd, vg, vm, base, desc, GETPC(), 8, 1 << MSZ,         \
+                  off_##OFS##_d, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);   \
 }
 
 DO_LD1_ZPZ_S(bsu, zsu, MO_8)
@@ -5662,7 +5700,8 @@ DO_LD1_ZPZ_D(dd_be, zd, MO_64)
 static inline QEMU_ALWAYS_INLINE
 void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                  target_ulong base, uint32_t desc, uintptr_t retaddr,
-                 const int esz, const int msz, zreg_off_fn *off_fn,
+                 uint32_t mtedesc, const int esz, const int msz,
+                 zreg_off_fn *off_fn,
                  sve_ldst1_host_fn *host_fn,
                  sve_ldst1_tlb_fn *tlb_fn)
 {
@@ -5687,6 +5726,9 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
      * Probe the first element, allowing faults.
      */
     addr = base + (off_fn(vm, reg_off) << scale);
+    if (mtedesc) {
+        mte_check1(env, mtedesc, addr, retaddr);
+    }
     tlb_fn(env, vd, reg_off, addr, retaddr);
 
     /* After any fault, zero the other elements. */
@@ -5719,7 +5761,11 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                                          BP_MEM_READ)) {
                     goto fault;
                 }
-                /* TODO: MTE check. */
+                if (mtedesc &&
+                    info.attrs.target_tlb_bit1 &&
+                    !mte_probe1(env, mtedesc, addr, retaddr)) {
+                    goto fault;
+                }
 
                 host_fn(vd, reg_off, info.host);
             }
@@ -5732,20 +5778,58 @@ void sve_ldff1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
     record_fault(env, reg_off, reg_max);
 }
 
-#define DO_LDFF1_ZPZ_S(MEM, OFS, MSZ) \
-void HELPER(sve_ldff##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
-                                   void *vm, target_ulong base, uint32_t desc) \
-{                                                                              \
-    sve_ldff1_z(env, vd, vg, vm, base, desc, GETPC(), MO_32, MSZ,              \
-                off_##OFS##_s, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);       \
+static inline QEMU_ALWAYS_INLINE
+void sve_ldff1_z_mte(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
+                     target_ulong base, uint32_t desc, uintptr_t retaddr,
+                     const int esz, const int msz,
+                     zreg_off_fn *off_fn,
+                     sve_ldst1_host_fn *host_fn,
+                     sve_ldst1_tlb_fn *tlb_fn)
+{
+    uint32_t mtedesc = desc >> (SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+    /* Remove mtedesc from the normal sve descriptor. */
+    desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+
+    /*
+     * ??? TODO: For the 32-bit offset extractions, base + ofs cannot
+     * offset base entirely over the address space hole to change the
+     * pointer tag, or change the bit55 selector.  So we could here
+     * examine TBI + TCMA like we do for sve_ldN_r_mte().
+     */
+    sve_ldff1_z(env, vd, vg, vm, base, desc, retaddr, mtedesc,
+                esz, msz, off_fn, host_fn, tlb_fn);
 }
 
-#define DO_LDFF1_ZPZ_D(MEM, OFS, MSZ) \
-void HELPER(sve_ldff##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
-                                   void *vm, target_ulong base, uint32_t desc) \
-{                                                                              \
-    sve_ldff1_z(env, vd, vg, vm, base, desc, GETPC(), MO_64, MSZ,              \
-                off_##OFS##_d, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb);       \
+#define DO_LDFF1_ZPZ_S(MEM, OFS, MSZ)                                   \
+void HELPER(sve_ldff##MEM##_##OFS)                                      \
+    (CPUARMState *env, void *vd, void *vg,                              \
+     void *vm, target_ulong base, uint32_t desc)                        \
+{                                                                       \
+    sve_ldff1_z(env, vd, vg, vm, base, desc, GETPC(), 0, MO_32, MSZ,    \
+                off_##OFS##_s, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb); \
+}                                                                       \
+void HELPER(sve_ldff##MEM##_##OFS##_mte)                                \
+    (CPUARMState *env, void *vd, void *vg,                              \
+     void *vm, target_ulong base, uint32_t desc)                        \
+{                                                                       \
+    sve_ldff1_z_mte(env, vd, vg, vm, base, desc, GETPC(), MO_32, MSZ,   \
+                    off_##OFS##_s, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb); \
+}
+
+#define DO_LDFF1_ZPZ_D(MEM, OFS, MSZ)                                   \
+void HELPER(sve_ldff##MEM##_##OFS)                                      \
+    (CPUARMState *env, void *vd, void *vg,                              \
+     void *vm, target_ulong base, uint32_t desc)                        \
+{                                                                       \
+    sve_ldff1_z(env, vd, vg, vm, base, desc, GETPC(), 0, MO_64, MSZ,    \
+                off_##OFS##_d, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb); \
+}                                                                       \
+void HELPER(sve_ldff##MEM##_##OFS##_mte)                                \
+    (CPUARMState *env, void *vd, void *vg,                              \
+     void *vm, target_ulong base, uint32_t desc)                        \
+{                                                                       \
+    sve_ldff1_z_mte(env, vd, vg, vm, base, desc, GETPC(), MO_64, MSZ,   \
+                    off_##OFS##_d, sve_ld1##MEM##_host, sve_ld1##MEM##_tlb); \
 }
 
 DO_LDFF1_ZPZ_S(bsu, zsu, MO_8)
@@ -5817,7 +5901,8 @@ DO_LDFF1_ZPZ_D(dd_be, zd, MO_64)
 static inline QEMU_ALWAYS_INLINE
 void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                target_ulong base, uint32_t desc, uintptr_t retaddr,
-               int esize, int msize, zreg_off_fn *off_fn,
+               uint32_t mtedesc, int esize, int msize,
+               zreg_off_fn *off_fn,
                sve_ldst1_host_fn *host_fn,
                sve_ldst1_tlb_fn *tlb_fn)
 {
@@ -5861,7 +5946,10 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
                     cpu_check_watchpoint(env_cpu(env), addr, msize,
                                          info.attrs, BP_MEM_WRITE, retaddr);
                 }
-                /* TODO: MTE check. */
+
+                if (mtedesc && info.attrs.target_tlb_bit1) {
+                    mte_check1(env, mtedesc, addr, retaddr);
+                }
             }
             i += 1;
             reg_off += esize;
@@ -5891,20 +5979,53 @@ void sve_st1_z(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
     } while (reg_off < reg_max);
 }
 
-#define DO_ST1_ZPZ_S(MEM, OFS, MSZ) \
-void HELPER(sve_st##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
-                                 void *vm, target_ulong base, uint32_t desc) \
-{                                                                            \
-    sve_st1_z(env, vd, vg, vm, base, desc, GETPC(), 4, 1 << MSZ,             \
-              off_##OFS##_s, sve_st1##MEM##_host, sve_st1##MEM##_tlb);       \
+static inline QEMU_ALWAYS_INLINE
+void sve_st1_z_mte(CPUARMState *env, void *vd, uint64_t *vg, void *vm,
+                   target_ulong base, uint32_t desc, uintptr_t retaddr,
+                   int esize, int msize, zreg_off_fn *off_fn,
+                   sve_ldst1_host_fn *host_fn,
+                   sve_ldst1_tlb_fn *tlb_fn)
+{
+    uint32_t mtedesc = desc >> (SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+    /* Remove mtedesc from the normal sve descriptor. */
+    desc = extract32(desc, 0, SIMD_DATA_SHIFT + SVE_MTEDESC_SHIFT);
+
+    /*
+     * ??? TODO: For the 32-bit offset extractions, base + ofs cannot
+     * offset base entirely over the address space hole to change the
+     * pointer tag, or change the bit55 selector.  So we could here
+     * examine TBI + TCMA like we do for sve_ldN_r_mte().
+     */
+    sve_st1_z(env, vd, vg, vm, base, desc, retaddr, mtedesc,
+              esize, msize, off_fn, host_fn, tlb_fn);
 }
 
-#define DO_ST1_ZPZ_D(MEM, OFS, MSZ) \
-void HELPER(sve_st##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,       \
+#define DO_ST1_ZPZ_S(MEM, OFS, MSZ)                                     \
+void HELPER(sve_st##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,  \
                                  void *vm, target_ulong base, uint32_t desc) \
-{                                                                            \
-    sve_st1_z(env, vd, vg, vm, base, desc, GETPC(), 8, 1 << MSZ,             \
-              off_##OFS##_d, sve_st1##MEM##_host, sve_st1##MEM##_tlb);       \
+{                                                                       \
+    sve_st1_z(env, vd, vg, vm, base, desc, GETPC(), 0, 4, 1 << MSZ,     \
+              off_##OFS##_s, sve_st1##MEM##_host, sve_st1##MEM##_tlb);  \
+}                                                                       \
+void HELPER(sve_st##MEM##_##OFS##_mte)(CPUARMState *env, void *vd, void *vg, \
+    void *vm, target_ulong base, uint32_t desc)                         \
+{                                                                       \
+    sve_st1_z_mte(env, vd, vg, vm, base, desc, GETPC(), 4, 1 << MSZ,    \
+                  off_##OFS##_s, sve_st1##MEM##_host, sve_st1##MEM##_tlb); \
+}
+
+#define DO_ST1_ZPZ_D(MEM, OFS, MSZ)                                     \
+void HELPER(sve_st##MEM##_##OFS)(CPUARMState *env, void *vd, void *vg,  \
+                                 void *vm, target_ulong base, uint32_t desc) \
+{                                                                       \
+    sve_st1_z(env, vd, vg, vm, base, desc, GETPC(), 0, 8, 1 << MSZ,     \
+              off_##OFS##_d, sve_st1##MEM##_host, sve_st1##MEM##_tlb);  \
+}                                                                       \
+void HELPER(sve_st##MEM##_##OFS##_mte)(CPUARMState *env, void *vd, void *vg, \
+    void *vm, target_ulong base, uint32_t desc)                         \
+{                                                                       \
+    sve_st1_z_mte(env, vd, vg, vm, base, desc, GETPC(), 8, 1 << MSZ,    \
+                  off_##OFS##_d, sve_st1##MEM##_host, sve_st1##MEM##_tlb); \
 }
 
 DO_ST1_ZPZ_S(bs, zsu, MO_8)
diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index ce67b79b02..d4525b9112 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5226,7 +5226,7 @@ static bool trans_ST_zpri(DisasContext *s, arg_rpri_store *a)
  */
 
 static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
-                       int scale, TCGv_i64 scalar, int msz,
+                       int scale, TCGv_i64 scalar, int msz, bool is_write,
                        gen_helper_gvec_mem_scatter *fn)
 {
     unsigned vsz = vec_full_reg_size(s);
@@ -5234,8 +5234,16 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
     TCGv_ptr t_pg = tcg_temp_new_ptr();
     TCGv_ptr t_zt = tcg_temp_new_ptr();
     TCGv_i32 t_desc;
-    int desc;
+    int desc = 0;
 
+    if (s->mte_active[0]) {
+        desc = FIELD_DP32(desc, MTEDESC, MIDX, get_mem_index(s));
+        desc = FIELD_DP32(desc, MTEDESC, TBI, s->tbid);
+        desc = FIELD_DP32(desc, MTEDESC, TCMA, s->tcma);
+        desc = FIELD_DP32(desc, MTEDESC, WRITE, is_write);
+        desc = FIELD_DP32(desc, MTEDESC, ESIZE, 1 << msz);
+        desc <<= SVE_MTEDESC_SHIFT;
+    }
     desc = simd_desc(vsz, vsz, scale);
     t_desc = tcg_const_i32(desc);
 
@@ -5250,176 +5258,339 @@ static void do_mem_zpz(DisasContext *s, int zt, int pg, int zm,
     tcg_temp_free_i32(t_desc);
 }
 
-/* Indexed by [be][ff][xs][u][msz].  */
-static gen_helper_gvec_mem_scatter * const gather_load_fn32[2][2][2][2][3] = {
-    /* Little-endian */
-    { { { { gen_helper_sve_ldbss_zsu,
-            gen_helper_sve_ldhss_le_zsu,
-            NULL, },
-          { gen_helper_sve_ldbsu_zsu,
-            gen_helper_sve_ldhsu_le_zsu,
-            gen_helper_sve_ldss_le_zsu, } },
-        { { gen_helper_sve_ldbss_zss,
-            gen_helper_sve_ldhss_le_zss,
-            NULL, },
-          { gen_helper_sve_ldbsu_zss,
-            gen_helper_sve_ldhsu_le_zss,
-            gen_helper_sve_ldss_le_zss, } } },
+/* Indexed by [mte][be][ff][xs][u][msz].  */
+static gen_helper_gvec_mem_scatter * const
+gather_load_fn32[2][2][2][2][2][3] = {
+    { /* MTE Inactive */
+        { /* Little-endian */
+            { { { gen_helper_sve_ldbss_zsu,
+                  gen_helper_sve_ldhss_le_zsu,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zsu,
+                  gen_helper_sve_ldhsu_le_zsu,
+                  gen_helper_sve_ldss_le_zsu, } },
+              { { gen_helper_sve_ldbss_zss,
+                  gen_helper_sve_ldhss_le_zss,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zss,
+                  gen_helper_sve_ldhsu_le_zss,
+                  gen_helper_sve_ldss_le_zss, } } },
 
-      /* First-fault */
-      { { { gen_helper_sve_ldffbss_zsu,
-            gen_helper_sve_ldffhss_le_zsu,
-            NULL, },
-          { gen_helper_sve_ldffbsu_zsu,
-            gen_helper_sve_ldffhsu_le_zsu,
-            gen_helper_sve_ldffss_le_zsu, } },
-        { { gen_helper_sve_ldffbss_zss,
-            gen_helper_sve_ldffhss_le_zss,
-            NULL, },
-          { gen_helper_sve_ldffbsu_zss,
-            gen_helper_sve_ldffhsu_le_zss,
-            gen_helper_sve_ldffss_le_zss, } } } },
+            /* First-fault */
+            { { { gen_helper_sve_ldffbss_zsu,
+                  gen_helper_sve_ldffhss_le_zsu,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zsu,
+                  gen_helper_sve_ldffhsu_le_zsu,
+                  gen_helper_sve_ldffss_le_zsu, } },
+              { { gen_helper_sve_ldffbss_zss,
+                  gen_helper_sve_ldffhss_le_zss,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zss,
+                  gen_helper_sve_ldffhsu_le_zss,
+                  gen_helper_sve_ldffss_le_zss, } } } },
 
-    /* Big-endian */
-    { { { { gen_helper_sve_ldbss_zsu,
-            gen_helper_sve_ldhss_be_zsu,
-            NULL, },
-          { gen_helper_sve_ldbsu_zsu,
-            gen_helper_sve_ldhsu_be_zsu,
-            gen_helper_sve_ldss_be_zsu, } },
-        { { gen_helper_sve_ldbss_zss,
-            gen_helper_sve_ldhss_be_zss,
-            NULL, },
-          { gen_helper_sve_ldbsu_zss,
-            gen_helper_sve_ldhsu_be_zss,
-            gen_helper_sve_ldss_be_zss, } } },
+        { /* Big-endian */
+            { { { gen_helper_sve_ldbss_zsu,
+                  gen_helper_sve_ldhss_be_zsu,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zsu,
+                  gen_helper_sve_ldhsu_be_zsu,
+                  gen_helper_sve_ldss_be_zsu, } },
+              { { gen_helper_sve_ldbss_zss,
+                  gen_helper_sve_ldhss_be_zss,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zss,
+                  gen_helper_sve_ldhsu_be_zss,
+                  gen_helper_sve_ldss_be_zss, } } },
 
-      /* First-fault */
-      { { { gen_helper_sve_ldffbss_zsu,
-            gen_helper_sve_ldffhss_be_zsu,
-            NULL, },
-          { gen_helper_sve_ldffbsu_zsu,
-            gen_helper_sve_ldffhsu_be_zsu,
-            gen_helper_sve_ldffss_be_zsu, } },
-        { { gen_helper_sve_ldffbss_zss,
-            gen_helper_sve_ldffhss_be_zss,
-            NULL, },
-          { gen_helper_sve_ldffbsu_zss,
-            gen_helper_sve_ldffhsu_be_zss,
-            gen_helper_sve_ldffss_be_zss, } } } },
+            /* First-fault */
+            { { { gen_helper_sve_ldffbss_zsu,
+                  gen_helper_sve_ldffhss_be_zsu,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zsu,
+                  gen_helper_sve_ldffhsu_be_zsu,
+                  gen_helper_sve_ldffss_be_zsu, } },
+              { { gen_helper_sve_ldffbss_zss,
+                  gen_helper_sve_ldffhss_be_zss,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zss,
+                  gen_helper_sve_ldffhsu_be_zss,
+                  gen_helper_sve_ldffss_be_zss, } } } } },
+    { /* MTE Active */
+        { /* Little-endian */
+            { { { gen_helper_sve_ldbss_zsu_mte,
+                  gen_helper_sve_ldhss_le_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zsu_mte,
+                  gen_helper_sve_ldhsu_le_zsu_mte,
+                  gen_helper_sve_ldss_le_zsu_mte, } },
+              { { gen_helper_sve_ldbss_zss_mte,
+                  gen_helper_sve_ldhss_le_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zss_mte,
+                  gen_helper_sve_ldhsu_le_zss_mte,
+                  gen_helper_sve_ldss_le_zss_mte, } } },
+
+            /* First-fault */
+            { { { gen_helper_sve_ldffbss_zsu_mte,
+                  gen_helper_sve_ldffhss_le_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zsu_mte,
+                  gen_helper_sve_ldffhsu_le_zsu_mte,
+                  gen_helper_sve_ldffss_le_zsu_mte, } },
+              { { gen_helper_sve_ldffbss_zss_mte,
+                  gen_helper_sve_ldffhss_le_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zss_mte,
+                  gen_helper_sve_ldffhsu_le_zss_mte,
+                  gen_helper_sve_ldffss_le_zss_mte, } } } },
+
+        { /* Big-endian */
+            { { { gen_helper_sve_ldbss_zsu_mte,
+                  gen_helper_sve_ldhss_be_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zsu_mte,
+                  gen_helper_sve_ldhsu_be_zsu_mte,
+                  gen_helper_sve_ldss_be_zsu_mte, } },
+              { { gen_helper_sve_ldbss_zss_mte,
+                  gen_helper_sve_ldhss_be_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldbsu_zss_mte,
+                  gen_helper_sve_ldhsu_be_zss_mte,
+                  gen_helper_sve_ldss_be_zss_mte, } } },
+
+            /* First-fault */
+            { { { gen_helper_sve_ldffbss_zsu_mte,
+                  gen_helper_sve_ldffhss_be_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zsu_mte,
+                  gen_helper_sve_ldffhsu_be_zsu_mte,
+                  gen_helper_sve_ldffss_be_zsu_mte, } },
+              { { gen_helper_sve_ldffbss_zss_mte,
+                  gen_helper_sve_ldffhss_be_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbsu_zss_mte,
+                  gen_helper_sve_ldffhsu_be_zss_mte,
+                  gen_helper_sve_ldffss_be_zss_mte, } } } } },
 };
 
 /* Note that we overload xs=2 to indicate 64-bit offset.  */
-static gen_helper_gvec_mem_scatter * const gather_load_fn64[2][2][3][2][4] = {
-    /* Little-endian */
-    { { { { gen_helper_sve_ldbds_zsu,
-            gen_helper_sve_ldhds_le_zsu,
-            gen_helper_sve_ldsds_le_zsu,
-            NULL, },
-          { gen_helper_sve_ldbdu_zsu,
-            gen_helper_sve_ldhdu_le_zsu,
-            gen_helper_sve_ldsdu_le_zsu,
-            gen_helper_sve_lddd_le_zsu, } },
-        { { gen_helper_sve_ldbds_zss,
-            gen_helper_sve_ldhds_le_zss,
-            gen_helper_sve_ldsds_le_zss,
-            NULL, },
-          { gen_helper_sve_ldbdu_zss,
-            gen_helper_sve_ldhdu_le_zss,
-            gen_helper_sve_ldsdu_le_zss,
-            gen_helper_sve_lddd_le_zss, } },
-        { { gen_helper_sve_ldbds_zd,
-            gen_helper_sve_ldhds_le_zd,
-            gen_helper_sve_ldsds_le_zd,
-            NULL, },
-          { gen_helper_sve_ldbdu_zd,
-            gen_helper_sve_ldhdu_le_zd,
-            gen_helper_sve_ldsdu_le_zd,
-            gen_helper_sve_lddd_le_zd, } } },
+static gen_helper_gvec_mem_scatter * const
+gather_load_fn64[2][2][2][3][2][4] = {
+    { /* MTE Inactive */
+        { /* Little-endian */
+            { { { gen_helper_sve_ldbds_zsu,
+                  gen_helper_sve_ldhds_le_zsu,
+                  gen_helper_sve_ldsds_le_zsu,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zsu,
+                  gen_helper_sve_ldhdu_le_zsu,
+                  gen_helper_sve_ldsdu_le_zsu,
+                  gen_helper_sve_lddd_le_zsu, } },
+              { { gen_helper_sve_ldbds_zss,
+                  gen_helper_sve_ldhds_le_zss,
+                  gen_helper_sve_ldsds_le_zss,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zss,
+                  gen_helper_sve_ldhdu_le_zss,
+                  gen_helper_sve_ldsdu_le_zss,
+                  gen_helper_sve_lddd_le_zss, } },
+              { { gen_helper_sve_ldbds_zd,
+                  gen_helper_sve_ldhds_le_zd,
+                  gen_helper_sve_ldsds_le_zd,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zd,
+                  gen_helper_sve_ldhdu_le_zd,
+                  gen_helper_sve_ldsdu_le_zd,
+                  gen_helper_sve_lddd_le_zd, } } },
 
-      /* First-fault */
-      { { { gen_helper_sve_ldffbds_zsu,
-            gen_helper_sve_ldffhds_le_zsu,
-            gen_helper_sve_ldffsds_le_zsu,
-            NULL, },
-          { gen_helper_sve_ldffbdu_zsu,
-            gen_helper_sve_ldffhdu_le_zsu,
-            gen_helper_sve_ldffsdu_le_zsu,
-            gen_helper_sve_ldffdd_le_zsu, } },
-        { { gen_helper_sve_ldffbds_zss,
-            gen_helper_sve_ldffhds_le_zss,
-            gen_helper_sve_ldffsds_le_zss,
-            NULL, },
-          { gen_helper_sve_ldffbdu_zss,
-            gen_helper_sve_ldffhdu_le_zss,
-            gen_helper_sve_ldffsdu_le_zss,
-            gen_helper_sve_ldffdd_le_zss, } },
-        { { gen_helper_sve_ldffbds_zd,
-            gen_helper_sve_ldffhds_le_zd,
-            gen_helper_sve_ldffsds_le_zd,
-            NULL, },
-          { gen_helper_sve_ldffbdu_zd,
-            gen_helper_sve_ldffhdu_le_zd,
-            gen_helper_sve_ldffsdu_le_zd,
-            gen_helper_sve_ldffdd_le_zd, } } } },
+            /* First-fault */
+            { { { gen_helper_sve_ldffbds_zsu,
+                  gen_helper_sve_ldffhds_le_zsu,
+                  gen_helper_sve_ldffsds_le_zsu,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zsu,
+                  gen_helper_sve_ldffhdu_le_zsu,
+                  gen_helper_sve_ldffsdu_le_zsu,
+                  gen_helper_sve_ldffdd_le_zsu, } },
+              { { gen_helper_sve_ldffbds_zss,
+                  gen_helper_sve_ldffhds_le_zss,
+                  gen_helper_sve_ldffsds_le_zss,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zss,
+                  gen_helper_sve_ldffhdu_le_zss,
+                  gen_helper_sve_ldffsdu_le_zss,
+                  gen_helper_sve_ldffdd_le_zss, } },
+              { { gen_helper_sve_ldffbds_zd,
+                  gen_helper_sve_ldffhds_le_zd,
+                  gen_helper_sve_ldffsds_le_zd,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zd,
+                  gen_helper_sve_ldffhdu_le_zd,
+                  gen_helper_sve_ldffsdu_le_zd,
+                  gen_helper_sve_ldffdd_le_zd, } } } },
+        { /* Big-endian */
+            { { { gen_helper_sve_ldbds_zsu,
+                  gen_helper_sve_ldhds_be_zsu,
+                  gen_helper_sve_ldsds_be_zsu,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zsu,
+                  gen_helper_sve_ldhdu_be_zsu,
+                  gen_helper_sve_ldsdu_be_zsu,
+                  gen_helper_sve_lddd_be_zsu, } },
+              { { gen_helper_sve_ldbds_zss,
+                  gen_helper_sve_ldhds_be_zss,
+                  gen_helper_sve_ldsds_be_zss,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zss,
+                  gen_helper_sve_ldhdu_be_zss,
+                  gen_helper_sve_ldsdu_be_zss,
+                  gen_helper_sve_lddd_be_zss, } },
+              { { gen_helper_sve_ldbds_zd,
+                  gen_helper_sve_ldhds_be_zd,
+                  gen_helper_sve_ldsds_be_zd,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zd,
+                  gen_helper_sve_ldhdu_be_zd,
+                  gen_helper_sve_ldsdu_be_zd,
+                  gen_helper_sve_lddd_be_zd, } } },
 
-    /* Big-endian */
-    { { { { gen_helper_sve_ldbds_zsu,
-            gen_helper_sve_ldhds_be_zsu,
-            gen_helper_sve_ldsds_be_zsu,
-            NULL, },
-          { gen_helper_sve_ldbdu_zsu,
-            gen_helper_sve_ldhdu_be_zsu,
-            gen_helper_sve_ldsdu_be_zsu,
-            gen_helper_sve_lddd_be_zsu, } },
-        { { gen_helper_sve_ldbds_zss,
-            gen_helper_sve_ldhds_be_zss,
-            gen_helper_sve_ldsds_be_zss,
-            NULL, },
-          { gen_helper_sve_ldbdu_zss,
-            gen_helper_sve_ldhdu_be_zss,
-            gen_helper_sve_ldsdu_be_zss,
-            gen_helper_sve_lddd_be_zss, } },
-        { { gen_helper_sve_ldbds_zd,
-            gen_helper_sve_ldhds_be_zd,
-            gen_helper_sve_ldsds_be_zd,
-            NULL, },
-          { gen_helper_sve_ldbdu_zd,
-            gen_helper_sve_ldhdu_be_zd,
-            gen_helper_sve_ldsdu_be_zd,
-            gen_helper_sve_lddd_be_zd, } } },
+            /* First-fault */
+            { { { gen_helper_sve_ldffbds_zsu,
+                  gen_helper_sve_ldffhds_be_zsu,
+                  gen_helper_sve_ldffsds_be_zsu,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zsu,
+                  gen_helper_sve_ldffhdu_be_zsu,
+                  gen_helper_sve_ldffsdu_be_zsu,
+                  gen_helper_sve_ldffdd_be_zsu, } },
+              { { gen_helper_sve_ldffbds_zss,
+                  gen_helper_sve_ldffhds_be_zss,
+                  gen_helper_sve_ldffsds_be_zss,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zss,
+                  gen_helper_sve_ldffhdu_be_zss,
+                  gen_helper_sve_ldffsdu_be_zss,
+                  gen_helper_sve_ldffdd_be_zss, } },
+              { { gen_helper_sve_ldffbds_zd,
+                  gen_helper_sve_ldffhds_be_zd,
+                  gen_helper_sve_ldffsds_be_zd,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zd,
+                  gen_helper_sve_ldffhdu_be_zd,
+                  gen_helper_sve_ldffsdu_be_zd,
+                  gen_helper_sve_ldffdd_be_zd, } } } } },
+    { /* MTE Active */
+        { /* Little-endian */
+            { { { gen_helper_sve_ldbds_zsu_mte,
+                  gen_helper_sve_ldhds_le_zsu_mte,
+                  gen_helper_sve_ldsds_le_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zsu_mte,
+                  gen_helper_sve_ldhdu_le_zsu_mte,
+                  gen_helper_sve_ldsdu_le_zsu_mte,
+                  gen_helper_sve_lddd_le_zsu_mte, } },
+              { { gen_helper_sve_ldbds_zss_mte,
+                  gen_helper_sve_ldhds_le_zss_mte,
+                  gen_helper_sve_ldsds_le_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zss_mte,
+                  gen_helper_sve_ldhdu_le_zss_mte,
+                  gen_helper_sve_ldsdu_le_zss_mte,
+                  gen_helper_sve_lddd_le_zss_mte, } },
+              { { gen_helper_sve_ldbds_zd_mte,
+                  gen_helper_sve_ldhds_le_zd_mte,
+                  gen_helper_sve_ldsds_le_zd_mte,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zd_mte,
+                  gen_helper_sve_ldhdu_le_zd_mte,
+                  gen_helper_sve_ldsdu_le_zd_mte,
+                  gen_helper_sve_lddd_le_zd_mte, } } },
 
-      /* First-fault */
-      { { { gen_helper_sve_ldffbds_zsu,
-            gen_helper_sve_ldffhds_be_zsu,
-            gen_helper_sve_ldffsds_be_zsu,
-            NULL, },
-          { gen_helper_sve_ldffbdu_zsu,
-            gen_helper_sve_ldffhdu_be_zsu,
-            gen_helper_sve_ldffsdu_be_zsu,
-            gen_helper_sve_ldffdd_be_zsu, } },
-        { { gen_helper_sve_ldffbds_zss,
-            gen_helper_sve_ldffhds_be_zss,
-            gen_helper_sve_ldffsds_be_zss,
-            NULL, },
-          { gen_helper_sve_ldffbdu_zss,
-            gen_helper_sve_ldffhdu_be_zss,
-            gen_helper_sve_ldffsdu_be_zss,
-            gen_helper_sve_ldffdd_be_zss, } },
-        { { gen_helper_sve_ldffbds_zd,
-            gen_helper_sve_ldffhds_be_zd,
-            gen_helper_sve_ldffsds_be_zd,
-            NULL, },
-          { gen_helper_sve_ldffbdu_zd,
-            gen_helper_sve_ldffhdu_be_zd,
-            gen_helper_sve_ldffsdu_be_zd,
-            gen_helper_sve_ldffdd_be_zd, } } } },
+            /* First-fault */
+            { { { gen_helper_sve_ldffbds_zsu_mte,
+                  gen_helper_sve_ldffhds_le_zsu_mte,
+                  gen_helper_sve_ldffsds_le_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zsu_mte,
+                  gen_helper_sve_ldffhdu_le_zsu_mte,
+                  gen_helper_sve_ldffsdu_le_zsu_mte,
+                  gen_helper_sve_ldffdd_le_zsu_mte, } },
+              { { gen_helper_sve_ldffbds_zss_mte,
+                  gen_helper_sve_ldffhds_le_zss_mte,
+                  gen_helper_sve_ldffsds_le_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zss_mte,
+                  gen_helper_sve_ldffhdu_le_zss_mte,
+                  gen_helper_sve_ldffsdu_le_zss_mte,
+                  gen_helper_sve_ldffdd_le_zss_mte, } },
+              { { gen_helper_sve_ldffbds_zd_mte,
+                  gen_helper_sve_ldffhds_le_zd_mte,
+                  gen_helper_sve_ldffsds_le_zd_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zd_mte,
+                  gen_helper_sve_ldffhdu_le_zd_mte,
+                  gen_helper_sve_ldffsdu_le_zd_mte,
+                  gen_helper_sve_ldffdd_le_zd_mte, } } } },
+        { /* Big-endian */
+            { { { gen_helper_sve_ldbds_zsu_mte,
+                  gen_helper_sve_ldhds_be_zsu_mte,
+                  gen_helper_sve_ldsds_be_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zsu_mte,
+                  gen_helper_sve_ldhdu_be_zsu_mte,
+                  gen_helper_sve_ldsdu_be_zsu_mte,
+                  gen_helper_sve_lddd_be_zsu_mte, } },
+              { { gen_helper_sve_ldbds_zss_mte,
+                  gen_helper_sve_ldhds_be_zss_mte,
+                  gen_helper_sve_ldsds_be_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zss_mte,
+                  gen_helper_sve_ldhdu_be_zss_mte,
+                  gen_helper_sve_ldsdu_be_zss_mte,
+                  gen_helper_sve_lddd_be_zss_mte, } },
+              { { gen_helper_sve_ldbds_zd_mte,
+                  gen_helper_sve_ldhds_be_zd_mte,
+                  gen_helper_sve_ldsds_be_zd_mte,
+                  NULL, },
+                { gen_helper_sve_ldbdu_zd_mte,
+                  gen_helper_sve_ldhdu_be_zd_mte,
+                  gen_helper_sve_ldsdu_be_zd_mte,
+                  gen_helper_sve_lddd_be_zd_mte, } } },
+
+            /* First-fault */
+            { { { gen_helper_sve_ldffbds_zsu_mte,
+                  gen_helper_sve_ldffhds_be_zsu_mte,
+                  gen_helper_sve_ldffsds_be_zsu_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zsu_mte,
+                  gen_helper_sve_ldffhdu_be_zsu_mte,
+                  gen_helper_sve_ldffsdu_be_zsu_mte,
+                  gen_helper_sve_ldffdd_be_zsu_mte, } },
+              { { gen_helper_sve_ldffbds_zss_mte,
+                  gen_helper_sve_ldffhds_be_zss_mte,
+                  gen_helper_sve_ldffsds_be_zss_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zss_mte,
+                  gen_helper_sve_ldffhdu_be_zss_mte,
+                  gen_helper_sve_ldffsdu_be_zss_mte,
+                  gen_helper_sve_ldffdd_be_zss_mte, } },
+              { { gen_helper_sve_ldffbds_zd_mte,
+                  gen_helper_sve_ldffhds_be_zd_mte,
+                  gen_helper_sve_ldffsds_be_zd_mte,
+                  NULL, },
+                { gen_helper_sve_ldffbdu_zd_mte,
+                  gen_helper_sve_ldffhdu_be_zd_mte,
+                  gen_helper_sve_ldffsdu_be_zd_mte,
+                  gen_helper_sve_ldffdd_be_zd_mte, } } } } },
 };
 
 static bool trans_LD1_zprz(DisasContext *s, arg_LD1_zprz *a)
 {
     gen_helper_gvec_mem_scatter *fn = NULL;
-    int be = s->be_data == MO_BE;
+    bool be = s->be_data == MO_BE;
+    bool mte = s->mte_active[0];
 
     if (!sve_access_check(s)) {
         return true;
@@ -5427,23 +5598,24 @@ static bool trans_LD1_zprz(DisasContext *s, arg_LD1_zprz *a)
 
     switch (a->esz) {
     case MO_32:
-        fn = gather_load_fn32[be][a->ff][a->xs][a->u][a->msz];
+        fn = gather_load_fn32[mte][be][a->ff][a->xs][a->u][a->msz];
         break;
     case MO_64:
-        fn = gather_load_fn64[be][a->ff][a->xs][a->u][a->msz];
+        fn = gather_load_fn64[mte][be][a->ff][a->xs][a->u][a->msz];
         break;
     }
     assert(fn != NULL);
 
     do_mem_zpz(s, a->rd, a->pg, a->rm, a->scale * a->msz,
-               cpu_reg_sp(s, a->rn), a->msz, fn);
+               cpu_reg_sp(s, a->rn), a->msz, false, fn);
     return true;
 }
 
 static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
 {
     gen_helper_gvec_mem_scatter *fn = NULL;
-    int be = s->be_data == MO_BE;
+    bool be = s->be_data == MO_BE;
+    bool mte = s->mte_active[0];
     TCGv_i64 imm;
 
     if (a->esz < a->msz || (a->esz == a->msz && !a->u)) {
@@ -5455,10 +5627,10 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
 
     switch (a->esz) {
     case MO_32:
-        fn = gather_load_fn32[be][a->ff][0][a->u][a->msz];
+        fn = gather_load_fn32[mte][be][a->ff][0][a->u][a->msz];
         break;
     case MO_64:
-        fn = gather_load_fn64[be][a->ff][2][a->u][a->msz];
+        fn = gather_load_fn64[mte][be][a->ff][2][a->u][a->msz];
         break;
     }
     assert(fn != NULL);
@@ -5467,63 +5639,108 @@ static bool trans_LD1_zpiz(DisasContext *s, arg_LD1_zpiz *a)
      * by loading the immediate into the scalar parameter.
      */
     imm = tcg_const_i64(a->imm << a->msz);
-    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, fn);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, false, fn);
     tcg_temp_free_i64(imm);
     return true;
 }
 
-/* Indexed by [be][xs][msz].  */
-static gen_helper_gvec_mem_scatter * const scatter_store_fn32[2][2][3] = {
-    /* Little-endian */
-    { { gen_helper_sve_stbs_zsu,
-        gen_helper_sve_sths_le_zsu,
-        gen_helper_sve_stss_le_zsu, },
-      { gen_helper_sve_stbs_zss,
-        gen_helper_sve_sths_le_zss,
-        gen_helper_sve_stss_le_zss, } },
-    /* Big-endian */
-    { { gen_helper_sve_stbs_zsu,
-        gen_helper_sve_sths_be_zsu,
-        gen_helper_sve_stss_be_zsu, },
-      { gen_helper_sve_stbs_zss,
-        gen_helper_sve_sths_be_zss,
-        gen_helper_sve_stss_be_zss, } },
+/* Indexed by [mte][be][xs][msz].  */
+static gen_helper_gvec_mem_scatter * const scatter_store_fn32[2][2][2][3] = {
+    { /* MTE Inactive */
+        { /* Little-endian */
+            { gen_helper_sve_stbs_zsu,
+              gen_helper_sve_sths_le_zsu,
+              gen_helper_sve_stss_le_zsu, },
+            { gen_helper_sve_stbs_zss,
+              gen_helper_sve_sths_le_zss,
+              gen_helper_sve_stss_le_zss, } },
+        { /* Big-endian */
+            { gen_helper_sve_stbs_zsu,
+              gen_helper_sve_sths_be_zsu,
+              gen_helper_sve_stss_be_zsu, },
+            { gen_helper_sve_stbs_zss,
+              gen_helper_sve_sths_be_zss,
+              gen_helper_sve_stss_be_zss, } } },
+    { /* MTE Active */
+        { /* Little-endian */
+            { gen_helper_sve_stbs_zsu_mte,
+              gen_helper_sve_sths_le_zsu_mte,
+              gen_helper_sve_stss_le_zsu_mte, },
+            { gen_helper_sve_stbs_zss_mte,
+              gen_helper_sve_sths_le_zss_mte,
+              gen_helper_sve_stss_le_zss_mte, } },
+        { /* Big-endian */
+            { gen_helper_sve_stbs_zsu_mte,
+              gen_helper_sve_sths_be_zsu_mte,
+              gen_helper_sve_stss_be_zsu_mte, },
+            { gen_helper_sve_stbs_zss_mte,
+              gen_helper_sve_sths_be_zss_mte,
+              gen_helper_sve_stss_be_zss_mte, } } },
 };
 
 /* Note that we overload xs=2 to indicate 64-bit offset.  */
-static gen_helper_gvec_mem_scatter * const scatter_store_fn64[2][3][4] = {
-    /* Little-endian */
-    { { gen_helper_sve_stbd_zsu,
-        gen_helper_sve_sthd_le_zsu,
-        gen_helper_sve_stsd_le_zsu,
-        gen_helper_sve_stdd_le_zsu, },
-      { gen_helper_sve_stbd_zss,
-        gen_helper_sve_sthd_le_zss,
-        gen_helper_sve_stsd_le_zss,
-        gen_helper_sve_stdd_le_zss, },
-      { gen_helper_sve_stbd_zd,
-        gen_helper_sve_sthd_le_zd,
-        gen_helper_sve_stsd_le_zd,
-        gen_helper_sve_stdd_le_zd, } },
-    /* Big-endian */
-    { { gen_helper_sve_stbd_zsu,
-        gen_helper_sve_sthd_be_zsu,
-        gen_helper_sve_stsd_be_zsu,
-        gen_helper_sve_stdd_be_zsu, },
-      { gen_helper_sve_stbd_zss,
-        gen_helper_sve_sthd_be_zss,
-        gen_helper_sve_stsd_be_zss,
-        gen_helper_sve_stdd_be_zss, },
-      { gen_helper_sve_stbd_zd,
-        gen_helper_sve_sthd_be_zd,
-        gen_helper_sve_stsd_be_zd,
-        gen_helper_sve_stdd_be_zd, } },
+static gen_helper_gvec_mem_scatter * const scatter_store_fn64[2][2][3][4] = {
+    { /* MTE Inactive */
+         { /* Little-endian */
+             { gen_helper_sve_stbd_zsu,
+               gen_helper_sve_sthd_le_zsu,
+               gen_helper_sve_stsd_le_zsu,
+               gen_helper_sve_stdd_le_zsu, },
+             { gen_helper_sve_stbd_zss,
+               gen_helper_sve_sthd_le_zss,
+               gen_helper_sve_stsd_le_zss,
+               gen_helper_sve_stdd_le_zss, },
+             { gen_helper_sve_stbd_zd,
+               gen_helper_sve_sthd_le_zd,
+               gen_helper_sve_stsd_le_zd,
+               gen_helper_sve_stdd_le_zd, } },
+         { /* Big-endian */
+             { gen_helper_sve_stbd_zsu,
+               gen_helper_sve_sthd_be_zsu,
+               gen_helper_sve_stsd_be_zsu,
+               gen_helper_sve_stdd_be_zsu, },
+             { gen_helper_sve_stbd_zss,
+               gen_helper_sve_sthd_be_zss,
+               gen_helper_sve_stsd_be_zss,
+               gen_helper_sve_stdd_be_zss, },
+             { gen_helper_sve_stbd_zd,
+               gen_helper_sve_sthd_be_zd,
+               gen_helper_sve_stsd_be_zd,
+               gen_helper_sve_stdd_be_zd, } } },
+    { /* MTE Inactive */
+         { /* Little-endian */
+             { gen_helper_sve_stbd_zsu_mte,
+               gen_helper_sve_sthd_le_zsu_mte,
+               gen_helper_sve_stsd_le_zsu_mte,
+               gen_helper_sve_stdd_le_zsu_mte, },
+             { gen_helper_sve_stbd_zss_mte,
+               gen_helper_sve_sthd_le_zss_mte,
+               gen_helper_sve_stsd_le_zss_mte,
+               gen_helper_sve_stdd_le_zss_mte, },
+             { gen_helper_sve_stbd_zd_mte,
+               gen_helper_sve_sthd_le_zd_mte,
+               gen_helper_sve_stsd_le_zd_mte,
+               gen_helper_sve_stdd_le_zd_mte, } },
+         { /* Big-endian */
+             { gen_helper_sve_stbd_zsu_mte,
+               gen_helper_sve_sthd_be_zsu_mte,
+               gen_helper_sve_stsd_be_zsu_mte,
+               gen_helper_sve_stdd_be_zsu_mte, },
+             { gen_helper_sve_stbd_zss_mte,
+               gen_helper_sve_sthd_be_zss_mte,
+               gen_helper_sve_stsd_be_zss_mte,
+               gen_helper_sve_stdd_be_zss_mte, },
+             { gen_helper_sve_stbd_zd_mte,
+               gen_helper_sve_sthd_be_zd_mte,
+               gen_helper_sve_stsd_be_zd_mte,
+               gen_helper_sve_stdd_be_zd_mte, } } },
 };
 
 static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a)
 {
     gen_helper_gvec_mem_scatter *fn;
-    int be = s->be_data == MO_BE;
+    bool be = s->be_data == MO_BE;
+    bool mte = s->mte_active[0];
 
     if (a->esz < a->msz || (a->msz == 0 && a->scale)) {
         return false;
@@ -5533,23 +5750,24 @@ static bool trans_ST1_zprz(DisasContext *s, arg_ST1_zprz *a)
     }
     switch (a->esz) {
     case MO_32:
-        fn = scatter_store_fn32[be][a->xs][a->msz];
+        fn = scatter_store_fn32[mte][be][a->xs][a->msz];
         break;
     case MO_64:
-        fn = scatter_store_fn64[be][a->xs][a->msz];
+        fn = scatter_store_fn64[mte][be][a->xs][a->msz];
         break;
     default:
         g_assert_not_reached();
     }
     do_mem_zpz(s, a->rd, a->pg, a->rm, a->scale * a->msz,
-               cpu_reg_sp(s, a->rn), a->msz, fn);
+               cpu_reg_sp(s, a->rn), a->msz, true, fn);
     return true;
 }
 
 static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
 {
     gen_helper_gvec_mem_scatter *fn = NULL;
-    int be = s->be_data == MO_BE;
+    bool be = s->be_data == MO_BE;
+    bool mte = s->mte_active[0];
     TCGv_i64 imm;
 
     if (a->esz < a->msz) {
@@ -5561,10 +5779,10 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
 
     switch (a->esz) {
     case MO_32:
-        fn = scatter_store_fn32[be][0][a->msz];
+        fn = scatter_store_fn32[mte][be][0][a->msz];
         break;
     case MO_64:
-        fn = scatter_store_fn64[be][2][a->msz];
+        fn = scatter_store_fn64[mte][be][2][a->msz];
         break;
     }
     assert(fn != NULL);
@@ -5573,7 +5791,7 @@ static bool trans_ST1_zpiz(DisasContext *s, arg_ST1_zpiz *a)
      * by loading the immediate into the scalar parameter.
      */
     imm = tcg_const_i64(a->imm << a->msz);
-    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, fn);
+    do_mem_zpz(s, a->rd, a->pg, a->rn, 0, imm, a->msz, true, fn);
     tcg_temp_free_i64(imm);
     return true;
 }
-- 
2.20.1
