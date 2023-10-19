Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp734649ejb;
        Thu, 19 Oct 2023 12:10:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc0hJv4va7+XwuN+QleY/NcrMGz6E3qtv/HA5GeLQbqPdxgbW6OZmM/wOrFhU/2XCZ+yKt
X-Received: by 2002:ac8:5c81:0:b0:41c:157a:6869 with SMTP id r1-20020ac85c81000000b0041c157a6869mr3344694qta.13.1697742627893;
        Thu, 19 Oct 2023 12:10:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697742627; cv=none;
        d=google.com; s=arc-20160816;
        b=fspuKovPFfZcxJTgUyv2kJBYeROD1VaMBjJ2Avs6/74nAsmn0mMx3FAearPQc4VbfZ
         06UGGU2IsblrWVwDlnXqDdJeVhzJ+LxamV8xSdxn8ZuuohJKudPQirq8ZiWdWsiXGVfP
         w2OOSJsvaZYbjSWIMo/b1QEK7RFi4pFndWfGzCCutpGfiiF8unqxfhVo9LKhfwWhFbEE
         Z+BQEqn1yY9kG/R1H0CqLv6vLIeOdXZ9vQ1hgCMprZ4Sw4wRcF/QDQQfZChH2K3NMseo
         fyQND5d3Uqcp2+oC1KODTqS91acG8w2wmrfTACwyXGgH82CKcMTFi7YzhTFZIrYMk3dL
         2rtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=C8f2csWdJ5KKZ13YTPvOu3mPFBJmmvN2MV5p2JLACEY=;
        fh=gqUfNETxJtf8r2yX3AOw26qXY7UUGcDKlfjfAHHyEZ4=;
        b=geyQ+QyTuCqMG23+yeQIm41/t7x0Ac/ZZhdmSp3NHBIC74Ok33LaHXYztdwn+j11Jf
         ujyT3jYn3w63SWA6+PQyNqh4j5kureistT0jyb8dA/n7bSD3X/FWkxFA5PtoBnuZ2iTn
         LsXvke/Zskrpp6yFkNwwejvO2YvDgHc/z9pA4wKEAGmgMS0S0RLN3W9MggGkOb1McobD
         /9GwIW53lSiGC1N9H+3yLqTdZ7CL5U8NA337yytBVAB6ScLQvL/pZTumFe/0uKuUQT1A
         /vxQ4cMRewI738blIvC00i+a+eZ//tk1Vgd1Zi3TYDw16NMlgHrdHT0Tp7NvGP6MGUNb
         Nffw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JfG/Wnoc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18-20020a05622a02d200b0041cc7a308f5si68753qtx.536.2023.10.19.12.10.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 12:10:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JfG/Wnoc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtYOi-00088R-Rz; Thu, 19 Oct 2023 15:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOh-00081G-0W
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 15:09:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOe-0004kO-UQ
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 15:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697742568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8f2csWdJ5KKZ13YTPvOu3mPFBJmmvN2MV5p2JLACEY=;
 b=JfG/WnocCcdC9ExfCnrNQWIpgZr/fnWagO6EQu6/6QQvlc5I9GOVR7g5J1rLPUjoEe9a9e
 sI1kkPKAeo898qf8FjotIesn0UUo1zwtRgeLqtOkQF/RKmF/DEi78JyVg6oE4AaJ7RXz6k
 h0vb3K/gi72Z1CFnOkJjNMFUbMWxsVE=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-675-BcDf6T2XPz2PSURIIHR8JA-1; Thu, 19 Oct 2023 15:09:23 -0400
X-MC-Unique: BcDf6T2XPz2PSURIIHR8JA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92ABA3816B52;
 Thu, 19 Oct 2023 19:09:16 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82DCF1121314;
 Thu, 19 Oct 2023 19:09:11 +0000 (UTC)
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
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>
Subject: [PATCH 07/13] RFC migration: icp/server is a mess
Date: Thu, 19 Oct 2023 21:08:25 +0200
Message-ID: <20231019190831.20363-8-quintela@redhat.com>
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
X-TUID: lmUf1iyIRiNH

Current code does:
- register pre_2_10_vmstate_dummy_icp with "icp/server" and instance
  dependinfg on cpu number
- for newer machines, it register vmstate_icp with "icp/server" name
  and instance 0
- now it unregisters "icp/server" for the 1st instance.

This is wrong at many levels:
- we shouldn't have two VMSTATEDescriptions with the same name
- In case this is the only solution that we can came with, it needs to
  be:
  * register pre_2_10_vmstate_dummy_icp
  * unregister pre_2_10_vmstate_dummy_icp
  * register real vmstate_icp

As the initialization of this machine is already complex enough, I
need help from PPC maintainers to fix this.

Volunteers?

CC: Cedric Le Goater <clg@kaod.org>
CC: Daniel Henrique Barboza <danielhb413@gmail.com>
CC: David Gibson <david@gibson.dropbear.id.au>
CC: Greg Kurz <groug@kaod.org>

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/ppc/spapr.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index cb840676d3..8531d13492 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -143,7 +143,12 @@ static bool pre_2_10_vmstate_dummy_icp_needed(void *opaque)
 }
 
 static const VMStateDescription pre_2_10_vmstate_dummy_icp = {
-    .name = "icp/server",
+    /*
+     * Hack ahead.  We can't have two devices with the same name and
+     * instance id.  So I rename this to pass make check.
+     * Real help from people who knows the hardware is needed.
+     */
+    .name = "pre-2.10-icp/server",
     .version_id = 1,
     .minimum_version_id = 1,
     .needed = pre_2_10_vmstate_dummy_icp_needed,
-- 
2.41.0

