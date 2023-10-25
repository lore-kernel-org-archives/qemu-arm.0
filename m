Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2967180ejb;
        Wed, 25 Oct 2023 12:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEedyZFV8QCPHrv61V97cvIoVoVNTRSoHCTF7JAvFr0yEcUzXfCcLFzNLwbhywX6wPSni1k
X-Received: by 2002:a5d:6892:0:b0:32d:8b21:40fc with SMTP id h18-20020a5d6892000000b0032d8b2140fcmr12770095wru.9.1698260955478;
        Wed, 25 Oct 2023 12:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698260955; cv=none;
        d=google.com; s=arc-20160816;
        b=YIAC3xNwFMYa8eHL2iGu0rh4y1nvo9KUGNJe9OzdODGjqVUDwTqcDbdJ2yECTH+g2u
         W4IvPWXOAr4MmQYfg/CoWJhzEnArDMHz0KBwGdwvXryXgKEardZLK04p8f18UtfKOLGW
         kbYqFZq+v4xtHT2CA2c54DqVvemiPJHvwnZxtvmcWZrAH9W3gmh01Dm0xzXHI7ywcj7/
         96Knvlfmpe1aGoGud9S8d29iTu3Uo1LTCyRfxXi1os9dQ0lDK4i8GGGY/5tp3iKLpx1S
         c8FQLFc57Zn8qgiLTSHusoEg+VgfoOJx7TbUeWoQxBF/foihsnGOHgw8oA4r1/3cRixO
         9k5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=IM0H9rL5URz7P4Ao+YD2rtrDx5QHrJq+HKt4pYKjiO4=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=pX5xyXdY7/kja0CvZEyv25UewkzsPccmLIFiZEUWvQcYDlEoTqCDBciJTBnAfG5TzQ
         Z2SU8MhT5HIkWtkKLDH2PbNTyMfWARes1RoVBTUyj1b1WY/RhSDMw/uvrrcvtf5Waw0T
         oISellbkBScZtkAvvp3+mYs9BVcaW4Mb2OoBwNhuTVpqHlMjSV1WWl2ffvoh43/U3YML
         Cctnva5jf1YukehERay+x4oHkdUus9eJhct9CMS3WPZbxgPg+EE7SBERknsA4AYtQFXV
         vDOmNNplIaZMJ1IbQtTWIUEWmFc8Pco/cJNVjXK8jYfXtTEjZqxGBFEBNJrdevPhyazt
         N+3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YLl2gGG6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n7-20020a5d6b87000000b0032d8f075815si7916631wrx.373.2023.10.25.12.09.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:09:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YLl2gGG6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvjF9-0004V3-6g; Wed, 25 Oct 2023 15:08:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjF7-0004UL-J9
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:08:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjF6-0000F3-3R
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:08:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698260915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IM0H9rL5URz7P4Ao+YD2rtrDx5QHrJq+HKt4pYKjiO4=;
 b=YLl2gGG6tm5YN8t6aZce0BKTDuYNl1ze3WupZtV9+ji16eCqtwMjqK8nArzy6dlKOHkjCw
 bdl7z+NHD2VdSTkmOLq3l7RO4Ef6Zqb9FU9QGSHb/1iLpBp+cs1W0Uglwf6DV5UVoe6AXC
 fksh4WICGaqz2g54R+LPg9EJ7MItFJo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-bEAuwKfnP6urNJkJHJUnMA-1; Wed, 25 Oct 2023 15:08:31 -0400
X-MC-Unique: bEAuwKfnP6urNJkJHJUnMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 624A1837222;
 Wed, 25 Oct 2023 19:08:31 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 264D3C15983;
 Wed, 25 Oct 2023 19:08:29 +0000 (UTC)
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
Subject: [PATCH v6 02/23] build-sys: drop needless warning pragmas for old
 pixman
Date: Wed, 25 Oct 2023 23:07:56 +0400
Message-ID: <20231025190818.3278423-3-marcandre.lureau@redhat.com>
In-Reply-To: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 8lCtsPXj+Isf

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Since commit 236f282c1c7 ("configure: check for pixman-1 version"), QEMU
requires >= 0.21.8.

Suggested-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/ui/qemu-pixman.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/ui/qemu-pixman.h b/include/ui/qemu-pixman.h
index d37feb5e3c..4bfa8fae0c 100644
--- a/include/ui/qemu-pixman.h
+++ b/include/ui/qemu-pixman.h
@@ -7,11 +7,7 @@
 #define QEMU_PIXMAN_H
 
 #ifdef CONFIG_PIXMAN
-/* pixman-0.16.0 headers have a redundant declaration */
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wredundant-decls"
 #include <pixman.h>
-#pragma GCC diagnostic pop
 #endif
 
 /*
-- 
2.41.0

