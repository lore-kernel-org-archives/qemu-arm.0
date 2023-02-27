Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4300655ejc;
        Sun, 26 Feb 2023 21:49:45 -0800 (PST)
X-Google-Smtp-Source: AK7set9RvLdnisZOCJ2hPaiAsop+LFg4lSLGEgIj+10SABy4Jpc7Suc84x/kgU0VIdeN/CrxgNRy
X-Received: by 2002:a05:6214:2505:b0:56e:f8db:aeb8 with SMTP id gf5-20020a056214250500b0056ef8dbaeb8mr53077865qvb.3.1677476984877;
        Sun, 26 Feb 2023 21:49:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476984; cv=none;
        d=google.com; s=arc-20160816;
        b=pEe2MuVKjCAU1Ou9B5txrcTNDA4B9L0MaVAmu58sWb2EtauCn5bGgjVrieHglD8b42
         1Bd0uTrzJpbX1CUJy50idKHJsG6zo+KVFMLoYTKcp6EjE3V4VBJrANyaxr8NOEb6H/5Y
         pUysS7rPcuRb1qegba89QgNqIR3iDoMRo1OV7oZbk+DRgq9PrLFh5TnOKnhu0i9QXAST
         vkc6D/p/SetMz0XZ0B9Sz5D8v4flmDULszjAvuuRhTSouEaYAsrU7hoZLBAdTcX8nhHM
         T2beEV20BNrW76L0lLBhu5LWAvno4U4i4vE+CRdMmKRUDrR8gFKqXki2oCbryOBvYNq1
         74ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zRx1sxGC/BHAlSf9HxSK6Ts5KBIPD3Nvcak977lbrlU=;
        b=Zv50tUYFCCBc8svi29shsp8vuJgS8IP0iEsvIvbHn+eHW8xBvH6GRcyW3gQBG1Hllo
         /8vL8YjJtQxzXA5JjvopVbK+ASZQiqXXCCYnGCIzGaj4abXO75sej9IRGSkQxTtv0cBA
         XnT2pSTF0KqvZw1ISStSV+ePhDxwPnfHheslTnDtHOAbXRS5mFFXnxmD75V32Umd6OU3
         iimp9onap1E33arzYbBrmGuhKWpfPkMum1swntVOs1JwyJbmaBcD6Fxh0bvcrH6MlzjD
         VQt8jSC0S997UQGSFP39NOaEBwSe7eWLrXBomWrgIZTMx3ZzTqFpXDeNE9bMuId9AqV6
         20ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bSky75kQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c199-20020a379ad0000000b0072ce109a7d7si5079248qke.233.2023.02.26.21.49.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:49:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bSky75kQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWIk-0005IN-An; Mon, 27 Feb 2023 00:43:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIT-0004Y4-8M
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:38 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWIR-00056y-Gr
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:43:36 -0500
Received: by mail-pj1-x1041.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so5032847pja.5
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zRx1sxGC/BHAlSf9HxSK6Ts5KBIPD3Nvcak977lbrlU=;
 b=bSky75kQNaokGkldwx9WxvHXxWcYAfLjGMAg8TIokjVgCOZfI+i0Zl1NjRRHy1Qfjf
 dIvY3HBlE/GwPhvXZXbZjfFpIgeIkRECH5l9Fnm8Pvtx8QZEeF9WdsEM3QUNGNdpYUhH
 80eGDpo2PZd2Q9m4jAmzxolaXBakM4raYLpmH4a4Az4eo3hQxFlsS6XeIxurRP4HtL0F
 40bTr/RbWi7wnpwEE9jLGxq+h2biZA0vcUkNTdCPfbR+YIBP5gPMmcOdoZDBKtLgywvc
 +PXGbNpXarxhDGMfcZCbMmsTHIybdqmubWbvavzexbCY7rkGvl5ZqfJDR5F3RG3Y45uK
 zGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zRx1sxGC/BHAlSf9HxSK6Ts5KBIPD3Nvcak977lbrlU=;
 b=2k0M+938U1i8Vg8lCdDT2MFtAk+QrHseyhGFPpnmQofSUBq13U0piPAyzMd3pwwsdz
 MgZIaGvfQRCm2l5hgtuYlWB+lXsK4Ityuj7mzXmima72UY1xbE5S69cQ9VM8E15WGtln
 LGU/BGPjwqw/6EhXg72wyDcSj+ESp6nlAac6E5Lyv+5SY4VWH9yRrYVD+gGbur1R8cEn
 GBWEgVl8vRf0lNVebT0/+TxW4hV9M6LW3hqAK4eIEW8LiZE0bunZw+UYFpFGH+BVVYWv
 oQpQZ889xg0VeuFcLsvPMyD6+UVag65XrX0Nl68Bv2v/V0CBJHXOv2joKnE7vyTVCAbO
 S3hw==
X-Gm-Message-State: AO0yUKXrt7JHUUz7U3HBMM3puWPHkxHm6YkSv20nnrqDlCqPlJblLPPz
 Yotfzrdg2byMLYuDT1zRYWBgXvL2+8vuN4veuNJeyQ==
X-Received: by 2002:a05:6a20:72a1:b0:cc:f47b:9e with SMTP id
 o33-20020a056a2072a100b000ccf47b009emr5782642pzk.10.1677476612483; 
 Sun, 26 Feb 2023 21:43:32 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7868a000000b005cdc64a287dsm3317137pfo.115.2023.02.26.21.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:43:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 18/70] target/hexagon/idef-parser: Use gen_tmp for
 gen_rvalue_pred
Date: Sun, 26 Feb 2023 19:41:41 -1000
Message-Id: <20230227054233.390271-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227054233.390271-1-richard.henderson@linaro.org>
References: <20230227054233.390271-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
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
X-TUID: uY12+unbs1FG

The allocation is immediately followed by either tcg_gen_mov_i32
or gen_read_preg (which contains tcg_gen_mov_i32), so the zero
initialization is immediately discarded.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/idef-parser/parser-helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/hexagon/idef-parser/parser-helpers.c b/target/hexagon/idef-parser/parser-helpers.c
index 760e499149..c0e6f2190c 100644
--- a/target/hexagon/idef-parser/parser-helpers.c
+++ b/target/hexagon/idef-parser/parser-helpers.c
@@ -1889,7 +1889,7 @@ HexValue gen_rvalue_pred(Context *c, YYLTYPE *locp, HexValue *pred)
         bool is_dotnew = pred->is_dotnew;
         char predicate_id[2] = { pred->pred.id, '\0' };
         char *pred_str = (char *) &predicate_id;
-        *pred = gen_tmp_value(c, locp, "0", 32, UNSIGNED);
+        *pred = gen_tmp(c, locp, 32, UNSIGNED);
         if (is_dotnew) {
             OUT(c, locp, "tcg_gen_mov_i32(", pred,
                 ", hex_new_pred_value[");
-- 
2.34.1

