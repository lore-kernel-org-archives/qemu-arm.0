Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp321932eja;
        Thu, 2 Nov 2023 04:44:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4nYtT32W8QE2QFujk40VZQHgatJ/ENeMXQJm8dJJkjeqRGSGRkW3MZGrhSarRETQOpqlU
X-Received: by 2002:a05:620a:408c:b0:770:f346:e9e8 with SMTP id f12-20020a05620a408c00b00770f346e9e8mr20358611qko.10.1698925488639;
        Thu, 02 Nov 2023 04:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925488; cv=none;
        d=google.com; s=arc-20160816;
        b=wfboVVu82RYqcUF7XLJmDhS81egy72MzQZgz0GQKqHmsYjmIFFNCH9zOlMqvQ67aTX
         aHh93nzhbSqwlsPAhcxKcmWaji+OtkP7vmFn/+vAN+VAw9ZOiV1jIRMjQkLWXsVAZ5n4
         Dt+WPpeTKKxKaAMpnWgGYvKHLHEEax1Jm+X7HkpHrrnXPLRLf0/f9Ve9b4FWo5q9Tdij
         Ol1oGyxFlQ43TuI7/ZMTTHl7iml+yurjLRdHYU9Vog182F9MxNj61ztDQl+Amy41o8sT
         cKXLxB2C8iCqkguQF2a2TgI/iss2VEPp+tzc/AZzLwsGcRZGW9RFZfoNTJaJC1HATU9w
         VPRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x6JE+zecAqUmFc34uzto/ns3IimMkz2fuHg268Ewu5c=;
        fh=9XEyySFYRp6Olqe53+AU8I52EufRgt7BknvnnkPQpGA=;
        b=QDCmHK2Ed+ir0gOg0t9qZ0lIFT3wveW4nw8FHmLcd1SYmbMhiEztQ4HZjFoQATqV9F
         UrAixKie8SYkAta+SNosJPvtbQudfO+6Wbf/Y20mgIZWku7WvSET0atYBn6xah6I7E9Y
         zAycq7/5F7suYjlPc1CguFALon2az8mWEP2kx9EwEo9+0H5rX4WHXsvIVw2wfRIUB5pO
         y/LEphF2HZRbug/uyL4217I24vTXPecDkmVZ5aoM0QoHXX0CfnMmecGv8Oshi/e8cxrW
         usHtPGT4cqMhG76lzPf2O2G7YD3x33NF/hpi8VHCNq7/61SMhvLrBnsEIgY7E1cGEQle
         MIyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=McpXw6Fi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a05620a288600b00773b6bed39esi4439993qkp.540.2023.11.02.04.44.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:44:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=McpXw6Fi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyW78-0006gr-1M; Thu, 02 Nov 2023 07:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW6A-0003qg-H2
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:42:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW64-0005K3-QQ
 for qemu-arm@nongnu.org; Thu, 02 Nov 2023 07:42:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925367;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x6JE+zecAqUmFc34uzto/ns3IimMkz2fuHg268Ewu5c=;
 b=McpXw6Fi/gxKng2vRaBlmUMBaiKWKLNIoyGgSJTciK3bTXx494FzQdQlMNsagMULTMJOEf
 Lvgb+q/BpA11NMY/4WZ4nbi7lHKNeJ+6FqfesXRAhdIYH/XXIdPtg4GwwYkNtFuxNIbJ6j
 hlO0BqQ04TrDFimEW4xGGNpVH8eT1bc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-flvpFMXvNeK5jEfL0bCIKg-1; Thu, 02 Nov 2023 07:42:44 -0400
X-MC-Unique: flvpFMXvNeK5jEfL0bCIKg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 434E8185A780;
 Thu,  2 Nov 2023 11:42:43 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D83A82026D37;
 Thu,  2 Nov 2023 11:42:35 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Farman <farman@linux.ibm.com>, Laurent Vivier <lvivier@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Kevin Wolf <kwolf@redhat.com>, David Hildenbrand <david@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Leonardo Bras <leobras@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Li Zhijian <lizhijian@fujitsu.com>, Eric Blake <eblake@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Hanna Reitz <hreitz@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Corey Minyard <minyard@acm.org>,
 John Snow <jsnow@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Peter Xu <peterx@redhat.com>, Nicholas Piggin <npiggin@gmail.com>,
 Juan Quintela <quintela@redhat.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fam Zheng <fam@euphon.net>, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 13/40] migration: Use vmstate_register_any() for eeprom93xx
Date: Thu,  2 Nov 2023 12:40:27 +0100
Message-ID: <20231102114054.44360-14-quintela@redhat.com>
In-Reply-To: <20231102114054.44360-1-quintela@redhat.com>
References: <20231102114054.44360-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 1v672kyd9KnQ

We can have more than one eeprom93xx.
For instance:

e100_nic_realize() -> eeprom93xx_new()

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231020090731.28701-13-quintela@redhat.com>
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

