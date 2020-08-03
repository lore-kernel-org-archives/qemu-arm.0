Received: by 2002:a0c:f381:0:0:0:0:0 with SMTP id i1csp1883585qvk;
        Mon, 3 Aug 2020 05:49:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcDxnlH2frNvVbU61y7lNhwxBNf1WKEWRrYR7vXvMDsRsDl/J7IkIIzWzblLrPXFDBL4sS
X-Received: by 2002:a25:da4c:: with SMTP id n73mr24975159ybf.306.1596458943124;
        Mon, 03 Aug 2020 05:49:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596458943; cv=none;
        d=google.com; s=arc-20160816;
        b=zKhArK7BM6EsNg5EuhV5Qu9p1eqb2xz3WpTULIaJGD8bSPG0y5NzSZPkfVwm1u4yEj
         A9/gCzKdyFjj1xL2etARY58xPTynQbP4LgBmHuREdddzVfX0o988UWo+5ZyAWaSQgSoF
         9AO/slTM+GAFUUBCs/IKCRa9Wd0830pQMY3MBF2huESPsKXnrJ+xoiS+dEGha+bJzNLW
         NalJAKMoL1pV2kQ1J08WC0LUj8/epp+RD2z6/W9nyAuuTNVYFDBHudrd3yta2ZNlB4IF
         dQPpblFwgh+lXOhTQhHSc55KgbwYodCeJcLtMecRsYLb5kzvkUb1FxF/l4doWBfQp4iM
         eD6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Y1ekWK8CJLvHrVxfCc2kYGCDX3fGw6jKhM4D+UOMVQU=;
        b=ed0WSFtq+UBy9KEKzyILovTSF45LSk6aymyKetvU5OWmkPTt4cQZKxL6gxCatnw0YC
         PKH7M8E7PT3AfLWCPEI106h6oZJqK6vDQjJzOaxbRetRhqyKHa6LutL5Mk/TfGP3BIFu
         skdNji+CaxJQz8NeRiuZ42y21M/obC2K4kvoJhQAQcMrIEsWv5eBVKTfqWfBy+vd/YHN
         CmaF8sY8Lj8qxL8c0/r7ZDd77ZDoPqPmrrVpU5xv55UEudM9h6P3IgGczUoV7GtNbvXS
         G5H5Ge+6psdTiiCQr1sO6VpbuvleeSr4wGsB6j6yLXVPyVaO76NHuLNrSydlaeEVm/k2
         B1xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hR+x5ZYp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q7si16214508ybc.68.2020.08.03.05.49.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 05:49:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hR+x5ZYp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2Ztm-0008KF-Iv
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 08:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2Zte-0008Jo-PZ
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 08:48:54 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k2Ztd-0007Zl-7V
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 08:48:54 -0400
Received: by mail-wm1-x344.google.com with SMTP id 184so15332082wmb.0
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2020 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y1ekWK8CJLvHrVxfCc2kYGCDX3fGw6jKhM4D+UOMVQU=;
 b=hR+x5ZYpgOfTj9hImkFq4ttlq2WAV+xBJSbajC/E7sa+oROv4i3j5JhVPv38hKOZrW
 0HLp58Lx13AEu2x3JFGiBAfWmcbaRU5S3kqb2vadt7hTBjujS/ZiTOqMXSIhYnkrjS0a
 eud0W/iHqZ3vsYnvY7/Et3EJmkk7bnDu2ZyS/4Bt85qBf8iqKWLw9H3ujZxf8wgHKGwU
 dOUP/tFfikSm7eRHTy2Igve3WqMcRsE3z9MbT9hpRgEXy3IQjw4GUVhdMQfkn0KR7fAI
 4slzuGHlc4TZAiM/GgBDGJ6uyuJbDVZ2ES3MuYcBK+JUS4nhr10z3bk+51ERIj+j7JpU
 Kgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y1ekWK8CJLvHrVxfCc2kYGCDX3fGw6jKhM4D+UOMVQU=;
 b=FQbTRg6NZlW6R+rK1guPEBmHAZP45fNOpIb/jGrZp5BkWNrRma0/e+6Dyfx6gEz1js
 ThabYQhbo13ugKPFMwadll64ni4CuBJ4tW0eTbcVfihEOkvtzA6szODsW8epVsHe9pri
 izBnkaRTw79XIhrFqiNS42V7wEI1U322unPrOfxYvR/KYDx7OzZIxw8Ogtpcpx4PWDXU
 r/LgYdXuYgDM8T/8OMvJ6M1Fcc8QslvVisriOY0aChp/3gx4oJ2KemGKF/bA1D1o3xzC
 r+q2JXm9oF1B0VoPZNdJj+nRXXmf6sNUIze8NztDMNdDbXZAo2LIP/kpNyII1QzTLR47
 nMgA==
X-Gm-Message-State: AOAM533zDWGkZdCaJB52pNn62f7qOTKieXNNC8CfWnBpuxr2ytmKF0oK
 ZaV9ycaf6iQRBSa9PcIAfTaa0hZxtDCfVg==
X-Received: by 2002:a7b:c054:: with SMTP id u20mr22517wmc.2.1596458930936;
 Mon, 03 Aug 2020 05:48:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d7sm19153174wra.29.2020.08.03.05.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Aug 2020 05:48:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] target/arm: Delete unused VFP_DREG macros
Date: Mon,  3 Aug 2020 13:48:48 +0100
Message-Id: <20200803124848.18295-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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
X-TUID: +ZccOAPSi8ud

As part of the Neon decodetree conversion we removed all
the uses of the VFP_DREG macros, but forgot to remove the
macro definitions. Do so now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index c39a929b938..27bf6cd8b51 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -2471,21 +2471,6 @@ static int disas_dsp_insn(DisasContext *s, uint32_t insn)
     return 1;
 }
 
-#define VFP_REG_SHR(x, n) (((n) > 0) ? (x) >> (n) : (x) << -(n))
-#define VFP_DREG(reg, insn, bigbit, smallbit) do { \
-    if (dc_isar_feature(aa32_simd_r32, s)) { \
-        reg = (((insn) >> (bigbit)) & 0x0f) \
-              | (((insn) >> ((smallbit) - 4)) & 0x10); \
-    } else { \
-        if (insn & (1 << (smallbit))) \
-            return 1; \
-        reg = ((insn) >> (bigbit)) & 0x0f; \
-    }} while (0)
-
-#define VFP_DREG_D(reg, insn) VFP_DREG(reg, insn, 12, 22)
-#define VFP_DREG_N(reg, insn) VFP_DREG(reg, insn, 16,  7)
-#define VFP_DREG_M(reg, insn) VFP_DREG(reg, insn,  0,  5)
-
 static inline bool use_goto_tb(DisasContext *s, target_ulong dest)
 {
 #ifndef CONFIG_USER_ONLY
-- 
2.20.1

