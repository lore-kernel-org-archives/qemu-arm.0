Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp413929ejn;
        Thu, 27 Oct 2022 07:03:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5G56WXF2MnOQMu+8mhnGgSVEu/kUW4Z85YHGd30qA1pqYUOe5ha4qqtLihdChdprHpF952
X-Received: by 2002:ac8:5d88:0:b0:39d:804:90a5 with SMTP id d8-20020ac85d88000000b0039d080490a5mr34501701qtx.20.1666879395208;
        Thu, 27 Oct 2022 07:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666879395; cv=none;
        d=google.com; s=arc-20160816;
        b=utzmCdnnIsubnAp23flXoGiMnKxk8Fvs7EHkLgum1tYanKkfTvLEOrruyDQsDqSA+p
         KRIG567F7aXQ3YKqNBri3cpsC9SVjdcn8C38mW6qM3YOe6W9VDD6ijdhe0NDn92tnMfG
         3MSGfJN2/NKOTcKkMtKAlKgCFZcSGWgdRkaawt92zFNeT/8VfqvB2D5FQ1hGdnAUDq1S
         8Ulhe0+6dpt8rJ/PlPUeS3qkX0VT0ijL37NCGg+sndNIL/g8Q+GqI1rHe3Cx1iElcbue
         KWX09EWcwnzfizvy1xwz93wm2BcKa31+4gG/JxD8s9ZcchF4yH4FRvlVWhLPNk1Z/QiA
         xKyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nNtjyiRH/CIEjeKDHvpJCfaqZyeMGogdKG4xYD/wkmY=;
        b=iEPJ9QQNuFw4dtzbxF9fPIDIeb/Ep+HLnQGN7BjTOGiIVRDoSXwVe8fFiJpUH1uStU
         BtZkzctMHxbHO/qKlo5OEIQCyxqcd1dGM7KV209suiLbesVEh/IGD+X+u9dpW7u+YQlm
         SMsscCdsuqMXrjwfh3PqfpJwJTotHj0TBIEwB/siBRpzViQ4dB8nISSUktXOeA3uGGlR
         tyw4hFQTABri7Et6RLX/6nfWJQB9UE0jeJbYpqDQT1FYnf7mben1nPfPXevTq2QJctg+
         8mQgtdiXi8AzvkOugCMy/CeG5A7yMrSasRc/siJo2K4Az4MvSYa9G6ch4j1RQeX6daFZ
         9fog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yrBraNwz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020a05620a248300b006f9bc401e45si999557qkn.51.2022.10.27.07.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Oct 2022 07:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yrBraNwz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oo3Sf-0007DX-17; Thu, 27 Oct 2022 10:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo3Sa-000764-Hy
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 10:02:16 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oo3SY-0004yj-TJ
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 10:02:16 -0400
Received: by mail-wr1-x436.google.com with SMTP id k8so2362576wrh.1
 for <qemu-arm@nongnu.org>; Thu, 27 Oct 2022 07:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nNtjyiRH/CIEjeKDHvpJCfaqZyeMGogdKG4xYD/wkmY=;
 b=yrBraNwzd30pXmNdBZ9MbsFKaZWk8cgz39Si3hT+SpY64IUviyfru5olumaCiaW+lr
 rHHzuU9WL1r80ZhvXxG0xa5/cWIOa1Y9G2wsjDLdk380g1hybxqcHpoEeGe8RFYm5Vr5
 sHaKlqhzoVJIgAy4Px72tmu2DT/WVwif0knYlbgzkGM4ANWgKaAKwX43Zpfv3Cuoq+QC
 /JRDjOg7FylKn4B2UZ82ghZqmL8l+sjnxnxZMoVHv2oVk3Gy/Ew7end32h3Aq3TOTR9C
 4X4ukFLwM0qyW3qY98P8v4RyC9rXA7su4Ut135Zv+MAwAoo9H0a67OSWzp34SVe+Nex4
 RS5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nNtjyiRH/CIEjeKDHvpJCfaqZyeMGogdKG4xYD/wkmY=;
 b=jDRYwGhCXaoZ+TU56yHyw/xBgCbGMSGIf2JUn/1LX70l2oF1IXKra+OK8l7aHdITgw
 SqJBm3sMhtrqR197AgBfUEgYUcjpdJmG4NG57touOyIvLtNwWiBdPzkohdtb18sLL23o
 OTS5WlxIlQcJDz2NCodlMrc//Oc8c3o9is+gyULDW6FmpbEw2PXHKxldrk9pWfI86y40
 z1dTOvDrmq174+Tp8CmzqWaagYgulWKmuq45PPwfzZc5ZJ8IrkS1AB8v+WN/JcmD8UK1
 OVwgfgLSEebiSkh8zb/B1H2iR7k5hnw/0uKSv2zy+GiJfuRUV23a5zvUSJTOUNvbB62t
 2hYg==
X-Gm-Message-State: ACrzQf22YevrP0u7oCs5ARmSewUPv3VoMJ3WF0kqy8wAnrt5x9m4QXlr
 5AcwTZUABMbf0Avzu42ZZ7DbS3eAIop/iA==
X-Received: by 2002:a5d:4441:0:b0:236:6c3e:efb4 with SMTP id
 x1-20020a5d4441000000b002366c3eefb4mr15512585wrr.539.1666879333297; 
 Thu, 27 Oct 2022 07:02:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp6-20020a5d5a86000000b00228a6ce17b4sm1301236wrb.37.2022.10.27.07.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 07:02:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jerome Forissier <jerome.forissier@linaro.org>
Subject: [PATCH 2/2] hw/arm/boot: Set SCR_EL3.HXEn when booting kernel
Date: Thu, 27 Oct 2022 15:02:07 +0100
Message-Id: <20221027140207.413084-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027140207.413084-1-peter.maydell@linaro.org>
References: <20221027140207.413084-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: s7M8xS9eHGWL

When we direct boot a kernel on a CPU which emulates EL3, we need to
set up the EL3 system registers as the Linux kernel documentation
specifies:
     https://www.kernel.org/doc/Documentation/arm64/booting.rst

For CPUs with FEAT_HCX support this includes:
    - SCR_EL3.HXEn (bit 38) must be initialised to 0b1.

but we forgot to do this when implementing FEAT_HCX, which would mean
that a guest trying to access the HCRX_EL2 register would crash.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 0e4d1e5a816..ddb7b1bdba0 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -769,6 +769,9 @@ static void do_cpu_reset(void *opaque)
                         env->cp15.scr_el3 |= SCR_ENTP2;
                         env->vfp.smcr_el[3] = 0xf;
                     }
+                    if (cpu_isar_feature(aa64_hcx, cpu)) {
+                        env->cp15.scr_el3 |= SCR_HXEN;
+                    }
                     /* AArch64 kernels never boot in secure mode */
                     assert(!info->secure_boot);
                     /* This hook is only supported for AArch32 currently:
-- 
2.25.1

