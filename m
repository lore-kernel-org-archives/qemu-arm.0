Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp919106lfb;
        Wed, 30 Mar 2022 05:56:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxoAqQK+W51OT1Kgy8fWrag103RsSHtJ7kUTWP3PKUXaa/Oq6FzeGZ9wNFiAP9v18tTg9v/
X-Received: by 2002:a05:6000:10cf:b0:203:d8da:129c with SMTP id b15-20020a05600010cf00b00203d8da129cmr35367419wrx.300.1648645009577;
        Wed, 30 Mar 2022 05:56:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648645009; cv=none;
        d=google.com; s=arc-20160816;
        b=zl3XEeouh/TtHU2LVXBvg80cddAXAgn6nTESJ3KV9DAIuXssxwWO/ymNnzNQdt/VKj
         5iTkx5NumIp/AvXSOfTDYYFtwCdTBuN1JA3h34LKQE0thKA6L52LOS6E7GHBjmyDneUY
         si/MKyZmC0bPJrlR7+aaUEkzzL7D8nkW9WFFWLe4xgbarduR2KJoa3bjWZJkBx66Ukv4
         L54Wb6dn7cxsFZ3HtO/Xmj1qa9QVKHo7PM4DzyVxFteCsL7L3j9efr8gKes2NOTcDk/w
         2gN2XY/SJJ9F8rooR3RvUDt2NSuq4xGI0MP2fKY8iIBiNKhWIrNNQsuiQfbTDetw+1Cm
         eC6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tNtuXMP17Wp2ohzLpSDIDcwKal0f30KwuZn+3sGkw34=;
        b=lErFN9X3bf74UYYbR2waTOnSBIrL+bmrfuNesrtqoLATU1Bf/NYQ5z3ASjfW5c6gnb
         32pwn8KLfUQfceoqr+3mtWIm2QDTCNhlHOYQU119UbOKQ+mlP2Hg4Zrhjgu2JVLJlwi9
         irowsKfAeTt9RFlWvb7c9imYMP5teUncyJECXjtCCiSSh3gPIQzED37osCkiO8oKlfnE
         XNAc2wcG7c9zOLpCsVFUoQcXrDis7f1a/l7s1lvGsREMoCV3T0NRs6VQfzffymBpNcKU
         sN2HYnRm90rHM328QgN1wN/0diBV5kKss9Lu5AgTxpXsY8mKJJBS/bzwRX9KS4w+PDVD
         pL8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=j7cNcWes;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Return-Path: <damien.hedde@greensocs.com>
Received: from beetle.greensocs.com (beetle.greensocs.com. [5.135.226.135])
        by mx.google.com with ESMTPS id n28-20020adf8b1c000000b00205c900b31bsi9743093wra.900.2022.03.30.05.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 05:56:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) client-ip=5.135.226.135;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@greensocs.com header.s=mail header.b=j7cNcWes;
       spf=pass (google.com: domain of damien.hedde@greensocs.com designates 5.135.226.135 as permitted sender) smtp.mailfrom=damien.hedde@greensocs.com
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPS id 6340A21EBE;
	Wed, 30 Mar 2022 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1648645008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tNtuXMP17Wp2ohzLpSDIDcwKal0f30KwuZn+3sGkw34=;
	b=j7cNcWesJw3SwK0OSEqzP8OfWQAuxuBd6W2/1/Rk8xGxye2b2yaVZOjCHsEoQ9z14lCWkB
	ynCy4HfV+8QFG6eAcNDaxePQUM0s95UNZBsnx0cz9DugP8X9z5/a2rHAPSToM8/Y9j5C2F
	Gzvgk3pyIhXFdTmKyq7mevp125SKAiE=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Cc: mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Vijai Kumar K <vijai@behindbytes.com>,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC PATCH 05/18] gdbstub: deal with _cpus_ object instead of _cpu-cluster_
Date: Wed, 30 Mar 2022 14:56:26 +0200
Message-Id: <20220330125639.201937-6-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330125639.201937-1-damien.hedde@greensocs.com>
References: <20220330125639.201937-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
X-TUID: AepFr3B9EsyH

The gdbstub will only handle _cpus_ object having set
the _is_cluster_ flag.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 gdbstub.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index c8375e3c3f..0b3e943f95 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -38,7 +38,7 @@
 #include "monitor/monitor.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
-#include "hw/cpu/cluster.h"
+#include "hw/cpu/cpus.h"
 #include "hw/boards.h"
 #endif
 
@@ -3458,9 +3458,10 @@ static const TypeInfo char_gdb_type_info = {
 
 static int find_cpu_clusters(Object *child, void *opaque)
 {
-    if (object_dynamic_cast(child, TYPE_CPU_CLUSTER)) {
+    if (object_dynamic_cast(child, TYPE_CPUS) &&
+        CPUS(child)->is_cluster) {
         GDBState *s = (GDBState *) opaque;
-        CPUClusterState *cluster = CPU_CLUSTER(child);
+        CpusState *cluster = CPUS(child);
         GDBProcess *process;
 
         s->processes = g_renew(GDBProcess, s->processes, ++s->process_num);
@@ -3472,8 +3473,9 @@ static int find_cpu_clusters(Object *child, void *opaque)
          * runtime, we enforce here that the machine does not use a cluster ID
          * that would lead to PID 0.
          */
-        assert(cluster->cluster_id != UINT32_MAX);
-        process->pid = cluster->cluster_id + 1;
+        assert(cluster->cluster_index >= 0 &&
+               cluster->cluster_index < UINT32_MAX);
+        process->pid = cluster->cluster_index + 1;
         process->attached = false;
         process->target_xml[0] = '\0';
 
-- 
2.35.1
