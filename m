Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp905306wrx;
        Fri, 22 Mar 2019 09:36:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKX9K26r2hBE0fieTU8+I3vVAQVRiagRjWWjuPOKQj0RnYVkU6sdlWpjXbWnMPTWMzu6e0
X-Received: by 2002:a25:e6c7:: with SMTP id d190mr8786772ybh.296.1553272560473;
        Fri, 22 Mar 2019 09:36:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553272560; cv=none;
        d=google.com; s=arc-20160816;
        b=pb3faxaqYK9bxiJIYcNRE/olQKub1qfCpv3pGVjj3AsuAA0WVbx4/uAwOoXZH0jKCK
         9jA+Mhy2V6fTLkcKRVu4/yn8PHkY/PbCfja+14hdvkSb4vABKhIoWi1W23MrCXbVA9Xd
         nhNFcQ3MY4kUWhsHTakurEBNJWE18yQLO9KMszCUiGvFendtG4tO5PvDpOHG5lVBHzIf
         alwr4R6lRKAys4rYVD1jOpgjPB9Zi08YPVqXCXv10dwAJhloJSxHJTNFUaAlQpLUH7oT
         P3e1nhiZl0XiQkPe9hdTKij1JY8QrcnRX9KVOkLcC6Ig7UrsrMy7Wvum5z0DpQKJ5L2Z
         SBIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=1hZTVereckEDdYSSWMlnieUdfTdd6XAk6+df7jXcnsc=;
        b=THYUqZc6B+6Ez3sDMLyqR4E8VbmeU+Io1WfHnVVCrXnRRNOxQZ1IV2t1QQdoZ5TVc8
         OM/PRyiVxzHhsk+tJyumPXTPnqNZfPit+UodyP5LGg7hdMAWmXct5GH7kVKHHjcEeZlg
         34/TrqloS8tJpVG3wSLYotjES76a6OzIqz5fxWhcGwiLQ/pm9uNu5BnMr7S4zAz99par
         EcMaVFXRmDJw+kNJlZx44Kig6JsudKOtcWq/ErNHU89BWw0hPJsX5f+kd3LHqUd8AGs+
         pZAIiCttG7S0KlZ69HQDacTNIaXjRrpKpLX+oaqUk5EuU3SYL1BbBzn7te90aICyQg7Q
         SqPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x206si4892764ywa.238.2019.03.22.09.36.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Mar 2019 09:36:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59947 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h7N9D-0005Yr-UI
	for alex.bennee@linaro.org; Fri, 22 Mar 2019 12:35:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42849)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7N4U-0001Ia-Qj
	for qemu-arm@nongnu.org; Fri, 22 Mar 2019 12:31:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1h7N4T-0006pw-OA
	for qemu-arm@nongnu.org; Fri, 22 Mar 2019 12:31:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50616)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1h7N4R-0006go-RM; Fri, 22 Mar 2019 12:31:04 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A8436697A;
	Fri, 22 Mar 2019 16:31:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2B3285D71E;
	Fri, 22 Mar 2019 16:31:00 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 22 Mar 2019 17:30:59 +0100
Message-Id: <20190322163059.9716-1-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Fri, 22 Mar 2019 16:31:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] target/arm: default config
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7fShw64BffyE

In the kconfig shuffle arm lost pci-testdev which is used by
kvm-unit-tests. Let's add it back.

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 default-configs/arm-softmmu.mak | 1 +
 1 file changed, 1 insertion(+)

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
index 2a7efc11674a..613d19a06db2 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -2,6 +2,7 @@
 
 CONFIG_PCI=y
 CONFIG_PCI_DEVICES=y
+CONFIG_PCI_TESTDEV=y
 CONFIG_VGA=y
 CONFIG_NAND=y
 CONFIG_ECC=y
-- 
2.17.2

