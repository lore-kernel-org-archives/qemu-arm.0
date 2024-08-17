Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp1490433njf;
        Sat, 17 Aug 2024 03:27:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUtUWW6Om443456jvXK5iNWQfnadHl/kyVylGeSiPUXX9UZY3L0DOodHj8r7+18BvmQ9BuZUsw54POdZi0x9O9wbG9RKVzJ
X-Google-Smtp-Source: AGHT+IH2iCLcuDex6nyw7soKpEH6LW8v5u6SEgYZgFRGX23vYlxvQDZaNaZn5ewMWgXgoEIclVmm
X-Received: by 2002:a05:6358:6f15:b0:19e:fa9c:5ec9 with SMTP id e5c5f4694b2df-1b393192dc9mr735579955d.9.1723890424866;
        Sat, 17 Aug 2024 03:27:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723890424; cv=none;
        d=google.com; s=arc-20160816;
        b=AEwRskZhlybnLFQTBo95kYzJiNPmCzg8lJtBQyhX8P3qr5qltt0c6V6jJOOmI2PKBZ
         oElHgvBk9J7yI3rECMGOFL6Qm7a6QIIrMMVHiMT47LtWxevRTayze/TMxnai281iRQhL
         OmS+550aY1S99nN9xSd0WIw21pVcaP/AqIBbD/NC/mQ17mZN6w0OWeIx2jNDFb1V1gcw
         /7yNaDhGUNo6pdRSvPIhvy1sDa9l9bhl/5mUAbnLfCjvoO2tbRczU/sojMTuF0/er0CD
         WqGSXyByQ1f67roDOq6x7NLk/86qRYg6vdl1xYz4F4usUcC49awm+G5QnKbLnFy7MEL9
         OLEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :references:mime-version:in-reply-to:date:dkim-signature;
        bh=pXYuaLkVN9XEUa9twQAaD4EBLjrrL0bAtjxvWVUlbaE=;
        fh=pITIqJh0Z5XaT4QxI/zJAgHBZTuNeZPw20HbjxZRX7I=;
        b=kbofB0xavFo41tg9Qnolr8UNjHJtBRYtPLj2No56dovw5XifBS8d6uB+YSrHCGzoau
         SIyPYw+TpdH1VMONh8wUJ7gYQXXeWTnHC++S89yFoAu13+DuOMNZ2rDN7T9ALFgYOI6+
         27UeMmeRPbYCGuky/TO3XH+NRvrXmHs8knQ4fP5+MLHE3PdA6mwAAgZuXAvuMva5pXaH
         EiGmyz21VdHEeU++jEbGYeRlBRRuT5uyqJNTYdFBdkcbOKteR28Yhd+aHoEzldTBYbKW
         qqRqxTzf0yvHWdsyk681fkNHbn78+8ax1mEW6HU8WrfZ58TZtsIBjMeUjtsOGC1VIYqZ
         O1nA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=NCcfBAIw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a4feffc6absi613895185a.45.2024.08.17.03.27.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2024 03:27:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=NCcfBAIw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sfGe4-0006kO-BJ; Sat, 17 Aug 2024 06:26:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3yXrAZgUKCvwxezmtksskpi.gsquiqy-hiziprsrkry.svk@flex--tavip.bounces.google.com>)
 id 1sfGdh-0006Ft-PT
 for qemu-devel@nongnu.org; Sat, 17 Aug 2024 06:26:30 -0400
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3yXrAZgUKCvwxezmtksskpi.gsquiqy-hiziprsrkry.svk@flex--tavip.bounces.google.com>)
 id 1sfGdf-0003Fe-1v
 for qemu-devel@nongnu.org; Sat, 17 Aug 2024 06:26:29 -0400
Received: by mail-pg1-x54a.google.com with SMTP id
 41be03b00d2f7-6507e2f0615so2314246a12.1
 for <qemu-devel@nongnu.org>; Sat, 17 Aug 2024 03:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1723890378; x=1724495178; darn=nongnu.org;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=pXYuaLkVN9XEUa9twQAaD4EBLjrrL0bAtjxvWVUlbaE=;
 b=NCcfBAIwrq0tDVJbXrDEHlgH/qHVW4GWsNWj+F2oVsPK/mkAL0P3+Cx4u0hHnjct+C
 GgmCgviWg8StIzGwPpc8MVB0cYdA2ok/At6aPOUEcShFzT6m4+MvYbjYTNR/VkYybd5t
 ouScjseWkKYYRzA7Z9y+Eu+/jT3muk9VEonVnll4bdZvGSzaFXPoXoSJVp49y1OBWiKE
 2EVhWGuQ0wY1ePVIH6PERf9AaCBfNd/EQVnadKUluWFfAEfvJY3e5CchAUW0JB7B9iW0
 QSAQgvteqdnISD2IodphFbJVjUUlZkYSqx2BwK4Xsel+rSnpzFGen3w7FjcxIo7N0pMc
 4MaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723890378; x=1724495178;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pXYuaLkVN9XEUa9twQAaD4EBLjrrL0bAtjxvWVUlbaE=;
 b=YSxf5NVjX/tadRN2rnnxKPmMOFDqz43Pg3KSkl6EWgaQhopVPoZhHqOPa89v7VFHPU
 T6VPtRVhJZtJxblRwmPAEKkNhf5Azb7YZxHhy5MlJQEX/SQbk3usGG1r05kotMsxo8uT
 WBr3Te07lwZvTvjvN5pbjj7IecZn6WMtVpkEq3ddVmH+r1wFbQT2G6ezDWRFkT/46Zzm
 S2WFIEK8S6dgcvaAcEnG+SOoLS99jzKK4mOY2piEUru6IaYdMntYn+iK3Zc7aK3BX1tH
 xMfkgflnlixQ7ZnTt/I3c7BBRV2C36Nv4Qsn6ZFdfy4KbyVXqiDwzgdsLwkMlf26Qqra
 AeMA==
X-Gm-Message-State: AOJu0YyWMG7Jekuh0GracUoD8KfHY0W2JLIz1QCtOat/LvLEYXKEG+2g
 tLWWAlGp7HHhA6qTCB6+G6/nB2kHJfoUbnQN+lrNTNLFh4AEwsWUMUKZt0qsSQ3wPBZCHmYo4ri
 yeNnck4YuwJ4FxXsdv0OeNmhwOjwtfhSOGHYLhAvc0Wq7Gz9Rq8WJbmW9Kv6ws1dgFJOM9zTqIM
 65IwnZVp5jp2WKjjUWhWIxcSAvzw==
X-Received: from warp10.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:750])
 (user=tavip job=sendgmr) by 2002:a05:6a02:5a4:b0:718:da6:277e with
 SMTP id
 41be03b00d2f7-7c9790eb4demr9639a12.2.1723890377114; Sat, 17 Aug 2024 03:26:17
 -0700 (PDT)
Date: Sat, 17 Aug 2024 03:25:48 -0700
In-Reply-To: <20240817102606.3996242-1-tavip@google.com>
Mime-Version: 1.0
References: <20240817102606.3996242-1-tavip@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240817102606.3996242-6-tavip@google.com>
Subject: [RFC PATCH v2 05/23] hw: add register access utility functions
From: Octavian Purdila <tavip@google.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, stefanst@google.com, pbonzini@redhat.com, 
 thuth@redhat.com, peter.maydell@linaro.org, marcandre.lureau@redhat.com, 
 alistair@alistair23.me, berrange@redhat.com, philmd@linaro.org, 
 jsnow@redhat.com, crosa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3yXrAZgUKCvwxezmtksskpi.gsquiqy-hiziprsrkry.svk@flex--tavip.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: Jx0esZMDp32A

Add register access utility functions for device models, like checking
aligned access.

Signed-off-by: Octavian Purdila <tavip@google.com>
---
 include/hw/regs.h | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 include/hw/regs.h

diff --git a/include/hw/regs.h b/include/hw/regs.h
new file mode 100644
index 0000000000..692428af12
--- /dev/null
+++ b/include/hw/regs.h
@@ -0,0 +1,34 @@
+/*
+ * Useful macros/functions for register handling.
+ *
+ * Copyright (c) 2021 Google LLC
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef HW_REGS_H
+#define HW_REGS_H
+
+#include "exec/hwaddr.h"
+
+/*
+ * reg32_aligned_access
+ * @addr: address to check
+ * @size: size of access
+ *
+ * Check if access to a hardware address is 32bit aligned.
+ *
+ * Returns: true if access is 32bit aligned, false otherwise
+ */
+static inline bool reg32_aligned_access(hwaddr addr, unsigned size)
+{
+    if (size != 4 || addr % 4 != 0) {
+        return false;
+    }
+    return true;
+}
+
+#endif /* HW_REGS_H */
-- 
2.46.0.184.g6999bdac58-goog

