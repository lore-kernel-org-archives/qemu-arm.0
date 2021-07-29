Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5543536lfc;
        Thu, 29 Jul 2021 04:25:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMM0WqvIY6CZa+2tm3unQTVfH+68pFxI8UOw7uF4rNBzpldL3l4070yEtisJEaFpso1ncI
X-Received: by 2002:a05:622a:181e:: with SMTP id t30mr622154qtc.342.1627557899962;
        Thu, 29 Jul 2021 04:24:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627557899; cv=none;
        d=google.com; s=arc-20160816;
        b=rk2FNU+6lNEK6PpL4cV2ucRQHZXk4zj3ohW1Yo+oyoZXrcR/M4q3H5X2cCfNYdYifV
         wipinuheRowlqr0GSY7mS2Dk/Wysrnz4kqBjuYecComB2p1J8HUYVUoTH4VdR/3iZrWY
         LFPCPbG0mejWe8Tcx4PsEK8nDz5rKeE9NLcG9m29fxvCK9fq1yGEaggrBXxA2tvJ7sP/
         Y3XDDWlUtOIZlolQoASOCvUj3Ebauc0UWZUF3PdlVQKpMYvj+3aIxNzDIiXfrWrZUWwn
         sadJIWH954QW5wD0HcAuBtfKuCPGryAK2JewUJ6yYy5S6FwNAyRET2Vo6lbR7jNCmFsc
         VFUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=87OSQfI+t8J/2NRNU5SXGP9uuTxhBzV2bH7+CgjkZBI=;
        b=PCxqqSMQ1W9WPkkUO1DNVmQumOul8VxZxjv4uLJA6fXcAtvZfOnDrHyfnTJ/3cY0Ou
         DSs3MiuP3sATwKv43gASEAHQQMAt8FCZzqQir5nu/uT9WGnxZHIAEOVYcMw2vrWn/Wze
         tbhvh3xR9RDuhIKbefb4ejiI1JZB+jHQxD8m/lBEGl3Nd39I9viCHlFlBym4voRBcq9G
         xbBR9firGmLz0nva0OL8qnDlTK3aJN4HMJ/s03+vux78olEzAwiV/dyAaX5ujWzUN9VA
         FIYQHYfv5v4rNZeGJOcxGkv3aWSEXkmSXw6n/sJN66HLQSi38Tlq9gewUxbWlQANzc9N
         pJ5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x+wWvPZV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m7si1764270qtp.84.2021.07.29.04.24.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Jul 2021 04:24:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x+wWvPZV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m949r-00031R-1J
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 07:24:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m9411-0000pM-JU
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m940j-0001CH-NT
 for qemu-arm@nongnu.org; Thu, 29 Jul 2021 07:15:51 -0400
Received: by mail-wr1-x433.google.com with SMTP id d8so6456058wrm.4
 for <qemu-arm@nongnu.org>; Thu, 29 Jul 2021 04:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=87OSQfI+t8J/2NRNU5SXGP9uuTxhBzV2bH7+CgjkZBI=;
 b=x+wWvPZVN085cj9+J/UYXuN7EbyetXEivfUIiM/yMEz4Yw2t5oLGgNxqygeKA+k7g9
 v0nHSpuvKXlBkvsl8ovFXogx1WwUXPcOPkyp4C/2ThQ/zVlEBjPJ8MTM5P46iCaCpc3v
 0czUwcfw8edILVPfvluUhSgp/guPZiKJ6dvpcJNKWD1zhnizlbTgRetszmnHDl4S4HPS
 q84Dii64JKzDHTK42iBQIrbqwMynCsxuH+vDUoxgW0BTYTw9EDGIVbvI2qcyDyutHAp8
 I+4oswP+io9Ju96dufQLv+HaZlT2ij8A1isB5ZIm8/+2hD6tB7E+mgf3t0lOfrpnguhp
 OqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=87OSQfI+t8J/2NRNU5SXGP9uuTxhBzV2bH7+CgjkZBI=;
 b=Tsw7WhfYHKkl4y/tjjpi3xVXiHYoXQSml2eexLNdySSZK+6lW6DKH+wgQmaJflQ53l
 2ghTv2/0tialEx72LpYI7uhOk7uY48EpGzu4d/1jARCOHfXl3awAIwPA7LXRM31yE5gT
 BY/aYimH1FEVOCujPmxT7E+NvOK6s5adS0czqi8O6p+Wtp9IhybwkM8jE2yLinHdLhae
 AlQ8SM5bVTigkzEWaDCPoJt01LHbQsIkepMWSgOZPxNPXoVC/VsCxhNtabDSdOd9+Wxq
 bP46XKOgSwNVyNf9+cTJ6AMXd+Jm4uru5jE2w2cHCCTDHpt/JdsqJFU6tUpQS0N8RWYh
 t98A==
X-Gm-Message-State: AOAM530LkZYAsAiEqAWuNJcZofDm89rn/4f7MloHa/Tp4OfbBT2LMHPX
 0NX6H0A1OpkkKONBQSKhd/ZGcvkh4oxXvA==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr4208559wru.351.1627557331276; 
 Thu, 29 Jul 2021 04:15:31 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j140sm3037829wmj.37.2021.07.29.04.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 04:15:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 20/53] target/arm: Move 'x' and 'a' bit definitions
 into vmlaldav formats
Date: Thu, 29 Jul 2021 12:14:39 +0100
Message-Id: <20210729111512.16541-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729111512.16541-1-peter.maydell@linaro.org>
References: <20210729111512.16541-1-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +1v5qbHV1rKC

All the users of the vmlaldav formats have an 'x bit in bit 12 and an
'a' bit in bit 5; move these to the format rather than specifying them
in each insn pattern.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/mve.decode | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/arm/mve.decode b/target/arm/mve.decode
index eb26b103d12..bdcd660aaf4 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -305,19 +305,19 @@ VDUP             1110 1110 1 0 10 ... 0 .... 1011 . 0 0 1 0000 @vdup size=2
 
 &vmlaldav rdahi rdalo size qn qm x a
 
-@vmlaldav        .... .... . ... ... . ... . .... .... qm:3 . \
+@vmlaldav        .... .... . ... ... . ... x:1 .... .. a:1 . qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=%size_16 &vmlaldav
-@vmlaldav_nosz   .... .... . ... ... . ... . .... .... qm:3 . \
+@vmlaldav_nosz   .... .... . ... ... . ... x:1 .... .. a:1 . qm:3 . \
                  qn=%qn rdahi=%rdahi rdalo=%rdalo size=0 &vmlaldav
-VMLALDAV_S       1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
-VMLALDAV_U       1111 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 0 @vmlaldav
+VMLALDAV_S       1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
+VMLALDAV_U       1111 1110 1 ... ... . ... . 1110 . 0 . 0 ... 0 @vmlaldav
 
-VMLSLDAV         1110 1110 1 ... ... . ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav
+VMLSLDAV         1110 1110 1 ... ... . ... . 1110 . 0 . 0 ... 1 @vmlaldav
 
-VRMLALDAVH_S     1110 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
-VRMLALDAVH_U     1111 1110 1 ... ... 0 ... x:1 1111 . 0 a:1 0 ... 0 @vmlaldav_nosz
+VRMLALDAVH_S     1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
+VRMLALDAVH_U     1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 
-VRMLSLDAVH       1111 1110 1 ... ... 0 ... x:1 1110 . 0 a:1 0 ... 1 @vmlaldav_nosz
+VRMLSLDAVH       1111 1110 1 ... ... 0 ... . 1110 . 0 . 0 ... 1 @vmlaldav_nosz
 
 # Scalar operations
 
-- 
2.20.1

