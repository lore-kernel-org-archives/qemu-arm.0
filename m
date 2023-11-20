Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id fc16-20020a05600c525000b004054dcbf92asm13671291wmb.20.2023.11.20.07.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 07:08:38 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 7A66665773;
	Mon, 20 Nov 2023 15:08:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-s390x@nongnu.org,
	Beraldo Leal <bleal@redhat.com>,
	qemu-arm@nongnu.org,
	devel@lists.libvirt.org,
	qemu-ppc@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Marek Vasut <marex@denx.de>,
	Thomas Huth <thuth@redhat.com>,
	Chris Wulff <crwulff@gmail.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH v2 05/14] target/nios2: Deprecate the Nios II architecture
Date: Mon, 20 Nov 2023 15:08:24 +0000
Message-Id: <20231120150833.2552739-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231120150833.2552739-1-alex.bennee@linaro.org>
References: <20231120150833.2552739-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 3Z5P/Ro28ADR

From: Philippe Mathieu-Daudé <philmd@linaro.org>

See commit 9ba1caf510 ("MAINTAINERS: Mark the Nios II CPU as orphan"),
last contribution from Chris was in 2012 [1] and Marek in 2018 [2].

[1] https://lore.kernel.org/qemu-devel/1352607539-10455-2-git-send-email-crwulff@gmail.com/
[2] https://lore.kernel.org/qemu-devel/805fc7b5-03f0-56d4-abfd-ed010d4fa769@denx.de/

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Marek Vasut <marex@denx.de>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20231117070250.32932-1-philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/about/deprecated.rst | 15 +++++++++++++++
 hw/nios2/10m50_devboard.c |  1 +
 hw/nios2/generic_nommu.c  |  1 +
 3 files changed, 17 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 6c84db90b5..2e15040246 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -236,6 +236,16 @@ it. Since all recent x86 hardware from the past >10 years is capable of the
 64-bit x86 extensions, a corresponding 64-bit OS should be used instead.
 
 
+System emulator CPUs
+--------------------
+
+Nios II CPU (since 8.2)
+'''''''''''''''''''''''
+
+The Nios II architecture is orphan. The ``nios2`` guest CPU support is
+deprecated and will be removed in a future version of QEMU.
+
+
 System emulator machines
 ------------------------
 
@@ -254,6 +264,11 @@ These old machine types are quite neglected nowadays and thus might have
 various pitfalls with regards to live migration. Use a newer machine type
 instead.
 
+Nios II ``10m50-ghrd`` and ``nios2-generic-nommu`` machines (since 8.2)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The Nios II architecture is orphan.
+
 
 Backend options
 ---------------
diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index 952a0dc33e..6cb32f777b 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -160,6 +160,7 @@ static void nios2_10m50_ghrd_class_init(ObjectClass *oc, void *data)
     mc->desc = "Altera 10M50 GHRD Nios II design";
     mc->init = nios2_10m50_ghrd_init;
     mc->is_default = true;
+    mc->deprecation_reason = "Nios II architecture is deprecated";
 
     object_class_property_add_bool(oc, "vic", get_vic, set_vic);
     object_class_property_set_description(oc, "vic",
diff --git a/hw/nios2/generic_nommu.c b/hw/nios2/generic_nommu.c
index 48edb3ae37..defa16953f 100644
--- a/hw/nios2/generic_nommu.c
+++ b/hw/nios2/generic_nommu.c
@@ -95,6 +95,7 @@ static void nios2_generic_nommu_machine_init(struct MachineClass *mc)
 {
     mc->desc = "Generic NOMMU Nios II design";
     mc->init = nios2_generic_nommu_init;
+    mc->deprecation_reason = "Nios II architecture is deprecated";
 }
 
 DEFINE_MACHINE("nios2-generic-nommu", nios2_generic_nommu_machine_init);
-- 
2.39.2
