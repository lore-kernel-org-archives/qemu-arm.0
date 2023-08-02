Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp207419ejb;
        Wed, 2 Aug 2023 01:50:27 -0700 (PDT)
X-Received: by 2002:a05:6a20:394d:b0:134:a4e2:4ac8 with SMTP id r13-20020a056a20394d00b00134a4e24ac8mr15911480pzg.39.1690966227290;
        Wed, 02 Aug 2023 01:50:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690966227; cv=none;
        d=google.com; s=arc-20160816;
        b=sKy4bgV6l8xf08CjcxIa9WzkYTjLx2Vivc1+BjXQGRgL5jx0NHpjzzAxUftXKo36oE
         FVd+XCR+P4h5rXkOoXopmEOV+c63KszxgQI6VpiYQk6uW1HMlvHUh6PaMXjfmSMEa5qQ
         3g80rOSVii5n47YksHusTlhm9LsWKXol/tohRWww36Z7U5Xmqkrvdy8SekKeRUOulbv/
         e0q8wxRsQI4SJ/8Q75tpkfNPVQgxZPr/wfXJBM12JU61WX2JG2jvgxXRZLWJDClADICc
         fMe0V4v+4OwZjrNPL5Z7MnoI9j17FwFikW+Qymx4WM6ht9vExgHCRX3C1PtK8Zhc4zjL
         +k5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=kNR+2DDMQySc8psqEDhnZbBav2KTV36MZCBGyLQQO2o=;
        fh=fUiTdP13jeKk8+/DO5sZ9YFnMdWUGYQSHAZ2p4VPlgw=;
        b=Jf0LGVYh5X0yiL2V2ZTTQxNW3R+TLiYFr32nT3XBrDXi72hIAF0SeSv0nIBWa+DuGe
         lYcnZfyEyQFNGvsk1zkch85I9vYxuXzKaoBLgdEWTVTN0g/x/izuqBMxWzfB93yA5l5+
         impURDPjnRmyWnm75NlWJxMs8RYN1+Jo4P0wEwcjZW+XPqwJoAY2aV5D2yGCl5pX7YVW
         sTKPqZFfJbTCEgk5xPy746mDkt+iFQpIUwLRdi26lYiUUHbmR3V5l+MJhSxiZ4kAhbrk
         1GQBigvGScoX6lrOd3teM/EmrIz+aL6KJAwWJjI2Vt0ifBhk0d/xppZOB411x6biaMkU
         qexg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=K3R00I0t;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
Return-Path: <akihiko.odaki@daynix.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u200-20020a6279d1000000b0068239a12ed6sor5529058pfc.10.2023.08.02.01.50.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 02 Aug 2023 01:50:27 -0700 (PDT)
Received-SPF: neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20221208.gappssmtp.com header.s=20221208 header.b=K3R00I0t;
       spf=neutral (google.com: 209.85.220.41 is neither permitted nor denied by best guess record for domain of akihiko.odaki@daynix.com) smtp.mailfrom=akihiko.odaki@daynix.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1690966227; x=1691571027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNR+2DDMQySc8psqEDhnZbBav2KTV36MZCBGyLQQO2o=;
        b=K3R00I0tgQEZb0otU0GHIAVYlvmecLUiB5W39EKRq4ECqfoqWkNTjCmG4zKtIpZoZh
         VfsG4KPhxENtsIe86jub6NeeRolk5LB9TLjyihIYhW2P65+56Ba8/TwltgAnhLzyA9P9
         xGPX7FvX9WUGwemYyrLWJhYPYDCKVkw0qSWaTesj1zHl1Pj4HFb3cgPWnF7Pgwpl5s8K
         NpyqMiYzhBMrobxSmC6uVYD4aF/1h/joNnykcji0hmsweV4k7Fz+ZeyYelN6HWkAxkC+
         9ZegLOJACRjnrPK/TVG0NmwyITi3ttLvQ3relVP1Erynux1YurQ01HCinx6WEZzUfsF5
         +MtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690966227; x=1691571027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNR+2DDMQySc8psqEDhnZbBav2KTV36MZCBGyLQQO2o=;
        b=c1yTCzhPSx6Jg0PtCmOkgv/m/LDjuriq26nhmVlYa1QrqTlvDF1pL4NxPn3QNhapU6
         0qP6JBO7seZEhYeQ4nqmi49h9oOOWCZunVf4x7h27Y4e60OtqRzagqTvgBIqETRdUF7s
         4XLItXZetncA36VFkoaqID/GAC38lsFRF84/xvhkKbsRloksNHOgn3PTrYZ8w3nupiID
         nA2doN6K2DHSlsvelzeZTT10t/NrorGIIGl2/h3AdrMFinTlpoRLfh+t+Lco3ge+WDBW
         +TCsE3Zh+NFPC5U4FZxYNd4y2HBRTQK0d/hwNdbFuY/eqw60o2vSQ/OU/eAjJnKfZByb
         KM2A==
X-Gm-Message-State: ABy/qLZr1+arOMmx/iUa9OEqBR4HxdpumjOAc9N+blKyctZHJ24XK04D
	gh7eZsaWn0cUVHEVxlUawozIeQ==
X-Google-Smtp-Source: APBJJlFGHdzb68i9hkzSc4thw9evgdTiFF4LBhOLeZ9K59RBAH4Gv68G5UXefQweRnrCHWCvkNy+Sw==
X-Received: by 2002:a05:6a20:840b:b0:137:514a:9835 with SMTP id c11-20020a056a20840b00b00137514a9835mr18011045pzd.9.1690966226760;
        Wed, 02 Aug 2023 01:50:26 -0700 (PDT)
Return-Path: <akihiko.odaki@daynix.com>
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
        by smtp.gmail.com with ESMTPSA id j22-20020aa79296000000b00659b8313d08sm10592860pfa.78.2023.08.02.01.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:50:26 -0700 (PDT)
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
Subject: [PATCH v2 24/24] contrib/plugins: Add cc plugin
Date: Wed,  2 Aug 2023 17:46:12 +0900
Message-ID: <20230802084614.23619-25-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802084614.23619-1-akihiko.odaki@daynix.com>
References: <20230802084614.23619-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: R5GOXCXgIYSP

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
