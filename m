Received: by 10.28.4.212 with SMTP id 203csp4284663wme;
        Tue, 8 May 2018 08:11:44 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZoFBzsehZhotcDUdy/kCkyort8rFRuapE0Sq6Kf9ySFW0ITo0IzCLfNuOY/fFDSx9EIfbMK
X-Received: by 2002:a0c:d290:: with SMTP id q16-v6mr22091784qvh.145.1525792304560;
        Tue, 08 May 2018 08:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525792304; cv=none;
        d=google.com; s=arc-20160816;
        b=kYWhCijqy7DIj16DS9HBWy0dD91+tLxrxmnivhxqIwDFny1bum5fguMD/a/80Q8dqi
         dOWilSVOZV7qugYqcg/F6cZOPDKSKo+xGh6EAN7cl0t3MBuHHS7iqRDka6xWwlTMMQOP
         zEQQGymrLFOYf7dQ/W4AEAFfCpR7ORJCNZSjp3m/5aTXdBiiHEy7HBUy1bue5R4xd3pt
         /o39PZTXz0J58jCSf0nhevcAenOBUQexmk29aX3czLWkiotaScuOV52vIU25EemKPty0
         Uiedk0EAZlhoLuZx6VAz2vMTa0fn07w4Io2/c+YZOaTCS7QV0cY3WRwjqt+PtZFDMqyL
         pP7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=akadkz0FoT2MUqQjNWwO0MkNCnELMn0hozv2oTUgTNs=;
        b=giGA4pIaMTZ3w3CaZF5dGiACuBAFNGOME0UQtJ0f2TNQStaL3NVaZhzTuUzvLfmTIy
         Q1/DlHPqaUfb1s4jpCCoPF7j81gDbk54oFfCiSx51nBKmsCybu2qt+Bsf1qgUpsYfwTA
         RclVzZSeqdURu7N3AP1E1cPlo2w/++IYteDT0AIqm6LcsB4Gs0I0bJ8VmLKb4OFEbgaQ
         hus0oWkbo+GIrwY3/kE9lBwe6IsyQRsgfI4xG6VZQD96ZxOqCKg0EntdtMNfmqF7ywbY
         MR3YHYDJnzMJvawVQrhgjs1zW1nVJJiXriCGyb42DXVuTgF2hRi02EW/tP+tqIuKeTUT
         MGhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jydgBHc3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s35-v6si5081828qtc.382.2018.05.08.08.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 May 2018 08:11:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jydgBHc3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fG4HH-00030i-Uh
	for alex.bennee@linaro.org; Tue, 08 May 2018 11:11:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG4GS-0002ic-JR
	for qemu-devel@nongnu.org; Tue, 08 May 2018 11:10:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG4GM-000524-Hu
	for qemu-devel@nongnu.org; Tue, 08 May 2018 11:10:52 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37593)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fG4GM-00051g-Dm; Tue, 08 May 2018 11:10:46 -0400
Received: by mail-qk0-x244.google.com with SMTP id d74so24913628qkg.4;
	Tue, 08 May 2018 08:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=akadkz0FoT2MUqQjNWwO0MkNCnELMn0hozv2oTUgTNs=;
	b=jydgBHc33h38CTrGGds8UI/gNHGRot6oNWkoR60Cc8Z3ZwdazHzl7I5fGpGk6xXTHa
	6fJD9eLszWV1FDjLkSlJUwyI+7H0KEgFZi0kL8mG806DyEF+tomDIB8UWOdpaMA8Ic2j
	muA857sfpYzmqerGa9mayWkXT9rJMt3Mf0YYsCV09VtwMZre7WWkrzOf9aRgg3POyzpb
	Wb1SO7Dg4I8sCs7o+V10cjFNsfNoJFL3JwIiNe80gt1NVKazudApqOvuQTUN+d3bbaYL
	n+bIZ1r8rkxT1peCbVeNR71LQZoBlGGfDNBL/35M8Cp4Fg3VipLtWiiCNoA2efugLGRZ
	jXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=akadkz0FoT2MUqQjNWwO0MkNCnELMn0hozv2oTUgTNs=;
	b=hRUtc9XePSZmb/V/fheTCK29k7byv6RcePNc9PZNqTcWIEqygnHvnjsydzVD9Kd+v/
	1mNZEI7x6LmGD1pmdO5xTnJprgYfb5GcqW4jiarXZvnDn7EE+r3LyISX0wL8qeNqZQBi
	zRaV0uG3jkgiU2M/LURX5Xy89TKkylYOzVsyoOpAvgULiiY4nn7dBKAqotyCyr97Z1BN
	CbuSIgghnvorjAaz0f5HfNzmm+sDdfkhttr/4hmeHKCU6Lw9mNwj38yjdupL5lxfZZwL
	9lFXFMo3GbWI29+eg9KzgqjEGpC6ebW0kl25vaVdxQKhx1JLOkghDGCK7fO9iLnBp+nd
	i4Zg==
X-Gm-Message-State: ALKqPweRaMABGS7oI3g02pNukeYOjXqc1VoPW/FUJxHMh3VwhcowUEuB
	LGsQwTA+17tqQYGDl0fcnw8=
X-Received: by 10.55.159.194 with SMTP id i185mr2851461qke.107.1525792245969; 
	Tue, 08 May 2018 08:10:45 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	w12-v6sm13305015qtb.80.2018.05.08.08.10.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 May 2018 08:10:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Tue,  8 May 2018 12:10:33 -0300
Message-Id: <20180508151035.16774-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180508151035.16774-1-f4bug@amsat.org>
References: <20180508151035.16774-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-devel] [RFC PATCH 2/4] hw/pcmcia: Remove PCMCIACardState from
 qemu/typedefs.h
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2W1o4EbNo4KG

There is only one file requiring this typedef (hw/arm/pxa.h),
let it include "hw/pcmcia.h" directly to simplify qemu/typedefs.h.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/arm/pxa.h    | 1 +
 include/hw/pcmcia.h     | 4 ++--
 include/qemu/typedefs.h | 1 -
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index 0df1199caa..f6dfb5c0cf 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -12,6 +12,7 @@
 
 #include "exec/memory.h"
 #include "target/arm/cpu-qom.h"
+#include "hw/pcmcia.h"
 
 /* Interrupt numbers */
 # define PXA2XX_PIC_SSP3	0
diff --git a/include/hw/pcmcia.h b/include/hw/pcmcia.h
index 79cac9c761..1b4080764f 100644
--- a/include/hw/pcmcia.h
+++ b/include/hw/pcmcia.h
@@ -18,13 +18,13 @@ typedef struct PCMCIASocket {
 #define PCMCIA_CARD_CLASS(cls) \
     OBJECT_CLASS_CHECK(PCMCIACardClass, cls, TYPE_PCMCIA_CARD)
 
-struct PCMCIACardState {
+typedef struct PCMCIACardState {
     /*< private >*/
     DeviceState parent_obj;
     /*< public >*/
 
     PCMCIASocket *slot;
-};
+} PCMCIACardState;
 
 typedef struct PCMCIACardClass {
     /*< private >*/
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 325c72de33..c7a0159bd2 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -76,7 +76,6 @@ typedef struct PCIHostDeviceAddress PCIHostDeviceAddress;
 typedef struct PCIHostState PCIHostState;
 typedef struct PCMachineClass PCMachineClass;
 typedef struct PCMachineState PCMachineState;
-typedef struct PCMCIACardState PCMCIACardState;
 typedef struct PixelFormat PixelFormat;
 typedef struct PostcopyDiscardState PostcopyDiscardState;
 typedef struct Property Property;
-- 
2.17.0

