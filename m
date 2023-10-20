Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1080354ejb;
        Fri, 20 Oct 2023 02:09:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuZQ6bjtTrKf/t8ZT93FeSuqJUTZ30h6F2GosMaWlpFCnKkACjXFJ+8yYfoF0e2bkpTAvD
X-Received: by 2002:ac8:7f0b:0:b0:417:fe9c:6dce with SMTP id f11-20020ac87f0b000000b00417fe9c6dcemr1334562qtk.25.1697792973488;
        Fri, 20 Oct 2023 02:09:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697792973; cv=none;
        d=google.com; s=arc-20160816;
        b=vnp0OKTdf/24/Sbaq0qqXkin+z0GF85Ifbs1FXak/+VdF2pYfMxSYvFWXkau+DDk66
         Qjqddl6Opfv86pWkg99ZxmOUpEccnt+tcSbo0NfRFxA6PG3+ou78Fy8hRFFhCFAsTkHD
         V435Hlu3nfDp8HX5B0MwZbQTaCgUzyWMliwz+780XR4xkh0cVeH3BvMnlz56HUYzNArm
         +aqo2bF1f4VtSeULqDVBbpJ5KZ/rygLXXYF/eRMsd0rufBw4RqvRtLWBPoPP7rn7gFAp
         EdhIlbv7pxKuF06bxUgPs25b+IBqVpgTIWZS+CLtdMScT4uY+75cxcNh79qaZG6ZGcXO
         Ez8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=q8Pq3OBjQlCOCOhJ16gPv1cYwMXL16YRNkaNXmzIlkk=;
        fh=Mwp3ThCAXh+AmQsC5dFDaw5TkorRX1d1xKXEPbQanFc=;
        b=IbWcYtX90jrdqQeL4GEg35T+van2x8KQbRKsI7KJ1C5TVHmZQif1yyc68RbsOORGlC
         lY80v6bNt4ZylNYVhO+hLUJg9cdiNOcl8yzu8XZiLTMlWAuIQW77t+I17k/Tb3TW8QXb
         9OKBeR9mMLt8vF29oHioGF+heFgCGE7WplIjRw2edKQSUWQWHiEdRFDeHAJU3rbx8xkY
         RM90MAzKbLOx7YUcEryi68bTxsyUJy/OFS2wLMpyRezMYtn5Yfx3gchH8LKq586poxmg
         7JEs6uAOIUYrumn/RoL5jCtaMrp+UDuia5PCBcwVZPP37hUYFpnhVqMfm/bwef50xY4o
         if9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gasOB8GN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h22-20020ac87d56000000b0041cbcce90c1si981446qtb.531.2023.10.20.02.09.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 02:09:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gasOB8GN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtlUo-0004SU-VP; Fri, 20 Oct 2023 05:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlUl-0004BR-FP
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 05:08:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlUj-0005SX-U6
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 05:08:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697792917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q8Pq3OBjQlCOCOhJ16gPv1cYwMXL16YRNkaNXmzIlkk=;
 b=gasOB8GN5qZkAyNCMFIfQCN7HbnoG/LLscn+SjzVwoUQVEpXiI5gdq1ZvF0UekqWuMUeMN
 FJtOPh2N/qf2kGdCRcOp+lMAbc8ddz+Zy4wMVGf32t0Nywo0gD7Vl8YLGtIguvbjQJbJHG
 J3kYYq2vwp0xNw5ytOsxrpI6tLdoEFI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-R_h-bEmqP3eTdDMrbt7WVw-1; Fri, 20 Oct 2023 05:08:33 -0400
X-MC-Unique: R_h-bEmqP3eTdDMrbt7WVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A64D03C1014D;
 Fri, 20 Oct 2023 09:08:31 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B91232166B26;
 Fri, 20 Oct 2023 09:08:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Eric Farman <farman@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 David Gibson <david@gibson.dropbear.id.au>,
 Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Xu <peterx@redhat.com>, Corey Minyard <minyard@acm.org>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Juan Quintela <quintela@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Leonardo Bras <leobras@redhat.com>,
 John Snow <jsnow@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, qemu-s390x@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: [PATCH v2 10/13] migration: Improve example and documentation of
 vmstate_register()
Date: Fri, 20 Oct 2023 11:07:28 +0200
Message-ID: <20231020090731.28701-11-quintela@redhat.com>
In-Reply-To: <20231020090731.28701-1-quintela@redhat.com>
References: <20231020090731.28701-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
X-TUID: H9H5FHta0tBI

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 docs/devel/migration.rst | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
index c3e1400c0c..bfd8710c95 100644
--- a/docs/devel/migration.rst
+++ b/docs/devel/migration.rst
@@ -165,13 +165,17 @@ An example (from hw/input/pckbd.c)
       }
   };
 
-We are declaring the state with name "pckbd".
-The ``version_id`` is 3, and the fields are 4 uint8_t in a KBDState structure.
-We registered this with:
+We are declaring the state with name "pckbd".  The ``version_id`` is
+3, and there are 4 uint8_t fields in the KBDState structure.  We
+registered this ``VMSTATEDescription`` with one of the following
+functions.  The first one will generate a device ``instance_id``
+different for each registration.  Use the second one if you already
+have an id that is different for each instance of the device:
 
 .. code:: c
 
-    vmstate_register(NULL, 0, &vmstate_kbd, s);
+    vmstate_register_any(NULL, &vmstate_kbd, s);
+    vmstate_register(NULL, instance_id, &vmstate_kbd, s);
 
 For devices that are ``qdev`` based, we can register the device in the class
 init function:
-- 
2.41.0

