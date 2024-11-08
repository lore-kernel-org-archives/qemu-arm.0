Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4966355njc;
        Fri, 8 Nov 2024 06:49:31 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXFXAfb7yfz76i96QxVyTTB0b/z4KQqxU4J5rmSaZWB0wmCKM84cRWLJsRcz0yh1lIBRqVROmGQoPubsA==@linaro.org
X-Google-Smtp-Source: AGHT+IGO2f8ba2Dy7Pdp1BIFXgqFLKROzXg9+RH7L0yULZrf0LYUPRbEv4Bgy+VFzq7idKeVY/fS
X-Received: by 2002:a05:620a:4608:b0:7a3:5f3f:c084 with SMTP id af79cd13be357-7b331e0339dmr395726085a.30.1731077371585;
        Fri, 08 Nov 2024 06:49:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731077371; cv=none;
        d=google.com; s=arc-20240605;
        b=AUDw/exEmBTG9RetdcBfOlgwTxMZRI3x2W+cfv55+Z4re3rN3qxNExDWZC7/dXJkE4
         +nZ3KFoOTaRxalWevuxhWmIhEz5QkB2fdozfNGz4eh8gA2aEfeWYhRiVvYsuBIeny+ro
         v5XUggEZxi5JS1mhqTF+VLL2eBlpYgwFN2Gq2tUmPcmmfOlXaoVUv4UjkOQQlvkRsg1y
         NeGeiROI8Mmuxofg/on3dv3RgxCIRroVBGGJlh14s7HhILZJ/umrhMguIUvQPHxZz1o9
         bLsRQMQIGVyefHnm8E/7MAKbr0kpbN2E2uJ26P6gWVsV9Gfu0L2D+/aJZv22gwiLaE6q
         40qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/7At35sOPcE3GUUaFg/vHYoUFWhiVUqXzP1FpK3MLlI=;
        fh=c65xMaaXLrmNS3m/hiVyPIxfZgK+Ud1G3l7GP8kuN1U=;
        b=ccIIy0Jj1/F3d2J1nR6PRGIpCwdEQOWjc/lTRGSt9T1bDZjdwMLkIKCj9Ar6vhFuG3
         Xpj5s6/mhp9uYNgHj0r3J7AVUMLnQmAu3Jgafys0dvPOjaXJgrgpcAbmMn4Drf6LE7p2
         KbIddcLhUqd/vBRff2pApgfd91irHzDYLgWhZSGldwTMU+Og+p25CaN5zVIK2OZJ+tAR
         8COyxXEkV0xa/bN55Eqx0ydoEddUt1QU2bBXQ07JjTQJ8MgHl5FyBpfcLjEW4g2wjwR8
         8DieaERfpbVcuJn7Nk66XznnN29JwFeYtb7g1xGzbJsmbiGsXaRQxi5t7dNybpx/OBvM
         dwDg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=vq8UqFdo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad27ec1si422721485a.642.2024.11.08.06.49.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 06:49:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=vq8UqFdo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9QHw-0006ZP-22; Fri, 08 Nov 2024 09:48:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QH5-0004ae-6Y
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:47:49 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1t9QH3-0005Nq-5m
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:47:46 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9eb3794a04so311543766b.3
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 06:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1731077263; x=1731682063;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/7At35sOPcE3GUUaFg/vHYoUFWhiVUqXzP1FpK3MLlI=;
 b=vq8UqFdoXd3rTJNorNNZLcaBsTWUpuyGH95+EH2F44VrlkrmYaGdbIsRv3eQQxdN6e
 WJKqejP8K9qeF/j45G5o0F9C+tAlGAO5FykXBNZTzusODp7ZtATqu52NHuypMwY5EfOn
 3yQl+g9/fsxdvnS34nONy6Kr6ssHEvOchC7P3fFjHjreWd2Cl5qhn7x74ptZxBb+pIg8
 ju792il66B5R2+eUoYtN2ZFjUDf5aja491p0G9405wJLxJzmoJt92wqJ9DsE7CbTymWo
 sDPv8DLGFxCI34AAIm7KIW+ulyjKe2C1NJkHg24sdLf1UnN01DW93ATCS63G0jfuxBMq
 Ycyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731077263; x=1731682063;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/7At35sOPcE3GUUaFg/vHYoUFWhiVUqXzP1FpK3MLlI=;
 b=sJ9w1td4wZohkbtZFb62YJoQpVGl4tg/aIGVwrvW7kaMOR6d6psUZaz6S1wY/CMW5S
 dF9k/vajHydKyZIyaPBxPuuGS4h1wQ+ToffBrOccdfO0K51VhDEC+KJFVpPPZsCxtKjj
 69naIGmyKk65CQiDxJ+JjlRJppnVDNWZ4hnf/Vm7BcbhQDf+vfX6b0yoN4/k5O7h/f7M
 644ZaS5uXd8NB+zy8bovX0+yxj07dvF7d3B9DkYrIwNwunjLY33BCcRQwK944V2sALau
 TI5wBikcRNjTWOPqaCn6v3tBdbEEs717rgssqxNcSj1kawy7BFcn+FGZ898bqaCQVjwx
 +DQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLTzhlMrAOv+dC8YOHLsinc+uaKniLkHX8eI+oN+TPPQ47fHSwwn77J1tMMD/DXzD0XM3+BeY05Q==@nongnu.org
X-Gm-Message-State: AOJu0YwSE32FjuC6GO3o82ddkddF8A2Y0DHetbpcXMXbzUkTlGSeFQPi
 Kj8OY/DxCUENODvOr1i7rss+Bcs6R/+uoLaM68Rg1HycPPQvTW4LMbnMEt74og==
X-Received: by 2002:a17:907:5c7:b0:a9a:d23:f8ca with SMTP id
 a640c23a62f3a-a9eeff0831amr287714266b.13.1731077262699; 
 Fri, 08 Nov 2024 06:47:42 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0a4a9b1sm240534066b.52.2024.11.08.06.47.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 06:47:42 -0800 (PST)
From: Phil Dennis-Jordan <phil@philjordan.eu>
To: qemu-devel@nongnu.org
Cc: agraf@csgraf.de, phil@philjordan.eu, peter.maydell@linaro.org,
 pbonzini@redhat.com, rad@semihalf.com, quic_llindhol@quicinc.com,
 stefanha@redhat.com, mst@redhat.com, slp@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 chenhuacai@kernel.org, kwolf@redhat.com, hreitz@redhat.com,
 philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com,
 jcmvbkbc@gmail.com, marcandre.lureau@redhat.com, berrange@redhat.com,
 akihiko.odaki@daynix.com, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org
Subject: [PATCH v8 14/15] hw/block/virtio-blk: Replaces request free function
 with g_free
Date: Fri,  8 Nov 2024 15:47:08 +0100
Message-Id: <20241108144709.95498-15-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20241108144709.95498-1-phil@philjordan.eu>
References: <20241108144709.95498-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::630;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x630.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
X-TUID: Bgo2zLlILG/V

The virtio_blk_free_request() function has been a 1-liner forwarding
to g_free() for a while now. We may as well call g_free on the request
pointer directly.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/block/virtio-blk.c          | 43 +++++++++++++++-------------------
 hw/vmapple/virtio-blk.c        |  2 +-
 include/hw/virtio/virtio-blk.h |  1 -
 3 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 9e8337bb639..40d2c9bc591 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -50,11 +50,6 @@ static void virtio_blk_init_request(VirtIOBlock *s, VirtQueue *vq,
     req->mr_next = NULL;
 }
 
-void virtio_blk_free_request(VirtIOBlockReq *req)
-{
-    g_free(req);
-}
-
 void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status)
 {
     VirtIOBlock *s = req->dev;
@@ -93,7 +88,7 @@ static int virtio_blk_handle_rw_error(VirtIOBlockReq *req, int error,
         if (acct_failed) {
             block_acct_failed(blk_get_stats(s->blk), &req->acct);
         }
-        virtio_blk_free_request(req);
+        g_free(req);
     }
 
     blk_error_action(s->blk, action, is_read, error);
@@ -136,7 +131,7 @@ static void virtio_blk_rw_complete(void *opaque, int ret)
 
         virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
         block_acct_done(blk_get_stats(s->blk), &req->acct);
-        virtio_blk_free_request(req);
+        g_free(req);
     }
 }
 
@@ -151,7 +146,7 @@ static void virtio_blk_flush_complete(void *opaque, int ret)
 
     virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
     block_acct_done(blk_get_stats(s->blk), &req->acct);
-    virtio_blk_free_request(req);
+    g_free(req);
 }
 
 static void virtio_blk_discard_write_zeroes_complete(void *opaque, int ret)
@@ -169,7 +164,7 @@ static void virtio_blk_discard_write_zeroes_complete(void *opaque, int ret)
     if (is_write_zeroes) {
         block_acct_done(blk_get_stats(s->blk), &req->acct);
     }
-    virtio_blk_free_request(req);
+    g_free(req);
 }
 
 static VirtIOBlockReq *virtio_blk_get_request(VirtIOBlock *s, VirtQueue *vq)
@@ -214,7 +209,7 @@ static void virtio_blk_handle_scsi(VirtIOBlockReq *req)
 
 fail:
     virtio_blk_req_complete(req, status);
-    virtio_blk_free_request(req);
+    g_free(req);
 }
 
 static inline void submit_requests(VirtIOBlock *s, MultiReqBuffer *mrb,
@@ -612,7 +607,7 @@ static void virtio_blk_zone_report_complete(void *opaque, int ret)
 
 out:
     virtio_blk_req_complete(req, err_status);
-    virtio_blk_free_request(req);
+    g_free(req);
     g_free(data->zone_report_data.zones);
     g_free(data);
 }
@@ -661,7 +656,7 @@ static void virtio_blk_handle_zone_report(VirtIOBlockReq *req,
     return;
 out:
     virtio_blk_req_complete(req, err_status);
-    virtio_blk_free_request(req);
+    g_free(req);
 }
 
 static void virtio_blk_zone_mgmt_complete(void *opaque, int ret)
@@ -677,7 +672,7 @@ static void virtio_blk_zone_mgmt_complete(void *opaque, int ret)
     }
 
     virtio_blk_req_complete(req, err_status);
-    virtio_blk_free_request(req);
+    g_free(req);
 }
 
 static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op)
@@ -719,7 +714,7 @@ static int virtio_blk_handle_zone_mgmt(VirtIOBlockReq *req, BlockZoneOp op)
     return 0;
 out:
     virtio_blk_req_complete(req, err_status);
-    virtio_blk_free_request(req);
+    g_free(req);
     return err_status;
 }
 
@@ -750,7 +745,7 @@ static void virtio_blk_zone_append_complete(void *opaque, int ret)
 
 out:
     virtio_blk_req_complete(req, err_status);
-    virtio_blk_free_request(req);
+    g_free(req);
     g_free(data);
 }
 
@@ -788,7 +783,7 @@ static int virtio_blk_handle_zone_append(VirtIOBlockReq *req,
 
 out:
     virtio_blk_req_complete(req, err_status);
-    virtio_blk_free_request(req);
+    g_free(req);
     return err_status;
 }
 
@@ -855,7 +850,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
             virtio_blk_req_complete(req, VIRTIO_BLK_S_IOERR);
             block_acct_invalid(blk_get_stats(s->blk),
                                is_write ? BLOCK_ACCT_WRITE : BLOCK_ACCT_READ);
-            virtio_blk_free_request(req);
+            g_free(req);
             return 0;
         }
 
@@ -911,7 +906,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
                               VIRTIO_BLK_ID_BYTES));
         iov_from_buf(in_iov, in_num, 0, serial, size);
         virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
-        virtio_blk_free_request(req);
+        g_free(req);
         break;
     }
     case VIRTIO_BLK_T_ZONE_APPEND & ~VIRTIO_BLK_T_OUT:
@@ -943,7 +938,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
         if (unlikely(!(type & VIRTIO_BLK_T_OUT) ||
                      out_len > sizeof(dwz_hdr))) {
             virtio_blk_req_complete(req, VIRTIO_BLK_S_UNSUPP);
-            virtio_blk_free_request(req);
+            g_free(req);
             return 0;
         }
 
@@ -960,7 +955,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
                                                             is_write_zeroes);
         if (err_status != VIRTIO_BLK_S_OK) {
             virtio_blk_req_complete(req, err_status);
-            virtio_blk_free_request(req);
+            g_free(req);
         }
 
         break;
@@ -975,7 +970,7 @@ static int virtio_blk_handle_request(VirtIOBlockReq *req, MultiReqBuffer *mrb)
         if (!vbk->handle_unknown_request ||
             !vbk->handle_unknown_request(req, mrb, type)) {
             virtio_blk_req_complete(req, VIRTIO_BLK_S_UNSUPP);
-            virtio_blk_free_request(req);
+            g_free(req);
         }
     }
     }
@@ -998,7 +993,7 @@ void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq)
         while ((req = virtio_blk_get_request(s, vq))) {
             if (virtio_blk_handle_request(req, &mrb)) {
                 virtqueue_detach_element(req->vq, &req->elem, 0);
-                virtio_blk_free_request(req);
+                g_free(req);
                 break;
             }
         }
@@ -1048,7 +1043,7 @@ static void virtio_blk_dma_restart_bh(void *opaque)
             while (req) {
                 next = req->next;
                 virtqueue_detach_element(req->vq, &req->elem, 0);
-                virtio_blk_free_request(req);
+                g_free(req);
                 req = next;
             }
             break;
@@ -1131,7 +1126,7 @@ static void virtio_blk_reset(VirtIODevice *vdev)
             /* No other threads can access req->vq here */
             virtqueue_detach_element(req->vq, &req->elem, 0);
 
-            virtio_blk_free_request(req);
+            g_free(req);
         }
     }
 
diff --git a/hw/vmapple/virtio-blk.c b/hw/vmapple/virtio-blk.c
index 1652151ec9c..fee1cf0ecaf 100644
--- a/hw/vmapple/virtio-blk.c
+++ b/hw/vmapple/virtio-blk.c
@@ -58,7 +58,7 @@ static bool vmapple_virtio_blk_handle_unknown_request(VirtIOBlockReq *req,
         qemu_log_mask(LOG_UNIMP, "%s: Barrier requests are currently no-ops\n",
                       __func__);
         virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
-        virtio_blk_free_request(req);
+        g_free(req);
         return true;
     default:
         return false;
diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index 28d5046ea6c..dcb2c89aed5 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -109,7 +109,6 @@ typedef struct VirtIOBlkClass {
 } VirtIOBlkClass;
 
 void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq);
-void virtio_blk_free_request(VirtIOBlockReq *req);
 void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status);
 
 #endif
-- 
2.39.3 (Apple Git-145)

