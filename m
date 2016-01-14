Received: by 10.25.159.19 with SMTP id i19csp1801924lfe;
        Thu, 14 Jan 2016 06:17:45 -0800 (PST)
X-Received: by 10.194.250.39 with SMTP id yz7mr4995643wjc.92.1452781065567;
        Thu, 14 Jan 2016 06:17:45 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id ez7si9878868wjd.214.2016.01.14.06.17.45
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 06:17:45 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJiKe-0008V5-0S; Thu, 14 Jan 2016 13:52:56 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v3 17/19] hw/arm/virt: Wire up memory region to CPUs explicitly
Date: Thu, 14 Jan 2016 13:52:53 +0000
Message-Id: <1452779575-32582-18-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
References: <1452779575-32582-1-git-send-email-peter.maydell@linaro.org>
X-TUID: 6Y1zT11nKwZN

Wire up the system memory region to the CPUs explicitly
by setting the QOM property. This doesn't change anything
over letting it default, but will be needed for adding
a secure memory region later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/virt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index fd52b76..c9addad 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1092,6 +1092,9 @@ static void machvirt_init(MachineState *machine)
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
