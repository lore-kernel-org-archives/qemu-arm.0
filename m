Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6175695wrt;
        Mon, 21 Jan 2019 07:23:07 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6GqHH188WvsO9XcyYjnXhQjGKu17o5XdlEh6/WFZQlnwEoeBeYk8nx38kYCwAoap5csYBX
X-Received: by 2002:adf:a211:: with SMTP id p17mr28654493wra.179.1548084187697;
        Mon, 21 Jan 2019 07:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548084187; cv=none;
        d=google.com; s=arc-20160816;
        b=hi6oAKmaulKFTmXdKgLF8i43zXwVB23/bUf8rtzXc+l9ailrn2zCJkSkHhje5u0DSK
         WqzBBkGxlTI2cu5s4+utqBn2ZAUj34f4k+n5i8/6Q97bpN2F6qvBVneoC6KHlIutgOq5
         vCrSIs1HXGdiTcxvd6a2CKc0rOMFzo/SXipIx0H0xpwqtqBrwXsyoI9WFlC1fcqF5O0V
         cbMUTGZgPNjYtamK5JmOrndGY1v255TXk3RyzsY3kmwPDkiePi7T4I6/lnoeGy1CLgb7
         fg+PmBdo4H2b7ilDaZPwmL8vsYBId4SVFqNsermgNIzqNv04CqniuUu9SRLrNUoAyuBn
         LtOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=z6np4aEV6kepum56jAKTLhBF7tWQywONgDj9IEtWngY=;
        b=t9/8O2JuyGaI0xDuyVrZTrGQ2te+bzo3eMYoy8cW67dAtvdWrN5m0Der48UCuQdzHQ
         dO067PBlCyyyB5RUoMrc9ThBoAS3Pw7u9xXoZNec6sG2VDaCzZ6NOONXYc4B3UiPwxpM
         MjWMBQmdtgSGzzRNWKcaXI1+54lgqkA9WNcAcbOVhZlQ5cR652pcS9W8nG/ZRKFMgaxA
         BS9GyEBT2e7GXOlSn/xxevB6Rk3WJd58IcQesHoZSsaaTppzTWM98Yjr7Bbb7SjEBbeo
         yQOnFa+uYlo+DThWCrlYi7iyEJPcaJa4RZFIOO6eEkCKdYGJTTQDT4mSjikb2dQ+8otP
         qnRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EgXS8CKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si572877wrd.235.2019.01.21.07.23.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 21 Jan 2019 07:23:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EgXS8CKC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:55167 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1glbPm-0008EA-MU
	for alex.bennee@linaro.org; Mon, 21 Jan 2019 10:23:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glbPK-00080J-UX
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 10:22:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1glbPH-0003vK-5X
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 10:22:37 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:36839)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1glbPF-0003sG-M1
	for qemu-arm@nongnu.org; Mon, 21 Jan 2019 10:22:35 -0500
Received: by mail-wm1-x343.google.com with SMTP id p6so11162809wmc.1
	for <qemu-arm@nongnu.org>; Mon, 21 Jan 2019 07:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=z6np4aEV6kepum56jAKTLhBF7tWQywONgDj9IEtWngY=;
	b=EgXS8CKCfBSjXbi0wQozZG6omguld7mMH7t3HaXqQ9K7h8aZACJMounSwi5WfGf63K
	8sgtuF47yd6NvgPjn0USJZFHtb+cwDuZBDj4rMtOJqyuZwagJde1bQ7F97hUDSQKHBZj
	+UvoGRD/+iO2KxkDsCr+Atrd/KwS/N8N7GXNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z6np4aEV6kepum56jAKTLhBF7tWQywONgDj9IEtWngY=;
	b=DcvjSv9+zjPMA3YW/aSCSiV8HFW2+89x9hkSpanrjQbOgJIYVGH4yUFhJ9U8FSObxC
	DyqqnisA+Xw86YvtRQ2f4AVegxLd760yBBHZbwBapl1a9hTRNR5w6tGLJ56aVHuJKSei
	bGtFqDPA/o1xpsekRnDisIStHrSXrKOrPO0prj99Rm6wf6QI+X9d5ICS1r9rhRCVE4wb
	EarfJexuQiRx660KufzQpsjxlEt32tXSUvW/JgJ70xZaub2xbHpFQHqWUKcFt19SYFih
	X3D6aLxCBRhxlPSqrbdhu2MYategm7yK4YvBQ1lLsDudoqEr3nwZ+Cqa6+CBYUmhxshr
	wlCQ==
X-Gm-Message-State: AJcUukdBi1IdCQOX0f6c7F5hBq3QyDQaaxjdhbn/vCbUMHOlQ39BuF7x
	0rBth0eWU+7JBuZid0/toBNbGiCCa4sBog==
X-Received: by 2002:a1c:a00f:: with SMTP id j15mr24001656wme.84.1548084147814; 
	Mon, 21 Jan 2019 07:22:27 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	o16sm128900134wrn.11.2019.01.21.07.22.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 21 Jan 2019 07:22:26 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon, 21 Jan 2019 15:22:18 +0000
Message-Id: <20190121152218.9592-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190121152218.9592-1-peter.maydell@linaro.org>
References: <20190121152218.9592-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::343
Subject: [Qemu-arm] [PATCH v3 4/4] gdbstub: Simplify gdb_get_cpu_pid() to
 use cpu->cluster_index
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
	"Emilio G . Cota" <cota@braap.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ASUe0YXNQ/aK

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

