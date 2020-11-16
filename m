Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3847462lfb;
        Mon, 16 Nov 2020 08:30:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzt3I87T6zvvvJGIPwm6VmS4zmz6/yOYwT4joUGxu07WgQRr406tj2mXEFlJsdXK0ugXJxg
X-Received: by 2002:a25:be8d:: with SMTP id i13mr18242047ybk.396.1605544225155;
        Mon, 16 Nov 2020 08:30:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605544225; cv=none;
        d=google.com; s=arc-20160816;
        b=UhC8mC39/cDNWCmeJ6k4C1YYr8BI6rI6Pls+PFumB25dLkROFVTwr/V2A4sslSE30z
         LfuOp++sKyiw3YP/UmH2jUWkqOzINv/H/M1hGmkKh8uXfRIpGS9+Z8JGNWsWIHbMmftr
         WWzdiM2ObTe3D7zWqrDJsaV7R7D1uexgZViI46hNwQNYgeMVcUu7iJmzAhbjQuEA3yQK
         tmjuoz3gUFkfkhJFSMiOxiFe5ZokzCUK5DIad3BXibL50dyLhy4yP9P5cV5mL/W5j4bt
         9LPQAcjMBqhKZhtk4Bf+mTuxBcewqTNskDXEJAIVYPcPkTClFdaXiRXK5wSjwBT7JweP
         5PYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=75Zceu/K9be36pIFImAJ+/cw2g18SD9setpoR1l2WBI=;
        b=N/9gecjoW5yyzJ25te9cRWIsN25zqgf6TWiWCDhY/If1/goz+Lxwc5qISLE1XCYrTq
         in0PVXBGJc0ziwHjmdoNesNF0wvEFn5q5raywsQPo9BsDoegJbLmQZY547cLfc8awiKy
         WvwyZMG9ZJRL1IJC2oYfwTef6RdepYCCuI/9Num+In6gXqcgIgIu4t0MkaI/AOvHwGOS
         ppBiNlYREkGRjPoA0IZLKQP9f9pc2Tj82Jmxf/Zk2aAk2rXQinh/9uqtr/AVOzCvKs1V
         LrqH0PJT9Mg3RJ1eOzCgS75RmDMcEHIVNnCMv6dJM4dbXEh9ylG5vWHBb/EUYUsT9FrB
         lYiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vfzEj6yr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y64si2575815yby.364.2020.11.16.08.30.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 08:30:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vfzEj6yr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kehOa-0005CJ-Dk
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 11:30:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3i-0000Eu-Sg
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:50 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3h-0007uC-4d
 for qemu-arm@nongnu.org; Mon, 16 Nov 2020 11:08:50 -0500
Received: by mail-wr1-x442.google.com with SMTP id m6so2089622wrg.7
 for <qemu-arm@nongnu.org>; Mon, 16 Nov 2020 08:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=75Zceu/K9be36pIFImAJ+/cw2g18SD9setpoR1l2WBI=;
 b=vfzEj6yrWLd2YliLm/Fy+f1w2dDhD1xnpyzmotKOkA1ZybgktHDoJbzZjUg4TXwHtH
 eyorDJAg/SCslo2qNrzXvqmaeZ+wyC0BUnxoPI7z2WICMZYyLQK1IK6cptnjEQHI9NXd
 L6fbR6sQDOMEY8PIghGVyZg1m9RvIzE1inldYLckwJHyiw5wPdnzo/7qUsNFoQ5ybDZR
 lwny1oOZYea8BFN3DPEBSw1OArJk/qdRkt7WMT2S9cHVVnV+HrcxesYAFlMUyeccQCd1
 ouaziOZ1v9p9r1GXsCzqCppmRvvNtKo/T9mqqJDN/y2THnpPq4q6aOTC0/lBRgywc0Zg
 nADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=75Zceu/K9be36pIFImAJ+/cw2g18SD9setpoR1l2WBI=;
 b=EaXnxNwYANwFPrYDPYOq9zDoklXeSV6iB5btxgeVCsocOvBWWlB10aup1GwZhnvC44
 oN7+6I7VpN/6wbNiIH76xypZLPDaFJaxju9D8026vGa7pgjQNoGY+/Km63O7EKw5YE9Q
 Wpmeb9XEVxe2XT6kcYq+nCa5DHn3PM3q5GNamBMHsWsZbrJYceuQ3hnqApU9rJiTbMoq
 Box0vbfB5QDd5jbGd3Nb7HRhrWgatsc3ZCG0uuv7zGaE+6jAXfWb2TiBQQIdIJWL2gCp
 rIDjPwFf7SECTq7zw5XaBGtkxAd8ynz0cztGkzAvgi/I5QKQgG3Gm2UeLDsjur0M7jxT
 GeNg==
X-Gm-Message-State: AOAM533DY68yWMChJndBYV8vJ6L57llffHOfHHmavcU5BpRd2/ThWB4p
 Z3CdJYUOTp4Lhlw/wQRrjxf3wOOz8dMI/g==
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr20354557wrq.294.1605542927471; 
 Mon, 16 Nov 2020 08:08:47 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/15] target/arm: Use new FPCR_NZCV_MASK constant
Date: Mon, 16 Nov 2020 16:08:27 +0000
Message-Id: <20201116160831.31000-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: iy9SAdQn3EsX

We defined a constant name for the mask of NZCV bits in the FPCR/FPSCR
in the previous commit; use it in a couple of places in existing code,
where we're masking out everything except NZCV for the "load to Rt=15
sets CPSR.NZCV" special case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 84e806004e4..1ccaccbc834 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -743,7 +743,7 @@ static bool gen_M_fp_sysreg_read(DisasContext *s, int regno,
          * helper call for the "VMRS to CPSR.NZCV" insn.
          */
         tmp = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
-        tcg_gen_andi_i32(tmp, tmp, 0xf0000000);
+        tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
         storefn(s, opaque, tmp);
         break;
     default:
@@ -884,7 +884,7 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
         case ARM_VFP_FPSCR:
             if (a->rt == 15) {
                 tmp = load_cpu_field(vfp.xregs[ARM_VFP_FPSCR]);
-                tcg_gen_andi_i32(tmp, tmp, 0xf0000000);
+                tcg_gen_andi_i32(tmp, tmp, FPCR_NZCV_MASK);
             } else {
                 tmp = tcg_temp_new_i32();
                 gen_helper_vfp_get_fpscr(tmp, cpu_env);
-- 
2.20.1

