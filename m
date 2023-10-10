Received: by 2002:a17:906:b756:b0:9b2:89ee:1eb8 with SMTP id fx22csp297648ejb;
        Tue, 10 Oct 2023 00:41:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiRbabQvA1AMOOFVBszGFOJ9fxHR6TmT4PYZFY0W8XhXg9wrKaojcygGSeSJ8DsewWAVPQ
X-Received: by 2002:ac8:5b85:0:b0:418:1aa2:6b1a with SMTP id a5-20020ac85b85000000b004181aa26b1amr22632827qta.46.1696923717287;
        Tue, 10 Oct 2023 00:41:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696923717; cv=none;
        d=google.com; s=arc-20160816;
        b=H8hgLoyJR4W1D1X/oxOPBzkaY8hM5IayNw1pRq4wIAzTldf5ZeDW+XXfh/8MjgkjxW
         rmxHXKooR+oii7gQyoGDkSPJWjAG/BzO/L2eQnjPROv6bNMR/ScIQRfpbMs5hnm02NkG
         HAglTwA8E/vsaSFgBzvKKMzVFuR/Gc5LmJr/7EigL7YDbdQVoQscxmbi7nbAgrTIn/yk
         tezUTI3if1Q/uLanQUCBRcREZVfU8jCfFKXUGILFXhvamEJOTUSXHDuLUcVf9YhyloOX
         XvDGfFD7MNvl7mon9zC70nMZ9y76ckb96jR2tWNuBt2seg/1Ukw5jctsH9Ez/teqbM6D
         7KrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=luG8MNFoBo+9xrNK3btdo0HEw8saff2GlFzHGAbN/Po=;
        fh=46wv1No7OOLuZCRbeGSaV31Ktmo6cwaISz6jgi4/xrY=;
        b=Lm6OGMoXRr0FS32QCSFou0uHXOuwrIcIxk01AgU3khCpU5qVrWs0l34fbV9v0rg5b0
         uktWiUY2wz8qPTKA8Pc081uU40EgU50XRtUf3JYjZln2FWC+O18tNFD/A2kGqp9cHzYh
         de16QxFShBvXyUDdRTQuWPkHEYG1kfdkRMjsP1OioVOdlEh4lqMYSwC56zJs3dpwA2HM
         eHqmbbfndzEirZSAGIT6W18/D7cJNfuu03faM76DRdoAFOGPzR2OMwG5RGYND04SwuMG
         xcnX/m2Em9BkLzetmFLDNm7vgMqzxq5VP/zTdMz0BegKYHX3/1YUILKWD8DuHU/+dYvk
         Ae8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HqJX3Pyk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q9-20020a05622a030900b00405516e0cd1si7368980qtw.445.2023.10.10.00.41.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 00:41:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HqJX3Pyk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qq7LW-0002n1-1e; Tue, 10 Oct 2023 03:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7LR-0002RC-T9
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qq7LQ-0001uR-F7
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 03:39:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696923595;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=luG8MNFoBo+9xrNK3btdo0HEw8saff2GlFzHGAbN/Po=;
 b=HqJX3PykC7ZkyKXvgEtNRz7BD4/zuNcOQkFaM02vBXjGr71o47uN36qlDkWsvSOsVpbV2i
 WpmraWwQsi/Lf9jPinTIFL/MpiVEqsN4r+AZIwxI2QwApB9QLJ3xbdL4BIY+CZJCrlq+1K
 AushjyF2+0R3NY01KfTER0RJxKWHLQ8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-3PYAYUocMnmdzTAfx6Qwtw-1; Tue, 10 Oct 2023 03:39:52 -0400
X-MC-Unique: 3PYAYUocMnmdzTAfx6Qwtw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9B469858F1B;
 Tue, 10 Oct 2023 07:39:51 +0000 (UTC)
Received: from localhost (unknown [10.39.208.4])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62662400F36;
 Tue, 10 Oct 2023 07:39:50 +0000 (UTC)
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
Subject: [PATCH v3 18/18] build-sys: make pixman actually optional
Date: Tue, 10 Oct 2023 11:38:30 +0400
Message-ID: <20231010073830.606570-19-marcandre.lureau@redhat.com>
In-Reply-To: <20231010073830.606570-1-marcandre.lureau@redhat.com>
References: <20231010073830.606570-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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
X-TUID: oKxKPx/tnjq5

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meson.build b/meson.build
index 64d2aca79b..a35eb8e2ee 100644
--- a/meson.build
+++ b/meson.build
@@ -817,9 +817,6 @@ if not get_option('pixman').auto() or have_system or have_tools
   pixman = dependency('pixman-1', required: get_option('pixman'), version:'>=0.21.8',
                       method: 'pkg-config')
 endif
-if not pixman.found() and (have_system or have_tools)
-  error('FIXME: pixman is currently required')
-endif
 
 zlib = dependency('zlib', required: true)
 
-- 
2.41.0

