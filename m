Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2449063wrq;
        Sat, 23 Jun 2018 21:14:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK//YNKaXxZ8sAsSkC9TNdahUXv/Yxkp+A+mwPIkhxA1Dc8/bvT+ZPvYaMpzmG+W6f1CQ8w
X-Received: by 2002:a37:de02:: with SMTP id h2-v6mr6392452qkj.420.1529813648025;
        Sat, 23 Jun 2018 21:14:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529813648; cv=none;
        d=google.com; s=arc-20160816;
        b=XD6+uNDFm9hqhw9qPqiC62MbK+Jd3lFaRkMsTEbkg/RQZPkB1cgjIlaDxMISdzerQJ
         LskhLCs1pYDlvAjbxVIFOXq3gFmv2xWCrohwYBZDqOCB/97BRtNOkjcpTfP4vQTzOx1k
         cZCLPaO9DduHOUI0/SgAOLsYNYZp4FYc6CsBeujHAe7ONdMdEXwIP/DoPJOA8XJapFNR
         omie8vsXUzqLv0oipKR5FssZrNeXf19C7XdTbWVcKCXEjHr3jYSzq97RLG3w4nCFbj/s
         IbfvrxiabYsyfIRAENtEURVfk3c15W5mEqUILFpq5u6gze6ogDxwkCXcvcHCLpRFv9lB
         0M5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=hh/bp8CNMejKQ01C+jEYyVBD3Ry5ISVMzqeumMxnEr8=;
        b=fu7F7jaMxxdpSa1vxT9stCSsc53+BVZ4w+LTPjI8oYQ+gHK1IZUfQLP2H0X6Zi96Zn
         ckCKCtY5SmP30qVoxASzy/uauaejIUnw482Yjf2dSdae09asx+pCgPirWWgdGKcEfmJe
         CdGST18pTuUIVsnfpIbl43SAK8UmvVaidrEz6DDPxZJMPlay2Of6j25LG1L2da/3jt1y
         UbT5m+doCw1WlozARzeJve+MabIhZt4bM5X5EWhRzGqCV3lPd7fTSfEhD4FXQ3u5AZyv
         vX/aWFztVxgS2AloEEB6kSKnyDkiO5CMeuCgNt1HyXnUOQ8oGFHJcWnREXtqaJpMo2j6
         cp9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o8wrqNsw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d5-v6si2257224qtn.268.2018.06.23.21.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 23 Jun 2018 21:14:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o8wrqNsw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40535 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWwPf-0001A8-Hx
	for alex.bennee@linaro.org; Sun, 24 Jun 2018 00:14:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42577)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIo-0004Dk-T1
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:07:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIk-0004Fm-AT
	for qemu-devel@nongnu.org; Sun, 24 Jun 2018 00:07:02 -0400
Received: from mail-qt0-x236.google.com ([2607:f8b0:400d:c0d::236]:35274)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fWwIk-0004FT-78; Sun, 24 Jun 2018 00:06:58 -0400
Received: by mail-qt0-x236.google.com with SMTP id z6-v6so9356547qti.2;
	Sat, 23 Jun 2018 21:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hh/bp8CNMejKQ01C+jEYyVBD3Ry5ISVMzqeumMxnEr8=;
	b=o8wrqNsw9n1WYgRn3GyDDYij/JEouj7SO1BNlGYwmPllrZvnPh5apyhwPWRkcIRX2F
	2z5nck82EF5jbnLAAQPncEwxsu2eRY50ew1XYV3asBCbgE31mdUHVGCRHHDc+2kZaxa0
	zdN8MiHwGAM3RNocvyoVxHrlCQw6wz9k+pSw7yhvM/rXK2LmpwMJYoToWujmqbeT3g/0
	Albjy6TS9cShN8BTl25vRApU1jKGHonM8qfrZyEbp2buM/W7buXoVz3Np47xTrvFmUXa
	9NwXNMpXRJGwe2e29dQoQ0RswJsicCi7aJe3ZPUwLrzzWBEqiCMnZLtSYkdTrBb7W/iv
	azDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=hh/bp8CNMejKQ01C+jEYyVBD3Ry5ISVMzqeumMxnEr8=;
	b=OwlV2KP8pV6bxGS44yF6K4xdtzSFAQTPs6ZIoz3DqNrimgmvTqOdrHBNX1KuiL9+Z2
	avbE8Sa/QoJw/JaUY7gr9udtVk1tDYr7kLi0jKnbSGMFpYb01xi+ffBEh6mr/EqSLw9d
	VHvjvhRXcpPCf3SGsem2uuwAJHbqY/AHN7h/shPuzjtwokW8qcK9z4EbVUu0M85PlNlJ
	vOOhXU475VSw2IwF74/KhwxYPVPsgjFJSYw7KES/2yiVTl3pg8VuRXVKAzY7Uf1hO8vf
	l5Pd1pW1UWIOJkW4gk1GbPNunDfvZy5N9Iq+PkRjpUfgrXCmNMtDKTrAsqAkD+q/bf4K
	IKvA==
X-Gm-Message-State: APt69E2IUgFJ+ObxogLZQdLBjY1on7YOFQjjgXcxZnaoN5qJ2Er1B/yL
	DjuRW8samFkjssdvWMjGWuA=
X-Received: by 2002:ac8:338a:: with SMTP id
	c10-v6mr6729460qtb.178.1529813217800; 
	Sat, 23 Jun 2018 21:06:57 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	d14-v6sm7145313qtn.90.2018.06.23.21.06.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Jun 2018 21:06:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Date: Sun, 24 Jun 2018 01:06:05 -0300
Message-Id: <20180624040609.17572-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624040609.17572-1-f4bug@amsat.org>
References: <20180624040609.17572-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::236
Subject: [Qemu-devel] [PATCH v3 12/16] hw/net/stellaris_enet: Use
 qemu_log_mask(GUEST_ERROR) instead of hw_error
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
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IiaCWB6MeA7b

hw_error() finally calls abort(), but there is no need to abort here.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/net/stellaris_enet.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/net/stellaris_enet.c b/hw/net/stellaris_enet.c
index 1e7329517c..165562d788 100644
--- a/hw/net/stellaris_enet.c
+++ b/hw/net/stellaris_enet.c
@@ -9,6 +9,7 @@
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
 #include "net/net.h"
+#include "qemu/log.h"
 #include <zlib.h>
 
 //#define DEBUG_STELLARIS_ENET 1
@@ -343,7 +344,9 @@ static uint64_t stellaris_enet_read(void *opaque, hwaddr offset,
     case 0x3c: /* Undocumented: Timestamp? */
         return 0;
     default:
-        hw_error("stellaris_enet_read: Bad offset %x\n", (int)offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "stellaris_enet_rd%d: Illegal register"
+                                       " 0x02%" HWADDR_PRIx "\n",
+                      size * 8, offset);
         return 0;
     }
 }
@@ -442,7 +445,9 @@ static void stellaris_enet_write(void *opaque, hwaddr offset,
         /* Ignored.  */
         break;
     default:
-        hw_error("stellaris_enet_write: Bad offset %x\n", (int)offset);
+        qemu_log_mask(LOG_GUEST_ERROR, "stellaris_enet_wr%d: Illegal register "
+                                       "0x02%" HWADDR_PRIx " = 0x%" PRIx64 "\n",
+                      size * 8, offset, value);
     }
 }
 
-- 
2.18.0

