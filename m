Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3fb3581sm95891166b.88.2024.08.13.13.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 13:30:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 61C4060642;
	Tue, 13 Aug 2024 21:23:31 +0100 (BST)
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
	Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 20/21] docs/devel: update tcg-plugins page
Date: Tue, 13 Aug 2024 21:23:28 +0100
Message-Id: <20240813202329.1237572-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240813202329.1237572-1-alex.bennee@linaro.org>
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kuoIQHqJT4jI

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

Reflect recent changes on API (inline ops) and new plugins.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-Id: <20240812231945.169310-1-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/about/emulation.rst   | 49 ++++++++++++++++++++++++++++++++------
 docs/devel/tcg-plugins.rst | 13 ++++++----
 2 files changed, 50 insertions(+), 12 deletions(-)

diff --git a/docs/about/emulation.rst b/docs/about/emulation.rst
index c03033e4e9..eea1261baa 100644
--- a/docs/about/emulation.rst
+++ b/docs/about/emulation.rst
@@ -207,8 +207,8 @@ Once built a program can be run with multiple plugins loaded each with
 their own arguments::
 
   $QEMU $OTHER_QEMU_ARGS \
-      -plugin contrib/plugin/libhowvec.so,inline=on,count=hint \
-      -plugin contrib/plugin/libhotblocks.so
+      -plugin contrib/plugins/libhowvec.so,inline=on,count=hint \
+      -plugin contrib/plugins/libhotblocks.so
 
 Arguments are plugin specific and can be used to modify their
 behaviour. In this case the howvec plugin is being asked to use inline
@@ -219,6 +219,14 @@ Linux user-mode emulation also evaluates the environment variable
 
   QEMU_PLUGIN="file=contrib/plugins/libhowvec.so,inline=on,count=hint" $QEMU
 
+QEMU plugins avoid to write directly to stdin/stderr, and use the log provided
+by the API (see function ``qemu_plugin_outs``).
+To show output, you may use this additional parameter::
+
+  $QEMU $OTHER_QEMU_ARGS \
+    -d plugin \
+    -plugin contrib/plugins/libhowvec.so,inline=on,count=hint
+
 Example Plugins
 ~~~~~~~~~~~~~~~
 
@@ -260,8 +268,7 @@ Behaviour can be tweaked with the following arguments:
   * - Option
     - Description
   * - inline=true|false
-    - Use faster inline addition of a single counter. Not per-cpu and not
-      thread safe.
+    - Use faster inline addition of a single counter.
   * - idle=true|false
     - Dump the current execution stats whenever the guest vCPU idles
 
@@ -381,6 +388,15 @@ run::
   160          1      0
   135          1      0
 
+Test inline operations
+......................
+
+``tests/plugins/inline.c``
+
+This plugin is used for testing all inline operations, conditional callbacks and
+scoreboard. It prints a per-cpu summary of all events.
+
+
 Hot Blocks
 ..........
 
@@ -394,9 +410,6 @@ with linux-user execution as system emulation tends to generate
 re-translations as blocks from different programs get swapped in and
 out of system memory.
 
-If your program is single-threaded you can use the ``inline`` option for
-slightly faster (but not thread safe) counters.
-
 Example::
 
   $ qemu-aarch64 \
@@ -736,6 +749,28 @@ The plugin will log the reason of exit, for example::
 
   0xd4 reached, exiting
 
+Limit instructions per second
+.............................
+
+This plugin can limit the number of Instructions Per Second that are executed::
+
+    # get number of instructions
+    $ num_insn=$(./build/qemu-x86_64 -plugin ./build/tests/plugin/libinsn.so -d plugin /bin/true |& grep total | sed -e 's/.*: //')
+    # limit speed to execute in 10 seconds
+    $ time ./build/qemu-x86_64 -plugin ./build/contrib/plugins/libips.so,ips=$(($num_insn/10)) /bin/true
+    real 10.000s
+
+
+.. list-table:: IPS arguments
+  :widths: 20 80
+  :header-rows: 1
+
+  * - Option
+    - Description
+  * - ips=N
+    - Maximum number of instructions per cpu that can be executed in one second.
+      The plugin will sleep when the given number of instructions is reached.
+
 Other emulation features
 ------------------------
 
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index d8725c2854..9463692c41 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -61,11 +61,14 @@ translation event the plugin has an option to enumerate the
 instructions in a block of instructions and optionally register
 callbacks to some or all instructions when they are executed.
 
-There is also a facility to add an inline event where code to
-increment a counter can be directly inlined with the translation.
-Currently only a simple increment is supported. This is not atomic so
-can miss counts. If you want absolute precision you should use a
-callback which can then ensure atomicity itself.
+There is also a facility to add inline instructions doing various operations,
+like adding or storing an immediate value. It is also possible to execute a
+callback conditionally, with condition being evaluated inline. All those inline
+operations are associated to a ``scoreboard``, which is a thread-local storage
+automatically expanded when new cores/threads are created and that can be
+accessed/modified in a thread-safe way without any lock needed. Combining inline
+operations and conditional callbacks offer a more efficient way to instrument
+binaries, compared to classic callbacks.
 
 Finally when QEMU exits all the registered *atexit* callbacks are
 invoked.
-- 
2.39.2
