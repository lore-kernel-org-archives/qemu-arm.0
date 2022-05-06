Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1986479lfj;
        Fri, 6 May 2022 11:22:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGQ62iXxxsGML03ZTVjeY9KoSZv/Cc7uIBkWJMKKV9K6uJeZcJ/ftU8jBwELhaVqZNvwoq
X-Received: by 2002:a05:6214:19c2:b0:45a:8d3e:8efc with SMTP id j2-20020a05621419c200b0045a8d3e8efcmr3560224qvc.30.1651861378968;
        Fri, 06 May 2022 11:22:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651861378; cv=none;
        d=google.com; s=arc-20160816;
        b=t5gFSYR9HuDR4njUDVk/XeuV1U/tkYdUHEXFmiaF9CKVV2JoYO228ncaQHeUvRAfSQ
         vKyjpJJxhFTVE0cWCVaOJgCgFL7kfTG2A2S0fVsdgoW38jF1xRvx4jmnHTMnZXnmTPwf
         kYY9mtZIVvoNBEbHyIFuLozzPT9yNaiLQywiJMQYxHcoYwYXWm1CHWzs5wYS8qmoY9RH
         alKm6yxvcBla9hyMKHEwyx7R0SdxGX6kpj/bQgWoze++8EgbppHVzonwxBelLiZxLafv
         OriBVWO/JGmI/fLVjhCJf1LVnhhzxpwceTTo+KMZfeWfN3B/0orkJKgAe74t/yvCpWWe
         APGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ffCp2E5F/+S85cFm2jKC10BX2N+sZzcIlrVCqyHFbrg=;
        b=qaqMpAl+87cu6d9qFcgYUbxkxKE9oYbyEXgwkb8CgQuXpc8jc496C+8AymnfvcBvFv
         kQHSlPXSeqhxhZz2e1d87rHX8A3qPAi4yfdGGqWZ70c1H6Sx9u+pEUbxNoQ8sKo0j+0l
         S7l0FEUl1VLT0rdgMrAUezU7CpeH145W+j5OxlRpl/4fISIf5vtvPhEdugls1Eo77fxk
         TB20LVZtbihGcIB1zTSQ6iWn3xqkrG7RM4x3p9uFUYyJvkjh9amOI+4Xl6Rgf57MBCMS
         xR+oXfS0VL3Fx8UizOdbUk7dJGS5yYTQUEuXYPigKaFe1NY1tc6PZBjOjXmGiNEIt/iZ
         MJSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lkC6u9Jm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020a05622a138e00b002e22bbe9f4esi2795753qtk.158.2022.05.06.11.22.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 11:22:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lkC6u9Jm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn2bS-00020u-Ec
	for alex.bennee@linaro.org; Fri, 06 May 2022 14:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IX-0006A0-KI
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:03:25 -0400
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35]:46988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nn2IV-0003xP-Om
 for qemu-arm@nongnu.org; Fri, 06 May 2022 14:03:25 -0400
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-d39f741ba0so7962857fac.13
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 11:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ffCp2E5F/+S85cFm2jKC10BX2N+sZzcIlrVCqyHFbrg=;
 b=lkC6u9JmRmRhufAqL9fOvsaTmRzCYHXRHJ2J6OinN+iTNAklnfQp4ADrfCu83QdxxP
 HD/SA/puFPFeqZuU/uyAXJuA5kpaazM+WZdqQGkq9zO/lm9PfM0VFWHoWNjUsxBaBzQ8
 7daejCVgZwUXCtq2gplPBDowkA4y5ByXqYOFz2W+WIi6+m6WmVd8Q2DebJJIYb5W57eG
 fYu/LgRnnP+NpQuy8B3hrTMR0+VGOwmPTXL7hXZNfPhRx9ty5oEO6XkSuvLOjag2Rf0X
 GOVkqLh+Z5OUmct3urBNJrp5ImXMNVNQir4wGfBFDBnSitGkgQ5lv7NxqVkiP2fdy8kM
 1cSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ffCp2E5F/+S85cFm2jKC10BX2N+sZzcIlrVCqyHFbrg=;
 b=nMMukbaVZvcX7BebR7jnYRsAcyGvziP6qIDA7lCjjYAFCU4odrMBOcdtcfnq3S7Fcl
 7ILaZHc+5K7G6QvvE1/nJ6Ujz19SDX7PZ/K8uoox6RNtl12a8FQ9S4L4HGBd0oNWxXFA
 TO2ZMTa4zhQxPbvbhzDElnfjWlWKUWXLvu8c+GkHrnisT5J7nN4h/14quOZCX/OMkmEq
 7VZ2bcwbmOdFvBSUZPalFIxPOxpwtRhj0KXykL8igQ0ZFzJI35Jx1kahW36dQkIrYrZe
 43s/T59W5zc7ar+ENAbAAIBBNyCDTchIVAdS5thsYLm86anbOasXbdGZEglFiK9A5tjm
 DQkw==
X-Gm-Message-State: AOAM5301kkG9JjYZOzAG0hW+CY8iLKucZTMeWlczgMILHYpiNgV0wpsT
 NYprl35r9IysGDt9gXANBPXfZsQTygw4l2WD
X-Received: by 2002:a05:6870:961c:b0:df:27ec:ed7f with SMTP id
 d28-20020a056870961c00b000df27eced7fmr1849133oaq.275.1651860201704; 
 Fri, 06 May 2022 11:03:21 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe1:b497:51bb:ba21:d1a7:eac2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a056870c0c400b000e686d1389esm1780002oad.56.2022.05.06.11.03.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 11:03:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 22/24] target/arm: Enable FEAT_DGH for -cpu max
Date: Fri,  6 May 2022 13:02:40 -0500
Message-Id: <20220506180242.216785-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220506180242.216785-1-richard.henderson@linaro.org>
References: <20220506180242.216785-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x35.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JGAzvqBFwDNG

This extension concerns not merging memory access, which TCG does
not implement.  Thus we can trivially enable this feature.
Add a comment to handle_hint for the DGH instruction, but no code.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Update emulation.rst
---
 docs/system/arm/emulation.rst | 1 +
 target/arm/cpu64.c            | 1 +
 target/arm/translate-a64.c    | 1 +
 3 files changed, 3 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 48522b8e1c..8ed466bf68 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -17,6 +17,7 @@ the following architecture extensions:
 - FEAT_CSV2_1p2 (Cache speculation variant 2, version 1.2)
 - FEAT_CSV2_2 (Cache speculation variant 2, version 2)
 - FEAT_CSV3 (Cache speculation variant 3)
+- FEAT_DGH (Data gathering hint)
 - FEAT_DIT (Data Independent Timing instructions)
 - FEAT_DPB (DC CVAP instruction)
 - FEAT_Debugv8p2 (Debug changes for v8.2)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 40f77defb5..f55121060d 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -738,6 +738,7 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);       /* FEAT_SB */
     t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);  /* FEAT_SPECRES */
     t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
     t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
     cpu->isar.id_aa64isar1 = t;
 
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 5a02e076b7..6a27234a5c 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1427,6 +1427,7 @@ static void handle_hint(DisasContext *s, uint32_t insn,
         break;
     case 0b00100: /* SEV */
     case 0b00101: /* SEVL */
+    case 0b00110: /* DGH */
         /* we treat all as NOP at least for now */
         break;
     case 0b00111: /* XPACLRI */
-- 
2.34.1

