Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.19])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498b4bsm940451766b.148.2025.05.21.09.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 09:51:08 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BA1615F8AD;
	Wed, 21 May 2025 17:42:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	John Snow <jsnow@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Peter Xu <peterx@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gustavo Romero <gustavo.romero@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH v3 20/20] gdbstub: update aarch64-core.xml
Date: Wed, 21 May 2025 17:42:50 +0100
Message-Id: <20250521164250.135776-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250521164250.135776-1-alex.bennee@linaro.org>
References: <20250521164250.135776-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 8ghOLLwpD8Dp

From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

Update aarch64-core.xml to include field definitions for PSTATE, which
in gdb is modelled in the cpsr (current program status register)
pseudo-register, named after the actual cpsr register in armv7.

Defining the fields layout of the register allows easy inspection of for
example, the current exception level (EL):

For example. Before booting a Linux guest, EL=2, but after booting and
Ctrl-C'ing in gdb, we get EL=0:

  (gdb) info registers $cpsr
  cpsr           0x20402009          [ SP EL=2 BTYPE=0 PAN C ]
  (gdb) cont
  Continuing.
  ^C
  Thread 2 received signal SIGINT, Interrupt.
  0x0000ffffaaff286c in ?? ()
  (gdb) info registers $cpsr
  cpsr           0x20001000          [ EL=0 BTYPE=0 SSBS C ]

The aarch64-core.xml has been updated to match exactly the version
retrieved from upstream gdb, retrieved in 2025-05-19 from HEAD commit
9f4dc0b137c86f6ff2098cb1ab69442c69d6023d.

Link: https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gdb/features/aarch64-core.xml;h=b8046510b9a085d30463d37b3ecc8d435f5fb7a4;hb=HEAD
Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Message-Id: <20250519-gdbstub-aarch64-pstate-xml-v1-1-b4dbe87fe7c6@linaro.org>
[AJB: expanded upstream link]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 gdb-xml/aarch64-core.xml | 52 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/gdb-xml/aarch64-core.xml b/gdb-xml/aarch64-core.xml
index e1e9dc3f91..b8046510b9 100644
--- a/gdb-xml/aarch64-core.xml
+++ b/gdb-xml/aarch64-core.xml
@@ -1,5 +1,5 @@
 <?xml version="1.0"?>
-<!-- Copyright (C) 2009-2012 Free Software Foundation, Inc.
+<!-- Copyright (C) 2009-2025 Free Software Foundation, Inc.
      Contributed by ARM Ltd.
 
      Copying and distribution of this file, with or without modification,
@@ -42,5 +42,53 @@
   <reg name="sp" bitsize="64" type="data_ptr"/>
 
   <reg name="pc" bitsize="64" type="code_ptr"/>
-  <reg name="cpsr" bitsize="32"/>
+
+  <flags id="cpsr_flags" size="4">
+    <!-- Stack Pointer.  -->
+    <field name="SP" start="0" end="0"/>
+
+    <!-- Exception Level.  -->
+    <field name="EL" start="2" end="3"/>
+    <!-- Execution state.  -->
+    <field name="nRW" start="4" end="4"/>
+
+    <!-- FIQ interrupt mask.  -->
+    <field name="F" start="6" end="6"/>
+    <!-- IRQ interrupt mask.  -->
+    <field name="I" start="7" end="7"/>
+    <!-- SError interrupt mask.  -->
+    <field name="A" start="8" end="8"/>
+    <!-- Debug exception mask.  -->
+    <field name="D" start="9" end="9"/>
+
+    <!-- ARMv8.5-A: Branch Target Identification BTYPE.  -->
+    <field name="BTYPE" start="10" end="11"/>
+
+    <!-- ARMv8.0-A: Speculative Store Bypass.  -->
+    <field name="SSBS" start="12" end="12"/>
+
+    <!-- Illegal Execution state.  -->
+    <field name="IL" start="20" end="20"/>
+    <!-- Software Step.  -->
+    <field name="SS" start="21" end="21"/>
+    <!-- ARMv8.1-A: Privileged Access Never.  -->
+    <field name="PAN" start="22" end="22"/>
+    <!-- ARMv8.2-A: User Access Override.  -->
+    <field name="UAO" start="23" end="23"/>
+    <!-- ARMv8.4-A: Data Independent Timing.  -->
+    <field name="DIT" start="24" end="24"/>
+    <!-- ARMv8.5-A: Tag Check Override.  -->
+    <field name="TCO" start="25" end="25"/>
+
+    <!-- Overflow Condition flag.  -->
+    <field name="V" start="28" end="28"/>
+    <!-- Carry Condition flag.  -->
+    <field name="C" start="29" end="29"/>
+    <!-- Zero Condition flag.  -->
+    <field name="Z" start="30" end="30"/>
+    <!-- Negative Condition flag.  -->
+    <field name="N" start="31" end="31"/>
+  </flags>
+  <reg name="cpsr" bitsize="32" type="cpsr_flags"/>
+
 </feature>
-- 
2.39.5
