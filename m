Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp978414lfo;
        Sun, 6 Mar 2022 11:40:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKfAmVF7Vw6t+x8OtIFT/qBvguFZzTi8fLBF9r27b+yXnZL3FLlwWY0SSdCv5uCcxL1DHo
X-Received: by 2002:a25:d782:0:b0:628:942b:3815 with SMTP id o124-20020a25d782000000b00628942b3815mr5956540ybg.393.1646595640004;
        Sun, 06 Mar 2022 11:40:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646595640; cv=none;
        d=google.com; s=arc-20160816;
        b=IXkLiEGLPQ2NHMnePByz+olpijQM81ru6WafJ0tUSb2KoPdXWtFGTo39wtxmMOW85O
         n3N3mgihZ2nldhV5ll6ijQ0Ntay5GZ2sIh/Sv/wg8sDuMy8jseVd/EiKigT4Np4Jv5hN
         4MbatOrM2Dqb3ea7x0Dg5Y9voDKekIoEsTZsUYAMKu/ECfgVQvi2+cQOdZ7XAOXQNAC/
         yQIn01Y0i05EZvyf//DOY2XS+U9WbdZoSklacJtBCK1jj2EM8DA9kJcAC8zqnT9z1AV+
         WtSpyHy//ckHSKlHOhrQUhj0GX+MoympbX6qSzhpC7GwZ1UoZ+f6MSwJi4WxvbA909Qa
         yjYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=USrD4Z+NJk0T9WhASYatV+Fg7sTb+IN7ppCcZuRfV40=;
        b=D8aPhvEzVYzKLbRGkYtlWRilqcCtcFt9lm5kfGgKGNFq6vGGjZ/vp8C0mle3k8B7KN
         N3Mu6hvbOoBiYGF+wHD8vL+JQ3XNebC3FbRU0uqPCgpalNccucSIBA+dPNo5A7fAbFvn
         9fHjdiWRSPdvlG+bFJKNHg40Sf68wbg51HhCKdgnnIMx5mwk1KEunasCoulnIvUSAbT2
         wFzHT+oR7065DfFNVtNxQ9OmjSlbTKnz72+SCHEETHtKXY6sfWJgD5/8xRFFMrBTMDg/
         90xes/HohUXPbbZwZwf65d6VoAjnhGUcHkdyBErJzaXt0wQaVdjIFACCX4hO/SO2/3a+
         aW6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OROnPy9W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k184-20020a25c6c1000000b00628780bdcd2si7959019ybf.371.2022.03.06.11.40.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 06 Mar 2022 11:40:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OROnPy9W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nQwkB-00042U-FT
	for alex.bennee@linaro.org; Sun, 06 Mar 2022 14:40:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQwji-00042E-Qg
 for qemu-arm@nongnu.org; Sun, 06 Mar 2022 14:40:11 -0500
Received: from [2607:f8b0:4864:20::636] (port=39855
 helo=mail-pl1-x636.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nQwjg-0001p7-SW
 for qemu-arm@nongnu.org; Sun, 06 Mar 2022 14:40:10 -0500
Received: by mail-pl1-x636.google.com with SMTP id 9so12020662pll.6
 for <qemu-arm@nongnu.org>; Sun, 06 Mar 2022 11:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=USrD4Z+NJk0T9WhASYatV+Fg7sTb+IN7ppCcZuRfV40=;
 b=OROnPy9Wox0MyUPuijQwGjQsFhmtRqX9twk/Gg603ULU7LCB94jPURuBhvx4PQ1ztm
 rDuoLpR6wCBzJMCy6TFPFLVwd3896rRPtsdlqx4RLJyxacHRuKHSTH6uU5th2glyBYrr
 tl5Qz1NOVV/1hu8FiRzLAo/LH28/B/UbK5hrLwaV4UcsJWsqnJhJl8uQM4aV6QsSXFQG
 HYmbbrL4ON32JbSG2d/nthiukrtup0ulA0rimo3rCO9GNi2EHpAmcpY+GKAa5DVx1TR3
 SPZBG+nBFLD1GQ1krMgvBFaLr6Xk2NVCXQqPmzqHP2cOLfNZJaMFWOE2rGtcDOVRAZEz
 0tcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=USrD4Z+NJk0T9WhASYatV+Fg7sTb+IN7ppCcZuRfV40=;
 b=Jpt9fAL9sxzbdwvmesVd0xsC80Yn6CmCcxf908T10LuaYRTqTfecZkt5btEYBfzefj
 kGIaO/KCEqbysa99RM1XSJn4Aq293VxgDryb2IOqQWuuZfNfxlE1KFyEI5zA3uQ0d+G0
 rabYzVKmvGrNZNNFJgaUaOA32Hb6/XWLuyqStjEdApbXdVcsKDSAYjtX0zv0UdYaz+wE
 9UsTY1j9JflnFxeKNZxyygx5tGqXxJXxpJn/vFe/jYOvdLcQqLPmdmU9APeUi/JWUhTc
 g/R+Awve0ayR8xlWvDJy+8EILhPEG4PvE4aw6dpCqjmA66NhUauWXhfL5kIhietPOUIP
 Uwxw==
X-Gm-Message-State: AOAM531R3EmwDa7P1KV+pU7HanZezO7mJwZKhRWAZ4GSm2ODIyC3FwDg
 oe4GeqEHCAsJgrJdnxtb+GnhZjulQyp7tg==
X-Received: by 2002:a17:903:2442:b0:151:e3e2:cbf9 with SMTP id
 l2-20020a170903244200b00151e3e2cbf9mr3056424pls.115.1646595607135; 
 Sun, 06 Mar 2022 11:40:07 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 on18-20020a17090b1d1200b001b9cfbfbf00sm10060886pjb.40.2022.03.06.11.40.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Mar 2022 11:40:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Fix sve2 ldnt1 and stnt1
Date: Sun,  6 Mar 2022 09:40:03 -1000
Message-Id: <20220306194003.13030-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::636
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ug3Rj7GRH8o8

The order of arguments between ldnt1 and ld1 are swapped in the
architecture, and similarly for stnt1 and st1.  Swap them in the
decode so that we have "m" be the vector operand and "n" be the
general operand.

Fixes: https://gitlab.com/qemu-project/qemu/-/issues/826
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/sve.decode | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/target/arm/sve.decode b/target/arm/sve.decode
index fd96baeb68..91a0873b7c 100644
--- a/target/arm/sve.decode
+++ b/target/arm/sve.decode
@@ -1577,22 +1577,25 @@ USDOT_zzzz      01000100 .. 0 ..... 011 110 ..... .....  @rda_rn_rm
 
 # SVE2 64-bit gather non-temporal load
 #   (scalar plus 64-bit unscaled offsets)
-LDNT1_zprz      1100010 msz:2 00 rm:5 1 u:1 0 pg:3 rn:5 rd:5 \
+# Note that Rm and Rn are swapped, so that the vector and general
+# register arguments match LD1_zprz.
+LDNT1_zprz      1100010 msz:2 00 rn:5 1 u:1 0 pg:3 rm:5 rd:5 \
                 &rprr_gather_load xs=2 esz=3 scale=0 ff=0
 
 # SVE2 32-bit gather non-temporal load (scalar plus 32-bit unscaled offsets)
-LDNT1_zprz      1000010 msz:2 00 rm:5 10 u:1 pg:3 rn:5 rd:5 \
+LDNT1_zprz      1000010 msz:2 00 rn:5 10 u:1 pg:3 rm:5 rd:5 \
                 &rprr_gather_load xs=0 esz=2 scale=0 ff=0
 
 ### SVE2 Memory Store Group
 
 # SVE2 64-bit scatter non-temporal store (vector plus scalar)
-STNT1_zprz      1110010 .. 00 ..... 001 ... ..... ..... \
-                @rprr_scatter_store xs=2 esz=3 scale=0
+# Note the Rm and Rn swap, similar to LDNT1_zprz.
+STNT1_zprz      1110010 msz:2 00 rn:5 001 pg:3 rm:5 rd:5 \
+                &rprr_scatter_store xs=2 esz=3 scale=0
 
 # SVE2 32-bit scatter non-temporal store (vector plus scalar)
-STNT1_zprz      1110010 .. 10 ..... 001 ... ..... ..... \
-                @rprr_scatter_store xs=0 esz=2 scale=0
+STNT1_zprz      1110010 msz:2 10 rn:5 001 pg:3 rm:5 rd:5 \
+                &rprr_scatter_store xs=0 esz=2 scale=0
 
 ### SVE2 Crypto Extensions
 
-- 
2.25.1

