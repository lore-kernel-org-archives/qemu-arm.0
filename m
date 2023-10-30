Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1773782ejc;
        Mon, 30 Oct 2023 03:50:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhRJhWnLn/B7M6pGlLhv0plgq6k3j5hVf0HvWFDtIiG+tlW7nhof0nvKtBYwRh+m2FeS/z
X-Received: by 2002:a05:620a:1a26:b0:76f:1817:942b with SMTP id bk38-20020a05620a1a2600b0076f1817942bmr10580015qkb.28.1698663018079;
        Mon, 30 Oct 2023 03:50:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698663018; cv=none;
        d=google.com; s=arc-20160816;
        b=qL75Uf9twDiUTSbs4k7YUWPwz1kxngQIwqs9EoztvA3AohySXrMCVEOlJYX7RHNEXh
         5oeGX+K1TLdByL/jwLuAuLwIiVw4srtJ3fbVQb+tpdoKN/y233uSo0c5GcPI6O28eB4U
         Cnsz6qHVK2WaUSsW1mNN0cVoOA94hr7QNF4EsgawFQm0R0MDyhma8QMBj/7S/Eom0sot
         zy+JrPscuIfEAHD/i/cv85jc43Id368w3W9VL/xR5idfiFMX4kMLpviMeRIFLfP4lV/9
         mMXf8ZU/3jfLv6oHtcJE91SXXwZoltTuy9lXFo5Bkuqq9jewY5ksT9byiI48ZGHxwki3
         QGbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=snDzsaIt7Lr9u4SfhZnMzqFdbfsgIPQia8N60hmDNiM=;
        fh=Ci9wK9l4xitOqL9yuxnV9ynOTs+kWb6MxTZujaeFoew=;
        b=aN+JNgbBZbQ0F5mYeM5g6ntGLUy9AVAfDizNkLsssSfzRhVkYhKceK9viaM4NHSPjD
         CmiGJM82+q153ombzPzPki1qLKuLAgaMkvjPaiwv+AXopPyqUY2U4MdY6703uVSfzFyk
         yLiSLMO8AVMJj9GOAzZXMXUWgzB6+yajVd5DHLj0eqL3ZUIPHQjnaQFoFsSQheS88a5e
         klJA/Y2yM1sWE3wBOqV6y2SI02apwqKuHQSoCehfdipal5b8sX05RX02L8VycIuansB2
         vbrxOI9q3ixyzOb/vTt6SYZ1AxbPnWshmT8QmW0VG214PL1cAp4fPUuEKaH2Gua8lx7n
         ZI1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dC/3Sgv2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a05620a410600b0076d8dff9b96si5534448qko.734.2023.10.30.03.50.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 03:50:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="dC/3Sgv2";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxPpy-0005Aj-K0; Mon, 30 Oct 2023 06:49:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPpw-00052a-RA
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 06:49:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qxPpv-0002kT-9O
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 06:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698662973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snDzsaIt7Lr9u4SfhZnMzqFdbfsgIPQia8N60hmDNiM=;
 b=dC/3Sgv2yvnyZOmCDlsEQh7YNjZUldsgafA/gUKgIhhuOn/b+Wl0Eh7ZDL/BXasab/FEOU
 BtyTdQwL8P1zWIG2TVtI0bAvYfU4oUp69rphwrdEdI2+Hm6FUjjRX6epkGXGu55i+RIwoF
 PQldOU2o8TA55pv+bAkk2aLGOrfQX/Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-326-fcPPohKAMd6Pz1PibC_ftg-1; Mon, 30 Oct 2023 06:49:30 -0400
X-MC-Unique: fcPPohKAMd6Pz1PibC_ftg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DE05101A53B;
 Mon, 30 Oct 2023 10:49:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51913C1596C;
 Mon, 30 Oct 2023 10:49:29 +0000 (UTC)
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
Subject: [PATCH v7 18/23] ui/gtk: -display gtk requires PIXMAN
Date: Mon, 30 Oct 2023 14:47:49 +0400
Message-ID: <20231030104755.124188-19-marcandre.lureau@redhat.com>
In-Reply-To: <20231030104755.124188-1-marcandre.lureau@redhat.com>
References: <20231030104755.124188-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.478,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: ilPH4rw6haC+

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 0dbad80fcc..ad1e0155ee 100644
--- a/meson.build
+++ b/meson.build
@@ -1507,7 +1507,11 @@ gtkx11 = not_found
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

