Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2646202ejb;
        Mon, 20 Feb 2023 13:51:34 -0800 (PST)
X-Google-Smtp-Source: AK7set9f6Z/OgVWrvxqiGXfmb6SrcxEjjf/yHAiKRw1mtoWSQAVUrGY55QW3tnfXObxByeESDvnW
X-Received: by 2002:a05:6214:c6f:b0:56e:bf28:b977 with SMTP id t15-20020a0562140c6f00b0056ebf28b977mr3360698qvj.33.1676929894632;
        Mon, 20 Feb 2023 13:51:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676929894; cv=none;
        d=google.com; s=arc-20160816;
        b=piReQ+ukroGO9JQcFBthA3zwJKDopGpFbNLV4KX0cNBGdwjrUdg5YXUsC0q3sB8oQe
         A8Wjj+enOzJxC/UOPA1R7xYuoD42vfhZilZn+jIsUnnxLltvjasdATOAdAx44OYXUPLU
         2bdEjjMTy2UZQq4bkTXa1gHWQjFqZJNGZz9dYpkTGUv4y1ZfoFRr6H9TLwYac+b5Ut14
         s3e7M50DpCnOuVyMpyg1NE7V4ALQMtJhIKtq8E3Gn5F64FWIhzroI2YXx6+YoKDe+lY4
         +qsKlH3zbRd8BrGlvI4585228y4UDOf6Xe4eiJbhN4dyyyj3iufOdbDaJHWyHBi3xhQg
         HZ1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=AQFh/dB87jnAfGQ+7wT6qykz452ycaENXOMVp0qcrHM=;
        b=yleqMRjrWHaOxz346eUJIYGBnccr9g8K5h3IbPOpXMZuonrkoXN0AsC9m4HOZ6+2ZS
         /V3cYGoIP/rhabA6dnTxbAC7qyKyTNE9uhwwsqfFPXgC66K3CHPobwcpCVWuwZ8MFTWn
         xq2NYikxnBmT9OEKFZjkAyAmFncGZr+BT+gD5aGpjGlPOKOGz/Vf0koSTqBNHWCGahqV
         +AziB5Fz2V0U8KcNmjGr5U8IfQrZLhe5uGerIgk9htN+IY3N6qp0hDQuevjyGztU4ht9
         ONBJ/JT2ywEfhIKf64PADjG7iGNAS7qrI66TA81KkUINFG+bFf715Ox2zOuo8UPg3vMz
         KWvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NJm4kJyt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6-20020a05620a450600b0070620b5d07bsi11602569qkp.127.2023.02.20.13.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 13:51:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NJm4kJyt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUE3X-0004Oi-Qz; Mon, 20 Feb 2023 16:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2z-0003m9-4t
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:50:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2t-00081L-Gf
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:50:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676929800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AQFh/dB87jnAfGQ+7wT6qykz452ycaENXOMVp0qcrHM=;
 b=NJm4kJytNpXl0jiaBjHor/VRw1g/U0nt6f1D0VvB0+6ojbw2K1WOdQlUcAM8LRf3J9pUx4
 brR4Yi9WLvfMTScMnPCiN9zIKXLi+mdyGbQBGpmj1GjmP5t5h58DnksnK9v7MEUODT/WaR
 7OWKk7SgN0WP64Ey+/SR0ga9MXwmHZI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-TEQnCKD7MiaK0RyWkNlUgg-1; Mon, 20 Feb 2023 16:49:49 -0500
X-MC-Unique: TEQnCKD7MiaK0RyWkNlUgg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E870880D0E9;
 Mon, 20 Feb 2023 21:49:47 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FC672026D2A;
 Mon, 20 Feb 2023 21:49:46 +0000 (UTC)
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
Subject: [PATCH v2 11/15] slirp: unregister the win32 SOCKET
Date: Tue, 21 Feb 2023 01:48:55 +0400
Message-Id: <20230220214859.3792171-12-marcandre.lureau@redhat.com>
In-Reply-To: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
References: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
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
X-TUID: uFbWOlsZi/Ly

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Presumably, this is what should happen when the SOCKET is to be removed.
(it probably worked until now because closesocket() does it implicitly,
but we never now how the slirp library could use the SOCKET later)

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 net/slirp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/slirp.c b/net/slirp.c
index 0730a935ba..a7c35778a6 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -259,7 +259,9 @@ static void net_slirp_register_poll_fd(int fd, void *opaque)
 
 static void net_slirp_unregister_poll_fd(int fd, void *opaque)
 {
-    /* no qemu_fd_unregister */
+#ifdef WIN32
+    qemu_socket_unselect(fd, NULL);
+#endif
 }
 
 static void net_slirp_notify(void *opaque)
-- 
2.39.1

