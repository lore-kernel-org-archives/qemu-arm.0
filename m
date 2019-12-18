Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1224748lff;
        Wed, 18 Dec 2019 11:27:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqzsqqmqJ0h4T2oWT2fvItTyIIzIg0iZNFZbL0NQlVw+jNex366UmAzjvvkkZ2Yyspi+yN5p
X-Received: by 2002:a9d:708a:: with SMTP id l10mr4058829otj.263.1576697221055;
        Wed, 18 Dec 2019 11:27:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576697221; cv=none;
        d=google.com; s=arc-20160816;
        b=0+VjGh4IKaKkxho7D3hF8BwpzSp+Udxu509WRW+1cecckTDgF3140pkHNjMQeKJRuX
         pwEIX7TWjYFbK6sg+Ph1y2oZ5WlKJWYpyoAV4tud2gkl3GvIGMcplaTs+uKDn2MnNPvx
         TaduhWfhwLaDeljvr7Bh+ePEiLUy4SSyuyBa9ie3B3C6iyF4Hxr3i+cVrIZ0N38aJPHp
         YtAtI7jv+p1W6ok+YNG7ckf8iBEnPdOw5r4SIbdlW0dEnTMjOBAChmMr8f02CUGNpHJc
         etryXH2Q46wdXxNyGsimaa795j6LHBdjtaaLuAsSps08FQa3DPrg6Pbc0tCA8Z9DGY8q
         SPDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Y6YG32m8JkF0CpWQ1Sg7hx1MiUEtHJOD6PbN9L9fnDQ=;
        b=vqL7jj/Qwo96PJqxecmJfTPGEfENEp8wv6X79eGh/IfkFszC1miDbX2ePb6cXPsour
         z9mU0vMW9/GPrRFwx6yLzSyEQCJZ7UxsJQT3AaqSbCCtdqO8pAwrPA0ChdbZ9YbF49Uj
         jq9Wpm7ymSQVD8hbgrftIZSYpbSLlQFukw7tIoTPaLgJLXLZlWmjcdZl/II+NaC2g+pV
         /sOwPcOxououtre1NLLzwWIAh69ZyGWK+5HXV2UhvgpQ6FwomQVdKVTLyIFiPYy9w6oM
         tTRwOXHhqGyicIlzlO41TtUbmBmArV2oxL7DgypDUOjiIfBF7yEOZwss1MtpP0osIYuk
         BFrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G3LIoWHe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t15si1302863otp.135.2019.12.18.11.27.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Dec 2019 11:27:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G3LIoWHe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iheyJ-0000ZY-L1
	for alex.bennee@linaro.org; Wed, 18 Dec 2019 14:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34620)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ihexj-0008Jq-H2
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:26:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ihexh-00045s-LH
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:26:23 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:55824
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ihexf-00040H-NT
 for qemu-arm@nongnu.org; Wed, 18 Dec 2019 14:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576697175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y6YG32m8JkF0CpWQ1Sg7hx1MiUEtHJOD6PbN9L9fnDQ=;
 b=G3LIoWHe7MpEawC90M2Ah2AbGBmAhOqMXGDk4+PRrh7JQZ+YzTTMFI+2OG9O8Sz64xlSsu
 k9T1cRDsIttFm3rhu628aUcc244d5CY4BVfEF9Btczy1INh+8WXdscJP/Gj/jaraEsi0rA
 lapxt94JmgMY59eCwpUwF1FK8SUt7Qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-TnFNLP5ZPDqKdARPyQIwwA-1; Wed, 18 Dec 2019 14:26:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C530A12BA84;
 Wed, 18 Dec 2019 19:26:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-116-235.ams2.redhat.com [10.36.116.235])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C51B60C81;
 Wed, 18 Dec 2019 19:26:10 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 6/6] hw/pci-host/designware: Remove unuseful
 FALLTHROUGH comment
Date: Wed, 18 Dec 2019 20:25:26 +0100
Message-Id: <20191218192526.13845-7-philmd@redhat.com>
In-Reply-To: <20191218192526.13845-1-philmd@redhat.com>
References: <20191218192526.13845-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: TnFNLP5ZPDqKdARPyQIwwA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kxSDwDDdKN2Z

We don't need to explicit this obvious switch fall through.
Stay consistent with the rest of the codebase.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Peter Chubb <peter.chubb@nicta.com.au>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: qemu-arm@nongnu.org
---
 hw/pci-host/designware.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index 71e9b0d9b5..dd245516dd 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -182,7 +182,7 @@ designware_pcie_root_config_read(PCIDevice *d, uint32_t=
 address, int len)
         break;
=20
     case DESIGNWARE_PCIE_ATU_CR1:
-    case DESIGNWARE_PCIE_ATU_CR2:          /* FALLTHROUGH */
+    case DESIGNWARE_PCIE_ATU_CR2:
         val =3D viewport->cr[(address - DESIGNWARE_PCIE_ATU_CR1) /
                            sizeof(uint32_t)];
         break;
--=20
2.21.0

