Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5118986ejc;
        Mon, 27 Feb 2023 15:03:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+e6EWJm57nr/XO42iqdEBIOeGKLoyeAs/cIoMZIUlaWZ3TrByMoEs+qGseQ1ieECbo27vb
X-Received: by 2002:ac8:5f10:0:b0:3bf:da89:1946 with SMTP id x16-20020ac85f10000000b003bfda891946mr2021514qta.1.1677539011875;
        Mon, 27 Feb 2023 15:03:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677539011; cv=none;
        d=google.com; s=arc-20160816;
        b=lmVnpLOGZ7WMvTug69rjU6xOWhYP9yoTJFaDezD+TWldp01rRn/e2XBMaKFlpn5Wxc
         8aCAjRmpUu9VmjTOzmqM9Uyp9wOiAyliINuXW24YIgTxtGw/5hzcl/QEemAVw5YEtEL4
         g8/nC2QLGmnVcC/9prdPOSE3/EENDg8zvwdGUGKdHXtqMLT0WxgFIi1zpYry82W+0cF2
         XdYWpJ/fNb5izyPmkd0loFC5+SDQQli4MqH1knpd3GNqi5hemjh/bshBbMi+IzJVjcS8
         33Rggu8P2BgDrq3L1usxAc6Feg9YhzCmYWyNmthHEKRvp9AVI0DjextzR8o7qCAHn5ke
         7FBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
        b=YMrhOYtiW/WAzMobFw+mH9qNzWYtcL/AxRVPSulDqRIXqaLz49uYr4mb+xJeMcfTXD
         q3pHPs/MA5fuTW4uNp07pNDWcN4ntbZrNDn1h6PEW3aE0xncqWMOKEeQAegJ1P9l0HAY
         OCr1c9cTX2gl7heah/9w3ebADd3pK2rW15fZ7WA1D1OOFgiNRHOudmlQvf+trupENopx
         ywFj3uiLh08QFzH68nCjElsMgdmZHrPoN4k6phcZqnO/vx+V6IBVQtFt885zOCkTipAb
         c1/9CO0eYm9ubZrGbLHylI5ssPHSTie2ECQe3o6tkBUAIPEj0miyVZCs1nJ9B15fP/Q/
         S5Hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJrGn2ZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 80-20020a370453000000b006ffd3e1339esi7018064qke.444.2023.02.27.15.03.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 15:03:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TJrGn2ZW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWmVS-00005Z-Aa; Mon, 27 Feb 2023 18:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVK-0007xO-RZ
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:02:01 -0500
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWmVH-000161-Ra
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 18:01:57 -0500
Received: by mail-pj1-x102b.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so7731431pja.5
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 15:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
 b=TJrGn2ZWEhXVIu936f+7Yx3wEJHuml2EvqSC2JEYKiyGyhS9x2yWfuBeZ3jw1QdLYe
 dneVW4I2ZhsYA4PHG1Zcj8gwiobVjg4TXDpht3Uw1i4RUCl2ZXnfdL+EUGfXXcsPlLtQ
 dPLkVGvVEgHyvoXPzYy3tjpmfyQRdYBnqf/tLBIwFnCFxP7J0f5wlMRu7oYm8qs2Ll/K
 KHSBML1CZlxh5TDFDjBk3kYGh8O3J+HRzyylGETkhTGGIYuuHLzPjmf1AA5w01ZovBD3
 5nDGhsJ29yezKdL2E2VZrCVdTdsXsfPZkirVbgSvjWmBBOcJbnSle6hoq+yL/bsKXBqy
 xeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BdnIrBC/vjhypfMOEhRm01STyDVGWe2QDHvXiznUOKk=;
 b=DxHWvQxhyG5N34Lcn3FNVgDvlkNdNtUoZqUGMsbBYZ+8+F3/xiUO9qQ3XTkrKo6m7A
 sO4AdZcbSBT6e5PUGT+5vwhswI3/o0k35a0IaMAaeN65dam5CZpVMMkQV4jH0tSzuLnp
 ZB7ABfVg5a7/COxNP0QOr50BUPyau6Cd0Y/XOEnB8fGTl1mxXkMtuJE5tif2jR3CSzOC
 /IF39A0dwkbEov1lQA2At0HYMmX1lvVKyphZw3ou3DIDs13OifwHV8+Sc7jk4dgwatNr
 vIA59sgiXKStK587TdLCyFxUwPOuI5iSbE1JitJ0LJYXMoJgbhbXdFoyugYa2AJu3do6
 tv4A==
X-Gm-Message-State: AO0yUKVlWLukDeNGtGA+Lg7VjPaqqtZQdi4CBSTw84OFM2/eMzfmvNz/
 ylNc3u4LoPgPfPLnfB+zDLwkb6OajTnoEd2pJUs=
X-Received: by 2002:a17:90b:1805:b0:234:b2a:8251 with SMTP id
 lw5-20020a17090b180500b002340b2a8251mr1002546pjb.0.1677538913237; 
 Mon, 27 Feb 2023 15:01:53 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a637902000000b0050301745a5dsm4406130pgc.50.2023.02.27.15.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 15:01:52 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH for-8.0 v4 17/21] target/arm: Add GPC syndrome
Date: Mon, 27 Feb 2023 13:01:18 -1000
Message-Id: <20230227230122.816702-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227230122.816702-1-richard.henderson@linaro.org>
References: <20230227230122.816702-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: O4IUqroXYYox

The function takes the fields as filled in by
the Arm ARM pseudocode for TakeGPCException.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/syndrome.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index d27d1bc31f..62254d0e51 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -50,6 +50,7 @@ enum arm_exception_class {
     EC_SVEACCESSTRAP          = 0x19,
     EC_ERETTRAP               = 0x1a,
     EC_SMETRAP                = 0x1d,
+    EC_GPC                    = 0x1e,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
     EC_PCALIGNMENT            = 0x22,
@@ -247,6 +248,15 @@ static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
         (cv << 24) | (cond << 20) | rm;
 }
 
+static inline uint32_t syn_gpc(int s2ptw, int ind, int gpcsc,
+                               int cm, int s1ptw, int wnr, int fsc)
+{
+    /* TODO: FEAT_NV2 adds VNCR */
+    return (EC_GPC << ARM_EL_EC_SHIFT) | ARM_EL_IL | (s2ptw << 21)
+            | (ind << 20) | (gpcsc << 14) | (cm << 8) | (s1ptw << 7)
+            | (wnr << 6) | fsc;
+}
+
 static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
 {
     return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
-- 
2.34.1

