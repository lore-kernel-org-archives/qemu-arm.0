Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1773941ejc;
        Mon, 30 Oct 2023 03:50:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEY5bF7a20hUD9k1GNmomu9sGyqKJjV0DIllyswRMXks8qobRWZSP5VQSUtDR/uUmLku7FC
X-Received: by 2002:a05:6214:19ed:b0:66d:1e8f:bb98 with SMTP id q13-20020a05621419ed00b0066d1e8fbb98mr10227254qvc.59.1698663036312;
        Mon, 30 Oct 2023 03:50:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698663036; cv=none;
        d=google.com; s=arc-20160816;
        b=ZoIds1UfPtiPiAkaV6EWWaM1SoXhJ/DFGGtEwUbiEYkiiIWZbm6+uR8JCH97TzxVlw
         syv1lmao4ku2RLDMKq+CBRCWRQ92KJxuYXstBpDNkAW8zML1kYyMzeC9senhsnX3YUJv
         IZSlaNh4sPvvKbP9IiFZCQvZmlRYK9dM6gNI1yL5945fPhpIh6NH+FRsD+WtYGJzBH+K
         KyuUKUSy/w7mVnTpKam4PqwNuUWVs6YkKQL2GWBeZnjPgcTLYVBQnhUxQeHhi4qdI2Hh
         8Jyxaf2YhOeOYvFox6kc0JD789twZVAs3HyrH4NtPp8qLfGaIUH76IVuqeuk78YimcrX
         KV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MUYXOavKjr3nBQePklqtEwSaDfyRGwnYpWD8MCr0umI=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=o+tBsd1+0BIDHxlknfsPn8SgyJiXwWqdUSTyUn9mVRdkHDKjL5v6kchA8JcRf9CR/1
         CRMn8XaYoa/gMeID1AvgG7FZfpnog5ljYiWw/MZkjZXJa5KJvZgNXlF9S4LzZ9qZdFu5
         a+oXVkGtOm3lAuzBOrAFyezeMIbKbcQHfDHKb2CRritawukC/l/eUhAnwWnGoiJ1FB/6
         NPyzF7e7HedPRjSXl6WYt78s8LkaUEFBdIMCVxFGLrGTGO69s5OY56AzUt+vaaUKXsDp
         WqDsGSVhH2/dcik3Cvo0/mfwsrnYNFJRHmedSnPIYmAOrjRnGPSlz9Z24bIAEZNw2pva
         qddQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aut0e3Gu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5-20020ad45aa5000000b0064f91de2ed8si5842100qvg.551.2023.10.30.03.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:50:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aut0e3Gu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxPpa-00031j-93; Mon, 30 Oct 2023 06:49:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPpW-0002rD-Hx
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 06:49:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPpU-0002fd-BQ
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 06:49:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MUYXOavKjr3nBQePklqtEwSaDfyRGwnYpWD8MCr0umI=;
 b=aut0e3GuPYk05tvmMphWMB9nEDxEi8zHJI3zL03/oYDruln3IFC25pdgFTeKMtWReSLIMv
 bEGKNpowQFMO8NB8b+ioAOAlH2GJNkfsbPJtdfj5HYck8ZQSDy8QTb4quqvt08l3aXJBbC
 tGzAXGPc1CeIbkNxnwCuHy4dlQWhTRQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-nEJ4uIdRMSqdVWzr66c_Vg-1; Mon, 30 Oct 2023 06:49:06 -0400
X-MC-Unique: nEJ4uIdRMSqdVWzr66c_Vg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4110985A58A;
 Mon, 30 Oct 2023 10:49:05 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 355BD492BFC;
 Mon, 30 Oct 2023 10:49:03 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Subject: [PATCH v7 13/23] ui/console: when PIXMAN is unavailable,
 don't draw placeholder msg
Date: Mon, 30 Oct 2023 14:47:44 +0400
Message-ID: <20231030104755.124188-14-marcandre.lureau@redhat.com>
In-Reply-To: <20231030104755.124188-1-marcandre.lureau@redhat.com>
References: <20231030104755.124188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.478,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KyHc797mLasw

From: Marc-André Lureau <marcandre.lureau@redhat.com>

When we can't draw text, simply show a blank display.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 ui/console.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/console.c b/ui/console.c
index a72c495b5a..8e688d3569 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -584,6 +584,7 @@ DisplaySurface *qemu_create_placeholder_surface(int w, int h,
                                                 const char *msg)
 {
     DisplaySurface *surface = qemu_create_displaysurface(w, h);
+#ifdef CONFIG_PIXMAN
     pixman_color_t bg = QEMU_PIXMAN_COLOR_BLACK;
     pixman_color_t fg = QEMU_PIXMAN_COLOR_GRAY;
     pixman_image_t *glyph;
@@ -598,6 +599,7 @@ DisplaySurface *qemu_create_placeholder_surface(int w, int h,
                                  x+i, y, FONT_WIDTH, FONT_HEIGHT);
         qemu_pixman_image_unref(glyph);
     }
+#endif
     surface->flags |= QEMU_PLACEHOLDER_FLAG;
     return surface;
 }
-- 
2.41.0

