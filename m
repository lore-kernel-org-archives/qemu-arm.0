Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([185.126.160.109])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf40a603b7sm785796566b.170.2025.03.04.14.34.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 14:34:49 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id A13C062604;
	Tue,  4 Mar 2025 22:24:42 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Li-Wen Hsu <lwhsu@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Warner Losh <imp@bsdimp.com>,
	Brian Cain <brian.cain@oss.qualcomm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Kyle Evans <kevans@freebsd.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Ed Maste <emaste@freebsd.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 32/32] meson.build: default to -gsplit-dwarf for debug info
Date: Tue,  4 Mar 2025 22:24:39 +0000
Message-Id: <20250304222439.2035603-33-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304222439.2035603-1-alex.bennee@linaro.org>
References: <20250304222439.2035603-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: RGNIXj9oQbun

This option is supported by both gcc (since 4.7) and clang (since
7.0). Not only does this make the linkers job easier by reducing the
amount of ELF it needs to parse it also reduces the total build size
quite considerably. In my case a default build went from 5.8G to 3.9G.

The --disable-split-debug option allows distros to keep all the info
together for ease of packaging.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v1
  - add --disable/enable-split-debug
  - move to option_cflags
---
 meson.build                   | 7 +++++--
 meson_options.txt             | 2 ++
 scripts/meson-buildoptions.sh | 2 ++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/meson.build b/meson.build
index 8d0abe7f12..36ffe1b730 100644
--- a/meson.build
+++ b/meson.build
@@ -363,7 +363,7 @@ endforeach
 
 qemu_common_flags = [
   '-D_GNU_SOURCE', '-D_FILE_OFFSET_BITS=64', '-D_LARGEFILE_SOURCE',
-  '-fno-strict-aliasing', '-fno-common', '-fwrapv' ]
+  '-fno-strict-aliasing', '-fno-common', '-fwrapv']
 qemu_cflags = []
 qemu_ldflags = []
 
@@ -4589,7 +4589,10 @@ if have_rust
   summary_info += {'bindgen':         bindgen.full_path()}
   summary_info += {'bindgen version': bindgen.version()}
 endif
-option_cflags = (get_option('debug') ? ['-g'] : [])
+option_cflags = []
+if get_option('debug')
+  option_cflags += [get_option('split_debug') ? ['-gsplit-dwarf'] : ['-g']]
+endif
 if get_option('optimization') != 'plain'
   option_cflags += ['-O' + get_option('optimization')]
 endif
diff --git a/meson_options.txt b/meson_options.txt
index 59d973bca0..3432123fee 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -362,6 +362,8 @@ option('debug_mutex', type: 'boolean', value: false,
        description: 'mutex debugging support')
 option('debug_stack_usage', type: 'boolean', value: false,
        description: 'measure coroutine stack usage')
+option('split_debug', type: 'boolean', value: true,
+       description: 'split debug info from object files')
 option('qom_cast_debug', type: 'boolean', value: true,
        description: 'cast debugging support')
 option('slirp_smbd', type : 'feature', value : 'auto',
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 3e8e00852b..aca6e68830 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -504,6 +504,8 @@ _meson_option_parse() {
     --disable-strict-rust-lints) printf "%s" -Dstrict_rust_lints=false ;;
     --enable-strip) printf "%s" -Dstrip=true ;;
     --disable-strip) printf "%s" -Dstrip=false ;;
+    --enable-split-debug) printf "%s" -Dsplit_debug=true ;;
+    --disable-split-debug) printf "%s" -Dsplit_debug=false ;;
     --sysconfdir=*) quote_sh "-Dsysconfdir=$2" ;;
     --enable-tcg) printf "%s" -Dtcg=enabled ;;
     --disable-tcg) printf "%s" -Dtcg=disabled ;;
-- 
2.39.5
