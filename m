Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp751037lfb;
        Thu, 19 Nov 2020 13:59:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzMWqihdaQi1jJj9SyGViuvOK6GmI3tSvBi9PLBDdMdljVmdGVfIV+N9AE386nUkRyJy08W
X-Received: by 2002:a25:cf56:: with SMTP id f83mr13995456ybg.54.1605823178383;
        Thu, 19 Nov 2020 13:59:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823178; cv=none;
        d=google.com; s=arc-20160816;
        b=X+W3/pyz+gYfbaFYzR3MEJx3lk6Ybi9gFeu0c5r24YlCdiHaK14Zmhtnl/O8k9LgQh
         7+ArRGexV8XGvogt1RQp4EH4370+/mmp/kvNoQmxGcH+A1kDi2OqZ/oa2JjOLg/U+pAT
         IeErR50HitwKa/XZvfSozpD1fyRTC778NzmuI+bLKss3Z8m2TqkyuFb9lkt6yDBGB3FJ
         hxtUhUEs0GwBPNydPOy0YfS04WJCg3t80hZxittXRKe5curwO/iRlNvPq4wYkfqFu+6K
         Vlx+IJpAh7F0P8NUO+M7MlFD9OQ4Xw+y1VRM8ymwPZf2ntqxOFV42ZolkZoyIbvQkKxY
         QH0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=8+XlTYUesFmn7xGnqY89ywEYlA7oUC0DSrJvhHCe1y4=;
        b=LiTjpjRZNB1oQoeOCjCviynUqssUPvycIiCbX4qgAumKTSgrA4Gp+SB7c8DTo22KWs
         0tvFPUend4t1PsDyV+7SqFb+7n20fh0J0rKWwAAPDws7hEpYSbyWUu3wMRoDome+qKHF
         HAsBPsrdcOS/A568niO7cnvOicgfj369Azroyy80ugrh4J+71qJcjKfWt4UIDQXMiOZA
         Ja+cf6t/ZD5+ZZig1KhaJWfR5HfKJz3lZb3/ZvyyKfpp/mEb8oc6UD5o/J0KMb9vVGGe
         eCemxktN8402azZjjI5eFkFEnd9MQvmddEWt1Iw3jP+/AK+Cavwko1gM+8begDzd7c3V
         Menw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ATAp569P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18si746150ybm.276.2020.11.19.13.59.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 13:59:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ATAp569P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfrxp-0004Nb-P2
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 16:59:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfruo-0000eI-3k
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:30 -0500
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:46025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrum-00049F-JV
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:56:29 -0500
Received: by mail-wr1-x444.google.com with SMTP id p1so7954066wrf.12
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 13:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=8+XlTYUesFmn7xGnqY89ywEYlA7oUC0DSrJvhHCe1y4=;
 b=ATAp569PDfzF+YrpxcB6+d0W5+Qs7SQLOV01UCKfalb3Wk2I0l6p4oezdQMcz12Nmw
 aku+dW0JakM0KX/QrjWx8sTSFyejhwA8QQrbmHHGAslL6X8r8b3QsP0vShhiRhtNGEXK
 NIJ0aeDl9cin3F+/ywHunUKKMUXC4gKMtOtaJvE1poz3fiYihfhGwZ7acp++0AnrDVV6
 xEJYCSYPGwAjVSrVTcNdTKffqHU1TRgim5aEfvAx8J5ahb0JFGe4Dre5FnZLhymrhUvm
 QeAUvXt3oMOE1VMnvPy15jn0511OS9Hcm7fXp3I3+CxJIkd5pUUZcmf5Hz8lqXwjjmNL
 zJtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8+XlTYUesFmn7xGnqY89ywEYlA7oUC0DSrJvhHCe1y4=;
 b=IlEo76Stm536r3X+bTr8+vknOk8FzsDIoeAWrRUoz2X1Z4h3+fBeKA2TpNyrQkWTCM
 07KR6OHiurj17slKpO20IP3kCWI5ydZhK4zXZQjMuV/WJgqnTKOdhs5yG7/GgXrmNa6G
 rYi7QNhrHUUtpnxBFdp5yOsY89zH4lLG4PRJ358XEdyeVKoxI76H9zhlqOP5GYHdJ/OQ
 jNd2hg0c8D5IKMNiQEc//qPMGUYcLkNCQFIKAuK48u6677ELDuI2oocIpw2ynSU7TdhS
 nurMizpO5BgVcx9nBFGuuzcXox2kyWx95mmotFU5YUnWbb/Psmjg27MKdX47CNpOkhoi
 sosA==
X-Gm-Message-State: AOAM530Pb2ghVs+ayr4bIjIOqiQaDebnGpgh4PW14u1IRVVYZX5KVL4v
 j0X3Ipmfl1d5bfoWsc90lwHfmkH6vFqX1A==
X-Received: by 2002:a5d:51cd:: with SMTP id n13mr11931796wrv.87.1605822986900; 
 Thu, 19 Nov 2020 13:56:26 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 06/28] target/arm: Enforce M-profile VMRS/VMSR register
 restrictions
Date: Thu, 19 Nov 2020 21:55:55 +0000
Message-Id: <20201119215617.29887-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x444.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +/mtb/UqZqey

For M-profile before v8.1M, the only valid register for VMSR/VMRS is
the FPSCR.  We have a comment that states this, but the actual logic
to forbid accesses for any other register value is missing, so we
would end up with A-profile style behaviour.  Add the missing check.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-vfp.c.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate-vfp.c.inc b/target/arm/translate-vfp.c.inc
index 2a67ed0f6e2..e100182a32c 100644
--- a/target/arm/translate-vfp.c.inc
+++ b/target/arm/translate-vfp.c.inc
@@ -622,7 +622,10 @@ static bool trans_VMSR_VMRS(DisasContext *s, arg_VMSR_VMRS *a)
          * Accesses to R15 are UNPREDICTABLE; we choose to undef.
          * (FPSCR -> r15 is a special case which writes to the PSR flags.)
          */
-        if (a->rt == 15 && (!a->l || a->reg != ARM_VFP_FPSCR)) {
+        if (a->reg != ARM_VFP_FPSCR) {
+            return false;
+        }
+        if (a->rt == 15 && !a->l) {
             return false;
         }
     }
-- 
2.20.1

