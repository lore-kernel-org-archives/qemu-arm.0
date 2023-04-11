Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp186890ejc;
        Mon, 10 Apr 2023 18:15:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350YnxAMBL+1pNm1GYQ4Cf3FbFue/Fm56d58czXFw3ir1DBwIfv2RG4RZCxFAY6eWB9hmgiEN
X-Received: by 2002:a05:622a:170b:b0:3bf:c371:789e with SMTP id h11-20020a05622a170b00b003bfc371789emr1727033qtk.14.1681175727521;
        Mon, 10 Apr 2023 18:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681175727; cv=none;
        d=google.com; s=arc-20160816;
        b=RAZ93tAQ1tj1lvX/tiMWRPK8D7/SeoAzbMHqi3RCExlEgVfomo1yrZ94o8FdXpYOZ1
         i4w9PmVd0lLQj50Yvny78kZRqaP9vPGUbprT5ELJY7Dm7Z4CDRgfEYnDKrkrLTRzCMM0
         3QroRWlMw5bezzllNsUA6B2F4K/PnIWkUMT7JExaqdOaW7nDUcSkI2J+jvuubwdgwFII
         cBIVINvusq9SpI2WPNM6vrIIfAyyxavrS8kLpXKgv9N99sXLUCyXWEAm3Ew3LyZqDYaS
         RvpTbBE/1b9OLxZQIKauBX61yS2WA6B0OtAphZLh5SLafVAGpXr5QlwW6TlUfmKP//Jx
         zp7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7nPBJFUV0lX54ZMpUCSnQezprz128nst/H5IYSZCsHw=;
        b=k6XylYbwEWjCDChHejnZV2khYIpwqY2f1ZAcS5Qf4H8bjggtUdesxyTFYue+1TAo/y
         5jPeV19HuUlwkoNmT1qUNFSwKmc08vKPQHuBplrHlvLWdVt6YINGz8cuIjfOQtb+oCsb
         zK5mWZAy8xaq2fctkXkRi9N1unVKO5bYQ3JhFhQqUq4KB4XHi9GBcO+YVFVXSukZbtp8
         6Yj0la8VChCxuic99WeoC4SjMqzvAcIpQRKoKybZXUFz7NcteVzwD/RUwbuA1Gw1XdCq
         Y912HTHE0MAL2kfAtT8nvoQ8yrJpnP9xBfyBlPL75VEbDNAU1B0HIevbMsk9nm6GBzf+
         Wpew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xPcdzdZ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7-20020ac87d07000000b003e38f0d537bsi8211039qtb.184.2023.04.10.18.15.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Apr 2023 18:15:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xPcdzdZ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pm2Wu-0006Hg-0m; Mon, 10 Apr 2023 21:10:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wh-0005QM-Vv
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:10:28 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pm2Wa-0001vn-VL
 for qemu-arm@nongnu.org; Mon, 10 Apr 2023 21:10:27 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso293324pjc.1
 for <qemu-arm@nongnu.org>; Mon, 10 Apr 2023 18:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681175420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7nPBJFUV0lX54ZMpUCSnQezprz128nst/H5IYSZCsHw=;
 b=xPcdzdZ9UkQ78ZaG46ssh58/8aRUmtMJq4wJokaY1I7LTj/DFzQQ6NWwmwM3je1Qn7
 SlqADWZM7IYl2uGAvZLZWzqEO3kAfymOeQAYnSnZaLmvSTMV4E306XhJncC8wrPqoOda
 mwSecMVE78syy4gvMjiCt1E4oIdg6Aspdk/kMN1/sQrQ14CC/FuOgZIwxzVtrUFgjbRL
 4SeRx2GOUIxDpJQNqo58/tdONyCCbZhXyyRTePEfF2EEkgXcmHEAuh2k5O35Zg67unyh
 exIY9U1po5DNzK8syyITKoTVUzWA3gN2B0RoIbom7HqC9suXBdaiHNLXi4py3uVcXeKg
 Jipw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681175420;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7nPBJFUV0lX54ZMpUCSnQezprz128nst/H5IYSZCsHw=;
 b=t6LY0i+w2eS36jBzdyFN79U3PV5eAV/Hi1BfRmmcBQiR8xPExyNPCt8EigowORNE1h
 ojC2k62bII3qTm/PhsVoQOl5VuacKOxz3Lh5dY85NpQVKIwlwze3wq44nigNrkDtxvxs
 hstDv3zWzJWMHG13o88awxxXShH0s3g6xxvfySSuQnz3hxZqcBzae8bfQgr8H99Lrxol
 wHcm6D3t4uIxFkUW+l5FVU7k7NZjjQNIMa4D8eUsHt3qOhTLCrQylJ9ouSVMn9ej0s4b
 /1GsLhCHeqccJPAekXH8V+KqBpbatcOj3rNH19uXPFgzY6mm2SRjJhAF4EFliMhSPi4I
 B/uw==
X-Gm-Message-State: AAQBX9f+js3BovrR76Zl7bwM/2cfNKpIBJi6aZ4KXwIl/7bQI+9wP8m5
 T2u5AwIr4UTE93ZC5uKGVK+7sA==
X-Received: by 2002:a17:90b:4c8e:b0:231:24c1:8028 with SMTP id
 my14-20020a17090b4c8e00b0023124c18028mr1627545pjb.29.1681175420066; 
 Mon, 10 Apr 2023 18:10:20 -0700 (PDT)
Received: from stoup.WiFi.IPv4InfoBelow
 (h146.238.133.40.static.ip.windstream.net. [40.133.238.146])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a1709028a8c00b001a63deeb5e2sm2652130plo.92.2023.04.10.18.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 18:10:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
Subject: [PATCH v2 51/54] tcg/ppc: Remove unused constraints A, B, C, D
Date: Mon, 10 Apr 2023 18:05:09 -0700
Message-Id: <20230411010512.5375-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230411010512.5375-1-richard.henderson@linaro.org>
References: <20230411010512.5375-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nXw+5zW7x7jD

These constraints have not been used for quite some time.

Fixes: 77b73de67632 ("Use rem/div[u]_i32 drop div[u]2_i32")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/ppc/tcg-target-con-str.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tcg/ppc/tcg-target-con-str.h b/tcg/ppc/tcg-target-con-str.h
index f3bf030bc3..9dcbc3df50 100644
--- a/tcg/ppc/tcg-target-con-str.h
+++ b/tcg/ppc/tcg-target-con-str.h
@@ -10,10 +10,6 @@
  */
 REGS('r', ALL_GENERAL_REGS)
 REGS('v', ALL_VECTOR_REGS)
-REGS('A', 1u << TCG_REG_R3)
-REGS('B', 1u << TCG_REG_R4)
-REGS('C', 1u << TCG_REG_R5)
-REGS('D', 1u << TCG_REG_R6)
 
 /*
  * Define constraint letters for constants:
-- 
2.34.1

