Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp638837ejb;
        Fri, 26 Apr 2024 12:47:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVyOQ4afwNd3wC9hUYugAOTbrOGCygp0KxH5nQfanIGwz1VHgPtSsRnoVp+aCoyiGJlp2FC9gIUiLfyV4B3B+ul9xA21nW8
X-Google-Smtp-Source: AGHT+IE/O6k8nCIaWezluA4zkGeaRFj8yYcYtuBKCvJ7DDjqX9fLenHReVdJXjbx8W1Lvex1y9aH
X-Received: by 2002:a05:6214:27e5:b0:6a0:93e9:262e with SMTP id jt5-20020a05621427e500b006a093e9262emr3816464qvb.12.1714160848989;
        Fri, 26 Apr 2024 12:47:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714160848; cv=none;
        d=google.com; s=arc-20160816;
        b=jEFz1c/iuZezRUpTqO1Hzxo15HbA9IR3vrpbA5Gi45oOoQHsV3MTs0C2iGHP6c4y4A
         qISVtHPwqwKnxdGD5kpvugYs872uIa5gF7jk4QnNn6wBo+s6ULA/FrbW7RjUdAVjkhPF
         DmhBnrZicyJeCVDyiLtorDmpdIHXMeq20nlmpvMZDfHhGKjuHg/qKw1wG6O5Pr+IziBo
         RYjXly0f0ITfaUOH8/NUOe3f+6FLvstnHZ4pGBM6OaC2LMqD6Y+9PJ9eVEywSgDGzM84
         LLp/AnrGptq3YOfYCT8IVTierVz41w4lNtJxIAfIcZbpHtJWotV65Xsq3whi62jLaNE3
         nGrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bzDVxW+21MsfKgGbGkgEmh47Dcww+z+68N+3YiFHARY=;
        fh=ZOQHQHwB41A+wOMTUQbdDSrQAgLvz5JLhjlv9rNMVPY=;
        b=WHAXuI38D5NNeDGMrT581ntieqlAp83B6tw4t/ySOZIwvWSehEsGjh4jY4XRLAUDG6
         I7FPDbJSmRokUv2ljc07Q04132PyEF7J64A9bUFCOM/Po9TcQ/6/FPLlFtTsPgSB6FIo
         5e0a8PMSSseTws15dZn2Cbc8E735YqBSQjiyFDU0wDp6C1+mxOczhk4Nd8kuGZZA9Maq
         dR6LC743Vy6sI5nf7wjc/C8fqDc7sNJQxhkt0YJ0ttM9vRXCbtRk8Jk/QIYe1YC1JWsq
         4QM/eCx4ZSuQwzX2KoP+LzYaSz8MYD/Aw2dqikOQorgsS8VabKJY2a34+aE9SUEjpTHp
         F1Rg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aU4oToG0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jz4-20020a0562140e6400b006a0aaa339e0si2696151qvb.537.2024.04.26.12.47.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Apr 2024 12:47:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aU4oToG0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1s0RVn-00020z-IE; Fri, 26 Apr 2024 15:45:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RVh-0001VR-Hz
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 15:45:30 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1s0RVd-0004eU-FT
 for qemu-devel@nongnu.org; Fri, 26 Apr 2024 15:45:29 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5708d8beec6so3174045a12.0
 for <qemu-devel@nongnu.org>; Fri, 26 Apr 2024 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714160723; x=1714765523; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bzDVxW+21MsfKgGbGkgEmh47Dcww+z+68N+3YiFHARY=;
 b=aU4oToG0tAKSlN1+wZj99F14T0UuHK/yWR7XAFa62V361kLivQda8O27WUvOBjfgie
 /NEsG/Z2/grqaAOXrldw0OEeePly8aGT9iMAaJk8M2zo491DkWF7CaLU5iHok8VWxmxo
 14PDybByztY+HS8CGK8RlYh1QBEKHkRq+/h5soBfUbHJ9hcVeZP323W+SHFrUZmi+e1I
 eeAbcnpuApqtGZKJe17oi43Cxh/I5wrQYywtfevvT3DJwN8Kj2Z5C9T4jHsnjs3HhT+X
 VHrYhbEh3d+BYYw3abcy7fJ0MOqleYy4FkEYiqgzSXNPAWrIsolB86PmyEy+WoMAndX4
 WT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714160723; x=1714765523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bzDVxW+21MsfKgGbGkgEmh47Dcww+z+68N+3YiFHARY=;
 b=NiD/Ymfc2+XdxzvhUY/j6irl1XR23e4nVfjpz2mt9L7u/66Ei09Wbw0hGPBDJ12bxz
 lfBXtg49Lpyy7VzOOr7cCrcNT4H0ugeQI05h5sJDP/Xb3CgfaDrKqYMvXNHCRzjU8dM7
 KDywiiri1nP4Ed2FiJYTBbekw7AVpSZnVSMVgiY3BmxC18zgvlS6kHre2ltnlKEHVQcB
 LdKtRxrk4NSoN/vferh6Qx4/pgnogmhjlNhYrHITM9iUrSPyfpgYcAvnRV88Rofkwur8
 sX+1jIiLkRg5pjWr9ikx+wnhDjebP3VKcLTrOjU72ImtdU8ehKUvcCjuk6+mJfItwGtS
 GQ8w==
X-Gm-Message-State: AOJu0YyhMtPCZ/Apl5hm257jn6IvP1/pL4WUn0ZELFLNw8ixYRr6M2Xv
 hvYFGxFoQKnrByzbWqTBRBtV3I9ngRztLOBAwg03zgSAtJCEiyKoKJkVp+nStHiU9sNbUN4yBnB
 s3D8=
X-Received: by 2002:a17:906:459:b0:a58:7ea5:c49b with SMTP id
 e25-20020a170906045900b00a587ea5c49bmr3257788eja.42.1714160723638; 
 Fri, 26 Apr 2024 12:45:23 -0700 (PDT)
Received: from m1x-phil.lan (aul93-h02-176-184-11-147.dsl.sta.abo.bbox.fr.
 [176.184.11.147]) by smtp.gmail.com with ESMTPSA id
 z2-20020a1709063ac200b00a4e1a9e1ab4sm10875255ejd.157.2024.04.26.12.45.22
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 26 Apr 2024 12:45:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
Subject: [PULL 34/38] exec: Rename 'exec/user/guest-base.h' as
 'user/guest-base.h'
Date: Fri, 26 Apr 2024 21:41:54 +0200
Message-ID: <20240426194200.43723-35-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240426194200.43723-1-philmd@linaro.org>
References: <20240426194200.43723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: x4dhUvX55KVr

The include/user/ directory contains the user-emulation
specific headers. Move guest-base.h there too.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Anton Johansson <anjo@rev.ng>
Message-Id: <20240418192525.97451-15-philmd@linaro.org>
---
 include/exec/cpu-all.h               | 2 +-
 include/{exec => }/user/guest-base.h | 4 ++--
 tcg/tcg.c                            | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename include/{exec => }/user/guest-base.h (72%)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 78848f018c..027f19e052 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -65,7 +65,7 @@
 
 #if defined(CONFIG_USER_ONLY)
 #include "exec/user/abitypes.h"
-#include "exec/user/guest-base.h"
+#include "user/guest-base.h"
 
 extern bool have_guest_base;
 
diff --git a/include/exec/user/guest-base.h b/include/user/guest-base.h
similarity index 72%
rename from include/exec/user/guest-base.h
rename to include/user/guest-base.h
index afe2ab7fbb..1e42bca5db 100644
--- a/include/exec/user/guest-base.h
+++ b/include/user/guest-base.h
@@ -4,8 +4,8 @@
  *  Copyright (c) 2003 Fabrice Bellard
  */
 
-#ifndef EXEC_USER_GUEST_BASE_H
-#define EXEC_USER_GUEST_BASE_H
+#ifndef USER_GUEST_BASE_H
+#define USER_GUEST_BASE_H
 
 extern uintptr_t guest_base;
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0c0bb9d169..6a32656cd4 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -57,7 +57,7 @@
 #include "tcg-internal.h"
 #include "tcg/perf.h"
 #ifdef CONFIG_USER_ONLY
-#include "exec/user/guest-base.h"
+#include "user/guest-base.h"
 #endif
 
 /* Forward declarations for functions declared in tcg-target.c.inc and
-- 
2.41.0

