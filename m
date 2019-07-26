Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp206671wrv;
        Fri, 26 Jul 2019 10:50:36 -0700 (PDT)
X-Received: by 2002:a65:6281:: with SMTP id f1mr87226329pgv.400.1564163435812;
        Fri, 26 Jul 2019 10:50:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564163435; cv=none;
        d=google.com; s=arc-20160816;
        b=Pwx+fzBNX0dQPBYcij+O7kHUI4jJEk+j94w4J14whNDnrTjB4Jc/twNwv4WBIyFkji
         kAfdndypjYxw+wT5d/ZlJlCGsFyVv48+rtn55WJnpZBvgEFUuk9/PZoppNd6pGtkDK61
         ZrGfjg5Z4NmGxs9O9BtkIkV9hoPGYrfYvraPte/0k1iMy17foRdMlI70mxz/fUmwD2t/
         Ez1ImGtlrDhBv25/mSDb+H+Q7xEWPOywCFr6BemkRg1hTEPrujQiNuuEqspQj56EnGKp
         VYmGrXDdsW/CF5Mk4VZw4PsXMB+DKTVcAA6W4j5UNZCdpFBliHwx3+/jtjjSNAXszBGL
         TxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=ynwokCS+Kqgt3LfDdzexRygGm/TpfqdWtRJ/K6TofxQ=;
        b=tF39KH+Qv3IHCIokZOI/IdgedjbzlokI/PCmKs/KqJn7hyiYeI/OL6duSUKRCS28tc
         A5t8gpW6XlM6wBtBeLUNYsOA5ZMbYCwmpbZ1vj4XgTcX941Lz11iGHeumMbTFjVflxQq
         pMa68Mb74HaYMp+P81N6JTudz+Ky1n1Qy9gNXRWIwhdZvPr/j5xihmkf78jXJ9+lXhsE
         LITL1DBgejph7dnwmBbIQJ6RE60czrxD25Q2RGN6oCmHWB+v1wQQSuNMiuwciZZuSaO2
         hLwHz5yh6Bcnhx7vC6w1KGAGmqjPNULaL23AGiDmQPHyUxBeTtLiWpGtfqZMn6J3VP5I
         u6KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oXKkjU8f;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m13sor10249217pgi.71.2019.07.26.10.50.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 26 Jul 2019 10:50:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oXKkjU8f;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ynwokCS+Kqgt3LfDdzexRygGm/TpfqdWtRJ/K6TofxQ=;
        b=oXKkjU8fglSAI1Jty8wDUH65ezOiFiflanv1iU7NYrrwB/qUNs7CJHIvK3eHLc6yJh
         vvfKYGb5XJCTgGneoT8ZzCTyuCWTywlHOcGOgGfxyHrGMeYP9YNN5ZJZ9lYxS+UikDKN
         x6NaBqJ2fTIeCKyhV8N6PJ/4AzT8lRR2oVtoOPT1rzONK4nBYbOPdHbTko7VQzmwYlQ4
         tA4UwkjLpwjIQp6YQ8eYt5FNLZUlX3Dk3jnptgCokx/9J1CWJdbewYYCXKK6jg/YeDQb
         n8Ia07lzEC9oS+n+RvYVNor2nRRqHhxIto7TFlUl8myyIKiBDTn+hSPVBmlC7eRWvu11
         fL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ynwokCS+Kqgt3LfDdzexRygGm/TpfqdWtRJ/K6TofxQ=;
        b=kTgpldfWw3q1TK+D6vDiMVNoYBKkgyzpxTf9AjGxxxyi6mc2TqWo46KVlGEGAW5egI
         wazpixlGPcJOG21Bl3mxbMZwlc64mDj+5X2p0e/SwUpPiwkbBZxl6NpUR4qnAF5NWpED
         5l5jNo/TORArC/QCLjMBMBjLbhovSflRDIsU+BBtXeUgYWQOqqekuz2zEIvNKAD2a31V
         SEN99kaJ67QkGn6pUAI7nwLozAx5S+lkPdOLhDr2eiBc2Bz3chzccYmog6JrFLzg6C1A
         aD5dqfgEYpS0KTS++A2acUwRrY+pcHj2sdW9ZTgFcRp1aEhkd15NZNFbnHKLrk3uIjVU
         UX1A==
X-Gm-Message-State: APjAAAUjrLgevA/ih8F7Pc6cOLWAg4ocdnUG+eWTKRyV8dtE9R/B14bW
	FMHkfHc+cWJHc+B9PvGiqD42QRowDYT5og==
X-Google-Smtp-Source: APXvYqwAwKsgKWEbkDiKv1mE75OLMvidr1nR1Qvo/H0WjENG7z2eImN92v3XwWvyFTCymQ+lADDZGg==
X-Received: by 2002:a63:2c8:: with SMTP id 191mr91125178pgc.139.1564163435378;
        Fri, 26 Jul 2019 10:50:35 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-126-117-207.tukw.qwest.net. [97.126.117.207])
        by smtp.gmail.com with ESMTPSA id o24sm104287919pfp.135.2019.07.26.10.50.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 26 Jul 2019 10:50:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org
Subject: [PATCH 01/67] decodetree: Allow !function with no input bits
Date: Fri, 26 Jul 2019 10:49:26 -0700
Message-Id: <20190726175032.6769-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190726175032.6769-1-richard.henderson@linaro.org>
References: <20190726175032.6769-1-richard.henderson@linaro.org>
X-TUID: 6LKvBNeDGqAg

With this, we can have the function return a value from the DisasContext.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 scripts/decodetree.py             | 5 ++++-
 tests/decode/succ_function.decode | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 tests/decode/succ_function.decode

diff --git a/scripts/decodetree.py b/scripts/decodetree.py
index d7a59d63ac..4259d87a95 100755
--- a/scripts/decodetree.py
+++ b/scripts/decodetree.py
@@ -195,7 +195,10 @@ class MultiField:
     """Class representing a compound instruction field"""
     def __init__(self, subs, mask):
         self.subs = subs
-        self.sign = subs[0].sign
+        if len(subs):
+            self.sign = subs[0].sign
+        else:
+            self.sign = 0
         self.mask = mask
 
     def __str__(self):
diff --git a/tests/decode/succ_function.decode b/tests/decode/succ_function.decode
new file mode 100644
index 0000000000..632a9de252
--- /dev/null
+++ b/tests/decode/succ_function.decode
@@ -0,0 +1,2 @@
+%foo  !function=foo
+foo   00000000000000000000000000000000 %foo
-- 
2.17.1
