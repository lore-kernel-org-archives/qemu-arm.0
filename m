Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp194533wrt;
        Fri, 11 Jan 2019 06:23:15 -0800 (PST)
X-Google-Smtp-Source: ALg8bN7veCNgFa/1Nw+6G1ohM80HuqGCmgYoY53wS1W/hfewddDov+ydIhHvF7eJ/LMvzASMHI70
X-Received: by 2002:a7b:c757:: with SMTP id w23mr2374629wmk.59.1547216595660;
        Fri, 11 Jan 2019 06:23:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547216595; cv=none;
        d=google.com; s=arc-20160816;
        b=am1MrWpqDAV2htARkzcAc6Lz2jYjSLhltKhkB2bNzmie27sloFLBU2v7gDd/E8Qsap
         leIm9MBBShdaD8KwovnVGYLYUvMFy1Kw+Yky0NdfxOeOpk6kZM9Pzwi8qC8B3c5h1y4t
         p4xFVpCZmHiV3MtJkbEYrgp7hUOX6zVlNKYVwHwISPI9RfwmBeMe8s4F+sUroJ9R6CKM
         K7EgHntDIUffv3iQCm2Y9ur0i/GsbVdSgKaka/GS2WQUFh4S/3zQl76BSZ8CunmiCPyy
         sYAXb4vvoxG40fF2AyJrT8s2ZdKDooxcC2ARyh8uSFb4tiU1qDn64hJSIkA5bVRKuC1r
         bIuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=441jp5K/b4sRnK4Up1cVh7XXYyybiM2/8PnPCA9Gjis=;
        b=MTnYFhljZi2BQxgzrKiXN3hLdebZl37Ol9edz08eNwBPa/4HptgadC9sHwElFtA35s
         8wjmmEgdBOoaWfjl77G5Yn48TkP0OK0DOYxvZz7VDQH0awJSTf4hcQtB8pBUp82O7aZq
         Xpk2U360TN5Ip/EPrSygLXOs7BrbRAPG8uwj9UIHTMmaGqJbaKwVG2bljkuiRwhH8Szg
         8B4LSIJC1maN070ZpptC1Y5WkJ5nBAAUBwZOqd9PUHqFt3Oo3i24RhnFuzV6vR5ENZdS
         M6MaOttNlUOKuu6uWQ/pGk04+K+xcQ4yL2s8y/X2kSP4Pb22r3vVFo7gQM+Vb9rthK4/
         EcoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si44423392wrp.196.2019.01.11.06.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 06:23:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35208 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghxiM-0001Uj-LB
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 09:23:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxe2-0005cP-D6
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:18:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ghxW9-0003LE-61
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 09:10:37 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51230)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1ghxW8-0002sY-W4; Fri, 11 Jan 2019 09:10:37 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A84832814D;
	Fri, 11 Jan 2019 14:10:27 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-254.brq.redhat.com [10.40.204.254])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79E655D6A9;
	Fri, 11 Jan 2019 14:10:21 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Date: Fri, 11 Jan 2019 15:08:48 +0100
Message-Id: <20190111140857.4211-7-philmd@redhat.com>
In-Reply-To: <20190111140857.4211-1-philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 11 Jan 2019 14:10:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 06/15] hw/i2c/smbus: Remove SMBusDevice from
 "qemu/typedefs.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Laszlo Ersek <lersek@redhat.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zvDHd0eKk3Wd

Files requiring SMBusDevice already include "hw/i2c/smbus.h".

To clean "qemu/typedefs.h", move the forward declaration
to "hw/i2c/smbus.h".

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/i2c/smbus.h  | 2 ++
 include/qemu/typedefs.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/i2c/smbus.h b/include/hw/i2c/smbus.h
index d8b1b9ee81..5c61c05999 100644
--- a/include/hw/i2c/smbus.h
+++ b/include/hw/i2c/smbus.h
@@ -35,6 +35,8 @@
 #define SMBUS_DEVICE_GET_CLASS(obj) \
      OBJECT_GET_CLASS(SMBusDeviceClass, (obj), TYPE_SMBUS_DEVICE)
=20
+typedef struct SMBusDevice SMBusDevice;
+
 typedef struct SMBusDeviceClass
 {
     I2CSlaveClass parent_class;
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 1c294c296c..4524e14d03 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -102,7 +102,6 @@ typedef struct RAMBlock RAMBlock;
 typedef struct Range Range;
 typedef struct SerialState SerialState;
 typedef struct SHPCDevice SHPCDevice;
-typedef struct SMBusDevice SMBusDevice;
 typedef struct uWireSlave uWireSlave;
 typedef struct VirtIODevice VirtIODevice;
 typedef struct Visitor Visitor;
--=20
2.17.2

