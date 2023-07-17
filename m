Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp5809848eje;
        Mon, 17 Jul 2023 09:21:50 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFfuc574aolJQL58/fl9cq0bHV/NKF8AGiQ8t3derHwtsO5E5r5qG2BOEKDEsoy27QuOWVz
X-Received: by 2002:a1c:4c13:0:b0:3fb:c225:1b21 with SMTP id z19-20020a1c4c13000000b003fbc2251b21mr9230871wmf.14.1689610909978;
        Mon, 17 Jul 2023 09:21:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689610909; cv=none;
        d=google.com; s=arc-20160816;
        b=ZaJexLos88h7+qVQA0VziswGbucBs+kmWgTmL/cHtz8gqWCb79GYmYokVmKlvkYfvm
         sjX/n0IAo1lVAIdlfZ35iVYM7YpK8vyA4ZVzUnkf07/z5AqhXPg5pEvphe1asSxGv4vx
         9Jj2ZwyrmV00f66GYtZPYNM3IVjtHH2wWurX9MhRH22u33AsgLZJ7vLRMvope8aO1RaX
         Bf1UgN2L4B5XnWg2t5DPQfQZW9zo3xQsK9T+NesrXLwFIthHVqcWlt38F4BaqAfWfs+D
         BH/ByaTSfzLYW6HGougZZ9yeHNyc5zMVNcD8k9dPnCOfGFYt/caudetGij9W1bSVPmOv
         DJCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pfxMAgQSsYnpHAASTrWoEi4WGzS35lvo4o0nj+hUXeQ=;
        fh=UbNHM5nxhoMHD4zZZ8E+sIUa2YHznfFb4wGrwsrLuvM=;
        b=ODoxeSTYizbtEes8Il107dxgsSMFLOzxrI0uMt3rrODjCsc8a3LGdlmqMIXIRAhTRi
         3Nfea7oG3KqVKk9IXvIvov7/jF6vkJHhkD24dU+8LRAL/oQ3Yt+WLgz1rBCKffbDBEXh
         yE7CaGL1c+wH0HMdk7b1T0b3zafCYPDVVVakWsXG16FeGxX2CcGvfmbDoEw/KeEpTVNI
         2Y1MEpWfuuCQnCcMlVcwmyB6UyA57wXCyKpmVofx5wcbVOgb2FRAROnzidggzPOknaOD
         rQkynA9gwl1qZknIKJX45co5QXv/n+UHft9PfRYQR4c5M9f6ik3e0rdaqkxrcmQdcena
         V1aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EAyUq3Np;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q5-20020adfcd85000000b00315962f427esi7944215wrj.811.2023.07.17.09.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jul 2023 09:21:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EAyUq3Np;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qLQyg-00028x-EH; Mon, 17 Jul 2023 12:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qLQyf-00023p-HA
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 12:21:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1qLQye-0008LW-15
 for qemu-arm@nongnu.org; Mon, 17 Jul 2023 12:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689610895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pfxMAgQSsYnpHAASTrWoEi4WGzS35lvo4o0nj+hUXeQ=;
 b=EAyUq3NpR0BGsjdqhZd41CQxqlTLiEG6lwK7pC/P/1h0BIw8NCG8obqC6c+ZiRvRzKouTr
 bZcGr38QLIdTsjn9JVzMmcp7IKsihitWtFd/ZtZXdJOmufksMZbd9Mr8P2bsMuEpViahyo
 2uOrsf1um63jSDLMaQAJ5ihLrKee6QI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-PXwDPZi7P6q6LoF9fGwJCQ-1; Mon, 17 Jul 2023 12:21:33 -0400
X-MC-Unique: PXwDPZi7P6q6LoF9fGwJCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1C92857FD3;
 Mon, 17 Jul 2023 16:21:32 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.192.118])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10A371454142;
 Mon, 17 Jul 2023 16:21:29 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com, jean-philippe@linaro.org
Cc: qemu-stable@nongnu.org,
	mcascell@redhat.com,
	taoym@zju.edu.cn
Subject: [PATCH for-8.1 v2] hw/virtio-iommu: Fix potential OOB access in
 virtio_iommu_handle_command()
Date: Mon, 17 Jul 2023 18:21:26 +0200
Message-Id: <20230717162126.11693-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: B6o/qSuj9nnK

In the virtio_iommu_handle_command() when a PROBE request is handled,
output_size takes a value greater than the tail size and on a subsequent
iteration we can get a stack out-of-band access. Initialize the
output_size on each iteration.

The issue was found with ASAN. Credits to:
Yiming Tao(Zhejiang University)
Gaoning Pan(Zhejiang University)

Fixes: 1733eebb9e7 ("virtio-iommu: Implement RESV_MEM probe request")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reported-by: Mauro Matteo Cascella <mcascell@redhat.com>
Cc: qemu-stable@nongnu.org

---
- added the Cc: qemu-stable@nongnu.org and copied 2 persons involved
  in the reporting loop
---
 hw/virtio/virtio-iommu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 201127c488..4dcf1d5c62 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -728,13 +728,15 @@ static void virtio_iommu_handle_command(VirtIODevice *vdev, VirtQueue *vq)
     VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
     struct virtio_iommu_req_head head;
     struct virtio_iommu_req_tail tail = {};
-    size_t output_size = sizeof(tail), sz;
     VirtQueueElement *elem;
     unsigned int iov_cnt;
     struct iovec *iov;
     void *buf = NULL;
+    size_t sz;
 
     for (;;) {
+        size_t output_size = sizeof(tail);
+
         elem = virtqueue_pop(vq, sizeof(VirtQueueElement));
         if (!elem) {
             return;
-- 
2.38.1

