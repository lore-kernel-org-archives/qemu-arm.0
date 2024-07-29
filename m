Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad91080sm518097066b.160.2024.07.29.07.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:44:19 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 43DE05FA11;
	Mon, 29 Jul 2024 15:44:16 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bin Meng <bmeng.cn@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-riscv@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	qemu-s390x@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	qemu-arm@nongnu.org,
	Alexandre Iooss <erdnaxe@crans.org>,
	Song Gao <gaosong@loongson.cn>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 12/14] contrib/plugins: be more vocal building
Date: Mon, 29 Jul 2024 15:44:12 +0100
Message-Id: <20240729144414.830369-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729144414.830369-1-alex.bennee@linaro.org>
References: <20240729144414.830369-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: PY3PxiE5fdgo

With the conversion to meson and removing the old QEMU Makefile
baggage we became very silent when building the plugins. Bring in a
copy of the quiet-command logic (and some magic COMMAs) so we can at
least assure developers we are building them.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2457
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
Maybe we should just move to a meson build as proposed here:

https://gitlab.com/qemu-project/qemu/-/issues/1710
---
 contrib/plugins/Makefile | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/contrib/plugins/Makefile b/contrib/plugins/Makefile
index 98a89d5c40..edf256cd9d 100644
--- a/contrib/plugins/Makefile
+++ b/contrib/plugins/Makefile
@@ -39,26 +39,41 @@ endif
 
 SONAMES := $(addsuffix $(SO_SUFFIX),$(addprefix lib,$(NAMES)))
 
-# The main QEMU uses Glib extensively so it's perfectly fine to use it
+# The main QEMU uses Glib extensively so it is perfectly fine to use it
 # in plugins (which many example do).
 PLUGIN_CFLAGS := $(shell $(PKG_CONFIG) --cflags glib-2.0)
 PLUGIN_CFLAGS += -fPIC -Wall
 PLUGIN_CFLAGS += -I$(TOP_SRC_PATH)/include/qemu
 
+# Helper that honours V=1 so we get some output when compiling
+quiet-@ = $(if $(V),,@$(if $1,printf "  %-7s %s\n" "$(strip $1)" "$(strip $2)" && ))
+quiet-command = $(call quiet-@,$2,$3)$1
+
+# for including , in command strings
+COMMA := ,
+
 all: $(SONAMES)
 
 %.o: %.c
-	$(CC) $(CFLAGS) $(PLUGIN_CFLAGS) -c -o $@ $<
+	$(call quiet-command, \
+		$(CC) $(CFLAGS) $(PLUGIN_CFLAGS) -c -o $@ $<, \
+	        BUILD, plugin $@)
 
 ifeq ($(CONFIG_WIN32),y)
 lib%$(SO_SUFFIX): %.o win32_linker.o ../../plugins/libqemu_plugin_api.a
-	$(CC) -shared -o $@ $^ $(LDLIBS)
+	$(call quiet-command, \
+		$(CC) -shared -o $@ $^ $(LDLIBS), \
+		LINK, plugin $@)
 else ifeq ($(CONFIG_DARWIN),y)
 lib%$(SO_SUFFIX): %.o
-	$(CC) -bundle -Wl,-undefined,dynamic_lookup -o $@ $^ $(LDLIBS)
+	$(call quiet-command, \
+		$(CC) -bundle -Wl$(COMMA)-undefined$(COMMA)dynamic_lookup -o $@ $^ $(LDLIBS), \
+		LINK, plugin $@)
 else
 lib%$(SO_SUFFIX): %.o
-	$(CC) -shared -o $@ $^ $(LDLIBS)
+	$(call quiet-command, \
+		$(CC) -shared -o $@ $^ $(LDLIBS), \
+		LINK, plugin $@)
 endif
 
 
-- 
2.39.2
