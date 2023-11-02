Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp322102eja;
        Thu, 2 Nov 2023 04:45:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqSdwLxRqk+Z0z0Y+j9CNF2dpM0p4panbOJF/G0i4qFozWxWmR1D+ifyA4Sbd91VdhVvU/
X-Received: by 2002:a25:d2d1:0:b0:da3:76c1:c779 with SMTP id j200-20020a25d2d1000000b00da376c1c779mr7520835ybg.52.1698925508263;
        Thu, 02 Nov 2023 04:45:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925508; cv=none;
        d=google.com; s=arc-20160816;
        b=WCH4uPE4Z9LGgt3PN/RALVahfE8mXhOiauOHfny8ETWqF2fmMSFKYqaPTTJ/Cio6Fg
         C0v+fWf8ftxJGKqmx2KfLLD8yawdIKJZZKCGmpaV0TvCKskBT9Czq6m9AuKzGwBfzqc/
         actpF3eMXjP4XKRzamxBbz9bLhgIsg2eQyvXDNVRMUP1XalxwKMNTy/1Rb8SkDwJHB/q
         gP1VBzgfOB3nPWAD0gMTiefJEFjKHjPcxdW5N1BzG4TRVAiKIKvOFS7O02RywE82Fghi
         ITfP76qxBfvW1KB8WYww1NOuaL0xR0u92SSDewDxvZF+4cE13PMbQGs2ZjS5fTXHiGHi
         sp1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=n/VXdPefgm5cQbt6KgqcD0AHN+ZJ2Hv+pWVRPMdz9fg=;
        fh=9XEyySFYRp6Olqe53+AU8I52EufRgt7BknvnnkPQpGA=;
        b=nh2qGXD+hgyOUgoPKf0Iwm9H+wTTjh7Gy54PM4nXaJswu65NoLAaR5ia1deE14Kjn4
         S5M33OLP69fW+F4nUngiMcji7uZCWCFueLBza1Nn8yyvlzZEsS/40/kNBx7QVwXDojyM
         o7sRuvXjbk2CoTMrjiMsG8tNIZ/GnIpAv5n+10In8EZ2Kx2KMDbIVL0LF+ZEyU07u6d7
         YIvK2uqx+3lUjK+VDWHr4L/SpoAJCQ9XD8g1hWhh03J17CsScEvu+uVJUnlT/MMRrfDq
         wxG1OMf+Dl9DE7vYcoMeK6HzhnW9YOPVSN6s0/DE0VmxxN2Go8xWXdwX0sPHSZbXWdp/
         3Ktg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GnkQcQJJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cv15-20020ad44d8f000000b0066d10e104cfsi4278899qvb.347.2023.11.02.04.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:45:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GnkQcQJJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyW70-0005cm-A5; Thu, 02 Nov 2023 07:43:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW6G-0003xc-AX
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:43:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW5y-0005B9-2X
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/VXdPefgm5cQbt6KgqcD0AHN+ZJ2Hv+pWVRPMdz9fg=;
 b=GnkQcQJJ2BoklGPDafZ0NSswLeOGCzK9nM3yd9IMB4U/a/pF+aZh5cwABDDQq5lKDJ84y9
 BLUUc2Hh8EKsBUDI96UJ5BrzhBXExFQrlddRrztwlQ7DxQd+70gjDAhdE8LHF2aELqpZ/W
 X+teVGz4bYMIHoMsw3CRHWal0G5RlAU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-280-foXLju3LMvi5PzCc8mcBkg-1; Thu, 02 Nov 2023 07:42:37 -0400
X-MC-Unique: foXLju3LMvi5PzCc8mcBkg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91251101A550;
 Thu,  2 Nov 2023 11:42:35 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 36C4D2026D4C;
 Thu,  2 Nov 2023 11:42:28 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Li Zhijian <lizhijian@fujitsu.com>, Eric Blake <eblake@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Hanna Reitz <hreitz@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 John Snow <jsnow@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fam Zheng <fam@euphon.net>, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 12/40] migration: Use vmstate_register_any() for audio
Date: Thu,  2 Nov 2023 12:40:26 +0100
Message-ID: <20231102114054.44360-13-quintela@redhat.com>
In-Reply-To: <20231102114054.44360-1-quintela@redhat.com>
References: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DejijMu2/p3/

We can have more than one audio backend.

void audio_init_audiodevs(void)
{
    AudiodevListEntry *e;

    QSIMPLEQ_FOREACH(e, &audiodevs, next) {
        audio_init(e->dev, &error_fatal);
    }
}

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231020090731.28701-12-quintela@redhat.com>
---
 audio/audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/audio/audio.c b/audio/audio.c
index e9815d6812..f91e05b72c 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -1781,7 +1781,7 @@ static AudioState *audio_init(Audiodev *dev, Error **errp)
 
     QTAILQ_INSERT_TAIL(&audio_states, s, list);
     QLIST_INIT (&s->card_head);
-    vmstate_register (NULL, 0, &vmstate_audio, s);
+    vmstate_register_any(NULL, &vmstate_audio, s);
     return s;
 
 out:
-- 
2.41.0

