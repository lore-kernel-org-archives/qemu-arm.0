Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3795157ejb;
        Tue, 6 Jun 2023 15:46:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:a109:b0:10a:99a9:cb4b with SMTP id q9-20020a056a20a10900b0010a99a9cb4bmr1510958pzk.12.1686091572393;
        Tue, 06 Jun 2023 15:46:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686091572; cv=none;
        d=google.com; s=arc-20160816;
        b=DXzsvnwctE7qKdislgvr25vvhBtJBkO1eSi+PAGbit5nV7EW5rns/fNDQu2eAubdts
         uluoOGLj5C46aocq7leUCZpVeGhmLzvZVeSIE+bR1/nYGwZ6mtHn4JVHWFNTR/Qqhswu
         vWTiFe1Pu0c3SRmsmdKG93uJ7/MpM6Zd17c7TgZAeZjGSqhA1uYdfgfDyagYNubB9/bI
         PjvKgPscaHruNgHMOZYSMju8+BJPnBP3fWKdMKGqkhDGNiOX9J0tirEidPttlJdAaLYe
         lUsR5TJaKR7ycqPRUpmYJflaSGGJY1oYh3cHGynUnxTH4yUaH/pYKR0GgzMxwzDZr/+h
         Z9jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3S1R0mxbsbr5r4sN0R70oDeXEHFKtv8G6mrXyAWo4hU=;
        b=tzF2LhNIRUfjOmtKVnphEtei9KLV/w057LgmiVB8wyv9+96xJHeA7bexal92n9h/ii
         5R5jNxuZm7KBXWnj3O34Lh6x8uJxKZYROq2mmfxAGBEH0ia6l851O7CaoNOnMCzJnKvF
         3pv27qEu7p24nDdzT8Neoz+EPaQc4VJfNmkXaNKkB/ABnfYnnXirj+lqLIpte57oPAJ1
         y2aD0G1LpHbfwnBnsCcCMcwfOCJ7Ig5KNFVc2V6wIrYjnjkk73q2wjwx6NFodKvGEXNE
         D8IDNLOlu7wfOBhRwIK5dceZoPNHr2DvydnvnDIpXdC5WbBalC4ebmTu6rg+KTFXE3o/
         FBQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=deVpfxIw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n127-20020a632785000000b0053f412e3d40sor5987167pgn.6.2023.06.06.15.46.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Jun 2023 15:46:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=deVpfxIw;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686091572; x=1688683572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3S1R0mxbsbr5r4sN0R70oDeXEHFKtv8G6mrXyAWo4hU=;
        b=deVpfxIw8Ci62xyukJLFSW++zEDhCtLJvycFV7mhBs7u1wCdS+s3RKpelkb/O02erV
         1mfCNaahumobc6S4fS7Zb+4agHThtBfz+xOkYNWuwUOwCtukBBxs69bb0ycTF5/sEtTR
         2RVr8ZCIOWWouWfnsZBI3PQMd1b68K5pvyJeyCelt0B62tE+IkoK1vh4fEhKV6b8xoyl
         J1nt7uhiBfPUK24lhC2dCNV2hP/tgxBEJdjBDWLhye0970AsvxBeozlJilCfTHn7jFKN
         oSiCYXA3gDoNUiN/qW+ssOwGkOVMOlkYYqJ7cLDsGk2GX1ZuXvIsRF58Meuh3GehbVfO
         DUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686091572; x=1688683572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3S1R0mxbsbr5r4sN0R70oDeXEHFKtv8G6mrXyAWo4hU=;
        b=Qhar/Q49AXxyO2EVZeW5UpcMhv+ZteLi56gSmqA9TfZ8skrYFVMOi/m2bBRNrwH8Z1
         0cnVyKVzD43D02Yj4Baqx2h2icVzKMd1yA/sxGo7Z+951YsjR8w3OOktdgLeXOc0jcOk
         bSssCV3sQgH02XSNsXcB9m1SDh8b5Bpa0UUcBph8RfAp70trbWbhZu84/QRKvq7x3fMh
         FreRaTy3GLpoEBJv/ERuE8hu7MNMq1fvVn60jqHE0bNMqh2OXPvi0kDpGg7TbiouDvrK
         dfIxQrSV4dIYNpdPsCoN8hdynRPlpy/5Rpu7cV1LA2eQjW8GIh9IxE8CurB6GTzPmC92
         mn3w==
X-Gm-Message-State: AC+VfDx6FfpsR/5UyNcUQFARWWlqWWw3LY4equy3+s68kiuiiUJ06A8f
	zRZiXErdjof5fZNITxu/V9tyDGLJ
X-Google-Smtp-Source: ACHHUZ6v1MHLFim+KTus0DyDdWePRLDne7Fv9lUeGzYoSzMCHctqICvS89vz2Z72j4Bfd9tI7Y3ksw==
X-Received: by 2002:a05:6a20:2d26:b0:10c:1047:68b9 with SMTP id g38-20020a056a202d2600b0010c104768b9mr972795pzl.50.1686091571835;
        Tue, 06 Jun 2023 15:46:11 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2602:ae:1598:4c01:b7fa:ce59:1445:805a])
        by smtp.gmail.com with ESMTPSA id t8-20020aa79388000000b0065cfd5cbef3sm3346969pfe.15.2023.06.06.15.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 15:46:11 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	thuth@redhat.com
Subject: [PATCH 1/2] target/arm: Only include tcg/oversized-guest.h if CONFIG_TCG
Date: Tue,  6 Jun 2023 15:46:08 -0700
Message-Id: <20230606224609.208550-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606224609.208550-1-richard.henderson@linaro.org>
References: <20230606224609.208550-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 4cnBAgcVOZpA

Fixes the build for --disable-tcg.

This header is only needed for cross-hosting.  Without CONFIG_TCG,
we know this is an AArch64 host, CONFIG_ATOMIC64 will be set, and
the TCG_OVERSIZED_GUEST block will never be compiled.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b2dc223525..37bcb17a9e 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -14,8 +14,9 @@
 #include "cpu.h"
 #include "internals.h"
 #include "idau.h"
-#include "tcg/oversized-guest.h"
-
+#ifdef CONFIG_TCG
+# include "tcg/oversized-guest.h"
+#endif
 
 typedef struct S1Translate {
     ARMMMUIdx in_mmu_idx;
-- 
2.34.1
