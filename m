Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3216917ejb;
        Tue, 21 Feb 2023 04:49:50 -0800 (PST)
X-Google-Smtp-Source: AK7set8hWWYfvHrga2sDJA2cSNmluQy1KQAw09A4uKP6Dh+lBu9TVH1drWWxOcqteyXbmPNcgPtk
X-Received: by 2002:a05:622a:206:b0:3b8:67af:cfdd with SMTP id b6-20020a05622a020600b003b867afcfddmr7065218qtx.36.1676983790531;
        Tue, 21 Feb 2023 04:49:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676983790; cv=none;
        d=google.com; s=arc-20160816;
        b=Szu0n0SaTkQYweOwnr45eRcJ2nX2+RInHp9l1BjFbtO1N6w0jtH+pw+MGVkqjOUWrT
         HQ2mv8IPRWinBBVO9vWeO69+f05L9aqCMsMpwwMfCAWU8LJUdz5TMlQgMK3N1AzKKX9c
         Oxg5gkVxHiGDIz9AsXSfF8sC2a1diQOJ7bk1WE7+dI9KAVyc9nbKzdpMVTgCFCVx1l2l
         iAuFQcySdGxuLUh3VhZJpyZSEBm7RiuFs3NUsy6AbTU/qjywU+Bz7D5FrR1NBBXCa9Ac
         0ynmT1KxFc/Lh5yw1jY4brWO1oy9FyTQS5EkAFUfdK6iWt037TtyXg0DdkUoxqD3XmTy
         pn4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LHyf1PaVOZM4aRwRI6Entvo4n6I7MMNqFyWF6BLjCrw=;
        b=NvvgbLsE9TDHlYz05tL7vFs1rH5XSebPX+vBVlVe5T+CuSjRl34DD2pBvjw+/ljdF6
         hnxLonh6jX1Ap2o+k3qO/z6otpK9GZ8FsYcBz/N+vC1MND+bmJDPfeSnvBqpGXyKjI97
         J65SjovfuLsh9lS4e4S+O99T7ADvCPsE9CYgaQObyW81AGjtH/f3BCwBZlA2H6nRwaT0
         lm6hBpnCgypNw73k7yLc1UQPt6ztAGxNxpAY1ZcjbxKCgMDLqXuk9wvOuIk9gEgAlOLw
         OOBRK+WgPhAGjURHg0rvBOp5ib6fUIzuKGzAQI4N2jNctAYopAkJamZwZQPdYaP/j+by
         R7dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YIrWeyAx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d71-20020ae9ef4a000000b00741b9cf3f1csi1577484qkg.23.2023.02.21.04.49.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 04:49:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YIrWeyAx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUS5G-0006pL-KN; Tue, 21 Feb 2023 07:49:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4t-0005dG-4d
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:49:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4r-000802-Jx
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:49:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LHyf1PaVOZM4aRwRI6Entvo4n6I7MMNqFyWF6BLjCrw=;
 b=YIrWeyAxQydidduZ7jjIkAjmTFWlN4fQvuu74V9l6+KSAuxKlLEVkNNHrb3LwxKLqIIgEX
 S+M9cs5gDR+/Y5b724veZqd2n+RrmoJPOuHw8YRcHnOgCV+ge2aeBBAn//Xbj9elU5lW+N
 uj23FsxzxYdjOmVlbnxXPul7Snbc78M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-w9zAKEYuN_i6KQ8tYAqPWA-1; Tue, 21 Feb 2023 07:48:58 -0500
X-MC-Unique: w9zAKEYuN_i6KQ8tYAqPWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52957381458C;
 Tue, 21 Feb 2023 12:48:57 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4BC7C2026D4B;
 Tue, 21 Feb 2023 12:48:55 +0000 (UTC)
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
Subject: [PATCH v3 12/16] slirp: unregister the win32 SOCKET
Date: Tue, 21 Feb 2023 16:47:57 +0400
Message-Id: <20230221124802.4103554-13-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
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
X-TUID: OvYZvy+Mmy8O

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
2.39.2

