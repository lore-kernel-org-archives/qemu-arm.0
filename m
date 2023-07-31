Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2026565ejb;
        Mon, 31 Jul 2023 01:47:53 -0700 (PDT)
X-Received: by 2002:a05:6300:8001:b0:130:835b:e260 with SMTP id an1-20020a056300800100b00130835be260mr8944866pzc.52.1690793273090;
        Mon, 31 Jul 2023 01:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690793273; cv=none;
        d=google.com; s=arc-20160816;
        b=HiTl76fwAIo1WqnQZjybx+y/a2HG5P8vWVcJAdAQzn5o+jXFIboAWA9QdVEPfk13Xy
         +6lgdPthmkYhPPDcSsFRnyw0+7P/pGinnE0poRecL2RyFmt00ZzfJXvavSSudFL+XeiQ
         yU0XWv2LBXYME8V1cx3y5Nter5lPL+UB8UlGBbfGAYaDyugPN0M6BBADyAw4lqR5hk2y
         mLa7GDLoARlLMLILX357yhReJ7jMPYrmWdjbajsZdTjmn5Sgux3C1Z1wmtf5to3zi5st
         q5RYp8nnkYHa/knePyJadEb9zlkcrYZv4f1zqPsz7z6MvthpSwFTzs92TTv4LWTkqlSa
         +0IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=q/ljaudOPf1jdz+9rwGQeEP3d6AMU+42VcuNs3f2VA4=;
        fh=l3HXkgen+sp7qeKvX9FkHOJAUo4ziZShK2g6VutuFWs=;
        b=YdiBgI+NCMSnTLzaLBrx0EXA5FG4oyWku2jrftERLSLjmx6b1e2NXgkn8pC7yIIQmV
         rvrvZuhVfewd95SCW1slC1Y2DbI3J4VjfbwVSZBcKoC27TXaKO5TE3NljnYmnjQgn4+u
         LKB9HpIh8UcxzpQEfiQCziNtRFmCf3uzgahJzo3+mNesOCZ/wqaAYLDqHc1/hksVMzC+
         L6BIrGTn+nYpfh9yUZxDqLvWaSKSDrdvztwplX4SUGY6vYu3aH0Q4KxCdD6VfUSymfMK
         VJ+jk/UY6IAH6KQMZkZjjyiNeN0VJqOnEOM/vCxnaM31vpgtBXUHnkaCLiw+n0v2alW+
         hPgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=nZhLxAvp;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id c64-20020a624e43000000b0066392cf5b21sor3443905pfb.9.2023.07.31.01.47.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 01:47:53 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=nZhLxAvp;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690793272; x=1691398072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/ljaudOPf1jdz+9rwGQeEP3d6AMU+42VcuNs3f2VA4=;
        b=nZhLxAvp/2C33LdlnpYPZp34/slMDnUUx4cwF5RmfJ6JeoUf5Oi+vYGGAws4eolnvo
         2p5xh7PGxwvPK9vYczLlb8vbfKvW52MbYRaJIksHnowC93XbrL1fFRT25YQ8WC0Rrz6F
         PC0gA8Kdbt7LQt3g4kInIfJoo7rNRMyFX+6gfgaBGM3I07rFaJ3mhwWvRoZWc7EetuP0
         BqxYXoWRuWFmNIFZNo+GGzzLxRt4cnE/JYJQIQnlW+QMJf2pV2Z1MUwCdWv4lWHbZrsb
         v+W8T+m46sHcD8t7A4+qH+/9I1s4/ARsPTqGWdSUkzW+eiweuBa00AtSVTH1S9HYcLaE
         TxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690793272; x=1691398072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/ljaudOPf1jdz+9rwGQeEP3d6AMU+42VcuNs3f2VA4=;
        b=j6XhvMib274ncyCS5+eEadH9DKDdUA2Lahu+ZTaJT+LurhKJauIie+SoLPPXZHt+9t
         sRG9bg7RP3jbxJ7O/VHeVPsGMXJ/mjILxhJ4Wlcn7okbt/OZ61pl92AxHeV0uBamvuVi
         tyvbCiKMQkuE86cKxIGQsPpiyMxMd5D6EVEcClnlg1C2Sp4vM/sBFa9yuLG9MWD428HG
         es4h/oV8jENS5fmMJ/6aetpmqjpkQEOamxj/SsLwkf6kduwTqFZgk9YJGvCPVqyHEQVG
         pXzdFG86KsMyHa+yHgBn1JsRvH0VdV4p3r+BgwKznDSFRr1038A/eEmb1ropM5nbS7/s
         7LHQ==
X-Gm-Message-State: ABy/qLZ4Fh/NzcFrK1Wtnp/3qUgwpuoqn11BG6ndNtXq+nIdco6VsLe+
	+sCq6uGyCIFoB1FecEaY3LMC2Z9MJfB72IQZHEU=
X-Google-Smtp-Source: APBJJlEsp426D/hJ2qOs56A+RF7uySuqd1KXfb7I+eDTnz00qZVW1bhYr8MFZbAJbWbLrTQhqBDOpA==
X-Received: by 2002:a05:6a00:c95:b0:686:6fa8:2b0d with SMTP id a21-20020a056a000c9500b006866fa82b0dmr11250632pfv.4.1690793272620;
        Mon, 31 Jul 2023 01:47:52 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.. ([157.82.204.253])
        by smtp.gmail.com with ESMTPSA id u19-20020aa78493000000b00666e649ca46sm7075563pfn.101.2023.07.31.01.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 01:47:52 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Brian Cain <bcain@quicinc.com>,
	Song Gao <gaosong@loongson.cn>,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Laurent Vivier <laurent@vivier.eu>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Stafford Horne <shorne@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	Greg Kurz <groug@kaod.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Max Filippov <jcmvbkbc@gmail.com>,
	qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-s390x@nongnu.org,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [RFC PATCH 24/24] contrib/plugins: Add cc plugin
Date: Mon, 31 Jul 2023 17:43:51 +0900
Message-ID: <20230731084354.115015-25-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230731084354.115015-1-akihiko.odaki@daynix.com>
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: CjK1zlu7ZqqG

This demonstrates how to write a plugin in C++.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 docs/devel/tcg-plugins.rst |  8 ++++++++
 configure                  | 15 ++++++++++++---
 contrib/plugins/Makefile   |  5 +++++
 contrib/plugins/cc.cc      | 15 +++++++++++++++
 tests/tcg/Makefile.target  |  3 +++
 5 files changed, 43 insertions(+), 3 deletions(-)
 create mode 100644 contrib/plugins/cc.cc

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index c9f8b27590..0a11f8036c 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -584,6 +584,14 @@ The plugin has a number of arguments, all of them are optional:
   configuration arguments implies ``l2=on``.
   (default: N = 2097152 (2MB), B = 64, A = 16)
 
+- contrib/plugins/cc.cc
+
+cc plugin demonstrates how to write a plugin in C++. It simply outputs
+"hello, world" to the plugin log::
+
+  $ qemu-system-arm $(QEMU_ARGS) \
+    -plugin ./contrib/plugins/libcc.so -d plugin
+
 API
 ---
 
diff --git a/configure b/configure
index 26ec5e4f54..0065b0dfe0 100755
--- a/configure
+++ b/configure
@@ -293,10 +293,18 @@ else
   cc="${CC-${cross_prefix}gcc}"
 fi
 
-if test -z "${CXX}${cross_prefix}"; then
-  cxx="c++"
+if test -n "${CXX+x}"; then
+  cxx="$CXX"
 else
-  cxx="${CXX-${cross_prefix}g++}"
+  if test -n "${cross_prefix}"; then
+    cxx="${cross_prefix}g++"
+  else
+    cxx="c++"
+  fi
+
+  if ! has "$cxx"; then
+    cxx=
+  fi
 fi
 
 # Preferred ObjC compiler:
@@ -1702,6 +1710,7 @@ echo "MESON=$meson" >> $config_host_mak
 echo "NINJA=$ninja" >> $config_host_mak
 echo "PKG_CONFIG=${pkg_config}" >> $config_host_mak
 echo "CC=$cc" >> $config_host_mak
+echo "CXX=$cxx" >> $config_host_mak
 echo "EXESUF=$EXESUF" >> $config_host_mak
 
 # use included Linux headers
diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index b2b9db9f51..93d86b3d07 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -21,6 +21,9 @@ NAMES += lockstep
 NAMES += hwprofile
 NAMES += cache
 NAMES += drcov
+ifneq ($(CXX),)
+NAMES += cc
+endif
 
 SONAMES := $(addsuffix .so,$(addprefix lib,$(NAMES)))
 
@@ -31,6 +34,8 @@ CFLAGS += -fPIC -Wall
 CFLAGS += $(if $(CONFIG_DEBUG_TCG), -ggdb -O0)
 CFLAGS += -I$(SRC_PATH)/include/qemu
 
+CXXFLAGS := $(CFLAGS)
+
 all: $(SONAMES)
 
 %.o: %.c
diff --git a/contrib/plugins/cc.cc b/contrib/plugins/cc.cc
new file mode 100644
index 0000000000..e7270d7adc
--- /dev/null
+++ b/contrib/plugins/cc.cc
@@ -0,0 +1,15 @@
+#include <qemu-plugin.h>
+
+extern "C" {
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_version = QEMU_PLUGIN_VERSION;
+
+QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
+                                           const qemu_info_t *info, int argc,
+                                           char **argv)
+{
+    qemu_plugin_outs("hello, world\n");
+    return 0;
+}
+
+};
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 462289f47c..3d7837d3b8 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -149,6 +149,9 @@ PLUGIN_SRC=$(SRC_PATH)/tests/plugin
 PLUGIN_LIB=../../plugin
 VPATH+=$(PLUGIN_LIB)
 PLUGINS=$(patsubst %.c, lib%.so, $(notdir $(wildcard $(PLUGIN_SRC)/*.c)))
+ifneq ($(CXX),)
+PLUGINS+=$(patsubst %.cc, lib%.so, $(notdir $(wildcard $(PLUGIN_SRC)/*.cc)))
+endif
 
 # We need to ensure expand the run-plugin-TEST-with-PLUGIN
 # pre-requistes manually here as we can't use stems to handle it. We
-- 
2.41.0
