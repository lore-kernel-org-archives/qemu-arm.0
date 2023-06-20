Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp277946ejt;
        Tue, 20 Jun 2023 06:47:02 -0700 (PDT)
X-Received: by 2002:a17:907:940e:b0:988:3ce8:c5bf with SMTP id dk14-20020a170907940e00b009883ce8c5bfmr5981993ejc.33.1687268822173;
        Tue, 20 Jun 2023 06:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687268822; cv=none;
        d=google.com; s=arc-20160816;
        b=KxzUi19OSTZWXem0pRh91mQpf67F6kDpWt8X4+v/y3C1ddH3YEpSylWpigUIuocOMh
         E26/CVGeb3JzlsR6oBZXY5KvucPCGLqP7ELVqb9RJa/U9ZIVbUMPHDpcAIBFW1C0Z0e4
         L7Rmhi5qf6fiJzM7+Az0sRz0SimRP3i7pzqKCImhC50CwfksVa2j2TG+IIDwYewg2sO9
         wHNO545vozn/QzdY0osFivbpkKy4cdwEan65/T7vy6ceByh7vVV3LJKdh9nS2NNB/Ztq
         JLxA0BONkWuyhScS6vKJwcp1/xQiYCttyqPET+RYmZR2qqCcYPHMeTjuSbZ7MQemmHhw
         7leg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=OwP43XlwUIRhrsR/2qColpGgw5TXdrc1w9pzp3fk9ac=;
        b=tz0QhhOhz2fDY/PdBDFc/2ih1vL/s1mAVRW+F1PsRUXEHQG0+1mWhEJ1QC5vuAaeKg
         ShAaO92gaJ8XA6ZiVwqP5tieDZZ3Z9Q7XwFVWdhHKN0LXPjn+Cqw3/s/IfoJBhNG4ujO
         MElWrTNpEmnsUQogu9jvL2ffLuYUzjgYzLuWJo+hRJ8GLRLHFDzTR+iKpVTocaPMyMo/
         M0KWLeaw2MHC7bDfZJFnOhAibnvjE9IQ9UyWXu66ISBrfc9shgkJGwJH8vOLFQxftsvL
         on+NktbssLhwar45HNVDKmRFR1l4Egp2N9JOZuvMFS6oILbAwcvkjsk6Eni9t2PwC7aX
         zhlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qqs6h7FU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id kv9-20020a17090778c900b0098289e6c4d1sor728881ejc.9.2023.06.20.06.47.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Jun 2023 06:47:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qqs6h7FU;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687268822; x=1689860822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OwP43XlwUIRhrsR/2qColpGgw5TXdrc1w9pzp3fk9ac=;
        b=qqs6h7FUMyqmOMkKgvJCgoSMoAUh4HcQQSHSS7Q1BcFZvZ3mhUv223LizHoSE4ivST
         UajeIfrvWjDrkR+eeYzbEwMwtn2y0wrnWgoCsC7LcWqW5kyZY1+wVbxCaGEzwjgwQAiI
         nK9vjUx3A7Mz4ohiyp0cL3kAwvw0qhqLdBn0rT6PWPTTblrl9Q2t1E3wszdOIlH0nnNA
         E1FX/8kOrVvzp5zdWdMKigoZF40k9oOUrYBBaVmEURbFdEX9HSAsvkb+BnnHe8LvrmaP
         d5ZLkiiWFUlBfqCXubaLhuBTRgrqZgTjyvmeALXzEEEsWhlxTU6TUQiDJgn9Fn0yfyHz
         /Lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687268822; x=1689860822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OwP43XlwUIRhrsR/2qColpGgw5TXdrc1w9pzp3fk9ac=;
        b=QRv6e4emE6TF4TgG9K6xysu3Q9lMYcFI35yhaP0Gs8ETMxiGao3icem8XNyuTSGdbi
         o3ZRgezf2wcWT3hx7NRcBz4wW13Oim+5g/+jqtUknfg1JKNFtGcym3NUhM34VD/e53KG
         UJV6bybuS4SlYAU+jN/4LJ5ivr12PdVySIZXbnN6rNDaayflR8cck8W3sDM3uz7P2tJx
         VOsgk64JBt93Pq3OTFidMgCl/Z2St9VNaTgprS1ZPB0xKeWRNSEaw9fwVrLkW2j3Ycgx
         CJkXw2jVAhDiOg+qBes/OPuhUQWLIBy3/sfgFINoCDnenRxY+wFllYEqyuHyZhSupK++
         Z2GQ==
X-Gm-Message-State: AC+VfDxrCHu9nTAc5Rcb7l8XpDfeJtX9eJknQ/BYYjkCWd87nFmBpXbC
	Z2J7oHK/4Uh8PxDnJLuSM5jjz9btyAJlG7A2YkT/sPmTaxo=
X-Google-Smtp-Source: ACHHUZ6FnJtUg63/2YRbHRdJpjV6AJN3wQ814XajEzPHm7O9rewHeGY4rUpXQfJagDPv8yDsucBOIg==
X-Received: by 2002:a17:907:9623:b0:988:9a65:eae6 with SMTP id gb35-20020a170907962300b009889a65eae6mr5786550ejc.38.1687268821727;
        Tue, 20 Jun 2023 06:47:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.lan ([176.176.183.29])
        by smtp.gmail.com with ESMTPSA id gu1-20020a170906f28100b009829a5ae8b3sm1449187ejb.64.2023.06.20.06.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 06:47:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Mark Rutland <mark.rutland@arm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] target/arm: Fix sve prediate store, 8 <= VQ <= 15
Date: Tue, 20 Jun 2023 15:46:59 +0200
Message-Id: <20230620134659.817559-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 40ar1XoGG47t

Brown bag time: store instead of load results in uninitialized temp.

Reported-by: Mark Rutland <mark.rutland@arm.com>
Fixes: e6dd5e782be ("target/arm: Use tcg_gen_qemu_{ld, st}_i128 in gen_sve_{ld, st}r")
Tested-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index ff050626e6..225d358922 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -4329,7 +4329,7 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
     /* Predicate register stores can be any multiple of 2.  */
     if (len_remain >= 8) {
         t0 = tcg_temp_new_i64();
-        tcg_gen_st_i64(t0, base, vofs + len_align);
+        tcg_gen_ld_i64(t0, base, vofs + len_align);
         tcg_gen_qemu_st_i64(t0, clean_addr, midx, MO_LEUQ | MO_ATOM_NONE);
         len_remain -= 8;
         len_align += 8;
-- 
2.34.1
