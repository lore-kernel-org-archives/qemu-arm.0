Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp734297ejb;
        Thu, 19 Oct 2023 12:09:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrpuHvd2SafrRrfdpHYHjo32iYr3EwWNRgtgP4kjbInWBoB4hwAhv5UR3dj43m1XEVO45a
X-Received: by 2002:a05:622a:83:b0:41b:8416:ea2a with SMTP id o3-20020a05622a008300b0041b8416ea2amr3845962qtw.40.1697742588081;
        Thu, 19 Oct 2023 12:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697742588; cv=none;
        d=google.com; s=arc-20160816;
        b=FxyOH5e9yuGfEEoFuOvhYq/PWe2CuZogUzQLYUMCx5HuOVLSvuGtmPQyV/KRx9KABc
         ieubCxRxRxXuZ6mkiEoBjXhcqzCS0MydAK4YFYBVx2DYOfkbELQ5LOGjn4u78o0MwzRs
         XTnh8+qyZ/smollwGyjimM9gfM6HcbXtxPAfO3nsmWGz49uXibYveI57pUJeg3R8VEwx
         4K9IH9S/kkYUAzhJHcBXEuLaCSBnirVcssKAtCxL3X2J76hm//zhgJmYeEl75iGkiNMC
         mcOuHrQWmXqedcnMFtudBvHLeIpt/nXMrxuoO1JOpuSV50/tj0Z+/KdhMMKsfS0v1kwB
         ouAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lw4B0lOmKfMd9Inm1WLIGBquN/7PqujYIpn5zOBPP0I=;
        fh=Xlf3et2nYyn6Dffgqd/l95XMDkc357MJlcbLmxiOqZU=;
        b=yeo+YWnPtjbSMZK5/ggHPZfRe2jv8l5pao211tN0oU6SWRaMOa6OCpa/KOMy3P0AVk
         FRRZ+0giiIMfL85/krh1WigiDYnAxE/i9wO1Oseb0QQzc4psuwfgmpWj8QtD2HCgkdr1
         8x0ycPJDMgVPHk/01MtCHGxkwUMUwcuZ8NperFSTLx6brum8BTNVXnFdlnznJXOptLmH
         TOkT4vEFFKVUWg6AfHpATfBOH/WDpcwYTtME3P0bShK3BKDLtTm3Z9S86KcA1N4R1Ym0
         8255RwfV3UmeIxF/qV16jHhxwSfB+dvKOyeCtXtw7AgKgGs0wGuoHoJ+1BwzJ+nvyZCW
         GxhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XT2rOB7P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12-20020ac85d8c000000b0040fe1ce310dsi65557qtx.736.2023.10.19.12.09.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 12:09:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XT2rOB7P;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtYOJ-0007Y4-NP; Thu, 19 Oct 2023 15:09:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOI-0007Sc-Bb
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 15:09:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYOG-0003fE-Hp
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 15:09:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697742543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lw4B0lOmKfMd9Inm1WLIGBquN/7PqujYIpn5zOBPP0I=;
 b=XT2rOB7P0C/mGjnIP26DG6hmCP0P/OFgfcDD1mYU4RRmeeXAYa1hW6qsVanHEDFH5dCfmc
 COIqglA/HkX/x6wfKmg6EE8CFllKWxtU8rQAqKZhuUHBNR4UfzprVCthOkB2ug51AERkUO
 cIuFdHqEbXDR9bVTQKvLufYVrCA9duo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-683-P72PmX8TM_alKIlNe9EFmQ-1; Thu, 19 Oct 2023 15:09:01 -0400
X-MC-Unique: P72PmX8TM_alKIlNe9EFmQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C95E10201F2;
 Thu, 19 Oct 2023 19:09:00 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3548D1121314;
 Thu, 19 Oct 2023 19:08:55 +0000 (UTC)
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
Subject: [PATCH 04/13] migration: Use vmstate_register_any() for ipmi-bt*
Date: Thu, 19 Oct 2023 21:08:22 +0200
Message-ID: <20231019190831.20363-5-quintela@redhat.com>
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
X-TUID: x668BW7z9rF0

Otherwise device-introspection-test fails.

$ ./tests/qtest/device-introspect-test
...
Broken pipe
../../../../../mnt/code/qemu/full/tests/qtest/libqtest.c:195: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
Aborted (core dumped)

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/ipmi/ipmi_bmc_extern.c | 2 +-
 hw/ipmi/ipmi_bmc_sim.c    | 2 +-
 hw/ipmi/isa_ipmi_bt.c     | 2 +-
 hw/ipmi/isa_ipmi_kcs.c    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
index e232d35ba2..324a2c8835 100644
--- a/hw/ipmi/ipmi_bmc_extern.c
+++ b/hw/ipmi/ipmi_bmc_extern.c
@@ -504,7 +504,7 @@ static void ipmi_bmc_extern_init(Object *obj)
     IPMIBmcExtern *ibe = IPMI_BMC_EXTERN(obj);
 
     ibe->extern_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, extern_timeout, ibe);
-    vmstate_register(NULL, 0, &vmstate_ipmi_bmc_extern, ibe);
+    vmstate_register_any(NULL, &vmstate_ipmi_bmc_extern, ibe);
 }
 
 static void ipmi_bmc_extern_finalize(Object *obj)
diff --git a/hw/ipmi/ipmi_bmc_sim.c b/hw/ipmi/ipmi_bmc_sim.c
index 905e091094..404db5d5bc 100644
--- a/hw/ipmi/ipmi_bmc_sim.c
+++ b/hw/ipmi/ipmi_bmc_sim.c
@@ -2188,7 +2188,7 @@ static void ipmi_sim_realize(DeviceState *dev, Error **errp)
 
     ibs->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ipmi_timeout, ibs);
 
-    vmstate_register(NULL, 0, &vmstate_ipmi_sim, ibs);
+    vmstate_register_any(NULL, &vmstate_ipmi_sim, ibs);
 }
 
 static Property ipmi_sim_properties[] = {
diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
index a83e7243d6..afb76b548a 100644
--- a/hw/ipmi/isa_ipmi_bt.c
+++ b/hw/ipmi/isa_ipmi_bt.c
@@ -125,7 +125,7 @@ static void isa_ipmi_bt_init(Object *obj)
 
     ipmi_bmc_find_and_link(obj, (Object **) &iib->bt.bmc);
 
-    vmstate_register(NULL, 0, &vmstate_ISAIPMIBTDevice, iib);
+    vmstate_register_any(NULL, &vmstate_ISAIPMIBTDevice, iib);
 }
 
 static void *isa_ipmi_bt_get_backend_data(IPMIInterface *ii)
diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
index b2ed70b9da..5ab63b2fcf 100644
--- a/hw/ipmi/isa_ipmi_kcs.c
+++ b/hw/ipmi/isa_ipmi_kcs.c
@@ -132,7 +132,7 @@ static void isa_ipmi_kcs_init(Object *obj)
      * IPMI device, so receive it, but transmit a different
      * version.
      */
-    vmstate_register(NULL, 0, &vmstate_ISAIPMIKCSDevice, iik);
+    vmstate_register_any(NULL, &vmstate_ISAIPMIKCSDevice, iik);
 }
 
 static void *isa_ipmi_kcs_get_backend_data(IPMIInterface *ii)
-- 
2.41.0

