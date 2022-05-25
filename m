Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1031764lfh;
        Wed, 25 May 2022 09:19:34 -0700 (PDT)
X-Received: by 2002:a17:902:ee8d:b0:161:5c5c:d0e6 with SMTP id a13-20020a170902ee8d00b001615c5cd0e6mr34605566pld.32.1653495574255;
        Wed, 25 May 2022 09:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653495574; cv=none;
        d=google.com; s=arc-20160816;
        b=GvrHCvXky/9XyH/Gzr9kMLTTtED7m5TGJMUgXQcmtdyenKC13oQi3igCthCPINFaK/
         709U3GcIk9f1KF4twB1gVuc9zdwnfJ8FqKbvjo7hCOcL4R8szExQ4VbcPvHYUmGffG+C
         r5S1e7l3tp3rKEjbL/lbqp2VkXuT/CLolr4OKy95z07pYw7+a6LKAA9oP/9rdMdH/ogF
         C3fh+cISqrw8ayzHxU170M8auAdplyR7T+4SM2IePKbvDDANz52xPZRDElniM9t81EO4
         0/fHMKkLls50zN0t836qvlTUQiGpo7kXRN9/rw1yXrv3r2lgYT8Zl7BiDGV5KRBT/ZL7
         pekw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=u7LnHmxsMmJnXh8BLPdtxv5F7x/Z/fRUAXjbqXk7e4U=;
        b=BlnFbOy9dz/FQHml4vgQT5zZeT5ZAgROdZFSuBDfgB4fBoyfEGZyYwxZ/9UlKSYtlU
         KM5MAy9sFDQHZg8pH6WrOjKVgaD5jtAMYoF1izMQz7M2684oVlPQ3S9FYa3eGVPbbeyW
         6DzwC7nnW+0bCmnjvjOsYwy2N6EZc3o28gIkBTYMY4sPJfzt6n36PIL5dgyUq5pjdWBl
         nCkufi5VRiSjXpQ9up4t89/fhhWzMFCoSS9LyUxm3OVMCq7f9cLU5XXFDJjn2Vin7pWa
         0Imn3eyr0HzxIdqX3g1Wa33lG8y3XH/IzYQVTLdz5S25pnxJMjFy3qHvymp87zn9Nprd
         DtvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fungible.com header.s=google header.b=UIsJ3jdK;
       spf=pass (google.com: domain of philmd@fungible.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@fungible.com
Return-Path: <philmd@fungible.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id t187-20020a635fc4000000b0037db33a3d0asor6143279pgb.33.2022.05.25.09.19.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 May 2022 09:19:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@fungible.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fungible.com header.s=google header.b=UIsJ3jdK;
       spf=pass (google.com: domain of philmd@fungible.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@fungible.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fungible.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u7LnHmxsMmJnXh8BLPdtxv5F7x/Z/fRUAXjbqXk7e4U=;
        b=UIsJ3jdKwW77X0WPD/ze/nj4AqebLnFzf46585O7FOAbSYWW3wACpHGRAcyte17JL3
         xp0Q0ExfdeMskO8PTQ1CBuBOA6qvRP3oE6YZkLaIP4KCaisXVXYT2RBQyIDshGSIJQ0V
         4eIDhZ/WfLVJv9ZbTy8A7KVKyRhTQV1bHlhN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u7LnHmxsMmJnXh8BLPdtxv5F7x/Z/fRUAXjbqXk7e4U=;
        b=Rt5YMNG2gTHfCszpMM4HZs6bkKl8vYmGL6aQXOe2etG5abAML2m4aMDwW5fEb/Jpzt
         6dDd1JGq4TQvd74g96NNYlfgYgl7uHyPl08gC+4Kz5l5fn+J/KwMeAmFzcie2XwVSOSw
         uw+riDyzZJU3ciSvH8W9obXYytUKfq4slj2T1C5v2CkZHQJY9JML1Ba+lsRBydWHapoC
         i3mqXNRbLitaJUq+cZNrk/CJMN3pBxfJcRypm8NBF5gybVq0YJCPTRXlbsAOGjbWuVtI
         maikVjcBFGztbjSNpdAbNnL3Vqv55NdvlyiPLWiwpjDGUcEkO0CMIanDjPKx4xkEU4Pa
         9gjw==
X-Gm-Message-State: AOAM531JiP1iyb3SwfcDUdR5t3KDJzUjGsouIxee6ZlYBFAs7uark7kQ
	JTZ7ywDctuvL+Cqf8ZbglroIhg==
X-Google-Smtp-Source: ABdhPJyq9gI4h29YDOcD6fjYy1qOiKlznEN2JawfCgAotf1xNWET6Fa31AKLm6ucK2pZHF+WbHVo6g==
X-Received: by 2002:a63:2b11:0:b0:3f6:5f7f:9e67 with SMTP id r17-20020a632b11000000b003f65f7f9e67mr25150029pgr.492.1653495573768;
        Wed, 25 May 2022 09:19:33 -0700 (PDT)
Return-Path: <philmd@fungible.com>
Received: from localhost.localdomain ([185.126.107.38])
        by smtp.gmail.com with ESMTPSA id t28-20020a62d15c000000b0050dc762815csm11662293pfl.54.2022.05.25.09.19.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 25 May 2022 09:19:33 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@fungible.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Duncan Bayne <duncan@bayne.id.au>
Subject: [PATCH] target/arm/hvf: Include missing "cpregs.h"
Date: Wed, 25 May 2022 18:19:26 +0200
Message-Id: <20220525161926.34233-1-philmd@fungible.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8jzDZ2cOJp/o

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Fix when building HVF on macOS Aarch64:

  target/arm/hvf/hvf.c:586:15: error: unknown type name 'ARMCPRegInfo'; did you mean 'ARMCPUInfo'?
          const ARMCPRegInfo *ri;
                ^~~~~~~~~~~~
                ARMCPUInfo
  target/arm/cpu-qom.h:38:3: note: 'ARMCPUInfo' declared here
  } ARMCPUInfo;
    ^
  target/arm/hvf/hvf.c:589:14: error: implicit declaration of function 'get_arm_cp_reginfo' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
          ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
               ^
  target/arm/hvf/hvf.c:589:12: warning: incompatible integer to pointer conversion assigning to 'const ARMCPUInfo *' (aka 'const struct ARMCPUInfo *') from 'int' [-Wint-conversion]
          ri = get_arm_cp_reginfo(arm_cpu->cp_regs, key);
             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  target/arm/hvf/hvf.c:591:26: error: no member named 'type' in 'struct ARMCPUInfo'
              assert(!(ri->type & ARM_CP_NO_RAW));
                       ~~  ^
  /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include/assert.h:99:25: note: expanded from macro 'assert'
      (__builtin_expect(!(e), 0) ? __assert_rtn(__func__, __ASSERT_FILE_NAME, __LINE__, #e) : (void)0)
                          ^
  target/arm/hvf/hvf.c:591:33: error: use of undeclared identifier 'ARM_CP_NO_RAW'
              assert(!(ri->type & ARM_CP_NO_RAW));
                                  ^
  1 warning and 4 errors generated.

Fixes: cf7c6d1004 ("target/arm: Split out cpregs.h")
Reported-by: Duncan Bayne <duncan@bayne.id.au>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1029
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/hvf/hvf.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 86710509d2..1fdc5eef92 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -17,6 +17,7 @@
 #include "sysemu/hvf_int.h"
 #include "sysemu/hw_accel.h"
 #include "hvf_arm.h"
+#include "cpregs.h"
 
 #include <mach/mach_time.h>
 
-- 
2.36.1
