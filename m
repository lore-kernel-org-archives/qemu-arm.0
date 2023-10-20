Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1079818ejb;
        Fri, 20 Oct 2023 02:08:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE36HD2WtR+BxeszCxvWhKnKAkG9jKekJGi29COf9QTb+VNZ/X4mmexxdNHUGvzvkbVvASh
X-Received: by 2002:a05:620a:240b:b0:773:cbe0:ed30 with SMTP id d11-20020a05620a240b00b00773cbe0ed30mr1443309qkn.3.1697792902168;
        Fri, 20 Oct 2023 02:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697792902; cv=none;
        d=google.com; s=arc-20160816;
        b=MgXpmOWWsdvX00U/40nxXGB2TH3kkF4lSTx3UPEV9ZTQDz90Orsi0IlDUGz4I7nbhS
         Gw1HtKz1P88w49WgMRRwH8taPS4symRiuaX0z/vdWuYDmvwsix9kB7HcYYY6IVhj+PUL
         jsg8vR8Dm1QEBW2AnamW1+vsVFiqQNQsZ5IC2YwVi6NIqYkdbifTM6kGmqY0SAWZCNJG
         ZHWQNMzlni3vSRK6w3uwFghahFK4r+aVeVzNQrkiFdCZeA+i90Fhb5WGgktFwJ9YHOt4
         9oTDRypHihtyrIIaBW3UWClGUWwQeH8hogWJdOmM5A7VrkE37p+3fSrGuKlJxbJ8VU1/
         7f/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hNFk4YkCAqeJIsXVRuOEkZafNahxDTxT32DWNknVNck=;
        fh=rTkH9/wDYQMZLVlaH0neZTzbhrqu7oCVHTTGZPWdq9o=;
        b=NJrmjKlrZycfKUCORwvngLDePNjsvTeRZgAKct7QXNFnoFWEmlpe9u8xiRjQwTAHsO
         BuMFLmKL8ZJgA0l4j/yYfsHG5VUqwRDqQ6R65C3Te1i6GzcPmKf1kfOa7r/XuWk+dQsk
         VPdPfOjGeP2WTCRvLicmTUzfSkje563duWp267og/CEyzKjYkEiYXjqDCqhRUH4X4rFS
         vwTR+fATd8oCiHO+LtMniWb27+B9qWH/gTnCjY1Ywk3YuGiNyXXkexTq1SFdc/S7spOS
         klfOmciL8DJeBQK10wQlMcuaCSwvPSnrKvNSSqKuchGwpOrwnufDeLl6iIMmUGVRGRsA
         6eZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XjLjWZcE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pc26-20020a05620a841a00b0076d9a8c430dsi921443qkn.24.2023.10.20.02.08.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 02:08:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XjLjWZcE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtlU0-000391-0N; Fri, 20 Oct 2023 05:07:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlTy-00037n-BW
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 05:07:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlTw-0005Bd-SQ
 for qemu-arm@nongnu.org; Fri, 20 Oct 2023 05:07:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697792868;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hNFk4YkCAqeJIsXVRuOEkZafNahxDTxT32DWNknVNck=;
 b=XjLjWZcEOXRZzbIJtFzAvLtefb1Uz6F5NFNROQdxUpDstMvDJE8X7faiv1ZEQoW3sFk/xa
 y/jyHi522BkZBvoRGVxfltrI+C32upsR41H5rZ9T45liIjhvAuZnMxKieU6vx5Jzj+kYX2
 PkNK3ihhe1YIMYaQPVaS3wm93OnWIpk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-172-7-RHZQqDMhCaaY-T5CnLUQ-1; Fri, 20 Oct 2023 05:07:44 -0400
X-MC-Unique: 7-RHZQqDMhCaaY-T5CnLUQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D1D487A9F3;
 Fri, 20 Oct 2023 09:07:43 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C5E92166B28;
 Fri, 20 Oct 2023 09:07:37 +0000 (UTC)
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
 Stefan Weil <sw@weilnetz.de>, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH v2 01/13] migration: Create vmstate_register_any()
Date: Fri, 20 Oct 2023 11:07:19 +0200
Message-ID: <20231020090731.28701-2-quintela@redhat.com>
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
X-TUID: Cj9IPBEBob0K

We have lots of cases where we are using an instance_id==0 when we
should be using VMSTATE_INSTANCE_ID_ANY (-1).  Basically everything
that can have more than one needs to have a proper instance_id or -1
and the system will take one for it.

vmstate_register_any(): We register with -1.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/vmstate.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 1a31fb7293..9ca7e9cc48 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -1230,6 +1230,23 @@ static inline int vmstate_register(VMStateIf *obj, int instance_id,
                                           opaque, -1, 0, NULL);
 }
 
+/**
+ * vmstate_register_any() - legacy function to register state
+ * serialisation description and let the function choose the id
+ *
+ * New code shouldn't be using this function as QOM-ified devices have
+ * dc->vmsd to store the serialisation description.
+ *
+ * Returns: 0 on success, -1 on failure
+ */
+static inline int vmstate_register_any(VMStateIf *obj,
+                                       const VMStateDescription *vmsd,
+                                       void *opaque)
+{
+    return vmstate_register_with_alias_id(obj, VMSTATE_INSTANCE_ID_ANY, vmsd,
+                                          opaque, -1, 0, NULL);
+}
+
 void vmstate_unregister(VMStateIf *obj, const VMStateDescription *vmsd,
                         void *opaque);
 
-- 
2.41.0

