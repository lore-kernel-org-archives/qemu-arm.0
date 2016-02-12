Received: by 10.25.159.19 with SMTP id i19csp857719lfe;
        Fri, 12 Feb 2016 06:36:36 -0800 (PST)
X-Received: by 10.98.65.206 with SMTP id g75mr2598776pfd.94.1455287796687;
        Fri, 12 Feb 2016 06:36:36 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x244.google.com (mail-pa0-x244.google.com. [2607:f8b0:400e:c03::244])
        by mx.google.com with ESMTPS id q66si20386069pfi.84.2016.02.12.06.36.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2016 06:36:36 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::244 as permitted sender) client-ip=2607:f8b0:400e:c03::244;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::244 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pa0-x244.google.com with SMTP id fl4so3883752pad.2;
        Fri, 12 Feb 2016 06:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=uO1vFpCmSaI684YhiGNJjpdZ/4Q/5ONSG927kCLVAzs=;
        b=NeTWsIbI0iWFulfrmH+rEzKt+P1jHHEh6g9z8IhDMF8uyffelPryKo9KBsGixny9dV
         zd8/Qgr9GRNMvpzfXkgF7mdhB2QWPksn48NR4DbtkZgKdC080jgBQjO2u99XaFZQCBEc
         UCU+qCxYczBMfeq19nAdP/6aRhONveBGiU1Wn0eLFF/ccWdL/pNVdXoFtYYzxi3j+eJ1
         w7W7lspPFKd7519wQ+Be+cKusi1Y0SF+VgjBbxWMYd15UW8qkw+FRuaj+zFpA1hTFjtO
         nF4r7ATqam4IJJXDsz+z9jHF2Akn6UBIIyO8LsSELRCGNKDoKeWGHn/SdK+CxjbJA79T
         XjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=uO1vFpCmSaI684YhiGNJjpdZ/4Q/5ONSG927kCLVAzs=;
        b=DaMdQHwHYSjLzkBdaQqoyAmhnw2ox16M6v6cd8RN2lFLzKgFTR248TYYZP63TtvqIu
         ct3GAJyC52zgi1tLulYtSOf8oYn0xrxhtATWEZc2bv18i0P72/Jm/nbCvIgVoPou1Vcn
         Wx2wyYr6MPIkeGQyXvznnkzhecTN76H48qu+fK9J/hPTI9RCwJwGhARaL+rQXym8+V2+
         L2Ep6Chyz3BUoNkG1vxSTQDLAethgtbCW6oP3nkk7dXoFigpcRf3a+8Efom3oOGzrBcn
         jlZCRgctxQ25V5kGAWQV0UR3DIV7h8RT95w/pd4CzsJr/2JwquKw62Oy83JFYXTiglkE
         Q/2g==
X-Gm-Message-State: AG10YORogP7fISDhDsXiugdz/d2D9WuyV1l8tTVMCb2q850+Sq7WI7YNbKqxtI0y9Q2f/w==
X-Received: by 10.67.4.225 with SMTP id ch1mr2482764pad.77.1455287796344;
        Fri, 12 Feb 2016 06:36:36 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id h89sm19991198pfj.52.2016.02.12.06.36.34
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:36:35 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 1/9] tcg: Add tcg_set_insn_param
Date: Fri, 12 Feb 2016 15:33:54 +0100
Message-Id: <1455287642-28166-2-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: 3coZza7NQK0R

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
