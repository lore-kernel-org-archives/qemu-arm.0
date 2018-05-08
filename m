Received: by 10.28.4.212 with SMTP id 203csp4286300wme;
        Tue, 8 May 2018 08:13:06 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpA+xRsM/oUtV1U8+it9eoFKOISCVgwwKxjSRC9QAQ+Q6BdffsJ3n5rPzYyortY1iSS7UHF
X-Received: by 2002:a0c:f513:: with SMTP id j19-v6mr118229qvm.84.1525792386819;
        Tue, 08 May 2018 08:13:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525792386; cv=none;
        d=google.com; s=arc-20160816;
        b=0CG4ir9cuc5rbgXiLtP/2ePe3e/qYR2+qn8EA6YoWXZ/QgyX5K8vupPjFp42klr04i
         G50/VAt4rafCuHAc1LEPv7ECz/ZszIeRdUOESvHyNRqMC6/0NdEq8jnDO1SADn0FQetS
         2hhdlZe3F3F1QPQiCk+e/LI+iit7Uh01i6nIpmzEBHuIju4UKGzyPYmR3cT9jGEe+7J0
         k2eo04Ktk+kmZNDo6M2FVF1QUDGAbAQJQLTSxgc+yj7v8fK+uE2oyP5DZF+PSeUsltky
         sf5cLX5QRPWn4xBlF4JMy54F2XwwwKoyRUTXv71L1wa5K68/aMho3rH7JRIluu2JyEps
         0Bzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=8MsjvdO7/TSnKav+lO9zd9hVrZKYxN28gXu7dITE7sg=;
        b=PyBMzMykQkvnkwhznDFgUbf+NrcY7hpoerM3UgxMBe/jEALPeY26b9HzW1t/yQ9d9X
         HuPVIYCCf5Kac5FfbYAp5Dvsey3EqmjnHEuFKGDUJOMyIyFSGyOijgPkeJVVFi2EYCsa
         LSWKJ25ABRgHsTVUnxCGb8+x2ykXnsCghBnt/vQCMLXDee/UlqizosD32R7MEk1VzzSC
         76Wc4+P5kGzP4+SYv+VNIjx0txVKjXtUBPJzH0Bc+y6yC+JmV6r9wj4S46LAC58I5NoL
         mEi1a/fk3jVPsrbxxy8spi9hTOekY81jAAvgvLrfuzUdGobM82MRvoau5LxZDoCvbySx
         V5wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rcUKLq3W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o66si1490140qki.77.2018.05.08.08.13.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 08:13:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rcUKLq3W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fG4Ic-0003x2-7S
	for alex.bennee@linaro.org; Tue, 08 May 2018 11:13:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57939)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG4GQ-0002gp-HR
	for qemu-devel@nongnu.org; Tue, 08 May 2018 11:10:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG4GP-000555-Hw
	for qemu-devel@nongnu.org; Tue, 08 May 2018 11:10:50 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33008)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG4GP-00054c-D5; Tue, 08 May 2018 11:10:49 -0400
Received: by mail-qk0-x242.google.com with SMTP id c11so1259802qkm.0;
	Tue, 08 May 2018 08:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8MsjvdO7/TSnKav+lO9zd9hVrZKYxN28gXu7dITE7sg=;
	b=rcUKLq3WtnNmd4azcTG4r5wDVx+anZgToCi5jBoqhTFaSk/Tu0NQhvETAx0VMwEGCL
	E9RDXo2pJOhLh0TTZLp4AMc2y0RWkwVyW3r2ZG7BSDbF2f3bIZ2bKviRn1PCQ0vNMhug
	ZbVYuMK/1aY9ydrRzweJUWs7Sfi4/IsA/k1Iij5UjxtcD/HGPJChaQDeocjZiH8G1NJe
	vn7D0oFiTXpHU8GC4A4rx6nTYR17JrTsqSOSxY1YjYzs1d6zvKcu989xce0RA8JGQtsO
	vHfbt+uAsyN4Dppjl+A5uDrAHgg2kkarrED/JVrAhJWeyIu/xHMvdpQMwTwzkfTTEfEb
	Fisg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8MsjvdO7/TSnKav+lO9zd9hVrZKYxN28gXu7dITE7sg=;
	b=fnfq/esqWNAQDR1knhYqL7K6uEa40S9lUHK+x8DrLBsHIqh8B0j6D93x8NgqxfRrRX
	eZwFI0u0Fc7asF9mFj6yQxwjHuUN68BkVUol4nYxg04CzwRU9KwljRprb/KCYSVD6ysX
	+zo3WuxJ3iWbl/OKpBE6rcC5l6VIGegubBDisgFGsRsxR3lXGBoxeycT4gAES7u98SFF
	y02WA8oO9cJRHRPtgw57czeuZdKtwxEun/oKJhoElNKPabHIttzbvJ3nJ9kIjzfmrG8w
	z85xZPvVLfkwaq4FlsYEgtn44LeOgZv3ApVyvu20u+McnHm3VMYkPcD8PbYUQE/wJQVD
	uYhg==
X-Gm-Message-State: ALKqPwf9IFpH/h7OxE7zPRRU+jSwbjk5YIPua6tErW37CytCsS+cheBM
	Riw8x/+49nG3n2iHEj8GxvM=
X-Received: by 10.55.125.131 with SMTP id y125mr7808530qkc.60.1525792248946;
	Tue, 08 May 2018 08:10:48 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w12-v6sm13305015qtb.80.2018.05.08.08.10.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 May 2018 08:10:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Tue,  8 May 2018 12:10:34 -0300
Message-Id: <20180508151035.16774-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180508151035.16774-1-f4bug@amsat.org>
References: <20180508151035.16774-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-devel] [RFC PATCH 3/4] hw/ssi: Remove SSIBus from
 qemu/typedefs.h
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 43eXEoAvAMbc

There are only two files requiring this typedef (strongarm.h
and hw/arm/pxa.h), let them include "hw/pcmcia.h" directly to
simplify qemu/typedefs.h.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/strongarm.h      | 1 +
 include/hw/arm/pxa.h    | 1 +
 include/hw/ssi/ssi.h    | 1 +
 include/qemu/typedefs.h | 1 -
 4 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/strongarm.h b/hw/arm/strongarm.h
index e98840b461..ae51a1ae34 100644
--- a/hw/arm/strongarm.h
+++ b/hw/arm/strongarm.h
@@ -3,6 +3,7 @@
 
 #include "exec/memory.h"
 #include "target/arm/cpu-qom.h"
+#include "hw/ssi/ssi.h"
 
 #define SA_CS0          0x00000000
 #define SA_CS1          0x08000000
diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index f6dfb5c0cf..f184349f02 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -13,6 +13,7 @@
 #include "exec/memory.h"
 #include "target/arm/cpu-qom.h"
 #include "hw/pcmcia.h"
+#include "hw/ssi/ssi.h"
 
 /* Interrupt numbers */
 # define PXA2XX_PIC_SSP3	0
diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
index 6a0c3c3cdb..bdbf3c51f5 100644
--- a/include/hw/ssi/ssi.h
+++ b/include/hw/ssi/ssi.h
@@ -13,6 +13,7 @@
 
 #include "hw/qdev.h"
 
+typedef struct SSIBus SSIBus;
 typedef struct SSISlave SSISlave;
 typedef struct SSISlaveClass SSISlaveClass;
 typedef enum SSICSMode SSICSMode;
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index c7a0159bd2..b4dc63a466 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -106,7 +106,6 @@ typedef struct Range Range;
 typedef struct SerialState SerialState;
 typedef struct SHPCDevice SHPCDevice;
 typedef struct SMBusDevice SMBusDevice;
-typedef struct SSIBus SSIBus;
 typedef struct uWireSlave uWireSlave;
 typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
-- 
2.17.0

