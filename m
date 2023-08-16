Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp414897ejs;
        Wed, 16 Aug 2023 07:56:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:a103:b0:138:64d4:b055 with SMTP id q3-20020a056a20a10300b0013864d4b055mr2620745pzk.55.1692197776305;
        Wed, 16 Aug 2023 07:56:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692197776; cv=none;
        d=google.com; s=arc-20160816;
        b=GNvmCkUuA6gWw0co/K7r4I/+eTSsCLqoMk5Lm7NTNO6uUmyuOao0rSYKRyNm5z9i/J
         Jjz1hjpaqn4QssQMsCqfSukOphyifA9+gayfT5rjc6QuQoWPZQwU8Us9zZZ2aSmSYN6C
         poOSd39ADdgM8eHl2bXn1B2WXQZ+WXQ5pjyNsfvHq3WRMSlxj0VpqtRq7+VmweyH0Kir
         OhvOcPFUr+MOaSDTVQpS6K/Kpg3O0Mbqelya4zbiemxQicJUa99J5yfdwpuMhyqNdIXS
         hl1dbYLPmKld91MljuBOeuJjUSjEFCtQYs5dnxFAi5tkQZORxTALwmppfxCfuKJqpjuV
         iwlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kNR+2DDMQySc8psqEDhnZbBav2KTV36MZCBGyLQQO2o=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=MNXa19j39Y5KLv2SlYmTD+F0f98nBy10jZuocNVcqvDny579MTvYEq3hvoGgsZqXS8
         6hIHevbOj+3KLeK6Ggg6iQXG8l2sI+3OEu8Rz76djDeDNqkLApTmrs2YcJwtkQJQQcAj
         YosTZtleV+ukfscChYit9ci7XTtb9wQZ5wJQiaFzepS4+GfcSWlNBpHbLkAW2hwK2Wy9
         +oVGLY+CMfyOKY+sTBH8hhJTE3Pe/7E40g1KNUUZalME7F/CAbSMcluUSVKfrLP2cBZG
         n+W/HkXQxk6t+bAEl7/Jq5+nyPYOmN+KQ5egpGzKb3ZboHg4o9k4C08huPPMVAyhE4gn
         C6rQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="evpaiYh/";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a1-20020aa794a1000000b00686b7570993sor11519339pfl.5.2023.08.16.07.56.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Aug 2023 07:56:16 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b="evpaiYh/";
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1692197776; x=1692802576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNR+2DDMQySc8psqEDhnZbBav2KTV36MZCBGyLQQO2o=;
        b=evpaiYh/kzubkZR2LEvG4VlfEB/+ESUZhQuzvrqv2FzLZUi1ZlVlbKPTl5+Y3WJ5IF
         GwP+wG31rpKCLZfDT7PYLZUoPzqFpGsQ6Mr4WKwU3ev1ygDpQX9mj4ipp2W+R09w8pU+
         h7tEu96huRYEiWlqDrz0nVEH+nu+saeNniyUWEmG0e0DAytYRi6sLQeST+uCfLeyEBnw
         6OA9jAw53g2Z1IRiT//KYq7XieIJlCUj51C62gG80/A2axYkPKvtN10wvpaPN9AbiGqe
         smVL78kfe78kZPQz8VL5RPmGFycS9NeTizVcHE0hF+xdJ7Te0ApNheyoN6FbJ1Wij0TJ
         HAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692197776; x=1692802576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNR+2DDMQySc8psqEDhnZbBav2KTV36MZCBGyLQQO2o=;
        b=l84PmpLjnHZ9lfozNH+cTMXgntf/7i6wJAAYLU8j+RtjgUqYjxoofYVYNbaXIri2T4
         jjeyO0zVlpWVnMTIAa87dxO2MNqPhb1vn5FyzzVGqfMfjsz1AoiaA0DCqinL97K+OWle
         TGymxmjwR7nR1k9o0t4pE8NAFDCbsa8dml14Sl8H77pAopNfEOmM51xBjxXcXEjJ1a0J
         JulMwIlbaotII0kfTzUBMXmtVssoHBrgXuKSIekCMTeKSF6UgrzomhPfAvIp8YpINlZm
         rUDwKBBD10Llgc9+H7A0vICe8lF7iuFfArnkL5HSyBUmp05ZyKXm4eNxYNZQDX83LTJ+
         pUdA==
X-Gm-Message-State: AOJu0YzVqTAKgvNO2yQn0GlR34bB6XqlbdhFLGU0rvwfR956b/kcTaaR
	1KhM7SORNzkyE5H98JIi8C8V4Q==
X-Google-Smtp-Source: AGHT+IHj4VBiL9fQbCA+nA6FwRS2UMbMOMWOEgPU/2w5xIqhCbB4vG5kAFwTaWFAHVek209udKZFAQ==
X-Received: by 2002:a05:6a21:998f:b0:140:d536:d435 with SMTP id ve15-20020a056a21998f00b00140d536d435mr3070477pzb.38.1692197775828;
        Wed, 16 Aug 2023 07:56:15 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id fk26-20020a056a003a9a00b0068892c40253sm1156568pfb.216.2023.08.16.07.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 07:56:15 -0700 (PDT)
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
	=?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Michael Rolnik <mrolnik@gmail.com>,
	"Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
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
	Anton Kochkov <anton.kochkov@proton.me>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v4 25/25] contrib/plugins: Add cc plugin
Date: Wed, 16 Aug 2023 23:51:46 +0900
Message-ID: <20230816145155.21049-26-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230816145155.21049-1-akihiko.odaki@daynix.com>
References: <20230816145155.21049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: bMr7zr48bROs

This demonstrates how to write a plugin in C++.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 docs/devel/tcg-plugins.rst |  8 ++++++++
 configure                  | 15 ++++++++++++---
 contrib/plugins/Makefile   |  5 +++++
 contrib/plugins/cc.cc      | 17 +++++++++++++++++
 tests/tcg/Makefile.target  |  3 +++
 5 files changed, 45 insertions(+), 3 deletions(-)
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
index 0000000000..83a5528db0
--- /dev/null
+++ b/contrib/plugins/cc.cc
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
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
