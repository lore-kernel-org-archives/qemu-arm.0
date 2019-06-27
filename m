Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1694117wru;
        Thu, 27 Jun 2019 13:28:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwOksfPg6Lb2WIlmSE1ir+dVTcpaGl5AXyovzfwyEUrY0FzEyGvQavFLhcrouNT+1/w24ot
X-Received: by 2002:a37:a484:: with SMTP id n126mr4923406qke.366.1561667303473;
        Thu, 27 Jun 2019 13:28:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561667303; cv=none;
        d=google.com; s=arc-20160816;
        b=RYAp9lrWwl8hAFgaFXQh+9L0DdjtczO/SAguzPqwITulYKEFRVyGuD09qqM10qZ93B
         K/AaF4ahToCpY0lZdsP9+9hYSWdVr5iwSvTYySqMaOnF03NHsmc31bZiMatVrnljTwcx
         m65nNNZFbC1+8yJhgWXrR5KsDMkKO3e+/U83kPpGHl/Um7TS75eq6QITrzFrLPNGfH+4
         F8jFYUwlf59jN7iPoaccraHZI/YjZtZ0LPD1VMWbpzWR8SMjUzN8ATC+SAW++/RUq5K4
         APE3/y8zMrZ+gV3czzVXnX/z7JpV3UG15aVXOmAJOEpE+ygYEYeOqnosVhJgb5lAbg2a
         yMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=JDmc9JDWp1m+Mm+pYgFQdjh2p8NUu2VYgkrIAG8VhBA=;
        b=Zo2rDXa+s+f/a5z4jxy40swOYZkjR3VzE++mqVeQgW29tFALv6SInws2xUDSG9IA4b
         iZt3cO5h7+XUEA0DJaMxag0w8742aoBxZ6DZycG3qOHVDaYbZoPkqb1N1ue0J5YsNle9
         A8SeyMnVheIgpjfuhor0IKq7+Tk3pAzIlVq8GziGFIZgJbzVZdeFjy+wo211Ve+CJOMt
         UXjA497+tp2dwDsFZcTshE8r6nbVyB67xq8dRcEQ0LUFwFSU/Fd4s/Bmtt0wu8pisQ8/
         1dgC92ET8lZzBrU2Id/CRUnqWMFzJDn8Uu4HiwWXycbCsnXqVFZ7tnFo76ciWGsexXAg
         eBXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id v5si119858qtb.115.2019.06.27.13.28.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 13:28:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 76EEC811A9;
	Thu, 27 Jun 2019 20:28:20 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-69.brq.redhat.com [10.40.204.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E045600CC;
	Thu, 27 Jun 2019 20:28:15 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Stephen Checkoway <stephen.checkoway@oberlin.edu>,
	qemu-devel@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
	qemu-block@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Max Reitz <mreitz@redhat.com>,
	qemu-ppc@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>,
	Jan Kiszka <jan.kiszka@web.de>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Michael Walle <michael@walle.cc>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 05/28] hw/block/pflash_cfi02: Add an enum to define the write cycles
Date: Thu, 27 Jun 2019 22:26:56 +0200
Message-Id: <20190627202719.17739-6-philmd@redhat.com>
In-Reply-To: <20190627202719.17739-1-philmd@redhat.com>
References: <20190627202719.17739-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 27 Jun 2019 20:28:22 +0000 (UTC)
X-TUID: SOKzZuCoL1k2

No change in functionality is intended with this commit.

Signed-off-by: Stephen Checkoway <stephen.checkoway@oberlin.edu>
Message-Id: <20190426162624.55977-3-stephen.checkoway@oberlin.edu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[PMD: Extracted from bigger patch]
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/pflash_cfi02.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 43796e551a..303d225f23 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -57,6 +57,11 @@ do {                                                       \
 
 #define PFLASH_LAZY_ROMD_THRESHOLD 42
 
+/* Special write cycles for CFI queries. */
+enum {
+    WCYCLE_CFI              = 7,
+};
+
 struct PFlashCFI02 {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -286,7 +291,7 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr offset,
         if (boff == 0x55 && cmd == 0x98) {
         enter_CFI_mode:
             /* Enter CFI query mode */
-            pfl->wcycle = 7;
+            pfl->wcycle = WCYCLE_CFI;
             pfl->cmd = 0x98;
             return;
         }
@@ -458,7 +463,8 @@ static void pflash_write(PFlashCFI02 *pfl, hwaddr offset,
             goto reset_flash;
         }
         break;
-    case 7: /* Special value for CFI queries */
+    /* Special values for CFI queries */
+    case WCYCLE_CFI:
         DPRINTF("%s: invalid write in CFI query mode\n", __func__);
         goto reset_flash;
     default:
-- 
2.20.1
