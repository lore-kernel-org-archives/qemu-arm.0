Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp3752006njd;
        Wed, 2 Apr 2025 15:24:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVds5OEiD6ImZk5OAGTNjjsKdTGIMNYAxL8UAoo/jnUDrglfo6qq8pQQOL3ft7gsJPGqmWkch3XNTr0yA==@linaro.org
X-Google-Smtp-Source: AGHT+IGqreqfDhSgKw4B+Jkx9lg8qf+qxo8vpfUI+9v2mYJYETU24MowO3BCzYK9UfuW4s+CoqVi
X-Received: by 2002:a05:620a:2614:b0:7c5:4c49:769c with SMTP id af79cd13be357-7c76df4a62fmr60305985a.6.1743632681003;
        Wed, 02 Apr 2025 15:24:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1743632680; cv=none;
        d=google.com; s=arc-20240605;
        b=lkwd06aDXTkSHkj8XAtKeomoFIS32zG2FhP38IY2tX62uXRDkjefuLMIEDLza922R9
         Nr6Xx98rmibXLywvOuu5wf3DpfQ5HmnaMfPSlXMtO9BH4SlIb0f2Lzuep8JvDc/94J6A
         FRSESGk9h5oGzLbZbtU4UgDwmXwiFjE4Yfwz0wEbFUjYHRixIsAIW6B7A4ehgf9F5uX3
         mV+faltOCl8rRbJA6GZ6W52kRUjToM4e2UxpIQAqzlsIKFwQsUR39IPcq+hNZzSvshy6
         Ij1GDld459yvAot6/YZ+LyNYowY2JSx0deaTCIp4btt6+Rf2sXGSLmVFylhS3/nWF50q
         +l7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nUYX2kXnCOGEv2tsFjiwF/vNelOghwEQOe8hhegma5c=;
        fh=ILu9n9UJYyGKJ+F9rVBU1LrxK5aJ3ihMVgUEh7OR7WA=;
        b=W2hwfBHB6WgcmssuQ6TlLjhbjQ8dxK3ncojSUA78CIBibbWGV82S2JuGUHmjWDm+/l
         MFq6TVjndCZ9u7mbiyx8DlRDyZD1wZTPzmtyG9Hl9IlBf1pPQm6QXe0Qp8213xxENm90
         H1U1jSDkX4Of7ThMu/65ZfHJEBoN+Z4rB3e3HDmdCd18Bh7PLrhvOiFe+hHNu9yVPWt0
         P5F0PFpWwDRwXE+C4Dp8pEiQcLBHiQE3W22tB9k3pM+gks0sAZYJf8iJPYhdHduJHJR7
         6/zGL6Fsue9sNA9+ZNo5R+c9s+0P75ijzjbAM69H8P6CjlV0a2iNSrSTqQ6+tvnEkiWj
         vITg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e17PYVKB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c76eab8cdcsi3425485a.500.2025.04.02.15.24.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Apr 2025 15:24:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e17PYVKB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u06Uy-0004dg-Ov; Wed, 02 Apr 2025 18:23:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06Uv-0004cy-RN
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 18:23:49 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1u06Uu-0002NC-41
 for qemu-arm@nongnu.org; Wed, 02 Apr 2025 18:23:49 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso2281105e9.3
 for <qemu-arm@nongnu.org>; Wed, 02 Apr 2025 15:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743632626; x=1744237426; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nUYX2kXnCOGEv2tsFjiwF/vNelOghwEQOe8hhegma5c=;
 b=e17PYVKBg4+8Bqx7YckLknY4Aizh7GHFTzpcHSYQWM0IiiepDHiSN9AEp89s2woYuH
 j7WEikHob8vlV8pikYXZfHyjL/QZVbQO4E+TnWR7BG7jv1ox77QYWS1FjCpatWFixV1P
 BWVUvECsu7bvOYKuDURzjVu08P4BySgfTzBNSwOg7E8/yOALfT7+mbTReHsYlsW10mZ5
 nIklxlEvM9O3e2VJJ2wBdMMaKeL5/wsaG38N1kFU0w5u/9oFKSDjojTZ+rYcA17K+4Au
 JgSlpOZ9iaVEBHxkTPAbbZJ7agVez99HZ/g0Ple0+EUCCY6pOdYkkVCWHFCkZ96QRFwm
 jxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743632626; x=1744237426;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nUYX2kXnCOGEv2tsFjiwF/vNelOghwEQOe8hhegma5c=;
 b=WEte9ejruy4NExs2V/XLfKyqFbaydD7Mc6M9k/Q9adVrggKDO65Bvg3gfblinJDdYd
 6p3WLM2p7RngjAElIX/nzjKGIAxq9/Fcgqt4brxkga5qQnTc4taBPDPlDW/kjCq81UZx
 ZA669ckcV82v3CkcR/Nc5lDJqVR03cj521OWz1tFSlMaSOnc20jsajSvtWBcdqQqUh01
 gb3Oo6ewEMMPUQlazBbbOLldOzAwsyK78jUAoyn8aE+YFZlj8AYuhmyEOH2csv6/oSMJ
 LcmyznSywPmFE65XBoF4icfWiO3HrS8CaICMi7VhOPkRidfRcWw4CdIScaitO1U/sJX1
 H8Qg==
X-Gm-Message-State: AOJu0YymMPPuOOdtOX4YukiofY713TUcMWcNNFY70uIV9Dj/+R1nGulW
 keklkB/MJSfgBYSLfd7c/6qUMTEm116o+5crhuh1jzHDaXjSwjKiEex/J+OpbxE=
X-Gm-Gg: ASbGncs2Yel1KAjgtWawPigmm28M4sGWNkXDC8KGwb/Szc245Shjqk9JSgUe8RSg5uo
 NllEN+YfIwkXOF1P7ILuQS/lGMAGpIwvXB7h8VnHfW0no8LgJNnHJYmTNBP7lIi6/mOmkkkqD1T
 OLTtj/6HUsR0QqtNiSWT8IineTl4DCt8lE3xB/4t2MblgaYiyGUYbx6JlTwr+SSfFGcuTisgRo8
 OT5GYWMbX5GGYxMUACni5YRN24RM4FNm+oNtCbkH/xVfnzmaaTWCwW5WczeygQrm4rA+lloz8eZ
 521n+nWgY+vcDIGTs1XPPBX0f19LAtqokyLfkgFSrtCa69E5LcGnSvWwuqZ6dOnkzWXNocQybpe
 FCuR+fJCd5s7rJ0LI+Mo=
X-Received: by 2002:a05:600c:4f03:b0:43d:7a:471f with SMTP id
 5b1f17b1804b1-43eb5c2bee4mr34103485e9.18.1743632626544; 
 Wed, 02 Apr 2025 15:23:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec364ec90sm178875e9.27.2025.04.02.15.23.45
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Apr 2025 15:23:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.1 02/13] target/arm/qmp: Include missing 'cpu.h' header
Date: Thu,  3 Apr 2025 00:23:22 +0200
Message-ID: <20250402222334.66511-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250402222334.66511-1-philmd@linaro.org>
References: <20250402222334.66511-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-TUID: m+DaI0HgmEAP

arm-qmp-cmds.c uses ARM_MAX_VQ, which is defined in "cpu.h".
Include the latter to avoid when refactoring unrelated headers:

  target/arm/arm-qmp-cmds.c:83:19: error: use of undeclared identifier 'ARM_MAX_VQ'
     83 | QEMU_BUILD_BUG_ON(ARM_MAX_VQ > 16);
        |                   ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/arm-qmp-cmds.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/arm-qmp-cmds.c b/target/arm/arm-qmp-cmds.c
index 883c0a0e8cc..d654be2a619 100644
--- a/target/arm/arm-qmp-cmds.c
+++ b/target/arm/arm-qmp-cmds.c
@@ -30,6 +30,7 @@
 #include "qapi/qapi-commands-misc-target.h"
 #include "qobject/qdict.h"
 #include "qom/qom-qobject.h"
+#include "cpu.h"
 
 static GICCapability *gic_cap_new(int version)
 {
-- 
2.47.1

