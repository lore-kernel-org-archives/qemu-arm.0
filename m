Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp184617ejc;
        Mon, 10 Apr 2023 18:10:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350bwB/sDx2GqUx7wMG8SwLQRflg5ciKv2nvv7de5cSAQAQm3xdzPlqOr5PDJoO4oeVqM2+YM
X-Received: by 2002:a05:6214:21ad:b0:5ee:e18d:3ec with SMTP id t13-20020a05621421ad00b005eee18d03ecmr3185742qvc.26.1681175418457;
        Mon, 10 Apr 2023 18:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175418; cv=none;
        d=google.com; s=arc-20160816;
        b=v9h8bbYi/ugpVl7+dDOLo5rlErkhq7JwPMggJHfj3QSgLr4tQlQ1v9EeIjVXaA5D0d
         inLNJ5n0MkF+MCLv9pZcJM51zZnSp1HAYRMzw5M4EVLqvm9EEQW5AzXdmEvHhj7NaToI
         qAlcylhk8gS7QJiknMLs6qudXnBDvKm+FwoF6CHf3LWWaECaGwsvuHSIuNLzTZ+Hy8eQ
         aY/X0BIRBPtbB48IWZcRU8GEk47fEnk8PVuBlJAvB3swsr4ZWsUAGRO3UtT1lC1DNVwY
         Uedz4aXiRLXxQiDvsj8BIOpC5R4SL56CFSBBwpPh0SxS7AeoHkLgbzOT32xxlBZnh2gx
         1S8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wmUvCy83uzUq+qlSl4tyoYDR2G5J3ycXbuZkZjm5Y8A=;
        b=If0UWA49tt810JzG50+G+M1A3iFPmvtzapmkYWXL4fNK1Y/Abk2mg2jSZ9fq471Ira
         hdF1vk+pmj2TLcH6fc93B0iUo2v07jD9WSEgEeskXJ0G78dN2+AIJh2u5DhvY34qOjSr
         UxQUutsCBBISGYX/6kh7Psv9U6A1R4xNVTBZtQY/0malQAIBKnfTux7UNB1tGwp3f/fG
         cRtPO4bc0kTDakTqURLGk3spFTsAxN8OSQ+zIges8Es2liaxdqAqMnu6QBLC77uNGij5
         dZnvMiIr1QLpIbaXP5JyjincxlgisjbwYOZYDiFrUGsi6EvElXNGu5CxylUFrM5eYOVu
         piMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmOwmafp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq32-20020a05620a46a000b0074a5b0c141csi8612193qkb.267.2023.04.10.18.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:10:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmOwmafp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2Sj-00050R-RU; Mon, 10 Apr 2023 21:06:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SG-0004cq-E8
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:05:58 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2SC-0000Ui-7a
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:05:49 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 h24-20020a17090a9c1800b002404be7920aso6325545pjp.5
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wmUvCy83uzUq+qlSl4tyoYDR2G5J3ycXbuZkZjm5Y8A=;
 b=cmOwmafpbsmaiup0Fx3Gq3QK69Vg+LMvab9ZqnBld569dNYjqMhMxSGOTKThXUHETi
 qEFszH/krJKAWg+PegHJf1jyTtVlIzrhlb1KAM5UJQI23ux5lIinr2SV9AAIXVmMK8Qz
 suIV60BPI66oQB6DSCKFUlDKX6XxDlfyqKJS5pZY7wsHbHBO9eZpR56vVwIRaG42TIok
 A7+BnyobXNovkQ/jdD5T09FWiPWKnsIyxQKr+kKLPxwAjqZcXbEZyjy7n8Rnz1k/MCZC
 TkhDzR45/sjk6KsO9yMUNMpe4qPeRpjmflXDhh1WR/lYTkUtMFBYJ5ACRs5jKFI1eqUK
 uzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175147;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wmUvCy83uzUq+qlSl4tyoYDR2G5J3ycXbuZkZjm5Y8A=;
 b=jNzpGSD1A6twn6xSg09Wfk/3l9dWaaHpXve8ot0Crip1WOwLieEUAL226AvWEWpuNN
 EIVhGm1OeZ+b1ArW7yOVY4NJTDEkhtJ0HgE/jEHnW1DiQs4aI9FGD7T3e+Qlu1bqWV27
 NAYRF/tr1Xv1bGkvpFaBDU7Hm0na8AykRIFZnqgXB5pj8IYzsKqSrUGnx3EGVmy1ty6o
 Kst2DhiXknZ07E1NU/EKSh9Q4CiGSD8zXcdN5EtwGjhKhNLeqhBuYGMT40+KVi4d/tra
 vaV2JgiEcgu8GEUDcmOoQPjCWlBgXvESHMQCC7Fy4onOmmUkhJ66WQgwMkZ18+rrBWH3
 uPDg==
X-Gm-Message-State: AAQBX9cNfsSpiYjFxnFkcyKr1Vg5pCz2Qlm43I/0BcUK4gUR71o68lqQ
 tSDvTCHwuqPcrYTUnIZWc4Jq3g==
X-Received: by 2002:a05:6a20:6691:b0:ea:f140:c692 with SMTP id
 o17-20020a056a20669100b000eaf140c692mr1645842pzh.9.1681175146728; 
 Mon, 10 Apr 2023 18:05:46 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a65690a000000b0051b0e564963sm1320291pgq.49.2023.04.10.18.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:05:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 12/54] tcg/riscv: Conditionalize tcg_out_exts_i32_i64
Date: Mon, 10 Apr 2023 18:04:30 -0700
Message-Id: <20230411010512.5375-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: oWop9rtkjM45

Since TCG_TYPE_I32 values are kept sign-extended in registers,
via "w" instructions, we need not extend if the register matches.
This is already relied upon by comparisons.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/riscv/tcg-target.c.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index 7bd3b421ad..2b9aab29ec 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -604,7 +604,9 @@ static void tcg_out_ext32s(TCGContext *s, TCGReg ret, TCGReg arg)
 
 static void tcg_out_exts_i32_i64(TCGContext *s, TCGReg ret, TCGReg arg)
 {
-    tcg_out_ext32s(s, ret, arg);
+    if (ret != arg) {
+        tcg_out_ext32s(s, ret, arg);
+    }
 }
 
 static void tcg_out_ldst(TCGContext *s, RISCVInsn opc, TCGReg data,
-- 
2.34.1

