Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2969983ejb;
        Wed, 25 Oct 2023 12:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5x+zHSZG7vGQds57BLJe+gvILKEo9sIfXaKkHg9r5dTTEg32EzjrbHHVisZ1U2rkuaS46
X-Received: by 2002:a05:600c:4f91:b0:3f6:58ad:ed85 with SMTP id n17-20020a05600c4f9100b003f658aded85mr13262475wmq.10.1698261240755;
        Wed, 25 Oct 2023 12:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698261240; cv=none;
        d=google.com; s=arc-20160816;
        b=FTp07cdDUW2mqqqeATeJftPuBkErBE6JmA9g75ZXwwPtuTsBombMsFj3F8xS71mcFQ
         C7h5PO4gHr4KkzJMJMVWcKmsp2nQnzcOgnsW0tqsqWkXfw2svJLd4I/eaKv+2iZaulMU
         1NkkuWzOM0L23hNe0Fjya28nvqVI787LlEL1XMQA+/htXZr0PBYpyqUJVWMw58LA6obd
         dE9ARYEE/bVTGxzuHoSXzBk1ingmeme239Qle0DDS1+ubgXYps7W7ii+O3wbFuPADeu0
         qlQQad7l0bl7XPFhaG13b6K+Uoq14o82airUJ7qnWm2oJk/SaKO/Nfv0RW3FSiIN2bGJ
         CBjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GY/S0Y6pm4Vuz6O3HkLMdUB1oHQytXfPu9o7AueA4S0=;
        fh=xhblChOHn/9ohxmBdExAv8vV4InD5nB0dX6yBSUq53Q=;
        b=RhYAOqOViU8YQ8kbNkVADtq8gmIYlk+X7DJ5ipw/sML9639b6kXIY/8CGbLqZkzpf/
         nk93vVj6BQl4MMBJRUWW5O8uIOczQHZRpdI5YqplbqY7zWILtxbIox7nj/7r5rCstvOM
         mNnPj1PYXAm60PCsOeF3IgBLscrAYBJgAC9BDOh+cLubp6GLrKpRnPaOYejQuYDZmWIA
         iQHfC7RbS7eKPR4y/7wfhk8Jmk92vVE6xll20xbq+stOTZNw7EdZVcXNM4U5/rUZ9YxI
         f133ORTvY4Cl7cTi/jS6GYVcZDvMkJfAu3IjkjIZPNXasQ25jlZkXnATbUAjDuKsMBfh
         +BtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JzbU6/x1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i17-20020a05600c481100b004052f153921si376430wmo.165.2023.10.25.12.14.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 12:14:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JzbU6/x1";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvjFd-0004oO-OS; Wed, 25 Oct 2023 15:09:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjFT-0004kg-21
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:08:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1qvjFQ-0000LX-TP
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 15:08:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698260936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GY/S0Y6pm4Vuz6O3HkLMdUB1oHQytXfPu9o7AueA4S0=;
 b=JzbU6/x1Bqc4Lc9y0RnqTBs417buQIPuTxdmxSRKS4Ac/bzUBxCKZT/bkxGgqCDkeVeX1l
 /+tNjrroHD/CmjYmt7zmMIudHu2siIJs1yhyvI2y+1pM2EIxcLsnqjBsxmmiLazApCDPjy
 eiN2qNYyEn7Rj647v1V4oZjQZrYjJ0A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-412-H_PdAQmePbazhwhEXctYKw-1; Wed, 25 Oct 2023 15:08:53 -0400
X-MC-Unique: H_PdAQmePbazhwhEXctYKw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 890BE857CF1;
 Wed, 25 Oct 2023 19:08:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AD2DD492BE8;
 Wed, 25 Oct 2023 19:08:51 +0000 (UTC)
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
Subject: [PATCH v6 07/23] vl: simplify display_remote logic
Date: Wed, 25 Oct 2023 23:08:01 +0400
Message-ID: <20231025190818.3278423-8-marcandre.lureau@redhat.com>
In-Reply-To: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
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
X-TUID: S5i/AV5FJy1F

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Bump the display_remote variable when the -vnc option is parsed, just
like -spice.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 system/vl.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/system/vl.c b/system/vl.c
index de6df188da..b07805d476 100644
--- a/system/vl.c
+++ b/system/vl.c
@@ -1401,11 +1401,6 @@ static void qemu_create_default_devices(void)
 #endif
     }
 
-#if defined(CONFIG_VNC)
-    if (!QTAILQ_EMPTY(&(qemu_find_opts("vnc")->head))) {
-        display_remote++;
-    }
-#endif
     if (dpy.type == DISPLAY_TYPE_DEFAULT && !display_remote) {
         if (!qemu_display_find_default(&dpy)) {
             dpy.type = DISPLAY_TYPE_NONE;
@@ -3350,6 +3345,7 @@ void qemu_init(int argc, char **argv)
 #ifdef CONFIG_VNC
             case QEMU_OPTION_vnc:
                 vnc_parse(optarg);
+                display_remote++;
                 break;
 #endif
             case QEMU_OPTION_no_acpi:
-- 
2.41.0

