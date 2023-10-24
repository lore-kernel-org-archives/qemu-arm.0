Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2040640ejb;
        Tue, 24 Oct 2023 06:18:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfXONC76DAHoKsuORvHd7zfG4onLXRGCYF97Hv8NcsOWT8Qbb0vaCBPu5PWkAd3JqpNkxR
X-Received: by 2002:a05:6102:4e:b0:452:c581:5a07 with SMTP id k14-20020a056102004e00b00452c5815a07mr11561030vsp.11.1698153481892;
        Tue, 24 Oct 2023 06:18:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698153481; cv=none;
        d=google.com; s=arc-20160816;
        b=MjvBgby2JDR+y4T0386rh6Zb6H9kLFnQR6VMMRcsS53kggFJjVdVsONV7EEFSXy9vx
         QtAwyjoZipzE5IyGxxeAF3uH2mSOJj/u1YsR32SiyljLNxwbTGc1QXdMVT8AeTjnFcWM
         bBMCKN8Fyt9yGLPpaHZC+GRWuG/Sd/Djc1JHc9nZQ6g+yNJAiklPdAUMuiQUobt2Pc1M
         CafSAXBX+9gAuzkthX0R/TP4Ugr/742GKkxXVtK2ydxoa9FSYwcqSOa7DCRwTbKa9tLA
         rdPCADQ12otKZUuN+TAg5NK0iV+T5GIJOs85nm3FC4WE+XzKk9k2rgjSv4GktmlD1n+U
         R2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Pnb5H2GzAD+4zbTepRAdsHMXrQuph0eNuqqAzzPZHHc=;
        fh=e9feSw8SSOtT/dgZZLe6uilVOFwjb0itHlOwuVUfZns=;
        b=CCr8N4X4yicaOfbGIfliE7HJkgQ0Aa0QYp4by/LqyOGu369bH5T8qwwGAbMpftNXLx
         y3vkWFmd9SYW2Ukx1G58IraJOleu3prsB6hu2ZZeb2BLrnYrxg1KDxl1I4pWAsWdGawc
         cJro5gVRnORHJgl8pXEe+8o0DHl9cvzpxzIZGSCF4MBI9LPW1LD+Vw9ui0IiPrqZowPx
         psvMLZUkfX56wNxvt52b8wyIsl5vMF1ipRyTjmsr7DLvp289UkVhJA+HHnQH3qF6Y2Hz
         l557DKMD8b1ZbT8W8wsWmJosbgJ2kbLThjdlxnw0O4VsLcE4pV9bb5k+QN5GDDBv7Nq2
         j1lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CrgI/GwF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12-20020a67e20c000000b00452877e8149si912714vsa.744.2023.10.24.06.18.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 06:18:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="CrgI/GwF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvHHf-00059P-Fr; Tue, 24 Oct 2023 09:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHGb-0002f6-0V
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:16:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHGW-0001ud-MC
 for qemu-arm@nongnu.org; Tue, 24 Oct 2023 09:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698153370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pnb5H2GzAD+4zbTepRAdsHMXrQuph0eNuqqAzzPZHHc=;
 b=CrgI/GwF5Cza+S14WdxpBHFWu9t20Jqn+OVr1GgWXdZzr7dbW2vYxlIQNSX821qD1liaMe
 G+sU3iTvqJPk65eC4OaaYZbiptyHSjefOa9XKorlnOIS6KbCSXOtmASAHSdLifEGlpii3p
 dPuqnCaXFkv8iODfBOBqgkFMFrP3T6Y=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-161-YriQ6wYKPWeiVWDd92Hfww-1; Tue,
 24 Oct 2023 09:14:07 -0400
X-MC-Unique: YriQ6wYKPWeiVWDd92Hfww-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C15CB1C07827;
 Tue, 24 Oct 2023 13:14:00 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 980301C060AE;
 Tue, 24 Oct 2023 13:13:54 +0000 (UTC)
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org
Subject: [PULL 07/39] migration: Give one error if trying to set MULTIFD and
 XBZRLE
Date: Tue, 24 Oct 2023 15:12:33 +0200
Message-ID: <20231024131305.87468-8-quintela@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 2v9k0cTwDQl8

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231019110724.15324-2-quintela@redhat.com>
---
 migration/options.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/migration/options.c b/migration/options.c
index 42fb818956..b8c3c3218d 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -618,6 +618,13 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
         }
     }
 
+    if (new_caps[MIGRATION_CAPABILITY_MULTIFD]) {
+        if (new_caps[MIGRATION_CAPABILITY_XBZRLE]) {
+            error_setg(errp, "Multifd is not compatible with xbzrle");
+            return false;
+        }
+    }
+
     return true;
 }
 
-- 
2.41.0

