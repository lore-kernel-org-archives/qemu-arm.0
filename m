Received: by 10.25.208.137 with SMTP id h131csp819532lfg;
        Fri, 29 Apr 2016 05:08:08 -0700 (PDT)
X-Received: by 10.28.63.148 with SMTP id m142mr3474939wma.85.1461931687161;
        Fri, 29 Apr 2016 05:08:07 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com. [2a00:1450:400c:c09::243])
        by mx.google.com with ESMTPS id p9si17096392wjf.86.2016.04.29.05.08.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) client-ip=2a00:1450:400c:c09::243;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2a00:1450:400c:c09::243 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-wm0-x243.google.com with SMTP id n129so4549854wmn.1;
        Fri, 29 Apr 2016 05:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=T+s7tj7AwVVt/6rD+MTUotEw1P+9UJ5YtYtHdH54+dk=;
        b=e8rQOkA6KK12GDD3tzJ3cbEUNf9Zof5nn7NN8bv3R4EGiP1UCC2f5Rik5o4Q+KbyKL
         51Umf90c2CyEZgz6mroTLmFqYZaDJJaNTDBQyZnfXu6OBc4fKDGzeYFQUyZGFyiIXbws
         NoOOaEd/eJrOkMfHtg+MyKUyDSGPzTBgR/HVBPhJ0y7kQYPLMo+WI24eEJTiYOvJxx/H
         q/bxuviLc0YfUBQeYMcMA5n2/eKWoBj/U3wh0ion/mOLW/mJqS6w9EtV/t9zy+rFprY+
         WVlJkd986aY6ylPynudDcSpk2+pNK2/PiFWWZ82fF7p0hvL8TCqm9K8ORVASN/QV6oQi
         Qgvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=T+s7tj7AwVVt/6rD+MTUotEw1P+9UJ5YtYtHdH54+dk=;
        b=le6FWObN00P+AvUkA0nYBleLs4rAB46+cFta4TYzHjkqcBBTyS8CEwJJGQP2mWwoNx
         LsDrkLSh8OK9kp8AvkurFXbGd2trN6w+kJHpM1Tf2iNxGWOjl962JWaISbu30qs0rjGE
         1orFR+PVu/RNVUTRKe5KPHcGmME3/oqECQGDMgA5Qq3n52wZJyJ/LtgPMxImaVToxJy1
         nQgpF6wTLvMtOymJRw5TmfFm1LDg0nYnwZn0byW1ymPSxWQ0P4dJ1Qcej01f0KfGOjQe
         5/IyU0AIw9iry4PEMVeMJ/IJ511gdMXoDvyIVhosPZmX48En1Nplu2GFWQ68NxAssO2F
         +kJg==
X-Gm-Message-State: AOPr4FXQtz6EQ35Am6+sNvdoWf5eUIRoiwImHKJm4SQBrvvvYn/INYhKumOlb+Wq7EkuVg==
X-Received: by 10.194.234.167 with SMTP id uf7mr21377436wjc.122.1461931686931;
        Fri, 29 Apr 2016 05:08:06 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
        by smtp.gmail.com with ESMTPSA id c16sm3013414wme.16.2016.04.29.05.08.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Apr 2016 05:08:06 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v3 1/7] tcg: Add tcg_set_insn_param
Date: Fri, 29 Apr 2016 14:07:58 +0200
Message-Id: <1461931684-1867-2-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
References: <1461931684-1867-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: c0//8aCTRVNZ

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add tcg_set_insn_param as a mechanism to modify an insn
parameter after emiting the insn. This is useful for icount
and also for embedding fault information for a specific insn.

Reviewed-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 tcg/tcg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tcg/tcg.h b/tcg/tcg.h
index 40c8fbe..01dfebd 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -595,6 +595,12 @@ struct TCGContext {
 
 extern TCGContext tcg_ctx;
 
+static inline void tcg_set_insn_param(int op_idx, int arg, TCGArg v)
+{
+    int op_argi = tcg_ctx.gen_op_buf[op_idx].args;
+    tcg_ctx.gen_opparam_buf[op_argi + arg] = v;
+}
+
 /* The number of opcodes emitted so far.  */
 static inline int tcg_op_buf_count(void)
 {
-- 
2.5.0
