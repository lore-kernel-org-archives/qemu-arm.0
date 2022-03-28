Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp6345216lfb;
        Mon, 28 Mar 2022 01:51:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1BfBjYTHf35ZUCLmWDavslGEbP3TXOg4K5yv3/Ne9JuJnl0r11U1s5jL/XuEAtWsz6COt
X-Received: by 2002:a05:620a:2844:b0:680:d4a4:ced8 with SMTP id h4-20020a05620a284400b00680d4a4ced8mr2624354qkp.290.1648457504272;
        Mon, 28 Mar 2022 01:51:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648457504; cv=none;
        d=google.com; s=arc-20160816;
        b=xdX+p963Wk06shOK2lN7w9vqAcXnUsAE1hnTEPSIl5+JO5ew4qhV8EegPZJ0pvpFOu
         ZEVRvvYwlWRNG1o8IJKo7BIhXP18mD8yPI7zbL0YrYFK+hp6IMBEvUsvqDEtR6/xVM/S
         1N38b5BsbYtI1tRC1UnpVpwY4c4VDvJ4sHfxnA2ys3rd3ffjvk+eJ4lDFK+RVXiSWcFc
         ESO+32EMeFs+t9Gzqzh8BjxPPYnf+pLDAbPY3iK8cV1B/GJEC6QU9Uxr8Y10jQ9RyOkH
         O4eX0JiIsm6Rns2uKelTzJHd0qtkpzXUZCr1kho24lPyr/k4Fiv9cT7a4lwuzSgOV6p6
         gcTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eujZwt4/yILiTJ1fOKNt1mog524VZdoV9cyzR9MkdQw=;
        b=oJFz13Y5nB9iuc/z8RaXmxCrxrmIfFIDCCP5GWstccsGczRQucHeLwNer9+mPEuYfc
         CmhWDNMI9RyGO1NdOdK0hE+vPE2PeTsjURY0lDMi+UWdYcbGzjL5eH0cpH23C770PMBc
         l0i+hAey3OzJtQBz7zwDjBcoPtaH4QyrFyYJXuN0QSXm8OrH8xu2YYJ7aFsuyOXtcP4X
         tRjReGUr1OCEJ10PoWRD9LSQLnOKzRhvGDlyYGoMMZs0xRgsdH5mBDH2VjIg0kpSSPXB
         E+iG/6CjBli3K0UbFsEFHav8qjIe9zLItOA4QyADSLM3yoE+sx2zmYFvrxWgV8pIGpFi
         We/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LPsD9vRx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b7-20020a0cc987000000b004410b3181c4si6190255qvk.593.2022.03.28.01.51.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Mar 2022 01:51:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=LPsD9vRx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nYl6F-0001yd-OW
	for alex.bennee@linaro.org; Mon, 28 Mar 2022 04:51:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nYl32-0005Ru-9d
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 04:48:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nYl30-0003CL-In
 for qemu-arm@nongnu.org; Mon, 28 Mar 2022 04:48:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648457302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eujZwt4/yILiTJ1fOKNt1mog524VZdoV9cyzR9MkdQw=;
 b=LPsD9vRxUEEAviWsUqJqhNM3wZPJtmaOpmT3mw1j1vyTT1ZM4kRftFAPT28OwFxD+YKW4L
 RbKEC8MLV/ctzxDuJuU5xknYk90H0rDHCbFCATJt/Eaflrtgkpe055IB0fs8dKceqtbhzI
 ZZ0cgbxW+uFvSye/ojekp6MyWe101T4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-624-JhEQ4isVODWi61Yz-wdwtw-1; Mon, 28 Mar 2022 04:48:19 -0400
X-MC-Unique: JhEQ4isVODWi61Yz-wdwtw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82F70101161C;
 Mon, 28 Mar 2022 08:48:07 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48A9D7774;
 Mon, 28 Mar 2022 08:47:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 3/5] arm/allwinner-a10: fix format-overflow warning
Date: Mon, 28 Mar 2022 12:47:15 +0400
Message-Id: <20220328084717.367993-4-marcandre.lureau@redhat.com>
In-Reply-To: <20220328084717.367993-1-marcandre.lureau@redhat.com>
References: <20220328084717.367993-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 David Hildenbrand <david@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 69AWLn5YMD8/

From: Marc-André Lureau <marcandre.lureau@redhat.com>

../hw/arm/allwinner-a10.c: In function ‘aw_a10_realize’:
../hw/arm/allwinner-a10.c:135:35: error: ‘%d’ directive writing between 1 and 11 bytes into a region of size 8 [-Werror=format-overflow=]
  135 |             sprintf(bus, "usb-bus.%d", i);
      |                                   ^~

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/arm/allwinner-a10.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 05e84728cb34..79082289ea5b 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -130,9 +130,7 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
         int i;
 
         for (i = 0; i < AW_A10_NUM_USB; i++) {
-            char bus[16];
-
-            sprintf(bus, "usb-bus.%d", i);
+            g_autofree char *bus = g_strdup_printf("usb-bus.%d", i);
 
             object_property_set_bool(OBJECT(&s->ehci[i]), "companion-enable",
                                      true, &error_fatal);
-- 
2.35.1.273.ge6ebfd0e8cbb

