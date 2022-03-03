Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1011483lfo;
        Thu, 3 Mar 2022 12:28:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxD+d9AYmbdIBglKLDlzVrZlmVU1iCe3DY+zEQaaHq1nLrWZcsJpZtgBYYps3kGmUb0mOiI
X-Received: by 2002:a5b:ec1:0:b0:624:64d2:560e with SMTP id a1-20020a5b0ec1000000b0062464d2560emr36168692ybs.351.1646339280561;
        Thu, 03 Mar 2022 12:28:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646339280; cv=none;
        d=google.com; s=arc-20160816;
        b=GtCwX/BB7NtloWaAPEpCcicxi+kaDtXlBdO9GRjNlMXdQh9Dq/inEoBv96Jt1jK/48
         MCDsEC9g+6t4zGt+jcYz8VuihrSDhksQ5A4NN7Sql0BUqJsr7EU66XeiU7ompVtdnl5a
         CYMpqoDLbbYkdpckQypY80y9fiF8yUg5tVEOkfcdzIu7rGlTdky5vUhjUF2vWUu6hvk2
         sGGCVykms61TbDVqXb93yqP7VBB4NCwUAkYAyKLWA8tvi9f5k6yqlwv5ioWpwM2WC6Fm
         HUS+Bhy5pfTXLoFWPGkZl3By030PyZYeO2CnI8Y78f/X/yhEwT0y5S89XOgdaXeG35jH
         PgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xKReK7BLUtScKzpLEmLwjn4Pt9dG6hDPDWKrdARJTHU=;
        b=OdSuHnzEGd4ijGzynf7Hp1BnfAUjlnq6k3nxnWJd7X6Z81ldMl0iqeCKICEsY+RQvg
         S0iS72D5XbRriI3rIplSZD6qu+v6DfCbEkg/dUGRQFFJ0JjoA8ha2Jm8mSKQP5aOzDvb
         ZBK6kH2g+SXc8P77kF+VvVAZy9dMDk9kVi7vaW5p1nTg3ZhWZBoU+KIi5d91hIiqVGBn
         MbHTZyrC9pZYLZGcIafwVo2mewTesQS/h6k4Vo7WRl0QqO8Bqa3RNmDy/SH8sZ/+aXlZ
         ELXfnwRO5EXLtodcbkVfXZWUVBXIfpKImyoyzpRfaDeCCGhV+CRFVql7rXYjxIKmZUtd
         AuRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FxxjCgcD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e22-20020a813716000000b002dc3747fceasi2081791ywa.538.2022.03.03.12.28.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Mar 2022 12:28:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FxxjCgcD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nPs3L-0002cy-UJ
	for alex.bennee@linaro.org; Thu, 03 Mar 2022 15:27:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzM-0001wW-4F
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 15:23:52 -0500
Received: from [2a00:1450:4864:20::336] (port=37884
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPrzK-0001ac-9s
 for qemu-arm@nongnu.org; Thu, 03 Mar 2022 15:23:51 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 q7-20020a7bce87000000b00382255f4ca9so5501670wmj.2
 for <qemu-arm@nongnu.org>; Thu, 03 Mar 2022 12:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xKReK7BLUtScKzpLEmLwjn4Pt9dG6hDPDWKrdARJTHU=;
 b=FxxjCgcDHZwQsUyp6QeRLD3H+nQyw1V2wfkP202duNc+5jC56dwCux1o2tsoyHqFP7
 oDtQa3GuiUhQsR8HGGmH5ZJkcGDegzl2LQPOzpiPU99FFJUVUtlSGtks+ojYWlwkEmt0
 VUZLf9veJ4sWobkZp44Vv0Lg+w3j2+fDpRLgLrwtfti2f+oW1HNYV+x4YS48fUL33hA3
 D5lc1Xt7jZdtsBFfBU0X7vzjlHekIlOmRB+ozOduLBZmWPvPKtgZmGObMCveGqUUgROL
 yqje+Qe35Oh37tEi7nYGVY3cHAvsuNmDRx+bpptrF17XLSzpfl4OUGFYAZspTK1+QPoO
 t6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xKReK7BLUtScKzpLEmLwjn4Pt9dG6hDPDWKrdARJTHU=;
 b=rd60rFZGwF8swciZPTds4rfNoAlqaTfGsZqZhMM3VLiY/HbudajmtNaV34VDtzR87s
 8RZ/ekjyxsNx2KcYLhzk5Cl91IY5VmOorAignVtygZmM0jcqQH5bAvHDb8c4chKjIek3
 9CpO6OFckOiMJPLA6ukFN2MWbekMCk7eUIpaXDAw8642sl6X7WdDIxiUraSP88R1gB4/
 4SbO0lHb4ED3WgCNJaTtBeJq+Z154kigFMk8mQ8EOYYXEpgXOLm3lmKO01RyGhovMsRK
 8INBrzeR86LRIF5FUTy28BEOfAIAzQNKBemLI3A7/2NS6ZOt4TTYhPTQdDYfqoBUV6U9
 1WDw==
X-Gm-Message-State: AOAM530y3s9DIl7mr/mKalxyJoKtXj3nKZqla3SiuANTdoj8DD0kxdLm
 rRRAZOIksHBNw6YufF8cqz+Vy7H8t/GkLA==
X-Received: by 2002:a05:600c:3c98:b0:37f:2f14:7be7 with SMTP id
 bg24-20020a05600c3c9800b0037f2f147be7mr5143205wmb.180.1646339028719; 
 Thu, 03 Mar 2022 12:23:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t5-20020adff045000000b001f0684c3404sm517060wro.11.2022.03.03.12.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:23:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw/intc/arm_gicv3_cpuif: Fix register names in ICV_HPPIR
 read trace event
Date: Thu,  3 Mar 2022 20:23:41 +0000
Message-Id: <20220303202341.2232284-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303202341.2232284-1-peter.maydell@linaro.org>
References: <20220303202341.2232284-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gKxv/70n+SQA

The trace_gicv3_icv_hppir_read trace event takes an integer value
which it uses to form the register name, which should be either
ICV_HPPIR0 or ICV_HPPIR1.  We were passing in the 'grp' variable for
this, but that is either GICV3_G0 or GICV3_G1NS, which happen to be 0
and 2, which meant that tracing for the ICV_HPPIR1 register was
incorrectly printed as ICV_HPPIR2.

Use the same approach we do for all the other similar trace events,
and pass in 'ri->crm == 8 ?  0 : 1', deriving the index value
directly from the ARMCPRegInfo struct.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_cpuif.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
index d7e03d0cab8..1a3d440a54b 100644
--- a/hw/intc/arm_gicv3_cpuif.c
+++ b/hw/intc/arm_gicv3_cpuif.c
@@ -612,7 +612,8 @@ static uint64_t icv_hppir_read(CPUARMState *env, const ARMCPRegInfo *ri)
         }
     }
 
-    trace_gicv3_icv_hppir_read(grp, gicv3_redist_affid(cs), value);
+    trace_gicv3_icv_hppir_read(ri->crm == 8 ? 0 : 1,
+                               gicv3_redist_affid(cs), value);
     return value;
 }
 
-- 
2.25.1

