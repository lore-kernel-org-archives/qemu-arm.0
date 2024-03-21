Received: by 2002:a17:906:bc5a:b0:a46:bbde:2c08 with SMTP id s26csp604532ejv;
        Thu, 21 Mar 2024 09:03:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVksQ4BjAljiu07wqVGSInADNQfbICyO50u3RELAuPjnHuiA1T2C/KEIxO6uDKE+Q2HfLBqOPW6Y3f0OkWGcGp4MrlMH5bk
X-Google-Smtp-Source: AGHT+IGhhE5e23ZVatMONrN5Y5Z1zGmsjZH65Oz9DaQqlX70nyoC06gxPOo1OjEmjSrchuNzsift
X-Received: by 2002:a2e:9a99:0:b0:2d4:3dfc:af88 with SMTP id p25-20020a2e9a99000000b002d43dfcaf88mr1828086lji.7.1711036991625;
        Thu, 21 Mar 2024 09:03:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711036991; cv=none;
        d=google.com; s=arc-20160816;
        b=Jqc4OBsnxtdj615wlwhyxaE4leJyKRZQSrYOA0lJEJycDah+C/D7OmqX7bNPbevpYZ
         kpw0i26dWfbK11Tqczgf5jnCoFnm7c8ZKVtNaX/hb9LZzZ/1UeI0eheiEILGkaUC8SUI
         dXlfX0T5JdW/9NjZzO1DKlIz/5AbYnzMq+ikgD2fdIt1vv1Zt5oda9zB2EvLjSw6o00p
         M2FxbiFbfyIgsmW5DxOYizPB5EL1m+iH9HCodwo8FXTagIox2Cu7ywN8BnfMp5dHsCLv
         7bpeBnZ9MrBcmt1pqySykdl76XV1t8mdleYOQgQcCgENxapfmEIwIH9pA1LBLGnpxdJh
         Q2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=Qb6T0wX/a0zoWU83voW1zu0dyWTiTnln4IKFAYcZEIw=;
        fh=pGgJAqI+7Db9U1jEkNoe2CR6YuPIXuOZTgSrKQr1Yh4=;
        b=CzyTYhUz65Hoj5GzDp73KaeA100R8dmizN7/Yha03vnx4p9e7E1gy0MsUs99JKX9Je
         jH6E0nnreAcwec7m7w602jx5BW9M6Ts4AyvZZBNHpK9RfGdnfocEz+++gqjQ+W5bPxT/
         /D27+eObH3Z9gz7cAp5wlup80WSthawrLQQkc+Pa2kVaOnwTE/lz9nK0TumvYc1puy8P
         8hnQrIG7Mde+sh/9cxSeNrAnZtLJyqhYuMWmPaGhzs1czI+QpZpwQYydXwjOryo/t0Qr
         kOs2pWvYJsojUmFPRF90Xj9s2V2TpCLAeXJr/FcWr/I+M8qL/A0x78GlRDRkaLVJqK9+
         PYaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UV76ezEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13-20020a5d42cd000000b0033ce8b2573dsi8487791wrr.332.2024.03.21.09.03.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Mar 2024 09:03:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UV76ezEo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rnKsZ-000266-0b; Thu, 21 Mar 2024 12:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rnKsM-0001po-3A
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 12:02:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1rnKsJ-0005bM-ST
 for qemu-arm@nongnu.org; Thu, 21 Mar 2024 12:02:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1711036958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Qb6T0wX/a0zoWU83voW1zu0dyWTiTnln4IKFAYcZEIw=;
 b=UV76ezEoSOSlHhXHtb9GH10CmwMxEt2mv05WGEpjMV7zHgSqVHEZ56Z72Ofrfqyc2rhrR+
 IyFcpHud8UKxyBRdTu8PCNa7bMMgAhwn2ude2IGswXzfHIlNBcgAEwy9F9R7urKlC859wF
 DiWuGcJ9g9iLudpczbRAWJPm2EoT2vY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-gzpTJzI3OaK3rCZM01VS9w-1; Thu, 21 Mar 2024 12:02:33 -0400
X-MC-Unique: gzpTJzI3OaK3rCZM01VS9w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAC5B803C8C;
 Thu, 21 Mar 2024 16:02:16 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.194.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AE5A03C54;
 Thu, 21 Mar 2024 16:02:15 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: Glenn Miles <milesg@linux.vnet.ibm.com>
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH] misc/pca9554: Fix check of pin range value in property
 accessors
Date: Thu, 21 Mar 2024 17:01:54 +0100
Message-ID: <20240321160154.901829-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: wpHK/pzT+lmu

Coverity detected an "Integer handling" issue with the pin value :

  In expression "state >> pin", right shifting "state" by more than 7
  bits always yields zero.  The shift amount, "pin", is as much as 8.

In practice, this should not happen because the properties "pin8" and
above are not created. Nevertheless, fix the range to avoid this warning.

Fixes: CID 1534917
Fixes: de0c7d543bca ("misc: Add a pca9554 GPIO device model")
Cc: Glenn Miles <milesg@linux.vnet.ibm.com>
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/pca9554.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/pca9554.c b/hw/misc/pca9554.c
index 778b32e4430a8b618322c26b1b185ed3ead97cc4..5e31696797d9564666ece6fe17737ee2a9733e96 100644
--- a/hw/misc/pca9554.c
+++ b/hw/misc/pca9554.c
@@ -160,7 +160,7 @@ static void pca9554_get_pin(Object *obj, Visitor *v, const char *name,
         error_setg(errp, "%s: error reading %s", __func__, name);
         return;
     }
-    if (pin < 0 || pin > PCA9554_PIN_COUNT) {
+    if (pin < 0 || pin >= PCA9554_PIN_COUNT) {
         error_setg(errp, "%s invalid pin %s", __func__, name);
         return;
     }
@@ -187,7 +187,7 @@ static void pca9554_set_pin(Object *obj, Visitor *v, const char *name,
         error_setg(errp, "%s: error reading %s", __func__, name);
         return;
     }
-    if (pin < 0 || pin > PCA9554_PIN_COUNT) {
+    if (pin < 0 || pin >= PCA9554_PIN_COUNT) {
         error_setg(errp, "%s invalid pin %s", __func__, name);
         return;
     }
-- 
2.44.0

