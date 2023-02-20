Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2646272ejb;
        Mon, 20 Feb 2023 13:51:40 -0800 (PST)
X-Google-Smtp-Source: AK7set9gGBNK0X1RlTMVARrDS4n4l1QcQrrqDPsTVXGeITm0LAjbCRUyAYuPQA9LF+yTRzvci797
X-Received: by 2002:ac8:58c4:0:b0:3b6:2b5c:97e5 with SMTP id u4-20020ac858c4000000b003b62b5c97e5mr18602701qta.17.1676929900200;
        Mon, 20 Feb 2023 13:51:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676929900; cv=none;
        d=google.com; s=arc-20160816;
        b=gG+aTUDmzY0DdUcVb8RZYqNDyKhIzE6Dh0zeCXLzE5wkpmadS9xz7YieZ8Zo3oorjD
         rElbMgiWUO0XhNIy7TUzQBYcTqlgtqYyj4gEArgyc2cEz8J+VH/XVWIiv7ZKWJKZYGXP
         cAlKzlJ/ivgKqJ53PHwkV8uHL2aszyYvPbPmpVEHi8pCVQMeogBhGnYz8YKaKSTHhpUb
         X2UiSy48TiTVucV54JMvo28+s+7g/Yr2WTd4Io96r16nFA8S/P4FBNOaqlmPyMlUyq+9
         FEKJNR/u/OSCxYjk5E0Dp8xo0pu+6XXsfdiaRmv2jcyaVtdd9bAsjbmAX8uN5vNRX8bC
         2WSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=yhViJ0OHr5jGtHO67wWfbPRObY3fGOXAVcHvOoIgnys=;
        b=HL36LY7WgBQgd4s9bFOXjLUYk2AToEPGh0uzutnJf0+tJum6X3w7WXPpTMW7u9TAHJ
         vjxlWiAtlroQLjczKTwEmBlnB99R0JLRECCIIZX4SPr6K2Oaa8PvH8T5T9BlkXBMkCsM
         1lsK3n30fGdjqCiuXyJnWjd51XRKp+j0lMC4LEEBf9n7DyZj+pGzruUIU5ocdJeNWZef
         TsylDuDaB2ubSyYFARh6U5TzZgs7CWBVMikaixd4LGioExrktc8Kp2GD6NzELHuMt4q0
         IFVzUhRay6zoI4RNaG64sHb0XCjoHMgPcF9sErXlyIOH974j3ar2Q+RaeLX0sM++rQo/
         fubg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GIHezvC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dt42-20020a05620a47aa00b0073ba88f6edbsi959481qkb.80.2023.02.20.13.51.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 13:51:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GIHezvC7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUE3a-0004PW-Ns; Mon, 20 Feb 2023 16:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2u-0003cH-Ly
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:50:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2o-00080z-Gs
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676929797;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yhViJ0OHr5jGtHO67wWfbPRObY3fGOXAVcHvOoIgnys=;
 b=GIHezvC765rDMzIUY9lXAcvvKbKtpk74Itp+TO5697HCBMb+CzhA5ns0xYcYqcpoFkBOdC
 1ArQWgY5bU5Yx2yyLN0W4mThfig73dZrLathBzFN+aUgwbmM8zIwLesOzSQylKR97JvR+5
 ZHP2sN8W3enWKxMEEMPmNHIgxZtVbME=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-pvWp0RBOPAi-_9TAwxzb5A-1; Mon, 20 Feb 2023 16:49:52 -0500
X-MC-Unique: pvWp0RBOPAi-_9TAwxzb5A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 518A5101A521;
 Mon, 20 Feb 2023 21:49:52 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 492B718EC6;
 Mon, 20 Feb 2023 21:49:50 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Jason Wang <jasowang@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 12/15] slirp: open-code qemu_socket_(un)select()
Date: Tue, 21 Feb 2023 01:48:56 +0400
Message-Id: <20230220214859.3792171-13-marcandre.lureau@redhat.com>
In-Reply-To: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
References: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124;
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
X-TUID: SaFgVTgy8nZJ

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
2.39.1

