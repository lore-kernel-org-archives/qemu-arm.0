Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1284667lfm;
        Wed, 17 Jun 2020 22:09:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyGjrGZbfv9+8BmwGgFtVrEsD/uw7F3MZaJWS40NDAtFfelrC6s61+Pkl3LQUQxr8kxZx/t
X-Received: by 2002:a25:cad5:: with SMTP id a204mr3904506ybg.350.1592456961623;
        Wed, 17 Jun 2020 22:09:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592456961; cv=none;
        d=google.com; s=arc-20160816;
        b=JgTpJV8v2rPKJa1oR9ftMgruWQtr11gZBqE6E9gfoLZTM5xC2j8n6UA6l9IIeRp9fP
         WKPn9rPHeyZrva5oPOAdOzbZsPS/plfHHqrAMGNeJmF3I5wEzoLrJfPOV3E2GpBTE2oA
         Nh7x8/rpBteuimQloCS19xoW3egJLAholiW6QJyFrIEFVgfGYW/2Jeae6RoC2nIF2pIH
         JwakBay9hEyMlRzBqyNnBQq8Akv3oMDiamJnV+xKtXj9CNC2amfZGjT3b877rWxtnHwq
         qbJdpErUei8UBz24HlvAMVpy6PZ1mP82cN+Ell2xzRksqW06cie3tRLHdu5auW7V9wda
         nC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=JnIvscga/41MHmopAUGND2DFOQvZJOfzYshgRIbja6w=;
        b=tCifj2ZianJlASJTv7f4MqpVfMN7E1QEQm0HjIAPX7Z1sUBRVE+IvRADHA/ZxIe1vd
         3auvbyBzqoScLbmSM85baMHx5sBSeY6V/9ehNfFsRm0jwTFCS4MHqYwMXw2gS9Y24MWB
         UTKLJ+MiT+oBUuQ018A5Dn7vK2sSTfcJ9UFKsDFEAthaPFM/lDtUJDnHnhRE8iv5PyhO
         yN5tESSehzugUIORfOIYWlajWLUu9NngcrRwZKizeRd/rLYwK41VcWGz+JDun6QgUGHL
         xfzgk/Q91fCEqW4yKD4SU+MW7zr3TfRsz5Faub+Eb+IA0YmTwJdt0PaGCc9MwGxDhY5m
         rcVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MC91PRMo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18si1569843ybu.365.2020.06.17.22.09.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:09:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MC91PRMo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmng-0000Bz-R6
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEz-0007A0-FI
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:33:29 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:40557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jlmEx-0003fR-Qh
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 00:33:29 -0400
Received: by mail-pf1-x444.google.com with SMTP id s23so2195596pfh.7
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 21:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JnIvscga/41MHmopAUGND2DFOQvZJOfzYshgRIbja6w=;
 b=MC91PRMo3aGGAYJcXbt+4cffLSLpTEuWhVKiM4V9z7VvbS2MOB4FXVk8WCcy+pB07N
 f9nGmsCvy0xcDtjEC5sELLT5nc/1h4GhAucji0+48IuvT3O4atRA3dNJfLQ7zX1klFqa
 5wMvAEZHLF9VPGCNKbMLj1vwzwuaalXa9BV/9jjOT6Dyx1QYzjMTT7dw+A0FSFumowWf
 X/4nvtVpxcPnPX9IUey00vhJL5izKjw1cH5fuVbp4NUFCgkkgGs9G0OhIOLAuD93XOvR
 AMdm8vO6IPIQ1Rq4Rgzm9XNy/9HyK+1HvgduDvQHldquVg4ppHaaxEBlGqtSZsVgp6MD
 V7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JnIvscga/41MHmopAUGND2DFOQvZJOfzYshgRIbja6w=;
 b=JQN8zbnecy5/Po8giXCbb7SH+31iNFLQNAVSl7flZmo7sc3q+Simxd8nKuXzFNAmHy
 iEmAoPIfMjw/RJFR/7sCNYFFO3VXYJ8w0Dg0u1SVczqAOqm7/5+1W3tyOJNUeG5MzdHP
 ZGX/2NoM1JMywWuVNzB9lqO3dJSBNP6Jv/0fr2pJ+aBDAk6tqN9D3E77NUP/L9vGf+VD
 8/AgghgukvtcPsfd0Pa/IeKJpjTQiFLFDmiHFXX/7GT8REb7RDjUf6CDz1i2aKXT1rC7
 ZTiIS0NuBAdE+Vi6EjVyxdq+hOeO9rZn6eKmmJejcdg3lf09lQ30QvzMH3spx8L9OYMe
 q9XQ==
X-Gm-Message-State: AOAM530k+KrgtbNNTUHOSW5FMmxy7NgXjxhg77aiXgTrJUNafxSRWBCf
 oY41vBMSo29FLu38TqrPF72gPA==
X-Received: by 2002:aa7:84cc:: with SMTP id x12mr1884519pfn.235.1592454806628; 
 Wed, 17 Jun 2020 21:33:26 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id q22sm1288212pfg.192.2020.06.17.21.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2020 21:33:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 093/100] softfloat: Add float16_is_normal
Date: Wed, 17 Jun 2020 21:26:37 -0700
Message-Id: <20200618042644.1685561-94-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618042644.1685561-1-richard.henderson@linaro.org>
References: <20200618042644.1685561-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SWz2bXX+wIVm

From: Stephen Long <steplong@quicinc.com>

This float16 predicate was missing from the normal set.

Signed-off-by: Stephen Long <steplong@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/fpu/softfloat.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index 16ca697a73..cd1fcfbf0c 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -264,6 +264,11 @@ static inline bool float16_is_zero_or_denormal(float16 a)
     return (float16_val(a) & 0x7c00) == 0;
 }
 
+static inline bool float16_is_normal(float16 a)
+{
+    return (((float16_val(a) >> 10) + 1) & 0x1f) >= 2;
+}
+
 static inline float16 float16_abs(float16 a)
 {
     /* Note that abs does *not* handle NaN specially, nor does
-- 
2.25.1

