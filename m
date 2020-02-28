Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp629888lfg;
        Fri, 28 Feb 2020 04:54:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqxoGZVAjuS4CsHl/fKfcoh+JVI72qVaB6en5haxIYs+G+MpdGZTB8HCLLgzhVYY/rh0r4dZ
X-Received: by 2002:ae9:f012:: with SMTP id l18mr4424137qkg.22.1582894485666;
        Fri, 28 Feb 2020 04:54:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582894485; cv=none;
        d=google.com; s=arc-20160816;
        b=FKKIba/B2xeK84IEne0Gt92jx3wKyCAEif9MKxxF0MvDu7wk5EG++aASoPnNS4YME+
         7OFKdMoiB7tm8l/Js0Gpj3o6mJ7j2psKZW2ajKf9+L35J9DMABE/db6JKI2mwDJMNb52
         B3O0bULotxt6oQBt4Dy3og/ekD0FCKO3HWMjSfxfRpA7UN87Fg6E2JRyotd+jYFPvN2n
         Vmccnp2iLwxMussxf3Ry1fDyCMtMwe8tji0c4+Yz//ifrDZRxhvHMzl77biuPCHEGF1v
         sJZSrvOGGe/VQ3JmTmLMCo2Dzy5WZg81nq+8LSnzhOSCUNcaUz2U9GifN9EHhAFNlpI7
         huVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=RFVTFY7GEBgh7q7HWz8/cePShORRz7+aAiJuxr5/kZA=;
        b=E6ti1HooddbkeV67Mw8QLOlr6hj2oGSxzGY38Y9XGRYDbAeWoLRg+IZCRn+ZxbdmF/
         Pc789w/t7L8PP4O3KQJcmp5pnugDATcQTm+t74vKDLb5L1N9zDcxtxOcharLHOSf+1VJ
         G7ZemMjN39FHpoepVUuOmYeaXISjyQDTad0EsublhRBbuC2Kts3x4ssH0J+6i7BeOK6m
         LRyegKhzeQPwAy7TcIzyEGTKrhp/Eq8QkVJtxSemCEh+Q6L61nsBH0VVS3SN/Y0c6L32
         6czZ3siugTzkchBHl2OfeUAt3trdJaOUw8uQsYBQ6uaqyLz8OPTWoQk3BqtSTeuj6tlE
         srXw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z3QzLzgn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si1261926qkh.339.2020.02.28.04.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2020 04:54:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Z3QzLzgn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7fAD-0005tt-2B
	for alex.bennee@linaro.org; Fri, 28 Feb 2020 07:54:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j7fA1-0005kt-MR
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 07:54:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j7fA0-0002vG-Np
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 07:54:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33500
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j7fA0-0002us-Jc
 for qemu-arm@nongnu.org; Fri, 28 Feb 2020 07:54:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582894472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RFVTFY7GEBgh7q7HWz8/cePShORRz7+aAiJuxr5/kZA=;
 b=Z3QzLzgnnYw1pxRmDaawWQdAaaaVUczJJIqq0M/iM1XxyCxWdJVsRE+1eCqgE9h2EZU6xZ
 okgAIlqr+UwK64hXN6nqtfMyhZ5vySrRjQyxKHT0U5mlj20uEumfkTtqykPKkm8wsdU7Kd
 rzPHEbVPyHoRmWBc8pLwcqVfy5lLirM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-J-gikBLAO1yvGTudQPyDFg-1; Fri, 28 Feb 2020 07:54:28 -0500
X-MC-Unique: J-gikBLAO1yvGTudQPyDFg-1
Received: by mail-wr1-f70.google.com with SMTP id n23so1278723wra.20
 for <qemu-arm@nongnu.org>; Fri, 28 Feb 2020 04:54:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K6aC7TQ6a+95A3Kf8tkZ4l6ui47wA33c90/e4cK4bZs=;
 b=P92FcYJ8t3Ikv028ABva4LUqAunw6W1PDn2Us5ZhqnAYVC+3cTpj5GnwHZQYU7XXS6
 E6kFsOERO+7aiZZ8tIA9t6YjwyoVpjw8GEvyrrfpgYRUrEElL1YERFg7L8tEwpQvl1Dg
 Nsv3CEa1AHMXXuMBh11d5hAD/GwyZOwbWuMK7GrIVb9PA7ioqSqwuT4LJ4iv6M4XDSuO
 31V5HhrnhoreRtWRPNtE+CJl6qtA0B1WQJy2VD03wEEj258mXlRntQTSnv3K/ZO3wi7G
 XAfkJDhgiBtGdlV0VZXz+eOhFeiJQ4FA9XAMyiOrajlrvgBwRaABQWriHiyzGsA5VwrZ
 PF8g==
X-Gm-Message-State: APjAAAXe04TefyYDYekzW7LFS6l1VzogOJGuHF6R6G9QR2BeWAzosF8d
 Ed/SGNag2ACuMNBz+raoBb1FswhlM1U194jaJCh72P08bkQkvBup7lvkWhcwKU9Ad0KRZ6zrWUZ
 n31In3nD2YHmt
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr4981945wrw.182.1582894466974; 
 Fri, 28 Feb 2020 04:54:26 -0800 (PST)
X-Received: by 2002:a5d:6acf:: with SMTP id u15mr4981927wrw.182.1582894466774; 
 Fri, 28 Feb 2020 04:54:26 -0800 (PST)
Received: from x1w.moovbox.local ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id y7sm340988wrl.26.2020.02.28.04.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2020 04:54:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw/arm/musicpal: Simplify since the machines are
 little-endian only
Date: Fri, 28 Feb 2020 13:53:51 +0100
Message-Id: <20200228125351.29482-6-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200228125351.29482-1-philmd@redhat.com>
References: <20200228125351.29482-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrzej Zaborowski <balrogg@gmail.com>, qemu-arm@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4gfKfrMMLyM/

We only build the little-endian softmmu configurations. Checking
for big endian is pointless, remove the unused code.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/musicpal.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index db8b03cb83..b2d0cfdac8 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -1645,22 +1645,12 @@ static void musicpal_init(MachineState *machine)
          * 0xFF800000 (if there is 8 MB flash). So remap flash access if t=
he
          * image is smaller than 32 MB.
          */
-#ifdef TARGET_WORDS_BIGENDIAN
-        pflash_cfi02_register(0x100000000ULL - MP_FLASH_SIZE_MAX,
-                              "musicpal.flash", flash_size,
-                              blk, 0x10000,
-                              MP_FLASH_SIZE_MAX / flash_size,
-                              2, 0x00BF, 0x236D, 0x0000, 0x0000,
-                              0x5555, 0x2AAA, 1);
-#else
         pflash_cfi02_register(0x100000000ULL - MP_FLASH_SIZE_MAX,
                               "musicpal.flash", flash_size,
                               blk, 0x10000,
                               MP_FLASH_SIZE_MAX / flash_size,
                               2, 0x00BF, 0x236D, 0x0000, 0x0000,
                               0x5555, 0x2AAA, 0);
-#endif
-
     }
     sysbus_create_simple(TYPE_MV88W8618_FLASHCFG, MP_FLASHCFG_BASE, NULL);
=20
--=20
2.21.1

