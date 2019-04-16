Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3365663wrx;
        Mon, 15 Apr 2019 18:40:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwRsA1vQ010RbJzmgfx6DGil5HogiM2M2cTqO9yvAKjqtjjR/ieXb44iCvJh42A+UHBMdBh
X-Received: by 2002:a1c:9ec7:: with SMTP id h190mr25348672wme.105.1555378805924;
        Mon, 15 Apr 2019 18:40:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555378805; cv=none;
        d=google.com; s=arc-20160816;
        b=r0V0+u4FT2DTLaMZJN7SmTPd+Uzo9Pu0l40fTWzfVVRFhIHLJT1vJz+gnJkthgTtUx
         2GJ0lfTUzQ9u4PVm+i9FTlN2ezqjAl/LDOx+40ID9PG87jaGjJV0efhnHyC3v7qP75R5
         0jgmboGoT8lmWaLE9jHETIlNgwj5aatnAz9wQYeFdtVLCJ+plyB9B20dgtYG7KgIff5a
         QNShN+0Ed2R/pKpwGuQmtG6N3eWRzPubF9HobyJU45NtwvSchsNlbfsm0bkDJ/ser5IR
         mBdIQ+NH0I+09LyeQI6DBAxRSdKIfFLMf+RiQSAftKD5C8yNtODkgAU1ig0CNSEe2yX6
         HLIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=CcQQ1rkcReYyRFd9q5NYZ7+MasgATUr095l6CTEOr7Y=;
        b=ECa4XQs1mU4amND0iWNs5qM2QJQ7un5eGNK+4TYWmPpi+73PiHG3hiW57XGJj06zKK
         NvS0IfmxDznUcz4aLp543/iAgwjwkPJtNbgeVj7YX2gFryyhwZto8b6tqvqSJFW7Skmg
         45TbETD9m7JmyP0WiCLOVGKjgfbddAO9AtUdx6DsHxgvqIlhlt1Tx4f+E23Xt91DUfQW
         3TKcw7zlCyyF08+3m8h7IxF1t5OOd2P0v8pAI8Zfbm+phM89MJKaqpFw7YTqmdl4sFDM
         vlMRaNz4DeyBFi+Qo7zRicRfR4hVE/oUVWwpjm5OOSovJcl/KyftUp5JMTZq1eTl3tKi
         BxnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SviWkZY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5si30016566wrn.202.2019.04.15.18.40.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 18:40:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SviWkZY4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:57786 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGD4v-0006l1-2M
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 21:40:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1hGD4S-0006Sz-4t
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 21:39:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1hGD4R-0007oO-62
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 21:39:36 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42189)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1hGD4Q-0007nx-VF; Mon, 15 Apr 2019 21:39:35 -0400
Received: by mail-pl1-x643.google.com with SMTP id cv12so9486410plb.9;
	Mon, 15 Apr 2019 18:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CcQQ1rkcReYyRFd9q5NYZ7+MasgATUr095l6CTEOr7Y=;
	b=SviWkZY4+p8LG0okjkXBCXUUPEEe4r/RynlgwM8g6ISPu1s0/hHQzETzjSRtdIUi3P
	rDByzE2ABy9xwI+nFiDXhD3k5JjUSlwwRwe6Ff6rKrZZaEaSvQ1hv4xy8VT+57gXeOYK
	Sq5EkFKyLDl9AC+xyjnC1Kmr+jYMN7GNTBkuSs0QnvfvU5KIRJS+GhHDLyxfeIkEVSDm
	s3CEveuEckhlGNRYgreYt/hiaN3SoOV0X4tc4s6rD5WIxt3M6D9g+Mq8+JrTTC423WEv
	98yEho6T+8kct0O+Q5xS5jTOsxFRaZXIityMK2tSKJ13fX2H4Dabqy9RuMpLXG9CzB7y
	MyLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=CcQQ1rkcReYyRFd9q5NYZ7+MasgATUr095l6CTEOr7Y=;
	b=PYIrsVQRqg/5GGI606879Vjo5BezDPH+fBPgNT1Mo4y9ewXDzPj/FFMDUzEGfEJDS6
	96quGuwKYHf8yOn25jmOuyXqOOfgr3jDe+orlu4R5Eqs7JPVPTS738szudWT+9pFMdIb
	4bN5Mj0Cyupa9VAedHT4cjodeUv552nkqIrH7Q6dJ4dPVlKE3DxmTc/AjfK/jJdJP+rM
	X6HH2ckdPq8lc0eO/UQtrOr9ELXGxNP3C/+BiYpC3aiDyqUnHsMkaTDNOErquTh1sFEO
	6IlS09YxmHlA7//8tuW34k3+fpZmkcW/X8rTnF+b/clFYAQl3ShnBsOVIFn2NwOXtR+L
	D09w==
X-Gm-Message-State: APjAAAU5w6MRajiJt6jT/xB38zPRKfvxtFPk6svOi68aOG6AQ4NGzS7R
	/cLtdigEbbzX41k+0p60AvRpMlfJ
X-Received: by 2002:a17:902:2aeb:: with SMTP id
	j98mr12371326plb.38.1555378773820; 
	Mon, 15 Apr 2019 18:39:33 -0700 (PDT)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	v20sm74710362pfn.116.2019.04.15.18.39.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 18:39:32 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Apr 2019 18:39:01 -0700
Message-Id: <20190416013902.4941-5-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416013902.4941-1-andrew.smirnov@gmail.com>
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH 4/5] pci: designware: Update MSI mapping when MSI
 address changes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	"Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7iowO37nDE9L

MSI mapping needs to be update when MSI address changes, so add the
code to do so.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
---
 hw/pci-host/designware.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 6affe823c0..e80facc4a0 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -289,11 +289,13 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
     case DESIGNWARE_PCIE_MSI_ADDR_LO:
         root->msi.base &= 0xFFFFFFFF00000000ULL;
         root->msi.base |= val;
+        designware_pcie_root_update_msi_mapping(root);
         break;
 
     case DESIGNWARE_PCIE_MSI_ADDR_HI:
         root->msi.base &= 0x00000000FFFFFFFFULL;
         root->msi.base |= (uint64_t)val << 32;
+        designware_pcie_root_update_msi_mapping(root);
         break;
 
     case DESIGNWARE_PCIE_MSI_INTR0_ENABLE:
-- 
2.20.1

