Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp3120878lfj;
        Tue, 18 Jan 2022 12:39:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywpwLrxhMkPayByz7HMXyP5WTVX282Clot8cDmXUy27R8qWiDKSnNiESf541a198L969dL
X-Received: by 2002:a25:4402:: with SMTP id r2mr35058742yba.16.1642538361071;
        Tue, 18 Jan 2022 12:39:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642538361; cv=none;
        d=google.com; s=arc-20160816;
        b=uTNSQ08oxSW65wv50fJOHi6b+sS82Qw99quTsCLzh1A+9kDsxcox6Mq/6W6I0cWxsw
         ZE9m32waZxftcTyB4fIzCazxQ1w2OGaiGciWWGEyzCVvO4WuwuHKxpL/EGbcX+iOZKnX
         j0ppcQB2GG26z9lD/V6nEC3c+bYt3S8Ozj+gyGHkej0nj8PIasPH44H4vY/wDdNXQo53
         xKzDiuiV1f/q7dCo51qYXogLjgvEVt9dUXSa406y9sl/IzkixgoSBAloQzLD5irEu19c
         Gj3QeRFkYr7t3YxHFdCZQhqGMHeE7J5MKQcnVf2CkX2U8B1pvgIt2fZwYALEuWQZc/Wy
         tVhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=SxRgbq9ttrQRFvO5NnZwXwJjSMKQhw7d9CQ3Zqbmj3w=;
        b=Iy60Ia18WTSjIRYgVzpClDi7ECQv71gdsUCQhSfcs97ROa+6lxne7yExSpixsw59zJ
         Cst0oXP93JCtlQJM96EAm+/9+r56LygbWHSqlG9IU53eNyCnwUJUSuo9mQnxTw+PJahJ
         r+lSLMmJthaQYQEObTElnZ5D28bNjNHPBog673ti8a7MHN//o6qSSQz9PxXIZIHEg1iw
         GLxscersUMgOJ0IDbR3WofvJSPJnRz7+ekEdRuBqdw6k8WEAGu/jRz/7/p8Qwnneaddd
         lfk53CDAqj3jef+qBCG0CJTAcUmZSs8v31sp4NtjmkdlC3WqrDoxiqJP7/FAi8cRQ7ys
         jIBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LrkUMiz4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v187si2002621ybc.813.2022.01.18.12.39.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jan 2022 12:39:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LrkUMiz4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n9vGC-0005WP-GW
	for alex.bennee@linaro.org; Tue, 18 Jan 2022 15:39:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9vFw-0005Rz-5n
 for qemu-arm@nongnu.org; Tue, 18 Jan 2022 15:39:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1n9vFu-0003GG-QX
 for qemu-arm@nongnu.org; Tue, 18 Jan 2022 15:39:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642538342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SxRgbq9ttrQRFvO5NnZwXwJjSMKQhw7d9CQ3Zqbmj3w=;
 b=LrkUMiz4qk/7FNg5wT0uI/SiV/6F/XxXu8tUj9CY1I7hFqUG17/1OOjxGNNcea8l9erq3s
 CMV3x/F4F8gk9m6A9qnJPMboyrNzufr7+kk8013Bifps5PIqntvKoEmj2SrpwcttM72kbh
 WHm640PPCaA5OSSiSJqeo1iwOIfVZjY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-91xF0JdfMrWuOPKsPkM-Lw-1; Tue, 18 Jan 2022 15:38:59 -0500
X-MC-Unique: 91xF0JdfMrWuOPKsPkM-Lw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C972619251A0;
 Tue, 18 Jan 2022 20:38:57 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.194.124])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6705745D9A;
 Tue, 18 Jan 2022 20:38:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, thuth@redhat.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org, eesposit@redhat.com
Subject: [PATCH v2 1/6] tests/qtest/vhost-user-test.c: Use vhostforce=on
Date: Tue, 18 Jan 2022 21:38:28 +0100
Message-Id: <20220118203833.316741-2-eric.auger@redhat.com>
In-Reply-To: <20220118203833.316741-1-eric.auger@redhat.com>
References: <20220118203833.316741-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q0QjZAMeznjJ

-netdev vhost-user,vhostforce is deprecated and vhostforce=on
should be used instead.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/vhost-user-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index 3d6337fb5c..6e79935c47 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -42,7 +42,7 @@
 #define QEMU_CMD_MEMFD  " -m %d -object memory-backend-memfd,id=mem,size=%dM," \
                         " -numa node,memdev=mem"
 #define QEMU_CMD_CHR    " -chardev socket,id=%s,path=%s%s"
-#define QEMU_CMD_NETDEV " -netdev vhost-user,id=hs0,chardev=%s,vhostforce"
+#define QEMU_CMD_NETDEV " -netdev vhost-user,id=hs0,chardev=%s,vhostforce=on"
 
 #define HUGETLBFS_MAGIC       0x958458f6
 
-- 
2.26.3

