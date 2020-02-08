Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1920289lfp;
        Sat, 8 Feb 2020 08:59:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqz56eXb5kx/OIjk18wP86mHBBYw+RvpRM/bXX3UmqjM28HZksUAoocBF5tuhjxGnafqPREL
X-Received: by 2002:a37:4f51:: with SMTP id d78mr4042472qkb.28.1581181159721;
        Sat, 08 Feb 2020 08:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581181159; cv=none;
        d=google.com; s=arc-20160816;
        b=NqiJ27hrfH1NxmAoZZES4jCrPFRxI2dlm+DlpUNqGXdoJw9zpP5yznd3eNPX8tKzw+
         6T0wyf0rpBEn5wUuW9wZqIKfM3pkcCSDUGAcmoBButLDoYqaFWBoFm7nybjLJM2MRpgT
         2gQQ9mmB+VJ2fYYRLcChHqvm8umW1Wfg6buPjw/3jMxCOIGQegYTKNNWrcxT9al0FkwI
         MmpFf3y/VMeQrHFF34Jv+r3yFldHMg3173nQnBqoyeUYpw8gD8Y74ptv/lVMjhqf/FJP
         AkVvQLeQCqMLaeePMzuSEJDFTcaoL+dEOCWC15t4ylo6s7JD0ItBkWKYgEU+njDMKh58
         Pg2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=p0CIm4ZyNmzBVoqBIDDC/4y2EAVfboHjJlAZjEgSztE=;
        b=QrQoxyaxqcJ/h51qqlMt/W2kRGKdeGFtj9DhetWCXxEqf02AaxSV9VdMNIG+WXLRXb
         2tPgcgNNT6ym/DzvJZpChmAuG492xl6QQOp72aimE0NAbKTmR4nEWyCbY8OaR2PtfQQK
         FwF/absrc3x5Y6ijaa+NfD7ieNC7eUjNr7VxBNPrhb/iy/1tvuSaUBtoojetcFESnHYG
         sPLqIXiV0Z/4tSDE8oTktTmobsNjYUMC/Ggbq+zgfzaKrI7l1rg+YYN66zt9h7zbv8aP
         +S2y+weAjdjI+oT2MuJaZ/7JlOlD5Ik7opfVY3AveBGkVlt60tL0O2VeFejI2wXGt74a
         AcCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pnUYEJaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 25si1760647qky.171.2020.02.08.08.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Feb 2020 08:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pnUYEJaV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:43334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j0TRv-0001CT-4b
	for alex.bennee@linaro.org; Sat, 08 Feb 2020 11:59:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53882)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPz-0005xT-9y
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 11:57:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPy-0001nt-7A
 for qemu-arm@nongnu.org; Sat, 08 Feb 2020 11:57:19 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42575)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPs-0001jx-NK; Sat, 08 Feb 2020 11:57:12 -0500
Received: by mail-wr1-x443.google.com with SMTP id k11so2466698wrd.9;
 Sat, 08 Feb 2020 08:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0CIm4ZyNmzBVoqBIDDC/4y2EAVfboHjJlAZjEgSztE=;
 b=pnUYEJaVU8+Xl58FKRdO4JOjksL0si64wFTdea5tr+GkVN7pmE2QIAf+bV+fg+90H5
 9qUKjzAQ0vJg/zb/0xCnlCUP1w3eLIsfs2P1C1EYInLLDyEX7h4Bw/h/DAQV5IFrtF9y
 8Mhklh94hQCB0WljY8+pbZ5KPDDvj+mYfoYBsQoRRohJaevZ28PqerjMSgIOv46alWHQ
 31HPUOz1a0f5ens1Sk4YYSf4xPPsqZekq9frznqhUijoAktGzWUo2ZZlNA3ysjhT6CoT
 nWHQACYQe2U5j9dR+BNqzDGl9htsun1eOr6xygkImZdA1DbCfQayKpIzNLTN92d6m0Fs
 BVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p0CIm4ZyNmzBVoqBIDDC/4y2EAVfboHjJlAZjEgSztE=;
 b=ZBa2vcueQ5u1xZ+FKk2GkTUSxP0bmwvRGvFiQ+REuk4qP3pIe1Iq7fLiFgiVkIZ7+U
 Isu5DPzHJNuuupm0Fu755ySbCdhnymztdhB9/kTTf5GiN10JF/RV4fu5BNBt/pfmSEzG
 Cf5W5fPwBSRCggXnQDSgXzbzEGbM6pY3FCz6cZldCXrkHlRMa4NXCHB5KN05N79QdNnw
 1D37KFdBuPmPDqMWIBbP918mlvK7T5DoTJ/q+C/LNvzL6fxlz+I971datzuMO3hslK3I
 BWeNobO0NOhXpTNEs1X06lqepPW2YkMmmsA93wJL5XSr3qVbF8gdE8uu0scCFGGoUKBn
 Itcg==
X-Gm-Message-State: APjAAAU7wqzAsE3wKRyD0rpaPP2MuI1HVIE3TYFZvjlIip96EPzzKGZw
 oTAhqxO6KgFGLTL2j5ONUOVrYNV1
X-Received: by 2002:a5d:4d12:: with SMTP id z18mr6158740wrt.139.1581181031477; 
 Sat, 08 Feb 2020 08:57:11 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a5sm7872763wmb.37.2020.02.08.08.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 08:57:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/13] hw/arm/raspi: Trivial code movement
Date: Sat,  8 Feb 2020 17:56:38 +0100
Message-Id: <20200208165645.15657-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200208165645.15657-1-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
 "open list:Trivial patches" <qemu-trivial@nongnu.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VybKdIynhWKw

There is no point in creating the SoC object before allocating the RAM.
Move the call to keep all the SoC-related calls together.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 7a2ca97347..b3e6f72b55 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -227,9 +227,6 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
         exit(1);
     }
 
-    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            board_soc_type(board_rev), &error_abort, NULL);
-
     /* Allocate and map RAM */
     memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
                                          machine->ram_size);
@@ -237,6 +234,8 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
     memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram, 0);
 
     /* Setup the SOC */
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
+                            board_soc_type(board_rev), &error_abort, NULL);
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
                                    &error_abort);
     object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
-- 
2.21.1

