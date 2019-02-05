Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4749830wrt;
        Tue, 5 Feb 2019 05:12:13 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZT/jqcwOLXKT+PUlFA7b6IXNovYlVPpHlZQ3AX4SheIosqZuH9mlFQ4WL9DyGM1WRImUIH
X-Received: by 2002:a81:1d44:: with SMTP id d65mr3787227ywd.483.1549372332919;
        Tue, 05 Feb 2019 05:12:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549372332; cv=none;
        d=google.com; s=arc-20160816;
        b=psUWxrs/M5demMg3wJ4AdvogvwiCQAK/4vRB9BRNy3UGwclC8OPpqmD4DqXKIqbFnK
         wkkwAnruHVaaEcRQczpDIxQ0MPw3YVaOINH9zEn7BucoUSY8dcOCWoAN6+Btg0yF831O
         Nr9ACeK+fUSLCfDKc2YwP1CinrG/qR+pfzDlR/zIgd1PKbqESpFVF+avCIUv/yKzsP1r
         G/2StnHs5pv75m11hSk3T40OLudw0rl3201usjhZBhW2BW6GYiN0IMd5yT4OM7IrG9IC
         Lv/vpatWvdI8Ylj4mDDtTfrPUDoWSPnZA5x1t74flQrtcczfIw0CAlpdoE4VJt2cB9Hq
         Tnvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=/COij+HqIbuzAX2r3IzTxklYcNCrWO1w2L9goghvmgo=;
        b=U0wU2kliv689ZCZlR2er1Hg3UpTm8VHurmuNHfmSq+8MUJLI06AHZUOYy11G085eoZ
         oul2AboKddaU6cY9tRr+cB8mviOtKid3oXFfiJyaR+D44qN1mIvGsn/nZHa4OZHQG8eB
         XyP4Yc0P9eBokoTaWLJ+v+p1nJ2olf/Rb6txXSfR+P0IvO/D8BlzeMor6JUBnvodD2Ln
         ycEax3ygqD3VfDsk7wH+J+slVcRdWWhy/hTNIwH7Kcg+5Q6jW2bBevKsC8BGyiorLFEr
         zqJEp0nOHhGGZmrnr7UJNj60Tke49MrQ+7KQ6AFbtYcPpCiiYMlX8j9sruFY7PObhHXb
         zDsg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125si1853679ywb.65.2019.02.05.05.12.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 05:12:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60099 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr0WK-0003YJ-8S
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 08:12:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gr0Vo-000336-5V
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 08:11:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gr0JU-0005SR-09
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 07:58:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48188)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gr0JS-0005RA-UZ; Tue, 05 Feb 2019 07:58:55 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0B89BC01DDFB;
	Tue,  5 Feb 2019 12:58:53 +0000 (UTC)
Received: from thuth.com (ovpn-116-166.ams2.redhat.com [10.36.116.166])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D2D696EE6B;
	Tue,  5 Feb 2019 12:58:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
Date: Tue,  5 Feb 2019 13:58:45 +0100
Message-Id: <1549371525-29899-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 05 Feb 2019 12:58:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH] hw/cpu/cluster: Mark the cpu-cluster device
 with user_creatable = false
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
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Alistair Francis <alistair.francis@wdc.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lRu1mWoNtbW4

The device can not be instantiated by the user and QEMU currently
aborts when you try to use it:

$ x86_64-softmmu/qemu-system-x86_64 -device cpu-cluster
qemu-system-x86_64: hw/cpu/cluster.c:73: cpu_cluster_realize:
 Assertion `cbdata.cpu_count > 0' failed.
Aborted (core dumped)

Since this is an internal device only, mark it with user_creatable = false.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/cpu/cluster.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
index 25f9070..6f5f037 100644
--- a/hw/cpu/cluster.c
+++ b/hw/cpu/cluster.c
@@ -79,6 +79,9 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
 
     dc->props = cpu_cluster_properties;
     dc->realize = cpu_cluster_realize;
+
+    /* This is not directly for users, CPU children must be attached by code */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo cpu_cluster_type_info = {
-- 
1.8.3.1

