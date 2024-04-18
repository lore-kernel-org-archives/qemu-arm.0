Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp1952807ejd;
        Thu, 18 Apr 2024 12:27:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjjKNdk6he0es9ZnvsBVFuMYeJyWP0wFLiQl1FbC3ES/DsWK0PS/IxfF18D/9B02gokby1nrn+CNQ2KxRXO+APxnFjyRJ3
X-Received: by 2002:a17:906:3919:b0:a52:71bf:925c with SMTP id f25-20020a170906391900b00a5271bf925cmr49376eje.62.1713468427401;
        Thu, 18 Apr 2024 12:27:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713468427; cv=none;
        d=google.com; s=arc-20160816;
        b=QmwZ5bcziXBT4orglSrIZtEqkjvMqDl8asIb4CoQ6yzNQ75vOJCEYCQv6tfUaA+ShI
         Nbs9mpiqebyzL+FmEkO+U7kHAEG5gMlc8a+N/S+PAnoQmzFjjBrfa5giwbzI31KjBna0
         ekayekZ5fWrFsvWKcXuN5gRsuDPrMZ2EeXbtDfGESPDiOOrbJ+Y7MFqg2hpZGi3SZZZk
         +gG6tKclAUMdrf70tpR7y3IjupOX2rCk7W+A8AuPbmgoJZtC0yIK1TJQyXngj4qucgLS
         ELoAE1ibCoRRyfKipD9+7l8SB5tTNhwHtuTKAXNvUUV+vEbW8bD2c+jP9r38mQat43p5
         Zy6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VHCcAuBE/LTzo7Jv3JWIaIvZFf+gAOHGRyRvAagXUpM=;
        fh=zIxqf/4827XfbUOG7S/ea0JHyaL2Uy5SHCr7OtZrjMs=;
        b=bsKMxcKttVhwzFuNIvIF/8eCdxQTrmnhuxpQjzWfU/SnLP6R1TFEL6SzEbaz6V+XMu
         ErRqSAEpEqC7sF+JglI+bpVbhjteJ+y8n8DJj3es1TvzmiyPhGyZ5B8Ov3zeWD7Z5XkG
         oXlAFHfDbaH2/8ENS++zz2HAd50rwT43IfaBStsZV8H+wLdlnDjqCin1+iXEJecRu/c6
         p7UmFew2QIAF6g7+3ZtBgfHl4Oq2rNp7tOJWFMbz/xXm0W1t4/eKhWorXpOe+FW52ZHo
         v17jJ8AsnjbfzhdLRCzUYBDcPOMa4u1FLo8ofsvZ9s+WfSFtE42GmjGjwMFHdphl7ty8
         DXjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bB4JBq/7";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k25-20020a170906681900b00a55632c945asor636482ejr.7.2024.04.18.12.27.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 18 Apr 2024 12:27:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="bB4JBq/7";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713468427; x=1714073227; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHCcAuBE/LTzo7Jv3JWIaIvZFf+gAOHGRyRvAagXUpM=;
        b=bB4JBq/7IZxjIU3Nl4Pyh/SZKViI0PaMvM53QgSbUZPFQ0eQfpPkYexzqhVC3R/mhp
         wqXffBkGsrxdZyZJABdbrFI7mnjxuWoy8Dfiz+s2xxNiWonVGzbMmZJ4/qB3JVynHStu
         LRosJyAQ6Bc9CNkPCzKahg39qCCmI37R1Ff5wG/3kWp1kI7CJbqTd+dfesrgh4wwNAuI
         NC412a4qKdjgQSoTN6SXkcpklAeO3s0/j3D14ZvCMJ3YrweZZ9WRvDxr5WjzcQ27UXZf
         RvpmzfYq5iuo+bcSKeEUPDvCOSHJ6qffKr6v3NFKbSJ6alxpBdJtsdxNxIraNsS5+EZc
         0lWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713468427; x=1714073227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VHCcAuBE/LTzo7Jv3JWIaIvZFf+gAOHGRyRvAagXUpM=;
        b=QMBunCZYXanEUDsChSFPzxFx/rO/VnuleweFwmtRvnPUpbIZi5ecIMYwSGVMW0l7Ig
         HrO9vq7mOf7jAHDV5h3tBJlblBuhKmToAYCBG0v7CjpatdIq0njwXYnocY7jIUxqjCyQ
         nHVVt8aLrK0ADOfFZIveMGtHzsvHNb0W62niFE81+jwDoBQJDW+SG38gCubPpIV8Woxc
         kMQ+PXvzq2pONdKkqQyyW3UK+wx8yxyHLWMMJ1up17ne0VCnKQoI4spCywy32dS4kx67
         JlT8E0bOZ4iO5C95xLbaCHvjVvN6Zk0Mr4uuULskyShQN3cigrgnav6UlRT9I0grz5+K
         RuCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV8mx8BJpt4z/aEEch3qyMe2dMi5y52nnDZzOctMT600XfOEm9sDihfbYcx0juhCJObcYO7lcR1e2QzJgOnmttMOzvkwJI
X-Gm-Message-State: AOJu0YwakSEzWJAGP+NnzzexohX8/AXoMB2+3m5XT1dPJaSeiN11cHW6
	MNIuFHRCoHKfotd1edhyda+rmIMQsAjVGYeGHu0GurSn+qkoaLA/o0IWPVi3ci/kbA==
X-Google-Smtp-Source: AGHT+IHCVKWH0+AZiuPsOyJcP3T0HcQ3oNxiRJGIC+ivVe0T0x2KkBJdxwuTUWOtC8MRPWBviUHknA==
X-Received: by 2002:a17:906:3502:b0:a52:277d:c1c9 with SMTP id r2-20020a170906350200b00a52277dc1c9mr53891eja.50.1713468427063;
        Thu, 18 Apr 2024 12:27:07 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan ([176.176.151.213])
        by smtp.gmail.com with ESMTPSA id j21-20020a170906431500b00a521e5856f6sm1256588ejm.51.2024.04.18.12.27.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 12:27:06 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anton Johansson <anjo@rev.ng>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>
Subject: [PATCH 14/24] exec: Rename 'exec/user/guest-base.h' as 'user/guest-base.h'
Date: Thu, 18 Apr 2024 21:25:13 +0200
Message-ID: <20240418192525.97451-15-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240418192525.97451-1-philmd@linaro.org>
References: <20240418192525.97451-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BDeSQH9K4mcq

The include/user/ directory contains the user-emulation
specific headers. Move guest-base.h there too.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
