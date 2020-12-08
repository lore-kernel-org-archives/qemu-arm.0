Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4250131lfb;
        Tue, 8 Dec 2020 10:24:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxlh/Wn9U+W6wmrY0TD9ZoFTEpv8wTHySQQNwsXaQv+FnNdwNvb/0dB8dRy3bN7yDxByhFZ
X-Received: by 2002:a25:aaee:: with SMTP id t101mr1870742ybi.517.1607451890773;
        Tue, 08 Dec 2020 10:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607451890; cv=none;
        d=google.com; s=arc-20160816;
        b=u0rjPT+n+QMCKKV2KxEkg0bYPVhATzVJ/tfLUOK07xOgDSdifcagQd6L6n0CTtELYQ
         Ur7P6nMWItfeJFDfERnM3sRd81uQEwK14O/lW1xju0ZrMoc0wOZ8lgW/ZsoqEBRgi2I7
         a0ENdhKp/S3CaptW2UZvfmq5yOYAAxeVM2YOQnY/lNlr/Xc8+snGUVv0DVBxKfaxHH8f
         k1lgSdY4K4prMkjB2jN9TDOWRgEz86/yVZeF28zlUxvSoaagsydP7uK7sEEIrGhQhQ3x
         ruUNLmKjkSpL/VH1wHzD0g8YiNm3jFYkgMOYv8FcQ3I9xD5Sm8VdS6wYvEp4/bTlKLZB
         GwnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=G+qmvWx2TCzth2dVwX4A6/f1UaV19mtvUFXgAobfsjw=;
        b=rD7zUs/ST3prHHvua6emP2gxDZIigpvF9rpzv4b8KdGxT21Q00+mMzrg27MUmhIRRn
         sXu1VRf6s2bvt3sMv5aQ9XelfAS4tvKfaG/i2E7vpzqXza/ds923uFMFyMFuyJoUYfzf
         JW8Ouix3pXBa7OY5z6niChFLww8+7X3e04SlG3L6aUwomb/P9LT6hx4iz/wCwfOYZk0/
         xV1zaXUC3z3svJXWXyADxqdAKUZ9bc5gvNLtPyrN8P/aqfWQgK8HuQxOEtPQC5GNfYW3
         mlQLAJQ86XAuXc/4JbEECtE4wc0eRNY/NAivoEDnb8c9B7G2xJBfG2QEjR9r0Cqqcsv1
         y/Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h3owAu2h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k10si15264326ybj.464.2020.12.08.10.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:24:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h3owAu2h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmhfO-0003QP-5j
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:24:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJP-0008Ik-LV
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:07 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37237)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJM-0006RO-5h
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 13:02:07 -0500
Received: by mail-oi1-x241.google.com with SMTP id l207so17416196oib.4
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 10:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G+qmvWx2TCzth2dVwX4A6/f1UaV19mtvUFXgAobfsjw=;
 b=h3owAu2hMeAY+B7TD+bDj+bXVSi28rrMbbBqCFpYlUHrZ0czpcmQxdrXpPoAbTWrW/
 A89kukVEuUwwj/y/cd+/dHSwls2+SdiHAZh9y0WErEbaS6d6II0DS2Bb+VuflYs5GeX7
 y5iCM62S64tsBM5kUWs6VRx5u+70ChKBUWipD8L52pnE/YU6HDh+syLDRZQ/J9blpTxA
 Eo0NVF/CUUf2Or7fGpyXQ+OEqwlDaL1N/mqpvsVdqPKeXjsUfkNSpDKHw/6B4HiZ2bOg
 cwktSxqfbEDMMeHRrFvaPTKv3ny4afwA31QDgfmG0bLbguay0dfqSkcKBtpEHF02UMrv
 kWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G+qmvWx2TCzth2dVwX4A6/f1UaV19mtvUFXgAobfsjw=;
 b=qzbANkqgfeuPZLxlZGpDRNzIkdspFeLg+ujF4ROM3DVxYimTB7dzpNlIadR1iHeG+M
 g1g0K7EldtaLkMiTYZAJI0FYZifpjfXU+CoClFkHTUdZ2ehx5Jb3/GwWbJrgDULw/fyf
 wCB0U3s5WynUdkGtefdDbi2lLsIWPAqP8yNdBqn86QYexxT5A7yVpoeOCQSho8MBNDdQ
 ohXo5+7E5uFq4lROzjTVa/Y0eCZhnei4bD+OLBOCkRVm+/jdxjq4CkvJCwQ7qLUc+uj9
 TelL3SD255HqTUFb4uGPwp/DpozU1EzH7hogPhFdkEDazC6v4dFkqmmqMLQ4+xDbJ2QZ
 PpAA==
X-Gm-Message-State: AOAM532ZGi1REbusfQ1vNqU+/Bdt+7Y1mA67XMhbiVKyMF0apdAmOX/y
 BXykTskO9Q6YoQ92UMBiwDb+Z5Jk5PM7rTWI
X-Received: by 2002:aca:59c2:: with SMTP id n185mr3652762oib.96.1607450522285; 
 Tue, 08 Dec 2020 10:02:02 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.02.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:02:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/24] target/arm: Enforce alignment for sve LD1R
Date: Tue,  8 Dec 2020 12:01:17 -0600
Message-Id: <20201208180118.157911-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x241.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N2Yu/g2dIENM

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 0c3a6d2121..6125e734af 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -5011,7 +5011,7 @@ static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
     clean_addr = gen_mte_check1(s, temp, false, true, msz);
 
     tcg_gen_qemu_ld_i64(temp, clean_addr, get_mem_index(s),
-                        s->be_data | dtype_mop[a->dtype]);
+                        finalize_memop(s, dtype_mop[a->dtype]));
 
     /* Broadcast to *all* elements.  */
     tcg_gen_gvec_dup_i64(esz, vec_full_reg_offset(s, a->rd),
-- 
2.25.1

