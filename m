Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp735050ejb;
        Thu, 19 Oct 2023 12:11:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXaqSRrU8qCsyRKLCxhpqQEwS2vwis7iy0auL4/OwRdDw2Ze1+IBwlqZkiJSITOseDd0f6
X-Received: by 2002:a05:622a:391:b0:419:4eca:c15e with SMTP id j17-20020a05622a039100b004194ecac15emr3482250qtx.63.1697742667247;
        Thu, 19 Oct 2023 12:11:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697742667; cv=none;
        d=google.com; s=arc-20160816;
        b=uIUBHXV8vXau1hOWvcKnIbcwsQ3Wa1PdFwWRIXyn7pNUpwlHipaSS/WIhMUKySU2d9
         laUzGRCTIfAgX4Q0DrERKbsQ/TCfDfeqZwB1NFUO/raPCRsqcHoDbTmpMSf7zYNwybRN
         +GTlTSFfU0zglBtOF1lbzNRmcdzEa2XTHyKTtg/bus436TDtGZEEkiZqDwaHn2fibJX7
         o3r8JStPHz9+oj5+Qepb+FVSe9sSJ+gjMJPvMh6y0ZKijiQ2/D/zEddbkx5cbYVlk8kr
         aBj1RefZseg2osstC9sZFwAtpU09dmQFZ+gyMcEKjHnZeSD5jDbhA8WuALcCXtEqct+9
         1IuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XsYvTZgDBhewc3Z6i4dvqIW0DP48z99h3kMN7dorRCg=;
        fh=Xlf3et2nYyn6Dffgqd/l95XMDkc357MJlcbLmxiOqZU=;
        b=c3Pdco/jXWdOjMaE524sZjHzmeTTZ/1DPj4wfTUdDQLZRmLz1vhUhsmHoxtk87G/MK
         ylvXBOV0u4LvShAJXurtPBFGCz+LjSXoAItoQ1ji1oQAUz3xUg3zP72hFbhYxH3ap753
         rdx2tjulTx8jR7eXStOU4BfNcS9jzl9iN+xn5B6AyG+/dsthS4PkILyjJULdGTw+OYtT
         X+61UBJqx+aEfxlZ9KruqK334D0dsxGP431B3dBYo2l3CTMI3YaY4qvdB3b4TYos4kOH
         oDUyqomBmN9a8dWPCi/C0sj0cFxCsEpxRvFN1/4eOuaKlvJmPYZkd/nyb12LqfYoI/Zt
         vCkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OkXx+CBd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b15-20020ac85bcf000000b00419544d589bsi65077qtb.743.2023.10.19.12.11.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 12:11:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OkXx+CBd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtYPT-0001T0-DE; Thu, 19 Oct 2023 15:10:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYP5-0000qk-CT
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 15:09:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYP1-0005H0-Ho
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 15:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697742590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XsYvTZgDBhewc3Z6i4dvqIW0DP48z99h3kMN7dorRCg=;
 b=OkXx+CBd42JXg0SgQiv1kWrI9fDId5eoQjpyyW3OaMDgkCtNJk1R9rKCzVY5JqQOV3murM
 NM7f+mWKR0bk+VEXS38uz998+VTetbjCQyD0fH3NyqBhp54QFFx8uYxi6yI+6FmDOsKzGU
 KtRCJt0TbSrvJchCOczq2q2N9cgwVUk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-ftPY83GRPwOBBDX2pp0H_g-1; Thu, 19 Oct 2023 15:09:46 -0400
X-MC-Unique: ftPY83GRPwOBBDX2pp0H_g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B817E3C1709C;
 Thu, 19 Oct 2023 19:09:38 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CA72111D782;
 Thu, 19 Oct 2023 19:09:33 +0000 (UTC)
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
Subject: [PATCH 11/13] migration: Use vmstate_register_any() for audio
Date: Thu, 19 Oct 2023 21:08:29 +0200
Message-ID: <20231019190831.20363-12-quintela@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: AkTZuEB2YK5/

We can have more than one audio card.

void audio_init_audiodevs(void)
{
    AudiodevListEntry *e;

    QSIMPLEQ_FOREACH(e, &audiodevs, next) {
        audio_init(e->dev, &error_fatal);
    }
}

Signed-off-by: Juan Quintela <quintela@redhat.com>
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

