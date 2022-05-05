Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1290687lfj;
        Thu, 5 May 2022 12:00:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyr9+qNwKAatS3+a3Hy/SgdIj6uGQv2R7TWakmw6l2uFXbPHXigWnRVjUN5owvaw2rk9TkU
X-Received: by 2002:a05:622a:186:b0:2f3:b5e1:8f2c with SMTP id s6-20020a05622a018600b002f3b5e18f2cmr8895379qtw.99.1651777215565;
        Thu, 05 May 2022 12:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651777215; cv=none;
        d=google.com; s=arc-20160816;
        b=uTu8wyiaRaJv8YBYn8EQ+PL0vl7msGLzl79UIIZVPGh6NQutEWgzR+ublcOluL35lF
         BZ/Yh2Xz59CGnHOeymMGt5u9dYJGa0u6LC/0rVW/0pQtl7AHjsZsFHVUrKyCUy52auqu
         FefV2TXRHz8KQGxJ5PDD+a4cYZq+zFrHDqJ6m5LiUuD979MwGIZNUiTkj3B8wZalmse8
         S0kmiv76/Dye1GPUsiCfPw9n3HCg4ZqQMqXK41KEuB79gUoEiK42Wu4/VFjvtoJnAApz
         KjlmzqdIL5I24V6GkgKVb9cMkGW9hz1fccq+tXyC9p5o4wpWr6ZMkW2ygFSMZL+pmUHy
         GqRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
        b=hd52u0Clp5LdJ6/BZKZpAewfyxrCAhaUy5/4gs1FDWstH3VofFfttdBLBbWs54RwKz
         s3LkEicc7CbHgwdiXfLOkwtRwHtvMImtvfRAojpjjRUIV5BC2XQSWAkvljbF9CO63a3j
         hE2+379wXj+7DvJsIb5GfzHxNHIeQx9GST+X7PnwvLiJXHAXHb5n5eQ/+LYzJAz+im9M
         tzB95l5hEcCbeT7APQ2hiH3woWOeVa/s/rxdWj0Ejy/XhKmzYdv2MWiNJrNr9RD5kHBH
         xhPYznVbYl+Jjtxwjb3EIvVDmlpzPyJIXB3hOtmwo4nMph7Co7/5XVW45qpjB4rlFvje
         254Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUFAcXq8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020a05620a268400b0069fea912fdesi1375880qkp.369.2022.05.05.12.00.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 May 2022 12:00:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XUFAcXq8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nmghy-00081F-N7
	for alex.bennee@linaro.org; Thu, 05 May 2022 15:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYQ-0002Uc-VU
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:23 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d]:37193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYO-0004PL-6V
 for qemu-arm@nongnu.org; Thu, 05 May 2022 14:50:22 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-ed8a3962f8so5096145fac.4
 for <qemu-arm@nongnu.org>; Thu, 05 May 2022 11:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
 b=XUFAcXq82H01NZknIG9Qac0KD2ViCUzqP/vDoyL1Q8+pCSCLf5xeoq+JhfWUThlgao
 3k8PCeGFg09KIox4HyVRzy636nOiYG5aJoQJdbZSkJmiD6LJdE0U5uKoUzjD+YWIXaAO
 oI1Q45juC2Fz8N3MZ5Q6rUtLIxxBSjafpcdqLQX0hG7bo30B+UY3ebBM7GjzUcv2R/XF
 AaD9JyJ+rykJAHlm5X+B3O8HShQwA4COwtqylDChM/7MlN1ZEEcuRNObjDRSdeZHhT5s
 b0nHW+a0Kjt298weYYXwbNFwuRb1AdPlwGlygbij6PilTwQXbtaTt6nXctfadb7cC/4x
 331w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hr9XVqQdGgVN9QhGevO5NcMkH7ocZJOMtPxHUW2biKk=;
 b=PQu4UOHxRj88dQK0zJaI+9vEQN/pWrn52eEJzigpRo3rZhuolSzLeu4N6xlQnP3W96
 Tc5X5nwc3Rk3237vzOwcapYXa6s6EhSWAn7/yxStx/DMY+91ooiY3OGOXfx9jRc6CwJo
 uY04qActTbqBBBKQBbsV13gJXbuopFKb3Qdl0AgHVW4vAGPnhdJDuDXxxGSjS8NdZKrT
 aPoVO8/b0CJfWbng3U0KNEVa6g5O5WkNNGnxb43hlj7Nwgn555dkuYVQphYerkGYsukU
 reGVBdvC6eN8Fy8HItNPxEsOU6HFxTCxwMh4afrzwq7wnIGngTZFfGawysC2zanqzF/w
 Sr/Q==
X-Gm-Message-State: AOAM532K6G5YZYYyQ4RtYZ2gPnAsdZoEqfFduFxcI9cz91mFI7FMUb1Q
 q6Wrl7w9qKHqIjCSTQK/s1DaxfTe2Kst7jDd
X-Received: by 2002:a05:6870:a689:b0:ed:e8f2:fe14 with SMTP id
 i9-20020a056870a68900b000ede8f2fe14mr2980724oam.199.1651776618263; 
 Thu, 05 May 2022 11:50:18 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 07/24] target/arm: Set ID_DFR0.PerfMon for qemu-system-arm
 -cpu max
Date: Thu,  5 May 2022 13:49:49 -0500
Message-Id: <20220505185006.200555-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: nIiv5PjohFFZ

We set this for qemu-system-aarch64, but failed to do so
for the strictly 32-bit emulation.

Fixes: 3bec78447a9 ("target/arm: Provide ARMv8.4-PMU in '-cpu max'")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu_tcg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index f9094c1752..9aa2f737c1 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -1084,6 +1084,10 @@ static void arm_max_initfn(Object *obj)
     t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
     cpu->isar.id_pfr2 = t;
 
+    t = cpu->isar.id_dfr0;
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    cpu->isar.id_dfr0 = t;
+
 #ifdef CONFIG_USER_ONLY
     /*
      * Break with true ARMv8 and add back old-style VFP short-vector support.
-- 
2.34.1

