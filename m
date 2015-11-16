Received: by 10.182.158.201 with SMTP id ww9csp129529obb;
        Mon, 16 Nov 2015 06:22:14 -0800 (PST)
X-Received: by 10.28.136.15 with SMTP id k15mr18347119wmd.51.1447683731988;
        Mon, 16 Nov 2015 06:22:11 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id 190si8186060wmh.13.2015.11.16.06.22.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 16 Nov 2015 06:22:11 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1ZyKPM-00013i-2W; Mon, 16 Nov 2015 14:05:24 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	qemu-arm@nongnu.org
Subject: [PATCH v2 17/19] hw/arm/virt: Wire up memory region to CPUs explicitly
Date: Mon, 16 Nov 2015 14:05:21 +0000
Message-Id: <1447682723-3977-18-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
References: <1447682723-3977-1-git-send-email-peter.maydell@linaro.org>
X-TUID: p7sISBJaD3cJ

Wire up the system memory region to the CPUs explicitly
by setting the QOM property. This doesn't change anything
over letting it default, but will be needed for adding
a secure memory region later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9c6792c..47cc196 100644
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
