Received: by 10.25.159.19 with SMTP id i19csp498632lfe;
        Tue, 12 Jan 2016 05:10:05 -0800 (PST)
X-Received: by 10.194.93.102 with SMTP id ct6mr132615916wjb.157.1452604205080;
        Tue, 12 Jan 2016 05:10:05 -0800 (PST)
Return-Path: <pm215@archaic.org.uk>
Received: from mnementh.archaic.org.uk (mnementh.archaic.org.uk. [2001:8b0:1d0::1])
        by mx.google.com with ESMTPS id j6si31171240wmj.0.2016.01.12.05.10.04
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jan 2016 05:10:05 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) client-ip=2001:8b0:1d0::1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of pm215@archaic.org.uk designates 2001:8b0:1d0::1 as permitted sender) smtp.mailfrom=pm215@archaic.org.uk
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1aIyi4-00075D-3h; Tue, 12 Jan 2016 13:10:04 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: patches@linaro.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH] disas/libvixl: Suppress gcc 4.6.3 sign-compare warnings
Date: Tue, 12 Jan 2016 13:10:04 +0000
Message-Id: <1452604204-27202-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-TUID: +EUKJKsb09GQ

The VIXL code includes some equality comparisons between signed
and unsigned types. Modern gcc and clang do not complain about
these, but older versions of gcc such as gcc 4.6.3 do. Since
libvixl is an upstream library, the simplest approach is to
suppress the warnings by applying -Wno-sign-compare to the
relevant files.

(GCC 4.6 is not quite yet irrelevant for us; it is the gcc
shipped with Ubuntu Precise, for example, which is an LTS
release not yet out of its support period.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I had mistakenly thought these warnings only happened with
the totally ancient mingw gcc, but it turns out they're a
bit more widespread. In particular this is causing our
Travis builds to fail:
  https://travis-ci.org/qemu/qemu/jobs/101813358

If somebody could review this then I'll apply it to master
as a buildfix.
---
 disas/Makefile.objs         | 5 ++++-
 disas/libvixl/Makefile.objs | 4 +++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/disas/Makefile.objs b/disas/Makefile.objs
index 8dae4da..abeba84 100644
--- a/disas/Makefile.objs
+++ b/disas/Makefile.objs
@@ -4,7 +4,10 @@ common-obj-$(CONFIG_ARM_DIS) += arm.o
 common-obj-$(CONFIG_ARM_A64_DIS) += arm-a64.o
 common-obj-$(CONFIG_ARM_A64_DIS) += libvixl/
 libvixldir = $(SRC_PATH)/disas/libvixl
-arm-a64.o-cflags := -I$(libvixldir)
+# The -Wno-sign-compare is needed only for gcc 4.6, which complains about
+# some signed-unsigned equality comparisons in libvixl which later gcc
+# versions do not.
+arm-a64.o-cflags := -I$(libvixldir) -Wno-sign-compare
 common-obj-$(CONFIG_CRIS_DIS) += cris.o
 common-obj-$(CONFIG_HPPA_DIS) += hppa.o
 common-obj-$(CONFIG_I386_DIS) += i386.o
diff --git a/disas/libvixl/Makefile.objs b/disas/libvixl/Makefile.objs
index e373cf0..d1e801a 100644
--- a/disas/libvixl/Makefile.objs
+++ b/disas/libvixl/Makefile.objs
@@ -4,6 +4,8 @@ libvixl_OBJS = vixl/utils.o \
                vixl/a64/decoder-a64.o \
                vixl/a64/disasm-a64.o
 
-$(addprefix $(obj)/,$(libvixl_OBJS)): QEMU_CFLAGS := -I$(SRC_PATH)/disas/libvixl $(QEMU_CFLAGS)
+# The -Wno-sign-compare is needed only for gcc 4.6, which complains about
+# some signed-unsigned equality comparisons which later gcc versions do not.
+$(addprefix $(obj)/,$(libvixl_OBJS)): QEMU_CFLAGS := -I$(SRC_PATH)/disas/libvixl -Wno-sign-compare $(QEMU_CFLAGS)
 
 common-obj-$(CONFIG_ARM_A64_DIS) += $(libvixl_OBJS)
-- 
1.9.1
