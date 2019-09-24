Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4339252wrp;
        Tue, 24 Sep 2019 13:12:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzq77PTFVG7kszpmMyNqVffJzsDEIKSJigeth5Egz54Hkibv46Z48a9B/ixBoaEB8CgdWCn
X-Received: by 2002:a05:6000:a:: with SMTP id h10mr4444029wrx.226.1569355954024;
        Tue, 24 Sep 2019 13:12:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569355954; cv=none;
        d=google.com; s=arc-20160816;
        b=eLzKG5cQ8QYFSH49uvode3zUtD2/icMoVaa4Lf78iARHbHop6C48f4GEvhzg/laNWf
         vxhJDTO/yAahnqfD+whdd8pKS88CokBgyCpXSD93Ft8KCwD8ppve/tEmEVdaqxgseg9q
         8hT9yLXiXQgGaJCpkUI6rVifkkXD0T4tM229MAGQUu0bH+azbHreUOTC1jIPHQZ0nRZK
         N35cHbyaXSb8d9GRa3+GyLhNNG4KhywzZS1aNP4U2xMnf9uNRcPU0bcGTZICKYcppMfU
         eQ/6MVgQU9GnLUX3tSuLSvPeqQuKMQ0WPIy1weX9Xn2y0+TNbTnOPEzjIU/uexQOfuil
         K5Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=jYMiNK9D9StbbW1X0JkbunQPse+ubAiAYatE++JxwzI=;
        b=vR57o6PD9PJqhwFJUs4TlLs9GMUQG3PXg/QVFYvkAlXTyFtvFEWYBA7BdrSmTa/Fqf
         lAqq4pj7cggSjWKTnKlADSLu4iAh9VtbWM3ti6tKVg6wudWLQlvyHaAgF4cV8gmTaHJZ
         q7V1l+RB0Sfe6WXV/Rf032Ha9cal9GwYH+IDiMvLzaDiCMVpEowgzGInJi3sablnAFK2
         BtzRVaipLIKoeQP1aSoWrWDG3COH6LFZoDil24nPZoyqMGqR8reLhoOiQs0OuyB0jVPu
         C/tA4rxT0orH0i6gcQifoB/HMqIU79HZe4rK3X48sWlBxvlEBAwtxW3VAEhBtC8kF5Jg
         E58Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si1824003edc.109.2019.09.24.13.12.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 13:12:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=virtuozzo.com
Received: from localhost ([::1]:50598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCrAm-0003Km-8a
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 16:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCr8A-0000Wb-JM
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:09:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1iCr88-0002rl-TU
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 16:09:50 -0400
Received: from relay.sw.ru ([185.231.240.75]:38048)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCr88-0002r3-Km; Tue, 24 Sep 2019 16:09:48 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.2)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1iCr87-0001Mk-7T; Tue, 24 Sep 2019 23:09:47 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/25] scripts: add coccinelle script to fix
 error_append_hint usage
Date: Tue, 24 Sep 2019 23:08:42 +0300
Message-Id: <20190924200902.4703-6-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190924200902.4703-1-vsementsov@virtuozzo.com>
References: <20190924200902.4703-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>, Jeff Cody <codyprime@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, integration@gluster.org,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 vsementsov@virtuozzo.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GHHVA4XiHNZS

error_append_hint will not work, if errp == &fatal_error, as program
will exit before error_append_hint call. Fix this by use of special
macro ERRP_FUNCTION_BEGIN.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

CC: John Snow <jsnow@redhat.com>
CC: Kevin Wolf <kwolf@redhat.com>
CC: Max Reitz <mreitz@redhat.com>
CC: Fam Zheng <fam@euphon.net>
CC: Jeff Cody <codyprime@gmail.com>
CC: "Marc-André Lureau" <marcandre.lureau@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Greg Kurz <groug@kaod.org>
CC: Subbaraya Sundeep <sundeep.lkml@gmail.com>
CC: Peter Maydell <peter.maydell@linaro.org>
CC: Paul Burton <pburton@wavecomp.com>
CC: Aleksandar Rikalo <arikalo@wavecomp.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
CC: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Yuval Shaia <yuval.shaia@oracle.com>
CC: Cornelia Huck <cohuck@redhat.com>
CC: Eric Farman <farman@linux.ibm.com>
CC: Richard Henderson <rth@twiddle.net>
CC: David Hildenbrand <david@redhat.com>
CC: Halil Pasic <pasic@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@de.ibm.com>
CC: Gerd Hoffmann <kraxel@redhat.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Markus Armbruster <armbru@redhat.com>
CC: Michael Roth <mdroth@linux.vnet.ibm.com>
CC: Juan Quintela <quintela@redhat.com>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
CC: Eric Blake <eblake@redhat.com>
CC: Jason Wang <jasowang@redhat.com>
CC: "Daniel P. Berrangé" <berrange@redhat.com>
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: qemu-block@nongnu.org
CC: qemu-devel@nongnu.org
CC: integration@gluster.org
CC: qemu-arm@nongnu.org
CC: qemu-ppc@nongnu.org
CC: qemu-s390x@nongnu.org

 .../fix-error_append_hint-usage.cocci         | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 scripts/coccinelle/fix-error_append_hint-usage.cocci

diff --git a/scripts/coccinelle/fix-error_append_hint-usage.cocci b/scripts/coccinelle/fix-error_append_hint-usage.cocci
new file mode 100644
index 0000000000..327fe6098c
--- /dev/null
+++ b/scripts/coccinelle/fix-error_append_hint-usage.cocci
@@ -0,0 +1,25 @@
+@rule0@
+// Add invocation to errp-functions
+identifier fn;
+@@
+
+ fn(..., Error **errp, ...)
+ {
++   ERRP_FUNCTION_BEGIN();
+    <+...
+    error_append_hint(errp, ...);
+    ...+>
+ }
+
+@@
+// Drop doubled invocation
+identifier rule0.fn;
+@@
+
+ fn(...)
+{
+    ERRP_FUNCTION_BEGIN();
+-   ERRP_FUNCTION_BEGIN();
+    ...
+}
+
-- 
2.21.0

