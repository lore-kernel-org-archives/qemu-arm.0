Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1238185wrt;
        Tue, 11 Dec 2018 16:32:10 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Vx/6ST8mDbsHWUDOtpXaHAO200QtBpP/1qbmDesEZLfb3/XELWfiTrv4Ovt4twfZ9EUa5n
X-Received: by 2002:ac8:6b18:: with SMTP id w24mr18334009qts.144.1544574730729;
        Tue, 11 Dec 2018 16:32:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544574730; cv=none;
        d=google.com; s=arc-20160816;
        b=IxIgfb8AK1CoyS5/WKJunGNT0p3Op8M0qMlBSTtLqXgn8nRelYoq1S0L9CvRgxULJC
         uL8eErtyjJ4OEzQDdLmSluIA0/72ND+nLHZ/QF8aPdWm7mHEkj17KVLQck3WonD5qn81
         6sf1R3YQu3K7haNXeERim2Xc+uhratjtF0UZJ+2rfw7qAAeKO7dFQVe+kKU9mvzDuPV9
         gtb5M/fYhfi1tvqMZkwGInOm6LKVjOxysQQ3TtKmJFx/YuBvrKjN9hIfEyc6pf+JFncR
         Agz4hFBVuELzdYt7AdmI8e8AmfxelJh591UXfusUfnaHjrqWbOKHNao+WsFxwjK7YSju
         ONNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=e1WN2w8VmjMgT8JM/0Eb+lrw2XIkVS1Zn9Dx/7ogJwo=;
        b=xQwvTWtBSmtnKI0j8Wdg84CJLFP/iVE7Jg1GVVBnBq1heLXgKDoQriKBaN8Pwt+QKH
         tjBqGGIgh0gYoZsanzzj1XZSvr1LTwVk6LrXyA3/wxOeR46bWYuUwYBsuMTnmUa133m9
         3zaxyMTbzwyOuodG3gdROyLoBUntsv+ZM0654jI+EXP+yQY3sylywi2zKBockDPhtIyw
         EnD7h3/s3PP3cQrKDy0SNQhPzu87E+xaqBl0ifSwqp9W7sipIGEoOA8N0xe8MXDkaAUU
         OKF2amPYlqYyFDt7jaiGVLvlnOwTfJoXkfb5NAP7AR5FapWxVKxoVILh1e64psLt/Czn
         ySCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 38si7724108qvi.108.2018.12.11.16.32.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Dec 2018 16:32:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42003 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWsRe-0003Yp-6E
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 19:32:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36349)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gWsRO-0003Xp-L1
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 19:31:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1gWsRK-0007DL-Nf
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 19:31:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51944)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1gWsRK-0007CK-H5; Tue, 11 Dec 2018 19:31:50 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A4CFABDCD;
	Wed, 12 Dec 2018 00:31:49 +0000 (UTC)
Received: from localhost (ovpn-116-63.gru2.redhat.com [10.97.116.63])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2D5751019625;
	Wed, 12 Dec 2018 00:31:48 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 11 Dec 2018 22:31:47 -0200
Message-Id: <20181212003147.29604-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 12 Dec 2018 00:31:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] virt: Fix broken indentation
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jhFgB9sm9ufR

I introduced indentation using tabs instead of spaces in another
commit.  Peter reported the problem, and I failed to fix that
before sending my pull request.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: 951597607696 ("virt: Eliminate separate instance_init functions")
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/arm/virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 17f1b49d11..5b678237b7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1854,7 +1854,7 @@ static const TypeInfo virt_machine_info = {
     .instance_size = sizeof(VirtMachineState),
     .class_size    = sizeof(VirtMachineClass),
     .class_init    = virt_machine_class_init,
-	.instance_init = virt_instance_init,
+    .instance_init = virt_instance_init,
     .interfaces = (InterfaceInfo[]) {
          { TYPE_HOTPLUG_HANDLER },
          { }
-- 
2.18.0.rc1.1.g3f1ff2140

