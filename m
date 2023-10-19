Received: by 2002:a17:906:cf90:b0:9bd:85f7:2662 with SMTP id um16csp735571ejb;
        Thu, 19 Oct 2023 12:11:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvlOoE9TrduAAmv7dHoPoWUr51uGG3tJGjl3aAbHm5sbDsd7NJL25oc40CcPm0MjZqWIU0
X-Received: by 2002:a05:622a:1354:b0:40b:9015:7eee with SMTP id w20-20020a05622a135400b0040b90157eeemr3549676qtk.8.1697742715542;
        Thu, 19 Oct 2023 12:11:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697742715; cv=none;
        d=google.com; s=arc-20160816;
        b=nfKaHsPTiN/hNn+6/P+UsitvfAMwXK2C55K3PwV2NLKDKQo0V3X0WmoMQMGrQjv0PG
         +zQGeWH/eHD5Uo3z+JTNaTiFnZUzD+7Zgr1GS1HQHeYsN57lIhq9Cgc9W/aalt4G0jiv
         18lzLjMnix4LY5zMHfClsq38mjiU4lWGGWZw0MYCeEMjlCNU/YTaOaMl+srMzaYNjkFd
         fWqXl9ko4EvWKN8DMIXcSXN6j2OdDIXqNhV9/lgE50ih7rBaTwQhdS2sFgZ5cbHP6Xj5
         7XNYxfjK6bNOWBgecVU8EgOCTt/RRXLclZjOI51fkd/aG0tVQniQ8VzdyI90cY56S3Q7
         scRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=xXpghZgxXfjzdj4iZW+QGkAoeoW+TbyEJIWXFwrNOTg=;
        fh=Xlf3et2nYyn6Dffgqd/l95XMDkc357MJlcbLmxiOqZU=;
        b=Ze/k0+Jg0i5wOwnE5D+0KK0V0blcx2tKkXT+tUjEcC1NszMZvQ5gOALL/pLaU0C4Lj
         FHwbR/uYJBNyuBqLSCz1GjgVPkA/RmEJi3DStHLpvYAwlqZPhWkQwUjR3P2C3Pfwdx6i
         y17XbfAuujJt53Rv2X0Qm3/Q2J7M9pYxBZYPu01NLy7WkcwRd+N+pc4LqPv+trcGODgu
         eZdkRvkxSlgeOckiZP/wjJqehbRW95vdifyIWaFSdp8znBM3Mox/LTOJZT9YHqahzwrG
         yvDSfxZ+sTd0uFNVIiRyQyAwOoGRYDdUz5t2i6NlX7ebZzN4jpqXEWc7XLIWef1wp3Y+
         DYUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GXnsXDK4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20-20020a05622a189400b004180bc0da7dsi71216qtc.397.2023.10.19.12.11.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Oct 2023 12:11:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GXnsXDK4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qtYPV-0001vp-RF; Thu, 19 Oct 2023 15:10:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYPF-0001IH-Kz
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 15:10:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qtYP9-0005Te-AM
 for qemu-devel@nongnu.org; Thu, 19 Oct 2023 15:10:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697742597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXpghZgxXfjzdj4iZW+QGkAoeoW+TbyEJIWXFwrNOTg=;
 b=GXnsXDK4Yb7Z7qtQXnSQrbRjrxOrLV6QWOwkJ1l8YtNq5+3Pjbfek8SbYUK66NAUlNspSD
 QxOy7vVQmVpyv1GhnxcZWwUCkAKf0QoTcOOBDseuNGrCW7guNE1T/JwNT3ukSPiWci0bAf
 iQMwiofTug3p4hHYy1w01oqTwHExLCI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-x9AZaYXVNEmqc0lSA50PUQ-1; Thu, 19 Oct 2023 15:09:54 -0400
X-MC-Unique: x9AZaYXVNEmqc0lSA50PUQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4EC521802A08;
 Thu, 19 Oct 2023 19:09:49 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.127])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 582381121314;
 Thu, 19 Oct 2023 19:09:44 +0000 (UTC)
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
Subject: [PATCH 13/13] migration: Use vmstate_register_any() for vmware_vga
Date: Thu, 19 Oct 2023 21:08:31 +0200
Message-ID: <20231019190831.20363-14-quintela@redhat.com>
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
X-TUID: SvhZKIHp3Vn8

I have no idea if we can have more than one vmware_vga device, so play
it safe.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 hw/display/vmware_vga.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
index 09591fbd39..7490d43881 100644
--- a/hw/display/vmware_vga.c
+++ b/hw/display/vmware_vga.c
@@ -1264,7 +1264,7 @@ static void vmsvga_init(DeviceState *dev, struct vmsvga_state_s *s,
 
     vga_common_init(&s->vga, OBJECT(dev), &error_fatal);
     vga_init(&s->vga, OBJECT(dev), address_space, io, true);
-    vmstate_register(NULL, 0, &vmstate_vga_common, &s->vga);
+    vmstate_register_any(NULL, &vmstate_vga_common, &s->vga);
     s->new_depth = 32;
 }
 
-- 
2.41.0

