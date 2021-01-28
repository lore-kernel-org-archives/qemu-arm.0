Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp633432lfo;
        Thu, 28 Jan 2021 15:04:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwi1pWbwcODe4+6tbZKoeqMrvCCEK/lblH9kYh3lQadwkxpVc/H2w96JTr0G1844PUDzNht
X-Received: by 2002:a25:8508:: with SMTP id w8mr2541734ybk.63.1611875055395;
        Thu, 28 Jan 2021 15:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611875055; cv=none;
        d=google.com; s=arc-20160816;
        b=HDLTZ+a0eull4Do8iRA05CckJXkMaw9hbBnSz+8KW3qYl0iHPHOcifpsW9jNrFhh6+
         odbStZS+FH9Y+DjEbue/M0xzKzPdNify9Qsgw6RLTVrnJplZBI87dodd6wPiXRaNUoRO
         4C86sP9gppqHZ1ekjA5cSa6nTvWzzUHVjHhp3Q8M1p+MPH377N0QoaPf9mcN2ZLOHZ9q
         x7WKElHERrXQGyQvr6Oiab3w3DSWGzXw1J3x2jwg82fJ8Ahwom6V9oXc5ckhJJ3bVGzM
         rwxIhsDlKGrDfhQ480rFc069+KQVS5F8l/A4ieklzl4ULmSkiX/+3QByrPhN8AZnglYK
         SsmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=J1HR7ri25V0SiyAVmlpxEOPAwd8z1s6dfRj86QGjtrs=;
        b=orXWk5Ui2J1HL5OZjPlIAEu2rjYro66+TsoLD3nMVTuGAbOCwqyt+R7F0oj+jmGvre
         udkO+V9yP0TQLDDmImBlrtEZGW70MnSsdLvMGaRGalkp5U3vkIMZgOQRxjQ6RsT4mI3S
         L4pyN10VaXcGm/+Pvvy36r5PDw7KPy1D8vJGYa9CsC+v0xvL66OGAc327nQvj8kTQOpw
         tIpXXJGT/Xk5Yqv/HcZ1DvubDmjS3deaMjDxcUAYMbJ/ZmYDQI3cu3BWL7XuiiGB2hVk
         Iw1QD0MwXT+1uMREvkUE+zZoXT8YF2CTYcmn7fPXHXSa1HTiI6y/TBiRir9XRzSbMZvS
         hxow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Rn78l5i/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si6891864ybm.397.2021.01.28.15.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 15:04:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Rn78l5i/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5GKk-00032c-R7
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 18:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzk-00060e-VD
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:33 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5Fzc-0008Ev-8a
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:32 -0500
Received: by mail-pg1-x529.google.com with SMTP id b21so5277516pgk.7
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 14:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J1HR7ri25V0SiyAVmlpxEOPAwd8z1s6dfRj86QGjtrs=;
 b=Rn78l5i/mDHGv+CnxSdJk8JezkCDFkg5sMXfhABcygQ14Tz899ENlvpQByYmRtDi+s
 OeVHdX+d8rqrvLDrj7N1GWEZ0XUXO7YmCnFsoYTF6PTVcYbqW7txGCNlvhk3ND6av5Sv
 mXF/w/2Zbq0796fxlaXPYS7+bzjyqrfl4528rZuwRIECV1IkfGDLfpW72pqkC167l6Hp
 bbCHg+b6golFUkCM8zogzJ8oXIUASv9nDitKgXOBAx93nm+jANMscBczgdJXwfNAijra
 nRI8eLa0eFkN+TyiLChFCt/sAgit25dN7Tk10CYcWtSKyq8xHLbvedJEQiT3KrIMsSaO
 m+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J1HR7ri25V0SiyAVmlpxEOPAwd8z1s6dfRj86QGjtrs=;
 b=mFteRE01ue1be5h5mEaPIz2tVcbNQ8xt1E46m+R4vYsFuNSaUGxXQK2WijM95PCIKC
 IsCJy6r+9tAmg1S3oWMTLwLsBFp0O2OuhXLcwoV2hOtrLdpNubWmNuuxCGnt8HH/WwYs
 cFBCNqWyMa1+59MSfTfF/ND/sKzQfZ6wISaoV0TZIm77oyZB+krbazvqtv1kAgke1s4R
 gOk94MUzTisdwLsQK0qGKvDCLf21eI5R0ryCkAaqHg/KEeA/32ONB7MCOZ+GIDhpVVJX
 SlhJl6BFWNXk3fq/7ZIPcISUpd91fE03kaFx1G6F9EuuGf+fwXHBuXCkLZpUa+2isSPj
 unVQ==
X-Gm-Message-State: AOAM532zJftr49n+R3blTVtqObPli4ZprrZtfUESk0WX+y7QmNg7GD+j
 69s5+jeZLXL2aQZgMka1LyGAwg==
X-Received: by 2002:a63:d917:: with SMTP id r23mr1621705pgg.126.1611873740877; 
 Thu, 28 Jan 2021 14:42:20 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 22/23] target/arm: Enable MTE for user-only
Date: Thu, 28 Jan 2021 12:41:40 -1000
Message-Id: <20210128224141.638790-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m0nOhu5jadbD

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index db81a12418..43933550c3 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -204,6 +204,21 @@ static void arm_cpu_reset(DeviceState *dev)
          * Note that this must match useronly_clean_ptr.
          */
         env->cp15.tcr_el[1].raw_tcr = (1ULL << 37);
+
+        /* Enable MTE */
+        if (cpu_isar_feature(aa64_mte, cpu)) {
+            /* Enable tag access, but leave TCF0 as No Effect (0). */
+            env->cp15.sctlr_el[1] |= SCTLR_ATA0;
+            /*
+             * Exclude all tags, so that tag 0 is always used.
+             * This corresponds to Linux current->thread.gcr_incl = 0.
+             *
+             * Set RRND, so that helper_irg() will generate a seed later.
+             * Here in cpu_reset(), the crypto subsystem has not yet been
+             * initialized.
+             */
+            env->cp15.gcr_el1 = 0x1ffff;
+        }
 #else
         /* Reset into the highest available EL */
         if (arm_feature(env, ARM_FEATURE_EL3)) {
-- 
2.25.1

