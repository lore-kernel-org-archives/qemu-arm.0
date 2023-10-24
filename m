Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2039477ejb;
        Tue, 24 Oct 2023 06:16:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXMXphXqxJJ6mTbTFOfpbkn15xCIxeKYLLaLVmWzc8JcrahOPSdAZdZENLraS+hU3+sQEN
X-Received: by 2002:a05:6214:e84:b0:66c:eeb8:4226 with SMTP id hf4-20020a0562140e8400b0066ceeb84226mr17378038qvb.12.1698153387072;
        Tue, 24 Oct 2023 06:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698153387; cv=none;
        d=google.com; s=arc-20160816;
        b=REg0hjQgtBnVx9/2oT4/yydaz7+D2DY62FzPMSqmzO0xRi9rvAKTKj4nvwAOO1p+rz
         MB2E80N/4PszDfYXeqlgMLQdJQzuOaU4DvxKTDjmgEGL5Swp9+sZBpl/auvXj9a3wfgt
         Q073IjCPjBnbXfw0Q+mRk4ws0UU7cWp9fnWiRNh1GIXxAuGiqAT2Xs9VB4LjnaIg3dz7
         FLrAYmFsrxmLCeOJYb4gc4TC5XT2dHxSlc/akFS1y2JpNYzgCaj+V1x+TFVxaQalCFlp
         cdLUVMFaD+TnbkgAzM/WQcnxWGWd2fjZ9ukjORm1RySHousqImhrTHdQRRf+2D9elOqx
         fKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=bzn6XgU4nv/l3ZtGp4EWYxpwxg6jKvAv8cH4Fj755pE=;
        fh=e9feSw8SSOtT/dgZZLe6uilVOFwjb0itHlOwuVUfZns=;
        b=ZdY9OmUXmzO+kRsedojPLFaVjsxtTi6HePVBTSjnxatTv1C4PMbpAdNMnvC6525h6J
         6Fw7Vp3igjMPsIi3cttwt7zn08LyDD7kKh4x2Krt6LfJ94XcE0XCHqSOfMaod7qTGDpJ
         PQnxDwSiPQMSjI4gBWt3Suw1hzpoe4rZTmHkbgFDev3d4iNPtrhJ39nKLjs3vkapwpjQ
         p6chV35ug0WeW0GjP6ys9A1X1zoN/GQQPTOxQWIp2cC8IejNJFESuO3hXWjJBbOrWwjV
         xeolTRt58vltkrnpcETqA/yR5uUeOdv0hqjhk8UWZM/VTyRKJrSicUO2rQ375H1mwSUa
         suxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XMq35taG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e11-20020a056214162b00b0066d7ec3340bsi7172233qvw.616.2023.10.24.06.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 06:16:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XMq35taG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qvHFC-0005Pv-MM; Tue, 24 Oct 2023 09:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHEg-0004gi-Lf
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 09:14:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qvHEd-00016r-BS
 for qemu-devel@nongnu.org; Tue, 24 Oct 2023 09:14:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698153254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bzn6XgU4nv/l3ZtGp4EWYxpwxg6jKvAv8cH4Fj755pE=;
 b=XMq35taG/u/8q96vbSkBrHfsH7lfLWWh6npr+innWgNdYRenRUGcW6ywpc92tyYREWl1z5
 NSSm4PE5ssz70vcNdIRVb9Uu3KPnGEKd49j8jXeIdfL4YcDeU4eI7TE0zzcc/1Fdl3rEwd
 g/r0/v8ChCkmny1COYCrFjWkgUC2TFM=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-kGGLFIURM8S24X_TsICbTw-1; Tue, 24 Oct 2023 09:14:09 -0400
X-MC-Unique: kGGLFIURM8S24X_TsICbTw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DC82E3C1ACE0;
 Tue, 24 Oct 2023 13:14:07 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FA0C1C060AE;
 Tue, 24 Oct 2023 13:14:00 +0000 (UTC)
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
Subject: [PULL 08/39] migration: Give one error if trying to set COMPRESSION
 and XBZRLE
Date: Tue, 24 Oct 2023 15:12:34 +0200
Message-ID: <20231024131305.87468-9-quintela@redhat.com>
In-Reply-To: <20231024131305.87468-1-quintela@redhat.com>
References: <20231024131305.87468-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: eZWUxKZhO4El

Reviewed-by: Fabiano Rosas <farosas@suse.de>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231019110724.15324-3-quintela@redhat.com>
---
 migration/options.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/migration/options.c b/migration/options.c
index b8c3c3218d..37fa1cfe74 100644
--- a/migration/options.c
+++ b/migration/options.c
@@ -625,6 +625,13 @@ bool migrate_caps_check(bool *old_caps, bool *new_caps, Error **errp)
         }
     }
 
+    if (new_caps[MIGRATION_CAPABILITY_COMPRESS]) {
+        if (new_caps[MIGRATION_CAPABILITY_XBZRLE]) {
+            error_setg(errp, "Compression is not compatible with xbzrle");
+            return false;
+        }
+    }
+
     return true;
 }
 
-- 
2.41.0

