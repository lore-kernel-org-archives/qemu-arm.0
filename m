Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3427068lfm;
        Sat, 4 Jul 2020 08:46:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDEhDcm3YnVDWvcQBOF5jXt26bZD4R2Dym4EqmRyCABsvH1WCbCSxapx628Y8CGb0KVYT4
X-Received: by 2002:a25:4903:: with SMTP id w3mr45072965yba.384.1593877590014;
        Sat, 04 Jul 2020 08:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593877590; cv=none;
        d=google.com; s=arc-20160816;
        b=IwIcklZTvqUI1cW4bei7AIRb98BISCrZZ8qsKioSQHURwuZkbdrQuYmFoOmTgRaAoo
         twjM0byqVRI+a0naqLDSmSXWlhVW5pZ8n9Io5b14JmdsLrLpUR4gszy9eJBCP4GpZ92j
         gWdboNolucr/9xiJUTcabGhf/jaU3V4xuHm/Nh6LcN6CXPmL8+qW5iA6GkvdKSYmz9DM
         A6CDuN2wPziz7UOmzIyEc01gdusPutxJ3nff+VPXpI2oP9aWuLV/4QB5PLkYAQq12uwy
         QOWldkxHjKAUjHKu7XNYoS6ss/LZlJay6vu2idpqdIZAu57bV7fonO2jpQmn+zi96Wzs
         nxMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=g5ly0fcUXOf9qpye/9fR2nyQtN4aqsUxjucs8EhlOCo=;
        b=nLF0XQhb+rFYfv3Ph/46Ubqci5xYlGXI54AmsHsvOg/mMtxMxBynbp7uUUSHbQ3Rrb
         MENBT3Z4dsHeWwX0TljXifQcjvAFgnKkbD/38v3VGw1nJf2EUOL9a45OMVD3hJ5tS6Wm
         oEe4YXliJP9W3ASdBKEj5/b9TRiVW7nhFtVqezAeUTrN+XKXdPOOIGaHpNlyzNBhrsrd
         nLQAM+Oy/8Y5HPoiVepeg5DcnXW4ITsDzqDQp70QfJKGHKj57fuzJ9yo0bnixe5v/aag
         Q0Boyk5EJqsEP3cqw9hMEnVn3kbgEEiyizft0aIKFRpMTDys1wrGNgBsDCNR/39jrCDU
         UFdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WWcwuvNA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 129si60339ybn.422.2020.07.04.08.46.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Jul 2020 08:46:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WWcwuvNA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jrkN3-00041j-4M
	for alex.bennee@linaro.org; Sat, 04 Jul 2020 11:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHE-0002Qw-Ud
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:28 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:22425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jrkHB-0007wQ-5h
 for qemu-arm@nongnu.org; Sat, 04 Jul 2020 11:40:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593877224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5ly0fcUXOf9qpye/9fR2nyQtN4aqsUxjucs8EhlOCo=;
 b=WWcwuvNA/iZTsNl8i+GJizloHHEglJb7SP7WMjeufl2eK6e7IjSia+DSIkEMMra11Gyr7D
 y/V+wkYPOfZw1jBwZ6CnEsINpI5mD/ghxT6lMXJM5p7zHcTitpFQNIoNG+hAo1Un5L0BlK
 OQ9ncWf0CbTSHdeWOhqpN+ILpOxkdZo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-OS6pxeJaPbq24y6_3lTgxw-1; Sat, 04 Jul 2020 11:40:23 -0400
X-MC-Unique: OS6pxeJaPbq24y6_3lTgxw-1
Received: by mail-wr1-f72.google.com with SMTP id o25so35868628wro.16
 for <qemu-arm@nongnu.org>; Sat, 04 Jul 2020 08:40:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5ly0fcUXOf9qpye/9fR2nyQtN4aqsUxjucs8EhlOCo=;
 b=lrLDjixamxX0MGwGsUGFsqSU2kd/s7QQqwGv7LVVSP6sGWMtdNlsQAWq0wsIaOwvsb
 rPJci9H5pC/SduZcOh2Ow0pKPJGFHtJJDaxEPMEF78nbEVjzCcZ75ffsc0e/05G0bpt+
 EhjrI2n77bA/e/WSAfljnE4kSueIKY57E+uOdHB0kPgJSCE6h9k4GLlo6pYsKg4O0ej9
 tgA0PMFRgUl8OBGwunzSZrqn1gKvNexGuDtxk/6dOyjttUNoksFEXbUc63pWj14rMuSP
 IqIxkW8iSfguiD/8jdHFzjkINQA6u2ZCBkXi6T0q4FRu/2lkKLNNNwk8k0r8a+d/eUaa
 C9cw==
X-Gm-Message-State: AOAM531bP+TM/1wRb0AaIyfeKcRyXDLL9TxPVQGY37pJij/9J85UXzOK
 WHzcRk2Gze1KP81a/MTEJEM6WmllRkD88ycmrfc+y01RsBMyfAapBrQdv2aN5RBvTmz3walK207
 vSrSUhOO5ZPyW
X-Received: by 2002:a5d:658a:: with SMTP id q10mr38375952wru.220.1593877221944; 
 Sat, 04 Jul 2020 08:40:21 -0700 (PDT)
X-Received: by 2002:a5d:658a:: with SMTP id q10mr38375922wru.220.1593877221764; 
 Sat, 04 Jul 2020 08:40:21 -0700 (PDT)
Received: from localhost.localdomain (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id v7sm18015001wrp.45.2020.07.04.08.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 08:40:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 13/23] hw/input/lasips2: Emit warning when old code is
 used
Date: Sat,  4 Jul 2020 17:38:58 +0200
Message-Id: <20200704153908.12118-14-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200704153908.12118-1-philmd@redhat.com>
References: <20200704153908.12118-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/04 11:39:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 "Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VLqXhJxLnKjk

This code hasn't been QOM'ified yet. Warn the user.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/input/lasips2.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
index 0786e57338..452244f037 100644
--- a/hw/input/lasips2.c
+++ b/hw/input/lasips2.c
@@ -34,7 +34,7 @@
 #include "exec/address-spaces.h"
 #include "migration/vmstate.h"
 #include "hw/irq.h"
-
+#include "hw/qdev-deprecated.h"
 
 struct LASIPS2State;
 typedef struct LASIPS2Port {
@@ -269,6 +269,8 @@ void lasips2_init(MemoryRegion *address_space,
 {
     LASIPS2State *s;
 
+    qdev_warn_deprecated_function_used();
+
     s = g_malloc0(sizeof(LASIPS2State));
 
     s->irq = irq;
-- 
2.21.3

