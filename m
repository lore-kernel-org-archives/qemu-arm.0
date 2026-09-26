Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1945C98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:10:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMVg-0000yH-Jr; Sat, 26 Sep 2026 03:07:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMRn-0005LZ-QE
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:03:51 -0400
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMRl-0000fU-Hl
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:03:47 -0400
Received: by mail-dy2-x0e.google.com with SMTP id
 5a478bee46e88-341fe27b718so1360277eec.0
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406223; x=1791011023; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=riWdPmPaF6yCA+QpUvXi1H8TQEU17/hMGN1s+wRfSqw=;
 b=VllRqe6fi3Y7NyYAB2m7EgHLkeQJrshCMVrg2ipKvOSNP71EaCJ2v682MwU9Twtcho
 QqAxN1a+T8s8u1hc0NeqqCkgh1fyqYUJcSjAlt3lILOHbqlYldclrC/AB1QDEE2LkGOY
 TeEptIdz7CKCLF4gaW2ontOGH/lCDBjkedbz2S2ilsv6K9uAcoSdfPBZzTkDm2Za1hju
 Zoc5ytKnHAEIAImzc6HXX/dOa0+PYkcCZXE+lRsdd5OR1TXEs3NBAG1x+4155CDN68BQ
 SpwrSgcX53RFNC11bCq+N88doAAn8LNBZj13C6HF/JlQ449OAqKms+P1i/itu9TZ48XV
 ufuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406223; x=1791011023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=riWdPmPaF6yCA+QpUvXi1H8TQEU17/hMGN1s+wRfSqw=;
 b=u2HPkJPrqI647TUV5ZgrXRlvrYfXuiFgXEaQVeQBURb5GaI6Enmta1KWl4scQ5XxOZ
 l46EO9W/qDGOyJkAAQuHYDgPKPifEnS33UJngwQdgIQTDt0jZAvonysP9be7c7WAPT5O
 phq8xaHWsNj2Fe4xV/DCBv7HsV+5366HcnpgsC4EkDPPtIem/yikBtodg5snbN0OJSaX
 H78D5kZzy9BrxR/8xrOSe2bvF/beA9omJNpk7e74rFq9m6YGp6aq9+rWo+UMQ102rwW+
 AGGHRA7rvuTG95IK9n1ZSrP6uDDpW2WAWxe/nMTVqIgLX+qt0c1iG3PKoHOZ2ykevy1s
 BvoQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBy/SDGXRBVc7iVNouIOgKH1+Gq0mu5OJD7kAPxbdoLGy3SVi/IU29ZpLhdMClnLsaQufsYijyf8Eg==@nongnu.org
X-Gm-Message-State: AFuF++nF1R/aQIrd0mRnJ0f4sTnhzhJ9dzNnWen/khEY/Hd8U7MGYMf1
 yxSbq+xI0ZG6J5yuMQBkom5I548KgIsmZkakG/HTkRr2EWIDUEE8rH3m
X-Gm-Gg: AYBFou3MmbfuDD+zYYbrMrpW0tFMm4GIAn59rTpTIz5LreQq2aKFkLQK8tB3wGb/yz6
 4zPh6NqTdjzWoIsjGIVMejbPLIznpu8mLc3T5Lzl+Joa35ouft/qc7nyGuMoavdZYu4/4xZKtTV
 0rMd0XeSetf7cxHjHJJB1BHdKZKvejEeYpaPcE1hB1y0JtAWMAKZeUEDp0iEGLzXwg9CyQsqCgh
 477vW2AZ6Sits12uRW+/TFgx61yiTBKdtEkRtrwOmrZrS0hT1Zgdz7BvbqEIcJUyoTzCOdpTi+C
 6bnkWpDWTdgc4kEtwjJafX5TT/mA0Fasr83IxXVOHl3tUSfa/bM/fDlUg0PaTH3s2RhczykqKti
 JCxLHL+CdSx5Mc0CbQxUzKeFIabyyS3ipjP9LDpzKp9Y992met71if+G73mb9r0mb2m8+H9Ij5u
 ayKBtoY/YGIEfqq3UHVneVr0L3qb+XwvyJFYWZPA6xpc3lP+7SMJ+09QjlGk7EVgoSwgAQidgeQ
 N4Fq+XfaZhegi5mabx7F2G5RfFCFLI=
X-Received: by 2002:a05:7301:4d0b:b0:341:d191:b838 with SMTP id
 5a478bee46e88-34272562bc0mr2378558eec.31.1790406222673; 
 Sat, 26 Sep 2026 00:03:42 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:03:41 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 40/55] meson: link shared objects into qemu-system
Date: Sat, 26 Sep 2026 15:00:39 +0800
Message-ID: <20260926070057.1234-41-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Extract common_ss, system_ss, and family-common objects into one
qemu-system binary. Only arm, aarch64, microblaze-softmmu are
listed; a new target must have arch_srcs equal to target_info_def
only (target-info-def.c). Config headers stay in arch_genh.

- Union non-TARGET_* keys with y taking precedence
- Reject leftover arch_srcs on participating targets
- Reject TARGET_* conditions on common_ss and system_ss
- Link SDL, install the binary, and apply Darwin entitlements

Adding a target that still has per-target sources fails meson, for
example:

  combined qemu-system leftover for :
  expected:
  target-info-def.c
  arch_srcs:
  target/microblaze/mmu.c
  target/microblaze/machine.c
  target-info-def.c

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build | 151 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 147 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index d5639a2d676..7ab5c7971a8 100644
--- a/meson.build
+++ b/meson.build
@@ -4288,15 +4288,30 @@ if host_os == 'darwin'
 endif
 
 traceable = []
+single_binary_target_info_objects = []
+single_binary_config = {}
+single_binary_bases = {}
+single_binary_deps = []
+single_binary_crates = []
+single_binary_available = false
+
+single_binary_supported_targets = [
+  'aarch64-softmmu',
+  'arm-softmmu',
+  'microblaze-softmmu',
+]
+
 emulators = {}
-target_info_def = files('target-info-def.c')
+target_info_def_src = 'target-info-def.c'
+target_info_def = files(target_info_def_src)
 target_info_def_objects = {}
 foreach target : target_dirs
   config_target = config_target_mak[target]
   target_name = config_target['TARGET_NAME']
   target_base_arch = config_target['TARGET_BASE_ARCH']
-  arch_srcs = [config_target_h[target]]
+  arch_srcs = []
   arch_deps = []
+  arch_genh = [config_target_h[target]]
   c_args = ['-DCOMPILING_PER_TARGET',
             '-DCONFIG_TARGET="@0@-config-target.h"'.format(target),
   ]
@@ -4322,7 +4337,7 @@ foreach target : target_dirs
     endif
 
     c_args += ['-DCONFIG_DEVICES="@0@-config-devices.h"'.format(target)]
-    arch_srcs += config_devices_h[target]
+    arch_genh += config_devices_h[target]
     link_args += enable_modules ? ['@block.syms', '@qemu.syms'] : []
   else
     abi = config_target['TARGET_ABI_DIR']
@@ -4433,7 +4448,7 @@ foreach target : target_dirs
   endforeach
 
   lib = static_library('qemu-' + target,
-                 sources: arch_srcs + genh,
+                 sources: arch_srcs + arch_genh + genh,
                  dependencies: lib_deps,
                  objects: objects,
                  include_directories: target_inc,
@@ -4443,6 +4458,45 @@ foreach target : target_dirs
   target_info_def_objects += {target: lib.extract_objects(target_info_def)}
 
   if target.endswith('-softmmu')
+    if target in single_binary_supported_targets
+      arch_src_rels = []
+      foreach src : arch_srcs
+        arch_src_rels += fs.relative_to(src, meson.project_source_root())
+      endforeach
+      if arch_src_rels != [target_info_def_src]
+        error('combined qemu-system leftover for ' + target + ':\n'
+              + 'expected:\n' + target_info_def_src + '\n'
+              + 'arch_srcs:\n' + '\n'.join(arch_src_rels))
+      endif
+      single_target_config = {}
+      foreach k, v : config_target
+        if not k.startswith('TARGET_')
+          single_target_config += {k: v}
+          if k not in single_binary_config or v == 'y'
+            single_binary_config += {k: v}
+          endif
+        endif
+      endforeach
+      target_common_no_target = common_ss.apply(
+        single_target_config, strict: false)
+      if (target_common.sources() != target_common_no_target.sources() or
+          target_common.dependencies() != target_common_no_target.dependencies())
+        error('common_ss must not use TARGET_* conditions')
+      endif
+      target_system = system_ss.apply(config_target, strict: false)
+      target_system_no_target = system_ss.apply(
+        single_target_config, strict: false)
+      if (target_system.sources() != target_system_no_target.sources() or
+          target_system.dependencies() != target_system_no_target.dependencies())
+        error('system_ss must not use TARGET_* conditions')
+      endif
+      single_binary_target_info_objects += lib.extract_objects(target_info_def)
+      single_binary_bases += {target_base_arch: true}
+      single_binary_deps += arch_deps
+      single_binary_deps += target_stubs
+      single_binary_crates += main_rs
+      single_binary_available = true
+    endif
     execs = [{
       'name': 'qemu-system-' + target_name,
       'win_subsystem': 'console',
@@ -4524,6 +4578,95 @@ foreach target : target_dirs
   endforeach
 endforeach
 
+# Combined qemu-system: one apply + extract, same sources as
+# qemu-system-$target.
+#
+# common_ss / system_ss use single_binary_config, the non-TARGET_* union where
+# 'y' takes precedence.
+# Do not use when: 'TARGET_*' on these sets; those keys are dropped and the file
+# would vanish from qemu-system.
+#
+# Family common/system libs use config_base_arch_mak[base] (every target of that
+# TARGET_BASE_ARCH, including user-mode if enabled).
+#
+# Each qemu-* lib contributes target-info-def.c. Participating targets must have
+# arch_srcs equal to target_info_def only.
+if single_binary_available
+  single_binary_objects = []
+  target_common = common_ss.apply(single_binary_config, strict: false)
+  single_binary_objects += common_all.extract_objects(target_common.sources())
+  single_binary_deps += target_common.dependencies()
+
+  target_system = system_ss.apply(single_binary_config, strict: false)
+  single_binary_objects += libsystem.extract_objects(target_system.sources())
+  single_binary_deps += target_system.dependencies()
+
+  foreach base, _ : single_binary_bases
+    config_base = config_base_arch_mak[base]
+    if base in target_common_arch_libs
+      src = target_common_arch[base].apply(config_base, strict: false)
+      single_binary_objects += target_common_arch_libs[base].extract_objects(
+        src.sources())
+      single_binary_deps += src.dependencies()
+    endif
+    if base in target_common_system_arch_libs
+      src = target_common_system_arch[base].apply(config_base, strict: false)
+      single_binary_objects += target_common_system_arch_libs[base].extract_objects(
+        src.sources())
+      single_binary_deps += src.dependencies()
+    endif
+  endforeach
+  single_binary_objects += single_binary_target_info_objects
+
+  single_binary_link_args = emulator_link_args
+  single_binary_link_args += enable_modules ? ['@block.syms', '@qemu.syms'] : []
+  qemu_system_name = 'qemu-system'
+  if host_os == 'darwin'
+    qemu_system_name += '-unsigned'
+  endif
+  qemu_system = executable(qemu_system_name,
+                           sources: [single_binary_crates, files('system/main.c')],
+                           dependencies: single_binary_deps + [sdl],
+                           objects: single_binary_objects,
+                           link_depends: [block_syms, qemu_syms],
+                           link_args: single_binary_link_args,
+                           build_by_default: true,
+                           install: true)
+  if host_os == 'darwin'
+    icon = 'pc-bios/qemu.rsrc'
+    build_input = [qemu_system, files(icon)]
+    install_input = [
+      get_option('bindir') / qemu_system_name,
+      meson.current_source_dir() / icon
+    ]
+    if 'CONFIG_HVF' in single_binary_config
+      entitlements = 'accel/hvf/entitlements.plist'
+      build_input += files(entitlements)
+      install_input += meson.current_source_dir() / entitlements
+    endif
+    emulators += {'qemu-system': custom_target('qemu-system',
+                 input: build_input,
+                 output: 'qemu-system',
+                 build_by_default: true,
+                 command: [entitlement, '@OUTPUT@', '@INPUT@'])
+    }
+    meson.add_install_script(entitlement, '--install',
+                             get_option('bindir') / 'qemu-system',
+                             install_input)
+  else
+    emulators += {'qemu-system': qemu_system}
+  endif
+else
+  error_str = f'''qemu-system only support targets:
+@single_binary_supported_targets@
+
+use ./configure --target-list= to choose at least one of them'''
+  t = custom_target(command: ['sh', '-c', 'echo "' + error_str + '" && exit 1'],
+                    output: 'none',
+                    build_by_default: false)
+  alias_target('qemu-system', t)
+endif
+
 # Other build targets
 
 if get_option('plugins')
-- 
2.52.0.windows.1


