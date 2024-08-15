Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp819592njf;
        Thu, 15 Aug 2024 04:42:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXfLyoLKL9AL3uW5qAEDeT49o/CQeFMCdCHXl9jOV4tXamK5227RcYGkGD4sQ6gZP8mpew+Y7HBNawfVlAxHmeEiLI2qr/r
X-Received: by 2002:a17:907:3f26:b0:a80:f79c:bc44 with SMTP id a640c23a62f3a-a8366401588mr417914566b.0.1723722172269;
        Thu, 15 Aug 2024 04:42:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723722172; cv=none;
        d=google.com; s=arc-20160816;
        b=VhxzCgathyrvHL3/sYrgfigC9+9u8cM/QAfGAeVNRY+ghj+ASm6G+/Iw0g9ActJjet
         SO9P1omy7/D/aBnwfGdwH3ZtzHlbJ0YTg5OsBXF9PvEtG2Pe+vaCPFfDX5y4AA0agLSa
         +4I7b8hjS5K8JgYN3zwhufEZB+AvULXmd+nwSJfLrSKMwL9GxTsq03Ysd6DEVl0zUsaz
         wCW+hw8GJg+pOF3YXwJ5fITbrMY4wGCxJjSfwRFs/LfNZUz5SvegSbWVNjhtvlj0NsZl
         gztkOZMBOCLcWrGilseLT7uZCJKBVypg3MfplEZpsryZ77uZOkJtaFiaihO46SE5Y0MH
         Nogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=OBCPMa6ua93lVX7G+DgkIWdqT327/XeExtyzrU5tOUM=;
        fh=uawdLM31UymVSjP7f5EhyGx3TFvSt0tyFnVU53RCKUw=;
        b=RKRiaHAnvTHrgaKfoZa0hMQpy2XtF+VJizPvJ0biIECfcjzCnVvo0DmnVO79XBL5BA
         mQXozHzgWn3WtNU09nzRPq+o6Rhyqj0l2+hF7zY1cMTQtyYGuz9uXZTfmT8OMPcz89yD
         wCCgwqGpZNMUefTbX48CuTFM9kCyLLQSRehsiCo3bfzzdPIX2KqEwVYxB2xOREEi0GCQ
         80UZ95Vrrd4ljk0mY6MiNaomrrbuFl+ihhnarpCAWIEB5OlrVTO++P8JpHD6KT8geuV0
         QBD3YrJJ5IXPtuWrs4tD9tJ8iSc8o7JnVhovzx0R+Awskx5NmS5PtpobKNt2XNydLYKy
         9UAA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sYj/5EOs";
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a83838ce72csor31665066b.5.2024.08.15.04.42.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Aug 2024 04:42:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="sYj/5EOs";
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723722172; x=1724326972; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBCPMa6ua93lVX7G+DgkIWdqT327/XeExtyzrU5tOUM=;
        b=sYj/5EOscsun1dvRx6rQPOuE3S+Dj9RlOs2V36QwEqiXy4XGEkvE0b0opTKy9t+nZO
         p8US3/f3kYoxegk/XiK6uZ+cmjGcYEJCT6JyaQy7l6SGUTbphlHE3DVlFWSTs9zpfKbC
         yc++zRaxq/6LKeqWRLk99CGZgJDIBPQLR3Guco19auzcxclvcYO5tfZGFn3g2jjCFC/F
         2Jfj0o9fb5PdZvbxiBrNoC+6dFZygXqBvZCMXfnzeMfIwSH7siOsfK/uHvz2G0jFBj9t
         gLy+N9kK3aIGMA5b5CV1luwJtsFfq3FzAb3IP+oLHrJEQmZccpL6OFUmKShjlmYX3IV3
         yWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723722172; x=1724326972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OBCPMa6ua93lVX7G+DgkIWdqT327/XeExtyzrU5tOUM=;
        b=jYu4yv81AUH4NI/xo1W0xv3QxGGz5prAPPPWfua4fbbztLEy3MkmxEPeBAUd+jsOh1
         eTWUPvh/3G0wI/IcI3ZKJjMlzFmgE8PV26d/M5RmNzeCMkLUmhTSu+Tm1wFsfowRC+Vh
         3XBusuMO12MAFW7FlSQnBRg8Oz7B+3JNd9L6GnzT8IXSTDg38DLwTzeOkRiYL/K8rvxT
         +fTPAckjK/CCOgohgWTmasEoMPEuciRIVNDomn2D/F6ai0V4mDyVaQAEtz8uOC+Uh8vE
         U6ueLMHx6o/sQmtNA6tyv3IZI+1/H2Zkg7HMeLBdil0PHjGaLP1kSTME6CKRT3bZ+CJ7
         sZyg==
X-Forwarded-Encrypted: i=1; AJvYcCX29Gcf1cYAjgaoGtlARGc2XZ5cmC9ZMRo7YHzYiKd6AuGuk50k/mk1w+phLbPUE8c8efbncA8F7Ia9rQQeS/J7GgKhPAie
X-Gm-Message-State: AOJu0YxpcotwrDG0PtUSAX3eyNhabd8xAerrl9DLYtOgQGuySNFu20gv
	gfYtf+Iy1+vck+hF43ulRyrJ8PnAQv+vW836LBZgco4eskT9hJMkZ4dy/BUmhKoV/w==
X-Google-Smtp-Source: AGHT+IG68LcRAfERN/LX2ntqlMKHx5ZZ8hR96oV5Q/9GgCoULr1iToiE6PoGL0McWBbpn7rd2RQzaQ==
X-Received: by 2002:a17:907:7e97:b0:a77:c0f5:69cc with SMTP id a640c23a62f3a-a8367068777mr381238866b.61.1723722171627;
        Thu, 15 Aug 2024 04:42:51 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from [127.0.1.1] (adsl-26.37.6.162.tellas.gr. [37.6.162.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6bf1sm89547966b.21.2024.08.15.04.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 04:42:51 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 15 Aug 2024 14:42:20 +0300
Subject: [PATCH v7 3/7] configure, meson: detect Rust toolchain
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-rust-pl011-v7-3-975135e98831@linaro.org>
References: <20240815-rust-pl011-v7-0-975135e98831@linaro.org>
In-Reply-To: <20240815-rust-pl011-v7-0-975135e98831@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, 
 Beraldo Leal <bleal@redhat.com>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, 
 ARM TCG CPUs <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Junjie Mao <junjie.mao@intel.com>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, rowan.hart@intel.com, 
 Mads Ynddal <mads@ynddal.dk>, Markus Armbruster <armbru@redhat.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6784;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=byrrNLUPrf2hGX1UUEPx3AUY6uJHKDQhCEIJCILIBSw=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm12ZW11dXRZdXZQelAzdDhWZzdNa1hEVTN6OFFFCjVSd0hSdDM5cVdITnJyQWdT
 SEdKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnIzcHJnQUt
 DUkIzS2Nkd2YzNEowRDQzRC80L21DN0IrYlB2dlVZa2taRnFnbjdocHVRYnRuZExIQWh1WG5Ccg
 pleGdHRy9rUW1OYzlQTUNWS1EwZFJ3QUpZd3dsRWRlM1MxNExjU1g2elExYjdiNHlNYlI5VksxV
 nMvbFJnTmlkCmZGYzZuV0M1MDJYODVXcGoyVjJWWFg1WFhCMXpUams2U2dWclkxa1VWMFpKSitt
 WTB1aEYvMStNT25HczMvWjUKR2hRUVQwTktvQnh2TnJSVkF5K1g3aGluYW9EdFhaZnpnWEpkV1d
 uTExZUHA5U2ZucVMwV1NKUXo2ZFcyWW1acwp5ZW9xRHl0N2JyT3pkZnlyMnFqdFpiNTI1NTBTVU
 lLK3Y0QkFFb1ljek9pVTRWTFV5a080cjV1L2RHdUxCTXdhCm91M2ZUYWRnTWR3T2Y3SDVuUGU5d
 itHNFdBb3MyQ1pKUVlCanZtY3NubGlTNi95dFA0TE9IRzI4UDFocHlpcHMKZ0ljNDMwUlM1NllB
 dzY4V1ppOVE3MVVvQWl1NnBMaXZlWngyVHVWQm1aT20yWCs0MnZBVVdqTVFvNG9YVnNEeApXMmN
 3TE5pbHJTUFhvdHNzcXVBYkZ0U05QWmVCaUNONFRicXdHL0VhOTRmKzZoakprMkN3RGpXRWpyMH
 JtU3VICmJQbTVqTTk4SUdNSlhxT3RNc3hiRUIwVGV5YWxLbGo0MktlS3NPdjkyN0ZpZWZkOGZsR
 3MycUNkeVdsU2luUlkKcEdIWDI5bDF3UzFMVk94SmEvbEx3b0JyRXJVTEJ2d1cyNEVEU2UzQUtX
 SEFwd3BwbWZTYlVucERrYU1QUFpGZApianhmK2hvSFBEWXRXS0FXSnMwc1YwMEpCTnJuUFVWaWp
 ZTHlYaE50c2x3NklmSjdsZm1RMWxQd25hUUFLemFlCnI4NGNIQT09Cj1wOERMCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
X-TUID: 3uw7G4P5doRF

From: Paolo Bonzini <pbonzini@redhat.com>

Include the correct path and arguments to rustc in the native
and cross files (native compilation is needed for procedural
macros).

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure   | 50 ++++++++++++++++++++++++++++++++++++++++++++++++--
 meson.build |  8 +++-----
 2 files changed, 51 insertions(+), 7 deletions(-)

diff --git a/configure b/configure
index 019fcbd0ef..9ef6005c55 100755
--- a/configure
+++ b/configure
@@ -207,6 +207,8 @@ for opt do
   ;;
   --objcc=*) objcc="$optarg"
   ;;
+  --rustc=*) RUSTC="$optarg"
+  ;;
   --cpu=*) cpu="$optarg"
   ;;
   --extra-cflags=*)
@@ -252,6 +254,9 @@ python=
 download="enabled"
 skip_meson=no
 use_containers="yes"
+# do not enable by default because cross compilation requires --rust-target-triple
+rust="disabled"
+rust_target_triple=""
 gdb_bin=$(command -v "gdb-multiarch" || command -v "gdb")
 gdb_arches=""
 
@@ -317,6 +322,8 @@ windmc="${WINDMC-${cross_prefix}windmc}"
 pkg_config="${PKG_CONFIG-${cross_prefix}pkg-config}"
 sdl2_config="${SDL2_CONFIG-${cross_prefix}sdl2-config}"
 
+rustc="${RUSTC-rustc}"
+
 check_define() {
 cat > $TMPC <<EOF
 #if !defined($1)
@@ -636,6 +643,8 @@ for opt do
   ;;
   --objcc=*)
   ;;
+  --rustc=*)
+  ;;
   --make=*)
   ;;
   --install=*)
@@ -755,8 +764,14 @@ for opt do
   ;;
   --container-engine=*) container_engine="$optarg"
   ;;
+  --rust-target-triple=*) rust_target_triple="$optarg"
+  ;;
   --gdb=*) gdb_bin="$optarg"
   ;;
+  --enable-rust) rust=enabled
+  ;;
+  --disable-rust) rust=disabled
+  ;;
   # everything else has the same name in configure and meson
   --*) meson_option_parse "$opt" "$optarg"
   ;;
@@ -859,6 +874,7 @@ Advanced options (experts only):
                            at build time [$host_cc]
   --cxx=CXX                use C++ compiler CXX [$cxx]
   --objcc=OBJCC            use Objective-C compiler OBJCC [$objcc]
+  --rustc=RUSTC            use Rust compiler RUSTC [$rustc]
   --extra-cflags=CFLAGS    append extra C compiler flags CFLAGS
   --extra-cxxflags=CXXFLAGS append extra C++ compiler flags CXXFLAGS
   --extra-objcflags=OBJCFLAGS append extra Objective C compiler flags OBJCFLAGS
@@ -869,8 +885,9 @@ Advanced options (experts only):
   --python=PYTHON          use specified python [$python]
   --ninja=NINJA            use specified ninja [$ninja]
   --static                 enable static build [$static]
-  --without-default-features default all --enable-* options to "disabled"
-  --without-default-devices  do not include any device that is not needed to
+  --rust-target-triple=TRIPLE  target for Rust cross compilation
+  --without-default-features   default all --enable-* options to "disabled"
+  --without-default-devices    do not include any device that is not needed to
                            start the emulator (only use if you are including
                            desired devices in configs/devices/)
   --with-devices-ARCH=NAME override default configs/devices
@@ -1139,6 +1156,21 @@ EOF
 fi
 
 ##########################################
+# detect rust triple
+
+if test "$rust" != disabled && has "$rustc" && $rustc -vV > "${TMPDIR1}/${TMPB}.out"; then
+  rust_host_triple=$(sed -n 's/^host: //p' "${TMPDIR1}/${TMPB}.out")
+else
+  if test "$rust" = enabled; then
+    error_exit "could not execute rustc binary \"$rustc\""
+  fi
+  rust=disabled
+fi
+if test "$rust" != disabled && test -z "$rust_target_triple"; then
+  rust_target_triple=$rust_host_triple
+fi
+
+##########################################
 # functions to probe cross compilers
 
 container="no"
@@ -1604,6 +1636,9 @@ if test "$container" != no; then
     echo "RUNC=$runc" >> $config_host_mak
 fi
 echo "SUBDIRS=$subdirs" >> $config_host_mak
+if test "$rust" != disabled; then
+  echo "RUST_TARGET_TRIPLE=$rust_target_triple" >> $config_host_mak
+fi
 echo "PYTHON=$python" >> $config_host_mak
 echo "MKVENV_ENSUREGROUP=$mkvenv ensuregroup $mkvenv_online_flag" >> $config_host_mak
 echo "GENISOIMAGE=$genisoimage" >> $config_host_mak
@@ -1735,6 +1770,13 @@ if test "$skip_meson" = no; then
   echo "c = [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
   test -n "$cxx" && echo "cpp = [$(meson_quote $cxx $CPU_CFLAGS)]" >> $cross
   test -n "$objcc" && echo "objc = [$(meson_quote $objcc $CPU_CFLAGS)]" >> $cross
+  if test "$rust" != disabled; then
+    if test "$rust_host_triple" != "$rust_target_triple"; then
+      echo "rust = [$(meson_quote $rustc --target "$rust_target_triple")]" >> $cross
+    else
+      echo "rust = [$(meson_quote $rustc)]" >> $cross
+    fi
+  fi
   echo "ar = [$(meson_quote $ar)]" >> $cross
   echo "dlltool = [$(meson_quote $dlltool)]" >> $cross
   echo "nm = [$(meson_quote $nm)]" >> $cross
@@ -1770,6 +1812,9 @@ if test "$skip_meson" = no; then
     echo "# Automatically generated by configure - do not modify" > $native
     echo "[binaries]" >> $native
     echo "c = [$(meson_quote $host_cc)]" >> $native
+    if test "$rust" != disabled; then
+      echo "rust = [$(meson_quote $rustc)]" >> $cross
+    fi
     mv $native config-meson.native
     meson_option_add --native-file
     meson_option_add config-meson.native
@@ -1788,6 +1833,7 @@ if test "$skip_meson" = no; then
   test "$pie" = no && meson_option_add -Db_pie=false
 
   # QEMU options
+  test "$rust" != "auto" && meson_option_add "-Drust=$rust"
   test "$cfi" != false && meson_option_add "-Dcfi=$cfi" "-Db_lto=$cfi"
   test "$docs" != auto && meson_option_add "-Ddocs=$docs"
   test -n "${LIB_FUZZING_ENGINE+xxx}" && meson_option_add "-Dfuzzing_engine=$LIB_FUZZING_ENGINE"
diff --git a/meson.build b/meson.build
index 67eb4eda64..065739ccb7 100644
--- a/meson.build
+++ b/meson.build
@@ -70,9 +70,6 @@ if host_os == 'darwin' and \
   all_languages += ['objc']
   objc = meson.get_compiler('objc')
 endif
-if get_option('rust').enabled() and meson.version().version_compare('<1.0.0')
-  error('Rust support requires Meson version >=1.0.0')
-endif
 have_rust = false
 if not get_option('rust').disabled() and add_languages('rust', required: get_option('rust'), native: false)
   rustc = meson.get_compiler('rust')
@@ -4307,8 +4304,9 @@ else
 endif
 summary_info += {'Rust support':      have_rust}
 if have_rust
-  summary_info += {'rustc version':      rustc.version()}
-  summary_info += {'rustc':      ' '.join(rustc.cmd_array())}
+  summary_info += {'rustc version':   rustc.version()}
+  summary_info += {'rustc':           ' '.join(rustc.cmd_array())}
+  summary_info += {'Rust target':     config_host['RUST_TARGET_TRIPLE']}
 endif
 option_cflags = (get_option('debug') ? ['-g'] : [])
 if get_option('optimization') != 'plain'

-- 
2.44.0
