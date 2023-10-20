Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp1080296ejb;
        Fri, 20 Oct 2023 02:09:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4LLwZhLX/CLg17fQab72IULJ37dXqXmilCAWZNpT5QFx7LMZJ/DTdBYx0gRAeYncd+rNq
X-Received: by 2002:a05:6214:2462:b0:66d:20f7:8d8d with SMTP id im2-20020a056214246200b0066d20f78d8dmr1480625qvb.28.1697792966391;
        Fri, 20 Oct 2023 02:09:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697792966; cv=none;
        d=google.com; s=arc-20160816;
        b=dB/nMUuGUzL5QYdulTEGa0wyaZe9xFrjH9s/8RkpocHICVWZBgM38g4bB3XTd4h3RY
         Z7rx9HNrGv9eUjtjI0hP1kfNL5sF+iZFibkszyroBpxBTjAosQIB1mIfjBB/bOn1v/sr
         THJUkINfz3HNOfWRmjq3nRldYJ/syTZ9CMfnvTeE6/GHaDQHiSTY0r8gc9nrQRhfGfiC
         WiNaqapwz/lo/hY8B/LQzBqCo2Xm+aqEIaWTSF+gNxGzmeqY85HCjLdgWcNncWPJPOJq
         Ug/dT0rCc/L0jylMG62BhRIRfv/x8VGm+UGC7KTC/YzYNolueaPfcwXarEj5xh+WSHKN
         8aRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rsZO9JKw/HmQqEUnOwIt6ZganKj0eOZM2jgWPc50M1Q=;
        fh=rTkH9/wDYQMZLVlaH0neZTzbhrqu7oCVHTTGZPWdq9o=;
        b=vSxVzXBWVXdKCtpebU9y3K8V6/VdtLFM0Wf0pA5BlUHNtQ6ZaZrCC3J9/ZGWbDnt3j
         Qea6G59OPRWqFhmVK1o4XhRbvIPaHqB5nbN+AP4T39qxYUHjWcvrbiUsOKc06Fb/ZV4c
         +ao4bPryGiUqjpOwqi4DRKpROi4Lc6JQXPnGRZRI6lnGdjIDQS9icHXalrGXYP0yqk78
         yA+K3+tDr6cN4H+uBLICafOrNhOAIpi9JVkN/Hc6x/YGlOybW+wRxGAmO16nB+yfLJWH
         jJn/6HwCReRII7eMfEfQkWdFNE0i2Tcoz4/NrFN6uOmkXm8Q7Cqe0pn5nZ8ctEX60xSJ
         lBUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F51xygYj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dm8-20020ad44e28000000b0066d0543b654si1032797qvb.341.2023.10.20.02.09.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Oct 2023 02:09:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F51xygYj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtlUx-00051E-I5; Fri, 20 Oct 2023 05:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlUw-0004yx-Jj
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 05:08:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtlUu-0005VY-Pe
 for qemu-devel@nongnu.org; Fri, 20 Oct 2023 05:08:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697792928;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rsZO9JKw/HmQqEUnOwIt6ZganKj0eOZM2jgWPc50M1Q=;
 b=F51xygYj02m5h2nnejlhXTFj0zXRPgG8Rr7l/24u4MokNhm2FUc6Ic8V/rtrBlplCtFwHf
 fqpOkFSSB74FFBXXhsICg/5dqrMgTBukLGsmKwpqAfL80t9VQ378gZzipgmUv8DhJPeWpZ
 +3z36ETvkZw9xDp0a4F5LibKJ9iVHlk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-237-aCdwP-BQPimrSxh-6rhhqQ-1; Fri, 20 Oct 2023 05:08:43 -0400
X-MC-Unique: aCdwP-BQPimrSxh-6rhhqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7646188B771;
 Fri, 20 Oct 2023 09:08:42 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4AB5A2166B26;
 Fri, 20 Oct 2023 09:08:37 +0000 (UTC)
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
Subject: [PATCH v2 12/13] migration: Use vmstate_register_any() for eeprom93xx
Date: Fri, 20 Oct 2023 11:07:30 +0200
Message-ID: <20231020090731.28701-13-quintela@redhat.com>
In-Reply-To: <20231020090731.28701-1-quintela@redhat.com>
References: <20231020090731.28701-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
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
X-TUID: 1SCPOrdrLraJ

We can have more than one eeprom93xx.
For instance:

e100_nic_realize() -> eeprom93xx_new()

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/nvram/eeprom93xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvram/eeprom93xx.c b/hw/nvram/eeprom93xx.c
index 1081e2cc0d..57d63638d7 100644
--- a/hw/nvram/eeprom93xx.c
+++ b/hw/nvram/eeprom93xx.c
@@ -321,7 +321,7 @@ eeprom_t *eeprom93xx_new(DeviceState *dev, uint16_t nwords)
     /* Output DO is tristate, read results in 1. */
     eeprom->eedo = 1;
     logout("eeprom = 0x%p, nwords = %u\n", eeprom, nwords);
-    vmstate_register(VMSTATE_IF(dev), 0, &vmstate_eeprom, eeprom);
+    vmstate_register_any(VMSTATE_IF(dev), &vmstate_eeprom, eeprom);
     return eeprom;
 }
 
-- 
2.41.0

