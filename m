Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5394227lff;
        Tue, 14 Jan 2020 03:41:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqzB+W3GP5uvYnCriBYrVYOeDqiuNEytAEkx+GkQnP257+jS8XAW/3B8bCknhq5O5qN7jO9c
X-Received: by 2002:a50:c048:: with SMTP id u8mr22600714edd.226.1579002064003;
        Tue, 14 Jan 2020 03:41:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579002063; cv=none;
        d=google.com; s=arc-20160816;
        b=pb/tv9vkOGodAkd+ycV8JFWdIdLA4Y6I8gGJ9PTJ6a/TJcTJOYPAfpXbCEg0jvkO2G
         sox0hd3l0HMAImK8MSYd7N0tdaCGHioXQmVbop4L7thP0pkEa72uag9+ox5OB97Vjf+0
         pOqtBS6klx7OseVdYnblgi4WxTegXx6kNNhZwnl8wkj9Xe2PYYEvJw5wr0Y0wIdZathK
         zSxkRFVjZRyCVWf40nYly2ZSGDZPMNxtaS37Sg68Oz/3trllD6QAWFBVRUjeu0OqZgRJ
         e3ph4pqe9Dlfh7MBCGa+5f5tzZoaKMRAkMsopR5peKkRu38utFGiCjIb5kkiSNzDdu0F
         qCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ep/mdFe58oIx18pwRhWkg/D1I02FCTVyA7jE4yQkeXs=;
        b=NtvfVb3s/u/k947Pgdi0mTYtvXXbuh5josL+Xo+qNPYYOUmgQsPi32+ylxQLeULRUs
         lvALtZYleR8QJ9aBFhEKV7OO3pUSXfHy5Rfx+8yun6z8QOuf9u10jP/KEWK7HIer0xmd
         PT2PyE9rYOq7fJ5+kjCnlLQ7LFZARweOp2eTZtFbDLHKiKtbAh9LSiX+vvIQSo40frne
         Hse6pSmQQNQN4zzIhnaVexMwngYwFLsCRoOY7NFAJ8EJK2TAqQzcOvXVlmOEMUP4Z/Gv
         pDsuZi4t1LlErhXzhfddvC93WnFkiasMRc9uGQleQGbU8FSWt3xknKLqCTmEOv3A1kUC
         1udA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iZ4dlH3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d27si10942308edj.136.2020.01.14.03.41.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2020 03:41:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iZ4dlH3X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1irKZC-0005Sp-FV
	for alex.bennee@linaro.org; Tue, 14 Jan 2020 06:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55529)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irKYf-000551-Kg
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:40:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irKYb-0002wc-NV
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:40:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51250
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irKYb-0002wE-Ik
 for qemu-arm@nongnu.org; Tue, 14 Jan 2020 06:40:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579002025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ep/mdFe58oIx18pwRhWkg/D1I02FCTVyA7jE4yQkeXs=;
 b=iZ4dlH3XmMCH5+69MmoM4apzb2XCewYhzNRudDyLFoInrFClt+aekrdRaoSZy5CVZ22dYA
 Ys8vRY2w1CKthoSyXvrvTBVvBEeRST6RLjeqyn14IhRzLUEePFw0Fz16QI1MBYdDVVA/YJ
 MFccrIy7x5+suoQiZKB9Q68YUASLJZo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-QkwOZzIHNzeHKasIWBBh5g-1; Tue, 14 Jan 2020 06:40:23 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAADC18CA243;
 Tue, 14 Jan 2020 11:40:21 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D8825DA70;
 Tue, 14 Jan 2020 11:40:17 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 06/30] runstate: ignore finishmigrate -> prelaunch transition
Date: Tue, 14 Jan 2020 12:39:02 +0100
Message-Id: <20200114113926.3556-7-quintela@redhat.com>
In-Reply-To: <20200114113926.3556-1-quintela@redhat.com>
References: <20200114113926.3556-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: QkwOZzIHNzeHKasIWBBh5g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <rth@twiddle.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bWrpVdtCcloq

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
index 158a05ed32..ba3e176094 100644
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

