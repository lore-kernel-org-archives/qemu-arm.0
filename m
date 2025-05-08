Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp293885njb;
        Thu, 8 May 2025 02:36:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYePufaL2gUMVanjQ34IooAFqrcG9sqmWTxPos4DBtuSC60Npbgv9+rZ8tKhf5GHfdvBzKiCo/42KkjA==@linaro.org
X-Google-Smtp-Source: AGHT+IF4qDz2Aor+i64RyfVlyT8uEbCKY0MMiLt54rk1UrpqZ5gMcttewTyqN4tPslKWFuqpL/LD
X-Received: by 2002:a05:620a:2401:b0:7c5:a2f8:e6e4 with SMTP id af79cd13be357-7caf73abab2mr864688685a.29.1746696962760;
        Thu, 08 May 2025 02:36:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746696962; cv=none;
        d=google.com; s=arc-20240605;
        b=BQa2jqVCbw9NFlTrSWg+gTU5Z8dmLyP7Z3D0QRfESW9Joa7ekxu6Zq3ZaGp/QP9zvc
         nh+qTL+syE4CLZFCh8EAaFNeSqPoQ4dSuHkTsORldX3oTnPI3MxQBFS2bFXtwJMDL6Bs
         di2OZjKN8ZC03TDqzx2ShhayR0ZPxB5FgvnyylSWHn0hIBUvxepAnxtV2OXuG6/Urpy7
         uuMRULDMrswIpvTK9sVFFSivi2SdgJvVq9+PhGhHxWmDPzOvP/TedJTuYIpv8fTUEeZS
         3XiMfwlgt5qwJbFqN6Pe/wRF5+9wf5eFYE802arYiEm5/kyiWlxWp7ub/ftax4VIhiAp
         TVJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=O8Chei4hG47ktKgHJke9aTE1rPVeODLyzcx/ix7iQCo=;
        fh=cp5/pjrGBiOSnVnIYR1qYu8cyK1vwqycjiVaN+zSIMY=;
        b=D0Th/F3rii+1KlGtP72SR7PqaYwN9Clyqrzd6RLrCSFf7wd7Qcu39yQLaKpKVpF/C8
         w4wwihwkGAdI3CVn2Z4OuutZGX27IGI5oi5BsJDYHQRQ0VA2IP3mSNCdbFfj4JoPvo+Q
         P4EB0T/CUr38qMHCH7TqML9foEwKF517mDsN9kgPAbL/OlAT0oWrSnvrG7g6ZwtOI84e
         yeOw8oMON/Fk94TyYutRxkgleeQJYNZMziDtsCgqdBc5SgkZRVamBA9tDgxK8bams+Ez
         35AgM/QC7gM0QlFRkiFAhKtXx2l0p57wMx9Z+mPX/prdhunxlmwtotlfp9jORCHaDvq/
         /qLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wx48MQ4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7caf75c9154si411580685a.491.2025.05.08.02.36.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 May 2025 02:36:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wx48MQ4b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCxfK-0005Ng-8P; Thu, 08 May 2025 05:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCxfI-0005NS-BV
 for qemu-arm@nongnu.org; Thu, 08 May 2025 05:35:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1uCxfG-0007lJ-Od
 for qemu-arm@nongnu.org; Thu, 08 May 2025 05:35:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746696937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O8Chei4hG47ktKgHJke9aTE1rPVeODLyzcx/ix7iQCo=;
 b=Wx48MQ4bGATotFnqxlIllUFjjEdyvEtmq7aWrilAQnUFG+7HfX6Y8aK7X0PmG4NI17FNhC
 EklFlHYMsrGu/z+rFv67VhCnpiZhEMB4lvld03bxEaR0qOCMumTIzf6YWOoF34sWCj+Xc9
 kimvtaKN+d5Hyi5ZONBSjBdfFLLt5vs=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-323-IPkRhpCqMT60MEAt4Xen4A-1; Thu,
 08 May 2025 05:35:34 -0400
X-MC-Unique: IPkRhpCqMT60MEAt4Xen4A-1
X-Mimecast-MFC-AGG-ID: IPkRhpCqMT60MEAt4Xen4A_1746696933
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BB70E1955BC6; Thu,  8 May 2025 09:35:33 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.32.200])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F2ADB1955F24; Thu,  8 May 2025 09:35:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Brad Smith <brad@comstyle.com>
Cc: Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 2/5] hw/display/bcm2835_fb: Move inclusion of console.h to the
 .c file
Date: Thu,  8 May 2025 11:35:16 +0200
Message-ID: <20250508093519.144004-3-thuth@redhat.com>
In-Reply-To: <20250508093519.144004-1-thuth@redhat.com>
References: <20250508093519.144004-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1kW8mNqWfRGNA-uTanSUxKcQzexPIzraezdHdcv5Qds_1746696933
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.414,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AKyxZfdAyPUN

From: Thomas Huth <thuth@redhat.com>

The definitions from console.h are not needed in the bcm2835_fb.h
header file yet, so let's move it to the place that really needs
its definitions, i.e. into the bcm2835_fb.c file.
This way the header can also be used by code that is not compiled
with the CFLAGS that are required for pixman or OpenGL (in case
their headers do not reside under /usr/include).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/display/bcm2835_fb.h | 1 -
 hw/display/bcm2835_fb.c         | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/display/bcm2835_fb.h b/include/hw/display/bcm2835_fb.h
index 49541bf08f4..acc9230b6a8 100644
--- a/include/hw/display/bcm2835_fb.h
+++ b/include/hw/display/bcm2835_fb.h
@@ -13,7 +13,6 @@
 #define BCM2835_FB_H
 
 #include "hw/sysbus.h"
-#include "ui/console.h"
 #include "qom/object.h"
 
 #define UPPER_RAM_BASE 0x40000000
diff --git a/hw/display/bcm2835_fb.c b/hw/display/bcm2835_fb.c
index 820e67ac8bb..1bb2ee45a01 100644
--- a/hw/display/bcm2835_fb.c
+++ b/hw/display/bcm2835_fb.c
@@ -27,6 +27,7 @@
 #include "hw/display/bcm2835_fb.h"
 #include "hw/hw.h"
 #include "hw/irq.h"
+#include "ui/console.h"
 #include "framebuffer.h"
 #include "ui/pixel_ops.h"
 #include "hw/misc/bcm2835_mbox_defs.h"
-- 
2.49.0

