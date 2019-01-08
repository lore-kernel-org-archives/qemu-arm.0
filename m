Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4775399wrt;
        Tue, 8 Jan 2019 08:30:54 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5V8wbJ1/Tb4KljbD+OgC3WQFbcnc1irSNP36W/ThPWWonSAz28bm8g9JPvrwF6zfhtHvqo
X-Received: by 2002:a1c:b687:: with SMTP id g129mr2257980wmf.59.1546965054932;
        Tue, 08 Jan 2019 08:30:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546965054; cv=none;
        d=google.com; s=arc-20160816;
        b=GVRXFIjSENINUG9MElt0+L5lEP8A9q17Z6Zd+/MRpTV8JcF7+B7LRBx7A8UIZ3jDxy
         SJk81UcN8tFm7iVvQQeN9XXmksUybx+ihR2ixmlyYcGcmDsb0MXH9nbrveTffHEukxMc
         hNSyU7KFn8qDi7kRptogDOZ+4HqXOa8DSl5xIizM6UjdFka+Py+qIrjUm9+wZMkGnfij
         l5Xuy4Eoefxz0GgDHZqmqObnC218zKjvP5ODT4gOxD9A/TIwCo548fLHnrqtPtGfZKAO
         gCFaqrV/NOm1BrGC7Tsk7yFP7LPkuZ2rT4SfV0jIHhTbNLISbEfQxq6HJVIsbLYiun35
         N7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=lHw25Aq6KmkJUqEwitBkXgdSRY6pkgGYnAbHYsqk6tg=;
        b=bhx4ULEv8XlMk//DFqD+nNhtHTckwV3THq0L80fSe3IvTj00uOiyQCkDnqnx2cDJi3
         Sp5zXJvmmiXcOjPzOKy5p5dTAMEleh5AUVc24r6FNij8jwbQ3jCrTcMpu1T8RPAAs2Mz
         MkbS0ArW6aDRn3TCDsIAUgCdluyBydX2nKIK/M3ZSEjkxiBrO2KwqS6/YSN1D5zovwM6
         xgd1pdPnVKBZOT5qYH6hno9MQv5dcfCxmrT8Y3RDEKFfRaOZqoDU+2FIgJDgF2YZfyP8
         gQKzfLE3AaWmwH0feM5xAzkdJdDSLb6Ia4kAaJ2XgFbb5oGi1peqp2EYRVfRrLbXBuyr
         q6Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PFC02pyT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18si37366350wro.157.2019.01.08.08.30.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Jan 2019 08:30:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PFC02pyT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54644 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gguHD-0002zU-UD
	for alex.bennee@linaro.org; Tue, 08 Jan 2019 11:30:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gguGu-0002wD-2e
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 11:30:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gguGk-0003zC-SS
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 11:30:26 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43167)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gguGh-0003p8-31
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 11:30:20 -0500
Received: by mail-wr1-x442.google.com with SMTP id r10so4659864wrs.10
	for <qemu-arm@nongnu.org>; Tue, 08 Jan 2019 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=lHw25Aq6KmkJUqEwitBkXgdSRY6pkgGYnAbHYsqk6tg=;
	b=PFC02pyTYUTf7RVgboMHb9D890vfTPFjCqcMDUTi7873obKgsYCxfGUgXSthXTt196
	OtFBZ19j3LcARz0wiN6DK23UhPjZLNU60Zc3hpmlGejtigi1pm9xKQDQdHq+qovfwPgw
	b6kuvmHx39Agf/S49EDAMJ+gIXoTe7kAN/0TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lHw25Aq6KmkJUqEwitBkXgdSRY6pkgGYnAbHYsqk6tg=;
	b=CywBxpV39AlKTG25WiQ7e9AEGVwrHYUm82rNf3+BjTNdtI+XyUu0P1npMfvrxijRXl
	8sh/x2V6rr41/1RZzkBMpEM5qtWsZNx+kWQsy5hQIo1u+zLkK+DWbXNNgCwchwBgyPCw
	FRGF8OeoOXGQdAUM6yiGlv2EiJtTCqmuml2cr51d1h7M3VFDWJFR1Ly+67vlV/wVqVNx
	Fnzy+6wwQhvwP4zvw2gFy+u4InqkzT/Q5N5LaN31thTNCYkk/HeTW8OY3CX6Hqjze6b3
	oeEPmBrgbkfANPFFWfGB1bx0jhmD93iL031Dx8JAynKRdOlaSUGm7V9gs5Lvq6og/iMz
	f3wQ==
X-Gm-Message-State: AJcUukfF86mQ5xP7anUFitNSim/xggi19rTM34Pu3o8Q67ra+2OgviGE
	12YuUBArAMHgsp8RtGFnmOinh1vszzi5aA==
X-Received: by 2002:a5d:47d1:: with SMTP id l17mr1925630wrs.319.1546965016893; 
	Tue, 08 Jan 2019 08:30:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	x81sm11278839wmg.17.2019.01.08.08.30.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 08 Jan 2019 08:30:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  8 Jan 2019 16:30:08 +0000
Message-Id: <20190108163008.7006-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20190108163008.7006-1-peter.maydell@linaro.org>
References: <20190108163008.7006-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-arm] [PATCH 4/4] gdbstub: Simplify gdb_get_cpu_pid() to use
 cpu->cluster_index
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	"Emilio G . Cota" <cota@braap.org>, patches@linaro.org,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pTAgbEXMGcPu

Now we're keeping the cluster index in the CPUState, we don't
need to jump through hoops in gdb_get_cpu_pid() to find the
associated cluster object.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 gdbstub.c | 48 +++++-------------------------------------------
 1 file changed, 5 insertions(+), 43 deletions(-)

diff --git a/gdbstub.c b/gdbstub.c
index bfc7afb5096..5d6cbea9d35 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -644,50 +644,12 @@ static int memtox(char *buf, const char *mem, int len)
 
 static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
 {
-#ifndef CONFIG_USER_ONLY
-    gchar *path, *name = NULL;
-    Object *obj;
-    CPUClusterState *cluster;
-    uint32_t ret;
-
-    path = object_get_canonical_path(OBJECT(cpu));
-
-    if (path == NULL) {
-        /* Return the default process' PID */
-        ret = s->processes[s->process_num - 1].pid;
-        goto out;
-    }
-
-    name = object_get_canonical_path_component(OBJECT(cpu));
-    assert(name != NULL);
-
-    /*
-     * Retrieve the CPU parent path by removing the last '/' and the CPU name
-     * from the CPU canonical path.
-     */
-    path[strlen(path) - strlen(name) - 1] = '\0';
-
-    obj = object_resolve_path_type(path, TYPE_CPU_CLUSTER, NULL);
-
-    if (obj == NULL) {
-        /* Return the default process' PID */
-        ret = s->processes[s->process_num - 1].pid;
-        goto out;
-    }
-
-    cluster = CPU_CLUSTER(obj);
-    ret = cluster->cluster_id + 1;
-
-out:
-    g_free(name);
-    g_free(path);
-
-    return ret;
-
-#else
     /* TODO: In user mode, we should use the task state PID */
-    return s->processes[s->process_num - 1].pid;
-#endif
+    if (cpu->cluster_index == UNASSIGNED_CLUSTER_INDEX) {
+        /* Return the default process' PID */
+        return s->processes[s->process_num - 1].pid;
+    }
+    return cpu->cluster_index + 1;
 }
 
 static GDBProcess *gdb_get_process(const GDBState *s, uint32_t pid)
-- 
2.19.2

