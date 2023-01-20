Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp920142ejc;
        Fri, 20 Jan 2023 00:25:46 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu6LxOj8XytSs2Qh78ypifhwP63/GkisVFqETqK1kRiOG7olkHzJkTFe1gZmtQAYLm5I1O0
X-Received: by 2002:a0c:fe46:0:b0:534:a530:e98a with SMTP id u6-20020a0cfe46000000b00534a530e98amr18565767qvs.8.1674203145886;
        Fri, 20 Jan 2023 00:25:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674203145; cv=none;
        d=google.com; s=arc-20160816;
        b=QWFVHbkiTP2opFvZvcchpHRrI34yTkCH218C1XV4XcjUA0QI6bzeeTMjq9McSf4yMC
         NyVMDol7ed3Ip1RVMazOaY5GxTBqQOEWDv4/Bp+W6ih05GByEk8M2SIDhxWSdpcbnUGy
         A7dVlHgJ8hGtaf2pr4jOMfCI1/5DPz7TLtTGoCe9zcizi8vG8PD/2gAhIpndi6QgPY+F
         rC2Zfxyu7sxmc4tJ9OgWVKlJSvsyGPjvGX5eB6AhbjNUQR9wiAdzt/LpzurKtsiV8D4W
         d6v+eOt4odt7ZEvLKvzjT07sMBHjXLeYNaZd6Nuz0876YY6D30V1l5ZcrbQ+3uQWjXUK
         8S2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=mY7oyQj8bfUQn3aOeG+xwKrGHm6i2eqj02t4Nx+dHyw=;
        b=kjU+cDvXGKFDqM2v9qOSgJmFrvN5oOOHx9BSi+9kFE+CctJFSB4k8KZycpbqZdQWMv
         BwiaR/VhRPa1yQ6JUGkY/IRBhDp1YS/bG2kW6qPHegsAjsFm17gmO3+4sVNsqu9Kda8d
         ofaTqgWKOud9SpVrl5h7tQYKNak9ULgK0KWBOt/OIOMY/wIKkrNtlgNb+SCyMRdT4FLX
         lYYSPix2sRIjVekfnFSulHpSryihMIGRYbLxh1mRKW1IM9xKSbK9cVkILtZkp2j3dRxk
         53n3LrP2aJNwX8VvUC5A2yZnfrSd0Iq2MTYJSbIPNkkoDpAT9xXRIk0kSwpcbtZhMKTU
         IUJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mI6b9UHz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf5-20020a0562142a4500b00535375fa464si6114668qvb.302.2023.01.20.00.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Jan 2023 00:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mI6b9UHz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pImh6-0004kD-No; Fri, 20 Jan 2023 03:24:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImh1-0004iy-3w
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:24:11 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pImgz-0004Ym-97
 for qemu-arm@nongnu.org; Fri, 20 Jan 2023 03:24:10 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso3063240wms.3
 for <qemu-arm@nongnu.org>; Fri, 20 Jan 2023 00:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mY7oyQj8bfUQn3aOeG+xwKrGHm6i2eqj02t4Nx+dHyw=;
 b=mI6b9UHz7VwJB3FJYRPDidQ8ghs6YLa7TctpxwlzBiJMTF7IWbrDr65GAtGWb/CvIp
 3CmTgRniDVM8QNqpxP/Al+k/4j8UJs4qqdMA482KJKjXui3GDtQ2QE3IrXRiO5HwYmW6
 dMX0bOpXxKupdjH//dwviLouy1U9kDGrrIq+KeJe6NpLXlkfeCbIP+HzNbA8pQY8Royr
 agKHrebV5a59vBOA0/tyzKmvdAvC2mNKZNJ++kuhR0l2RxYUkIQ/Vx9KCccuVvz2uQmu
 +ivTAr74lXB6f+FzCSJhYVvJUjkBKHSvzpJPSH5crBOLmJakPtIH2wx+1OCV6zwdPrNV
 ZdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mY7oyQj8bfUQn3aOeG+xwKrGHm6i2eqj02t4Nx+dHyw=;
 b=XCLljIfsM4uoA9lS/sqBWl9QeMxYdLTGPupD0mCGCYwGC2C6IO58JC45Q4Joj1fEKM
 W/y3xbGQz43t20gx2HFksk9GseOKfi01n3pGewzeJzK9/H9SQULjhgI10WCN1s/ufpjv
 bolqK26PdaTCEe2XVN26oXcB2VyRRbiIyih5c4BfHjulCnoncg21zQnu0g7Qc2PtR9WJ
 LuTyEgWqfKT1Eerttl803qiagFFYzKRtrSIuzaEo+Hl+Pka1BYJHp7aHtlbFXEARfJ+z
 CsSSwjzXGTRanUhSQWp0oxzTuxo7I6dzzB0Zux+yGXrOZu2krGB/CSaFDknvIy99duzf
 k0OA==
X-Gm-Message-State: AFqh2koCO/Vxeoyaz99cOTyAqhCwZ5u1pt8LaX2bpqBURimArJes0Jxn
 cxhCZpR98d72dYhXUqupy1BwKA==
X-Received: by 2002:a05:600c:cc8:b0:3cf:497c:c59e with SMTP id
 fk8-20020a05600c0cc800b003cf497cc59emr9568717wmb.6.1674203048594; 
 Fri, 20 Jan 2023 00:24:08 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c0a0400b003db01178b62sm1674206wmp.40.2023.01.20.00.24.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 00:24:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 05/11] tests/qtest/migration-test: Inverse #ifdef'ry ladders
Date: Fri, 20 Jan 2023 09:23:35 +0100
Message-Id: <20230120082341.59913-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120082341.59913-1-philmd@linaro.org>
References: <20230120082341.59913-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: iYXjHL8tMAQS

This slighly simplify the logic, and eases the following conversion.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/qtest/migration-test.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
index 1dd32c9506..5271ddb868 100644
--- a/tests/qtest/migration-test.c
+++ b/tests/qtest/migration-test.c
@@ -647,15 +647,15 @@ static int test_migrate_start(QTestState **from, QTestState **to,
     }
 
     if (!getenv("QTEST_LOG") && args->hide_stderr) {
-#ifndef _WIN32
-        ignore_stderr = "2>/dev/null";
-#else
+#ifdef _WIN32
         /*
          * On Windows the QEMU executable is created via CreateProcess() and
          * IO redirection does not work, so don't bother adding IO redirection
          * to the command line.
          */
         ignore_stderr = "";
+#else
+        ignore_stderr = "2>/dev/null";
 #endif
     } else {
         ignore_stderr = "";
-- 
2.38.1

