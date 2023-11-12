Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp876895ejc;
        Sun, 12 Nov 2023 08:51:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcFijF2ntcEXdLekaBRVk8xoR3pYh8lfkWPOoRighzIuOgVf+OIBQn7ARIOQKKFtcBI70p
X-Received: by 2002:a25:54d:0:b0:da0:6876:c20d with SMTP id 74-20020a25054d000000b00da06876c20dmr3468410ybf.19.1699807861579;
        Sun, 12 Nov 2023 08:51:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699807861; cv=none;
        d=google.com; s=arc-20160816;
        b=sTMFxFnNgWwbR06n2U0RHz8T2CXnnV9drtfGHgxZYirPNY6u1Lf7M6LW8KOy5kuXoe
         TUApIlQ++Sf/50qgQ3XnjQ3ZC8ZGj/9rny4bCy5SWdZUjdupmksKa+mJKoCtuk/sxXiJ
         qflXvsDS4iw//8vLhPsv/q7jOTHqWtciqrZzQBr5lt3xO2KyeAp0ETMrvFFCKcw5lOy4
         WmGoQ9Z7ZbjYUQpSv42FkbNmepWHqRWbKASsPnvgno6J/tGqhFOsq46eSfbeJm2Qag1Y
         vzJOXxe1gaUDe2s/7flIYDnjpvnKRnZoSabIg/0tftFCmqNTH8d0wd4+pjhVGOPpmkGH
         OTSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=F1AvnSWiGvbigVuu/6MFNbfurAHFpFskCCpRglAvvlo=;
        fh=lvehWK2eOmqFfuFauTj24r0WBVBl7I9q9ItkxomfwyA=;
        b=YpbVtskclWkIE/ddsi/6AKo+L91Z6mTkbUfVGDgS0aMwy5MyqD93GrlwOZ2pnCX4Qi
         Aua9MVfS+yqwFPdduLVu/FNYDBpXZzO8CEOk2CEtt9EUEdlz0QrtxtDJ6S31Xv6Onxcx
         +mNKuTHj4kQWeg2wTwQC7s+MkyGh1OEKXuYSI/lzLWsIdt+Y2hlvlv+DWVTmmr2CegHS
         s4m7D3THwlOCfAXpvLi0RpG25qzfvxZ3FSNAo8eS1zFFZFoaTZ8aCUkQEoXPL66yuSIL
         glTW/wvnxuAiAaDWODuaor9qYAeb98M2nVsuijcZpB/T+3mDNk7ghoeJ4+0pi50IgQm8
         iVcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kaebh44f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j10-20020a05620a410a00b00773dc958046si3380774qko.258.2023.11.12.08.51.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Nov 2023 08:51:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kaebh44f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2DfK-000473-KJ; Sun, 12 Nov 2023 11:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <n.ostrenkov@gmail.com>)
 id 1r2DfJ-00046a-4C; Sun, 12 Nov 2023 11:50:29 -0500
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <n.ostrenkov@gmail.com>)
 id 1r2DfG-00015s-7d; Sun, 12 Nov 2023 11:50:28 -0500
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-507c5249d55so5601558e87.3; 
 Sun, 12 Nov 2023 08:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699807824; x=1700412624; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=F1AvnSWiGvbigVuu/6MFNbfurAHFpFskCCpRglAvvlo=;
 b=Kaebh44fXB9K3452jJDhVAW4mAuFoWZ6MUTrdfrAe6v61kIEw2nQNOkE5RTKuKwoKa
 lGd8TgxGzYFNHA0Pw0J1pVGdumpj/EzFm0ywD3wXZtCtjqiJO+Nm6hw2igHgowopfjZ0
 Y3k8EBc4sdSgCIC/nBzdU5AJFIogHHU0+VjFbq2k+HnHr1z3cUkQyCuMIUCw/8O1InbY
 Lj3DcqVIuMcHeCAdBFMgIjqhsvtW2y62pGnFwc4VbVJmK7n1ztf312BayHR0LORBXji1
 mjskn+7nVzGScinkJ57g53miOlTF2LjYZECXbATuTUHqaITjgUfJh//GSDpIS1g6oLFf
 3u5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699807824; x=1700412624;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F1AvnSWiGvbigVuu/6MFNbfurAHFpFskCCpRglAvvlo=;
 b=JYEp6Y2zBPGwXIhKZkjwWObQI8LCu31heN5NOHGs1vA/iuqjnX4yBvuP9vD89+iQi6
 87/+a7nUv7nRmELUFenWUGuOpBH8Su7f5ORKvYmanI49ermmVBQZ57rC5MHUOi6p6z5q
 UbVjBzhxL7f/K6FXoMMwXm1NH/9yJn82n02d2c8fMdElvAJBh1IdT7LojJJ9qJHrFD7z
 X7/ngU2AjnTyfQq3aIfcnfRAgMZPj1kokMkDaTVxD4VBPp3wzSz+GhVS3kZ/PVHzzHdT
 sGmf6tQGQYuASTfpUqnh7CdmxGjW7/fUjGIMwzVAk9061slBy1bWngDkKZrmaMSXPxcH
 xmdQ==
X-Gm-Message-State: AOJu0Yx+IvJLfKwx1v52bn7ICplLEb/y+cjfr5iy6srpRnq4apZyC3Vp
 XYyQYEK+iuvkSBjsAFnVjREdmKQu0Wnu18uR
X-Received: by 2002:a05:6512:15a2:b0:507:9ff6:75b6 with SMTP id
 bp34-20020a05651215a200b005079ff675b6mr4166409lfb.50.1699807823417; 
 Sun, 12 Nov 2023 08:50:23 -0800 (PST)
Received: from localhost.localdomain ([176.120.189.69])
 by smtp.gmail.com with ESMTPSA id
 m7-20020a0565120a8700b005041b7735dbsm672620lfu.53.2023.11.12.08.50.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Nov 2023 08:50:22 -0800 (PST)
From: Nikita Ostrenkov <n.ostrenkov@gmail.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Nikita Ostrenkov <Nikita.Ostrenkov@gmail.com>
Subject: [PATCH] target/arm/tcg: enable pmu feature for cortex a9
Date: Sun, 12 Nov 2023 16:50:08 +0000
Message-Id: <20231112165008.1419-1-n.ostrenkov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=n.ostrenkov@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kn+PgcNNU8ds

From: Nikita Ostrenkov <Nikita.Ostrenkov@gmail.com>

According to the technical reference manual Cortex A9 like Cortex A7 and Cortex A15 has Perfomance Unit Monitor (PMU)
https://developer.arm.com/documentation/100511/0401/performance-monitoring-unit/about-the-performance-monitoring-unit
---
 target/arm/tcg/cpu32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/tcg/cpu32.c b/target/arm/tcg/cpu32.c
index 0d5d8e307d..0008c3f890 100644
--- a/target/arm/tcg/cpu32.c
+++ b/target/arm/tcg/cpu32.c
@@ -418,6 +418,7 @@ static void cortex_a9_initfn(Object *obj)
     set_feature(&cpu->env, ARM_FEATURE_NEON);
     set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
     set_feature(&cpu->env, ARM_FEATURE_EL3);
+    set_feature(&cpu->env, ARM_FEATURE_PMU);
     /*
      * Note that A9 supports the MP extensions even for
      * A9UP and single-core A9MP (which are both different
-- 
2.34.1

