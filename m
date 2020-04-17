Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp625550lfm;
        Fri, 17 Apr 2020 08:38:28 -0700 (PDT)
X-Google-Smtp-Source: APiQypLVdJKeAEZS6TNXk1n7gmQaYox5cA8e5Z9l3ZtwF8kLiFVkhMWbjXL9sIqUcfzqGUQaOkWP
X-Received: by 2002:ac8:65cc:: with SMTP id t12mr3514083qto.310.1587137907950;
        Fri, 17 Apr 2020 08:38:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587137907; cv=none;
        d=google.com; s=arc-20160816;
        b=MaQaR1riJCxsMELaQfIkqnypq2yrh8ZbndGF33geKn0tsjuZTjo/rmx5sNeMdTubZg
         Rhs6SxKbeoU2QbZY6HbQe/pIfxNfMMNzvWiVHYZJ7g2+9OaSCBUdI3VelES3l+lco80u
         w0pujLthgP6UvdgYVj7Ori04tbJKbMZAVq/e1HFaxhQqW/Cksy48MUk320ZgCxY2Y2ag
         kv+L/e4EJfdUyTm6ssFQIPSyYaRVWjK9B6ka1gb3fQGsi3ByqiLsg+QN/TB2dlhAK9xw
         RsnyfYZpJqb51BkCnSvxpGVRUEM7UnXyWrRgNK1B5mGXOYV8W5CphJoKi+twe39d84DK
         oz9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=xyfhAq09jUqei4My7pEXi9fSF/rSRpbKjj4941MXkj8=;
        b=IaTFEVDyZRC+GzJfZb61Qg9fJfKbYMPt69jSyf91gDjEXRkK/xeKQLZ2QOCf2sKzyW
         TyJU4NWuEKTQJm8oSRaN+RM3DYSxb8No/GqO9CKN1bEvr/Aw04Rrbffz2ImcHlpct/bp
         ddqIfXIjSC+EiD6CJnx+8jbdJEih34osZzERJ0XF/jynXqiiOsNmYZxbP9799WXTcYgs
         rFa4LLYul6YztpeXAmwp5bR/HEkvCNY+BlDcTr1ZT9C83qxWXD0EEPsAcQIOqDsfzIlQ
         5orhmoL4bdR04UDuFoYUSq5vvayk7fBVeAYb7chHAdgtArS5D0AvfHFTKkUGymrAAwmu
         QyUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kmtq9j21;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si13293029qtf.319.2020.04.17.08.38.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Apr 2020 08:38:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Kmtq9j21;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jPT4V-0000Tm-4b
	for alex.bennee@linaro.org; Fri, 17 Apr 2020 11:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jPT4F-0000OJ-Rb
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 11:38:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jPT4E-0001Jc-Ot
 for qemu-arm@nongnu.org; Fri, 17 Apr 2020 11:38:11 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:36147)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jPT48-0001Fj-9a; Fri, 17 Apr 2020 11:38:04 -0400
Received: by mail-lj1-x244.google.com with SMTP id u15so2508554ljd.3;
 Fri, 17 Apr 2020 08:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xyfhAq09jUqei4My7pEXi9fSF/rSRpbKjj4941MXkj8=;
 b=Kmtq9j21V0Mjpr1sxe3pMW4jlqyyT4IwwYRPSZ1mZJnh7gvesamX6xuJQsSMJ5fFzR
 oKNvhlMotKPJ4b+bPxf42C4cLNfpp4Zuj7jEu6KyDgsg49sAaIFq1ohlKw3rwAKQkMxs
 aKd+R1NcCLCk1lYbbQZhDItjWXrJtAutsxAx3OjE1mg/P8yFBbNHG4QA5QA0DKqqJ4u8
 NGtmNIWDzIaH6dOYGtctP9GdYY3x8JqhSpjK/06a8WyR5jr8pd1adXN3Gm0td95O02ec
 aXMcNQieX4GMye3BGLpYbgFxbmBE5vAifEbJFl207scgho+bK7iroBIFxg1IDaYZ56ql
 OqFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xyfhAq09jUqei4My7pEXi9fSF/rSRpbKjj4941MXkj8=;
 b=NkGP46fy9PErrToJUd8Ykkt4sJUXRz3uwgRxbFDgboahh52rRaKgu4XUG/eNvvoCEV
 uJti/wbgjANqfGOaRlaeU9fxOY7Km4HMms9viU8EYmTBoLm/7DVa6BV8ncyHP2LZ5Sae
 UaQlUaw4fmjR9i9/u7nEhwFA9ghVmbx40C4PBR4BnpliCLlz3TJsYH7me9BAjRwyzGol
 FTCh3EVDfJfLEl053Bvy6krbrS8cK1I4zF0glT/KRUtJ/MvLKyMR5EAR5Niqd4lc6yzh
 l0B1aZ7eBXsc4IJidPMEZhAglCDXaode0SqW3XRjJYbtG0qUzHrrpDPzwD5zplpJfCtK
 6F5w==
X-Gm-Message-State: AGi0Pubr2mszy6iXzR7yoTjBcsZs+8jPlVlhNp6A0pkR/X4rNLIryxpu
 W93ggZoK5eGmFiL/uAWgtgdoOljUf5w3Vw==
X-Received: by 2002:a05:651c:8c:: with SMTP id 12mr2538206ljq.34.1587137882682; 
 Fri, 17 Apr 2020 08:38:02 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id y8sm4137575ljh.83.2020.04.17.08.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2020 08:38:02 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/1] hw/arm: versal: Setup the ADMA with 128bit bus-width
Date: Fri, 17 Apr 2020 17:38:00 +0200
Message-Id: <20200417153800.27399-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200417153800.27399-1-edgar.iglesias@gmail.com>
References: <20200417153800.27399-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qTDGUEaGKfeU

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Setup the ADMA with 128bit bus-width. This matters when
FIXED BURST mode is used.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index cb0122a3a6..94460f2343 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -205,6 +205,8 @@ static void versal_create_admas(Versal *s, qemu_irq *pic)
 
         dev = qdev_create(NULL, "xlnx.zdma");
         s->lpd.iou.adma[i] = SYS_BUS_DEVICE(dev);
+        object_property_set_int(OBJECT(s->lpd.iou.adma[i]), 128, "bus-width",
+                                &error_abort);
         object_property_add_child(OBJECT(s), name, OBJECT(dev), &error_fatal);
         qdev_init_nofail(dev);
 
-- 
2.20.1

