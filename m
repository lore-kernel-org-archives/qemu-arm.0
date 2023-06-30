Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id y5-20020a05600c364500b003fbc9d178a8sm1192326wmq.4.2023.06.30.11.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 11:04:26 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8BF481FFC1;
	Fri, 30 Jun 2023 19:04:24 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Thomas Huth <thuth@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Bin Meng <bmeng.cn@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Bandan Das <bsd@redhat.com>,
	Cleber Rosa <crosa@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org,
	Darren Kenny <darren.kenny@oracle.com>,
	Alexander Bulekov <alxndr@bu.edu>
Subject: [PATCH v4 06/38] qemu-keymap: properly check return from xkb_keymap_mod_get_index
Date: Fri, 30 Jun 2023 19:03:51 +0100
Message-Id: <20230630180423.558337-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630180423.558337-1-alex.bennee@linaro.org>
References: <20230630180423.558337-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 5epfD23kw/a6

We can return XKB_MOD_INVALID for AltGr which rightly gets flagged by
sanitisers as an overly wide shift attempt. Properly check the return
type and leave the bitmap as zero in that case. Tested output before
and after is unchanged with the gb and ara keymaps.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 qemu-keymap.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/qemu-keymap.c b/qemu-keymap.c
index 229866e004..8c80f7a4ed 100644
--- a/qemu-keymap.c
+++ b/qemu-keymap.c
@@ -140,6 +140,18 @@ static void usage(FILE *out)
             names.options ?: "-");
 }
 
+static xkb_mod_mask_t get_mod(struct xkb_keymap *map, const char *name)
+{
+    xkb_mod_index_t mod;
+    xkb_mod_mask_t mask = 0;
+
+    mod = xkb_keymap_mod_get_index(map, name);
+    if (mod != XKB_MOD_INVALID) {
+        mask = (1 << mod);
+    }
+    return mask;
+}
+
 int main(int argc, char *argv[])
 {
     struct xkb_context *ctx;
@@ -215,14 +227,10 @@ int main(int argc, char *argv[])
                 mod, xkb_keymap_mod_get_name(map, mod));
     }
 
-    mod = xkb_keymap_mod_get_index(map, "Shift");
-    shift = (1 << mod);
-    mod = xkb_keymap_mod_get_index(map, "Control");
-    ctrl = (1 << mod);
-    mod = xkb_keymap_mod_get_index(map, "AltGr");
-    altgr = (1 << mod);
-    mod = xkb_keymap_mod_get_index(map, "NumLock");
-    numlock = (1 << mod);
+    shift = get_mod(map, "Shift");
+    ctrl = get_mod(map, "Control");
+    altgr = get_mod(map, "AltGr");
+    numlock = get_mod(map, "NumLock");
 
     state = xkb_state_new(map);
     xkb_keymap_key_for_each(map, walk_map, state);
-- 
2.39.2
