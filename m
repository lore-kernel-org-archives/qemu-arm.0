Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp1867945lfk;
        Thu, 3 Feb 2022 06:02:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxSnHLLj0+DKWmMW5WxEXPm4DYByhFNCpgYiMoeGH3qdyat+TXbwRHUagDgGY33vEFapKF5
X-Received: by 2002:a81:2514:: with SMTP id l20mr4457695ywl.42.1643896953013;
        Thu, 03 Feb 2022 06:02:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643896953; cv=none;
        d=google.com; s=arc-20160816;
        b=YCA7rsSdsE5ZWbqqBn5Sg2QCPSTs8cpWglsA+XMAR9cW2OMHgJdCVfhCc901EJNvuD
         VEZ5sm+0AtMF7seMFTYy/L943HDVILZO4fjkDsLMZoiF1uBjS6CJwBIGuHRm6FnT3fNB
         tN4mWKRMvRi3jkO1iIP95NCbktTsEYNEyOLbTr7hOAkjPy1jpKiYVb+B2SBaFO3NYDJ+
         rdEcyBVnddMgyYxSFKY6xTSBAZ/lBEa8ELsAx1qXDQ3p1oX6jdvDGKp//JC8cSYzbmR/
         yC80KLi5P5LjR6WkiwhrYcNZFmLr7vac+rbk/Ca73NDf5PbbbgQgFN2+ropAvsI4iqEX
         +bVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3ZNUiAySl4QHUk7r85C3SWvIgh7eOoH0ooxzc6GZ4q0=;
        b=iOBEKYPwZVyqrhVKU410KNjfNKgxVCBp5Xd3lK3CcKH8c8caNqp/sKMJGU9crKe72x
         CYIhAlDuw729UesP+3/zMs2wE0RMfZ74oASXUq41sb7EyT2H5bV8lqsXwC9jqRyYWEkN
         mtk/KzOmuaciGgsSRSg8T9k/h5JfGBjJQkyVxJvqg6XjGxeFEq8W+TXS1JALYImXliQL
         W2Q94XjwHcBTh5Gk8CLDxkU5NL9YH+e2VCNkeTCenygen8gzX+K8LvnIliQ/vpJphpn3
         SWtFRF5ZncnZXuIddAA57qGaZcYgtWNnILQeNKnOELYlD1Fh64eEy6RdNSRInlPa/x2/
         DSIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=HhNJAoZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u136si1434751ywf.235.2022.02.03.06.02.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Feb 2022 06:02:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=HhNJAoZA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nFcgx-0005NS-AP
	for alex.bennee@linaro.org; Thu, 03 Feb 2022 09:02:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgG-0005JR-Qq; Thu, 03 Feb 2022 09:01:48 -0500
Received: from [2a00:1450:4864:20::12c] (port=41513
 helo=mail-lf1-x12c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgD-0000PY-Pc; Thu, 03 Feb 2022 09:01:48 -0500
Received: by mail-lf1-x12c.google.com with SMTP id f10so6143948lfu.8;
 Thu, 03 Feb 2022 06:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3ZNUiAySl4QHUk7r85C3SWvIgh7eOoH0ooxzc6GZ4q0=;
 b=HhNJAoZAmksxWTYM+YQ1ZUc4o5aA1yNaxwDATXLXQLPSAE15YwLkaEksdYLwGPHSI0
 T+Rrkj5Q64CC6j/twY8qlnzyk44iHK59jbgG+d6t5UPy8mtFUM8VqvAp5FYK8w1XhrUS
 BcC01oDfjZPvzjLdYjryMmZOQmyFzykl9b+PbGAcxznUnY5BFasFYpnOTyFJxaDiSiEg
 BJ2t2jvpgplNVGZGvYulyTIpb5Q6npmj6MtNNmot78zzqFRESdGFjeC9Q8KfXKdyeT5F
 hX3TTF3e8jh4d2YsJSP9IXoAg9d4iac+GuKW9YQJVLCJl77yMW7VPLdezfHAkOlhqC19
 FYpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ZNUiAySl4QHUk7r85C3SWvIgh7eOoH0ooxzc6GZ4q0=;
 b=xFpeeD80i+fj2EANo14ilxiDfbKV495tZI1J5/YOCNUR5GPLCsMrBAw8NVIzGfRC1Y
 BGqdPsuj0xMpVgrFHqL8tPpcpbAJ4Y+6bl8XS+JC6/JXxqLppQf93DVR2+JLBaZZExg7
 FYWn77Ax59wsJVHFiF6z3YxJGp0aMYRI1UKIjukw+pyl5R8wjknvRNLCFRfU+JWIJfBS
 KIef3vVKRxUA3FiW8kzDY6yyXmkXsMaLca5ktINYyj2aaGePRzM/OigpWFAznGn2uIa5
 ezwPvGnN8rw5CAWsNuSLbfKyOQjPtnlZSOokMZEHycRTGcJ9pof6pSz4YNKQoVneYmtj
 XM2w==
X-Gm-Message-State: AOAM530t5DAxqllVTGHCJYLqNmKEOVhDdtNekFbNuB3PDTZ8/SGngsMQ
 DAg1lEE6bGYPYyuwdAY/gD+dic3GEiQq6w==
X-Received: by 2002:a19:7604:: with SMTP id c4mr26017775lff.65.1643896903483; 
 Thu, 03 Feb 2022 06:01:43 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id v15sm4806522lfd.216.2022.02.03.06.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 06:01:43 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] hw/arm/xlnx-zynqmp: Add an unimplemented SERDES area
Date: Thu,  3 Feb 2022 15:01:36 +0100
Message-Id: <20220203140141.310870-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203140141.310870-1-edgar.iglesias@gmail.com>
References: <20220203140141.310870-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /ecHa9eA3S6o

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add an unimplemented SERDES (Serializer/Deserializer) area.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/arm/xlnx-zynqmp.h | 2 +-
 hw/arm/xlnx-zynqmp.c         | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 062e637fe4..99ceb8a609 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -84,7 +84,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 /*
  * Unimplemented mmio regions needed to boot some images.
  */
-#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
+#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 2
 
 struct XlnxZynqMPState {
     /*< private >*/
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 17305fe7b7..3dae51a786 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -51,6 +51,10 @@
 #define QSPI_IRQ            15
 #define QSPI_DMA_ADDR       0xff0f0800
 
+/* Serializer/Deserializer.  */
+#define SERDES_ADDR         0xfd400000
+#define SERDES_SIZE         0x20000
+
 #define DP_ADDR             0xfd4a0000
 #define DP_IRQ              113
 
@@ -284,6 +288,7 @@ static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
         hwaddr size;
     } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
         { .name = "apu", APU_ADDR, APU_SIZE },
+        { .name = "serdes", SERDES_ADDR, SERDES_SIZE },
     };
     unsigned int nr;
 
-- 
2.25.1

