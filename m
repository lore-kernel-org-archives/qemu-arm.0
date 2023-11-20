Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b004064cd71aa8sm13821581wmq.34.2023.11.20.07.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:08:42 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 456B16577B;
	Mon, 20 Nov 2023 15:08:35 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marek Vasut <marex@denx.de>,
	Thomas Huth <thuth@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Luis Machado <luis.machado@arm.com>
Subject: [PATCH v2 14/14] tests/tcg: finesse the registers check for "hidden" regs
Date: Mon, 20 Nov 2023 15:08:33 +0000
Message-Id: <20231120150833.2552739-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120150833.2552739-1-alex.bennee@linaro.org>
References: <20231120150833.2552739-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CgZrTbugFBVy

The reason the ppc64 and s390x test where failing was because gdb
hides them although they are still accessible via regnum. We can
re-arrange the test a little bit and include these two arches in our
test.

We still don't explicitly fail for registers that just disappear like
in the ARM case:

  xml-tdesc has 228 registers
  remote-registers has 219 registers
  of which 0 are hidden
  {'name': 'CNTP_CVAL', 'regnum': 96} wasn't seen in remote-registers
  {'name': 'CNTV_CVAL', 'regnum': 101} wasn't seen in remote-registers
  {'name': 'PAR', 'regnum': 113} wasn't seen in remote-registers
  {'name': 'CPUACTLR', 'regnum': 114} wasn't seen in remote-registers
  {'name': 'CPUECTLR', 'regnum': 127} wasn't seen in remote-registers
  {'name': 'CPUMERRSR', 'regnum': 140} wasn't seen in remote-registers
  {'name': 'TTBR1', 'regnum': 148} wasn't seen in remote-registers
  {'name': 'L2MERRSR', 'regnum': 161} wasn't seen in remote-registers
  {'name': 'TTBR0', 'regnum': 168} wasn't seen in remote-registers

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Ilya Leoshkevich <iii@linux.ibm.com>
Cc: qemu-s390x@nongnu.org
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-ppc@nongnu.org
Cc: Luis Machado <luis.machado@arm.com>

---
v2
  - skip if check for total_regs != total_r_regs and always dump what
    is elided/missed
---
 tests/tcg/multiarch/gdbstub/registers.py | 87 +++++++++++++++++-------
 tests/tcg/ppc64/Makefile.target          |  7 --
 tests/tcg/s390x/Makefile.target          |  4 --
 3 files changed, 64 insertions(+), 34 deletions(-)

diff --git a/tests/tcg/multiarch/gdbstub/registers.py b/tests/tcg/multiarch/gdbstub/registers.py
index ff6076b09e..8ba14099b5 100644
--- a/tests/tcg/multiarch/gdbstub/registers.py
+++ b/tests/tcg/multiarch/gdbstub/registers.py
@@ -44,7 +44,6 @@ def fetch_xml_regmap():
 
     total_regs = 0
     reg_map = {}
-    frame = gdb.selected_frame()
 
     tree = ET.fromstring(xml)
     for f in tree.findall("feature"):
@@ -61,12 +60,8 @@ def fetch_xml_regmap():
         for r in regs:
             name = r.attrib["name"]
             regnum = int(r.attrib["regnum"])
-            try:
-                value = frame.read_register(name)
-            except ValueError:
-                report(False, f"failed to read reg: {name}")
 
-            entry = { "name": name, "initial": value, "regnum": regnum }
+            entry = { "name": name, "regnum": regnum }
 
             if name in reg_map:
                 report(False, f"duplicate register {entry} vs {reg_map[name]}")
@@ -80,6 +75,15 @@ def fetch_xml_regmap():
 
     return reg_map
 
+def get_register_by_regnum(reg_map, regnum):
+    """
+    Helper to find a register from the map via its XML regnum
+    """
+    for regname, entry in reg_map.items():
+        if entry['regnum'] == regnum:
+            return entry
+    return None
+
 def crosscheck_remote_xml(reg_map):
     """
     Cross-check the list of remote-registers with the XML info.
@@ -90,6 +94,7 @@ def crosscheck_remote_xml(reg_map):
 
     total_regs = len(reg_map.keys())
     total_r_regs = 0
+    total_r_elided_regs = 0
 
     for r in r_regs:
         fields = r.split()
@@ -100,6 +105,15 @@ def crosscheck_remote_xml(reg_map):
             r_name = fields[0]
             r_regnum = int(fields[6])
 
+            # Some registers are "hidden" so don't have a name
+            # although they still should have a register number
+            if r_name == "''":
+                total_r_elided_regs += 1
+                x_reg = get_register_by_regnum(reg_map, r_regnum)
+                if x_reg is not None:
+                    x_reg["hidden"] = True
+                continue
+
             # check in the XML
             try:
                 x_reg = reg_map[r_name]
@@ -117,14 +131,39 @@ def crosscheck_remote_xml(reg_map):
     # Just print a mismatch in totals as gdb will filter out 64 bit
     # registers on a 32 bit machine. Also print what is missing to
     # help with debug.
-    if total_regs != total_r_regs:
-        print(f"xml-tdesc has ({total_regs}) registers")
-        print(f"remote-registers has ({total_r_regs}) registers")
+    print(f"xml-tdesc has {total_regs} registers")
+    print(f"remote-registers has {total_r_regs} registers")
+    print(f"of which {total_r_elided_regs} are hidden")
+
+    for x_key in reg_map.keys():
+        x_reg = reg_map[x_key]
+        if "hidden" in x_reg:
+            print(f"{x_reg} elided by gdb")
+        elif "seen" not in x_reg:
+            print(f"{x_reg} wasn't seen in remote-registers")
+
+def initial_register_read(reg_map):
+    """
+    Do an initial read of all registers that we know gdb cares about
+    (so ignore the elided ones).
+    """
+    frame = gdb.selected_frame()
+
+    for e in reg_map.values():
+        name = e["name"]
+        regnum = e["regnum"]
+
+        try:
+            if "hidden" in e:
+                value = frame.read_register(regnum)
+                e["initial"] = value
+            elif "seen" in e:
+                value = frame.read_register(name)
+                e["initial"] = value
+
+        except ValueError:
+                report(False, f"failed to read reg: {name}")
 
-        for x_key in reg_map.keys():
-            x_reg = reg_map[x_key]
-            if "seen" not in x_reg:
-                print(f"{x_reg} wasn't seen in remote-registers")
 
 def complete_and_diff(reg_map):
     """
@@ -144,18 +183,19 @@ def complete_and_diff(reg_map):
     changed = 0
 
     for e in reg_map.values():
-        name = e["name"]
-        old_val = e["initial"]
+        if "initial" in e and "hidden" not in e:
+            name = e["name"]
+            old_val = e["initial"]
 
-        try:
-            new_val = frame.read_register(name)
-        except:
-            report(False, f"failed to read {name} at end of run")
-            continue
+            try:
+                new_val = frame.read_register(name)
+            except ValueError:
+                report(False, f"failed to read {name} at end of run")
+                continue
 
-        if new_val != old_val:
-            print(f"{name} changes from {old_val} to {new_val}")
-            changed += 1
+            if new_val != old_val:
+                print(f"{name} changes from {old_val} to {new_val}")
+                changed += 1
 
     # as long as something changed we can be confident its working
     report(changed > 0, f"{changed} registers were changed")
@@ -168,6 +208,7 @@ def run_test():
 
     if reg_map is not None:
         crosscheck_remote_xml(reg_map)
+        initial_register_read(reg_map)
         complete_and_diff(reg_map)
 
 
diff --git a/tests/tcg/ppc64/Makefile.target b/tests/tcg/ppc64/Makefile.target
index 1d08076756..5721c159f2 100644
--- a/tests/tcg/ppc64/Makefile.target
+++ b/tests/tcg/ppc64/Makefile.target
@@ -38,11 +38,4 @@ PPC64_TESTS += signal_save_restore_xer
 PPC64_TESTS += xxspltw
 PPC64_TESTS += test-aes
 
-ifneq ($(GDB),)
-# Skip for now until vsx registers sorted out
-run-gdbstub-registers:
-	$(call skip-test, $<, "BROKEN reading VSX registers")
-endif
-
-
 TESTS += $(PPC64_TESTS)
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index 46544fecd4..0e670f3f8b 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -103,10 +103,6 @@ run-gdbstub-svc: hello-s390x-asm
 		--bin $< --test $(S390X_SRC)/gdbstub/test-svc.py, \
 	single-stepping svc)
 
-# Skip for now until vx registers sorted out
-run-gdbstub-registers:
-	$(call skip-test, $<, "BROKEN reading VX registers")
-
 EXTRA_RUNS += run-gdbstub-signals-s390x run-gdbstub-svc
 endif
 
-- 
2.39.2
