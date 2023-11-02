Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp322442eja;
        Thu, 2 Nov 2023 04:45:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEpDK6bYTdtgfdZBQMuPI+Vt9E8DfN7wbznq2Ni8mFC2ucYNgRp6JDneuOwfcrALjvF4z1A
X-Received: by 2002:a05:620a:4551:b0:774:a80:3e0b with SMTP id u17-20020a05620a455100b007740a803e0bmr21913484qkp.5.1698925543247;
        Thu, 02 Nov 2023 04:45:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698925543; cv=none;
        d=google.com; s=arc-20160816;
        b=Tt160JmoMP/aHjVqidCBpM6XVle8lnTziCxhjbW4awUo+wEdv/Zr5ieHz5kOxVLWUQ
         HvGuVVMFJDsPlkJxOoCiqUPlgOpxkWGb+vqV8wVjzWykO4zMKOJBGFJMz4CWd1tv14I6
         N3UbK8Lw9wQNId+KtrkF00PKLE2YoYT91yrBCv5Xb7U8AWRcHstHCYyc0vjhINJkRraC
         tAl7qUgDLnFxK/JFn0V6ZzaAqQLBUYOvI+JYNIZgApFSYA92DmSvMLlDbr75poGO0und
         lvOlC2yYokDZM33LTtsDvjaIGaSF0POsYnpPM9z2uNxKD6Fnf3qHbxTp6Uh7XzrKt+kG
         a3zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=B8ocWw2ONtnyRRem5Wy8aSxVhZeV7mTRtMjtmw7eCE8=;
        fh=9XEyySFYRp6Olqe53+AU8I52EufRgt7BknvnnkPQpGA=;
        b=ptGAsZMwRKRC09SovXJYAOiLcvXy73m1j6Ga6ucd79g1n/7LC9fV5lxM7MrAhfKRkC
         QBeagHw0yq1m0eQG5l2JJRM4OaJ3apLWieyyzpjL2zSMCB/N+M9ggUIseXXvNsovAeG+
         h6wVAMrLCsldJpt440J/OuUj7oi5bQzxfh8TLQJvFUNnIci074cARcZ3ZlLJjVdGCOlO
         qNmEx4iMYKyBtGnQ52t4VYSxXbdEc7rfsMx7KcGQJl1Qz3ZiUKRU+0PrVSEErSZkXed+
         jlyk/rkhFF4dleUZAVc9xTwvIANp/wZm3StyArWfClOgyKgGtartwb2VcQ6O2ctgeQCK
         T1aA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VtSDq/h1";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020a05620a404600b007783026be9esi4503891qko.621.2023.11.02.04.45.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Nov 2023 04:45:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="VtSDq/h1";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qyW72-0005z7-SN; Thu, 02 Nov 2023 07:43:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW6H-0003z8-K8
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:43:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1qyW6D-0005Ru-QL
 for qemu-devel@nongnu.org; Thu, 02 Nov 2023 07:43:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698925376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B8ocWw2ONtnyRRem5Wy8aSxVhZeV7mTRtMjtmw7eCE8=;
 b=VtSDq/h10wcNE5CO/Ucx5XTp5MrcKDlZTM96Dt8isdpP+TwYBO0ep8+rt3mxWNDEbwz+oQ
 E5wIvW+RPqAuICX0X+vV5r3d3W5oqPUpPt03/5Nb5NTvXHN8Pr6nGBVOVlyjQ1r2edGyCB
 5wg/vZgIKcIufEwnhWrJVu+BxMpUINs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-flIAd-O3MAeOK6gR0NjoGQ-1; Thu, 02 Nov 2023 07:42:52 -0400
X-MC-Unique: flIAd-O3MAeOK6gR0NjoGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EF03C831524;
 Thu,  2 Nov 2023 11:42:50 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.195.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 912862026D4C;
 Thu,  2 Nov 2023 11:42:43 +0000 (UTC)
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
Subject: [PULL 14/40] migration: Use vmstate_register_any() for vmware_vga
Date: Thu,  2 Nov 2023 12:40:28 +0100
Message-ID: <20231102114054.44360-15-quintela@redhat.com>
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
X-TUID: MIQfOHZhtkOn

I have no idea if we can have more than one vmware_vga device, so play
it safe.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
Message-ID: <20231020090731.28701-14-quintela@redhat.com>
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

