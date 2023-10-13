Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp1330846ejc;
        Fri, 13 Oct 2023 00:51:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHORIgxAUhlo/yAjk8wv0glA12QZGmTRQ45sDJVi1E6iq0LwJQhpMoI2JjsvmJ3wlRxgoji
X-Received: by 2002:a0c:f1c8:0:b0:666:6022:a8c6 with SMTP id u8-20020a0cf1c8000000b006666022a8c6mr25844437qvl.54.1697183466275;
        Fri, 13 Oct 2023 00:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697183466; cv=none;
        d=google.com; s=arc-20160816;
        b=Wv6pXJkr4U93fkAXYPF/rZOvC8t35ZEyZjWQCQD29ZyzX96t7Y0NEppnbXrgDf7cSg
         JSDj6mQYyy9JiffxQPiQtKtYIDr8khp3c+EFkdX/aNNcat3GBECnJ99Xl+2txZHAin8c
         XtupMx04e9hk7tfFK2sswaEgfVk0nl0qfBj7PC+1FRW1MAdqd4adWLuilNf+Nk0+nXIn
         hYyhRQQAZJw13fjwky5iTGVtJNhXUq8HA3CJaW1K8iLqU+Xhfgfl16mf0ebWEi1UYxNj
         ZnnjXM72vM25lFGbrMPZSFFDd+XeK1SBcmWTVMkXJ04kyPb5aUzdxqT8bqol8YXLHCDe
         4+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=KtdJELuGCqaz6k9Vi6yvdb+Hy9MnEYqnd5uLlh799bE=;
        fh=wQ3O8kd+IfgCrRp9LKla2HahxJtTKPGo6r1jTn11XQs=;
        b=gL97xpbLOyyIVXTEbRgfBm+vrA8Deru7NO9KLT8tkD7A1wwSmFTbxHWzgct5Yi+ddX
         VUMCcTLE3sEaruW0DJMOQjoPoSQYWnfFvjTp22iuB0qaykLSWMGDZmg9/+OduuvKn/EN
         q97acirZ4TGPNttBLSAq2NFeLVSZmwDgakKn9G0TXL76Vt4XTbGacHK5U8DU0bZRO4JG
         v/BA/9WPDtIXp6VItA/pRe0nFaJ+yGXJK+SuqzZy7ILYZTRQ0JtcHOQNc1WTdmXwBEr1
         ER75QoL9JPzBAoWgGdVAbnVaq8VPwIQKKqT6OsnEczIPM2kwKd6uEsXka+1EpMGzmqlm
         X9qQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pGCRRdIv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020a056214118a00b0066cfe943369si816224qvv.358.2023.10.13.00.51.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 00:51:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pGCRRdIv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrCw2-0004JM-6B; Fri, 13 Oct 2023 03:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCw0-0004IK-BY
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:50:12 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrCvx-00047M-BW
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 03:50:12 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-323168869daso1722466f8f.2
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 00:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697183400; x=1697788200; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KtdJELuGCqaz6k9Vi6yvdb+Hy9MnEYqnd5uLlh799bE=;
 b=pGCRRdIvFtks2OP68Ivj+4q/H4EgNbHhO3R4m+yw4HzPCPJNSSDfPYePs9sqm7tSs0
 VslbYY7GKZQaUJiGCYGhupmPZWotzLURuxZl4gf5z3u0QFTWO0TYLHxmNRKo3+oCwC5C
 eNDw2Ukym76uwmGW+FJ/9zZjc0uaPswaqBsjN7DRS8S7rL58ejPqJyQeNZJci6bhx0y2
 mKVU5z41dtsFaHvt6r6ZaZwDIiDVfJFpng3fFWUxG1Gg9gorfMcJc3CkhnR58jNNxfNN
 hgj9O1TNPRSU+QrELgDinG/iZz9/zRRHQm04lwKevYLtZW7scQ74vhvmu6wAQcgclTIn
 4wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697183400; x=1697788200;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KtdJELuGCqaz6k9Vi6yvdb+Hy9MnEYqnd5uLlh799bE=;
 b=dDlVwziZlefGMO73rdMeHe0VO8tUAW7P1P2txS7vz+3sCo73vWgcnYrwCwgN9Cpr8u
 ig6w/mKwuMeDS2618OpIZ6g91T1zX+ciDbAxo+EsNsIqBel8tL785GuWhMYRL4qovHZ2
 TLrWzgN3jN+siV8O82BCGQJkZW+yHS6vayfs+EMKCWQ9ZcTeHmKh6AQnk9/EF6omlNTK
 nTI7zhIQvY9SqnOFSckWDwv1yckG7Cg8RTXwX32zxCHpoy95/1roYCLzoHTm9nN5WPNU
 65T6ZGEDonc3xRPgOnTZWjahxsp+BiCwCjebsEkgilUiXz+pDYcWtjez3ZLu2Zby84il
 reUg==
X-Gm-Message-State: AOJu0YzD7PwcqjiK17W1KtnoI/0Phv3MPJ3w64W4h6R4xndOPEIm0Gng
 Nr0PudUn3bTasxhLI2w+wWYcCA==
X-Received: by 2002:adf:f68f:0:b0:317:f714:3be6 with SMTP id
 v15-20020adff68f000000b00317f7143be6mr20483928wrp.61.1697183399753; 
 Fri, 13 Oct 2023 00:49:59 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 m8-20020adfa3c8000000b0032d7fde2d3csm7990663wrb.79.2023.10.13.00.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 00:49:59 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-block@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Hildenbrand <david@redhat.com>
Subject: [RFC PATCH 07/78] hw/virtio/virtio-balloon.c: add fallthrough
 pseudo-keyword
Date: Fri, 13 Oct 2023 10:47:11 +0300
Message-Id: <40e39148a03476f886d37500e4104fad64107d63.1697183082.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
References: <cover.1697183081.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: EMVyKpfp1GsT

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/virtio/virtio-balloon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index d004cf29d2..0f0d94bd94 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -636,56 +636,57 @@ static int
 virtio_balloon_free_page_hint_notify(NotifierWithReturn *n, void *data)
 {
     VirtIOBalloon *dev = container_of(n, VirtIOBalloon, free_page_hint_notify);
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     PrecopyNotifyData *pnd = data;
 
     if (!virtio_balloon_free_page_support(dev)) {
         /*
          * This is an optimization provided to migration, so just return 0 to
          * have the normal migration process not affected when this feature is
          * not supported.
          */
         return 0;
     }
 
     /*
      * Pages hinted via qemu_guest_free_page_hint() are cleared from the dirty
      * bitmap and will not get migrated, especially also not when the postcopy
      * destination starts using them and requests migration from the source; the
      * faulting thread will stall until postcopy migration finishes and
      * all threads are woken up. Let's not start free page hinting if postcopy
      * is possible.
      */
     if (migrate_postcopy_ram()) {
         return 0;
     }
 
     switch (pnd->reason) {
     case PRECOPY_NOTIFY_BEFORE_BITMAP_SYNC:
         virtio_balloon_free_page_stop(dev);
         break;
     case PRECOPY_NOTIFY_AFTER_BITMAP_SYNC:
         if (vdev->vm_running) {
             virtio_balloon_free_page_start(dev);
             break;
         }
         /*
          * Set S_DONE before migrating the vmstate, so the guest will reuse
          * all hinted pages once running on the destination. Fall through.
          */
+        fallthrough;
     case PRECOPY_NOTIFY_CLEANUP:
         /*
          * Especially, if something goes wrong during precopy or if migration
          * is canceled, we have to properly communicate S_DONE to the VM.
          */
         virtio_balloon_free_page_done(dev);
         break;
     case PRECOPY_NOTIFY_SETUP:
     case PRECOPY_NOTIFY_COMPLETE:
         break;
     default:
         virtio_error(vdev, "%s: %d reason unknown", __func__, pnd->reason);
     }
 
     return 0;
 }
-- 
2.39.2

