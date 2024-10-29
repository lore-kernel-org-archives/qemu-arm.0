Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp321362njj;
        Tue, 29 Oct 2024 08:15:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUI/DvzmJZyzeUJqotnysgyxxLoBtX+jSgpeB8U1X1WzzJiyMxJ9Wbc2gqpkknORjCyCOrdVDWwVLFL0A==@linaro.org
X-Google-Smtp-Source: AGHT+IE7077004oZziubKODUgxxB29Db/bGh4PwLcNZhrvMFC3Gmucl+sW1LtSJX76twWh6zM73J
X-Received: by 2002:a05:6830:211b:b0:718:cde:ea55 with SMTP id 46e09a7af769-71868228492mr11456221a34.18.1730214917529;
        Tue, 29 Oct 2024 08:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730214917; cv=none;
        d=google.com; s=arc-20240605;
        b=VKPuhEsQWb/oXSPhUKJ6ASZJpKZSwFFNI8KSXxcquNS726pw8xLG36A855EUTiyaS6
         +vdU4e6xQZiwzXGRsYqSQ2gBDydMa5GBCpSw1STIk2FFXAOqQTSdRF04Vgr65TdPTOcY
         NH0S12lrCsqk9iNwYpivy0AcZjYympY7fWloFNgjEOsu361sFH4oR+e5k06hQ1YpjMSo
         EabUziIFW4g9HLMVbUwLI+TbJpq24Eq1ZZS8kCmLIzCqxmrwmvWcZFFn6Svg/wgIm41M
         gNVcLCxZ63yGcYuDoemJo+CTir47HYJEbtgOrPRffZ0MbbMKkLyYOMQT5y8mV4QWHju8
         qbMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=T+ZkiB0yRpxPAiy0AdprSxhYgetza8NXjghFFGQPPbg=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=anO/Bu7LdKqhhPInD3iNNVeddfYY077ywZHR7fmZIAJh5eXVOaMUv8kZre8bcDdpQ4
         vyrAKlNc2MRM1RNPdBziEDy1lGpbS7bkJkUaAcE1eN3IoGWb6pnEs1gX7OI1XhnDqVPx
         kNvmOtFgKGp9+LoZnnFLMZwUBBF2AhhInKtyHe595h3hhzmLqayBAW7211Mg0Kvz57Dt
         tLIKLtAbtWbd9oBCpzcHFvLXhjH9ay7okb/ualH56wdDv/OA42XoGO70FYnytWJMzVy4
         q2gyE19mX64XY0LrjUmBb77uQDkVNVSY5cGaPl3o0E5BlZ2jyKIt5+t3TB8xqzBPtQm0
         m08A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WBmPB+j+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4a8c520cda4si2043360137.202.2024.10.29.08.15.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Oct 2024 08:15:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WBmPB+j+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t5nw6-0007HV-AQ; Tue, 29 Oct 2024 11:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5nsC-0000pE-0W
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t5ns3-0007jW-QG
 for qemu-arm@nongnu.org; Tue, 29 Oct 2024 11:11:07 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4315e62afe0so57475315e9.1
 for <qemu-arm@nongnu.org>; Tue, 29 Oct 2024 08:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730214658; x=1730819458; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=T+ZkiB0yRpxPAiy0AdprSxhYgetza8NXjghFFGQPPbg=;
 b=WBmPB+j+ECukrqDHMt76xJCIllMoxxVXrr4mBIfCYv835SIQi8E3h8KQcZOe+pOhfB
 3mnsjYvKL4585C/neGFSXsM4ikJU5jmdujBhnuJRjPIQTLR9kVRZBIawp1/v2YMr7D5c
 6p9XGXIOHRQU2GJBUvvyDZLigy0oz1XtOwpk3oMSDgdfUB1hlYhj/3VxXcj2oPbVDocW
 AhuzVOyONsFwXV4Q6gyRt6OVQ4QIvjQwKoCN+a9LPJBrPc5pZvPPV63Soie4DF1XjfSF
 HMI/XHufUa/4qWFtfQswWNmSyRCAaF7h6zIpxcBFxvGV2hgUwixDmPMLrdXtBk8vsVMX
 2IGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730214658; x=1730819458;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T+ZkiB0yRpxPAiy0AdprSxhYgetza8NXjghFFGQPPbg=;
 b=Iu72M2wyJ+O5jvGwvMo1cAw0ZKwYyAQqUoz8RZIr5gO8nSNbK9zrW+ubyb2QKn4vMG
 8Zt5CnjKiJz82vfeR1MtGAk/2TW1dfcPvnd9NJpAa8B2T5wDDXkakQtcgQeuVp/4811m
 JeBowNfB2Ki5eWJppe7NCS3rD0cy5f4h8mC1ay8bL/E6kjCdYoFdTbzKxgYluy8RUOZ2
 yDhCGr1jlBlj5Qsgo8mHpMnRu/KFJR8Gtze/KRf2JhpikuiAOJMBhMyDd765DOaabpM8
 1BSZN7QsaryIkL3GZBDinLD0zdv5RziL1VzTkTdwLr30NKulpnDC3X/yLkAApf7YKRFK
 pFew==
X-Gm-Message-State: AOJu0Yy7xFYDPgzCxMcVdvQaqTuAGxS+3WjM3ajIGXhXse5pqbYDIR3u
 WZ6iFO6B2EVBVBcQ1TmHt2YWztxSsziACU44jTllDQHXcg215XqIL8DpEjl1NuFH/2P9mP4JpGm
 H
X-Received: by 2002:a05:600c:1c95:b0:42f:6d3d:399f with SMTP id
 5b1f17b1804b1-4319acbab55mr111741305e9.21.1730214658108; 
 Tue, 29 Oct 2024 08:10:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4319360cc2esm146835865e9.44.2024.10.29.08.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Oct 2024 08:10:57 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PULL 16/18] target/arm: Fix arithmetic underflow in SETM instruction
Date: Tue, 29 Oct 2024 15:10:46 +0000
Message-Id: <20241029151048.1047247-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029151048.1047247-1-peter.maydell@linaro.org>
References: <20241029151048.1047247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: P8DQU9OKF4Um

From: Ido Plat <ido.plat1@ibm.com>

Pass the stage size to step function callback, otherwise do_setm
would hang when size is larger then page size because stage size
would underflow.  This fix changes do_setm to be more inline with
do_setp.

Cc: qemu-stable@nongnu.org
Fixes: 0e92818887dee ("target/arm: Implement the SET* instructions")
Signed-off-by: Ido Plat <ido.plat1@ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20241025024909.799989-1-ido.plat1@ibm.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/helper-a64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
index 56b431faf57..8f42a28d07b 100644
--- a/target/arm/tcg/helper-a64.c
+++ b/target/arm/tcg/helper-a64.c
@@ -1348,7 +1348,7 @@ static void do_setm(CPUARMState *env, uint32_t syndrome, uint32_t mtedesc,
     /* Do the actual memset: we leave the last partial page to SETE */
     stagesetsize = setsize & TARGET_PAGE_MASK;
     while (stagesetsize > 0) {
-        step = stepfn(env, toaddr, setsize, data, memidx, &mtedesc, ra);
+        step = stepfn(env, toaddr, stagesetsize, data, memidx, &mtedesc, ra);
         toaddr += step;
         setsize -= step;
         stagesetsize -= step;
-- 
2.34.1

