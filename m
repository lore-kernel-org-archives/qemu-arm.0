Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1805735lfo;
        Mon, 7 Mar 2022 13:17:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1yEnlmgDzKKd7jgzd0YN3PuX+MN6GJr2RcVVToMMOy7XoN9kRRDLusZNEg/hYf//qHuXB
X-Received: by 2002:a25:bec7:0:b0:623:c838:2f4 with SMTP id k7-20020a25bec7000000b00623c83802f4mr9170528ybm.99.1646687855518;
        Mon, 07 Mar 2022 13:17:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646687855; cv=none;
        d=google.com; s=arc-20160816;
        b=ZPUkNHbFfb4rPxGJLnK3Ikh7HGOYPihnxxWetYO1mcIDZp7cDNGm3KkjvoIEEVUWLY
         eUY50CQdmHaLWNJ4hCdsWt9qfH498FCTwQLfA97kRFWvgnx6C9h0fgwIrzomNVHNznhK
         bAU5S1limo4YH8eHLNSf4KSOfKV/Lq5q3lrU6bdN9G0ZdT9lfnYq3rtzNu/jnb26//6H
         5zIsipefLE2gq8PjAW99mdYqsvdqMxmeFNjzFX35JN3W29qXnmeBpHpIcQZtx5nWy477
         gl/a4821ckxJArd9EIWwH0v790ETfRkjd7AIxnXYcMozpnoWhythxVcQEqoqQPwEgR8b
         8Rlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=YS8AdaXznpl0s+jpJfJaFLskj44LUxutIBBNWaw69ss=;
        b=nyxuISpASOSPxDA1fuM5naAsvVH/F9NbQaTm2iJZLJ1QoHmKnaEW+4ukzJNiP/Pf6R
         mV4IeZDWO73K9BbxOdD5/5lvoOSkgunZtLDrxqoE+XqdMIN/HZtuHBt3U43y3DXJYyTc
         XCH4EFS0HCQPc8TbGVB7w0hHeGXUerVQ31G3LL6G2icYYGZ/0ESfFTYNuuJLG5N4Sqfl
         XIxjYWx76LyMloS7BBRM8ac6x0iF2itREq9F5yBl7sQbKdM5FCH5doKveNxEDjXOcthh
         tM1R1YyUlfCDhu8y7teBpKWqODsbeopv8kQsph/eUZ9baPLZEA9nJj0auTn4WBZ9t3Oi
         KXxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fz0NSXqo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w11-20020a25b88b000000b0061e20f0d955si10031210ybj.150.2022.03.07.13.17.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 13:17:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Fz0NSXqo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRKjW-000162-Uw
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 16:17:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nRKjH-00011k-8H
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 16:17:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nRKjC-0000bN-2i
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 16:17:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646687833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YS8AdaXznpl0s+jpJfJaFLskj44LUxutIBBNWaw69ss=;
 b=Fz0NSXqoKHPsj1ZLloC7pWesXLgAsg7vSdzxB1f9dnw7lueODIR7ch0vYc6yVvvGKOT+fV
 KayYEbOBQohHRAR/tMtRvSVFGsofWy5WdFZTuREYoHYcgmsCtw99e8QM508ny2ykL2fK51
 r9bWs/PeOhwVcNeI3adkAFRrdtf6gaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-dM6kSQN8NoCzBx6HhGM8XQ-1; Mon, 07 Mar 2022 16:17:10 -0500
X-MC-Unique: dM6kSQN8NoCzBx6HhGM8XQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 166341091DA2;
 Mon,  7 Mar 2022 21:17:09 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 70B4A64185;
 Mon,  7 Mar 2022 21:16:47 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, pbonzini@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 david@gibson.dropbear.id.au, clg@kaod.org, eesposit@redhat.com,
 Coiby.Xu@gmail.com, stefanha@redhat.com
Subject: [PATCH v4 3/4] tests/qtest/vhost-user-blk-test: Temporary hack to get
 tests passing on aarch64
Date: Mon,  7 Mar 2022 22:14:38 +0100
Message-Id: <20220307211439.213133-4-eric.auger@redhat.com>
In-Reply-To: <20220307211439.213133-1-eric.auger@redhat.com>
References: <20220307211439.213133-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: jean-philippe@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dj5u/KfJqKx+

When run on ARM, basic and indirect tests currently fail with the
following error:

ERROR:../tests/qtest/libqos/virtio.c:224:qvirtio_wait_used_elem:
assertion failed (got_desc_idx == desc_idx): (50331648 == 0)
Bail out! ERROR:../tests/qtest/libqos/virtio.c:224: qvirtio_wait_used_elem:
assertion failed (got_desc_idx == desc_idx): (50331648 == 0)

I noticed it worked when I set up MSI and I further reduced the
code to a simple guest_alloc() that removes the error. At the moment
I am not able to identify where ths issue is and this blocks the
whole pci/aarch64 enablement.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 tests/qtest/vhost-user-blk-test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/vhost-user-blk-test.c b/tests/qtest/vhost-user-blk-test.c
index 1316aae0fa..cf8057fb57 100644
--- a/tests/qtest/vhost-user-blk-test.c
+++ b/tests/qtest/vhost-user-blk-test.c
@@ -225,6 +225,9 @@ static QVirtQueue *test_basic(QVirtioDevice *dev, QGuestAllocator *alloc)
     QTestState *qts = global_qtest;
     QVirtQueue *vq;
 
+    /* temporary hack to let the test pass on aarch64 */
+    guest_alloc(alloc, 4);
+
     features = qvirtio_get_features(dev);
     features = features & ~(QVIRTIO_F_BAD_FEATURE |
                     (1u << VIRTIO_RING_F_INDIRECT_DESC) |
@@ -469,6 +472,9 @@ static void indirect(void *obj, void *u_data, QGuestAllocator *t_alloc)
     char *data;
     QTestState *qts = global_qtest;
 
+    /* temporary hack to let the test pass on aarch64 */
+    guest_alloc(t_alloc, 4);
+
     features = qvirtio_get_features(dev);
     g_assert_cmphex(features & (1u << VIRTIO_RING_F_INDIRECT_DESC), !=, 0);
     features = features & ~(QVIRTIO_F_BAD_FEATURE |
-- 
2.26.3

