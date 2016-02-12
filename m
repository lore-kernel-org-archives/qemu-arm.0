Received: by 10.25.159.19 with SMTP id i19csp857884lfe;
        Fri, 12 Feb 2016 06:36:55 -0800 (PST)
X-Received: by 10.98.86.139 with SMTP id h11mr2579591pfj.105.1455287815348;
        Fri, 12 Feb 2016 06:36:55 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-pa0-x242.google.com (mail-pa0-x242.google.com. [2607:f8b0:400e:c03::242])
        by mx.google.com with ESMTPS id oz1si20384296pac.46.2016.02.12.06.36.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 12 Feb 2016 06:36:55 -0800 (PST)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::242 as permitted sender) client-ip=2607:f8b0:400e:c03::242;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 2607:f8b0:400e:c03::242 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dkim=pass header.i=@gmail.com;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: by mail-pa0-x242.google.com with SMTP id yy13so3897659pab.1;
        Fri, 12 Feb 2016 06:36:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=yj2a9k8XllulEq7e4u0T/RMf086u2rLFRwtS+LNNAn8=;
        b=ssnZDgqCEBtVCLmFHa98OdQWJIW5OgZoZ7ukWkleHRy3AuV/I11+G/c5eqFkHh/AXQ
         rmcgwXohkAbQNRnL8JMVmhKzhbHYy5Z/vRJv+gL7xTua96GBVV7eLvOvyj5xb3CK7D1g
         iu2ibkH2CzdegvJ4Jg3sndzYH5Mqbk+ftGZHWDMIGbTLM8Nm+WWTYv1andDknpIvCoTL
         KKxgcVtn1bW+V0zBqU9BhSlbf15pCHX7T2FYMBalQ4Zftx20mGQ7SMu+Itdv2oc6YSVz
         vPImAlMJOafsbPY9I4Dt0df5vkGqpt0FDYNxNPag8oNDT5eFX90FcPNS1dxg4ZrBXtq3
         krsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=yj2a9k8XllulEq7e4u0T/RMf086u2rLFRwtS+LNNAn8=;
        b=U7FqLdy+EA2f9IGl+w0zl51Uiir2nxIO0RFc5yfh4if7E3S+fchf8/nZItGdwIlbBI
         6yaqpqyaqx8Q6+GJU+/Hea+cJYVgKkJCDQ8ViTpM7FHUyy0HnwwToNx2JBOkbYJR6IEa
         TkUxY4zblq0yG9JpPFwo8K8TJkyuEelqKFg5gaYPTOSljkgTYniuBPxJTNU6Y+x7SUn4
         s3/c+ETbMmF7cEHBfukOBMfSC1WDVUMkmNI/xPrznSey1KvC/D1dD0VbaSJUOUuEaZ6J
         AGWuZ+iQCg2BMnr0chCoVrkM+pzq1zhwsLnE32hqMU6JSEQ9Fu+5kN+W/KHDg/zdWcWu
         w4gQ==
X-Gm-Message-State: AG10YOQeyf/MB/M7BjW22YKA+lP+plCXR3yDnv0Ui+BKpJK45ydwG5oMgkKkK32vdmYgZw==
X-Received: by 10.67.12.175 with SMTP id er15mr2607069pad.70.1455287815048;
        Fri, 12 Feb 2016 06:36:55 -0800 (PST)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com. [52.8.89.49])
        by smtp.gmail.com with ESMTPSA id 1sm20015582pfm.10.2016.02.12.06.36.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 12 Feb 2016 06:36:54 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: alex.bennee@linaro.org,
	serge.fdrv@gmail.com,
	rth@twiddle.net,
	qemu-arm@nongnu.org,
	edgar.iglesias@xilinx.com
Subject: [PATCH v1 5/9] target-arm/translate-a64.c: Use extract32 in disas_ldst_reg_imm9
Date: Fri, 12 Feb 2016 15:33:58 +0100
Message-Id: <1455287642-28166-6-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
References: <1455287642-28166-1-git-send-email-edgar.iglesias@gmail.com>
X-TUID: bAR3UGIwESfk

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Use extract32 instead of open coding the bit masking when decoding
is_signed and is_extended. This streamlines the decoding with some
of the other ldst variants.

No functional change.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 target-arm/translate-a64.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
index 7f65aea..bf31f8a 100644
--- a/target-arm/translate-a64.c
+++ b/target-arm/translate-a64.c
@@ -2117,8 +2117,8 @@ static void disas_ldst_reg_imm9(DisasContext *s, uint32_t insn)
             return;
         }
         is_store = (opc == 0);
-        is_signed = opc & (1<<1);
-        is_extended = (size < 3) && (opc & 1);
+        is_signed = extract32(opc, 1, 1);
+        is_extended = (size < 3) && extract32(opc, 0, 1);
     }
 
     switch (idx) {
-- 
1.9.1
