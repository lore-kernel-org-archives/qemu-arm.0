Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp3883838ejb;
        Sun, 12 Feb 2023 12:51:31 -0800 (PST)
X-Google-Smtp-Source: AK7set8k9cuj6TFW/4q211T8ZEMwDgfkwYPmvfmp7X57xKEzyVBqTr7Uu+N+kesAPXE48H7mxZdR
X-Received: by 2002:a05:622a:164e:b0:3b9:b6e8:8670 with SMTP id y14-20020a05622a164e00b003b9b6e88670mr43438472qtj.51.1676235091548;
        Sun, 12 Feb 2023 12:51:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676235091; cv=none;
        d=google.com; s=arc-20160816;
        b=LmWicYf+3ekpD0mC9rnH3ZzAW1MBaNkpFCc9RgsU5n0co6uXG71H8b2x+oql6fUSSe
         Qx90COPHngATtXc+GzvRDply++ewmTnZeX0X+5VV575QsOh6iSzm3tm5beH4LXpqLy5Z
         UP8XU9/tp9jK3UJLfKJ//PmhVDKM53hDMPwXKw0WVNH+CwOiNlWle9EKl5Pn194/aTFF
         eK+KEuH+FCeFWAQZSeHwyNJCB7Jk8h6zOmIKbAKEajtz8warRLGOhGYHYrowiK25VCW1
         0CMoWwQPlSx4EFqHPII93MZD2w40BoKh5Zz7KVe+AIB0qhiQBze9VqVt7PDV+JW7CS2b
         v+3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=3pJ5iRRQglwGjgFqTu7IRkpDZuwu6Z4zyssyU6K71Ng=;
        b=tB3p/Vh9d2w8roV0jXm/mVS09yWTHkFjapDJx6Hkv0pkXZiXZtT1YDPWZp3WqWRrLh
         OYHdCB3xf6flX4x6LP9CZRZLiZvpm/P06lb47pBAk/cw7QV4TSrmntV4Ml88vRT0oDCY
         weoAlaRTBD5sIvq4e99KJfM06onHHvrU/KHugae9MVHuBsLJrjorSCbJcBkzMtNVAwRV
         A/2rlhjBsp7Fxm7bUfOnOZWjeel8ZhcJ+CA7BqlgcZPt+1DuZkubV5mob5B1FW0fsi0X
         /O3t/GG83/HXDQNCDIwcfFPCc1C6czx9pZ6J/m1Vbl4EOBlB5sOvrHLCRaM20pSQwSmc
         WtbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IAHY6M8C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w15-20020ac857cf000000b003b86cef433esi8213574qta.544.2023.02.12.12.51.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 12 Feb 2023 12:51:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IAHY6M8C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRJJ2-00050v-5C; Sun, 12 Feb 2023 15:50:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pRJIR-0004Sn-Bp
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 15:50:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pRJIP-0001x4-8g
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 15:50:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676235000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3pJ5iRRQglwGjgFqTu7IRkpDZuwu6Z4zyssyU6K71Ng=;
 b=IAHY6M8C8/w3dNAGwVSwsmOl8PblFOd9SXVIWnqpUgL043iSnHdmqvSvZkyaEid3aOyT+/
 lVwiBWUHOzHjdswwF7umd9gsNpYKFqeEW2y6fug3Ik9GmeootejE55Zcm3VmqrgTBArWT4
 +20MlfFpax/oFI0q/IuSKn1r8RYqxoc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-9TaKZNZ6MHmbMEeVlU-EvA-1; Sun, 12 Feb 2023 15:49:57 -0500
X-MC-Unique: 9TaKZNZ6MHmbMEeVlU-EvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 69CE7811E6E;
 Sun, 12 Feb 2023 20:49:55 +0000 (UTC)
Received: from localhost (unknown [10.39.208.2])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 676C5140EBF4;
 Sun, 12 Feb 2023 20:49:54 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH 2/4] io: use closesocket()
Date: Mon, 13 Feb 2023 00:49:40 +0400
Message-Id: <20230212204942.1905959-3-marcandre.lureau@redhat.com>
In-Reply-To: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: aymI+U0PIgXu

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Because they are actually sockets...

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 io/channel-socket.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index 7aca84f61a..2040297d2b 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -159,7 +159,7 @@ int qio_channel_socket_connect_sync(QIOChannelSocket *ioc,
 
     trace_qio_channel_socket_connect_complete(ioc, fd);
     if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
-        close(fd);
+        closesocket(fd);
         return -1;
     }
 
@@ -233,7 +233,7 @@ int qio_channel_socket_listen_sync(QIOChannelSocket *ioc,
 
     trace_qio_channel_socket_listen_complete(ioc, fd);
     if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
-        close(fd);
+        closesocket(fd);
         return -1;
     }
     qio_channel_set_feature(QIO_CHANNEL(ioc), QIO_CHANNEL_FEATURE_LISTEN);
@@ -310,7 +310,7 @@ int qio_channel_socket_dgram_sync(QIOChannelSocket *ioc,
 
     trace_qio_channel_socket_dgram_complete(ioc, fd);
     if (qio_channel_socket_set_fd(ioc, fd, errp) < 0) {
-        close(fd);
+        closesocket(fd);
         return -1;
     }
 
-- 
2.39.1

