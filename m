Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1387883njm;
        Thu, 6 Mar 2025 02:43:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX7dmxMS2wyBVZ7Ms914VaqSi+N0CdWEnQsUqv0uG6qajX5LByk7BAcytHAldcACLRxeB6YmAnR7VqAXw==@linaro.org
X-Google-Smtp-Source: AGHT+IHZnqXiaCMFUyZU3SVibo7UpeMzhK2Zi7aRKE5/G9nRo0Dfd3K9SdpCJV5vcJQhk77w/IVd
X-Received: by 2002:a05:620a:4892:b0:7c3:beed:d46a with SMTP id af79cd13be357-7c3d8ee1cd2mr926997485a.38.1741257787020;
        Thu, 06 Mar 2025 02:43:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741257787; cv=none;
        d=google.com; s=arc-20240605;
        b=I0FKSZ+4mLra0rHxkrqiNNRhdmk81U5PNFARsDBg9oh19NwCEwuy8+nJl7IqtlxU9S
         Lb14+IXZC32nneUSe0sZenDM1VmNxoPsnPd0mZN/gWBPlQgCENvT8y+L6zyzXH7AARcw
         WEdvZHNj2/GjibYq901+zHpcj5PHdMIwU9VaspDvu0K22e0dQr6FgkuXeR2r/pOhwm9j
         HnYZwn0yTtxU5LkfSiDAZDsbkj1aPY68c0t8jquXYLIKZTgg47tko+ZqUbI3zVAXBrdM
         6pyS2dhQvwlYdl4quOcbjpbNXhZ/AX4lCZRxjzkkrapWSXxJKr/uz1LAl2vqTEYVqlXZ
         /9QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=ywQu6K2OmBEOp/4ryDG/LqAqBrINNAftZZkrAvB5t5I=;
        fh=3cFqTtzBuOtpuAUHgGIZLk2EDwH0HGw77jNYFWHrQKI=;
        b=ikpfvdw7o5SX3lpB+mx6O6tGha/nv6uC8Glttp+7hbrtQp7vELP+XikGxzEKYrLzPj
         PgOmN1NuCsPJFIYSANp+4se2a+5XV2Gz14FIzuQu0H7giowIwn+AS31/rsV9bWtJ0UBD
         Y5TV3Bpsi+DYYswpzNUosE3BPyoqiDMrPwGT8tLlGJCe3fYQLtI54fVG3YXKdgPLeW8G
         O+TfbsBYkl+BVdr55qKDB/aNAWZdTEpD7qCDluaUGzAj4hDPGyc75pjvWi6lyQBNJFt1
         FjLX9tvxGKGTqGYoyOOCKfk9+fyZtjlCLAa4wlJrVv536DL9eG+cdt0Wwv4JERJFi/KL
         tOiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db3c484si9179381cf.590.2025.03.06.02.43.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 02:43:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tq8eP-0006ec-SG; Thu, 06 Mar 2025 05:40:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8eJ-0006Ha-Tu; Thu, 06 Mar 2025 05:40:20 -0500
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1tq8eH-0000XB-Vy; Thu, 06 Mar 2025 05:40:19 -0500
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Thu, 6 Mar
 2025 18:38:53 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Thu, 6 Mar 2025 18:38:53 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v5 18/29] hw/misc/aspeed_scu: Add Support for AST2700/AST2750
 A1 Silicon Revisions
Date: Thu, 6 Mar 2025 18:38:26 +0800
Message-ID: <20250306103846.429221-19-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
References: <20250306103846.429221-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_FAIL=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5MUcgZ/jIRnk

Added new definitions for AST2700_A1_SILICON_REV and AST2750_A1_SILICON_REV to
identify the A1 silicon revisions.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/misc/aspeed_scu.h | 2 ++
 hw/misc/aspeed_scu.c         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 356be95e45..684b48b722 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -54,6 +54,8 @@ struct AspeedSCUState {
 #define AST2700_A0_SILICON_REV   0x06000103U
 #define AST2720_A0_SILICON_REV   0x06000203U
 #define AST2750_A0_SILICON_REV   0x06000003U
+#define AST2700_A1_SILICON_REV   0x06010103U
+#define AST2750_A1_SILICON_REV   0x06010003U
 
 #define ASPEED_IS_AST2500(si_rev)     ((((si_rev) >> 24) & 0xff) == 0x04)
 
diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 0581c744f1..76cfd91671 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -560,6 +560,8 @@ static uint32_t aspeed_silicon_revs[] = {
     AST2700_A0_SILICON_REV,
     AST2720_A0_SILICON_REV,
     AST2750_A0_SILICON_REV,
+    AST2700_A1_SILICON_REV,
+    AST2750_A1_SILICON_REV,
 };
 
 bool is_supported_silicon_rev(uint32_t silicon_rev)
-- 
2.43.0

