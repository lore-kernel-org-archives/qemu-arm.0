Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp734232ejb;
        Thu, 19 Oct 2023 12:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT/d8zOgLg+Ee3lqIq+7MFXeyKnwEkxj8GhAVgYAt51Bqp2/w1RczyVV2SouVyTS9IXCjj
X-Received: by 2002:ac8:5912:0:b0:41c:c205:f718 with SMTP id 18-20020ac85912000000b0041cc205f718mr3865200qty.45.1697742581860;
        Thu, 19 Oct 2023 12:09:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697742581; cv=none;
        d=google.com; s=arc-20160816;
        b=tAG/zlPGMnlNFjVAGmB8NQzycFmp0exYx3SIaKIa9FkPUAhBFn7tFQIzn52QsQMU4p
         vR2u4ZUpj+YBvKc+PKaRHaU3yKAexp/bglgEmvpmLFXv9Y9p4e+FVYQPnSxWP0C3IEVt
         ptFaSBXm4bjdzY6d7r7gnfndMd7GAWWCtmlvYkDjVQC0Ianxu06HtQ1QpTeIXFxZaMql
         74bPx1xVS51TeevyD1gz8AAdP/hGa2G31W2AL64If/kTyw5OHgUFv8x4la8mufZ4GahD
         +Yj5NlLxL9vI+i5X5zJnKq2l0dHX43EdcLCBAkmSoi8dG5x7BZb08csZgQ57QdwSc81T
         /ajQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=5FFDsfzGBip3Izgt9zKYcrufFp3lptG0SYMaVEvY+Uw=;
        fh=Xlf3et2nYyn6Dffgqd/l95XMDkc357MJlcbLmxiOqZU=;
        b=AJfDcT3RksamogW273V4pD7XLo8r+QzoCjDjWCKna6eAS5kFF01qmGLoqC3AsOzjDZ
         RW5sSGs3VBWlu+sKat7+p6DlyLjS/M0IuryJ7m6sUtuGylSrt0+p9ck5WFw395p6SHkl
         b5aOjnE2+0rVV79WLLCDjKWnibehUTaGlCfe5vLQqXPx+g+JEWXy/TUfLSziEVusLXvN
         m3Zd/zTYpqHEG0bNsz/ZT+5w+AKPhci49czGbSdysK1zit/pZaTjqEW14RHSPumWZlJs
         ufc1MWypy4OIXnQ1D5gwnz2F060fPT1HLQapzz+rbcuq+RtqAz45/zlXdvLi35R0OMxA
         /kAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O0i0Ok64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o19-20020ac85a53000000b0040f3c2813e2si81048qta.166.2023.10.19.12.09.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 12:09:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O0i0Ok64;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtYOG-0007Q7-UB; Thu, 19 Oct 2023 15:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOE-0007Na-Ro
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 15:09:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOD-0003aX-Fv
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 15:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697742540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5FFDsfzGBip3Izgt9zKYcrufFp3lptG0SYMaVEvY+Uw=;
 b=O0i0Ok64jbLrcOtEWbERevFNmDsunIUF1vvmJTgjuHVH10fP2t+X+A8Wfl68q3AKsBrsO8
 UXwOe5edKKydsYYGuMPZjXN9vBXt2TxH9/gPC6a2uk6ZElRgsDb50rmSIUOtkM0+sMyXaH
 yhg7VYtYg0VA/+00O5UXVay8qWmOCp4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-h1J-yMgWMyCWJmXUb0-6Hg-1; Thu, 19 Oct 2023 15:08:45 -0400
X-MC-Unique: h1J-yMgWMyCWJmXUb0-6Hg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D5B82812940;
 Thu, 19 Oct 2023 19:08:44 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E3871121314;
 Thu, 19 Oct 2023 19:08:39 +0000 (UTC)
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
Subject: [PATCH 01/13] migration: Create vmstate_register_any()
Date: Thu, 19 Oct 2023 21:08:19 +0200
Message-ID: <20231019190831.20363-2-quintela@redhat.com>
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
X-TUID: idIwrXWgYRj9

We have lots of cases where we are using an instance_id==0 when we
should be using VMSTATE_INSTANCE_ID_ANY (-1).  Basically everything
that can have more than one needs to have a proper instance_id or -1
and the system will take one for it.

vmstate_register_any(): We register with -1.

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

