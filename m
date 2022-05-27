Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1232321lfh;
        Fri, 27 May 2022 12:11:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOv0NGUjAdFNBPkU5epemGKmmmtkHntQbvtUt2iFB8TIAtsjxdOWqt7DVPRsvf87/UwpmC
X-Received: by 2002:a05:622a:292:b0:2f9:36d4:7b96 with SMTP id z18-20020a05622a029200b002f936d47b96mr21903313qtw.512.1653678679016;
        Fri, 27 May 2022 12:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653678679; cv=none;
        d=google.com; s=arc-20160816;
        b=qfm7iMNfBdLkx6tvs62WjuR0JLQQ0AhO7AEK9NVDykD3g5p+R5vGsj6UkQFqQoU6bb
         QC14jk5EjBcVBan1omg6BmiyXcqva/wyA/4Vzu/0hhi1rD/qUjht9L0S/DMhwYg0vPOS
         qa+RoyJ1DirQJtX6Z2JrJQTw55HlvW8Glpf/lx1XdZEOUOS6yPzQT4/+mA5e4rtNFILO
         mtH3rTGXQ5Bm00zReW47UujZWrx6nz7FIRQLXkkaUuOL+Mnfhrn9QDv7tmnUHniAZ8KC
         cxQXIl94vduYCC4AHE67RaGPMFKErY3PuRtCGIgptYogy0+Rl54up2UojhcoS9fr1EC8
         IPig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PyluT6inHqv6Zl3kXLrQsZnM77T6sYeGqwfjZJp9s3k=;
        b=cMw7/JAYrbzDg4xCMRkTrq/hSsNPxYEAhUvCTA33US9WJheLaRqpoetfn7XYvu8Lzx
         tYR/cqKf6Q9tVGHz7fumqeFNUOR27kPTqqZDK1pBjNigOI58rOvkJV/gg5R0Vs1CFF4J
         pdBGjtsDIWTnS1vLbvl2cJUrhV7yKdHANSd5lm2DPfIvaTQf3SzW94ITJ1r44yU91kHE
         fUnyUaTopI5AOX5WR/9+/7VrzW0GmKb3cPL3k+n6qS4/voboTha/q1+v6GuyLaV1KB6Y
         pq6+hUoVyYvbAODR8BAGgbkGf88MBEkpvZgwSJ0aQfI/Xf2wgSiGcfTmZxHNYFeyw+5J
         D8KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lPaTkLFt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020ac85c4f000000b002f3d0d7c9f9si3368894qtj.602.2022.05.27.12.11.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:11:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lPaTkLFt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufMk-00022r-GI
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:11:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecT-0003jI-1B
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:29 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:44683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuecK-0004Um-MH
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:28 -0400
Received: by mail-pf1-x429.google.com with SMTP id x143so4962601pfc.11
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PyluT6inHqv6Zl3kXLrQsZnM77T6sYeGqwfjZJp9s3k=;
 b=lPaTkLFtxrRye6OvJnUjeY+q/a4WCIGEbmPaqlCFmMUFUMEY/kMCFtUgcrCIA/I6sp
 k3sqLyEO+yLuMbs9tNyz+NtjnW44yCIHEO1OiGQGoQNbdyQjBz5r514rCG10vj9kSVm+
 6kPy5A1zSzDgZuJI0IGsrLVAgJgRZe7uUOykgASQalPcil4iijscgdKlSgvW6sIWcQdK
 lOqUKQt3hMDS2lIbXOuoLG5NtRd1FtQ87NLf30vuE5eRwrx2Qg2NnhORFFXrUimfct0d
 ZLN7XrC5sWyhRDR5hn0i7ht76tM9Ao9U8p9V7W71egGq5M6b1XhoWuJbGKduJ0/nfszM
 UUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PyluT6inHqv6Zl3kXLrQsZnM77T6sYeGqwfjZJp9s3k=;
 b=FgqQabcPfGlJGxzt42p0Ae3roByxS+GhNtmvhF+KYWCgmFwWgGFL/dB4M03EImr3pS
 z5RZlvKDfOUWVSU/qgIfZZRBabQ4uHA1v7S2yb7qC8IX4zqU+knSJVLov/VCEzHOkE2n
 IxJRDkU4XaaO6D8gsIvusEop8DpcxeJC26eids6BnQmmnQXQ7BZRcL8uMdP3yt0EP6zQ
 G+pNv4va7aT3e8VTtq+UEjUDva+qgwA8hHm25yi7x1BjkIBfsKZ0syvHfdIopw+qw70L
 r7GnAlLaM62EJJfVrK2C/luD7RtbugHegk7jeK5DRhTNP6C//5I2RFIplIROGnWWxsO7
 ryYA==
X-Gm-Message-State: AOAM533eadtFR/mZj4tI8LIcEvVy09Av3hGphFXjjUnQfeGeEQ5oac9C
 EBYjCCE8j8uscP7udhaASF8pkUJNbSJYYw==
X-Received: by 2002:a05:6a00:8c2:b0:510:98ac:96c9 with SMTP id
 s2-20020a056a0008c200b0051098ac96c9mr45008343pfu.18.1653675796749; 
 Fri, 27 May 2022 11:23:16 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:23:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 074/114] target/arm: Use TRANS_FEAT for ADD_zzi
Date: Fri, 27 May 2022 11:18:27 -0700
Message-Id: <20220527181907.189259-75-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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
X-TUID: pBj62aq//uHk

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 83980f5ee6..6b2f235e4a 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -3254,10 +3254,7 @@ static bool trans_DUP_i(DisasContext *s, arg_DUP_i *a)
     return true;
 }
 
-static bool trans_ADD_zzi(DisasContext *s, arg_rri_esz *a)
-{
-    return gen_gvec_fn_arg_zzi(s, tcg_gen_gvec_addi, a);
-}
+TRANS_FEAT(ADD_zzi, aa64_sve, gen_gvec_fn_arg_zzi, tcg_gen_gvec_addi, a)
 
 static bool trans_SUB_zzi(DisasContext *s, arg_rri_esz *a)
 {
-- 
2.34.1

