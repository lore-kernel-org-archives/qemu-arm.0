Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp804308ejb;
        Thu, 19 Oct 2023 14:28:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHg2agx/lCa60oeUlbagufGVOZlediiJLwLlBwuOBMdn/O9o2uHhCeVtHX+MWXC3g5kY6kk
X-Received: by 2002:ac8:5c47:0:b0:417:9c40:c606 with SMTP id j7-20020ac85c47000000b004179c40c606mr4096553qtj.4.1697750915212;
        Thu, 19 Oct 2023 14:28:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697750915; cv=none;
        d=google.com; s=arc-20160816;
        b=yQTB1D6C/BJ3UG2kxTJ1zPoCmPOe2kBQQv23IC30uGoBlw3jc2qPtgucVk5TFfj+be
         SmknZnvdfg07YGvPhNcH9MVbnly5/WxqRpOkaLSJ3pjopZ+yx59zkM7m13ko/3/WB7NW
         G+V9leFE+l6CI+QmhrEc4nDQ/ARwoi8+oOJgoNfHKx/6g5Vmi79d9id5zbbP3KmeJ2Gx
         DDBbWnyJdsx7uRLCX2vl5bGIHzglRSTKI6fF7Xw1I4+WfGw0TZI+JiQb57i4r6voxFGg
         3ohcTkNqLyJYjkmQqKvMnaLBlKKfkow/W7QME4jAmx43muajHgoANQnBUQlBigP9/j1Z
         qmqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8cFSDOivNgHcSX8AYNeAVwR9ly4r/Wc+Ax9HhfRkEQg=;
        fh=k5vQ+Ru7LaRGF7GeKQYjxHbbgs3KVlEQtiDNyBPIQcA=;
        b=tWL96+cZd/Nh/Xt+09J9yzj90jl7UIzTfDxpAHiDahSW25yFC0tJHChssMgSaJ7UzM
         vqeKnkj/xRVLAwjJzUuu4yt+VGUFAJsyQbnd58jSnbKUF/FDga1+DnOI5Ruu7FlGZj6B
         rBiPCjlrVCEmqi2z/de2SJLZtnERnqpAMOaGjd3NHzl2RlnC5SxRMOyujCvAA+a7lw3T
         vr15MN+CpvZ/z7g36NGQXzGReUeQHinW58HvWhrEVIaqW4SbfKHLcFA+IV2anTKBDv1E
         C/u9IYKtva5uk6c6FYkb6wZeORWSUowrQfY79TgmXkqTyam/EPg8w9G89ymjLfiYjnW8
         QvMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XcKljRmt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020ac857d0000000b0041983be87b9si259377qta.629.2023.10.19.14.28.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 14:28:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XcKljRmt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtaR3-0007KY-Sa; Thu, 19 Oct 2023 17:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQr-0006q0-D0
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:19:53 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qtaQp-00058V-G2
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 17:19:52 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-40790b0a224so1082255e9.0
 for <qemu-arm@nongnu.org>; Thu, 19 Oct 2023 14:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697750390; x=1698355190; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8cFSDOivNgHcSX8AYNeAVwR9ly4r/Wc+Ax9HhfRkEQg=;
 b=XcKljRmtB2u3/ZGfT6kCgCtsyjNX+rIcWuRmdx54JpRfxhT8cL5tCtKc42R/zcwkcZ
 TePWU9cq/EeAkWH0NP/DznUJnFYQKUoQmjWVZ5/KEUE7W4L1XCZ6Bt2Os+QDhuZP48W9
 quAY7f9skv4DzOVDcgMtk/E6WOjipKBZLmN31NPs+/czeHv8bVv7MrUqho6WTXB/oYM6
 20TjSXYxRl2eabpTcMcKWsEoqvOSd8LgUhjafxiQlpuSowVv3KPzdT8ReQHpcyuxTNnv
 FkVPEiDbZpp9jaEQLAY3155FaEUmuo27PXPlqAkKr3t+xHV0awkFR8aQJiH3OveYbTP/
 LtFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697750390; x=1698355190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8cFSDOivNgHcSX8AYNeAVwR9ly4r/Wc+Ax9HhfRkEQg=;
 b=vjCWzy1S6axlg2TaEkiORrF63gKvcZDIc39sFgLLUBe1NrRwxODh++bQ9Uv6tMBKrX
 Yp0hea9Sv0/LXFwWvj237K5omWF9izb3AXSrZUUnAS+cj7rC9i3w2QiNbKrdr/2hox7B
 uV6OYV4jYiUE8cDHfvnIR2cYPgdyWyI6/XGWbWHjFHKZBCZsc9SAfzghsuNq0gluFXfv
 E0SAbw9Rv1YE1h6B7JUu8p4VnQUi8JKEbS+oQrGiZyujSnxD5vkwU4ZfbnvuW1J0859k
 WYf66gqztyKiJVeAXKWypbavqLpYXGR0Kx9Aoq8dnoqi16V/pOZ+WfvnCnsne/oNRvbR
 8+bg==
X-Gm-Message-State: AOJu0YxNMvB9LUVUm2R0jNjPJ3iGt8fl3unulEIiBR5uib2spkQSQrkh
 jRnwQDpdRz7EscPWYiFSLRacoA==
X-Received: by 2002:a05:600c:4f8d:b0:401:a0b1:aef6 with SMTP id
 n13-20020a05600c4f8d00b00401a0b1aef6mr67528wmq.2.1697750390242; 
 Thu, 19 Oct 2023 14:19:50 -0700 (PDT)
Received: from m1x-phil.lan (176-131-216-177.abo.bbox.fr. [176.131.216.177])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c3b9000b003fee6e170f9sm496411wms.45.2023.10.19.14.19.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Oct 2023 14:19:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 14/46] hw/misc/mips_itu: Make MIPSITUState target agnostic
Date: Thu, 19 Oct 2023 23:17:39 +0200
Message-ID: <20231019211814.30576-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231019211814.30576-1-philmd@linaro.org>
References: <20231019211814.30576-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mLX5h0VhNFq5

When prototyping a heterogenous machine including the ITU,
we get:

  include/hw/misc/mips_itu.h:76:5: error: unknown type name 'MIPSCPU'
      MIPSCPU *cpu0;
      ^

MIPSCPU is declared in the target specific "cpu.h" header,
but we don't want to include it, because "cpu.h" is target
specific and its inclusion taints all files including
"mips_itu.h", which become target specific too. We can
however use the 'ArchCPU *' type in the public header.
By keeping the TYPE_MIPS_CPU QOM type check in the link
property declaration, QOM core code will still check the
property is a correct MIPS CPU.

TYPE_MIPS_ITU is still built per-(MIPS)target, but its header
can now be included by other targets.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231009171443.12145-4-philmd@linaro.org>
---
 include/hw/misc/mips_itu.h | 2 +-
 hw/misc/mips_itu.c         | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/misc/mips_itu.h b/include/hw/misc/mips_itu.h
index a413789151..5caed6cc36 100644
--- a/include/hw/misc/mips_itu.h
+++ b/include/hw/misc/mips_itu.h
@@ -73,7 +73,7 @@ struct MIPSITUState {
 
     /* SAAR */
     uint64_t *saar;
-    MIPSCPU *cpu0;
+    ArchCPU *cpu0;
 };
 
 /* Get ITC Configuration Tag memory region. */
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index 0eda302db4..5a83ccc4e8 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -532,7 +532,7 @@ static void mips_itu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
-    env = &s->cpu0->env;
+    env = &MIPS_CPU(s->cpu0)->env;
     if (env->saarp) {
         s->saar = env->CP0_SAAR;
     }
@@ -563,7 +563,7 @@ static Property mips_itu_properties[] = {
                       ITC_FIFO_NUM_MAX),
     DEFINE_PROP_UINT32("num-semaphores", MIPSITUState, num_semaphores,
                       ITC_SEMAPH_NUM_MAX),
-    DEFINE_PROP_LINK("cpu[0]", MIPSITUState, cpu0, TYPE_MIPS_CPU, MIPSCPU *),
+    DEFINE_PROP_LINK("cpu[0]", MIPSITUState, cpu0, TYPE_MIPS_CPU, ArchCPU *),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.41.0

