Received: by 10.25.208.211 with SMTP id h202csp31099lfg;
        Fri, 19 Feb 2016 12:05:02 -0800 (PST)
X-Received: by 10.98.1.85 with SMTP id 82mr21036973pfb.10.1455912302884;
        Fri, 19 Feb 2016 12:05:02 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pf0-x235.google.com (mail-pf0-x235.google.com. [2607:f8b0:400e:c00::235])
        by mx.google.com with ESMTPS id v4si18335170pfi.237.2016.02.19.12.05.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2016 12:05:02 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::235 as permitted sender) client-ip=2607:f8b0:400e:c00::235;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c00::235 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pf0-x235.google.com with SMTP id q63so56378730pfb.0;
        Fri, 19 Feb 2016 12:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uO1vFpCmSaI684YhiGNJjpdZ/4Q/5ONSG927kCLVAzs=;
        b=QIkTMRGTJKkGbxyPLJhyYpZwOw4OyqFZ3+Eg2t0RgYF25FOdP4O52QWIvGvsdiRg1t
         0quM2ZQGfoLIys9z6dLd2j+G3TrbB4L6m3PuEkjdfTa68B41RrLrEatzefbxUUkXpIvF
         wrycZvp1ZuCCF49oZFKQzYdcKyyLeHTmyoDiT2UH14/i/+umuy8yLB5O36X9U+eIdGzD
         roTgoSe12RP7WxYa8btHafGR0B5PvOmrygheExNJ/uxGL4WhLg6zFmt9gA4tQNM7hlKr
         nkeyJPy8VZZASfbB15Qsa/bdpkgjKHdWxmGPQhAu0zbbBNNp3CSRrzZovRPJo51kO/vd
         Nq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uO1vFpCmSaI684YhiGNJjpdZ/4Q/5ONSG927kCLVAzs=;
        b=MCU6PQAsPT9r94rEMQj88gmybrD/g0znKBqljHhqdAgTZm+aR8LUQZxYTfnGE15OhW
         +fGnW4gFpRlC4n/PNrQMmoJCVQprep9DvtT8TjP3mnvrmWe9d4zI7mpav0CpTTVIKA8U
         nRDNtHMxBE8ItQJOAMsECg5mFsFJ2wzt1c93FjCsTxzkAs7lzeqGHZ5NFQFV1Jb1R18v
         26OfbTV5pDy0HL+fXCsbyzhLJdfqG9tzB/PE9oKazwh+UhFJG+IoMuWztB/13YkOJX04
         XA/PiawxFcttHUZNpNkuRHrVMYIGpqGDegy0vzeSKeA5OyY8VzuPRIz2QqMT2V8guApw
         C9+g==
X-Gm-Message-State: AG10YOQTZSKOHXyTqggXV9Pb51CihDtL7ZijEqUD3KBARWsVIn0cNPpugtm/kJejOPOh3g==
X-Received: by 10.98.34.209 with SMTP id p78mr20731961pfj.154.1455912302392;
        Fri, 19 Feb 2016 12:05:02 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id m5sm19571678pfi.84.2016.02.19.12.05.00
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 19 Feb 2016 12:05:01 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v2 1/8] tcg: Add tcg_set_insn_param
Date: Fri, 19 Feb 2016 21:04:45 +0100
Message-Id: <1455912292-23807-2-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455912292-23807-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: Xq8mChRU0J1d

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
index 83da5fb..00dd124 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -585,6 +585,12 @@ struct TCGContext {
 
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
1.9.1
