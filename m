Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1254483njb;
        Tue, 10 Sep 2024 05:35:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUavMd9u4/BiJ3bEcAIw2ksJAIzSGqMJ5ipn/uRMMpJsUC80Pv2rZpoZxw4617Wj7KOdamFeMVtL7TWpg==@linaro.org
X-Received: by 2002:a05:600c:1ca6:b0:426:6ed5:d682 with SMTP id 5b1f17b1804b1-42cae70f0e2mr66300465e9.12.1725971737104;
        Tue, 10 Sep 2024 05:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725971737; cv=none;
        d=google.com; s=arc-20160816;
        b=VbGQDTc11ycwYlMbHMbVQVUXPS4Bq9lEOGyvmzmYTSuNiPNlm5z5icbS81MJkhgUib
         z5aFb6WtXa8j15AtuAxg6sj5TIEuEqOeg+Tv42CqK2lvqa1VpQ425D8IqDm81h0XavBX
         zfI2YlfA9Pc5FT/ADmgxVDAu5hfn1NICLStMOptJpeywQCZuXTtp5IjyTT/vor7OcPnC
         cchd7afIhl7fs/TBsVAEMFrJ2fegOOXNKLDVtxZhHqZFqWKifEP85mfxoRpnPwUqUuFr
         DH9qu+bCqtsb3ApDqn/RUMlG55J2oE2Z9Y0j7SRcSDGsCFIHfVrAbgH/9K6XSV45jJpE
         Drlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=xyrO78X77QhVFouGIPi7mA6rUE8yV7wCKALnuzu9hto=;
        fh=3EpbdCHEc20kjTMUGJ3bfEqC/ulL1QfwSEEKVpQy2eU=;
        b=kpwhah1qpZnQmqz6psH9CZ16ve5s0aPpmzIb501kiT4ioBEVBadBQjI+URzbTHeHzJ
         KfznNcj+p7EKKAg0xI5jZ6v2m+abrtLfUSo2LGMSmxSq4Co+XDIblbcs7WnD/6wXdBgZ
         KVdgYQw23QjF7VajaBaddBXfA7zPfdtOen8uKF27JtRbtjo00pHilJKFPGpYqqqC4cE8
         3h15L4br1aZuf1lTDJkhH2EeUQ5PHB+Adg65abugs3U7DHmaF297mP3s6LFCP3wRi1ia
         f+gsuR0CdlYaN8utrngYYVOwE/4mOFqwJwgC8eWDV8wNo7awC/wxF6wnUPwJnv9uhCGT
         j4oQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zcj96uoS;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-378956178f8sor1358505f8f.4.2024.09.10.05.35.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Sep 2024 05:35:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zcj96uoS;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725971736; x=1726576536; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyrO78X77QhVFouGIPi7mA6rUE8yV7wCKALnuzu9hto=;
        b=zcj96uoSiTlgvlXbDuk5Uc4SH0hh7MnL6RAhuH408u0Y5FDQOQxKQURqCFNUr8yqs3
         2Xhiiz4bwUP3pQXjQaZJM6Y255Y9MOqA/GvMw7HBrUlpg9iawN8aFWYwyLt9EP6opaWC
         nPApMNCrPVIWjlm4fhSD3x12oXPtLUjRItdFurmE/r88oDo65wlQiwnrEqCHwXlonuRo
         P+RudT3CyiukANNOSel2+g4R5OzjOVS1B2g/LtUF2Uz33CGFp+YFqinj/OAKDt36F3Wa
         O2jEtudxxCg0idr47TD5vafeH5LGHBUYONbDBNrphtag82XMb60UVFvkZBPjqGZO6Ipt
         VXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725971736; x=1726576536;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xyrO78X77QhVFouGIPi7mA6rUE8yV7wCKALnuzu9hto=;
        b=TxBKYC4byDJc68wGkZQFgSktGFYLPbYarLv+CTo3MTDNt5JK3CMVj/CV/X/V/NPSBy
         WmQR1yCdCoPWadid2JDmeMWOF5XGNYAsBIoPO82nelbg2oWdAx1Dn+G7SnrT3an0+n7W
         iQ4vB2kbIiYzBUCuBctY93fxJGBiXkxv/MzJI9KvuOfYCpej8X+F+zVYVggRBYwcBFrT
         RLzRhSC6wjx4ZMm4utD7B8kISF1T1Z9Ut+uTJuJ23ZoAJZs0AqaTXxRZwlNyHlkZezBA
         EYXcvLPyyD/TIsloPr25DNRaA24ehrWOORW3WPySdFleAtwGvSyyu3EvJ2xb+Wfnl6jB
         4cyA==
X-Forwarded-Encrypted: i=1; AJvYcCXfDngOhYYfyKjZplSCRIYwTVUFLcJAB+1DPWqbUAvDs2SEffQpld1zTlbi5EaKLn52Y15XEgu14jcfPQ==@linaro.org
X-Gm-Message-State: AOJu0YyGMxUt04zhh7XxG9nl84qoBlAIvnLtUjmLRPIm3Z+PlpPS55L4
	STyllS8IAdOM0Z1tZ/I2Z2FpytSQjOMmMnuNvWxQ5kzHG7WW8K2JUD4mrCpq5ATrR/s2CrXMoRO
	DCEkTqw==
X-Google-Smtp-Source: AGHT+IEdJ4YF+CqRhFGVNAKxj8RUdgGIow2zFt0RCe6LN6lWNZ4SQyFE0lfp/3rXPSDXYi9Snb0fbQ==
X-Received: by 2002:a5d:4983:0:b0:374:ca16:e09b with SMTP id ffacd0b85a97d-378949ef74bmr6870055f8f.9.1725971736161;
        Tue, 10 Sep 2024 05:35:36 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from [127.0.1.1] (adsl-234.109.242.225.tellas.gr. [109.242.225.234])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd41cd7sm4242994a12.3.2024.09.10.05.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 05:35:35 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Tue, 10 Sep 2024 15:35:08 +0300
Subject: [PATCH v10 2/9] build-sys: Add rust feature option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240910-rust-pl011-v10-2-85a89ee33c40@linaro.org>
References: <20240910-rust-pl011-v10-0-85a89ee33c40@linaro.org>
In-Reply-To: <20240910-rust-pl011-v10-0-85a89ee33c40@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Gustavo Romero <gustavo.romero@linaro.org>, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Peter Maydell <peter.maydell@linaro.org>, Junjie Mao <junjie.mao@intel.com>, 
 Zhao Liu <zhao1.liu@intel.com>, John Snow <jsnow@redhat.com>, 
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org
X-Mailer: b4 0.15-dev-c2c95
X-Developer-Signature: v=1; a=openpgp-sha256; l=5706;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=sf6hnX5CNuBCp1PVgFEUPHeKC7QicbX1QOXnSOSG4tU=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm00RDBMdlBuZzNkek5yV1dNRXJ2NGxubGlmaS9LCkZnaXZ0ZitPWGJzeERTVFFP
 R2lKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnVBOUN3QUt
 DUkIzS2Nkd2YzNEowQm5ORC8wVEpIM2tJc3RDd3EzVjRqaGhGQ2FRRFBNbjFNN2hXTFFXNDQ2Nw
 pzZHdZMWdyRGRESmRIeXdYWE1hRlpmT0lFZnhqbEs5M2xENjF0NHphS3pFMy9WcFA3Zmhlb1FwT
 Fg4OFM0MFFSClFUd0hiK092Q1ZZWVdiTk5TOWptenhvejFnTFlqZGlFRXMvTWY2UEVjSThpQnox
 QnVpVEQzcVl2OTQ0Skw4c28KMVFBdVZ6bUZMdDJnTHJldDhhUXdOWW1VaUlUTzVVNTdEbWErOXA
 zRjUxSWZWdFZuMG9icEJ6bnFQYVcyaWJDbAphRmN2Q0tyNXc1VTgxVDVZNmhXN1R2Zlp4NkVwNk
 gvVktUL2c4ZE13TjcxS1pCNk05bFV2eEt3c0lsSmoxZTVkCjArQUs2dkxBdFA3NVpoVUU2eGhTO
 WE2blRtdm4xUngvUEh2SGlsRHgySFFtaU1kUkNGN05VdlUvQTNRRjIxTFcKQTFldURTYnlPZDRs
 MHlGdTBZMWJSRHZwZ052S1V3N3VsRllhM1RHN01GMU1xYzJ6RTJKbk1UNmJjSm9JNFQ0bgprc3J
 uNUJjcFBpWkl5M01KOWRNMC9Pb0J3TW8yVXZGSlVVdWFjWWxHNmREMWtuZ3R1Q1NIZ3RWS2JsV0
 1lRVkwCkkvaWtsSi9Zcm5hWnVweTZxRkxkMzc4T0FwM0szRDZYNDZwOHRWb3F1K1l3Vk5DUTJse
 XExZzlkV3liZFlrTEoKMTM2NTk4clh1cXo1c1c5Z1RJTDM2NDR5RTdkMmllbFpPTk1DSU96dzQ1
 V3k1ZnB6TjAxektZOXluZ3VncXZWegpQR0FSL21tMzI1KytjVllxN3dYMFpyV2dIOXRIQStqTFh
 QTlh3bi9odXhRU3hMMjIvY3RFZlhoVjRWc3YzalR4ClpNelBlQT09Cj1lczdzCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
X-TUID: mAneMZMrBR1E

Add rust feature in meson.build, configure, to prepare for adding Rust
code in the followup commits.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 MAINTAINERS                   |  5 +++++
 meson.build                   | 22 +++++++++++++++++++++-
 Kconfig                       |  1 +
 Kconfig.host                  |  3 +++
 meson_options.txt             |  3 +++
 rust/Kconfig                  |  0
 scripts/meson-buildoptions.sh |  3 +++
 7 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3584d6a6c6da9a3210150534d640d29ddf329dce..0bc8e515daf7e63320620b52b42a799b99dbe035 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4243,6 +4243,11 @@ F: docs/sphinx/
 F: docs/_templates/
 F: docs/devel/docs.rst
 
+Rust build system integration
+M: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
+S: Maintained
+F: rust/Kconfig
+
 Miscellaneous
 -------------
 Performance Tools and Tests
diff --git a/meson.build b/meson.build
index 7eb4b8a41c0a667cacf693cfa2764f326ba72b1f..47a9c04e322a2171daf188eb62b7b4ad941c9ea8 100644
--- a/meson.build
+++ b/meson.build
@@ -70,6 +70,19 @@ if host_os == 'darwin' and \
   all_languages += ['objc']
   objc = meson.get_compiler('objc')
 endif
+have_rust = false
+if not get_option('rust').disabled() and add_languages('rust', required: get_option('rust'), native: false)
+  rustc = meson.get_compiler('rust')
+  have_rust = true
+  if rustc.version().version_compare('<1.80.0')
+    if get_option('rust').enabled()
+      error('rustc version ' + rustc.version() + ' is unsupported: Please upgrade to at least 1.80.0')
+    else
+      warning('rustc version ' + rustc.version() + ' is unsupported: Disabling Rust compilation. Please upgrade to at least 1.80.0 to use Rust.')
+      have_rust = false
+    endif
+  endif
+endif
 
 dtrace = not_found
 stap = not_found
@@ -2131,6 +2144,7 @@ endif
 
 config_host_data = configuration_data()
 
+config_host_data.set('CONFIG_HAVE_RUST', have_rust)
 audio_drivers_selected = []
 if have_system
   audio_drivers_available = {
@@ -3076,7 +3090,8 @@ host_kconfig = \
   (host_os == 'linux' ? ['CONFIG_LINUX=y'] : []) + \
   (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
   (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : []) + \
-  (hv_balloon ? ['CONFIG_HV_BALLOON_POSSIBLE=y'] : [])
+  (hv_balloon ? ['CONFIG_HV_BALLOON_POSSIBLE=y'] : []) + \
+  (have_rust ? ['CONFIG_HAVE_RUST=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -4287,6 +4302,11 @@ if 'objc' in all_languages
 else
   summary_info += {'Objective-C compiler': false}
 endif
+summary_info += {'Rust support':      have_rust}
+if have_rust
+  summary_info += {'rustc version':      rustc.version()}
+  summary_info += {'rustc':      ' '.join(rustc.cmd_array())}
+endif
 option_cflags = (get_option('debug') ? ['-g'] : [])
 if get_option('optimization') != 'plain'
   option_cflags += ['-O' + get_option('optimization')]
diff --git a/Kconfig b/Kconfig
index fb6a24a2de8c3ff11d4ee432d65ad000ba9d6c4d..63ca7f46df788144864b26ef5a64b29ad6547435 100644
--- a/Kconfig
+++ b/Kconfig
@@ -4,3 +4,4 @@ source accel/Kconfig
 source target/Kconfig
 source hw/Kconfig
 source semihosting/Kconfig
+source rust/Kconfig
diff --git a/Kconfig.host b/Kconfig.host
index 17f405004b3bc765890688304322a1937ca8c01c..4ade7899d67a5ed91928f8ee1e287f5ba3331949 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -52,3 +52,6 @@ config VFIO_USER_SERVER_ALLOWED
 
 config HV_BALLOON_POSSIBLE
     bool
+
+config HAVE_RUST
+    bool
diff --git a/meson_options.txt b/meson_options.txt
index 0269fa0f16ed6b6f734fcefa2cfa94aa029fa837..fa94a5ce97bb14ab108e21cccb651923ac6a58f8 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -371,3 +371,6 @@ option('hexagon_idef_parser', type : 'boolean', value : true,
 
 option('x86_version', type : 'combo', choices : ['0', '1', '2', '3', '4'], value: '1',
        description: 'tweak required x86_64 architecture version beyond compiler default')
+
+option('rust', type: 'feature', value: 'auto',
+       description: 'Rust support')
diff --git a/rust/Kconfig b/rust/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..e69de29bb2d1d6434b8b29ae775ad8c2e48c5391
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index c97079a38c9e4ed24a0fe9b44e492b7108481048..5e8a225a6b343cf506950a3146af718d52a6c1a0 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -170,6 +170,7 @@ meson_options_help() {
   printf "%s\n" '  rbd             Ceph block device driver'
   printf "%s\n" '  rdma            Enable RDMA-based migration'
   printf "%s\n" '  replication     replication support'
+  printf "%s\n" '  rust            Rust support'
   printf "%s\n" '  rutabaga-gfx    rutabaga_gfx support'
   printf "%s\n" '  sdl             SDL user interface'
   printf "%s\n" '  sdl-image       SDL Image support for icons'
@@ -452,6 +453,8 @@ _meson_option_parse() {
     --disable-replication) printf "%s" -Dreplication=disabled ;;
     --enable-rng-none) printf "%s" -Drng_none=true ;;
     --disable-rng-none) printf "%s" -Drng_none=false ;;
+    --enable-rust) printf "%s" -Drust=enabled ;;
+    --disable-rust) printf "%s" -Drust=disabled ;;
     --enable-rutabaga-gfx) printf "%s" -Drutabaga_gfx=enabled ;;
     --disable-rutabaga-gfx) printf "%s" -Drutabaga_gfx=disabled ;;
     --enable-safe-stack) printf "%s" -Dsafe_stack=true ;;

-- 
2.45.2
