Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp989039lff;
        Fri, 10 Jan 2020 09:36:54 -0800 (PST)
X-Google-Smtp-Source: APXvYqxv/kCAZO+b6OaoheY8kkvTO8szznDBbB+ZFQ4SZpUH++V/PfBdq3I4juy94J9sQHwL97bZ
X-Received: by 2002:a50:a105:: with SMTP id 5mr4695786edj.75.1578677814665;
        Fri, 10 Jan 2020 09:36:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578677814; cv=none;
        d=google.com; s=arc-20160816;
        b=tsHYTm37oFoCaS82YU5VGnj07eyPu3i2XncXmZe51KGsVuEgh9/FALTzMYsEuN0oGN
         PIX/h/xxqYLIVR/1Bf6SlmIqXyg7Z80cjl7NPmdm9niDGEn/dE9Wc7DnVdDOOvS5JiMy
         F9CQ28qQL5N+9oXukoBOGN55C8vwEeURUVWK6pwU9wuu431p1Rs7s9k4qrDij1YAZbVk
         ipOZo0FRGJYaQXrqc73ltdzYaKFsnhsUzo/L1M+uz4wHF6jIo2OiS0k9y+aScnO1QOy3
         Ogg0OMDFTGdQuDsEbyNywaGZizSZP2jnz7fsXNpcAEcDt5EjNgp691LYvFs9m/flTpE+
         EKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=zvTDQne+jYYuSTiUHa/PS8PRm8MB0e0ph2uScK4uXBU=;
        b=JHEYxG2bBtkgnovTGRW2y4Bm5CLAjRaSBbHw+SIwz5UOUBlmU/CyhREqDeOC0im/CT
         2OFtxY3UnJZeRJQIyObATIH3EqB0YVxMC3v/uYOse/eKfen0zY5Yly8LmBtNJfPTbw7t
         J2z7hhq9FgWVfAtm1QPkbECjjQUciF+nbSHAx67npcIpDtKpY3hxUbQQzBN0ticwrtJR
         vXFYNy3zPzg8aPibQf51jWJBxSXytiFphJScLtu1uvuNrCM5YbGKmDOLsg2+yZYNxg12
         +a40enBwjAg6PTp9OkgEIQA9MuuC9Q+p42Sw9J7/uu5rDJ+e37NiqdpVX7T+GLjwKGyQ
         APHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WRiBpFaL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pw18si1889057ejb.72.2020.01.10.09.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2020 09:36:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WRiBpFaL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ipyDN-0007ZF-4i
	for alex.bennee@linaro.org; Fri, 10 Jan 2020 12:36:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45565)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1ipy9k-0003dw-9c
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:33:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1ipy9j-0001RP-7P
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:33:08 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:42225
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1ipy9j-0001QF-2k
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 12:33:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578677586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zvTDQne+jYYuSTiUHa/PS8PRm8MB0e0ph2uScK4uXBU=;
 b=WRiBpFaLKzMdAIcMzwT6Okw5fhdZLAnFoLGRH0lUImQ8i8/Nq2RLcL1qUsWSA/8ioJKLeD
 /THF1EVE1pwntEL/ne/xeJLSzsVZ537V2Pf7ny6bN2g/mWHmtHDw2fJ3HcwiIuQuvGEdF8
 aCbD9Hc1/8uKxXQ5B69nDfFjhBEI7t4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-SEE2xhYCPBO3O-bWFWjcXg-1; Fri, 10 Jan 2020 12:33:05 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E329800D41;
 Fri, 10 Jan 2020 17:33:03 +0000 (UTC)
Received: from secure.mitica (ovpn-116-240.ams2.redhat.com [10.36.116.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92BFB19C4F;
 Fri, 10 Jan 2020 17:32:56 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/28] runstate: ignore finishmigrate -> prelaunch transition
Date: Fri, 10 Jan 2020 18:31:52 +0100
Message-Id: <20200110173215.3865-6-quintela@redhat.com>
In-Reply-To: <20200110173215.3865-1-quintela@redhat.com>
References: <20200110173215.3865-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: SEE2xhYCPBO3O-bWFWjcXg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wb/l70Rv9kug

From: Laurent Vivier <lvivier@redhat.com>

Commit 1bd71dce4bf2 tries to prevent a finishmigrate -> prelaunch
transition by exiting at the beginning of the main_loop_should_exit()
function if the state is already finishmigrate.

As the finishmigrate state is set in the migration thread it can
happen concurrently to the function. The migration thread and the
function are normally protected by the iothread mutex and thus the
state should no evolve between the start of the function and its end.

Unfortunately during the function life the lock is released by
pause_all_vcpus() just before the point we need to be sure we are
not in finishmigrate state and if the migration thread is waiting
for the lock it will take the opportunity to change the state
to finishmigrate.

The only way to be sure we are not in the finishmigrate state when
we need is to check the state after the pause_all_vcpus() function.

Fixes: 1bd71dce4bf2 ("runstate: ignore exit request in finish migrate state=
")
Signed-off-by: Laurent Vivier <lvivier@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 vl.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/vl.c b/vl.c
index b211921258..5401d6e440 100644
--- a/vl.c
+++ b/vl.c
@@ -1604,9 +1604,6 @@ static bool main_loop_should_exit(void)
     RunState r;
     ShutdownCause request;
=20
-    if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
-        return false;
-    }
     if (preconfig_exit_requested) {
         if (runstate_check(RUN_STATE_PRECONFIG)) {
             runstate_set(RUN_STATE_PRELAUNCH);
@@ -1635,8 +1632,13 @@ static bool main_loop_should_exit(void)
         pause_all_vcpus();
         qemu_system_reset(request);
         resume_all_vcpus();
+        /*
+         * runstate can change in pause_all_vcpus()
+         * as iothread mutex is unlocked
+         */
         if (!runstate_check(RUN_STATE_RUNNING) &&
-                !runstate_check(RUN_STATE_INMIGRATE)) {
+                !runstate_check(RUN_STATE_INMIGRATE) &&
+                !runstate_check(RUN_STATE_FINISH_MIGRATE)) {
             runstate_set(RUN_STATE_PRELAUNCH);
         }
     }
--=20
2.24.1

