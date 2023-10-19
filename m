Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp735419ejb;
        Thu, 19 Oct 2023 12:11:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECsRDfZOgOhsb4laTT+jBmwgjEzuk6erUqirIGv2a7Xc4lfr0xuLoGx7NfEmvm728D70RE
X-Received: by 2002:a05:620a:318f:b0:772:63d9:5264 with SMTP id bi15-20020a05620a318f00b0077263d95264mr3402204qkb.59.1697742700750;
        Thu, 19 Oct 2023 12:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697742700; cv=none;
        d=google.com; s=arc-20160816;
        b=x6jOK7FLhxBIsjhb8grvPe2svOEkiBeaOqX7qPNCjtZ1LYZm55xQIqzstcFeS8mpyp
         Q5VVo0cZ8yIND0Px9EHvY+c2fW6Sy/rMDgrv21X7TVtqH78TN39rNjkFojUrE/w+opra
         UBHNwzPWA2sUbJJIRpfbJJWsBlYzkRrG+35z0AsPD+aL4RnIFXIHx1IV9nRExgkqHHmd
         EHMwFU9oLy/edW3EHDcWAP1sYfFppNCo/KJKwMCsEUmP+RKlqGeJlqxK6MD5f2rnEbq7
         yif4gYvB8fpDGqiOJ5ajuP74dYUQPKKXUn4VHttq6R5ulLI34ytmSBksMRZOxRbA8iho
         mZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i7WF6z3NoHmdgkRpLAcccCpB+KwzJHQ8ydtWeaQ3LqQ=;
        fh=Xlf3et2nYyn6Dffgqd/l95XMDkc357MJlcbLmxiOqZU=;
        b=GgC/+pQn93FM+/TUNF4QFu+4Bt6sR1aFEypvJjuAR8E8Zqd7ELDlaBatDjpucTtfy2
         A6y2MDZTDyFP+nk0W6diqGQ8wR27B4Bztm/bwLMYarzSrIS/ucCiY3amhBhLSTvb03oC
         ta/Tz50xyDho6UzONRZPSrLFXT5aEroZm18MXsyT1ZyYt3jN7EeXWh/8j20l9YPf+DkL
         PXIDyrTygJk59cCmRaXloDwBdSZTfumiiXx5jkfLaDZEjiewElOEbGEZE0IiX5M0qKl+
         mC0/iq4tcDSEFg9CH1BmClEE87R5zcdDVOIg3bkBNgCKjZM0BUyJjDmnH5933mtfAw47
         rh2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eOdG706A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 17-20020a05620a049100b0076cb047fa2fsi62581qkr.619.2023.10.19.12.11.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 12:11:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eOdG706A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qtYPU-0001rN-Vl; Thu, 19 Oct 2023 15:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYPF-0001IJ-ML
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 15:10:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYP9-0005TB-Aa
 for qemu-arm@nongnu.org; Thu, 19 Oct 2023 15:10:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697742596;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i7WF6z3NoHmdgkRpLAcccCpB+KwzJHQ8ydtWeaQ3LqQ=;
 b=eOdG706Al23tMHBlDXwy/1WrblrEa+iC6RjW/Fm031X11WnDPjbNm/QVtsI3PNKxXu/v9U
 aBxXNMNFDk51bvI/O7RyWj3EFVvwrVaTA58NGatCOkrUb1qKRSgP5eFJFdjiZsBB2fy187
 kwtfGNlo41KJN8cEXkotjn83k12sIoU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-478-w83OONg8P0ad5j6dBHycNg-1; Thu, 19 Oct 2023 15:09:52 -0400
X-MC-Unique: w83OONg8P0ad5j6dBHycNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1772A8B3A23;
 Thu, 19 Oct 2023 19:09:44 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03C4C111D782;
 Thu, 19 Oct 2023 19:09:38 +0000 (UTC)
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
Subject: [PATCH 12/13] migration: Use vmstate_register_any() for eeprom93xx
Date: Thu, 19 Oct 2023 21:08:30 +0200
Message-ID: <20231019190831.20363-13-quintela@redhat.com>
In-Reply-To: <20231019190831.20363-1-quintela@redhat.com>
References: <20231019190831.20363-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
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
X-TUID: 1DTOFs3tfxAC

We can have more than one eeprom93xx.
For instance:

e100_nic_realize() -> eeprom93xx_new()

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

