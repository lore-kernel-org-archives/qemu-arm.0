Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1415716lfc;
        Thu, 4 Jun 2020 05:39:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaI6NVMhL7hsTZ9MI4X30Y1buJov5Zisw+8W9rW8Hp3VwDCgi4GWZfseEEiD3wJJEcBRwF
X-Received: by 2002:a25:c052:: with SMTP id c79mr5241275ybf.23.1591274374655;
        Thu, 04 Jun 2020 05:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591274374; cv=none;
        d=google.com; s=arc-20160816;
        b=Gst7tNudQHGb9b2BL57fIew16oFxhtmFCeIXZaMqvgqfEhZ/VThAQf2fMv9C4+vDIu
         bmHv1DTpSDevttiJDNfJudbOUmLPynO+bU1u3Agfw0iPzERVLTOwUUKJDuA+9p82vrHT
         95Jl2JtrbfvonMCdxtUpKpr3j7o8I9feu9nmcAK2wagl9vFGUxzJ/M6ZxsTkXET6mLSJ
         s6Yql/ni58uBK4zHqz9t7AAgqa/hQtOr7oE+rn/tEyt2EiM1y0/VzAS301kh2f5y61i/
         hsAi5I49/fUi6SbWjVAySQFL09fJJHoNI7hkpWYPv8YEm1pbBLefgqMnGnJrx5Qkj+Nl
         TW/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=hSh9D7CL1q3FPLHEYJyp4XPbRkEQ7R2DozzN2pU4Uw0=;
        b=RRVjcWIpDnzHNPLCPb0KE2E9bvh839+aNk1ZrxNXDHvUWuwmYjVOgT59ArIKGysMpx
         RteCEelCLx8q9aoG0l0Rk4YsfyJQmOjfw6/Sxhfr6707WIhACsW17W/CeAsJV1OVT+eR
         pEVnqjSdQfG//ayfIFwmUSLhWvYtOT61HeoZ4NL/v/lhyQzSpM60t/HxuRlUpH5fXhq4
         xqV7jzFYNsDEWSwDe8ZNLypuw2m6dkvDxUecb89ovRbo3IRXjozTPFX+VUF3YcHDvG0m
         qZBqLlXFLHAi1xgXnJqY1Nl+HQjH1/uaB8YbYlYar1dlBQ2+u5VRUkpjDqAuZeq0CMZf
         JSjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e196si4025093ybb.191.2020.06.04.05.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 05:39:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:33696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgp9i-0007uX-1f
	for alex.bennee@linaro.org; Thu, 04 Jun 2020 08:39:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jgp9a-0007uL-FP; Thu, 04 Jun 2020 08:39:26 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:56975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jcd@tribudubois.net>)
 id 1jgp9Z-0001g9-BC; Thu, 04 Jun 2020 08:39:26 -0400
X-Originating-IP: 82.252.130.88
Received: from localhost.localdomain (lns-bzn-59-82-252-130-88.adsl.proxad.net
 [82.252.130.88]) (Authenticated sender: jcd@tribudubois.net)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D0CDAE0007;
 Thu,  4 Jun 2020 12:39:18 +0000 (UTC)
From: Jean-Christophe Dubois <jcd@tribudubois.net>
To: qemu-arm@nongnu.org
Subject: [PATCH v5 0/3] hw/net/imx_fec: improve the imx fec emulator
Date: Thu,  4 Jun 2020 14:39:07 +0200
Message-Id: <cover.1591272275.git.jcd@tribudubois.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.70.183.196; envelope-from=jcd@tribudubois.net;
 helo=relay4-d.mail.gandi.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 08:39:21
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, f4bug@amsat.org, peter.chubb@nicta.com.au,
 qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SS4WblEvFdT4

This series of path makes various improvement to the i.MX FEC ethernet
emulator.
  
 * PATCH 1: Convert the Ethernet emulator debug output to trace event
 * PATCH 2: Allow Ethernet PHY to be at any position on the MDIO bus
 * PATCH 3: Improve the i.MX FEC related PHY emulator by using standard
            header symbols instead of hardcoded values.

Jean-Christophe Dubois (3):
  hw/net/imx_fec: Convert debug fprintf() to trace events
  hw/net/imx_fec: Allow phy not to be the first device on the mii bus.
  hw/net/imx_fec: improve PHY implementation.

 hw/net/imx_fec.c     | 197 +++++++++++++++++++++----------------------
 hw/net/trace-events  |  18 ++++
 include/hw/net/mii.h |   4 +
 3 files changed, 119 insertions(+), 100 deletions(-)

-- 
2.25.1

