Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f2195a2a3sm370298966b.99.2024.06.12.08.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 08:35:09 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 784465F93D;
	Wed, 12 Jun 2024 16:35:08 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Mark Burton <mburton@qti.qualcomm.com>,
	qemu-s390x@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	kvm@vger.kernel.org,
	Laurent Vivier <lvivier@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	qemu-arm@nongnu.org,
	Alexander Graf <agraf@csgraf.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marco Liebel <mliebel@qti.qualcomm.com>,
	Thomas Huth <thuth@redhat.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	qemu-ppc@nongnu.org,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Cameron Esfahani <dirty@apple.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 3/9] plugins: Ensure register handles are not NULL
Date: Wed, 12 Jun 2024 16:35:02 +0100
Message-Id: <20240612153508.1532940-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240612153508.1532940-1-alex.bennee@linaro.org>
References: <20240612153508.1532940-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: akNMYyym1X5S

From: Akihiko Odaki <akihiko.odaki@daynix.com>

Ensure register handles are not NULL so that a plugin can assume NULL is
invalid as a register handle.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Message-Id: <20240229-null-v1-1-e716501d981e@daynix.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 plugins/api.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/plugins/api.c b/plugins/api.c
index 5a0a7f8c71..6bdb26bbe3 100644
--- a/plugins/api.c
+++ b/plugins/api.c
@@ -507,7 +507,7 @@ static GArray *create_register_handles(GArray *gdbstub_regs)
         }
 
         /* Create a record for the plugin */
-        desc.handle = GINT_TO_POINTER(grd->gdb_reg);
+        desc.handle = GINT_TO_POINTER(grd->gdb_reg + 1);
         desc.name = g_intern_string(grd->name);
         desc.feature = g_intern_string(grd->feature_name);
         g_array_append_val(find_data, desc);
@@ -528,7 +528,7 @@ int qemu_plugin_read_register(struct qemu_plugin_register *reg, GByteArray *buf)
 {
     g_assert(current_cpu);
 
-    return gdb_read_register(current_cpu, buf, GPOINTER_TO_INT(reg));
+    return gdb_read_register(current_cpu, buf, GPOINTER_TO_INT(reg) - 1);
 }
 
 struct qemu_plugin_scoreboard *qemu_plugin_scoreboard_new(size_t element_size)
-- 
2.39.2
