Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3695595njj;
        Wed, 7 May 2025 03:11:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMF/5ZZ0qGjQiwZ3cc26D3dQbElWWcE6BTgdIbNTor7G8MDQyP+JO/t2TpTuDoontHBQ0S4T2kFC8DDg==@linaro.org
X-Google-Smtp-Source: AGHT+IFRaB8PwXQOGIBcEydM7xJg4ojI7/3dHppelvyzPHDOvJTB40gp3xDqjk+c+YsXav2J+4ZX
X-Received: by 2002:ac8:58c2:0:b0:491:1808:f6f2 with SMTP id d75a77b69052e-492265eb13dmr32199261cf.25.1746612679608;
        Wed, 07 May 2025 03:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746612679; cv=none;
        d=google.com; s=arc-20240605;
        b=cH+x4B35e/B3/4X/nsiNNYsuqno9jy8z5VCe6AhE2dYw6OVF0Xmzqqx7chHFFjzUu6
         Q2F12z6st3grUQV+VJhkKEmrZ+S99ffIkXWlTbzLPrmoH8SxHIpnKFuKUFAHg7d0ucJf
         ADAZ1D+m86+U61y3T75yAA8cWYKCSCBfskfIkeqAu83Ls2ccMgOoFrcOEVxLrC1cHqjr
         fztY8sUpxe9LHd6rt0JknkRM+wLmkeRlfwtFT57QuL5TUUZ6PUX0hxOmfa0jRW3hYt/4
         uMK/YXO8zWRAny1dv2sOIyKxV7deN1BEncWl/UV1gcevoSZjsPHVYtJNW9wvwOiv2AkR
         J6iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=vbgOdg0tNpyJQtLuXyYoeozrU51B9rtVHpavst0QsrU=;
        fh=Yg1QA3CYCa2LdK3Mf8oXZ+DbfQ0OHIFsuQO5E7pFx2w=;
        b=LJn+Qgpym3nlx2XWbMHDWrwyXN6Bti3EJmYUntI80S+5nOn6NNfEc4s+IhXLfLfRZ+
         WtbWEmncTK4z11LCRn2XGCtANNI/RyaNuqOy/l7d4KYfmEotu4HDj8feORtouZJILEHI
         K2fvkm4W3AxGmJf4e3LkQdpKe/eGxl3w+Y9oe7iQN5ncbuYwmarxuxy3/dEKBPjKgWD8
         8I2yHahJ0S6Lfi2iNo/u0m6xi7lS19Vpi3cTczksie4neMY5D6vESK9hBz3JLdnyjYPS
         wgAvYM5hCucPYSKLlEpuVr5CYuqipbLjW59q+4JORa2NjZw3KX9abwxBY9bBcuP34A9c
         5ypQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49221270471si16468541cf.187.2025.05.07.03.11.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 May 2025 03:11:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCbjL-0005ly-Qw; Wed, 07 May 2025 06:10:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uCbjK-0005lh-G0; Wed, 07 May 2025 06:10:22 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven_lee@aspeedtech.com>)
 id 1uCbjI-0004CR-Ut; Wed, 07 May 2025 06:10:22 -0400
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 7 May
 2025 18:10:06 +0800
Received: from mail.aspeedtech.com (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 7 May 2025 18:10:06 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>, Jamin Lin
 <jamin_lin@aspeedtech.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
CC: <troy_lee@aspeedtech.com>, <longzl2@lenovo.com>,
 <yunlin.tang@aspeedtech.com>, <steven_lee@aspeedtech.com>
Subject: [PATCH v1 3/3] docs: Remove ast2700fc from Aspeed family boards
Date: Wed, 7 May 2025 18:10:05 +0800
Message-ID: <20250507101005.1474823-4-steven_lee@aspeedtech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507101005.1474823-1-steven_lee@aspeedtech.com>
References: <20250507101005.1474823-1-steven_lee@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=steven_lee@aspeedtech.com; helo=TWMBX01.aspeed.com
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
Reply-to:  Steven Lee <steven_lee@aspeedtech.com>
From:  Steven Lee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: H+dhQZ8x0NUY

The ast2700fc machine is now covered in the dedicated ast2700-evb
section. Listing it in the general Aspeed board family list is
redundant.

Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
Change-Id: Ic2784d60ce4681f38059d684f477a2962ccf8bf8
---
 docs/system/arm/aspeed.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 58a8020eec..43d27d83cb 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -1,4 +1,4 @@
-Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``ast2700fc``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
+Aspeed family boards (``ast2500-evb``, ``ast2600-evb``, ``ast2700-evb``, ``bletchley-bmc``, ``fuji-bmc``, ``fby35-bmc``, ``fp5280g2-bmc``, ``g220a-bmc``, ``palmetto-bmc``, ``qcom-dc-scm-v1-bmc``, ``qcom-firework-bmc``, ``quanta-q71l-bmc``, ``rainier-bmc``, ``romulus-bmc``, ``sonorapass-bmc``, ``supermicrox11-bmc``, ``supermicrox11spi-bmc``, ``tiogapass-bmc``, ``witherspoon-bmc``, ``yosemitev2-bmc``)
 =================================================================================================================================================================================================================================================================================================================================================================================================================================
 
 The QEMU Aspeed machines model BMCs of various OpenPOWER systems and
-- 
2.34.1

