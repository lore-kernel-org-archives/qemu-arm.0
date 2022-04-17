Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp1265710lfk;
        Sun, 17 Apr 2022 10:46:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaqjT5a4bHjdbAPdpE4925u+9uZTcPIK8rKfNnfNENlDs4Cw4smZEDN60liPYbOSyIkam4
X-Received: by 2002:a05:622a:60a:b0:2e2:7b2:ba74 with SMTP id z10-20020a05622a060a00b002e207b2ba74mr5060023qta.293.1650217593594;
        Sun, 17 Apr 2022 10:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650217593; cv=none;
        d=google.com; s=arc-20160816;
        b=ZWzFmr6XMacQLEr0smrxdabTjFM3oQJBrlv9gk9vvOLC+Kjr9H3yiZtDRarbK6MLec
         XTzsNvkEBuCsoYzCEMW2Douf0MgvgwXc0XOEPv72JjMQU5whP1QqabHabiZXb+wg6k+P
         DASZMAb84pmEMkhtKda2FV5cYsY9WipjtdawsYp8x/8blXLC1ZRwbsQSxJ5IIO7Kag5p
         3Jz0wjiuzeWWxDRMxbN+T7h03xru2wCfFeEkCs4fFb4f1s3QLaNSifR+9KQc478oc+RW
         x81R4t8m7E/WZBNzQxCj3GdBfA9byCz1GYU5AxbtqtdnsoYtSPeS+GyfpqZoIMuGvBAY
         zonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=TnTEItSGWycbpaAmp+hDaYT95wtDnOp1XDNT2WSNp3w=;
        b=AtNmNTlu2Mlm06NkxXPwvQM5jbiXsWE8vsP6IGQDqY8TBkuRSak/TK0X/Z07zfIYIg
         P2LJy7lKkkKknTwXrg6QxffmgnyDt6wVv67opJ8PTigzgaHZ64ezkF+gq/hD6Q4tVdG0
         PhlInSB1C6e615Bix6ZeC4q1DnvnxANZUlU9fec4/3Bph0ltG6dcVVLXHkuYLnKMOoYo
         gqoPGKex4QvraC3bSY9rcmm19jImeLyRATRc8ZzgYqAcj++Ixx/kY20aoFVPbdnVGt6d
         XCMd/bA9q3+D+Mv4hWdRDorUMtTnrNw7pMuHgCq1tw20MLEY4jVyjdxgQRfE+1xAhP5p
         5p0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6Yq7Evf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r8-20020a05622a034800b002ebce4e409asi2645122qtw.9.2022.04.17.10.46.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 17 Apr 2022 10:46:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E6Yq7Evf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ng8yn-0001qy-3L
	for alex.bennee@linaro.org; Sun, 17 Apr 2022 13:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wr-0000dg-KP
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:34 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:46659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ng8wp-0003Du-Lp
 for qemu-arm@nongnu.org; Sun, 17 Apr 2022 13:44:33 -0400
Received: by mail-pl1-x631.google.com with SMTP id be5so10713346plb.13
 for <qemu-arm@nongnu.org>; Sun, 17 Apr 2022 10:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TnTEItSGWycbpaAmp+hDaYT95wtDnOp1XDNT2WSNp3w=;
 b=E6Yq7Evf4C609rZ+2CIrPoceBE6G0loh0WZDqzcpW+M+S5jZQlgAu8P+9bJclkVmeW
 2P7w4GLy/J9hHfie+DwTts7cb6w6DP5v3x/Dgse4HwT78iKzzmOyXkRgDHuH1TqQg/m2
 HEz5VaFnMxCM5YcdgvwV7RxS9kRuK9Io+Xiu5MrRYYdNpY8Aje84cN3C9jUtce/TwLMi
 YH5RPauvCvXZ8FbX0wTqcO0bsTI6O/y84x0+ZcieUQ7iQVYSB7yKfSdoxV+nHs9D2QHV
 CpsUx+jOjI05ykwfaLnECbqysWqdBFqb3Srt1wECZCI9zp2/Ph1sxB5vRCgwDo7e9IFo
 OUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TnTEItSGWycbpaAmp+hDaYT95wtDnOp1XDNT2WSNp3w=;
 b=L4zQG87ZK8nBX2uZVh8McczjXiR4kDL7GYL593b0h3xr7ya/6JJvu2yNDeq6Y9c5ld
 ziq/hXQxmf5slD08O+dZiIa6jDSTh8dsuhjLQcOSThSWfIL8AyNN8NkskoYVV5G6z1lC
 Qk5aYihHA/QFIG23A+2+U6S74heUPGCxW4KABsgQ4NSQwIncoLW3ehc2R9MKCA/deaMi
 wPBVJ3tNypgLqwpYUr2vWyDKen2F+yOfVfaXP1ZABbU8SNHKfMTR3+Ehz3a0g6FHzzEG
 yAuWHZKbIiBNRe3a8zDO6/Se4YAgZEwLjZwEs523NIopE3m2TQwDfxJagbdB9z61PvR6
 QRDA==
X-Gm-Message-State: AOAM533qGHCOWlm1fiIyxVyRNB2VTLNXiHA08sh3km3v+wWTdYRKJM/p
 taYTbQlCy9IGgHKYydCXxN7/VqyJzLBY3w==
X-Received: by 2002:a17:90b:804:b0:1cb:be2d:e28f with SMTP id
 bk4-20020a17090b080400b001cbbe2de28fmr8942645pjb.21.1650217470376; 
 Sun, 17 Apr 2022 10:44:30 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i2-20020a17090a138200b001cb6512b579sm10372119pja.44.2022.04.17.10.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 10:44:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/60] tcg: Add tcg_constant_ptr
Date: Sun, 17 Apr 2022 10:43:27 -0700
Message-Id: <20220417174426.711829-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220417174426.711829-1-richard.henderson@linaro.org>
References: <20220417174426.711829-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +7EZUaBqJqcI

Similar to tcg_const_ptr, defer to tcg_constant_{i32,i64}.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 73869fd9d0..cd6eaae410 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1054,9 +1054,11 @@ TCGv_vec tcg_constant_vec_matching(TCGv_vec match, unsigned vece, int64_t val);
 #if UINTPTR_MAX == UINT32_MAX
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i32((intptr_t)(x)))
 # define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i32((intptr_t)(x)))
+# define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i32((intptr_t)(x)))
 #else
 # define tcg_const_ptr(x)        ((TCGv_ptr)tcg_const_i64((intptr_t)(x)))
 # define tcg_const_local_ptr(x)  ((TCGv_ptr)tcg_const_local_i64((intptr_t)(x)))
+# define tcg_constant_ptr(x)     ((TCGv_ptr)tcg_constant_i64((intptr_t)(x)))
 #endif
 
 TCGLabel *gen_new_label(void);
-- 
2.25.1

