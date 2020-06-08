Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp5219971lfc;
        Mon, 8 Jun 2020 09:21:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrUH7h3z/DpTEAS/oR9R0fj6Nnk/TvhbG7rHXmsCAOizDTd6VtsorCzOnt1Oy7u89O7aEp
X-Received: by 2002:a5b:484:: with SMTP id n4mr38211428ybp.131.1591633297322;
        Mon, 08 Jun 2020 09:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591633297; cv=none;
        d=google.com; s=arc-20160816;
        b=Zcvzwilafm550ICiUVu4KTsfC/VSpN1f6E4WrikTONFvtphBT5bScNxrRjGgWp63tU
         7pjfDhN9lS7ER5yL4+U97rJa95wxGnOeM0tKdgfOXMPUEo0dedmhEd1NuggJGB5ZVL5I
         46YBNkOjtefWTSCmWhREFE+ICDbWZj0pyFMtuygoQUbT/u8V5/wEQIbkFmC9OSEWYtB9
         6w3nTbrosDX7Ltt3JtvQvP9bgAZ8QgDBpcdH1GGHGsMFVAgaH9YtuQs3uxd8x84NS3f6
         ZPP20uztkYW2tpgV5+uJD55eAQDii7ckNuJTw5DacmPoYl/V5cV/ZVny7zj7/fHtyYRr
         vc4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=R7tSIIx0YAEULmCHrXDbhmRzYLD86lXGUTjUWu9J2Gg=;
        b=c9GTg+PGG0v5ASCNzYhGix5u9i5uuoEA/E0wMwF+OXHiR5g5YyY+U60GFka3eH9AE0
         xdqIswjr4hzEk0XaVLdX1bUeppNHEeBLqqO2I1iK7zfV4Rjq9/rw72T80WRXciczWll1
         HSs09b0DfQ6tZx745+7H+rTe7w7wnYCqja7eCKzX9En9LhdoTwEa9oiN4+4sIS+SjrA2
         eK0Yfz/fClebTauJqxZWN79bcAxIR6py/ne+XAjGlx1dVxk44nPxAzkkF3BFdA3KtPR5
         E/Lbw++pZ7MA3YUx/L+YCfah8MNfNDLYCy+Cqt7JWYEt39eSBj0e7EDF5G5BakJbuRhB
         QjkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i7nilEOc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s72si58400ybi.447.2020.06.08.09.21.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 09:21:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i7nilEOc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jiKWm-00086W-Jw
	for alex.bennee@linaro.org; Mon, 08 Jun 2020 12:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKF1-0007N6-Ou
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:03:15 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:44569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jiKF0-00088S-NG
 for qemu-arm@nongnu.org; Mon, 08 Jun 2020 12:03:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591632193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R7tSIIx0YAEULmCHrXDbhmRzYLD86lXGUTjUWu9J2Gg=;
 b=i7nilEOch06ASxHnhm/ZcPukrcMyssuoQBx9rSQ0tvN04FKOc/MNVnpjKuN8SqbAFnk2ae
 ESbe0v4+ziaE/IH4UgEq29DAuI+VGvdvippGFsYa4oSO1ZGyDkqreF0HDzJu8AZgHs8wjz
 LP6eQCjGOMqnr8AOG8z5LTfwPj9MVa4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-Lm0AgabcPWSI7WF5gfSmQQ-1; Mon, 08 Jun 2020 12:03:12 -0400
X-MC-Unique: Lm0AgabcPWSI7WF5gfSmQQ-1
Received: by mail-wr1-f69.google.com with SMTP id s7so7361364wrm.16
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2020 09:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7tSIIx0YAEULmCHrXDbhmRzYLD86lXGUTjUWu9J2Gg=;
 b=T7Qx2vXTBm0f0scymnJJHYPmf1ppsi0Jc+AisRSdkuu27IRZ6I+I/80R0MEB01yjSW
 JCW8Q4feXmzWcwWu6x0Bg4AYFXmT8aSL0pgQu6+Bg0m2/aNuPvFpR8yCztMeJ3Gt5cbM
 p6q+0+v99qyBiGcGO5CD7A2u8Sbt4uzIe5w9x9lsYAtIkUgFh6xCwmoB3jK+bMaUDDes
 0loQye75w74hG41i5smWp3TntBDj007UFvurFXEj9sFBtzYWqL7ceQweixSmQM6tHLVD
 cxSVgOk6+6M5nK/uQTmkXtqawpK/ElRUnoJGBaIsUP2nHTFmVyaw88Shb5CB2LzzASay
 otxw==
X-Gm-Message-State: AOAM533h2QFyGvqTBdK66vmQVP6CHzsHK27Ok+bJtqiybrMqiUboGBD1
 UFj/YDC1Og/BDy/aCfytYrIeizEgfm4koe4CanD+bIJyq8jAdkoUP/ls/xpEudDHSuW02e81M7A
 r1LK4QqdoVJtr
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr23742579wrx.214.1591632191244; 
 Mon, 08 Jun 2020 09:03:11 -0700 (PDT)
X-Received: by 2002:a05:6000:10cf:: with SMTP id
 b15mr23742535wrx.214.1591632190993; 
 Mon, 08 Jun 2020 09:03:10 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id e15sm39541wme.9.2020.06.08.09.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 09:03:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 25/35] hw/nvram/eeprom93xx: Emit warning when old code is
 used
Date: Mon,  8 Jun 2020 18:00:34 +0200
Message-Id: <20200608160044.15531-26-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200608160044.15531-1-philmd@redhat.com>
References: <20200608160044.15531-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/08 11:58:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Paul Durrant <paul@xen.org>, Magnus Damm <magnus.damm@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org,
 Stafford Horne <shorne@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P . Berrange" <berrange@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J8+WgWihmyBm

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/nvram/eeprom93xx.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/nvram/eeprom93xx.c b/hw/nvram/eeprom93xx.c
index ca6f591c84..56603ea42b 100644
--- a/hw/nvram/eeprom93xx.c
+++ b/hw/nvram/eeprom93xx.c
@@ -39,6 +39,7 @@
 #include "hw/nvram/eeprom93xx.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
+#include "hw/qdev-deprecated.h"
 
 /* Debug EEPROM emulation. */
 //~ #define DEBUG_EEPROM
@@ -300,6 +301,8 @@ eeprom_t *eeprom93xx_new(DeviceState *dev, uint16_t nwords)
     eeprom_t *eeprom;
     uint8_t addrbits;
 
+    qdev_warn_deprecated_function_used();
+
     switch (nwords) {
     case 16:
     case 64:
-- 
2.21.3

