Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6439597wrt;
        Wed, 3 Oct 2018 08:15:50 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62QYzOOv6Hgvjg1qtlk1doPrZggkysVWgYpd3q+BzJPK1zMeRmUyyvSF0PlvZMnCyIaCRZC
X-Received: by 2002:ac8:185d:: with SMTP id n29-v6mr1696531qtk.10.1538579750855;
        Wed, 03 Oct 2018 08:15:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538579750; cv=none;
        d=google.com; s=arc-20160816;
        b=ltQfz4yCjd7IyD5MFY1edW7IQ5NbcG2YHf3Pk0NhUkiNAcit1U64g0kXrUQr7Yxr8R
         Ekr9Q3MkuCLX2RtIVK5tB2blUC15oiBMd7DW1IHhOIwivu6KPmVMiaepdRlHUIcXH21N
         CkI82FDG5Xfk6mozFtQw59B5tD3ajML0QfAeICpx5FkYugkCCxGAs/1KYrsVkHFJPb2h
         rJ1xEKWu6+EMpzS4/FjFHMlqqyGenI0Apu7aGmhBlPBl5DrgyDHA8Y68e+wOlBWTfpj6
         Bb9KBmaNmGeuWtfirP4pELiOq29NignPIcz3wcMPOYgwDdN2oDDbl0aYoAXQefO0Teqo
         cflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=pe5mtR+X2wlzLEwpldtMZ2hwzGyR0Tnoqvt/A9kTlIY=;
        b=dnFFDMelO7DHt3gI7PXtZrBG8ThO9F80Mo/nFDBU6bgcwe5W5HQZMEz/vAUk3edgjv
         BJfhHruzRLDxAzrkTGBEW5ktVr8IXBo1/QitBeNKOtwqGQbnbZXH+b8l/u2qTekuHrK1
         EtixV3KgkVYwPBcvqBqUgY/AYYUJ6onZzAEIN3wMRS4O7S6kYj1pcYuLeW/Xq9hL3JAD
         dVr5/alOF/3emZQ7NOiUl7RXPnzI2NEP8ATgLZHTPygUoPUQqbwK3qDdvCvG0Uxu7ZOP
         41ZeMnLm7h6RAOZM8RfiQCN6QESiTNeD3tCBuaxTQyXmqK3bjvyCTLXCUKZ9m39vJTwm
         l7Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XwyJjDmS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t16-v6si1031642qvh.46.2018.10.03.08.15.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 08:15:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XwyJjDmS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:49270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7isQ-000424-8a
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 11:15:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7ipe-0001hS-6d
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:12:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1g7ipd-0006LB-J9
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 11:12:58 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:46142)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1g7ipa-0006K0-Hr; Wed, 03 Oct 2018 11:12:54 -0400
Received: by mail-pl1-x643.google.com with SMTP id v5-v6so3626522plz.13;
	Wed, 03 Oct 2018 08:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=pe5mtR+X2wlzLEwpldtMZ2hwzGyR0Tnoqvt/A9kTlIY=;
	b=XwyJjDmS6oy1O9/ptBAm7odBam8bAUepxxUnPgzSB1yMIIVksgRMwbOzh/zcC2A5dJ
	knfdf/SzTdbl6M7jcNVqb0EI6vk3rWtRDC9obTO8DRJhre1ZiQUZSU0wIVeyienieN4+
	JSO0oa0B5+92q00SExsSwjVreKlIvJI8A3nZ6M5iZd0UMXhWMAyq6i6cQVeILyn2JZcD
	3aHiNYHBMMJzuinviQpV/49MCn+V16u3Yk2bxg314qTq/ZEUlVc+s682pKqxoW6A34YS
	kgBeXxvxXt/RxKk5CIcoqbzQJNWGekRdcZyt2sGukT/bnBDRBTZGRpdHXgltwk8b3/lY
	TfGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=pe5mtR+X2wlzLEwpldtMZ2hwzGyR0Tnoqvt/A9kTlIY=;
	b=G0lGRaFMIRDYRHczZTx+VvRrrrxAVcoIVUbTcKvYePXs2+xhko/LdQC0qtijsVGkHt
	fFOIA2zz4XwOYeXeJ0zDAMYVtK09FKWh2vUnn/WuxRiJhquZBJVCyTCR9nsgxWJFMDvH
	nA7kT60jOEyQbUWUp2foKegKUziye2Di3/C5zpfSRBUcyL/nQHmZM4P2ALXYGn/eIBWj
	p0SV74SeaP1Br10xNWdRQ3qIH4GMLqIY2+rQU9xfVGCwoketoGKqHiShaXmanKcPhdIs
	k4e/9vqDWIDIMgEUIWDamlBgJKE+qX8Ftpsa5fbfr/FPgpojX9ir2/LYtgXX0QQr8tnh
	1f0Q==
X-Gm-Message-State: ABuFfoj5z8+SafLOmHxAAnUGVeHQ96lqMREBQLdOUWjRsTLP7I/rGTHt
	mfMcsl1ReKjhT+lewakLbmKG94lOExk=
X-Received: by 2002:a17:902:4503:: with SMTP id
	m3-v6mr2066707pld.168.1538579573079; 
	Wed, 03 Oct 2018 08:12:53 -0700 (PDT)
Received: from localhost ([149.199.62.254]) by smtp.gmail.com with ESMTPSA id
	g5-v6sm3297298pfk.160.2018.10.03.08.12.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 08:12:51 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed,  3 Oct 2018 22:07:42 +0700
Message-Id: <1538579266-8389-9-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: [Qemu-arm] [PATCH v1 08/12] net: cadence_gem: Announce 64bit
 addressing support
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
	edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
	frasse.iglesias@gmail.com, alistair@alistair23.me,
	richard.henderson@linaro.org, frederic.konrad@adacore.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E6DuKBmLqAxj

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Announce 64bit addressing support.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/net/cadence_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index f93cd8e..fc81fb5 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -142,6 +142,7 @@
 #define GEM_DESCONF4      (0x0000028C/4)
 #define GEM_DESCONF5      (0x00000290/4)
 #define GEM_DESCONF6      (0x00000294/4)
+#define GEM_DESCONF6_64B_MASK (1U << 23)
 #define GEM_DESCONF7      (0x00000298/4)
 
 #define GEM_INT_Q1_STATUS               (0x00000400 / 4)
@@ -1300,7 +1301,7 @@ static void gem_reset(DeviceState *d)
     s->regs[GEM_DESCONF] = 0x02500111;
     s->regs[GEM_DESCONF2] = 0x2ab13fff;
     s->regs[GEM_DESCONF5] = 0x002f2045;
-    s->regs[GEM_DESCONF6] = 0x0;
+    s->regs[GEM_DESCONF6] = GEM_DESCONF6_64B_MASK;
 
     queues_mask = MAKE_64BIT_MASK(1, s->num_priority_queues - 1);
     s->regs[GEM_DESCONF6] |= queues_mask;
-- 
2.7.4

