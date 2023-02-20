Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2646844ejb;
        Mon, 20 Feb 2023 13:52:32 -0800 (PST)
X-Google-Smtp-Source: AK7set+sf+BGdtKeJqB/2p9THNFkFD5NsO5ChaXOM2jnevzqPy05l8X8fvxQeL+QIcJS3BouBtfs
X-Received: by 2002:ac8:5c4a:0:b0:3bd:48:7097 with SMTP id j10-20020ac85c4a000000b003bd00487097mr3246329qtj.49.1676929952681;
        Mon, 20 Feb 2023 13:52:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676929952; cv=none;
        d=google.com; s=arc-20160816;
        b=JiW2ah2ePlKSImRIRk/eiNkki2gI3nzRnSx5oLzpqhPzTPfcMOwPLSByTGbfnhlppX
         ZMKmacZhf3hg7FK1BNZUlAqh3XYX5u0sAuIFJznc0Sy8DoXKn2+I2RSJVmc1+ZX5nWtJ
         W/XJtMuRPXQh2f4FpD9GK72YHbFz50lxUr/eRORfacQvKysu17WrsqxT5i89yimO49Ky
         ekhXZDlkmM01XoZRf0/msUxrnAfbcEhqwFJ6BV3d9/t5S+RQU0W4a/Zpqj15SHoTJl99
         gJRxJFc8Kt2VdJFJh7XzkZ9N6Of7RyDS4G1AYIxdgotbc7i3NMxXBS2Rh5ZpLU8ACpCa
         enSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sQpc/AwdzzUqn9KA1j7gnwkqyBYn3B6yRkfn/+glDQE=;
        b=u+ND3sW9oX/8NZfvwG8NnDBkhOCgjSN8YLESWAR7Dt5K04V/0C+Mz8LzVzj/tfrZI8
         rMyc2yqNBfKvjdZ2LT8a2EMHW/XTIPdMwcS83sFantzqJtxMemZU/7eeniAPjEMJ0BnF
         MPDtojUsdbr51LbduXhTTox7Phg3/YMKN1RM4j0VW6VKfbEDLe7Chd4mim+EjNlI8x7Z
         F+C+WnCqIU0ihwdH2rndSR8Gdvnfz4Q3YM3X92rF4AIC6Uk3BFDpjBd/gtXqG/JWHeCJ
         VrDz14kBBfVSS+IOxkR+AybHGe19r6vGKuGn3lSUHzQpsHoSSWZsUoIP2YTcNI27aPDf
         kzaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gBLcpxaf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m25-20020aed27d9000000b003bd1bc10387si1579071qtg.796.2023.02.20.13.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 13:52:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gBLcpxaf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUE2K-0003SY-9y; Mon, 20 Feb 2023 16:49:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2I-0003Rv-Ax
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 16:49:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2F-0007xA-11
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 16:49:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676929762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQpc/AwdzzUqn9KA1j7gnwkqyBYn3B6yRkfn/+glDQE=;
 b=gBLcpxaf0AoWNn9pjPSzYwBUWUydPjUWGpq9DwHxNk7rUdEp3Bn75dn/lb63TTr8c+rXe6
 5LOGi1eB29ZiBiN+KKf1uySuSiL2isF01dy9gsD9chQGgQ0rKZ2faBcWdq6isFE9NfhjNy
 i3PNOyUW5VF0JvuJL8LRqu97wvcRL/g=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-7SI_3q2DNTCnTr1WjUiPDg-1; Mon, 20 Feb 2023 16:49:16 -0500
X-MC-Unique: 7SI_3q2DNTCnTr1WjUiPDg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE8472A59568;
 Mon, 20 Feb 2023 21:49:15 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6EF3140EBF6;
 Mon, 20 Feb 2023 21:49:14 +0000 (UTC)
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
Subject: [PATCH v2 03/15] io: use closesocket()
Date: Tue, 21 Feb 2023 01:48:47 +0400
Message-Id: <20230220214859.3792171-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
References: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
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
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: em5IzAmRqCGM

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Because they are actually sockets...

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
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

