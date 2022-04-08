Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp400021lfq;
        Fri, 8 Apr 2022 07:39:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzh8zSq2itEusuNhGaPJbRL9TjWVIDhda/CwEjVPixAK2BPpD91OTnUslhiwsXlQlPvhP3+
X-Received: by 2002:a25:2043:0:b0:633:6cee:4aee with SMTP id g64-20020a252043000000b006336cee4aeemr13773124ybg.628.1649428783270;
        Fri, 08 Apr 2022 07:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649428783; cv=none;
        d=google.com; s=arc-20160816;
        b=AijcCZu2HjN/Hkg6DJrXa86hefkJh115axF+PagY8VIMRA1XZf7xKkrijls5cbTPim
         OkOjC2He8x+O2K8Iwpmy1FMlwCkTVxuaTS8te3t5DhKBlqf91Q1341wlhRSZxuQC5dvf
         2gL1rOhbRYA0a2lX+n6OpQskXzkHLeK3AuJmf0BhMV6OwNKuPTyZBb+hmcvMkxm9KLWP
         umEE+x6DLnSzDSiqf37N4snezsq6IO+DpQjlj0eZMTmmfU6pBQyDVX/piRO9h17sGw42
         y9Cp4EA05yIgIgETZfIBX2OehrpUuP0l3bR9fkAEbhioppl578Jtvk2DsjHdhW0CGQr7
         Quuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mApTko4JykaeGu3JC9+7iWWX8yyHP0SNoqvMYS15NqA=;
        b=lFpkH8Iwug95hCEpLFwgdFO7MwPoJ+qoHqJR/TPYnyqWl6lx/XCF/OKA4KNAQ1S66m
         VKszaVTY2bRc/DaCN6UKmA2avxEhqXeHmRkb/wXQI3WGepPbYai2p4Vs3SoMv/qTGodg
         z2KseCdeYCd+Fz/LBr+0h3UleSltRkM+qKtVwKs5L4IHgPQyiosVzWvVmMOIqjJhK8S6
         VCyl7IIGNUBSF4wPuV5TWBp3LDc6QemhlIgsNCE1IfNDqW/Tp1P8Kr46zlQsAQTi8HRN
         D61JE3Ct4k7B64qHriOJz5UaTmK2mYYg3KYlFMT2BvOtCg2gMrzlxS+PZfGms2Saqf1t
         qvDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cC4yf2QD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p72-20020a25424b000000b0063da27b1982si574216yba.583.2022.04.08.07.39.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 07:39:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cC4yf2QD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncpm1-0003uK-TP
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 10:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPa-0007Jn-BH
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:30 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:53925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ncpPX-0002SF-3M
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 10:16:29 -0400
Received: by mail-wm1-x329.google.com with SMTP id p189so5572400wmp.3
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 07:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mApTko4JykaeGu3JC9+7iWWX8yyHP0SNoqvMYS15NqA=;
 b=cC4yf2QDCw83BaUa+ixNVYmnc161X1S8M54BY70O/CIqTvUwQpNWgqMuw+OpQO3cQY
 /MHmWwgEF29OPEhW7fMQi0vzQA8v3FMvfM+9m1iqbnrSTrhLb9xHY08Dlc+t4KkdadTb
 eE+1eMknjwoFMwnKTdqj2BngQ771FrV6iydo6A6IIncyjHWwh5vTYx6rvttEy/xsOndA
 +R6TLMCJtOnmUaaNHVIosEkRcU7cVQx1P5/rl9si0V7hgdX4d+fVwaeNEwA8h93tYG8E
 DFUHqcXWzsN0FZiFHdv9GZ/h8h0fS9UFVpErcBgqE9iZK5BFzTPPKQDvXx7fiKG7CX0m
 bliA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mApTko4JykaeGu3JC9+7iWWX8yyHP0SNoqvMYS15NqA=;
 b=StLkgOKqSkcqYQ9eW8rQhLnRH6djflGJKXsekqeRDcQVn9R82XV/y8WM8zDGTYiTpN
 3taLKoWn9gsLrp3iV1dqQVihUNE0ozC3XXNbbPigQjsfFMYMABcqwmZuxVz7owCSY4c+
 oh+Uik40HtltxwM0RyOZfcnPRAK2UO6QKu1F1chjwuXJF+o/AReSkkINZsB4ZJ8oUG0s
 fBjws/XRULicfsBBr0LRj52xcDgJUPNCNMQfgaFa3RD6ooeyxrwGb2helSir8GiFwMmt
 w4STib8uXrD6ytK22pa8EqQeNafzA7rgWfvSEqzQd3LjS3Q7zsSq3+jkpIDuEGBZLyJk
 ftUQ==
X-Gm-Message-State: AOAM533pnWY8QWpgEBj17xGPIQsRi/uiVWoyrskEn1z79tmI1jdf2JJX
 H76owTLgZ0G8D3jgIPHNr2wkFb/E5GEuIw==
X-Received: by 2002:a05:600c:1548:b0:38e:a8df:eced with SMTP id
 f8-20020a05600c154800b0038ea8dfecedmr2427279wmg.9.1649427385540; 
 Fri, 08 Apr 2022 07:16:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 i3-20020adffc03000000b0020616ee90dbsm11498849wrr.42.2022.04.08.07.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 07:16:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 35/41] hw/intc/arm_gicv3_redist: Implement
 gicv3_redist_vinvall()
Date: Fri,  8 Apr 2022 15:15:44 +0100
Message-Id: <20220408141550.1271295-36-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408141550.1271295-1-peter.maydell@linaro.org>
References: <20220408141550.1271295-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Marc Zyngier <maz@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QVqtFxoQrvtJ

Implement the gicv3_redist_vinvall() function (previously left as a
stub).  This function handles the work of a VINVALL command: it must
invalidate any cached information associated with a specific vCPU.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_redist.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/hw/intc/arm_gicv3_redist.c b/hw/intc/arm_gicv3_redist.c
index 9866dd94c60..a586c9ef498 100644
--- a/hw/intc/arm_gicv3_redist.c
+++ b/hw/intc/arm_gicv3_redist.c
@@ -1090,7 +1090,13 @@ void gicv3_redist_mov_vlpi(GICv3CPUState *src, uint64_t src_vptaddr,
 
 void gicv3_redist_vinvall(GICv3CPUState *cs, uint64_t vptaddr)
 {
-    /* The redistributor handling will be added in a subsequent commit */
+    if (!vcpu_resident(cs, vptaddr)) {
+        /* We don't have anything cached if the vCPU isn't resident */
+        return;
+    }
+
+    /* Otherwise, our only cached information is the HPPVLPI info */
+    gicv3_redist_update_vlpi(cs);
 }
 
 void gicv3_redist_inv_vlpi(GICv3CPUState *cs, int irq, uint64_t vptaddr)
-- 
2.25.1

