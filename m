Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3672927lfa;
        Mon, 7 Jun 2021 09:59:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsuj+MESJtNf1Cv55Pv2TK29tF799suE/xoluTDX27usBBWlHg2K7p9cIJrMCy4f6vHbX5
X-Received: by 2002:a05:6830:1505:: with SMTP id k5mr14908601otp.45.1623085166220;
        Mon, 07 Jun 2021 09:59:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623085166; cv=none;
        d=google.com; s=arc-20160816;
        b=H/KbSFtAvVGmvMxUBaPFISoXuWnzKb/c6dEC8sUiXHJpamv+hUbowE1rVMbYjKVvTH
         JTdqrBsVZYc2heNb9QFZXEjS4Cck6sBgaHmrGxRS4AbdLEn3X62L5hl4Nj10N9fOGnYB
         JeZtoRSN1QRVeUeI9R/SX7lDOQ1xn1ul8eyngSNOKKzpTktoW81nGbKix7YBaIe2YMno
         od3g0KmGx9DsHjK744XwoF/Qgzhy5ZCYuIQ6g26ou1JhIch+uGwkIS28FTI5Y0lMHKpr
         OBS8+6KPuagK1DpaOO86+7BoxZ//PQqZvP+A1pB5zE9jXDX188uFP/vZbh+pfAl+IHNE
         JzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=U3o+F7dXXTuRNIJT1bjRgyFBMN63vTycsmuk+MLAR1w=;
        b=q7EoIyDpVVkff3Y51JKAfC2GQHooGyif9a9WokZRwFXht6/k79+MtH/r4IHD8bbYEu
         WfmBZKyEfLrmxuuciGcdTBSJWmx4rpCKBnuJynzyNr4Ywwz3FmEoW0njBbaXHeqFHCLK
         lZzq+VAzuyR0rU5ka91110ja6bF9rvXu+RW9GHISwtvO+awWS+Y3O5NZ4OLIokwskHUH
         fbqxZTtLoffRr8vSNLexxEBHxzMjv5wo9FNNJMHSr0GOZEbNDOYB2ChEdJR946bASLKm
         3zYHrmnehHxNdgbMLD4o20l2g5jtck8zM3mEHgzejC30yitwPbcMYu0ITn/oarWo5GkR
         Y0Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jWoYWYco;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d187si9145518oif.181.2021.06.07.09.59.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 09:59:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jWoYWYco;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqIaz-0006xa-Ew
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 12:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa4-0006vP-8N
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:28 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lqIa2-0007pu-Dg
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 12:58:28 -0400
Received: by mail-wr1-x433.google.com with SMTP id m18so18442099wrv.2
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 09:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3o+F7dXXTuRNIJT1bjRgyFBMN63vTycsmuk+MLAR1w=;
 b=jWoYWYco0+YDUugtGfd3I7WLDBKPJYUQP/13p6ddmHaadMMb0C5N3g2fXdNIECbbgv
 s8KdTqo1CojnOPYIhtkiPPiHblZUALVWkRZGfrP7lux5e7hkssj8P6OS65pEB1Lfq96F
 k4FpC3/PgGIIbSysrZcIxVRZjXsBksorq3KXI4YAtvBv3eEta1xhLKy0hPVlecDIf7kb
 CFUz2xkP+6Ro6nm7Aktw8GFOEfx4TztvbJ3WMjYm4WQPA4Wzg+ENof3YiIv+cfP8wdjU
 QR3SHQjk8fRmcChdl1hZHz349JX7MHpmrTssqCrKsNuky0TDGco+4Y0y+OWIvo3ykfsK
 5wiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3o+F7dXXTuRNIJT1bjRgyFBMN63vTycsmuk+MLAR1w=;
 b=F33zF4BTH66MyqIaMccXhgKgxGWex4h94cBLMBQC/rq3YnpUA4lLSuPDCszNjt7lch
 jDuwwR+G3ZnwY7IhTVDxi8U62rKm331r9OE0Q6frbmW1NHPs5hwUrd5eJkUcGQ5vGroH
 dhMlV9TSzlEIyGZcn2vmFZpzplaLnFnAAWWn+MM21YjHFh07+xgR+n0LbP1xvkJaJ/sV
 UtT7oNDZMyQ5WXY/g/peS/h9z8zSClL8I9Kuq3NKJa+wqHouQ3pbwtJkJlPrrhc53J21
 1s1Ywvy9fM8fY3v7qfdxCHT1qhFENZh1AW6bilSvJ65MsJCnHrEKrWh5KQxHtVPJPq39
 83WQ==
X-Gm-Message-State: AOAM530pGYmBGV03UtmwM4Hof/Q0wZDyPcncxOmOf2yqQdUye9fdzbyW
 3RxDWzcmQeBWM/owwWJ0HIDKvDk+U+/acG5f
X-Received: by 2002:adf:e943:: with SMTP id m3mr18064269wrn.384.1623085104944; 
 Mon, 07 Jun 2021 09:58:24 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id n10sm18891677wre.95.2021.06.07.09.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 09:58:24 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 01/55] tcg: Introduce tcg_remove_ops_after
Date: Mon,  7 Jun 2021 17:57:27 +0100
Message-Id: <20210607165821.9892-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210607165821.9892-1-peter.maydell@linaro.org>
References: <20210607165821.9892-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bZ3FyB1lnaF4

From: Richard Henderson <richard.henderson@linaro.org>

Introduce a function to remove everything emitted
since a given point.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210604212747.959028-1-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/tcg/tcg.h |  1 +
 tcg/tcg.c         | 13 +++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 74cb3453083..6895246fab5 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -1081,6 +1081,7 @@ TCGOp *tcg_emit_op(TCGOpcode opc);
 void tcg_op_remove(TCGContext *s, TCGOp *op);
 TCGOp *tcg_op_insert_before(TCGContext *s, TCGOp *op, TCGOpcode opc);
 TCGOp *tcg_op_insert_after(TCGContext *s, TCGOp *op, TCGOpcode opc);
+void tcg_remove_ops_after(TCGOp *op);
 
 void tcg_optimize(TCGContext *s);
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0dc271aac9f..262dbba1fde 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2649,6 +2649,19 @@ void tcg_op_remove(TCGContext *s, TCGOp *op)
 #endif
 }
 
+void tcg_remove_ops_after(TCGOp *op)
+{
+    TCGContext *s = tcg_ctx;
+
+    while (true) {
+        TCGOp *last = tcg_last_op();
+        if (last == op) {
+            return;
+        }
+        tcg_op_remove(s, last);
+    }
+}
+
 static TCGOp *tcg_op_alloc(TCGOpcode opc)
 {
     TCGContext *s = tcg_ctx;
-- 
2.20.1

