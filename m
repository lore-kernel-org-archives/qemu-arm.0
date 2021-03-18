Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp589166lfg;
        Thu, 18 Mar 2021 11:01:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNLGTIk9nQPC4ZScVWtvxwgtXK1MC9MVjoBONX7THpfNLjDrYp/cEdSjbckBfDm1bLO+XB
X-Received: by 2002:a1f:4644:: with SMTP id t65mr537801vka.0.1616090486525;
        Thu, 18 Mar 2021 11:01:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616090486; cv=none;
        d=google.com; s=arc-20160816;
        b=saai4m5cBlchCkg9YEK0ujSVcB4YmGpPAxLzYz4KtgClPfnbONCopS0BqMmpOzRZrQ
         kJksoQk4RIhdRlxhi1cpbVyiDl+IjZPc1o3V8ZZgzieTcrIfMphm0Ms7d1D3ZEDeuUzH
         MlxbLJ8x6210xl3ur85/ddtGdkfxYWYCsyCpp1rsWTJhXpTfxIbaG66uM9YUjBJHFY0U
         hprIFOmP6JsQiaPbBkKzABMN1P81rYoVHvbZYe+KZ7gRWTdIGgoYFwYS+0aL/SXnpy9W
         3HyihAdk6NczRixHVidQm3gMxtonlO2pl0iJEMGg7TaNalzeH9LiqRe14vZSdPo+sptW
         a8sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gJHl0X2rAu/7uON+ZeOo5+qFY2A3sY0ecP0qtxDZcW8=;
        b=X8xWF8E0DGsjD530X4X4QQMTpkwUmOfkJjacbbpEbRWchZk3yoNHAlE2JBmff/E8kl
         84punFsaRwtlg5RDiQO8c3vmSVnEq/QhfXFl8SoXRfd9+rbQ6L0JvgI4zsDbJtVx3zJg
         5P7C5mWwxNPA4vPAnfBHEfqScp1+MCEsIDSO6TnbiAMIk+WVgOCzrRndPe0EqkXsLiRO
         xXYpTKR8ezAokGZmoUfHu1sqXb1xipk98URdhYiyOS5phaCSmWn0aWfKIj8SSanic1cd
         ScPg/JN6nfr59KZZPUWZAKFpVhyY73xsfjq/VNSnScbXWEqHRdR5kwwf3WwukbqLu+1m
         UUrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yLlrJrRA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g24si560503vsf.358.2021.03.18.11.01.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 11:01:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yLlrJrRA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMwxZ-0000K2-Ex
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 14:01:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlY-0006hT-3s
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 13:49:00 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:43696)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMwlA-0008Dc-Dx
 for qemu-arm@nongnu.org; Thu, 18 Mar 2021 13:48:59 -0400
Received: by mail-wr1-x42e.google.com with SMTP id e9so6464207wrw.10
 for <qemu-arm@nongnu.org>; Thu, 18 Mar 2021 10:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gJHl0X2rAu/7uON+ZeOo5+qFY2A3sY0ecP0qtxDZcW8=;
 b=yLlrJrRAedV5hgbhi6UIom6JLGOrjmONWPF+Ax66V8c33E8dUDrc9fjRsTMOI07JXd
 kiBXaIMZYaE/gFY8J7oXZF4Bi6C+D9Bhz86grKhYJvcFwEPSPlC3ymXtsHy/dxJ019VG
 WoBRjblTn5rBWwDPXv09m10IzRk94tHHn8k/6AnkCfyYjA2r9n7NpA9PnPGQ8Fsy9CJT
 1/R5aP1lXksFwf4qTtePvib1oLB0MNCIUyV4n2xsnxgjXhMRXQcaY8y+s+ltN54FkbsZ
 teelKmUSGRIFDRMcKyklX40hOuq/DqOIdTz1bldwbprriXn7I5FyPYJJ8+BSMnRLcETk
 1Sbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gJHl0X2rAu/7uON+ZeOo5+qFY2A3sY0ecP0qtxDZcW8=;
 b=nZjWsKW/unTjnYpQa4Gks1CqeHsC2od9yQlOWxrfHW0XyBG47XQ7Q5HLXjMxnDMWCv
 +hyr3iKK7oUQAbn0JgsT9OwDFHnDSfZRBgN3znl6J+Zc9ZKeGrljdfbPXZuQZpiAdcHi
 yB5yIMLJ8m6DU77S7nlj4yMWnYNfciZQ26O5U/MPk7oO9Jp9KcuRMNn3Z1GsXR1DSyrk
 jj5EWH1N5Lju8u1UHpnvYj9nZ4YdA2iBzR5NzgXYds9pVKqmMqVSVJGNsPOc0SdwmIbc
 jpKWNA7zfhnsvcstGLJrgIDqNKslywKMHWJ16d84CtAl/nionC+wqwzVOOH7I+T0owM6
 SCEw==
X-Gm-Message-State: AOAM5300mQ0Jvrk81T019hk12x/mUTrdGicl90N43Nz1deKNJ1xv5Dmr
 hXDFBJMe94dRAl7R2RcB8nwdfxx/cm2CG8KJ
X-Received: by 2002:adf:fb42:: with SMTP id c2mr439066wrs.83.1616089710591;
 Thu, 18 Mar 2021 10:48:30 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id c26sm3845915wrb.87.2021.03.18.10.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 10:48:30 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.0 v2 5/5] target/arm: Make M-profile VTOR loads on reset
 handle memory aliasing
Date: Thu, 18 Mar 2021 17:48:23 +0000
Message-Id: <20210318174823.18066-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210318174823.18066-1-peter.maydell@linaro.org>
References: <20210318174823.18066-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2b6Hg4u0AhQz

For Arm M-profile CPUs, on reset the CPU must load its initial PC and
SP from a vector table in guest memory.  Because we can't guarantee
reset ordering, we have to handle the possibility that the ROM blob
loader's reset function has not yet run when the CPU resets, in which
case the data in an ELF file specified by the user won't be in guest
memory to be read yet.

We work around the reset ordering problem by checking whether the ROM
blob loader has any data for the address where the vector table is,
using rom_ptr().  Unfortunately this does not handle the possibility
of memory aliasing.  For many M-profile boards, memory can be
accessed via multiple possible physical addresses; if the board has
the vector table at address X but the user's ELF file loads data via
a different address Y which is an alias to the same underlying guest
RAM then rom_ptr() will not find it.

Use the new rom_ptr_for_as() function, which deals with memory
aliasing when locating a relevant ROM blob.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index ae04884408c..0dd623e5909 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -331,7 +331,7 @@ static void arm_cpu_reset(DeviceState *dev)
 
         /* Load the initial SP and PC from offset 0 and 4 in the vector table */
         vecbase = env->v7m.vecbase[env->v7m.secure];
-        rom = rom_ptr(vecbase, 8);
+        rom = rom_ptr_for_as(s->as, vecbase, 8);
         if (rom) {
             /* Address zero is covered by ROM which hasn't yet been
              * copied into physical memory.
-- 
2.20.1

