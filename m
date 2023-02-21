Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2811864ejb;
        Mon, 20 Feb 2023 18:21:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/+8yzTFxVq+h5CiS8GqyKf2UHadOzlQnmq+W3AoXXG718K+uiP9IF3ymrsJck75Lbf/mjq
X-Received: by 2002:a05:622a:650:b0:3b6:3a16:a19 with SMTP id a16-20020a05622a065000b003b63a160a19mr4248185qtb.54.1676946088294;
        Mon, 20 Feb 2023 18:21:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676946088; cv=none;
        d=google.com; s=arc-20160816;
        b=JQJos5WvaO4Y1eyLj9sYx46MlXiYxZtoDYr+jbCJ8B/lOjKtt/I6uATelfzk5Ycliz
         8ykYtaa7lWUN64ibcBEw84mqhMl9t/A5yt1s13Z7psc412ObZUPM7T+5EexAyyi6RBXm
         mILT54Dt1t95+4b67VjMxsrb+5Cct483YE85JxcvHq4p0ZwTjZOV5/bQxrY9G9OGnLq7
         dc9nnTAfFwWqkLzG8Hi5jXDty+mBmzLYMnL9oPsuwY1o/HENxs1lUm8p+UZ+gqpzg+Vc
         vwqbZcR9iDabqcMqF4gUMQ++cYrXQGXlkSQ+Xt7RTWEyI/QwSOpiEx9gh7cO/8oKfDi4
         okhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=djjsEwG4h18wUlaauxZhuGg1KAW+4WF9EJYa6EDlD74=;
        b=ZjwzZSlVATa78GWp3GPV2OsLeND9N0l6LiqUEDSCNsb1lIiKSbu5Gz0we0QGu7T5/a
         //bvV3nFOJk7tH3BC3x/eQUP3Hz4HnsR92HbT3Nq19d+2dH5tNRHY2q8RdmElJqpSXFo
         etv33WnwofHw4boklV7fsGNsa+9bALFQLPp6Ur9+JZyGg9B+M3GkSwajYn2pV0q9KECu
         djork1IPmsjIMImA0EprUPrbQiHaDHDvIeFIiShPoLbhSpRMqgCIEcHL57mvI3pTLuPo
         MOWH+BvGb70bzj1Wu1SLQg+YijQIuHsURaokxbmBZK7h3bAf7yoL2/A1KMRI5gi3YgKJ
         iEdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a7R1as1g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x19-20020a376313000000b006fc5ded6d1esi10345460qkb.325.2023.02.20.18.21.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 18:21:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=a7R1as1g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUIGB-0001aW-I9; Mon, 20 Feb 2023 21:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIG9-0001Yc-BI
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:01 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIG7-00080z-Mf
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 21:20:01 -0500
Received: by mail-pj1-x102c.google.com with SMTP id pt11so3808000pjb.1
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 18:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djjsEwG4h18wUlaauxZhuGg1KAW+4WF9EJYa6EDlD74=;
 b=a7R1as1gcFimzMR/jTl7L58JiPdtSiinpl6AjcYYxQyeo0XPOf7KCNcyV3WbIB97os
 vx9QaYX4lxhIvmWGlWe8jALAH2prmgrI/ekPjqtr/GwRXpTYkgwBaguY46I3rPBfvYf1
 XQfPBOp3YnwJXA/8IAJQNGFLBZaDTHmbXeZ6S0BTye9pFuK/gEttwj+dHryNNTuLGliH
 jWNb0cdnABHy6IKf9Fi3QdhJ3JE6pvIRBxebG2nJpz81WsQ+NArzHkN4eKFta/XvTjzy
 2ny0X3ycWvmJyqWQkMnRLsMmwfSt1hjyrcqB08g6HvDTDzaXXYqofs2cey2k40z+ukLG
 20ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=djjsEwG4h18wUlaauxZhuGg1KAW+4WF9EJYa6EDlD74=;
 b=cZZ0bceXZF9bTSZ/7ihsoTALl8QpZdvPZOsY/3FNSxqCG+sHKdPdbN/XEdGnfGVikB
 HQptA15oxQ0tbbj6rtg2MwQCsYPOrMYfQOZFPIPQMPRCTVf7iGvO8k8V4Dek0zCVbySM
 IH1cGE/2B+NPY2X5v3J5XUVWrFUIg98aVxSresBgkK9cT9fe+7pYdWrsp3J5D3NK4bEu
 SwRigtUmnaMNQjFJ21DdBdU8JbEZoieqH/DX/kMQquCjQWCTbTbMu5tOc6LTAy574Ivi
 hc0x00pxSqD5FXR6oj66meCGiARJjCKDFnsHCELcUXziGogKggk02h7kN6DfslRhdsj0
 Iu3A==
X-Gm-Message-State: AO0yUKV5+RA87GiPGeLGDYGKpl7FlswdcPYtNeiExwTkKvuy1XjAtMdu
 DJXCXsDlC6oU5OWkEUyAGgtohd9ob8gpVhkq1IY=
X-Received: by 2002:a17:902:ce89:b0:19a:7548:da25 with SMTP id
 f9-20020a170902ce8900b0019a7548da25mr5526167plg.17.1676945998336; 
 Mon, 20 Feb 2023 18:19:58 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:19:57 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Fabiano Rosas <farosas@suse.de>
Subject: [PATCH v2 02/14] target/arm: Unexport arm_gen_dynamic_sysreg_xml
Date: Mon, 20 Feb 2023 16:19:39 -1000
Message-Id: <20230221021951.453601-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: riQsO/WYhcnV

This function is not used outside gdbstub.c.

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     | 1 -
 target/arm/gdbstub.c | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 12b1082537..32ca6c9a0d 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1116,7 +1116,6 @@ int arm_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
  * Helpers to dynamically generates XML descriptions of the sysregs
  * and SVE registers. Returns the number of registers in each set.
  */
-int arm_gen_dynamic_sysreg_xml(CPUState *cpu, int base_reg);
 int arm_gen_dynamic_svereg_xml(CPUState *cpu, int base_reg);
 
 /* Returns the dynamically generated XML for the gdb stub.
diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index cf1c01e3cf..52581e9784 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -305,7 +305,7 @@ static void arm_register_sysreg_for_xml(gpointer key, gpointer value,
     }
 }
 
-int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
+static int arm_gen_dynamic_sysreg_xml(CPUState *cs, int base_reg)
 {
     ARMCPU *cpu = ARM_CPU(cs);
     GString *s = g_string_new(NULL);
-- 
2.34.1

