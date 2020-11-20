Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1415401lfb;
        Fri, 20 Nov 2020 07:47:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwF4ZBt1o8R0k94cT5Bqu5v1fI03GYCN8SO4KykZazwGePHqorbG9GL6gchNBWz2LbnQexJ
X-Received: by 2002:a25:558b:: with SMTP id j133mr24028553ybb.224.1605887230751;
        Fri, 20 Nov 2020 07:47:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605887230; cv=none;
        d=google.com; s=arc-20160816;
        b=InwuDf6oYdSnb/ZV4OcsjzHR26QI4/AUPDY+IlV7g4dH+ENQNg0Kaqq6HifOdqn6QF
         PIyYrDd1xgjdhod1hrk071JcXDh1clIDX6gZwerMLOrWu44YoJSwvoG34xxuijghLB22
         c8UQotAcxqQOlTlfUMJesLrHEtRbab1V18GQbVvusqz2MjnB/raBPHg0a8KepQkVPlyk
         Y/ck7WOsozjKGxI8mlIdEhzPSAvHtXJa3wChLkXvC40yfZJZW+fF/zClfgFF9tpaPOZv
         Gfe3IFxVKazzrp5GidMZKUXfJhhJwz6sF4/LmR45eTmbUai4R5mn2bMDD7LHTBZdW5AB
         j1WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=gSRkkpOtYYp4MRO7peWoeBoT3gfSt4WCyUlggZt4xqI=;
        b=cyRsjo6pKnzkby6DcnTVeSu0z1RBd+kuae4yYNznGn2VDcBKPNjnau5e2DcB6cPWeU
         T4CFuc1hg3mKLDR8ndC4ARs/HlEJXPQrp7kVHil6GzU6nOuOq/XQBj9uMrSy+/g7INhW
         A4+4RJRnE3eY92iR9ySWcRSoGmSa39jVqvEMVVo2/3vLvBNV2Vc6EL7KNmRq1YswB4yo
         NYc2zUAWuq5L4sw/aBw9fe9E+0kimgC5wTGBNmcnRUvqi9qOzbIKOiq8WSAn8gWtoOwB
         F1gc0dboJKraOyALnvL2nNkVoB+/mOdr8kCZgQsvqSgGdmDUfSQu/kuPV8y6eR/OzdZA
         j1BA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=INWZ+k2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o143si2755695yba.445.2020.11.20.07.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Nov 2020 07:47:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=INWZ+k2N;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:49686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kg8cw-00089k-3I
	for alex.bennee@linaro.org; Fri, 20 Nov 2020 10:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bz-0006Vy-9U; Fri, 20 Nov 2020 10:46:11 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kg8bx-0002sR-NE; Fri, 20 Nov 2020 10:46:10 -0500
Received: by mail-wm1-x32c.google.com with SMTP id a186so7968422wme.1;
 Fri, 20 Nov 2020 07:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gSRkkpOtYYp4MRO7peWoeBoT3gfSt4WCyUlggZt4xqI=;
 b=INWZ+k2NBrzR8+p60tRSc6EsmfJGTrtMgQVktFeTagPMefeGI05UHDOFYGxKaCO7q0
 Ws7XKlFYq0Vs2/3s/K77PHVn90JHc9Jhd2MPIlMUiXg7G3APqKQSmGZJ39Iy1c2kIrTb
 maKv0t7FvnfmSQlx157YqcBJnluJtlg7kYLVodfuxvIBXWSLL1bNYGb4NE8s/eTbJZhq
 MgiHifsisssuFUO0HrmLDO2I72oyPYf6boDbVBnhHE9aHwUcoSIrOOg+C+YpKKZvqesK
 B1BFE0cYxwvi0qTK7XJcr3LrH/htyF5X2WcjWgc5xMkpgr0SQ1wbf2eLNNgWaPQyzoyP
 zLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gSRkkpOtYYp4MRO7peWoeBoT3gfSt4WCyUlggZt4xqI=;
 b=CwVq75LA0CeLWaaohDS55sZ0C+vx1NvA80j0VSAkrsxGKdNVi57SdmiydDnpC7ovXb
 6DcJOE6ILxww/te+Y2vi8pbHcrbicV0YDuynOF6buk5wkktkkneS3UT6Zmmhd5F0zp/C
 R00xyrpmjRjNqBv9sBSs/vJY9ANTeetVQqFWj/UAxa6cy2q9WqxMs3QLH4W8Qxj7M55E
 eeTUxgC7N8+eW8VkN12+8uJcVfBJj0Qjekgqb7eBFUDsRhx4GBHY1/1DYz4lTm2ZOJHe
 WPC7WNcI9votHY4hWHsNbrUpve2NqGYuAgWwlxiwIl0jYzON7vCzWJYAwjtIg3p2BGj3
 bWyA==
X-Gm-Message-State: AOAM531WvEtRkFqGooy/Tw0V0ULQ3Wsp77jHL9Rbxplor+C6+ajJH7ZP
 Yvou15KJBDOQjL1/oQ+I+5DVmXnf7pA=
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr11042286wma.100.1605887167826; 
 Fri, 20 Nov 2020 07:46:07 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id g186sm38402553wma.1.2020.11.20.07.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 07:46:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-5.2 4/6] MAINTAINERS: Fix system/arm/orangepi.rst path
Date: Fri, 20 Nov 2020 16:45:43 +0100
Message-Id: <20201120154545.2504625-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120154545.2504625-1-f4bug@amsat.org>
References: <20201120154545.2504625-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BIRgstjzqRbT

Fixes: 0553ef42571 ("docs: add Orange Pi PC document")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2623cf85f66..311a55317ce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -559,7 +559,7 @@ S: Maintained
 F: hw/*/allwinner-h3*
 F: include/hw/*/allwinner-h3*
 F: hw/arm/orangepi.c
-F: docs/system/orangepi.rst
+F: docs/system/arm/orangepi.rst
 
 ARM PrimeCell and CMSDK devices
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.26.2

