Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp7267548lfk;
        Mon, 22 Nov 2021 09:11:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+tE1HYru3T5kpxSGT3YRFTIV8nv/GbqpLqN9/CKscK3aac06sLl7x8SPP5ay14Xo4pUO5
X-Received: by 2002:ab0:6f4f:: with SMTP id r15mr88566147uat.17.1637601076736;
        Mon, 22 Nov 2021 09:11:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637601076; cv=none;
        d=google.com; s=arc-20160816;
        b=JkWAh1BBCN1ZctaNE2US/dwapWd6RMGW8C86DUCj/X5GZMAdPwswpNcQLfshh7h8dr
         5J0hFwloe4w2HOVwlWECtaU2Y6uGpjRXN9yA+0VWYOpX4Fwd/NP4ZtL0MRFIpI0oWGqs
         c6wS36fd6GuxqK4iloN5z4LbOm/Ir45CEDSgsHpoJbO8PDjqOzBfTbBgeaH7AJwTHwuh
         h8VRScnbuGQGJK0xhA4XQrMc+WddVzIXe/H6JIhRtCpNICQY8CzrM0IHDBEZZ89DYbzR
         Yk4vO8OX3FUjEnaaBoOwbClJ0GlDIkPZGJ/rgo4+fxCk6VCfvIj3i319n9uVaTJsXOeI
         DX0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=2bRu2bTxoagc+gY3qhFWKLnXq7KPciJaWsE5gt2HvLA=;
        b=PIcCq6kuX25gr24pjS3J+aUXe13DbyrkSnhxlAfuf6RN2YcqiG0lG/ydmW3ohQLja5
         R9zbCm2P6gZapMaX72f6/5Xs6sR9eK2ZmCAmgqaq99L2fqCDPWpVRCwblGSu/pL1B7fq
         obu2stxxjcx8j86h9Gpo1bIvQ0/DER5+g7/XMlQV6Gh9s0WpCqzIBlgdH9SMD9wZyNof
         cN4bv+7RjsAjgZa7/BiZh2lnOOfGKltzV0O40JhpWmlZ+pQpYwOAqxRbYOdNg3qQM1sL
         BP2vPR8r61XTrnzdv0Q1gdI867Haxa74qq7IIeCFXz4Tgd+E9lPKeef93UrKbPy+IoaB
         rEsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LoOMCFZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n3si325337vsv.368.2021.11.22.09.11.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Nov 2021 09:11:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LoOMCFZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mpCqa-0000XH-3m
	for alex.bennee@linaro.org; Mon, 22 Nov 2021 12:11:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mpCqN-0000Wb-5h
 for qemu-arm@nongnu.org; Mon, 22 Nov 2021 12:11:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mpCqD-0004Nu-Kh
 for qemu-arm@nongnu.org; Mon, 22 Nov 2021 12:10:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637601051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2bRu2bTxoagc+gY3qhFWKLnXq7KPciJaWsE5gt2HvLA=;
 b=LoOMCFZjUeahRj1r9Zldeu6pfj95E8DywxJGwtY2JNPvQpU662lGUbpwFhcghiXTaDGne6
 MJCozOgWCr5L5aEZoWHJOfBMTvf+Dq4NX/w3mLpUhVlOnn80IKVqV4p03VRtl7zRJppCwK
 WdyPEKI9R9p7d58hKCia1TLDPGT4Z5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-440-pHRNe0H2N7-LvSIuNoPMtg-1; Mon, 22 Nov 2021 12:10:48 -0500
X-MC-Unique: pHRNe0H2N7-LvSIuNoPMtg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 06333659;
 Mon, 22 Nov 2021 17:10:47 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBF4167848;
 Mon, 22 Nov 2021 17:10:23 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, shashi.mallela@linaro.org, qemu-devel@nongnu.org,
 drjones@redhat.com, richard.henderson@linaro.org
Subject: [PATCH for-6.2] hw/intc/arm_gicv3_its: Revert version increments in
 vmstate_its
Date: Mon, 22 Nov 2021 18:10:20 +0100
Message-Id: <20211122171020.1195483-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.709,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LobErRD+a9P9

Commit 18f6290a6a ("hw/intc: GICv3 ITS initial framework")
incremented version_id and minimum_version_id fields of
VMStateDescription vmstate_its. This breaks the migration between
6.2 and 6.1 with the following message:

qemu-system-aarch64: savevm: unsupported version 1 for 'arm_gicv3_its' v0
qemu-system-aarch64: load of migration failed: Invalid argument

Revert that change.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/arm_gicv3_its_common.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
index 7d7f3882e76..90b85f1e25c 100644
--- a/hw/intc/arm_gicv3_its_common.c
+++ b/hw/intc/arm_gicv3_its_common.c
@@ -50,8 +50,6 @@ static int gicv3_its_post_load(void *opaque, int version_id)
 
 static const VMStateDescription vmstate_its = {
     .name = "arm_gicv3_its",
-    .version_id = 1,
-    .minimum_version_id = 1,
     .pre_save = gicv3_its_pre_save,
     .post_load = gicv3_its_post_load,
     .priority = MIG_PRI_GICV3_ITS,
-- 
2.26.3

