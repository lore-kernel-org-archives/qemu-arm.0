Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2645627ejb;
        Mon, 20 Feb 2023 13:50:37 -0800 (PST)
X-Google-Smtp-Source: AK7set9z46Mcffc8mPTm+qNR8iCWu13IFDGoeratsZqcrOv/JifWp1kvo/PySPEcLr7qkjHTYP70
X-Received: by 2002:ad4:5d65:0:b0:56e:9da4:831c with SMTP id fn5-20020ad45d65000000b0056e9da4831cmr7306952qvb.46.1676929836894;
        Mon, 20 Feb 2023 13:50:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676929836; cv=none;
        d=google.com; s=arc-20160816;
        b=CDHKLEKgSU8HgBpMrIHpL7cA8yVsfUhZVEd9V4o7Q2EhUJUx1260OetL+YldjIfzpl
         NKaL3Q6UmTGDH6qOm0p45Rwc0tVT+w8nXkO0tbUfiEglcxuZ82BqBL+XNCnjRytT8VVE
         ZIPjUQ4pVI1lieE1/YiMPhhLsvLu5Qk9yJehEuPnd6/hqzBHfYfp2sUTk3pGAR6dyiGV
         LK9KJ6gptusOWW4G3jrbCjRQJ/FQREXs/MAR6IardD8zhfwmwA1NZWEEKOdkfc+kL4Ol
         Fd8DyVymz22p5nW0SVxK0u91bxS46+TMM3jgfaGp19pOmJAu8086x8he7ZBhfi2Q6HoO
         GMkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EQ8M4aX+QWWlZXZZbJUi30Zbn7lBVH74znn3hPM3Y5U=;
        b=wOvaRWW3ebVYAnsxPxN6OtL6255eSgWgFhOb8bvzCa8WszKmdgCwSuSU+ETAbrazN2
         i7XNMoRITA1die3KAjzxGVvGFlCQzfO3yAVlTKxSaun7yCBoFBD/Z+TOuxyeYos8fArc
         pWB9XAnS7OOYbiNTjhU44SNoCu+Bdn9/2RZZCrv4H1pQzD/amJLgoyebRE7kAasn8MKx
         /H79pBHYjU2vF4UuI9ducUPECRkbNJfJjdShnLj0v1Gkq5gKRAAUbNZf4Dn2GMOnm6+4
         Lg9k4K6trsRmrgRVTBmCZKDlrgBsbJkbcwAmwb9Ki6C8Lb36VbkxCnTuW6jvSWJOjtRg
         oV9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BBU49WyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020a0c9c4b000000b0053777d66fa5si4330013qve.305.2023.02.20.13.50.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 13:50:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BBU49WyQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUE2D-0003Qd-Vw; Mon, 20 Feb 2023 16:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE2A-0003Oz-RG
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:49:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUE28-0007wF-Oo
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 16:49:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676929756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQ8M4aX+QWWlZXZZbJUi30Zbn7lBVH74znn3hPM3Y5U=;
 b=BBU49WyQYm/QQCaGZ2/n/BQU9ytDWkr/WpEGYtmET3N85gOZE/ivwK7xneT0YZzf+GJspc
 45HAACURs+d+WhaJ63CkFuO2Q4dtvuWX3aipizwW185Kqk9k7gvu+kMppwtp2nu7iiUbLR
 r2UVRvpWhlkLbeIWA+sFpf1T+3Od9j8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-GBy8pHzSNH-6LjAgvtk2jg-1; Mon, 20 Feb 2023 16:49:12 -0500
X-MC-Unique: GBy8pHzSNH-6LjAgvtk2jg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 04D0085A588;
 Mon, 20 Feb 2023 21:49:12 +0000 (UTC)
Received: from localhost (unknown [10.39.208.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43D542166B26;
 Mon, 20 Feb 2023 21:49:10 +0000 (UTC)
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
Subject: [PATCH v2 02/15] tests: use closesocket()
Date: Tue, 21 Feb 2023 01:48:46 +0400
Message-Id: <20230220214859.3792171-3-marcandre.lureau@redhat.com>
In-Reply-To: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
References: <20230220214859.3792171-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124;
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
X-TUID: OPa26aGOHWB9

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Because they are actually sockets...

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/socket-helpers.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/unit/socket-helpers.c b/tests/unit/socket-helpers.c
index eecadf3a3c..914b3aa0cf 100644
--- a/tests/unit/socket-helpers.c
+++ b/tests/unit/socket-helpers.c
@@ -117,13 +117,13 @@ static int socket_can_bind_connect(const char *hostname, int family)
 
  cleanup:
     if (afd != -1) {
-        close(afd);
+        closesocket(afd);
     }
     if (cfd != -1) {
-        close(cfd);
+        closesocket(cfd);
     }
     if (lfd != -1) {
-        close(lfd);
+        closesocket(lfd);
     }
     if (res) {
         freeaddrinfo(res);
-- 
2.39.1

