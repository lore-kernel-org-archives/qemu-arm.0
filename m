Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp4645326ejc;
        Wed, 18 Oct 2023 06:39:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPSYh4rlJg1VJ6RXTqlv8zqdUQZSyvKvnJrTL7ajoOe0107XANMF9WTURfcaOh92CrHxfS
X-Received: by 2002:a05:6214:21af:b0:655:dd4b:d077 with SMTP id t15-20020a05621421af00b00655dd4bd077mr5591954qvc.51.1697636390829;
        Wed, 18 Oct 2023 06:39:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697636390; cv=none;
        d=google.com; s=arc-20160816;
        b=nHkfX970jK0YKQU1GvpFfFxaVRuxQE8qGJ72emqry+2+3UDE209w0Jah6Q1i7Q4tBK
         xRw1K62Jw3vaE3k7fJxCXpouJp8Ev5REgz4FvAlCuxcC22xZxiJFipGG/2rv32Xtt9gy
         NgjFyQqSvnCvyac0FACbaspzhaBGEev/0j7fYTbfSdb7IaawNpvgg1iiEGMRkCmEU9oi
         lf2A6wu0wC3ywpxg+ix58UARUOHB4R+ufF5v02yoE7upyrLzeziCX5a85CLCXSqqxcQm
         3zAEWtphwU8MBhbywZTqudfVxk9omZ5RIS8YDk7bg9BKMn/B0PZAWEDiUygszb8oS4za
         9MTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=p+UyDiooVpIusnB0+uFqzUBmzzQu0leEMmYBER18/nU=;
        fh=Szf62vI2mdRKxFE/n72kPzB8VnojR8p9hbcglhPNB2o=;
        b=mbIAnOYA7AAwvBByWb4JxD5jGU4XTo8H0cLVTGUNgM8cYAH9MM0Z1DaZbcVoBqTOuz
         y0Yo3yDr7yD19fVRW129no/9V2JnFrFyweJvoa3aeDvWild5/4tLvsrbI3y7ehgmFMAX
         PpFRvHyU+uZ0XAJvMU+hrfDjIJEol4KGmKP1u3E9UW/jC2jXl1YhDqRMSsAG9C+0w270
         hgjhY8ds8A2r1h//Jh1TONLXN6/TdwamT9YN4F/6ndRUn3c9VcpooqI+MOjqi+voR5YY
         E+DEsa2IfVdLbHb6G83YU4mXoFy9tLZffWG3VNQc5Sr9t6b+aIZWCgIgv5FcgHjbEJ0z
         I+HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TD2e0Ook;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i13-20020a05620a404d00b007742221bc37si2774444qko.747.2023.10.18.06.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Oct 2023 06:39:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TD2e0Ook;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qt6l7-00087X-Qt; Wed, 18 Oct 2023 09:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6l6-0007zF-4Z
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qt6l4-0006AN-Lo
 for qemu-arm@nongnu.org; Wed, 18 Oct 2023 09:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697636326;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p+UyDiooVpIusnB0+uFqzUBmzzQu0leEMmYBER18/nU=;
 b=TD2e0Ook5kfksWYyIk+fwwl3X4zXZqW+stK/ucCnnJDDZAKUEJKs6cBqP1p+xxxILqLUlM
 yFxbLZysCAzvkp4yT4jsM4NozCW/fnj3XHAU2EA7EfhOaBCxVwoFHVEAIy9Unl2VT1n+wm
 NDov1fxg8dSwhHSyEoG3oHRTUurjqAE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-588-6BEjczxAPfqI6wuUEJoVfQ-1; Wed, 18 Oct 2023 09:38:42 -0400
X-MC-Unique: 6BEjczxAPfqI6wuUEJoVfQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C0C7185A79C;
 Wed, 18 Oct 2023 13:38:42 +0000 (UTC)
Received: from localhost (unknown [10.39.208.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B4591C060B0;
 Wed, 18 Oct 2023 13:38:41 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 "Dr. David Alan Gilbert" <dave@treblig.org>, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v4 04/19] vl: move display early init before default devices
Date: Wed, 18 Oct 2023 17:38:05 +0400
Message-ID: <20231018133820.1556962-5-marcandre.lureau@redhat.com>
In-Reply-To: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
References: <20231018133820.1556962-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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
X-TUID: Dm8UtG5B4MZI

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The next commit needs to have the display registered itself before
creating the default VCs.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 system/vl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/vl.c b/system/vl.c
index 3100ac01ed..73e4ed2bef 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1933,7 +1933,6 @@ static void qemu_create_early_backends(void)
                      "ignoring option");
     }
 
-    qemu_display_early_init(&dpy);
     qemu_console_early_init();
 
     if (dpy.has_gl && dpy.gl != DISPLAYGL_MODE_OFF && display_opengl == 0) {
@@ -3664,6 +3663,7 @@ void qemu_init(int argc, char **argv)
     suspend_mux_open();
 
     qemu_disable_default_devices();
+    qemu_display_early_init(&dpy);
     qemu_create_default_devices();
     qemu_create_early_backends();
 
-- 
2.41.0

