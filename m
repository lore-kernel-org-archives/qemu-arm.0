Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp819574njf;
        Thu, 15 Aug 2024 04:42:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUR3AzD+HdhtCzoxq9khYs/ZIGmHTKoGKvaWR23Fn9rap2j/U5i5rMOuKwbYAOz2wOKKiCE/24tQxO95BMvj1pk6Uw16+LW
X-Received: by 2002:a17:907:1c10:b0:a72:8066:c76f with SMTP id a640c23a62f3a-a8367049fe9mr437814166b.63.1723722168899;
        Thu, 15 Aug 2024 04:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723722168; cv=none;
        d=google.com; s=arc-20160816;
        b=LsgC6WeSXDB5SjXWZiDKSHW1K7mF6Y/HoUt2TQ5rFPQ+D/libMoZm/Ve4EyjE/WreH
         /5KqaGKMwrItq1pdtULYvwcGaNCfv2gnVyhoyKm5KkNUZQtZ1IbplhZAgnkyUeW3Ck43
         Qs2XdJP2Z5UuJ2UBVFe9DcxIsR5gf6i1po/0x0VTy7RNIHV8S6JsGXcrqagjQOjFcGQJ
         nOct6SMUoB7/0Giai4EL4iG+23RBmGhhVK0eh/OdzUQcsnF/DYBh3KmWCKqZouOcpKQQ
         8maiISOc+tC/ZZE1wkC00QBqUHETvdeWTcoYBUxbnfWkMpss3UEEciV6Q6lz/nNQ1/Xy
         pIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:dkim-signature;
        bh=NLQUtwlH5ru+31+0LhHDTaTOLuXgK1ZwJpwr1P2FRCY=;
        fh=AFnq8DA8u9A8KKpBe3t6hOAI/kJK6Y4SXQiIOeyqIaQ=;
        b=AP0UenQy/1KHgdUOCg5M7/FdsApoD30+hifvRY1/rrsfsgAoG3j3+m9beYrBV2TmGF
         OdrvZQysv83+yxNv5JdRgH687ncZbFYOIGjnuVOxQRDUwB2zgHZIl0D5S+Ww08RFCMVj
         dnQ7SPAEr/WAVtD8naCEe1yOnrd9akBCqwNxAmiTdw3rF51PXDkq8asFQ9gqPSVnhp0v
         0w+pYJwwfrRKDsK3lADK3ZGQJBSXgIwx8Bnp/+o2JJ1CHCrkkZacgyqkJWi4y/IOLfeb
         PwdBbJuwHo6d1y0V3ETo4A72v6bvmWqEO3A7Hudr44E1AqO8FAuKibWaBClY1BRSwnb6
         /cqQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q2gFAfi3;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a83838ef61csor31286866b.12.2024.08.15.04.42.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Aug 2024 04:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q2gFAfi3;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723722168; x=1724326968; darn=linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NLQUtwlH5ru+31+0LhHDTaTOLuXgK1ZwJpwr1P2FRCY=;
        b=q2gFAfi3XeBE/pBcDprhvCkOmrVF33DdIr1RV7W7YfCcSchV8sWp+2ws7b1lmmDBBv
         Bckid1c30d9HO8LKswT0XaGiHfy9JNlHDOAaRlZW3BfHc1ND1S7BZgWZpuH/1BO51ZW2
         81Uac9JRhoeWN9+ttKvgot8Xmnfrkhd9bAdIETmjq2RnS59GZvj4lWi2/U++yfkEt0Se
         grb9LLUG1ogVhc4tgBz3ogQ6YV1n9+Dgeahtt1PVOqN6lW1OIP6U2ncC4/gkdMT0QjHp
         PAn3B+jZQ+Q1HwlVbvyWPtZnZToEnIih2kIYHmGx79XPwtuVSqxMZC7pylmAfx8A11YL
         2dZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723722168; x=1724326968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NLQUtwlH5ru+31+0LhHDTaTOLuXgK1ZwJpwr1P2FRCY=;
        b=KuOFqCpENAunc2yvUs8hOdzSAc0Lmc35pB+hyFyzJEAFiNL9bX1wC7Q8UEst1YAXuS
         v6mjyir4ygoZ7Hyorj/jJ0qnfg92+8w2l4i8/qlRBOBtEcQfNALNnhhohMyMgs9j4owl
         lgxNv4gTVlnIfwMsOpgTEw0OEUFGV6qIZWDoRFPDRd3Pb4qoKXrn1gNcnRJoGK/2uCRf
         3dSpgp/xOLso8Cl9Rvzn3cwv3McDFhqWgVW7z+aEywWBQ6sf1EZAUZsIu1FPZQUKqH0e
         7ErABCyJpZqB4hyf2KcuQk2Tx5wlxT6nIYKAIw/48J4annp8P9mYa68Gh9XALoHAVFz0
         26UA==
X-Forwarded-Encrypted: i=1; AJvYcCUvyVqvkQNB7RLHFsUFy/8bAlIev4m3ApArDxYY4HytAxqfblj50XwCKB6djAqFjgS+mI4uNYpWD7/p7fAMpoEZ99MErXkM
X-Gm-Message-State: AOJu0Yz2LOuTZTTy3zIegv3QRqIxV0N+cBNSpiFPhI25qCe7D96YwPGd
	yLiwQHBjuwd9E6rnnSX14KCnpRPWLnIwulDPC/x6I/gIwT+NQZboeGpiYmS6Q0NdoQ==
X-Google-Smtp-Source: AGHT+IERsraj+SrcVseP+cgiZcrfAHCBR4dNRpY3FpMeC3WLEio67G4chgDg13MNW0jagopDpKXJsw==
X-Received: by 2002:a17:907:1b0d:b0:a77:c30c:341 with SMTP id a640c23a62f3a-a83663fa418mr387411266b.0.1723722168285;
        Thu, 15 Aug 2024 04:42:48 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from [127.0.1.1] (adsl-26.37.6.162.tellas.gr. [37.6.162.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c6bf1sm89547966b.21.2024.08.15.04.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 04:42:48 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 15 Aug 2024 14:42:19 +0300
Subject: [PATCH v7 2/7] build-sys: Add rust feature option
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-rust-pl011-v7-2-975135e98831@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5382;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=BxaqJcEWLkToyju8S1kw437QUrcpEwLDC4lAb4m/ZVA=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm12ZW11ZlNNdEVGMVkrQjIraDk0K2UrbmpHSVFzCitUQk9QSWR4WTBkWWxJbzg1
 NmFKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnIzcHJnQUt
 DUkIzS2Nkd2YzNEowRVhaRC80NUdlWmJVT2VHS0RpMWtMSVhuSndPWVBKYjM0SHhVbVd3cVNxRA
 pJRmVDU0dxbzdnQndRSWRPaEpBVVJLOGZONkU1VXl3NHAvQzdnTjliV3dkZXUrNnB2N0JjTlVXT
 2RVTWhhcERPCi93SGY3Mi9HckdXWUpNK2RMaGprbkRTM2tsZDZYSW04cVkvTHlyelF6dWNTd0h6
 UWwraE5vODVuYmk3SVdkRmEKbllYRTdET3pSbU0yTm56K1E3QktobHYxOHRtR0sxUSs0TUlRRGJ
 wdFBsYitPdXJIKzlpZExEU1cvbmZVUHprOQpTZ29DUGlEbk54c3BENi9vRGhVbCtua3J0Nnh5SF
 BZMzk1Y2Z2NXRyOU8zbkdDYnQ5dXF0cnpHMnFxV1VPM0FvCnJCaVRuRWtxa21FVVVsOTNFU0lVK
 2w2VXY2M0Ftd1RoaWxXMVEvbnlCRkNOUUswNFpQLzFhdStyb2hjYnNheTIKUzhMTWZjcUxKRmpS
 VlNVQ3R2MUhiRDJQbjk3dGdIeFdUaGI3dHZCNUxCTFV3bE1Ea2tCWkxjbTJWQVJ3VEoxUwo3MU4
 vTGRQSS8vVWhmZHdYQjBVRjhCTWxEWTc3b2RYMHFZYVZxcW5rSFBJcVowbi8yaDYrbnZ4b3FCTn
 pXM2k1CnFXZUNyUG9TaEhDZVpoTnFBMFZ5U29OR2UzMjlqN2JOeWR5WUttTTNEQjVnZ0VhS3R5O
 WhjbnZZVkR4U1lTS1EKcklHL2VJVnBGdTRTc2pYSy83TmM3dkUxWGhHQmJtR05RZE11RU42VDlt
 aDZtQU1mbWRjWjdIc01menhtYXR4VgozWlhTOW9MTDIrbThYMnJrc1o5ajM5OTlxWlNnbVJmcUk
 yMkdkRndObjg5MUlKTlpCNlFwenVLSVpmdWJPc2RuCjJKbHFJQT09Cj1nMGhQCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1
X-TUID: 8R5gqFfbH8Is

Add rust feature in meson.build, configure, to prepare for adding Rust
code in the followup commits.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 MAINTAINERS                   |  5 +++++
 meson.build                   | 25 ++++++++++++++++++++++++-
 Kconfig                       |  1 +
 Kconfig.host                  |  3 +++
 meson_options.txt             |  3 +++
 rust/Kconfig                  |  0
 scripts/meson-buildoptions.sh |  3 +++
 7 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3584d6a6c6..0bc8e515da 100644
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
index 7eb4b8a41c..67eb4eda64 100644
--- a/meson.build
+++ b/meson.build
@@ -70,6 +70,22 @@ if host_os == 'darwin' and \
   all_languages += ['objc']
   objc = meson.get_compiler('objc')
 endif
+if get_option('rust').enabled() and meson.version().version_compare('<1.0.0')
+  error('Rust support requires Meson version >=1.0.0')
+endif
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
@@ -2131,6 +2147,7 @@ endif
 
 config_host_data = configuration_data()
 
+config_host_data.set('CONFIG_HAVE_RUST', have_rust)
 audio_drivers_selected = []
 if have_system
   audio_drivers_available = {
@@ -3076,7 +3093,8 @@ host_kconfig = \
   (host_os == 'linux' ? ['CONFIG_LINUX=y'] : []) + \
   (multiprocess_allowed ? ['CONFIG_MULTIPROCESS_ALLOWED=y'] : []) + \
   (vfio_user_server_allowed ? ['CONFIG_VFIO_USER_SERVER_ALLOWED=y'] : []) + \
-  (hv_balloon ? ['CONFIG_HV_BALLOON_POSSIBLE=y'] : [])
+  (hv_balloon ? ['CONFIG_HV_BALLOON_POSSIBLE=y'] : []) + \
+  (have_rust ? ['CONFIG_HAVE_RUST=y'] : [])
 
 ignored = [ 'TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_ARCH' ]
 
@@ -4287,6 +4305,11 @@ if 'objc' in all_languages
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
index fb6a24a2de..63ca7f46df 100644
--- a/Kconfig
+++ b/Kconfig
@@ -4,3 +4,4 @@ source accel/Kconfig
 source target/Kconfig
 source hw/Kconfig
 source semihosting/Kconfig
+source rust/Kconfig
diff --git a/Kconfig.host b/Kconfig.host
index 17f405004b..4ade7899d6 100644
--- a/Kconfig.host
+++ b/Kconfig.host
@@ -52,3 +52,6 @@ config VFIO_USER_SERVER_ALLOWED
 
 config HV_BALLOON_POSSIBLE
     bool
+
+config HAVE_RUST
+    bool
diff --git a/meson_options.txt b/meson_options.txt
index 0269fa0f16..fa94a5ce97 100644
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
index 0000000000..e69de29bb2
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index c97079a38c..5e8a225a6b 100644
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
2.44.0
