Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id s83sm3294855wms.16.2021.04.28.03.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 03:18:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 343B41FF8C;
	Wed, 28 Apr 2021 11:18:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvm@vger.kernel.org
Cc: shashi.mallela@linaro.org,
	alexandru.elisei@arm.com,
	eric.auger@redhat.com,
	qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v1 2/4] scripts/arch-run: don't use deprecated server/nowait options
Date: Wed, 28 Apr 2021 11:18:42 +0100
Message-Id: <20210428101844.22656-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210428101844.22656-1-alex.bennee@linaro.org>
References: <20210428101844.22656-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: NK+GwsQVfPu+

The very fact that QEMU drops the deprecation warning while running is
enough to confuse the its-migration test into failing. The boolean
options server and wait have accepted the long form options for a long
time.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/arch-run.bash | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 5997e38..70693f2 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -122,14 +122,14 @@ run_migration ()
 	trap 'kill 0; exit 2' INT TERM
 	trap 'rm -f ${migout1} ${migsock} ${qmp1} ${qmp2} ${fifo}' RETURN EXIT
 
-	eval "$@" -chardev socket,id=mon1,path=${qmp1},server,nowait \
+	eval "$@" -chardev socket,id=mon1,path=${qmp1},server=on,wait=off \
 		-mon chardev=mon1,mode=control | tee ${migout1} &
 
 	# We have to use cat to open the named FIFO, because named FIFO's, unlike
 	# pipes, will block on open() until the other end is also opened, and that
 	# totally breaks QEMU...
 	mkfifo ${fifo}
-	eval "$@" -chardev socket,id=mon2,path=${qmp2},server,nowait \
+	eval "$@" -chardev socket,id=mon2,path=${qmp2},server=on,wait=off \
 		-mon chardev=mon2,mode=control -incoming unix:${migsock} < <(cat ${fifo}) &
 	incoming_pid=`jobs -l %+ | awk '{print$2}'`
 
-- 
2.20.1
