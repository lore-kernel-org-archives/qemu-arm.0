Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp121330lfc;
        Tue, 25 Aug 2020 12:24:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyx/K4Us7QT86n2oiEuBeDCxLxpb+PZU2Y8l+YiLKeSdhKIotWBSW4n3pSAhDhF7cYY8jyt
X-Received: by 2002:a25:8812:: with SMTP id c18mr17359516ybl.330.1598383490626;
        Tue, 25 Aug 2020 12:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598383490; cv=none;
        d=google.com; s=arc-20160816;
        b=CgmVN46FNUQmkcKjs04rXBuPCzFdvMoFtd/e1B6pDQr1c0VYsadOd/VcqdQer2MbHM
         Ax7wmbPGtSCaVTx63qxoC3ew6Ld5qKwkiPNRrLKJkh50GdUGo0a7SznZFB9j8+5cWhD4
         eMcalzEHkXzJ5nuKjQ9ceDDViBi1DrnCy0vj9SjA3SjgympZOwMagPUA0WC8ggBSZT3X
         PTzD5pQextFO9Ndt/KcvA4Dvcx1pl3ygxx2gYQ836cpXYEopjtSnBeDgVKZayQiSENG9
         i1KmEXnOotX/Z/yGjtsEOHX51/ejAiRFj9UlZ2oWL7jG9y5wQH0EoQDn1fQN0y//Jjqi
         jIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=wlb6VnWjGSM4vQHBGSaS25jLezivnWmustYfZwj6i8g=;
        b=QZwns/xMrQbq0XyGdAS0u8XaDeGHNSr71dGqfTAqgbsYi2g9jgBVipDYmDFm4oW6P3
         qPNF6vUO4AlJyKjwCnGbQ6+46QIARJAO/90rfbGlC8lIoChe2y8esMUL+Eoe6JebEg8X
         GgD73pY7pL23YC/y/KI/d4nu3bY2l5xibgKESFWTbAJrlmC7koTmJzZPf9kf1eZVkfmA
         x0t2wWwNRk1rfuJHpaGkxdiRGtqTpzEn+JPvRjYRM5t7dTcYQrtAxwqFM6c8cmJGajEM
         e46+HqIBIkC7bryZgMRpqj9Ag14dSun7HDSCtNmQiki16qLqvR7Un095IWk06qkMwSJR
         NSMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ac/epeUu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l26si15798229ybj.118.2020.08.25.12.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 12:24:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="ac/epeUu";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAeYr-0005at-Vi
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 15:24:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeVl-0006q4-VO
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kAeVj-000652-Mq
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 15:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598383295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wlb6VnWjGSM4vQHBGSaS25jLezivnWmustYfZwj6i8g=;
 b=ac/epeUu9QYU72+rpLHnldjiNeNbBo9lLBiJxooOljKRN079yS11G6kAcDxHSn0lkjixKN
 P5mhQSCnFNzsyT4iZWLaWgd0aHEVMPONAK2+AoqilAMGWiRM2j1BHFl3PXJ0JjW2TUUpRA
 ZdbNrcACkOFVfn5xiE0Mb3+fqzS/52A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-49X0_0lmPDChBphKlPDJEQ-1; Tue, 25 Aug 2020 15:21:31 -0400
X-MC-Unique: 49X0_0lmPDChBphKlPDJEQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED5811074641;
 Tue, 25 Aug 2020 19:21:29 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9309B7A40D;
 Tue, 25 Aug 2020 19:21:29 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/74] aspeed_timer: Fix ASPEED_TIMER macro definition
Date: Tue, 25 Aug 2020 15:20:06 -0400
Message-Id: <20200825192110.3528606-11-ehabkost@redhat.com>
In-Reply-To: <20200825192110.3528606-1-ehabkost@redhat.com>
References: <20200825192110.3528606-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/25 02:03:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.958,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 "Daniel P. Berrange" <berrange@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IACBM+dtLydC

The macro definition had an extra semicolon.  This was never
noticed because the macro was only being used where it didn't
make a difference.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
Changes v2 -> v3: none

Changes v1 -> v2: none

---
Cc: "Cédric Le Goater" <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>
Cc: Joel Stanley <joel@jms.id.au>
Cc: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org
---
 include/hw/timer/aspeed_timer.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/timer/aspeed_timer.h b/include/hw/timer/aspeed_timer.h
index 948329893c..d7c7d8ad28 100644
--- a/include/hw/timer/aspeed_timer.h
+++ b/include/hw/timer/aspeed_timer.h
@@ -26,7 +26,7 @@
 #include "hw/misc/aspeed_scu.h"
 
 #define ASPEED_TIMER(obj) \
-    OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER);
+    OBJECT_CHECK(AspeedTimerCtrlState, (obj), TYPE_ASPEED_TIMER)
 #define TYPE_ASPEED_TIMER "aspeed.timer"
 #define TYPE_ASPEED_2400_TIMER TYPE_ASPEED_TIMER "-ast2400"
 #define TYPE_ASPEED_2500_TIMER TYPE_ASPEED_TIMER "-ast2500"
-- 
2.26.2

