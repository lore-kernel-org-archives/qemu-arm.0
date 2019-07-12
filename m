Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp918845wrv;
        Fri, 12 Jul 2019 06:40:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwt7r2Tp3aTaahyI+sIhYC9b/j2MF8Fi8GB84/GatRfkC1/DMKwEUa4LRzex5rgZwxr5yDr
X-Received: by 2002:a17:906:6bd4:: with SMTP id t20mr7892514ejs.294.1562938800777;
        Fri, 12 Jul 2019 06:40:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562938800; cv=none;
        d=google.com; s=arc-20160816;
        b=KGSYqSUhEdXqwHp/yBXZ3Yw0XsdOdof1xko7dGKk0nmLcMyJCPB7ZfqCDv/8MHTdCR
         MtfSN4eu7Z8Pjzm2YVUrh0q9ctsWbe3Ol6WbL5zoICRfHgo0zAbynVrQP85JewHS6Qcf
         3tXH+p9fRn7jyFSnNuzAAi7SIWtC537mKtBTnL+MS7C+/xdF9cPxo4SiTqvjuiS7TQ5z
         x8BCUz/UJP5a6itYJXbn8B1JFM5EvGjReP/RZWadFBOYL+eEjRpPc00rNC5iIQnoF/YP
         w5tY9nro6PPI1q89jKZVClpwhEqvX2rWuiJZr8LYS3qCLcSQaoRxrUDlneZuhGQ1csbN
         2nEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=fePZpzNZa9ooAfk6Mn+b6cEvSNXGJ4hWs+ia5ObzCXg=;
        b=UVJZd8ULhkayC5oP05rYDI/0sUlkgv5sDy7fu5dpQ2Bo9BP4eu/f2pWIB2QOnzkJpl
         324r6yRTqnL0PDbVqZohxAkBorCUwKL/EuoVCjzkeYxZixrX69qQwEmsu4IXy5AWoC0Y
         e34DVh8i3PiYD1mqH4EtFb4u/zeZHgHWkIWlxeIQcC85ugTnZpQEdvGyapGxFjwR7PpA
         v/dCsyKFsr4pPTAsUBPKYS0dXubKGRJUJY/FOoj71LUa8MNIB7Z8Z5YKlNKjs8mmtXIe
         jbXfAU8IUpkyxG1wnVdbbgfGmjaQCqEWqZpuWzylomw6oBE4WniGJq/XF7SDsf/89i4X
         7LLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c31si5543241edb.418.2019.07.12.06.40.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 06:40:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlvmJ-0004eS-J8
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 09:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57458)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hlvmD-0004Oy-EK
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:39:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hlvmB-0006KW-Jh
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:39:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54550)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>)
 id 1hlvmB-0006Gr-Bb; Fri, 12 Jul 2019 09:39:51 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5A20630833A5;
 Fri, 12 Jul 2019 13:39:49 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-150.brq.redhat.com [10.40.204.150])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 861A319C58;
 Fri, 12 Jul 2019 13:39:46 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 12 Jul 2019 15:39:24 +0200
Message-Id: <20190712133928.21394-4-philmd@redhat.com>
In-Reply-To: <20190712133928.21394-1-philmd@redhat.com>
References: <20190712133928.21394-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 12 Jul 2019 13:39:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH-for-4.1? 3/7] MAINTAINERS: Add an entry for the
 Bluetooth devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AAiypL/aUNB9

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc9636b43a..5d8f27d9bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1733,6 +1733,13 @@ F: hw/*/*xive*
 F: include/hw/*/*xive*
 F: docs/*/*xive*
=20
+Bluetooth
+S: Orphan
+F: bt-*.c
+F: hw/bt/
+F: include/hw/bt.h
+F: include/sysemu/bt.h
+
 Subsystems
 ----------
 Audio
--=20
2.20.1

