Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3217500ejb;
        Tue, 21 Feb 2023 04:50:56 -0800 (PST)
X-Google-Smtp-Source: AK7set9od/x0Zi6OxHudqGWU1aA7DPrd6X5lDJzAQnGTnUJIsk/+SwSaUcxJaxL14+bnQ7uw9etR
X-Received: by 2002:a05:622a:11d6:b0:3b8:3a59:6e13 with SMTP id n22-20020a05622a11d600b003b83a596e13mr7357053qtk.62.1676983856354;
        Tue, 21 Feb 2023 04:50:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676983856; cv=none;
        d=google.com; s=arc-20160816;
        b=vwwmHNrNqKW4JjYiQSQGw+gpaFP17g1QdndenxldfPxM9jrB5kO4SIoO2zp7oyZ6Jk
         cOeN0oDrbfCxlqZXulYMUMBia8pK5FZXGLMyepDlyz+Ee34WRMCV/VnjTbX0MOp6vHGN
         0Lzd2NavCDjNJf8poAwzoRKNQBcHhxuhKWP0cWcbJCGy0hyPoo2XL52FlTLutQeSlhFX
         f1+DK70wRu7L1J3/RNPO0pRWYQ2jUHVz2WxCGRctl5sSX2eYZF3EaW99uoEEoXo3U7Z/
         4AFRl03baJJ0MmjB0pxa09W9R183JLEEJsewewD42fWx9Ch1RMe8Z1sebgvspKQebifh
         qkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NyPsBp7a1Zd/f/PnlYKoqadMjaVEQg/Z5bS9x1n8BZQ=;
        b=KNaSqJn7X/W085tYr/g9PlziSUhuuK5+nKbhOfnd/Hd3G5nGc7aa2rPm6sQSe/m93P
         gAW5hCM8HrcrVlnq8ATyZbWvAs0Tj8pzlgV3Lm9+7cg/ah1/k0dZF4iXwOZcIkrFesrW
         pcNcQLjjpE4VnjIEu8h+KE8ePtsEMnOLtBw3UpYKVyk3D0DVCoIXEmGI5WMB5RN37sbG
         2PrRE7Mt6iapKGsdC3AzS+4GbjaYBzAehm99j/xmiTKNImcpJbmC7n0w6gkdPqon+Oyp
         NbGqFqABmMpuMvqOyp04I0FiF7uyWSmqxQyvhljWJsa8CheZJsddM83aWb9UPuGs4iVY
         2JoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OeAwMmvD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3-20020ac87fc3000000b003b68cf4ae53si12595230qtk.505.2023.02.21.04.50.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 04:50:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OeAwMmvD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUS4L-00056f-4r; Tue, 21 Feb 2023 07:48:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4J-00052Y-6l
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 07:48:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4H-0007pa-F8
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 07:48:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NyPsBp7a1Zd/f/PnlYKoqadMjaVEQg/Z5bS9x1n8BZQ=;
 b=OeAwMmvDQrIwoMi8xEgDhjYC475CsVYMintx58tRJu48jqmAumy6Qov7hP3/8S6tV1opQ2
 LlI1FxTbapTVb7Jbeb1M/w+WeELUHil+PXtkom7crPVJyjMuJ/z1BF9jNdHbL7i+Ug9ZZv
 mpqJZhuapWa5vWn6nKfj0GXRCTh3Ps0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-ZlPq1Zj1Pr6YlTGZVfZigQ-1; Tue, 21 Feb 2023 07:48:21 -0500
X-MC-Unique: ZlPq1Zj1Pr6YlTGZVfZigQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0BA32A59541;
 Tue, 21 Feb 2023 12:48:18 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 957784014CF3;
 Tue, 21 Feb 2023 12:48:17 +0000 (UTC)
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
Subject: [PATCH v3 03/16] io: use closesocket()
Date: Tue, 21 Feb 2023 16:47:48 +0400
Message-Id: <20230221124802.4103554-4-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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
X-TUID: GFOkNvKfKY5I

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
2.39.2

