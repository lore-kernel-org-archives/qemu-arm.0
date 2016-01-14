Received: by 10.25.159.19 with SMTP id i19csp1822083lfe;
        Thu, 14 Jan 2016 06:53:23 -0800 (PST)
X-Received: by 10.194.116.133 with SMTP id jw5mr4460886wjb.110.1452783203906;
        Thu, 14 Jan 2016 06:53:23 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id a127si47002517wmc.63.2016.01.14.06.53.23
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jan 2016 06:53:23 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aJjH8-00009l-4r; Thu, 14 Jan 2016 14:53:22 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Franz-Josef Haider <Franz-Josef.Haider@student.uibk.ac.at>
Subject: [PATCH] disas/libvixl: Really suppress gcc 4.6.3 sign-compare warnings
Date: Thu, 14 Jan 2016 14:53:22 +0000
Message-Id: <1452783202-576-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-TUID: sUnqFmIDzLKk

Commit 8acc216b956 attempted to silence some sign-compare
warnings in libvixl by adding -Wno-sign-compare to the CFLAGS
for the relevant objects. Unfortunately it was ineffective
because it was placed before $(QEMU_CFLAGS), so the -Wall in
the general flags overrode -Wno-sign-compare rather than
vice-versa. Reorder the flags so the warning suppression works.

Thanks to Franz-Josef Haider <Franz-Josef.Haider@student.uibk.ac.at>
for pointing out what was wrong with the original patch.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Alex, is there a way to test this patch against Travis before
we commit it to master?

 disas/libvixl/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/disas/libvixl/Makefile.objs b/disas/libvixl/Makefile.objs
index d1e801a..bbe7695 100644
--- a/disas/libvixl/Makefile.objs
+++ b/disas/libvixl/Makefile.objs
@@ -6,6 +6,6 @@ libvixl_OBJS = vixl/utils.o \
 
 # The -Wno-sign-compare is needed only for gcc 4.6, which complains about
 # some signed-unsigned equality comparisons which later gcc versions do not.
-$(addprefix $(obj)/,$(libvixl_OBJS)): QEMU_CFLAGS := -I$(SRC_PATH)/disas/libvixl -Wno-sign-compare $(QEMU_CFLAGS)
+$(addprefix $(obj)/,$(libvixl_OBJS)): QEMU_CFLAGS := -I$(SRC_PATH)/disas/libvixl $(QEMU_CFLAGS) -Wno-sign-compare
 
 common-obj-$(CONFIG_ARM_A64_DIS) += $(libvixl_OBJS)
-- 
1.9.1
