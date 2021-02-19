Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9097312lfc;
        Fri, 19 Feb 2021 07:13:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyir2E4cPgINppwqzlypn3heS6ScB7z+EnWVzTZwqEH+ENlRKFdAN8WpqShMWRLGWxuEVlL
X-Received: by 2002:a25:bfc1:: with SMTP id q1mr13825604ybm.89.1613747589091;
        Fri, 19 Feb 2021 07:13:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613747589; cv=none;
        d=google.com; s=arc-20160816;
        b=G//xQzgAYQltWQyZRRELMnAxxVJUbZkhBqAkW0vuKV2FeSzb7AdKLDCfvm6dVZsXax
         9mvUfPWeMnXtg3t6PzU4QCwCkNlKAAclGL1f6R8QQ/YnEEM5zQ25hol3EHYQP0nSfWxm
         hpmnL0Z39NyZzYBUIm/0jsGYVpnZS144FcGxdnslQFzA4MD7VkWV50DU40RNtQavW9jx
         lv+19jnIEOk0r6irWEvRYziPNSkglxekKV6InX59dvzABjRoPBAOGyWjuqgaRp3oVgfq
         gIT3EbccFfIdEy0rMdqcCiiNGjZeSDZ4FXb1zEUCq1n5im+g3OHRGaJ31sBZdC3mJEKt
         MylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=HCUP9aHI+eQ+pUUZGOO1dNsG+dvoHvU/fP6me+Xsa6A=;
        b=IBz7EUqS4moxtZkZy9hIbOSJHHhEmv+ju1UuIefR0/RDrhIuGDxYZz5dUntqaHHOJd
         0R5iKH6FwwYp9AGn6Fk+X90jBt/P+tzEU7+NC6oxgGLm+RbabokMDrnipX1v0dHZOCm5
         bP2DtcYtCDd/pabSbKR9u9vmrZLGSoOip3xgM5ITlBYmpP3D4U3wJlLd1zxzKn2w+Bdo
         YV1lUp9GFykZiL6+Rqc4ySWbMYS34i0MrVJsynMWtd2JgfocJi6FR+11Pd+IH46agBbP
         bOFCCYiLlgsFD5hr6hUWT0JpzxTE78wXHnyn0un5x+IJZkm3P5RhvkOyoqeSw5BWc94G
         nlcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hrsv3BiF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b126si9834613ybg.69.2021.02.19.07.13.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:13:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hrsv3BiF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7Su-0002jy-Aw
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD747-0002yG-Eg
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:35 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73V-0003hD-Fl
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 09:47:31 -0500
Received: by mail-wm1-x335.google.com with SMTP id m1so7890271wml.2
 for <qemu-arm@nongnu.org>; Fri, 19 Feb 2021 06:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HCUP9aHI+eQ+pUUZGOO1dNsG+dvoHvU/fP6me+Xsa6A=;
 b=Hrsv3BiFoTZ+BiUKC5Hm/vCDuCK9HBxhaS+Sv4qAxP2d39CkY3gPB1mfYr/o/TtNAS
 HziB0W9yYocJDO16Esiv/HJYp+ZEwLQQvq5m25gJk93Txy8X+InsveqMJHT4nQ4+w0K5
 dq3VC+CE0MmwQxqzvI1DaN+7C7dRgKkKWcnuJLV1dPPYbWVR3SgMD2IZDGUhLFrVQdo4
 BFm8zfAA0PMzmuMQMfbyFMDsvjeXQS5pAAbQDYOexkxtnuD8APlghkFBobkdLe0knz66
 IomdlT6Y1SDDeCGyHhxXKrDTM1Nfw6uzfXLdNfxqOshD+sgbKEH4wZPhyvkavEEkR2cl
 wSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HCUP9aHI+eQ+pUUZGOO1dNsG+dvoHvU/fP6me+Xsa6A=;
 b=n6/m0CHYqhRuIsI1qXpi1RdTQ4S8xYHb/scaTjEjQQ14z+57Ri6l4hb8QkGjgHB7WI
 h/yNJG9PqUqM15WY/vXlNZSeuNMn3E9s77tiDaQVuKcCV6ngAnYGbZmSkUwF9seKX4Eb
 1i3WxB2DMFLkEcH595Pi3Hg9uQ3vsLg2lVEbnn/JPB04dvFWUVQTgms/+qyPeeXx9jrF
 0Le1fPcJzE+tFROG2j83b1hp/tGgiqeuFbuZmmojUPowInHssyg1Q+Oo/C608iQi3Mgh
 p2g50SnQ5JDX3NS2lAwl8RjpxkZmyZ2ib5uEnU6JdOBdaQYokFAwEWi+0PaKlA4AJkRV
 1n7Q==
X-Gm-Message-State: AOAM533h4s9X1aUQJ+wW2lW2Y+Y/fq/BTZhLqkVBudgJpqXb8I4beQD3
 7AazOvWNte6czHSiaXlMxeKCpWbMm/PopQ==
X-Received: by 2002:a7b:c341:: with SMTP id l1mr8345714wmj.182.1613746012193; 
 Fri, 19 Feb 2021 06:46:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 43/44] docs/system/arm/mps2.rst: Document the new mps3-an547
 board
Date: Fri, 19 Feb 2021 14:46:16 +0000
Message-Id: <20210219144617.4782-44-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: hUbhG0uHZ5Dk

Add brief documentation of the new mps3-an547 board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/mps2.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/system/arm/mps2.rst b/docs/system/arm/mps2.rst
index 601ccea15cb..f83b1517871 100644
--- a/docs/system/arm/mps2.rst
+++ b/docs/system/arm/mps2.rst
@@ -1,5 +1,5 @@
-Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``)
-=========================================================================================================================================
+Arm MPS2 and MPS3 boards (``mps2-an385``, ``mps2-an386``, ``mps2-an500``, ``mps2-an505``, ``mps2-an511``, ``mps2-an521``, ``mps3-an524``, ``mps3-an547``)
+=========================================================================================================================================================
 
 These board models all use Arm M-profile CPUs.
 
@@ -27,6 +27,8 @@ QEMU models the following FPGA images:
   Dual Cortex-M33 as documented in Arm Application Note AN521
 ``mps3-an524``
   Dual Cortex-M33 on an MPS3, as documented in Arm Application Note AN524
+``mps3-an547``
+  Cortex-M55 on an MPS3, as documented in Arm Application Note AN547
 
 Differences between QEMU and real hardware:
 
-- 
2.20.1

