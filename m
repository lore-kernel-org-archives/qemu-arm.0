Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp502715lfa;
        Thu, 15 Oct 2020 04:56:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJ5NO1ncxZE77HwzhJCCcJHr7DamQBP2CZAsyo9uOThY6W8kAZfX9zZYJdkymqSwnZqY0m
X-Received: by 2002:a25:146:: with SMTP id 67mr4823255ybb.156.1602763012400;
        Thu, 15 Oct 2020 04:56:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602763012; cv=none;
        d=google.com; s=arc-20160816;
        b=sXaKQW2IYG/21O/id8AAUuXEwbD8eTr66FLDkhGMRMlzMgbvXmvqfn6qj2kmHy9RvZ
         y/m8XpmIGcaaAFdYHq6GBeiLy8yN1za/bGak8+IFjYc59CusKu+52Ef+pymCLvllJQBD
         0zW2Vbit0wpw3htnL6lizz9FvUF1uk94NirTiRNO39XbOiiBtqIYP1q1dHFmD4UMeVuY
         3FbfDdZymhDg6rRp0c8BTfLZH1SVQRL2OBY5UyxdfxmjD1n0VYFJPbsosNv/48wTLh5S
         q5fAPD/+8PVrozetswzc0Ex1yKZKO8TCPecTt4wuOdFv5mJqvNDp9fiRGk6BXCgzjjiV
         FjhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=4yxs1c/4iaxsYQiNdwuXpCrreWqd+LrLkK671WD+ltE=;
        b=Qaxj1mhaMqQXRtEoXqZJUK04cUyzZfsxXz9JoF8z9BeEJxCigz2ZaGe43xVrpmt/R+
         ZV0DbMq/L81W0avRpPxDA/0yZBnZEmQ2b8YuT7YiFu/BFJvoPxTgrt9tHORF2ZyfrOMF
         67azkfGVNAFG7rehqHyhOsn1wk2IVGwJgWbgXsL82f/2MvvcQZSdpU1EBzx3v7xqnbDH
         MxZPZXMvZRkd9hvjUosc38LhQ3fLdWW4GpB+oUedEAZWjVCkswd1jqk4EfY7UCqunf/F
         dDkm3apbhzWwpCVPxks+n5oeA4jPA5gMbNXwp+iWOIf7Aqck0Wa6ctzQs/vekUhUdGnk
         ivZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IS3nfXDw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c127si1180980ybc.237.2020.10.15.04.56.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Oct 2020 04:56:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IS3nfXDw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kT1sJ-0006Y5-OW
	for alex.bennee@linaro.org; Thu, 15 Oct 2020 07:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kT1pm-0003Sh-Tb
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 07:54:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:50505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kT1pj-0003Kb-Rg
 for qemu-arm@nongnu.org; Thu, 15 Oct 2020 07:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602762850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4yxs1c/4iaxsYQiNdwuXpCrreWqd+LrLkK671WD+ltE=;
 b=IS3nfXDwYpGHjp4wa4W+oJSxrpIAZAbAeUqZVNxchXZerOjA3FFzeA5zOs71Gs3XuCVIW/
 gef+rZ3FelQgeqWHRbOgNEDQw1OHsEXWhtIBiB14zinJGOD1uPDmRg2cREYjSX/RoY5De2
 JrQw8Y3wPUmCI192PcYp9re1i/WukCA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-3Kz0U5iFOAKZ_9RgaNZB9Q-1; Thu, 15 Oct 2020 07:54:07 -0400
X-MC-Unique: 3Kz0U5iFOAKZ_9RgaNZB9Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE2E11091062;
 Thu, 15 Oct 2020 11:54:05 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-210.ams2.redhat.com [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A6EC6EF51;
 Thu, 15 Oct 2020 11:54:03 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, fam@euphon.net,
 philmd@redhat.com, alex.williamson@redhat.com
Subject: [RFC 4/5] block/nvme: Change size and alignment of prp_list_pages
Date: Thu, 15 Oct 2020 13:52:51 +0200
Message-Id: <20201015115252.15582-5-eric.auger@redhat.com>
In-Reply-To: <20201015115252.15582-1-eric.auger@redhat.com>
References: <20201015115252.15582-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/15 02:10:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, mreitz@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ax+g27h1kuHY

In preparation of 64kB host page support, let's change the size
and alignment of the prp_list_pages so that the VFIO DMA MAP succeeds
with 64kB host page size. We align on the host page size.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 block/nvme.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/nvme.c b/block/nvme.c
index cf8ec200af..be8ec48bf2 100644
--- a/block/nvme.c
+++ b/block/nvme.c
@@ -210,24 +210,24 @@ static NVMeQueuePair *nvme_create_queue_pair(BDRVNVMeState *s,
     Error *local_err = NULL;
     NVMeQueuePair *q;
     uint64_t prp_list_iova;
+    size_t bytes;
 
     q = g_try_new0(NVMeQueuePair, 1);
     if (!q) {
         return NULL;
     }
-    q->prp_list_pages = qemu_try_memalign(s->page_size,
-                                          s->page_size * NVME_NUM_REQS);
+    bytes = QEMU_ALIGN_UP(s->page_size * NVME_NUM_REQS, qemu_real_host_page_size);
+    q->prp_list_pages = qemu_try_memalign(qemu_real_host_page_size, bytes);
     if (!q->prp_list_pages) {
         goto fail;
     }
-    memset(q->prp_list_pages, 0, s->page_size * NVME_NUM_REQS);
+    memset(q->prp_list_pages, 0, bytes);
     qemu_mutex_init(&q->lock);
     q->s = s;
     q->index = idx;
     qemu_co_queue_init(&q->free_req_queue);
     q->completion_bh = aio_bh_new(aio_context, nvme_process_completion_bh, q);
-    r = qemu_vfio_dma_map(s->vfio, q->prp_list_pages,
-                          s->page_size * NVME_NUM_REQS,
+    r = qemu_vfio_dma_map(s->vfio, q->prp_list_pages, bytes,
                           false, &prp_list_iova);
     if (r) {
         goto fail;
-- 
2.21.3

