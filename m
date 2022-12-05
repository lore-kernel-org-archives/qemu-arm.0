Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3378152ejx;
        Mon, 5 Dec 2022 01:53:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5rE7OG6NiUfloqkW2vAn8XlrpPkT99ZyTE/nHPpq4/Zkktj4N/cehH/6cBgzQbIlnMw0hU
X-Received: by 2002:a0c:fcc2:0:b0:4c7:7237:9d0d with SMTP id i2-20020a0cfcc2000000b004c772379d0dmr2138913qvq.52.1670234037140;
        Mon, 05 Dec 2022 01:53:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670234037; cv=none;
        d=google.com; s=arc-20160816;
        b=0708nHjQIBP/W2Rg1DR2sXkZnDme3b27P5DTSWsYBVTadeQRObwAJMtlR3tqLd41ok
         64k3bfRa3vA25VshIa9izgcnP5ygPf5zUOL+VhrRkPOhykFsWj2i3FGR5Ni10C7xZh8k
         JJ4H554p93J68Qqd/uczwKWsX9iP49+TLx+fN5MT40a03+ViHR5wq2drx66zcsVQEWXL
         i6PJenFGtXKO8q+m5sw54fqVxADhh7BcFasBB+DVkJgNsP6khkgxGjwoSoF11mTqTkB4
         NCOPPtDEYntl68nBam8C5jNuoSE7tItCR2r/MBFyOH1Rz40zz1LAOCSLfOjdiywmX4iK
         qd+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Yv32VybYVhxmtkUKSRTxJbrtrMCQayUU3iWUHvoUh0A=;
        b=sR5fF71ZqZQ0lhg4eGqxa0hWMsSAjGCAMb2DrLffvkUtstSpBpK/MInV+D0mAwpkdv
         +xf1DXwMJ4u0thxUxjcXzYanz41AF88E5u/J8bwofcCM+ww6E7xGn3p4WXJOSF07APu3
         wdtdrixFyKhmIqsxaCdQvWJ6rLfbwoegxrI6Mhr6g6Uk2zKViJyMaCQ4B6c8pXlDMsd3
         Iz8TphEIPtHb0VCGk6JFpCDUg3j5rr+H3Vmv2J6q+BkdXCJguAMrgW9ZWr9WMdWzlWHh
         3BgqWg5t9X8CTSqnsvWaV/9cGx5PtJhQBifK5lUts1XakmMcP+vrDcQLY+YO13XrANkJ
         tVbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CVrFhvGD;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <quintela@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id h16-20020a05620a401000b006f765f6aa33si7949211qko.52.2022.12.05.01.53.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 01:53:57 -0800 (PST)
Received-SPF: pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CVrFhvGD;
       spf=pass (google.com: domain of quintela@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=quintela@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1670234036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yv32VybYVhxmtkUKSRTxJbrtrMCQayUU3iWUHvoUh0A=;
	b=CVrFhvGDbIJBawFCUO1V5nQ3tkm+tMTHYJykUOXQyKmmz9cC2JmscAg4BFMnW9p9IxiZbL
	O/wvTxYmP5Hj+FfJwf8ZBwcKLOAs8whSMF6PkNxNyiN8rGcBKE0LF1lj2jRJm2vcW12hZQ
	L2BIuSA27pqhZIA21ZB+bg6YTWGmcck=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-4ZY-NG3LODKLWCT2EFEwLQ-1; Mon, 05 Dec 2022 04:53:53 -0500
X-MC-Unique: 4ZY-NG3LODKLWCT2EFEwLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26DC53C0F663;
	Mon,  5 Dec 2022 09:53:52 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A9DD2166B29;
	Mon,  5 Dec 2022 09:53:44 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>,
	Thomas Huth <huth@tuxfamily.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Eric Blake <eblake@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	virtio-fs@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	qemu-block@nongnu.org,
	Xiaojuan Yang <yangxiaojuan@loongson.cn>,
	Thomas Huth <thuth@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Gerd Hoffmann <kraxel@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Jason Wang <jasowang@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Song Gao <gaosong@loongson.cn>,
	qemu-s390x@nongnu.org,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Klaus Jensen <its@irrelevant.dk>,
	John Snow <jsnow@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Keith Busch <kbusch@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	qemu-trivial@nongnu.org,
	Hanna Reitz <hreitz@redhat.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 09/51] block-backend: avoid bdrv_unregister_buf() NULL pointer deref
Date: Mon,  5 Dec 2022 10:51:46 +0100
Message-Id: <20221205095228.1314-10-quintela@redhat.com>
In-Reply-To: <20221205095228.1314-1-quintela@redhat.com>
References: <20221205095228.1314-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: A/eby38gWcN5

From: Stefan Hajnoczi <stefanha@redhat.com>

bdrv_*() APIs expect a valid BlockDriverState. Calling them with bs=NULL
leads to undefined behavior.

Jonathan Cameron reported this following NULL pointer dereference when a
VM with a virtio-blk device and a memory-backend-file object is
terminated:
1. qemu_cleanup() closes all drives, setting blk->root to NULL
2. qemu_cleanup() calls user_creatable_cleanup(), which results in a RAM
   block notifier callback because the memory-backend-file is destroyed.
3. blk_unregister_buf() is called by virtio-blk's BlockRamRegistrar
   notifier callback and undefined behavior occurs.

Fixes: baf422684d73 ("virtio-blk: use BDRV_REQ_REGISTERED_BUF optimization hint")
Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221121211923.1993171-1-stefanha@redhat.com>
---
 block/block-backend.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index b48c91f4e1..d98a96ff37 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -2576,14 +2576,25 @@ static void blk_root_drained_end(BdrvChild *child, int *drained_end_counter)
 
 bool blk_register_buf(BlockBackend *blk, void *host, size_t size, Error **errp)
 {
+    BlockDriverState *bs = blk_bs(blk);
+
     GLOBAL_STATE_CODE();
-    return bdrv_register_buf(blk_bs(blk), host, size, errp);
+
+    if (bs) {
+        return bdrv_register_buf(bs, host, size, errp);
+    }
+    return true;
 }
 
 void blk_unregister_buf(BlockBackend *blk, void *host, size_t size)
 {
+    BlockDriverState *bs = blk_bs(blk);
+
     GLOBAL_STATE_CODE();
-    bdrv_unregister_buf(blk_bs(blk), host, size);
+
+    if (bs) {
+        bdrv_unregister_buf(bs, host, size);
+    }
 }
 
 int coroutine_fn blk_co_copy_range(BlockBackend *blk_in, int64_t off_in,
-- 
2.38.1
