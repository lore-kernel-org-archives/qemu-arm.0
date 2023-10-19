Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp734599ejb;
        Thu, 19 Oct 2023 12:10:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmCfdrfx0jkqVr4da8RDIW4YYDxcWGBxOYXwIdunqrZLlZzrybCiSqVYlG7IR01GQUnHbF
X-Received: by 2002:a05:6214:212b:b0:66d:9d6:633b with SMTP id r11-20020a056214212b00b0066d09d6633bmr3306577qvc.4.1697742622934;
        Thu, 19 Oct 2023 12:10:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697742622; cv=none;
        d=google.com; s=arc-20160816;
        b=FN/RR3/+VcmPerIWBsWt6+JRwh9A3ecFQM3xCac1EPr6ooI9Ko4dwhHvB5Iydq+utM
         FSle+zlJAgA33bn0Qw3uNd2EZwBHAMrmx/PCyHg+l0bPPyoEE02dUaflWRQ1ySaQvAAY
         LmLUBcJPLQI0CEp1+Y3+MPRc6BPnKXbAM5Y8bGlQw9khXsNw19K4fUK/KYosFd+yCJpx
         Z6WjqTwCP6J39WPzcI7nJIK9RH8OMVowfW+v8w+IZ8PEODY/FH1X3frOqs6aaVJbH1h7
         19JxBopXPuY+ycNC0K4OPZeBB/YxPXaFmG3dyqTHnD327H1LgvRph6/0zOTS4CCDv0fF
         tMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=SCbH8UoGVeWbuj9EvD52JfVY3j+lre0YXK3Y9nAEbuU=;
        fh=Xlf3et2nYyn6Dffgqd/l95XMDkc357MJlcbLmxiOqZU=;
        b=HvfRYtQGiwq7tjSX8FYckUhRyOf3+3CWK2tXO9EOtF0GLlUDNitFeAogoPwbmnRc1u
         wt0MzydEdeOzYoZ9onKWC5SWl8vFSrDhwtpSl4rYz1wa0qlameEgnsCHqOIovaZuLBgN
         CS8QM+bp85K85ofFVCAhSVFXt1HSGdC/rBRtqBTP++lb0VM3AW+1IoT/s33p6jW3gP24
         wdzcL4lS2Cku329aG2cY29sWXkodYM/JcbJjPUAr44Qor1A+iQWrceDC6eu603Afa5XB
         NnxpdJP9oIfokLBd+d4iZt3j6SYBmTC0Wtwve1qUlUYonSidjhJmgAO2C0ZIJI6xMiNX
         S68A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dp98KPGn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl7-20020a05620a1a8700b007789e957714si68414qkb.274.2023.10.19.12.10.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 12:10:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dp98KPGn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtYOc-0007pd-FY; Thu, 19 Oct 2023 15:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOO-0007bM-Ap
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 15:09:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOM-0003m3-86
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 15:09:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697742549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SCbH8UoGVeWbuj9EvD52JfVY3j+lre0YXK3Y9nAEbuU=;
 b=dp98KPGnLS1Ggqgo57nWsEN6FzUNn9mm+Xo2/CLkv/EvOgS+M/ht3i5dBiBNIa9Oc/dHJ7
 dU72hfyW/A4f7Zw6CW7R28Lm3to57DJNdjSexCCU//jaz2b8AlmuguYTGVykgeZxhTQk8r
 XkxiuHw6fMU5rv0pyMFidEH9+2vi8uI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502--2ZRxlXxM7Se9AYUeiRIUA-1; Thu, 19 Oct 2023 15:09:07 -0400
X-MC-Unique: -2ZRxlXxM7Se9AYUeiRIUA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B98548E6D0F;
 Thu, 19 Oct 2023 19:09:05 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA87A111D782;
 Thu, 19 Oct 2023 19:09:00 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Fabiano Rosas <farosas@suse.de>, Eric Farman <farman@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Corey Minyard <minyard@acm.org>, Leonardo Bras <leobras@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Halil Pasic <pasic@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PATCH 05/13] migration: Use VMSTATE_INSTANCE_ID_ANY for slirp
Date: Thu, 19 Oct 2023 21:08:23 +0200
Message-ID: <20231019190831.20363-6-quintela@redhat.com>
In-Reply-To: <20231019190831.20363-1-quintela@redhat.com>
References: <20231019190831.20363-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lpIisSgX/Ho6

Each user network conection create a new slirp instance.  We register
more than one slirp instance for number 0.

qemu-system-x86_64: -netdev user,id=hs1: savevm_state_handler_insert: Detected duplicate SaveStateEntry: id=slirp, instance_id=0x0
Broken pipe
../../../../../mnt/code/qemu/full/tests/qtest/libqtest.c:195: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
Aborted (core dumped)

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 net/slirp.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index c33b3e02e7..25b49c4526 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -46,6 +46,7 @@
 #include "qapi/qmp/qdict.h"
 #include "util.h"
 #include "migration/register.h"
+#include "migration/vmstate.h"
 #include "migration/qemu-file-types.h"
 
 static int get_str_sep(char *buf, int buf_size, const char **pp, int sep)
@@ -659,8 +660,8 @@ static int net_slirp_init(NetClientState *peer, const char *model,
      * specific version?
      */
     g_assert(slirp_state_version() == 4);
-    register_savevm_live("slirp", 0, slirp_state_version(),
-                         &savevm_slirp_state, s->slirp);
+    register_savevm_live("slirp", VMSTATE_INSTANCE_ID_ANY,
+                         slirp_state_version(), &savevm_slirp_state, s->slirp);
 
     s->poll_notifier.notify = net_slirp_poll_notify;
     main_loop_poll_add_notifier(&s->poll_notifier);
-- 
2.41.0

