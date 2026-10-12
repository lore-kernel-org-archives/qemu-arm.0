Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABEDCA9EDD
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Oct 2026 17:07:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGJSU-0005wG-Nn; Mon, 12 Oct 2026 13:05:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRb-0005HW-89
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:17 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xGJRV-00078d-Dq
 for qemu-arm@nongnu.org; Mon, 12 Oct 2026 13:04:10 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-48c02782159so1295760f8f.0
 for <qemu-arm@nongnu.org>; Mon, 12 Oct 2026 10:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791824637; x=1792429437; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=qy1tlLESlhJ5RqtcEQBiQZ50IQYxyS9D/SEK6VmLXcQ=;
 b=BdrzG9nTESu0at9evq2sdq2LwlTUTut7ku/Oe27nDcM/Ux0kUBi+BcwLj6RJZRLXqe
 62N6/Ssa1dqT8bmairV61sspN0Jq5yhHX7br4nehojzWPFAvIIhPUBlny5r7BO5rUrdJ
 wvZT9XlgttFmd9wglGn8k5413UBMEZlyRJ+Gb22DpUJa2O1DQr0sRNviKLZv2R/EBxUt
 LT/nevIOqWCBuKXo/s8cn0lSGmBqKI+8YmNYsV5NzfK8vnQSr3f1O8Q5Jv/2ksnKZ6cO
 TU6YqC1XzqHcRs0gaGJOMU9dUgiNuPQE3D4jpAgcBxUAQLZLpcIh31jHnvOiwZu2kxKU
 T79A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791824637; x=1792429437;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=qy1tlLESlhJ5RqtcEQBiQZ50IQYxyS9D/SEK6VmLXcQ=;
 b=fW5mcqHJ9qvyG3Ir54stYxBAggTTZGZi+FQEww+Wr/Y6/L2+VSsVaSOREtioOBQHoc
 odAGTB6deiJKFXx9l/Lra4Y1Lbw6A2004crmwCWlYlBH/WF8SEdkCmVkVPOigkjlXj5r
 XpuFT+eNsa+un66RW+fPGIVAasC3ORFMYqFM362zmN3KHPY71SBJcY6yhb8Tixpi3xhF
 JebV3eFr1rvGN8Iy38n3xG+o9BJwhTEL0oHEY5rnPQFfqdMXXECNHL7Ih88hcPmOa4A0
 6CAcftCf/YJfeoDKDVRy7jxZDAdOQN+CIF2VUPfnyR9zdiZ9AND2za5pKg/DV9lCR63W
 Rs7Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBwDvpg3lq9Rk/k51WnTb3BJlRqXnAT1DsF78Se+oT3JvMLMY7Hg+zJnhl2rxlQq3OeDC3Tj0ZOLhA==@nongnu.org
X-Gm-Message-State: AFq9FYLdwcGKCXzPUeYApao1hASoIALYrSIxXonJsapvsFf00ZQl30tP
 2fJcOHu2QEwPH/Zuu0+3PzqbYATXLDOmpU7kk1qVA1Ou1946HzB761hq5dlQcx7OWUk=
X-Gm-Gg: AYBFou1gw8yQqFllhpN66fMelqX72Pjz4YAX+Y61U2Igde0WvzeXZMCzMHX/QYWeTbb
 4XBzS+GQNx5O+0EOPv7eSXvs/2Xn7toMf2XMm7IqsFqZgwiOcxI7mHktt5pGrA9rqN593vWOPAe
 r8IsJEGiz7HGhd87bbkaP+m4tWfT666DWGBMCpki8fyDFz2/xob3y16MFHN6oNX4hqiNash82QO
 knPXqRrYsN1OHxS/nioPrkxbL8krwMAPLOdp02G/7i2ogaZ4IrGlFacEDJ7BhhgcYcLkFaZC+by
 DpCEDA7liC+ad5Iw+8y2IumO7S8LXLgVBFOvVyHLkzMhksV3cK/4IoqAe5KQKIfHlxZs7WFRljH
 3bMGmS0kVlIS3DiAmjlR0GRUHWs2NetAzx87jpGpRcf1KQ5pGGpopX6KSlHwNZurj8iyru13W/i
 nD3CQkJ7S8mu0pkxl3jvcbBLorGNKu1TfauajXp4yKinpT/Gv/btp61jAbltNMlfJmtxwWFg==
X-Received: by 2002:a5d:5b87:0:b0:48c:5c2e:434d with SMTP id
 ffacd0b85a97d-48dbaae84eemr13733730f8f.21.1791824636997; 
 Mon, 12 Oct 2026 10:03:56 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0ab4764sm387984f8f.25.2026.10.12.10.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 10:03:50 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id E65FB5FD1F;
 Mon, 12 Oct 2026 18:03:31 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Kyle Evans <kevans@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Brad Smith <brad@comstyle.com>, Ani Sinha <anisinha@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Thomas Huth <th.huth+qemu@posteo.eu>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Warner Losh <imp@bsdimp.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, Peter Xu <peterx@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Song Gao <gaosong@loongson.cn>,
 qemu-s390x@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 09/16] tests/functional: teach tuxrun about launching gdb
 tests
Date: Mon, 12 Oct 2026 18:03:23 +0100
Message-ID: <20261012170330.1144446-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012170330.1144446-1-alex.bennee@linaro.org>
References: <20261012170330.1144446-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This resurrects the hand run test script from d84842be6c5 (tests:
remove test-gdbstub.py) and modernises it to use the shared test
infrastructure for run-test.

We then tweak the common tuxrun code to over an alternative "launch
via gdbstub" helper which reuses the existing code but:

  - needs a vmlinux with symbols
  - extend qargs with stuff normally added by vm.launch
  - passes kargs directly
  - runs with the gdb run-test script
  - log the run-test output to the console log

Message-ID: <20260930164649.433573-13-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v2
  - add self.vm._machine to qargs
  - drop leading spaces in print () calls
  - add register read tests
  - use gdb.Breakpoint for hwbreak as for swbreak
  - drop flaky symbol evaluation, verify hit_count instead
  - explicit gdb.BP_BREAKPOINT for CatchBreakpoint
---
 .../functional/gdb-scripts/kernel_gdb_test.py | 174 ++++++++++++++++++
 tests/functional/qemu_test/tuxruntest.py      |  96 +++++++++-
 2 files changed, 261 insertions(+), 9 deletions(-)
 create mode 100644 tests/functional/gdb-scripts/kernel_gdb_test.py

diff --git a/tests/functional/gdb-scripts/kernel_gdb_test.py b/tests/functional/gdb-scripts/kernel_gdb_test.py
new file mode 100644
index 00000000000..2d62fe01f10
--- /dev/null
+++ b/tests/functional/gdb-scripts/kernel_gdb_test.py
@@ -0,0 +1,174 @@
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# Generic Kernel GDB script to verify functionality:
+#  - Single-stepping
+#  - Hardware breakpoints
+#  - Software breakpoints
+#  - Watchpoints
+#
+# It relies on fairly common kernel points to break at and symbols for
+# the kernel. Address space randomisation (kaslr) needs to be disabled.
+#
+# Copyright (c) 2026 Linaro Limited
+#
+# Author:
+#  Alex Bennée <alex.bennee@linaro.org>
+#
+# This is launched by the tuxrun functional tests via tests/guest-debug/run-test.py
+
+import gdb
+from test_gdbstub import main, report
+
+failcount = 0
+
+def parse_registers():
+    """Parse 'info registers' into a name -> value dictionary."""
+    regs = {}
+    for line in gdb.execute("info registers", to_string=True).splitlines():
+        parts = line.split()
+        if len(parts) >= 2:
+            regs[parts[0]] = parts[1]
+    return regs
+
+
+def check_step():
+    "Step an instruction, check it moved."
+    start_pc = gdb.parse_and_eval('$pc')
+    gdb.execute("si")
+    end_pc = gdb.parse_and_eval('$pc')
+
+    return not (start_pc == end_pc)
+
+
+def check_reg_updates(regs_start):
+    regs_end = parse_registers()
+
+    changed = [k for k in regs_start
+               if k in regs_end and regs_start[k] != regs_end[k]]
+
+    report(len(changed) > 0, f"{len(changed)} registers changed.")
+
+
+def check_break(sym_name):
+    "Setup breakpoint, continue and check we stopped."
+    bp = gdb.Breakpoint(sym_name)
+    gdb.execute("c")
+    res = bp.hit_count == 1
+    bp.delete()
+
+    return res
+
+
+# We need to do hbreak manually as the python interface doesn't export it
+def check_hbreak(sym_name):
+    "Setup hardware breakpoint, continue and check we stopped."
+    bp = gdb.Breakpoint(sym_name, type = gdb.BP_HARDWARE_BREAKPOINT)
+    gdb.execute("c")
+    res = bp.hit_count == 1
+    bp.delete()
+
+    return res
+
+
+class WatchPoint(gdb.Breakpoint):
+
+    def get_wpstr(self, sym_name):
+        "Setup sym and wp_str for given symbol."
+        self.sym, ok = gdb.lookup_symbol(sym_name)
+        wp_addr = gdb.parse_and_eval(sym_name).address
+        self.wp_str = '*(%(type)s)(&%(address)s)' % dict(
+            type = wp_addr.type, address = sym_name)
+
+        return(self.wp_str)
+
+    def __init__(self, sym_name, type):
+        wp_str = self.get_wpstr(sym_name)
+        super(WatchPoint, self).__init__(wp_str, gdb.BP_WATCHPOINT, type)
+
+    def stop(self):
+        end_pc = gdb.parse_and_eval('$pc')
+        print("HIT WP @ %s" % (end_pc))
+        return True
+
+
+def do_one_watch(sym, wtype, text):
+
+    wp = WatchPoint(sym, wtype)
+    gdb.execute("c")
+    report_str = "%s for %s (%s)" % (text, sym, wp.sym.value())
+
+    if wp.hit_count > 0:
+        report(True, report_str)
+        wp.delete()
+    else:
+        report(False, report_str)
+
+
+def check_watches(sym_name):
+    "Watch a symbol for any access."
+
+    # Should hit for any read
+    do_one_watch(sym_name, gdb.WP_ACCESS, "awatch")
+
+    # Again should hit for reads
+    do_one_watch(sym_name, gdb.WP_READ, "rwatch")
+
+    # Finally when it is written
+    do_one_watch(sym_name, gdb.WP_WRITE, "watch")
+
+
+class CatchBreakpoint(gdb.Breakpoint):
+    def __init__(self, sym_name):
+        super(CatchBreakpoint, self).__init__(sym_name, type = gdb.BP_BREAKPOINT)
+        self.sym, ok = gdb.lookup_symbol(sym_name)
+
+    def stop(self):
+        end_pc = gdb.parse_and_eval('$pc')
+        print("CB: %s == %s" % (end_pc, self.sym.value()))
+        if end_pc == self.sym.value():
+            report(False, "Hit final catchpoint")
+
+
+def run_test():
+    "Run through the tests one by one"
+
+    # get the initial register state
+    regs_start = parse_registers()
+
+    print("Checking we can step the first few instructions")
+    step_ok = 0
+    for i in range(3):
+        if check_step():
+            step_ok += 1
+
+    report(step_ok == 3, "single step in boot code")
+
+    # check some registers changed
+    print("Checking register access works")
+    check_reg_updates(regs_start)
+
+    print("Checking HW breakpoint works")
+    break_ok = check_hbreak("kernel_init")
+    report(break_ok, "hbreak @ kernel_init")
+
+    # Can't set this up until we are in the kernel proper
+    # if we make it to run_init_process we've over-run and
+    # one of the tests failed
+
+    print("Setup catch-all for run_init_process")
+    cbp = CatchBreakpoint("run_init_process")
+
+    # We should see wait_for_completion called right at the start of
+    # kernel_init
+    print("Checking Normal breakpoint works")
+    break_ok = check_break("wait_for_completion")
+    report(break_ok, "break @ wait_for_completion")
+
+    print("Checking watchpoint works")
+    check_watches("system_state")
+
+    # check we didn't hit the end
+    report(cbp.hit_count == 0, "CatchBreakpoint not hit")
+
+
+main(run_test)
diff --git a/tests/functional/qemu_test/tuxruntest.py b/tests/functional/qemu_test/tuxruntest.py
index ca1589fea37..8e940fd7738 100644
--- a/tests/functional/qemu_test/tuxruntest.py
+++ b/tests/functional/qemu_test/tuxruntest.py
@@ -9,7 +9,9 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
+import logging
 import os
+import subprocess
 
 from qemu_test import QemuSystemTest
 from qemu_test import exec_command_and_wait_for_pattern
@@ -18,7 +20,7 @@
 
 class TuxRunBaselineTest(QemuSystemTest):
 
-    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0'
+    KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 nokaslr'
     # Tests are ~10-40s, allow for --debug/--enable-gcov overhead
     timeout = 100
 
@@ -55,17 +57,20 @@ def wait_for_console_pattern(self, success_message, vm=None):
                                  failure_message='Kernel panic - not syncing',
                                  vm=vm)
 
-    def fetch_tuxrun_assets(self, kernel_asset, rootfs_asset, dtb_asset=None):
+    def fetch_tuxrun_assets(self, kernel_asset, rootfs_asset,
+                            dtb_asset=None, vmlinux_asset=None):
         """
         Fetch the TuxBoot assets.
         """
         kernel_image =  kernel_asset.fetch()
         disk_image = self.uncompress(rootfs_asset)
         dtb = dtb_asset.fetch() if dtb_asset is not None else None
+        vmlinux = self.uncompress(vmlinux_asset) if vmlinux_asset is not None else None
 
-        return (kernel_image, disk_image, dtb)
+        return (kernel_image, disk_image, dtb, vmlinux)
 
-    def prepare_run(self, accel, kernel, disk, drive, dtb=None, console_index=0):
+    def prepare_run(self, accel, kernel, disk, drive,
+                    dtb=None, console_index=0, append = True):
         """
         Setup to run and add the common parameters to the system
         """
@@ -83,9 +88,15 @@ def prepare_run(self, accel, kernel, disk, drive, dtb=None, console_index=0):
         if accel:
             self.vm.add_args('-accel', accel)
 
-        self.vm.add_args('-kernel', kernel,
-                         '-append', self.kcmd_line,
-                         '-blockdev', blockdev)
+        if kernel:
+            self.vm.add_args('-kernel', kernel)
+
+        # When using the gdb run script we might not want to include
+        # the kcmd line directly in the QEMU args.
+        if append:
+            self.vm.add_args('-append', self.kcmd_line)
+
+        self.vm.add_args('-blockdev', blockdev)
 
         # Sometimes we need extra devices attached
         if self.extradev:
@@ -132,10 +143,77 @@ def common_tuxrun(self,
         special with the command line we can process most things using
         the tag metadata.
         """
-        (kernel, disk, dtb) = self.fetch_tuxrun_assets(kernel_asset, rootfs_asset,
-                                                       dtb_asset)
+        (kernel, disk, dtb, _) = self.fetch_tuxrun_assets(kernel_asset,
+                                                          rootfs_asset,
+                                                          dtb_asset)
 
         self.prepare_run(accel, kernel, disk, drive, dtb, console_index)
         self.vm.launch()
         self.run_tuxtest_tests(haltmsg)
         os.remove(disk)
+
+    def common_tuxrun_gdb(self,
+                          kernel_asset,
+                          vmlinux_asset,
+                          rootfs_asset,
+                          accel=None,
+                          dtb_asset=None,
+                          drive="virtio-blk-device",
+                          haltmsg="reboot: System halted",
+                          console_index=0):
+        """
+        Common path for LKFT tests under gdb. Unlike the common_tuxrun
+        function we need to launch with the gdb test script and deal
+        with munging the arguments for that especially.
+        """
+        (kernel, disk, dtb, vmlinux) = self.fetch_tuxrun_assets(kernel_asset,
+                                                                rootfs_asset,
+                                                                dtb_asset,
+                                                                vmlinux_asset)
+
+        gdb_path = os.getenv("QEMU_TEST_GDB")
+        run_script = self.data_file('..', 'guest-debug','run-test.py')
+        test_script = self.data_file('gdb-scripts', 'kernel_gdb_test.py')
+
+        # Instead of launching QEMU via the functional test machinery
+        # we need to launch it with the gdb run script. We utilise the
+        # existing prepare_run machinery to build the command line but
+        # we pass the kernel args separately to avoid horrible string
+        # escaping.
+
+        self.prepare_run(accel, kernel, disk, drive, dtb,
+                         console_index, append = False)
+
+        # the functional test machinery adds more stuff for handling
+        # console redirection which we need to do manually.
+
+        qargs = self.vm.args
+        qargs.extend(["-display", "none", "-serial", "stdio"])
+
+        # and the machine type
+        if self.vm._machine is not None:
+            qargs.extend(["-machine", self.vm._machine])
+
+        cmd = [
+            str(run_script),
+            "--qemu", self.qemu_bin,
+            "--qargs", " ".join(qargs),
+            "--kargs", self.kcmd_line,
+            "--binary", "",
+            "--symbols", str(vmlinux),
+            "--test", str(test_script),
+            "--gdb", gdb_path,
+        ]
+
+        self.log.info(f"run-test: {' '.join(cmd)}")
+
+        res = subprocess.run(cmd, text=True,
+                             stdout=subprocess.PIPE,
+                             stderr=subprocess.STDOUT)
+
+        if res.stdout:
+            console_logger = logging.getLogger('console')
+            console_logger.info(res.stdout)
+
+        self.assertEqual(res.returncode, 0,
+                         f"run-test.py failed ({res.returncode}):\n")
-- 
2.47.3


