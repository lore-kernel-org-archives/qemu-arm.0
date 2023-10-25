Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2970354ejb;
        Wed, 25 Oct 2023 12:14:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJR3fWSj/ntTlgWgMw79TWLstXdbAkKB7ar6e10q9tkg6hSMgD5Nt9Fpq3KoUJU459Fl4Q
X-Received: by 2002:a05:6214:5089:b0:656:3fbd:d1f3 with SMTP id kk9-20020a056214508900b006563fbdd1f3mr19428223qvb.11.1698261279782;
        Wed, 25 Oct 2023 12:14:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698261279; cv=none;
        d=google.com; s=arc-20160816;
        b=CsMQOJ5c5xfzSU/U6VKLI1xOUN5iXjE+OMcJXjrdamiC6PKmmWPkE+U4ZrBPtZ7Yn9
         5t6v1776IgsaRLOyrzDg1MD+BNr8Vx2f22wPyTNqRUnqA5XstdHjWL3RwULaT98kGpbP
         C3HyEFGxMfehLPAs5xYhKxovhL4Cn1+lvdFWduOJ493iLjOraYS+3TL3sVXeI9Sq7UY5
         Y+wgD6pfkEWxndtGV2HxvtSFGECbXzCRLTY5EShbhBkxGm3NANuSA+mUlqcRYsL11kxm
         N+RKmcUr8wWMTvA770UdSlQckdIBjFLTXkLDOZJf72zDR1Vpw5xz9IFJHYNAbxE4H6YO
         Kbbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=snDzsaIt7Lr9u4SfhZnMzqFdbfsgIPQia8N60hmDNiM=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=MtDXsV9usMJobheS5vevwfCNZQMkdHKvH2y5MHTgjdPLC1AdHgSllV1CjNUaaPwc95
         4ovxEh322vP+1dEnMtNrJXK9cqN6GzN39bdKGUk9OKSZlBD5eozY4SnlZdxE8wDm3sZr
         UJC/vAYdDPOoQO4e7FJ5HsUNaC8dvCF6Ve5P++BPjTrpqDvczTA0KBqCxVUWDKTUx9IZ
         LVk/KF1KPWwDL0lv1GuZ69Sk2cRAVp8T5JmY2AvQvSFWy3a6xDuck9/Q0laRS2H2sft8
         2R0v1/x1RJ/IV6nkFnFx2ecMoG9Arv3znW0W4y5qY3vLG8IomlG/B9spmzRhdv6BMK0R
         5tww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GtzSSkcT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fc17-20020ad44f31000000b0065892c14203si8691417qvb.412.2023.10.25.12.14.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:14:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GtzSSkcT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvjGI-0006RG-B9; Wed, 25 Oct 2023 15:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjGE-0006Nu-Q1
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:09:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjGD-0000dy-BW
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:09:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698260984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=snDzsaIt7Lr9u4SfhZnMzqFdbfsgIPQia8N60hmDNiM=;
 b=GtzSSkcTL849jrG3Bjtz0eKgbVYuo8+6WYtSa0It85TZc3Pfh/Vy0lg/xGp31hAcPhK5CE
 +hnXi/5mXta2nOK5WMQ5lINsL9qKs7Vwu5wLuTOJsbUpKytufo/VN4lgYev08yZJjwl/m5
 bTWLVq6uLLEp5QgSR26AVUs6xAM70uE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-335-HJu8LzlzPjSC3-MfhqqAdA-1; Wed, 25 Oct 2023 15:09:41 -0400
X-MC-Unique: HJu8LzlzPjSC3-MfhqqAdA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A1201185A784;
 Wed, 25 Oct 2023 19:09:40 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B7B8E2026D4C;
 Wed, 25 Oct 2023 19:09:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v6 18/23] ui/gtk: -display gtk requires PIXMAN
Date: Wed, 25 Oct 2023 23:08:12 +0400
Message-ID: <20231025190818.3278423-19-marcandre.lureau@redhat.com>
In-Reply-To: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: MqK57FI8fka6

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

