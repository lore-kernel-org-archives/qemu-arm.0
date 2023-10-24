Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2044263ejb;
        Tue, 24 Oct 2023 06:23:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEG5M6FmBcao5WXPRga19sdVmdtse7xdAXXrvWgePPkxEY65MFhMVEH5WgDazHvvr4HTvuM
X-Received: by 2002:a05:620a:2d82:b0:777:b325:d02d with SMTP id tr2-20020a05620a2d8200b00777b325d02dmr10286273qkn.33.1698153823351;
        Tue, 24 Oct 2023 06:23:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698153823; cv=none;
        d=google.com; s=arc-20160816;
        b=APiQgeAGSvPSOG+k2cnKcorB/SIy6j2HESVZWuPXT9HOhFXAeBQFgvLDdlQvYH0waT
         JpBIZ8pyS59CAJPhfZK/dzb6Yy++AeETJwh2s8qhsxl/4vnD3Atcvxn7AhtHbHsOhPJY
         Wf5/9n7a2NsJX0HJaM3OfMrKRZqCJ6for1Da2eiWejXOB0m5G79xLAbtHMvfKWnbS0fe
         bOVdRbwSItGGFnsfvlSGL52+SEy3qx4EhA2c4oP7jBxi0+QtUj3J2Fm/SsYYnS0N+HN2
         toYCZX+jyTU8fJq4xfoVJmKNy8WnI1UZlUsy4bct/SdMmhc93liIn5kFtcwsOhZ57wXJ
         T/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=n/VXdPefgm5cQbt6KgqcD0AHN+ZJ2Hv+pWVRPMdz9fg=;
        fh=opDjDdl13S8XzsjQawtiYU7uNvQllAuUSK4RvD1fxCk=;
        b=Jx0arXajOWkXq42TNJOyqV1/zdXuCsgi26gEQpDre9G987nsRSrSoECsVZKdyefxUl
         y4LizPRzgejAVAzCy2xVIFS5NZNTAmt/gSuNeKq2jB9NOQamWNj25uMevxzjpYsZZF7K
         Ht9QLv/b7Wzns8XwCGxsjS4v8BSqxXhJkffjQ9TEjTDHXeXDg2Ml25fJVkgXKVfpJRQc
         uqTT1+p7WHOymT+Kxejrbe/KzKk/5Rd5J2mGqqFJIs0/QPm0mfOjNLMxOA9Zzg/YBFPL
         PskPrxcI/0O5TbBTLMPrtdT6o5dCPYcN8qMove6gxR63+Vpx740i1DvMbyDVsESCgt5N
         m3Aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IwUbJLck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br7-20020a05620a460700b0077435408a12si7599660qkb.400.2023.10.24.06.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 06:23:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IwUbJLck;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvHLd-0003Br-HW; Tue, 24 Oct 2023 09:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHIO-0006up-Tk
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:18:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHIL-0002L0-Mk
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:18:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698153484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n/VXdPefgm5cQbt6KgqcD0AHN+ZJ2Hv+pWVRPMdz9fg=;
 b=IwUbJLckTfVAxGVe8IAvEnuWUzHKUlGYrqlXzRFMb2KO7QSyF+uOdfI+ZON0T65mUgUlkt
 bCkiDLWyqKzXoXq1CKzG1BjcWaA8IJrNqvICmttUMocCOPp0To70LqbRUkBNS8ve+HUHbi
 +gavELDQbxGfe+hIUHUrHDxIEH4lzlY=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-624-lxN1N23TPs6AbnuYJglAzw-1; Tue,
 24 Oct 2023 09:16:53 -0400
X-MC-Unique: lxN1N23TPs6AbnuYJglAzw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 547523813F29;
 Tue, 24 Oct 2023 13:16:48 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0CFFE1C060AE;
 Tue, 24 Oct 2023 13:16:41 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Corey Minyard <minyard@acm.org>, Li Zhijian <lizhijian@fujitsu.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Corey Minyard <cminyard@mvista.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Kevin Wolf <kwolf@redhat.com>, qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 libvir-list@redhat.com, Stefan Weil <sw@weilnetz.de>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Xu <peterx@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Fam Zheng <fam@euphon.net>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 32/39] migration: Use vmstate_register_any() for audio
Date: Tue, 24 Oct 2023 15:12:58 +0200
Message-ID: <20231024131305.87468-33-quintela@redhat.com>
In-Reply-To: <20231024131305.87468-1-quintela@redhat.com>
References: <20231024131305.87468-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
X-TUID: a31y5RyLGNGC

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

