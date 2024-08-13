Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c750ec0bsm151656175e9.15.2024.08.13.13.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 13:23:34 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id D18D85F959;
	Tue, 13 Aug 2024 21:23:29 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
	Michael Roth <michael.roth@amd.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Weiwei Li <liwei1518@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Eric Auger <eric.auger@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org,
	Peter Xu <peterx@redhat.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Eric Blake <eblake@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	John Snow <jsnow@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Cleber Rosa <crosa@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Jason Wang <jasowang@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Gustavo Romero <gustavo.romero@linaro.org>
Subject: [PATCH v2 05/21] configure: Fix GDB version detection for GDB_HAS_MTE
Date: Tue, 13 Aug 2024 21:23:13 +0100
Message-Id: <20240813202329.1237572-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240813202329.1237572-1-alex.bennee@linaro.org>
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: MBPXFrQe6ONO

From: Gustavo Romero <gustavo.romero@linaro.org>

The test gdbstub/test-mte.py requires a GDB version that supports the
qIsAddressTagged packet. According to GDB NEWS [0], this packet was
first made available in the GDB 15.1 release, not in 15.0, so this
commit fixes it in configure.

[0] https://www.sourceware.org/gdb/news/

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2477
Message-Id: <20240804161850.2646299-4-gustavo.romero@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20240807114059.2339021-6-alex.bennee@linaro.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 97de85d710..d08b71f14b 100755
--- a/configure
+++ b/configure
@@ -1675,7 +1675,7 @@ for target in $target_list; do
           echo "GDB=$gdb_bin" >> $config_target_mak
       fi
 
-      if test "${gdb_arches#*aarch64}" != "$gdb_arches" && version_ge $gdb_version 15.0; then
+      if test "${gdb_arches#*aarch64}" != "$gdb_arches" && version_ge $gdb_version 15.1; then
           echo "GDB_HAS_MTE=y" >> $config_target_mak
       fi
 
-- 
2.39.2
