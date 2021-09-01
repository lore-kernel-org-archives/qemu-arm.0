Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp108522lfb;
        Tue, 31 Aug 2021 21:19:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybDVtSxFLIoUSkuPBKzS0XI835PgjUCcxo6VSzU5uqF7ARsYz0AJfZIW9AMJaCtkAr06Jj
X-Received: by 2002:a6b:e917:: with SMTP id u23mr25923147iof.19.1630469989648;
        Tue, 31 Aug 2021 21:19:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630469989; cv=none;
        d=google.com; s=arc-20160816;
        b=fOpV2N6l2Q7n4Yklcw9CgbMN9X0QgDtamfgaOj2xVFlqF9thT6t8uK7NQbnDJaILs5
         9Q+pL9SeBAOkwGEH1j2KaK2hkBSvlDFYJcaARkAfOb+KKKGtE3vEG/Tagby03Zj5Q0Ff
         TVp0/O//RewOYwom0l71uT0CopfwevOfi4SHxerJVo78AxPCNsLA09gm7rslMwH7+8lX
         1e8aMprmAkFZf/mcaS5GT9Tv1xwfLtBcUwguVrFWykKMBhmPoH7wblK9/xUHmJFpeb2I
         KmlR8srJkzIUJ8lrv+Vh2vsh+zE371+tYruhRiyoNiRZICxsyhaZM7y7YeOA5P1QNu8u
         +qHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=mLOPf1xCTlqQ/t3W8GytumapqhP0eAFYbQZYI52nSSs=;
        b=hRu1vjIGL4BaKB/qRgs59xW+ol16oTyePkvKVbr9N3keQhV/Or9JnhBXkLlJ7+brpy
         xrYjEo01tmCt/jUF/W+aFGOfP02qEvJki7p6sAXgLoomVB8xwUqhcM+lHksQpOT3DG2K
         Uvdc5SQZur9mnz3PMj+djHMQ4J3K/ZZJZr2tpmU2F91Qv95vM39sgcr3hjqhEoe+ETDH
         UXAi1T8UiMNYAFgnALuFFLYhP9CwjWFxCU8U46w5CmHTawDvwN2VwRV1dVeMf4/Rpnyk
         Bk86bT/gfcRWZkxmptC+0yIuxCvkleCaz1NV1Nl2m2y/7tohd6soTbA2/23od1LtFpth
         OnPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XVauzL4U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si503198jav.1.2021.08.31.21.19.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Aug 2021 21:19:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XVauzL4U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLHj2-0005zf-Ur
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 00:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHim-0005y5-BR
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 00:19:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mLHie-0001Pn-8y
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 00:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630469963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mLOPf1xCTlqQ/t3W8GytumapqhP0eAFYbQZYI52nSSs=;
 b=XVauzL4UiGq037z9jjT1mCCHP3OrvI4oTK18cfIm0BefXXrpYa4Qc5Kfkzdu6cdFRBdVLW
 biBii7nnD8dS9lmr18kXNQo/K6INR393GxQ2maH5BXXeb8SOjIdCX8MBq+iN1C+/G4jLgK
 c3vqkJi/1HNssgUlZtznl5tKQWP36rA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-WHm6skOHMrOSdW-dLHrk8Q-1; Wed, 01 Sep 2021 00:19:21 -0400
X-MC-Unique: WHm6skOHMrOSdW-dLHrk8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6AE14189C446;
 Wed,  1 Sep 2021 04:19:20 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CDAA60BD8;
 Wed,  1 Sep 2021 04:19:05 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 367C01800799; Wed,  1 Sep 2021 06:19:03 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] virtio-gpu: no point of checking res->iov
Date: Wed,  1 Sep 2021 06:18:58 +0200
Message-Id: <20210901041903.3111086-2-kraxel@redhat.com>
In-Reply-To: <20210901041903.3111086-1-kraxel@redhat.com>
References: <20210901041903.3111086-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Dongwon Kim <dongwon.kim@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xQyjPg/2Ags3

From: Dongwon Kim <dongwon.kim@intel.com>

The code should check the opposite condition of res->iov because it will be null
if virtio_gpu_create_mapping_iov fails and actually this checking is not even
required because checking on ret covers all failing cases.

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Message-Id: <20210830175033.29233-1-dongwon.kim@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/virtio-gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 990e71fd4062..72da5bf5002c 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -362,7 +362,7 @@ static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
     ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
                                         cmd, &res->addrs, &res->iov,
                                         &res->iov_cnt);
-    if (ret != 0 || res->iov) {
+    if (ret != 0) {
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         g_free(res);
         return;
-- 
2.31.1

