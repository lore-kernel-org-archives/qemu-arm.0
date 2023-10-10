Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp297488ejb;
        Tue, 10 Oct 2023 00:41:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXZFMSY2giFn+0xpD0AOegoD5xUPs9Zw9ddrG/OvMGtk1hdexqxbSpz5j4L+rilyXXpvhT
X-Received: by 2002:a05:622a:30f:b0:419:4f1e:7ea9 with SMTP id q15-20020a05622a030f00b004194f1e7ea9mr20303639qtw.3.1696923692565;
        Tue, 10 Oct 2023 00:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923692; cv=none;
        d=google.com; s=arc-20160816;
        b=pB02ymMH4+lNTjJvExeLXhz5gJLMCT2J2Og1DqeECIAEHp5NOsL0QWc3OzhhHaK4H1
         lavuFP8YMxgOdtaWwaFOjUyr8wYq2KYHHqB9SlIqxMlKt1haYfwKgFmDQXT0qRu8Escw
         vI/k06uliuKelgwDMvCCa3UGVz/AUujwZ8GbhUy18j8VVue4RquI30CUR1EdexFaq+HC
         aN9zHFQmFSD2pewIiJtw5LTQR1NXoyRDuBmB6G/CZ8i5A/k8Utrpx1G+s2YzYDNlQ+10
         WHlbPJ1Y4n5sS7XnLHe1FeHHGQNwsv2eMasjTJsoW/JmNon8uQxsmLC/52FR5EnLbM3O
         zGng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fAYbo/22+Lk3//KJ9ZZBNn5UriCHW++RvethisZHvBg=;
        fh=46wv1No7OOLuZCRbeGSaV31Ktmo6cwaISz6jgi4/xrY=;
        b=jUCSyO4PBn+DaYRkc4t4pGAW80M/iELQS/rF9kRZJhN4g2obDgA8g5Sl1mwuShuJ8J
         JJX6tOj5FBNHmf7bSG4hXAkgErcPT5BTnen5GaBFFx9cXzQLX5pwLoEYY4af7lCOZfvc
         25xbXdS3A6+YpgJFxEQPKYiFYvhkJ0fGaR1nhjWjr+/O97DPUZmrfQTgb7UEQ34pS6o+
         MWcQGJJiuptw9tCNLVXFITMT8GSpuuDIRmW0fFxxdACj+i7yhNQ0Q0VRyz0kFNT3ubN1
         SCBK1ofDuJ4L5BbP/6r+myyGBbAXnnKTtD9YKPKAWqAXK++zB/NJQfraJcD8jmtIT72+
         6eHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NozJS1Wx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15-20020ac85f8f000000b004194c70c559si7229259qta.653.2023.10.10.00.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 00:41:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NozJS1Wx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq7LU-0002Zn-K2; Tue, 10 Oct 2023 03:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7LK-0002AT-KK
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7LI-0001sC-7L
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696923587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fAYbo/22+Lk3//KJ9ZZBNn5UriCHW++RvethisZHvBg=;
 b=NozJS1WxE299iALbL29JgUYzeZL+aJes3eRVbIjnbBWbMPewQ3di4D+HvQZRH/LdalH1Nt
 DhObd0uzd8xqB+dOdbNNzDZrkEru2koVXMQbJ+h7h45KxaUiVmaVRbKVmmfgS5KdAapuQI
 RgJDijn3M86DbDKWEvSUw0I4WwWTUO8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-lk0RaqW6ObO6KKUPzYM0lg-1; Tue, 10 Oct 2023 03:39:30 -0400
X-MC-Unique: lk0RaqW6ObO6KKUPzYM0lg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B926F8039CB;
 Tue, 10 Oct 2023 07:39:29 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BCF672026D37;
 Tue, 10 Oct 2023 07:39:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-arm@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 13/18] ui/gtk: -display gtk requires PIXMAN
Date: Tue, 10 Oct 2023 11:38:25 +0400
Message-ID: <20231010073830.606570-14-marcandre.lureau@redhat.com>
In-Reply-To: <20231010073830.606570-1-marcandre.lureau@redhat.com>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
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
X-TUID: 38imW0dp/oyJ

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index a84a2f25d0..64d2aca79b 100644
--- a/meson.build
+++ b/meson.build
@@ -1501,7 +1501,11 @@ gtkx11 = not_found
 vte = not_found
 have_gtk_clipboard = get_option('gtk_clipboard').enabled()
 
-if not get_option('gtk').auto() or have_system
+if get_option('gtk') \
+             .disable_auto_if(not have_system) \
+             .require(pixman.found(),
+                      error_message: 'cannot enable GTK if pixman is not available') \
+             .allowed()
   gtk = dependency('gtk+-3.0', version: '>=3.22.0',
                    method: 'pkg-config',
                    required: get_option('gtk'))
-- 
2.41.0

