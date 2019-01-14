Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2953137wrt;
        Mon, 14 Jan 2019 03:57:19 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6FXqTYlEFd+tt0C5A2n2P6+dQ6u+kp4/wogUvpUswvJ8DOnR3zc8Uw3TPRNA0NvXG3NMwm
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr12327157wmk.44.1547467039291;
        Mon, 14 Jan 2019 03:57:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547467039; cv=none;
        d=google.com; s=arc-20160816;
        b=awI6S+A1BADTnFWwDg6QrWIaxXg1mALUZpbcs/g6pSe8Wgenx2kcYBrfkHODDGd9kb
         knmH0MOIoR7J3P/wkr2tJtSei/iwmubsSPqSh/jg8ikZwhsV828T14fLWYQBy6L6SCYn
         elNY09tOQXDJjT6xucW52nYbxpCpFydL/D0TBJ4XdxGuWiQG+baKENebV+h/Wtj0QlQ+
         qay1BuzUegbFeUaSJEapdaiZM1zw4lJvhc0eXEqgGxGI4xPRPQy17FmFFo8a2KM3aFuJ
         tbQkaUpGHEiDEvHaG0aMrmiWTT1nvwTmpvfBJY3viUXAeKCO1hvEb9+Pkb8KTww887RR
         I3hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=z6np4aEV6kepum56jAKTLhBF7tWQywONgDj9IEtWngY=;
        b=yA5ywD8aMjsgkp6tZ9FMEZhmuayHnUAg88lWqEZ/W72UjAryFIo40GKZaNrunlRS8f
         PT1N2g/h/mzbx63keGQj6GsF/5VPAL0Qi3XdRjwpbgvxt5LEIRYCWg77U9/47j9LHsKx
         5Zp2RgeNnclZcWqkq4V9SNTkBHZ12g4OseDjbgoXpHKs4AL5zw7NkEocYGLGhligLe5q
         v7FNsWB7kZbcV564FqUyrIdJBQCoEugRhOPATj96W1kEh2K7JtIrrO2LzlPd4MHsnAac
         +bz3UVlaZTGHKd8OdFL8innbY4lfdWSjND9UbGVZA4S5Q4AfLR4aOikfgP33JZZHA9F5
         sc1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="j/ASMQEz";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d14si53528321wrg.151.2019.01.14.03.57.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 03:57:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="j/ASMQEz";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gj0rm-0006a2-B0
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 06:57:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47208)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gj0rI-0006YB-MA
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 06:56:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gj0rH-0005sE-9R
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 06:56:48 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42483)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gj0rH-0005rM-12
	for qemu-devel@nongnu.org; Mon, 14 Jan 2019 06:56:47 -0500
Received: by mail-wr1-x441.google.com with SMTP id q18so22473904wrx.9
	for <qemu-devel@nongnu.org>; Mon, 14 Jan 2019 03:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=z6np4aEV6kepum56jAKTLhBF7tWQywONgDj9IEtWngY=;
	b=j/ASMQEzYA/KqX2bLdRQVPbBv5RgluLJ+2ygfaJhmGoHogIMOg4Y25Pp5MjLwO3sng
	1dF+C4IF5MrWuPRCt6O/E2RRlpwIt75HmsU8ZI/Q5q5rlD1dMM4qmteBypTCLWMWncfz
	q/WTpTODNVY1AeHH6b+DuGEdnJoWPJtnDW/v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z6np4aEV6kepum56jAKTLhBF7tWQywONgDj9IEtWngY=;
	b=AMtzHWL/JeTj6Nibi+hfyssFWFhpBebtMqC1eIWhbG3SqqdC5LG1QhOIB9uye76ImB
	FZFUZgQYXpYczwyD8d8JAWj0iFppzytJTgd0hAFsAI+SRaUQwH6RWsq53x1VgtzcR9XM
	3aOGHx4OGifJTGIgszEFL0puYl2g/pmDG+a5Ob+v6WhN34lRgL6j1j65PAa7564i83y0
	km/0D2LuFzk/U/MEzyOfxW95yVnfzFuB3RL29+7sS2hLc1SffUe1tQLVWlO6WxylNwdi
	FLXN+qAJ2YMW0vSrfM8xQ+A/JjXr1eVIADP50dlHA7BCWTQty8Q/A1Ri49vq62nScn7g
	fWcg==
X-Gm-Message-State: AJcUukc0E8hRol9LEyLIrF2+OXAUwOQm0Vxub5duNlpkpkdt5tHiIaVh
	IJHVspuNX1d2cbCgpTA0bsZGsX14SY2Kwg==
X-Received: by 2002:adf:8464:: with SMTP id 91mr25199030wrf.251.1547467006185; 
	Mon, 14 Jan 2019 03:56:46 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	125sm47835842wmm.26.2019.01.14.03.56.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Jan 2019 03:56:45 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 14 Jan 2019 11:56:37 +0000
Message-Id: <20190114115637.6335-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114115637.6335-1-peter.maydell@linaro.org>
References: <20190114115637.6335-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-devel] [PATCH v2 4/4] gdbstub: Simplify gdb_get_cpu_pid() to
 use cpu->cluster_index
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Emilio G . Cota" <cota@braap.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 73IkANURHeVE

Now we're keeping the cluster index in the CPUState, we don't
need to jump through hoops in gdb_get_cpu_pid() to find the
associated cluster object.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc.michel@greensocs.com>
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
2.20.1

