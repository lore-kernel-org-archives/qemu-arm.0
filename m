Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp644409ejn;
        Thu, 20 Oct 2022 15:38:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5sHrMzcb2CHCmef/825q9MFAtAgUf2WNCnbNESnLjRReyNlld8x9orv1KyzJR1lhkFKbUE
X-Received: by 2002:a05:620a:bc3:b0:6ef:418:de91 with SMTP id s3-20020a05620a0bc300b006ef0418de91mr4019381qki.653.1666305534833;
        Thu, 20 Oct 2022 15:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666305534; cv=none;
        d=google.com; s=arc-20160816;
        b=bpm+EvF5Am5pPfsT/BBWSACHbwMnjz7mUxPgi22SFLwzSc8WClMaQoPrjKFUr6+7v9
         YPE+YT3NVh9AJourVFraWpqMAYcel6PHxjdqVcR1WCkgKIp24AUqQeWfCfb55KKGXcGE
         ydk5USJltuky1LxJgVK5zJDgI+Q+BdIe61uccXADhq4MwsvI840lM4EN55FbigYIC/Jn
         JPaqY5jwkDm5ujhbBXM/SYQFG8SWaIeZfybNOhi1y8X/9uQpRpiwP6+dRSq04EehhSTi
         NkYYi8AwBBU6ioP9uQmA1MXTNGEV06t7W4eX+OOh9u05VFhpeuM5c79kUMRrDfileRO3
         Ft3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0Uj3TKeNhrdwNRMuPPy9S8hZ09c8NnmiwVQNH1E06JU=;
        b=Vj2qOnUN6BnKdzJ9SwiGLuoAT1Vd7wEeGLP1SInDkSleWsefWOlWVvtk8s4AGDYa+A
         lMjbvcRKRs/ggHi3XkKLskm9Yv2B4LaOrph+xdEp7Z4z+u0uKARbRrBaIjgpb0IKFaSO
         x78iREjLTZn0bhb8BC62nJVp73YhPaWKbNo3qhxELTpKDf6Brna/hMfn3coO12o6P6yW
         Sykz5lJDFT3nY4fMlIDEcCAhuf5jEp4gIIERrlbMCH+Lypw4lVzkbdRYmd5hRa2XK7Vr
         23JitgpSeS1rzWfL5hItlhU1RKBsNALp+C2XIPsLJIwCM4sGfjPc18V/2GN69X/ep2lv
         UVFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JhLbK3WN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3-20020ac812c3000000b00397ab5a9b1csi10117470qtj.220.2022.10.20.15.38.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Oct 2022 15:38:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JhLbK3WN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oleBi-00030m-AF
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:38:54 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ole9c-0006MN-7T
	for alex.bennee@linaro.org; Thu, 20 Oct 2022 18:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9T-0006Gz-Bo
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:36:37 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ole9N-0000y8-Cy
 for qemu-arm@nongnu.org; Thu, 20 Oct 2022 18:36:35 -0400
Received: by mail-pg1-x535.google.com with SMTP id q1so845797pgl.11
 for <qemu-arm@nongnu.org>; Thu, 20 Oct 2022 15:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Uj3TKeNhrdwNRMuPPy9S8hZ09c8NnmiwVQNH1E06JU=;
 b=JhLbK3WNFoRrJii59yJ6ytA0N0iZjaPu9ZhocGYtvu2HNkUU3+zutBCCY9+xW9vUTV
 oNLTj7NlOO1j9C3NWK+O3pUSs0A/TOZ0V3sGqnHs9UH4clkbHL+xAD6HFX4XUfzL5Ee5
 p/k4jjNnPh6tYVxObGyuIZCRKyNPcPH8yLzoCturR/XzdoTrOA0jGdgT2SDq+gYRuJoO
 Ile7UX21yF4Sk2lP4TcjNFFB2DaHzHlPuxhwKY9JAIPrEZoTgiZYMXk8ekHb/TOYyHWX
 a6EOOBW2HPmnnLzQpNOdGgYUJrB4Utv2a8GvcS3PDckjqEYppFnRJ8z5VUmE51V21KA1
 Obew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Uj3TKeNhrdwNRMuPPy9S8hZ09c8NnmiwVQNH1E06JU=;
 b=1+lLj/QDJqWHZB0NSsgvQfy6/ou5ropBJUs36uJrA5wSnay7uwvcszWefwcg5YJJh1
 1E7a+rpOTmOSUUXceTFrnnqrn/5VV1KjySYtznt6GF/b2JuvrEYGKgwYylR3iDcG4vkH
 EnJgZNsy0f42YVRsDDv6QGVKpMk7IbnUCk52BhVRbSBbgvvM7RIAXDU31WviHa1pQPUl
 AiL7tyOdL5t/Iyk7gRTc8hTvm49QjbLgcEWeSLRR5ENdIMo/XQDpGIxoYJgfHxeNRVob
 T8jisne/6Bm6aDUAiIbR8lypiF8aJa7pTJDtJVR0Lric7CRq/daYF7ho+EuKm6SUO3Gj
 dvew==
X-Gm-Message-State: ACrzQf0mGfCPBnHaXLKsasQks/nnSjASfitEWQLUKMAr2Iul877/5jMo
 2i4hvG59AutTTGX87d2Pr9x5TLHLy4sMzMio
X-Received: by 2002:a63:1508:0:b0:438:eb90:52d1 with SMTP id
 v8-20020a631508000000b00438eb9052d1mr13911763pgl.252.1666305385538; 
 Thu, 20 Oct 2022 15:36:25 -0700 (PDT)
Received: from localhost.localdomain ([149.135.10.35])
 by smtp.gmail.com with ESMTPSA id
 r10-20020aa7988a000000b0054cd16c9f6bsm13753841pfl.200.2022.10.20.15.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 15:36:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v5 00/14] target/arm: Implement FEAT_HAFDBS
Date: Fri, 21 Oct 2022 08:35:34 +1000
Message-Id: <20221020223548.2310496-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w3QGWFxmKacb

Changes for v5:
  * Rebase, including 12 patches.
  * Add regime_is_stage2, which I should have done ages ago.
  * Reorg attribute extraction/merging vs descriptor modifications.

Patches lacking review:
  01-target-arm-Introduce-regime_is_stage2.patch (new)
  02-target-arm-Add-ptw_idx-to-S1Translate.patch
  11-target-arm-Tidy-merging-of-attributes-from-descri.patch
  13-target-arm-Implement-FEAT_HAFDBS-dirty-bit-portio.patch


r~


Richard Henderson (14):
  target/arm: Introduce regime_is_stage2
  target/arm: Add ptw_idx to S1Translate
  target/arm: Add isar predicates for FEAT_HAFDBS
  target/arm: Extract HA and HD in aa64_va_parameters
  target/arm: Move S1_ptw_translate outside arm_ld[lq]_ptw
  target/arm: Add ARMFault_UnsuppAtomicUpdate
  target/arm: Remove loop from get_phys_addr_lpae
  target/arm: Fix fault reporting in get_phys_addr_lpae
  target/arm: Don't shift attrs in get_phys_addr_lpae
  target/arm: Consider GP an attribute in get_phys_addr_lpae
  target/arm: Tidy merging of attributes from descriptor and table
  target/arm: Implement FEAT_HAFDBS, access flag portion
  target/arm: Implement FEAT_HAFDBS, dirty bit portion
  target/arm: Use the max page size in a 2-stage ptw

 docs/system/arm/emulation.rst |   1 +
 target/arm/cpu.h              |  10 +
 target/arm/internals.h        |  11 +
 target/arm/cpu64.c            |   1 +
 target/arm/helper.c           |  22 +-
 target/arm/ptw.c              | 505 +++++++++++++++++++++++-----------
 6 files changed, 380 insertions(+), 170 deletions(-)

-- 
2.34.1

