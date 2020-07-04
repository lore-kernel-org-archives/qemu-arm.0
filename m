Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3391201lfm;
        Sat, 4 Jul 2020 07:51:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4dLfOZOyzNYC3Lju7K7Fqyfc/hp/U5Oeq8e6Mae1QX3Wu5mR3bGAcGPPuGsqXevw3KQdl
X-Received: by 2002:a25:5b57:: with SMTP id p84mr19437506ybb.37.1593874280043;
        Sat, 04 Jul 2020 07:51:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593874280; cv=none;
        d=google.com; s=arc-20160816;
        b=jVZrsamP2/QldAR9NoNoZGfulI+Gu5bEGuYrTOytJOVjlNMWb8yY0/05q3cYsMvknU
         +oBIOEKxaWrWbmXiMDF+CNC9MWeCz/dD6KRYti373iBbQhhghzHbO15XAu5dh5vSXvt4
         BPWjQYhGnKuQSA1jpr5IPfsbvpsW6lKmQ0ZrAROheEOGX2DYBX0Lb/zYX+eGp+iJsYzg
         dHf85D5WUpgbiF6u9oeLfhGlYJxU28m9VXY0PxLcxa0+Q/FxgqML3qAx4W5swvc5vCl1
         i7Zh0IkKnMx7q8jCuvDC6krVG75C0HU6Ks26rnwnTSioW9FVbZYCe2RHW3S76wPm8kLh
         eg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=1LONYHTd7jeNrmu8RfEJNRKaqa+4/OTfMiA08MmDC4w=;
        b=UTQ+LFrzC9dGONTyC556RuRcOY0GVOVetjGIfr9ryqUdirPI2uO7OSTEqsppP/qzDs
         HdeODqJ6H3kHny1yn2aDbtECR1byCAmNuyyhnL04bYpqiJ9L0/2ntuB+a7tzVUuv8z0u
         Q6MuqCxA3vah14lvjh6LGeY+z3it5RCRm3QjYzE34P7Kd8pgYrzN2o7ranOPSimwDOU4
         Or+Eshx/tGFOsNgzcyNDmNSqAHwj/037l4zRYg9RfL0hnljGq/88FphBBEAbbMCO/Hq6
         vxwkwmaVDVYhgUWsA/iaFxUtghsWyGEIS4L4MtQw2Htk5dOeBrAaKUmv9MJdOIrBdgj4
         LItQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LCSMbVvH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 128si6496228ybq.226.2020.07.04.07.51.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 07:51:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LCSMbVvH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrjVf-0003VA-Cx
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 10:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUH-0000zx-Dc; Sat, 04 Jul 2020 10:49:53 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:33682)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jrjUG-0003d6-2b; Sat, 04 Jul 2020 10:49:53 -0400
Received: by mail-wr1-x442.google.com with SMTP id f18so27701619wrs.0;
 Sat, 04 Jul 2020 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1LONYHTd7jeNrmu8RfEJNRKaqa+4/OTfMiA08MmDC4w=;
 b=LCSMbVvH8N0ZbcZUYZvlwl0/LtuSzor2alX6qtutU+9ODMj8+C2lynOKjaqj8fXnEI
 Up7WQjLdb8bh14eYdbzmWq0pniHymCkqwLxs7uZhzz+SQeCK8ybk5MN0Zyhj8Eee+SQj
 wRrntXxiS8ThEJ3VSHHvZJ08OGnA1vj0opel3/dZthPvXbGAIhhQVqi63UTc46zKMF8g
 WrVDYhnL59CSHsALtHCZR8uG2+fDNJPpG55w+1h1DIiM4zmD5wiPD6EKOmnxiehzG+GO
 tiIAW62Y9YFjeqMNBorgEysK6Wv7zhm124e0UVH2qXSktIEDr+5rtVe5ZIRMCgW9yetf
 3gAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1LONYHTd7jeNrmu8RfEJNRKaqa+4/OTfMiA08MmDC4w=;
 b=WjFSHpQCbi0hgVyl2+PCPXyBespUMq6EmjfHHuxf8MOuqCV3iQcZuCIVxVPR7pTqVA
 KHpStFcIYuJKa1rorFP5Qrz53FHhnQ/fiVlrLdMSlU1WCpuErTtYtrsgz4XObbPhdSjR
 3XrnnMLfMug1dKSvlMPDgI5/JSdSGcJbZQjHKmKJ+ulxp/Jk0+sNG8UiZH1DS4GtIO6v
 WHHO4rtjeAH7xP0SrmjD3eE32Y2IuDIQUyEtQDHW940/s48bdyb14TRT6O0TFKoRqGHo
 pMVOC1DK4D7Ixo7DBOC1c9LERFoZbBamL9yVdg6Gutfki5j59SMR9EAyEAIObFRkjEe6
 0C8w==
X-Gm-Message-State: AOAM530ZZh5ofHfGQP2RAkubTPEJsM8lOsUKyU0mhnSkIkcHDdYRi6eu
 +cX9Nt1C9L5SziVePa8mnI5PDuBnIE4=
X-Received: by 2002:adf:f54b:: with SMTP id j11mr41454017wrp.206.1593874189885; 
 Sat, 04 Jul 2020 07:49:49 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id r10sm17135019wrm.17.2020.07.04.07.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 07:49:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH 01/26] hw/arm/sbsa-ref: Remove unused 'hw/usb.h' header
Date: Sat,  4 Jul 2020 16:49:18 +0200
Message-Id: <20200704144943.18292-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704144943.18292-1-f4bug@amsat.org>
References: <20200704144943.18292-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Huacai Chen <chenhc@lemote.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Leif Lindholm <leif@nuviainc.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Zimmerman <pauldzim@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qOjsJKFyAhiD

This file doesn't access anything from "hw/usb.h", remove its
inclusion.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/sbsa-ref.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index e40c868a82..021e7c1b8b 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -38,7 +38,6 @@
 #include "hw/loader.h"
 #include "hw/pci-host/gpex.h"
 #include "hw/qdev-properties.h"
-#include "hw/usb.h"
 #include "hw/char/pl011.h"
 #include "net/net.h"
 
-- 
2.21.3

