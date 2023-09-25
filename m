Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp175832ejc;
        Sun, 24 Sep 2023 23:23:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEX4MxWt4Wmnn1F4WQfB2UK1UabueghSBVwkyNXSH0qpIIykTUo806x5WOzDLYpGGHi2Sdu
X-Received: by 2002:a05:622a:1826:b0:417:92d0:d13b with SMTP id t38-20020a05622a182600b0041792d0d13bmr7095460qtc.11.1695622992739;
        Sun, 24 Sep 2023 23:23:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695622992; cv=none;
        d=google.com; s=arc-20160816;
        b=toPipcyzyZZn3yA8Xna5MmCgitWF+yCW8bRRvbLtvqjnkreP+8I+ZCqhUBzod+UFMl
         Aeo/APyuhv6XJl5v5XcCTMPkr/HI2WRBplS3AIOe/XqCEEkmhA1UAjl1K/+1xAK4koIM
         KOGSgKcE7qxhJ1UYLjJGEJQ4nSE8d2P80/aqKuSKc5uO4jSTxm/IIpElE67C3npe2pCi
         QSH5UkCb+Li0xQrJmrZYnompuKISjkwiX2hesv1HxeKYP4WMscocl/LN7vCJkeENLKOQ
         UgAQAjUL+zNyRMl66hzy9jorH6OVz+JSjCWBsgXILY/wp4V6H2POpd3zx3AwBz+Xhfsq
         z/ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=SP6r/i/ty5vnsKhToKJGT84ilXlerfNK1h8aBbma2qI=;
        fh=yDe2PgTwau8NaigTs+vwSCoIrW5WxdPvSd4MJ9AQVRM=;
        b=heEzEnwJC75AuQ3ZJPQbbiVbNGRUoLvxBbGsHqPdtBIqmrKPOK44lpj10G0DZgBJqv
         fzt1XoxS/H55Kc+R/TN+A1uWJYhtXav8qjLGcfrGgAuhTQuTjR8JUd+tORY6TpR/57Ly
         BnWuRf8DZpXkSu1GqAXVGAy0Pqmm7xBLgCGugAg+d1hEqyR+MZD0EPefth1Nrhtff1A9
         AFGAvR2L/vxlNunnqR5RbajLQk94elglcYBBPXjzokawAaufvzHPck0/NFIjnNYKG4ST
         Dy5riKT+sGQK9DbKr9qa/Z/+zD8x4sfWpRmdsXPmYUwDhaLEGmKgK8+xMe639o4HYIj/
         3vUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=Q6vxALAZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020ac85753000000b0040f776e424asi5844675qtx.612.2023.09.24.23.23.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 24 Sep 2023 23:23:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@codeconstruct.com.au header.s=2022a header.b=Q6vxALAZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=codeconstruct.com.au
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qkezn-0001G8-P6; Mon, 25 Sep 2023 02:23:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qkezY-0001Cj-7Y; Mon, 25 Sep 2023 02:22:49 -0400
Received: from pi.codeconstruct.com.au ([203.29.241.158]
 helo=codeconstruct.com.au)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@codeconstruct.com.au>)
 id 1qkezV-00052U-R9; Mon, 25 Sep 2023 02:22:47 -0400
Received: from localhost.localdomain
 (ppp118-210-175-231.adl-adc-lon-bras34.tpg.internode.on.net
 [118.210.175.231])
 by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E765920174;
 Mon, 25 Sep 2023 14:22:31 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codeconstruct.com.au; s=2022a; t=1695622953;
 bh=SP6r/i/ty5vnsKhToKJGT84ilXlerfNK1h8aBbma2qI=;
 h=From:To:Cc:Subject:Date;
 b=Q6vxALAZMxuepBJPAJBSK6YGbZ5uOAZdJEOSoZFoStPIAjgWiWpYtcQExmjUkGCwS
 dgbWE6+NiEyuHlIgjuqjmbFi7oZE2r0roz0dQ1BHva9vGz2STYxvtyXZfZG3YzkTGH
 Zgtp83kMNoQCbQVAWP/FxoWx8rF7hgHsneHBhYoQD+ywzwS7R3VOCt4I5G7xDI4RL7
 XslY4I0e+/mGTEL6rl671HoG5KHin+Mo8XaHcsTNWk98MQa3sSpLTukmiP2RMz6fng
 gcdmWNAEIzmizwOEp3/woB7KPkStC8hPQfvv4CaTBx0K7ckg4BOgbHroaVM4mHHpoI
 Wc/mtknPmbfLw==
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: clg@kaod.org,
	andrew@aj.id.au
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, joel@jms.id.au,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH] MAINTAINERS: aspeed: Update Andrew's email address
Date: Mon, 25 Sep 2023 15:52:12 +0930
Message-Id: <20230925062212.66112-1-andrew@codeconstruct.com.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.29.241.158;
 envelope-from=andrew@codeconstruct.com.au; helo=codeconstruct.com.au
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
X-TUID: EEniChIEjZ2c

I've changed employers, have company email that deals with patch-based
workflows without too much of a headache, and am trying to steer some
content out of my personal mail.

Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---

Hi Cédric, do you mind including this in your Aspeed queue?

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 355b1960ce46..b142c09628b9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1108,7 +1108,7 @@ F: docs/system/arm/emcraft-sf2.rst
 ASPEED BMCs
 M: Cédric Le Goater <clg@kaod.org>
 M: Peter Maydell <peter.maydell@linaro.org>
-R: Andrew Jeffery <andrew@aj.id.au>
+R: Andrew Jeffery <andrew@codeconstruct.com.au>
 R: Joel Stanley <joel@jms.id.au>
 L: qemu-arm@nongnu.org
 S: Maintained
-- 
2.39.2

