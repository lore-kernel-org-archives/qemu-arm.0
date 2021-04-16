Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp651690lfr;
        Fri, 16 Apr 2021 12:04:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxodzYQ3fHdm2Dl500JpKXyuQ7F/Q3RkzGlhbdES/ZhJ/aav1LqS+o28btP0Pb8FbXoy98t
X-Received: by 2002:a05:6e02:13d0:: with SMTP id v16mr8198665ilj.8.1618599888210;
        Fri, 16 Apr 2021 12:04:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618599888; cv=none;
        d=google.com; s=arc-20160816;
        b=mJSBfUTrzK8vkbCWuZqxRnkxjmH1mQJBNrQ+di9fEwj1eB/5OqRGUcFie2Lt9jgV1B
         dNiighbvFR6k8iAkF/CuIwsmP2XZ9dWjy0S59toxHBGf8qYzJtc4dMWFN6jTasll38dw
         O62NW3bFigStNiymmVxAK75yTpUVKzD9NF0LF044wtsHFH9fxFTNT0mNpl+N/0fAOF8L
         CKREdPSw0EcAXO9vNzm9s2sQuzDG8U+qzN/Zs1SgRTWuHM6GWMvmupaE5E4pylKQ7TjK
         DezfFNlq3JswVJOCMwzDVVGcUW6FbBNb2KKM9yycaYAtfpo/SSAyt4Vrb/xfCZvws6J1
         haiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=M4Ye/q/NQMpivvWde1aRm1kTY6gKWaOpl13EHd3UchY=;
        b=WjNITvlD921cHhz0MovNOvv+S6poplHQsUA4xwgd/9glZwwPyDSYfOZJdQ0zkQxvWE
         gHVCZejSOO2nNEPjz0ERp47cMHSlq6g3Y1s7exeH7OB2ToM3YBESm5VvAeTvy1WnWE0s
         /Sf6QJYKFtkFGjrPRmsZ236vcthqTIqqt3FT+go7RjqkISuTMGkp1QCwUmuMzx+uYKoG
         ruKx9R7t1u9CfMn3tyDAy1kRc/iEpmnKrNQ38+/T9YBUnQ7Eaw8rVv96WKxuMCwyNu2Z
         dAV6lYawMvwLocKzXs9Z/rZPuM1Hejc72IZ42Md5K/ukRSGjtXQCps/Ia901nIwM+QnZ
         ESzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGtD80B8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a4si6782186ilh.28.2021.04.16.12.04.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Apr 2021 12:04:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGtD80B8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lXTln-00009F-Er
	for alex.bennee@linaro.org; Fri, 16 Apr 2021 15:04:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXTha-0003TG-A0
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:28 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:36352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThK-0004HY-Gn
 for qemu-arm@nongnu.org; Fri, 16 Apr 2021 15:00:26 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so16916640pjh.1
 for <qemu-arm@nongnu.org>; Fri, 16 Apr 2021 12:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M4Ye/q/NQMpivvWde1aRm1kTY6gKWaOpl13EHd3UchY=;
 b=eGtD80B8SK/We0er8fyLcUX+80k4fRcPW5KyDxgoy6/UtBfHUcCuJqqyhq+pDOFzi6
 NtuKh0R+dfzaQYm8LrT34QtVrVITxW5TiyPQ2Kp9kv5hbvN5hTSBQDcTRD0AqSmyUo+T
 Eg0/UIrifYor0ubm5kya0auCbZ9MjS8nGBXEa26CfKRYNqxF+8UVZg70LwxjNPil1eh2
 lGexOP/8biV9sYqGDkn2Bnem1F5kb01U3dLsCu6di/49V5D85vjraapvrO3PjrFjYWDA
 DuJ0uKahxL006xcnN5ZcdtPXNdRxjUHhriNvs6jzDHF66BKtvDI+pAgoxXQVb94YV2Cg
 W9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M4Ye/q/NQMpivvWde1aRm1kTY6gKWaOpl13EHd3UchY=;
 b=hgXBV+/sENKq86nCQAzpm+ctZjHD1UQZQCcWX0CWVsP8EuzLWVL6Dy9qPQDscE7WE/
 bizGkGZTg1uoFtZ3jF+ZEyNU0KsO6daMKvVyc4jg2OHRRr+y4fpOOs+o7zTE7+6lUDbJ
 y/Iw+JWvB+wOcYZGSpJLOirB6xCdE142TbqC3BuE068N+2QpABjntaq0smDCRm9MANQj
 JHNRcDi55bvgeUSLcQ3J7dnLTQWbpfASoJqqccunfwf07GEeNSbQABf26nOlULYVE3oe
 DKKB8YjC9+bAEWEQdhITtfTLivhSfqw0ikyiVncxlaoJj46m8DUaa04qEGTg9eU3S1T8
 B5Gw==
X-Gm-Message-State: AOAM532SL+i/m8wEbZXPXnsr0BObtVKtnGTTrR0iOq2wDMKbCgYcATbk
 jslC7xHhye0CRmiAU+yJyPISgw==
X-Received: by 2002:a17:90a:9503:: with SMTP id
 t3mr10141909pjo.220.1618599608167; 
 Fri, 16 Apr 2021 12:00:08 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/30] target/arm: Move TBFLAG_ANY bits to the bottom
Date: Fri, 16 Apr 2021 11:59:37 -0700
Message-Id: <20210416185959.1520974-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Oo1a8iI5vtNM

Now that other bits have been moved out of tb->flags,
there's no point in filling from the top.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 15104e1440..5e0131be1a 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3405,15 +3405,15 @@ typedef ARMCPU ArchCPU;
  *
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
-FIELD(TBFLAG_ANY, AARCH64_STATE, 31, 1)
-FIELD(TBFLAG_ANY, SS_ACTIVE, 30, 1)
-FIELD(TBFLAG_ANY, PSTATE__SS, 29, 1)    /* Not cached. */
-FIELD(TBFLAG_ANY, BE_DATA, 28, 1)
-FIELD(TBFLAG_ANY, MMUIDX, 24, 4)
+FIELD(TBFLAG_ANY, AARCH64_STATE, 0, 1)
+FIELD(TBFLAG_ANY, SS_ACTIVE, 1, 1)
+FIELD(TBFLAG_ANY, PSTATE__SS, 2, 1)      /* Not cached. */
+FIELD(TBFLAG_ANY, BE_DATA, 3, 1)
+FIELD(TBFLAG_ANY, MMUIDX, 4, 4)
 /* Target EL if we take a floating-point-disabled exception */
-FIELD(TBFLAG_ANY, FPEXC_EL, 22, 2)
+FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
 /* For A-profile only, target EL for debug exceptions.  */
-FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 20, 2)
+FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 10, 2)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
-- 
2.25.1

