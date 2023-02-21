Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3217057ejb;
        Tue, 21 Feb 2023 04:50:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+KKkjNbUzXt0heEBm1dMhtXN0bbVeoT4RkyKdeYumZXOFlK8HAAsG2/+NH5+OVCu9jH1ho
X-Received: by 2002:a05:622a:48b:b0:3b8:118d:ad86 with SMTP id p11-20020a05622a048b00b003b8118dad86mr7063372qtx.21.1676983806457;
        Tue, 21 Feb 2023 04:50:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676983806; cv=none;
        d=google.com; s=arc-20160816;
        b=uBh6BYd7CyZpfF8mYrealp7x/alkjhM8BUcg6RpWVEZsYXnwSP3dE0jWVlk+Osci0p
         dYJk/rHa55nDmPYiiHINXj6vK9f6DgD8ykznQC4rqgU5OJWpbav4woJ4WlKyqLtPJFgd
         YRuFHl5W5UVf90fW0D9nKN+dla3Q++Zjnu6lBV+aOOFLlt336Fn3WQaSiY9QxpAYLTu2
         m4V0ldP0GfisqdWz9kkBep/FQHEeJ0Nl0RA0XNnXD8SEmGRZIPNiAfYTW/gX9kKudZnQ
         YQtIt7sO2EGtaYOJBEXkW4uhjzJOZdi9O2EoB/ml9EU9yuY5vc2CeGazjhXFOOTaJe0f
         KfUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PfM6VBwPpGdm0L7blj2XxeHMZNs0mtTHXUe08a1eeC4=;
        b=jXwrYlUaKziSZ3GUg05taRr/Lmvv0fCeuWW6TE9KrFGNcv0RdtMezcLNeCgqtrkjjJ
         D9CLok89Cp5UyhbsJNG/T+JfiDf7wt75DkgjramuMnBUmvqz5prYrCaDKlMdCiX5L5EM
         audANPnfZ8wPn1a/GWK7rsPkGgofbNhucT1AZBNB4bI9LrUJNFU/XOgx76xg5sUELbZ7
         x6HCNMw1nzKtawUP1rNyM6x4jvkiZBvTPZfuGbYk793ZZ/lNg5dTmfhR7VJII8zK2U9i
         UXMo04Rp4sKc3Lr6LXqpD3OfXpzVRPFrD75FTyClGAnqTHyVDI5D1FlYFWGPeE0tRcan
         vJ8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A99WeOU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x9-20020a05620a258900b006fed8cfac9bsi985523qko.452.2023.02.21.04.50.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 04:50:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=A99WeOU2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUS5J-0007D9-8D; Tue, 21 Feb 2023 07:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4y-0005iz-JE
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 07:49:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4v-000815-S1
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 07:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983745;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PfM6VBwPpGdm0L7blj2XxeHMZNs0mtTHXUe08a1eeC4=;
 b=A99WeOU25Mq58UoL35YwftmM4uuYIac1A4IWwfwOwGt+EBL6oidzrY2AV9L4mbJ22/1YFi
 I5QMiEgFtle8wC7mE3hnZPg6n0JDFBwM8frj6Roo5qK1+69BXSKR+9ItyS34TvGmgoHRG6
 GnBKMIs0Dsb3KHdHa1fYd8KEW9Kt+kQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-O68qsoJFP1S5f9kY4rQuqg-1; Tue, 21 Feb 2023 07:49:02 -0500
X-MC-Unique: O68qsoJFP1S5f9kY4rQuqg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EB581818E6A;
 Tue, 21 Feb 2023 12:49:01 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DB8F2026D38;
 Tue, 21 Feb 2023 12:49:00 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 13/16] slirp: open-code qemu_socket_(un)select()
Date: Tue, 21 Feb 2023 16:47:58 +0400
Message-Id: <20230221124802.4103554-14-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: jXX9rOi4KAtI

From: Marc-André Lureau <marcandre.lureau@redhat.com>

We are about to make the QEMU socket API use file-descriptor space only,
but libslirp gives us SOCKET as fd, still.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 net/slirp.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index a7c35778a6..c33b3e02e7 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -251,16 +251,20 @@ static void net_slirp_register_poll_fd(int fd, void *opaque)
 #ifdef WIN32
     AioContext *ctxt = qemu_get_aio_context();
 
-    qemu_socket_select(fd, event_notifier_get_handle(&ctxt->notifier),
+    if (WSAEventSelect(fd, event_notifier_get_handle(&ctxt->notifier),
                        FD_READ | FD_ACCEPT | FD_CLOSE |
-                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
+                       FD_CONNECT | FD_WRITE | FD_OOB) != 0) {
+        error_setg_win32(&error_warn, WSAGetLastError(), "failed to WSAEventSelect()");
+    }
 #endif
 }
 
 static void net_slirp_unregister_poll_fd(int fd, void *opaque)
 {
 #ifdef WIN32
-    qemu_socket_unselect(fd, NULL);
+    if (WSAEventSelect(fd, NULL, 0) != 0) {
+        error_setg_win32(&error_warn, WSAGetLastError(), "failed to WSAEventSelect()");
+    }
 #endif
 }
 
-- 
2.39.2

