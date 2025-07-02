Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3709424qtb;
        Wed, 2 Jul 2025 05:44:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU0DBXeuhZTZLG39ba9YFwVscmpLsy7v++KbR7qiEMAzwHbswAQqCVgdIpxOy1iaXJ3qLfK99LIKVkVJw==@linaro.org
X-Google-Smtp-Source: AGHT+IFGUgBq9Pl+HvK8ZPRN5uY6gei0reoS4H24It7X5NO7Kg4cSVEHY8vg1m9FAiYJWNQ22D9w
X-Received: by 2002:a05:620a:440a:b0:7d4:3e19:55e with SMTP id af79cd13be357-7d5c4711c55mr406042185a.10.1751460263072;
        Wed, 02 Jul 2025 05:44:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460263; cv=none;
        d=google.com; s=arc-20240605;
        b=LBU+4wQl+2vqz2NAZ5IPRKv1z+rwe25BNxleATQYhZGbq3eK2lAukoZsAjKgl8ybyr
         BU0LcFBpBB13A9Eq6gvcFukrtCiqDd2+Uk+YrsUcN/SV8Kh/qaUYrDfCcRsOWTqluLTs
         VsAu1mQqV4V4VZHh4rwaiGkKl5g1CxHtQW0qo4mIJeWRuWjKWSfdoJnmUXqdpiQjLAc9
         5+JkkZ0cxjVmrrugVz3KDr+YuXs5MLEg1BKZeEu9cmXWNqZ+x6GF4E+LA7Rq69z8REAt
         cmqj995/KIBeiR8BKIOfX8TdD+UOMcoS1XzIvsfe8Kikg5b8bOWY4E23Hw9+dGFoVXK3
         VKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZWAlJiBg1/vAA5C7Wnm8w8q1aX2v4P1yDX+CA5vmr1Y=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=k9rsl4QPnOh5H5w0/D1uDBahAYpopZ2wC7hN9MbUP06pIdEZDcTVRFpGVWtNMp4Rp6
         uGwBZs2tw3E1J8xEDNiiLayDGiRGNIg/xQZMpqW2I3h8lJnqQwwmTm7Vvcx//WWQRAHO
         Fq2lq7STe2dmbhAEaANFxRfqepn32opJsn+rdsJapwx1Pn7AHyBzVQiKPMr8qT820Npy
         wiki5SsGRWuk9ik3WM0Z/7lLZd1lmWmnQL7fyJD4ssTQBWo+SuTnFAHtfVb+pMIlJ8i7
         Ar61lHRNqmbDpVNFn98CvLMseiVYmCQrvF9TWX9fLxFN+AJ/D2D/xAV3rP6diGqmJoc1
         4/Gg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aRWrcurx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773548absi137981866d6.146.2025.07.02.05.44.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:44:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aRWrcurx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwm5-00070g-LV; Wed, 02 Jul 2025 08:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjD-0004H6-Et
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:27 -0400
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwj6-000233-8K
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:18 -0400
Received: by mail-ot1-x336.google.com with SMTP id
 46e09a7af769-73a43d327d6so2246087a34.2
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459890; x=1752064690; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZWAlJiBg1/vAA5C7Wnm8w8q1aX2v4P1yDX+CA5vmr1Y=;
 b=aRWrcurxqE6SOp8JWH5GFH9tyPYcX7RB0m/8kMUKSrPGjCOw+RyKew1a+0RqGZFvbb
 1VjUO6BWjydonzsORjHPJv+AMNAXzHLSTA3daCub8+bKhCINuLDe7OF8JjcTS+KOnlXn
 3Y/fyjoy1ULgzMlpe8cxhzT3ormaZ6DMjVRLdEDV+YKq/1snrxIq30KaURMLn7FSpbol
 ORKcr/GNwtY7vHHUbKFIzOKW66bijUX91sCbX6u+WtZwb4VtEbZZkqMK/AvRQLGF4jIH
 GqBV66Cwi3wz16MR4B8ZlBrS5vQMy9k+tofe2HTo2M0c2kxW3lo7ma8LNkwiTrMfLIWQ
 zQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459890; x=1752064690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZWAlJiBg1/vAA5C7Wnm8w8q1aX2v4P1yDX+CA5vmr1Y=;
 b=dOeIAcgspU6VYRke7mg1JtaLpRUoda+UmKNsfDWcsYOwKF+fAg5nU2hqRG/N4lQ3SA
 FefXtMVoyWkG8SnkTBrUE/7y89QWTCD2WKv2T665PO/Guxqdlg1LKbNlNPR/Pkkz8/Vh
 hvsw0YowzdIeS+vVo0HV5pXa+RNZoC8HWjEQTfdw6KoYTiUE1J3sJU8wJuqCZSiwg5X4
 vr+onJZK7eRuY/tbAYxqvHFFjH9GnZLC0vj7G1E5EB46/y07KVD66LVTmYj9H5T6Z5FK
 3AhDdM0koFcEMUxOZxSdlKXPYMO2A9AfXxrNUnMDz7708Zn9loNRGu8ByFs+TAehHjIq
 cowg==
X-Gm-Message-State: AOJu0YzmmixPejdgktrdGTst1QZrvTn0mFaWb9rGnTi/XkEicCw+tofo
 FldjImcx/oxyQh0+ZMtK1Quwc+tiVyG3/t/Ez4X9KlHRqQ4cbVBf7bkeegiSd3OGNp/RNalLlTl
 +y8KXU0E=
X-Gm-Gg: ASbGnctKw7O35kBWuqhDJEH1ZnFpk6/jWqj/h8Pq/iYF2JqB/yZnablEHbwxTjLJXaq
 JPRbw4dw/Dij+gzpF+YJG4J8RIDWIyW+Os9MeiRQUBrhXF7uEOqtpstkctoO484uSxLX+I0rFWF
 uDaFU3DxCxseA4AgRMSAcWkMhZmvLnlB1N1dK6gqbhTiZjewQ/ibqr8MahE1q0p+8c9X088Nav7
 aSkSMVFUOTC0gKKhYkHbhDvEhskUu2/eQZzMv+635uCSVJrLw2XF/UzlYfsJs9GOJCdCNeryZR3
 OBhgSLPe4GwG6U5ZgJwqJsLgjGxdtMDqTsF0+vP9JnQRyrK7bhaI/nDUWDlqskkk0M1cCg==
X-Received: by 2002:a05:6830:2c0a:b0:72b:98f8:5c82 with SMTP id
 46e09a7af769-73b4d1dc6aamr1721780a34.21.1751459890533; 
 Wed, 02 Jul 2025 05:38:10 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 46/97] target/arm: Implement SME2 FRINTN, FRINTP, FRINTM,
 FRINTA
Date: Wed,  2 Jul 2025 06:33:19 -0600
Message-ID: <20250702123410.761208-47-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::336;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: M4j/mKSmQTWd

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 9 +++++++++
 target/arm/tcg/sme.decode      | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index dce3b56de2..4fbc61ae27 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1375,3 +1375,12 @@ TRANS_FEAT(SCVTF, aa64_sme2, do_zz_fpst, a, 0,
            FPST_A64, gen_helper_sme2_scvtf)
 TRANS_FEAT(UCVTF, aa64_sme2, do_zz_fpst, a, 0,
            FPST_A64, gen_helper_sme2_ucvtf)
+
+TRANS_FEAT(FRINTN, aa64_sme2, do_zz_fpst, a, float_round_nearest_even,
+           FPST_A64, gen_helper_gvec_vrint_rm_s)
+TRANS_FEAT(FRINTP, aa64_sme2, do_zz_fpst, a, float_round_up,
+           FPST_A64, gen_helper_gvec_vrint_rm_s)
+TRANS_FEAT(FRINTM, aa64_sme2, do_zz_fpst, a, float_round_down,
+           FPST_A64, gen_helper_gvec_vrint_rm_s)
+TRANS_FEAT(FRINTA, aa64_sme2, do_zz_fpst, a, float_round_ties_away,
+           FPST_A64, gen_helper_gvec_vrint_rm_s)
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 449d97bd28..9cc25622d4 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -751,3 +751,12 @@ SCVTF           11000001 001 00010 111000 ....0 ....0       @zz_2x2
 SCVTF           11000001 001 10010 111000 ...00 ...00       @zz_4x4
 UCVTF           11000001 001 00010 111000 ....1 ....0       @zz_2x2
 UCVTF           11000001 001 10010 111000 ...01 ...00       @zz_4x4
+
+FRINTN          11000001 101 01000 111000 ....0 ....0       @zz_2x2
+FRINTN          11000001 101 11000 111000 ...00 ...00       @zz_4x4
+FRINTP          11000001 101 01001 111000 ....0 ....0       @zz_2x2
+FRINTP          11000001 101 11001 111000 ...00 ...00       @zz_4x4
+FRINTM          11000001 101 01010 111000 ....0 ....0       @zz_2x2
+FRINTM          11000001 101 11010 111000 ...00 ...00       @zz_4x4
+FRINTA          11000001 101 01100 111000 ....0 ....0       @zz_2x2
+FRINTA          11000001 101 11100 111000 ...00 ...00       @zz_4x4
-- 
2.43.0

