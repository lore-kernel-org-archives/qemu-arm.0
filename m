Received: by 10.223.197.9 with SMTP id q9csp201892wrf;
        Fri, 6 Oct 2017 16:57:44 -0700 (PDT)
X-Received: by 10.55.103.138 with SMTP id b132mr760992qkc.50.1507334264292;
        Fri, 06 Oct 2017 16:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507334264; cv=none;
        d=google.com; s=arc-20160816;
        b=dWhQOlb76HFq5AhUNtYid+L4zfa5foOw7t8qdtsxPZzVZB/uIy/a25hQmdPHqoYHpf
         FwQ9fiT4Ta3/KR2gQ0YfC63HGKgUeO40QihrH7t6pbdGgpNdS8+h3Aph/1hJf57kumPH
         ajZCkDFHHafGKB7jhvkMvk/5b3nuXcC1FC8uJO8ZsRAQyXohSqM55Q5db6vqKmL167Cr
         TS0Yz9fbn3IYtnqBu/g4EuXEZKk9QNeveEH/OLCY2ctRNmTKPTFyIxUpsDxM3sEjBw2a
         1Z48j46zZCKmoRPZyOgnyj5wbAKDkBNAn2JTlhxOEabsl59kyzZ3YWojE6NHmdOO9yO2
         Ka2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=Lpf/nxAWo+r73VINyBQS1FQePxjTqVmUzHvLbqsm23w=;
        b=I4VndsLxU6tOjMK9RiHkffdFyY0tjeescSboyMyfQdYQa8CfCxKn4DQx7nSllv/kG6
         sMsQMWa4uQZHfKETb730EDLyPxw844CiQU00TsHs79KOTmuiwg6WGTh2tA424R6Cckzz
         zAcH+R1SGKqjiiSYFD4Xe8iot2uWfqjjpgmeoHRn5z5bjaFyArmX0Wk/vkJ1PBHYNhW1
         ri/vM6lwYg7pVWz2WNzgkZ7sci7UwvZWOu7SIFUtHJJPuk06WJCF94oeRWncapT+CAu1
         ciw+Qk+OyV+sLzYj5okGKMmJIzb2eQGqnAdwSCw0NfBT4pp7gSsfT6uSpgXfhbmoP4z1
         xk5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PjYM1ZxO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p34si2180913qtg.223.2017.10.06.16.57.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Oct 2017 16:57:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PjYM1ZxO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e0cUx-0004PD-Ma
	for alex.bennee@linaro.org; Fri, 06 Oct 2017 19:57:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOT-0006zc-0n
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 19:51:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cOS-0004ot-8G
	for qemu-arm@nongnu.org; Fri, 06 Oct 2017 19:51:01 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36726)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cON-0004n1-TX; Fri, 06 Oct 2017 19:50:55 -0400
Received: by mail-qk0-x241.google.com with SMTP id z14so12858946qkg.3;
	Fri, 06 Oct 2017 16:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Lpf/nxAWo+r73VINyBQS1FQePxjTqVmUzHvLbqsm23w=;
	b=PjYM1ZxOOyDOnn00a2sE5fGX/oCAFQXGDcGTw6jG0+7GQ+DMajSlTcIDyQZn4pvHfA
	Zd/WGhHJl3akqpVBmsx5hGknWIEJ8iKGGwK8UXKaVxPim6tfiz04dNPS3XGjx2qbE5pL
	7E2vCs6hGofJYjs/zLcVpgD5cVGRXm3Jp/PuC9P/fuycOJASGThkv1eeNi30pC5uxVy4
	ut0FQQlgb45C0Le/FfFgivEqKncS6rKuFrFWp3joljzdJnPEKhG3mQMngYFYk1F21qJ9
	u9LNrl5mmQd1oQXT0UsNerSES3p1spTNqtfuoeehexQGzDf/5f8ZhhIsV6rxyCqGlWDz
	dUCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Lpf/nxAWo+r73VINyBQS1FQePxjTqVmUzHvLbqsm23w=;
	b=khufsrTCwlhoSlwi2lT9eCMqxnBqSkt8iG62j9H3FzmYfZkfCLERVVsrZZgbFNS0pm
	YWR8B6oaphrvpxIiAqpiqvhupOva+C2d69js/ZQHPGRbfNiZtRfYUjQLmaJoO2KO76ZJ
	Jgc1M6sgC4ygdvQ/y3qeDdsas/cmGT16t8BZhpwjbiI4SWLvsz52sNY/PxwCfnkWts9o
	CX5gGe8EgEBP4Sfn1+TsThkT3Lo8b+VAazWXrnEhvG3xJ8RGyUrGH4xqPpZfHN7c17Xe
	sKzt5ZFvyW70iglynG6rZj6vspJY4lKdygvSCv1egoyasZ5YyOMhQ5ZqzaFsObpZ6Arm
	pbGA==
X-Gm-Message-State: AMCzsaUH1y/OZLl70KYHj7o40gVTfKcLa75dJ0YVJkRaVjXR82fVIW/v
	UYUFITvTfLcR8XsUVDWkANo=
X-Google-Smtp-Source: AOwi7QCEQoHy5fYKpUpThsxUMpnJfNx1eTkEE9tIKgOcngv6zSszD9r4R9wDZi3nBujJWcJucYQn0Q==
X-Received: by 10.55.6.149 with SMTP id 143mr666076qkg.231.1507333855326;
	Fri, 06 Oct 2017 16:50:55 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.50.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:50:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  6 Oct 2017 20:49:01 -0300
Message-Id: <20171006235023.11952-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-arm] [PATCH 06/88] ARM: use g_new() family of functions
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu trival <qemu-trivial@nongnu.org>,
	qemu-devel@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bgV4pg7HIqtK

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: added hw/arm/virt-acpi-build.c and target/arm/helper.c]
---
 hw/arm/virt-acpi-build.c | 2 +-
 hw/timer/arm_timer.c     | 2 +-
 target/arm/helper.c      | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 3d78ff68e6..812c3c3f5b 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -869,7 +869,7 @@ void virt_acpi_setup(VirtMachineState *vms)
         return;
     }
 
-    build_state = g_malloc0(sizeof *build_state);
+    build_state = g_new0(AcpiBuildState, 1);
 
     acpi_build_tables_init(&tables);
     virt_acpi_build(vms, &tables);
diff --git a/hw/timer/arm_timer.c b/hw/timer/arm_timer.c
index 98fddd7ac1..75affcb8a6 100644
--- a/hw/timer/arm_timer.c
+++ b/hw/timer/arm_timer.c
@@ -166,7 +166,7 @@ static arm_timer_state *arm_timer_init(uint32_t freq)
     arm_timer_state *s;
     QEMUBH *bh;
 
-    s = (arm_timer_state *)g_malloc0(sizeof(arm_timer_state));
+    s = g_new0(arm_timer_state, 1);
     s->freq = freq;
     s->control = TIMER_CTRL_IE;
 
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 1d689f00b3..b320772cc6 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5333,12 +5333,12 @@ static void arm_cpu_add_definition(gpointer data, gpointer user_data)
     const char *typename;
 
     typename = object_class_get_name(oc);
-    info = g_malloc0(sizeof(*info));
+    info = g_new0(CpuDefinitionInfo, 1);
     info->name = g_strndup(typename,
                            strlen(typename) - strlen("-" TYPE_ARM_CPU));
     info->q_typename = g_strdup(typename);
 
-    entry = g_malloc0(sizeof(*entry));
+    entry = g_new0(CpuDefinitionInfoList, 1);
     entry->value = info;
     entry->next = *cpu_list;
     *cpu_list = entry;
-- 
2.14.2

