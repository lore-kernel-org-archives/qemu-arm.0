Received: by 10.182.105.169 with SMTP id gn9csp619198obb;
        Thu, 5 Nov 2015 10:16:37 -0800 (PST)
X-Received: by 10.66.184.42 with SMTP id er10mr11261585pac.117.1446747376769;
        Thu, 05 Nov 2015 10:16:16 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id mr9si11682112pbb.183.2015.11.05.10.16.15
        (version=TLSv1.2 cipher=RC4-SHA bits=128/128);
        Thu, 05 Nov 2015 10:16:16 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZuP4p-0004l9-Ii; Thu, 05 Nov 2015 18:15:59 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH 14/16] hw/arm/virt: Wire up memory region to CPUs explicitly
Date: Thu,  5 Nov 2015 18:15:56 +0000
Message-Id: <1446747358-18214-15-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
X-TUID: tCJMzj6F/UZW

Wire up the system memory region to the CPUs explicitly
by setting the QOM property. This doesn't change anything
over letting it default, but will be needed for adding
a secure memory region later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 77d9267..3ab31e0 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1020,6 +1020,9 @@ static void machvirt_init(MachineState *machine)
                                     "reset-cbar", &error_abort);
         }
 
+        object_property_set_link(cpuobj, OBJECT(sysmem), "memory",
+                                 &error_abort);
+
         object_property_set_bool(cpuobj, true, "realized", NULL);
     }
     g_strfreev(cpustr);
-- 
1.9.1
