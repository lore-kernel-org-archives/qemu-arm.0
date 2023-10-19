Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp734641ejb;
        Thu, 19 Oct 2023 12:10:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3QB0OKqzslO59yygSnMwRANSbDI7a1+ML9bO8VNMqomKKKddPoYPZjSqlhaHRgm5A3ULX
X-Received: by 2002:a67:a44f:0:b0:457:d2cb:e409 with SMTP id p15-20020a67a44f000000b00457d2cbe409mr2827802vsh.33.1697742627081;
        Thu, 19 Oct 2023 12:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697742627; cv=none;
        d=google.com; s=arc-20160816;
        b=nitrOqgWk+w4nmN6N0PnlCSlb9EW5Q0rs+4nYxVV4/sc4xj3rnIQNcBD3oDXIA2Euh
         X+LBO0px06+Qt15oCFk1sZXT/v7AeAKPX9ovrnGN8HBIb2QbAZzJHBd1DWcEToU0l/aB
         aNkGqcS9lKDSrisTgnH4VuDvL+88x+naeNo2EBJfryli7q8TTOPTg2gxH1b7SDXW27af
         gEUAFlaw8RBrVq2G3MKGhduEIu0ajYRXn9a+4wZXhwLw5361oxG5ZlpD7kMHhhX+wdqR
         fwqBv+aYMbliDOKNRUp8d/JrD/uyAiNGug99uumTNbtC7iqcLXq2x0zL71br1v+e/MKe
         4buQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lEGL9EuGdIhwDHaI7AxM5YI6bfXKQfsvZ6xQk7rxPgo=;
        fh=Xlf3et2nYyn6Dffgqd/l95XMDkc357MJlcbLmxiOqZU=;
        b=0NWFDHuaI7fN8ZV/buonvfBwbiJpZkUI365KS5FxCe3m8QxAPmRvGGtFejWx2a/8yf
         d3wMcG/vaqzntYUxQb8n9jUmrwL34yjtwpOWJw9MhFSY7HY5QbaZw85wjg3JcHld0zcE
         15DYEXi/FB3822xJe0Jg8Ud0ISkuyA5Nx/pKFLOTPyiecR4VAj2tLsG8I/N2+a6Ypat1
         c7en86V5+PSCsgWDY1xng/RczKI/xd2eo5z4UMLriH1HA3pQRkHGEgTFWvGob2MjZ94Q
         jdAsWrhHu03Q1XWBsNBw1lH/jdMLpOc4iZlq6hkdEJjL7xwkQ2nMvsnxuiRJEnDkhVwy
         51hA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ExdlZQQt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l17-20020a05622a175100b00403be2ad0besi89814qtk.11.2023.10.19.12.10.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 12:10:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ExdlZQQt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtYP7-0000wB-4s; Thu, 19 Oct 2023 15:09:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOz-0000g7-M3
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 15:09:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOw-00053K-LW
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 15:09:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697742584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lEGL9EuGdIhwDHaI7AxM5YI6bfXKQfsvZ6xQk7rxPgo=;
 b=ExdlZQQtxnAkC+eT47FBTITI0Dm5ZbC7YtmoX36mUtUnMCA8onD+plSkBUm4j7uijQXP3B
 vKzwwWeTQObcs3EoQElUUHcEj8hNEd8nG5xYqzqjEbhTwyhYWZh5EIOpLIYN7j3bIjxapK
 Wy8HI1mEpzd+l/c/cT4+dAFVO/xIR/0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-391-uASDBXqiOSWHyNdtOCUWPw-1; Thu, 19 Oct 2023 15:09:24 -0400
X-MC-Unique: uASDBXqiOSWHyNdtOCUWPw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA98E1C113FD;
 Thu, 19 Oct 2023 19:09:21 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA0F81121314;
 Thu, 19 Oct 2023 19:09:16 +0000 (UTC)
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
Subject: [PATCH 08/13] migration: vmstate_register() check that instance_id is
 valid
Date: Thu, 19 Oct 2023 21:08:26 +0200
Message-ID: <20231019190831.20363-9-quintela@redhat.com>
In-Reply-To: <20231019190831.20363-1-quintela@redhat.com>
References: <20231019190831.20363-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
X-TUID: XnvdsX/exhPS

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/migration/vmstate.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 9ca7e9cc48..d1282a78ef 100644
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

