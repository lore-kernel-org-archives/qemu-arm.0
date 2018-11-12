Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2662060wrw;
        Sun, 11 Nov 2018 19:22:08 -0800 (PST)
X-Google-Smtp-Source: AJdET5fjYFgPMJ8fDyYcKG2a1HvckBE4rYIYHg041ID1dQOm35Kh5HF1KCobRufTB5ON0yayttfU
X-Received: by 2002:a37:6903:: with SMTP id e3-v6mr16942648qkc.213.1541992928492;
        Sun, 11 Nov 2018 19:22:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541992928; cv=none;
        d=google.com; s=arc-20160816;
        b=QtgrpTqUEJF6QiKQpDfkXzxG68srG8ZVqIB9wCvMJ0AI/CcP2xxaQZAQ7wlImvQ6Vk
         c3lj4W6220nGvnYxaY/NuoO+uR1zTVzpCVeJVesgt7PhcU5ivQQvFEUihHQNy62WDmYB
         L75XqH15WpYfLOTNSf8gAgIknpx6ka/yvD+yZk1ZlOFub1Iagl6/BlHiMwvM48/zrZcz
         hvPkjKOZ8dzMPJs64SO3M9rR+7oA7gHpcGqecpT8uUObgA7WNA782QS6XgZVJhqFkqZX
         XAy/feZ0UH5qJjfJV3IzX7h7wQyzZy09e0PKh8GVZbyG+WRZPphEPeZHTJtHSypn4BW4
         0fsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=oLKEEKxuTpqSnlYbbxwMM0laDcQ3UHLpXlsElKthKf4=;
        b=XXnq190OZEM6eZJjRtO5u2HmrT6IhcwZRgbGOzDyI4NOSV7eUqwzIMZiloSffk1MCR
         /hO5lawsVgFpf5ydMt7Xrs7LxhF3TQzxcAx/LLx6VsYJb6OjCRqcOE0d9mA2PDLdSXIg
         5TDmWJWQOqdL9JHByThYxionlXdNtyYES5SfV/IlfWwTD63hM3VcuzBPz/K9yjEVi8+J
         E7hqp0IhFw9c/5M6diobIAVxkhTr45LT557i8UkIuuHe+f+4c1tq7ZMc8Xw90AkOcVyd
         0vKrZTKtlJt9rhyqqRbv/Runzm5IPQcHfFm6Jwzhd+BtBmjIPeEOCrOD61XFz2tqGHvn
         umYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q18si7140819qkh.210.2018.11.11.19.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Nov 2018 19:22:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44569 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gM2ng-0002TF-0b
	for alex.bennee@linaro.org; Sun, 11 Nov 2018 22:22:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2mj-0002Qx-W9
	for qemu-devel@nongnu.org; Sun, 11 Nov 2018 22:21:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peng.hao2@zte.com.cn>) id 1gM2mj-0004FJ-3J
	for qemu-devel@nongnu.org; Sun, 11 Nov 2018 22:21:09 -0500
Received: from out1.zte.com.cn ([202.103.147.172]:33044 helo=mxct.zte.com.cn)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peng.hao2@zte.com.cn>)
	id 1gM2me-0003y5-K9; Sun, 11 Nov 2018 22:21:04 -0500
Received: from mse01.zte.com.cn (unknown [10.30.3.20])
	by Forcepoint Email with ESMTPS id AD4E54382AFBAA1E7387;
	Mon, 12 Nov 2018 11:19:57 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
	by mse01.zte.com.cn with ESMTP id wAC3Jknn084818;
	Mon, 12 Nov 2018 11:19:46 +0800 (GMT-8)
	(envelope-from peng.hao2@zte.com.cn)
Received: from localhost.localdomain.localdomain ([10.74.120.59])
	by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2018111211195016-10076072 ;
	Mon, 12 Nov 2018 11:19:50 +0800 
From: Peng Hao <peng.hao2@zte.com.cn>
To: peter.maydell@linaro.org, drjones@redhat.com, philmd@redhat.com
Date: Mon, 12 Nov 2018 19:42:15 +0800
Message-Id: <1542022940-46849-2-git-send-email-peng.hao2@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
References: <1542022940-46849-1-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
	8.5.3FP6|November 21, 2013) at 2018-11-12 11:19:50,
	Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17,
	2016) at 2018-11-12 11:19:45
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MAIL: mse01.zte.com.cn wAC3Jknn084818
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 202.103.147.172
Subject: [Qemu-devel] [PATCH V6 1/6] hw/misc/pvpanic: Build the pvpanic
 device in $(common-obj)
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mWMJnbZypae8

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The 'pvpanic' ISA device can be use by any machine with an ISA bus.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/misc/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
index 6d50b03..24997d6 100644
--- a/hw/misc/Makefile.objs
+++ b/hw/misc/Makefile.objs
@@ -8,6 +8,7 @@ common-obj-$(CONFIG=5FISA=5FTESTDEV) +=3D pc-testdev.o
 common-obj-$(CONFIG=5FPCI=5FTESTDEV) +=3D pci-testdev.o
 common-obj-$(CONFIG=5FEDU) +=3D edu.o
 common-obj-$(CONFIG=5FPCA9552) +=3D pca9552.o
+common-obj-$(CONFIG=5FPVPANIC) +=3D pvpanic.o
=20
 common-obj-y +=3D unimp.o
 common-obj-$(CONFIG=5FFW=5FCFG=5FDMA) +=3D vmcoreinfo.o
@@ -70,7 +71,6 @@ obj-$(CONFIG=5FIOTKIT=5FSECCTL) +=3D iotkit-secctl.o
 obj-$(CONFIG=5FIOTKIT=5FSYSCTL) +=3D iotkit-sysctl.o
 obj-$(CONFIG=5FIOTKIT=5FSYSINFO) +=3D iotkit-sysinfo.o
=20
-obj-$(CONFIG=5FPVPANIC) +=3D pvpanic.o
 obj-$(CONFIG=5FHYPERV=5FTESTDEV) +=3D hyperv=5Ftestdev.o
 obj-$(CONFIG=5FAUX) +=3D auxbus.o
 obj-$(CONFIG=5FASPEED=5FSOC) +=3D aspeed=5Fscu.o aspeed=5Fsdmc.o
--=20
1.8.3.1

