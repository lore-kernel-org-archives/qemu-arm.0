Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1081092ejb;
        Fri, 20 Oct 2023 02:10:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjY7DJjed5zieVrbUIbzUT7FL5lywLE7PyjtoVDi5l++BP/Pv15obiETNLnpOK+j4JGney
X-Received: by 2002:ac8:5cce:0:b0:41b:7771:34aa with SMTP id s14-20020ac85cce000000b0041b777134aamr1298571qta.55.1697793021374;
        Fri, 20 Oct 2023 02:10:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697793021; cv=none;
        d=google.com; s=arc-20160816;
        b=PzaG6fzDjrvplgecH8zL2e2Ut+UDEWEhu7gT6jnlQ7yL36hUD1lN98NE6UcllL0gP3
         LFeJDbYcLZRhpStL27XNKj4kVk4sBcYRlZyWImmtcpmAuDR412/mqv3hjbYdnbO/Zzbn
         Jo28TmQpj8if74TDw63uXFHHihRUnDD6UF6tfMER+a+KD7kNNr3JITWcUaLCi2/qtKpS
         DXX5WqkOjOd0Uab8/wK117Owhky1TuwrLPEQHTfAkNwLSUvLBv7SlQIE711YfB/LBUxf
         TyuZ+6Hq91hBF4Af/L+p1wJqmo2lBcbm0csc/Fl9qlyegtcef8nJgDJMwK32ncrK/mzE
         erZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=W1M3XnBHuyd79h8Fr5vZJ6iKYVLkfcNAlQwPS9BX9Gw=;
        fh=Mwp3ThCAXh+AmQsC5dFDaw5TkorRX1d1xKXEPbQanFc=;
        b=zShkmE5P3s0K0ZAa481U1KNmANmK17Pz09zyal2eUm8YaUL9f8z0jC6TIoR++h2Y3L
         QxY15mKsNhuzyHIm0rlitSUKtPOAmn0qNxJvufa87SP7LwrJj1afHMFePcRN1QRz94M4
         iAgQrLQ2YPw5mySgD1ATQ5+3r1QN7GGsMdjElvdZOUJHK8ciMfYHu9Y3u7A/66LqxXJu
         cLZxOUuJ8ss3uytEubln1isktGAXCiEhS1FV0lBtrhPaTpgypsh0fSV/vEi+l+JKIXc0
         P9Lr2TvjGc7Tv3dpiTBhzmFxPbSUn8AT9JHMXDMJigl05jbzRVyf/NWIR4fjWZi+++7v
         PSBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GPAVef8i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3-20020ac87dc3000000b004197d8cff5fsi962510qte.612.2023.10.20.02.10.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 02:10:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GPAVef8i;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtlUo-0004OW-DM; Fri, 20 Oct 2023 05:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlUc-0003b9-68
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 05:08:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlUZ-0005PE-W4
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 05:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697792907;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W1M3XnBHuyd79h8Fr5vZJ6iKYVLkfcNAlQwPS9BX9Gw=;
 b=GPAVef8iWP9ebqhqHCz8I/h5G4xXIH1q036zN7VrjIT/GIVJWxJ0hkm0QXrYrvNt2U767M
 F5z0pC5veZMVgd1SuMXm5B4wu18C/3gQ91mYS+RcDwjD8P7vjjJAC0cs6pWJJ5gFRrTJUt
 nv6D8a23hxby1dOoX4EDTbFGSmelbGc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-ueavXtSnOoOuqVgBzcf4pg-1; Fri, 20 Oct 2023 05:08:22 -0400
X-MC-Unique: ueavXtSnOoOuqVgBzcf4pg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF5462810D70;
 Fri, 20 Oct 2023 09:08:20 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C502F2166B26;
 Fri, 20 Oct 2023 09:08:15 +0000 (UTC)
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
Subject: [PATCH v2 08/13] migration: vmstate_register() check that instance_id
 is valid
Date: Fri, 20 Oct 2023 11:07:26 +0200
Message-ID: <20231020090731.28701-9-quintela@redhat.com>
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
X-TUID: hmI11VLCkH7R

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/vmstate.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 65deaecc92..896c3f69d2 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -28,6 +28,7 @@
 #define QEMU_VMSTATE_H
 
 #include "hw/vmstate-if.h"
+#include "qemu/error-report.h"
 
 typedef struct VMStateInfo VMStateInfo;
 typedef struct VMStateField VMStateField;
@@ -1226,6 +1227,11 @@ static inline int vmstate_register(VMStateIf *obj, int instance_id,
                                    const VMStateDescription *vmsd,
                                    void *opaque)
 {
+    if (instance_id == VMSTATE_INSTANCE_ID_ANY) {
+        error_report("vmstate_register: Invalid device: %s instance_id: %d",
+                     vmsd->name, instance_id);
+        return -1;
+    }
     return vmstate_register_with_alias_id(obj, instance_id, vmsd,
                                           opaque, -1, 0, NULL);
 }
-- 
2.41.0

