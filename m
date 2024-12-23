Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp4343236njk;
        Mon, 23 Dec 2024 14:19:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUCNEvvlZbjHyvxLXU4P8DT5cXI340xK53aRBKwP2yhjMVpJZTM0v7O7/nKUvGdy3m20MCpm0Z/lY8Thg==@linaro.org
X-Google-Smtp-Source: AGHT+IF712G+TuUbjwONc+k+YEyO9ZjPWkObnMBRzN/gHFYu6uLfV1mfIQmREfozfJhS2eV6n8vc
X-Received: by 2002:a05:622a:287:b0:467:5836:a98 with SMTP id d75a77b69052e-46a4a8cdd59mr276543541cf.19.1734992345513;
        Mon, 23 Dec 2024 14:19:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734992345; cv=none;
        d=google.com; s=arc-20240605;
        b=JQXElGwoQ19eWCs+iWTqHeOnOrzaLKCfxeW+z1JLgbbJYo2DV7lVz+pc3TctCLZAjJ
         QVbbNe34ObxV2d1uO27/vIdBdYPEfUyD3j0EdWbNADzFpW4Vvi2qJs6JRr28NSbZ5gZ8
         JIgv5KAnA5tDb8qofnZYhTztHkTRsqyCqOT60AAoWzzU5fwSQG/6/mpA1PjFYFMxUFj7
         CnwA96GHDIQFVF0Iz9CAroQBblfgthFDNe1r5IsdN1qtFuN4TyG+Mn3AQlJ+i8/VmI7q
         oixUtqArfp/cXMR8BT5M+tJYP79DSMY7CahT19f7KBUWZ4dgmnMK8Iq7gdVyhSAxetXm
         hsuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=rG/Ex5cDLypYB0gVNFYo0dp+pIr9pUiXcWYns7xY6UM=;
        fh=u1NOcxtI5BG0n/7uD/0sgN4Llsm+EKSRgrYze8zhf08=;
        b=LJRYg3NFi5lzXg+mIFe0+1GnolF7MkmCSQpv35lPQR72nDY004n8rdT6TpmWjJ2HB+
         0vFXeRLT6Gis4Ozw8sq5IuRpQdrzHrpFPpiQ7PsqIMtaHCr3tFzWt7r4bht78qbLq7or
         anJsWgmKJyQKufo3Aqj+YMdVjtlqpDmd/7QmG+9r6/WFTO1GNxctaBaK1PllWAg61pxA
         gOOXW/lxXJ+BBGMZIZBxtrbpHG+NNflZbqVwo+5A1RdT2pB8vFbTr8/peesD1zG6Iki4
         BpD3qDBYPILGc2ME1LQWxrO5qywO8Wqv6lIAQ5zMUkxPcWAdY1EfJ+yCmeN25Yc8y1XZ
         feHQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=cCWBMUBG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3e6ad851si132815701cf.201.2024.12.23.14.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2024 14:19:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=cCWBMUBG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tPqkF-0002Ro-Io; Mon, 23 Dec 2024 17:17:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tPqjy-00026D-2W
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 17:17:31 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tPqjt-00072h-5R
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 17:17:28 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43621d27adeso31961715e9.2
 for <qemu-arm@nongnu.org>; Mon, 23 Dec 2024 14:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1734992242; x=1735597042;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rG/Ex5cDLypYB0gVNFYo0dp+pIr9pUiXcWYns7xY6UM=;
 b=cCWBMUBG7/pBtXM7HL8e9ZDAVeZnALHXObRCLhbb8ALwQRneXqh2PaVasYMwB14y0Q
 mvTj8iAXbxM7lbQwJEIt850VA2ITgu5JbuKl10v2MaB6ucJmI4PjwVvwlhp0KzG50WxI
 3FDCvIW4JVVlWMuQqDyvDs6qTOFkHH1UbTWKLeLfC0esS9pAhS8ceBiJn1vxZbdQN/1e
 rdG7Tb+JtjaVkqe2bGG6R8NX2+bmSvi1OGwY6Iy9i2NvjvYqAwqq4CHYtUeAaxFCp+Cz
 6vVsJylC9QYvfj11DsgVAdJJgsbWCEfT6ghxLJbKcBf1h5mRKy6PC3t8ijdM67J7x2qC
 I1iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734992242; x=1735597042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rG/Ex5cDLypYB0gVNFYo0dp+pIr9pUiXcWYns7xY6UM=;
 b=LCHKVFZYzEeLIYI8F1YnBf3yGAuHwjBgG97KZTqXgDx1jwTv1FxMbMYgsku7ALQ1R3
 7dllp3JINWG7NGvSCSTSpVx6pBf7obVAHN0C4/AZ05m7MQbiwIMAAqo7OfLhniLXSw3u
 yjKVz6t1S7jroTPHhLNVocMxv6+5n0kXmztp/j0oITNBiFbfI7bwS/82I7X/FlpciHj0
 9wAJeAPWbqmX1Xb61er2L1yKuUvLwC5sXf/xKjWZXD1Deb+5NyxYeUrGz4VFg+ixIiqh
 AbZd/q9EZ6qbK3mktbhHTLAeB2fPu1iyLgVfj3yyOHsasP+65CrWrQl3gMsvWTfuhHAF
 SqhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUEB9Bg35gqwKoGvFB26S5m3QFM7C/JyTykFHJvb1brmH4msnmTBQfxc/yhdDPl3JgT4XriCbf7A==@nongnu.org
X-Gm-Message-State: AOJu0Yw2KDvYMTD6D8HcxPnCy0w4CMgW/wByPPHjzzFF3gNYXHZMpgRa
 eBevy7KhAr44xpItEEhmtCkfUF44ddWgOFhZS+l/+gvXaExhglA77IPUyf9rnQ==
X-Gm-Gg: ASbGncvP1ALaME7ifsssipb+M6mcdmFhtZJbMQQs5t6ZY2K2IqiuYNbzKQVVC11O5uo
 fUyQi5rWiZfeouMoIa6UApT60KjJJZvpri3bOPZZ1tEQgFS7Vxo+P/13xHFHp3WFhB6X1D4kYHP
 UxzX0dKXX7/kqX4F4lQQhUCVJ9OO+oxlnYXLCoCuobx8HwKkmZ3fVCs8/GYvV01kgUHfM1rW8mj
 E2pJADYePMhV+dNWGRcAU4gDA3NFMbdO55tw9okZAIeKF6p40UEOa8r48JdDAmNQRutyKKpVsic
 aIYFvzvCbD9osKYgNCVEKkCyoDIAy9GZ
X-Received: by 2002:a05:600c:3b86:b0:434:ff9d:a3a1 with SMTP id
 5b1f17b1804b1-4366854826cmr111469785e9.2.1734992241900; 
 Mon, 23 Dec 2024 14:17:21 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611fc161sm147561075e9.10.2024.12.23.14.17.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 23 Dec 2024 14:17:21 -0800 (PST)
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
 qemu-riscv@nongnu.org, balaton@eik.bme.hu
Subject: [PATCH v16 13/14] hw/block/virtio-blk: Replaces request free function
 with g_free
Date: Mon, 23 Dec 2024 23:16:44 +0100
Message-Id: <20241223221645.29911-14-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241223221645.29911-1-phil@philjordan.eu>
References: <20241223221645.29911-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::32c;
 envelope-from=phil@philjordan.eu; helo=mail-wm1-x32c.google.com
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
X-TUID: J/J9F+zPu335

The virtio_blk_free_request() function has been a 1-liner forwarding
to g_free() for a while now. We may as well call g_free on the request
pointer directly.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/block/virtio-blk.c          | 43 +++++++++++++++-------------------
 hw/vmapple/virtio-blk.c        |  2 +-
 include/hw/virtio/virtio-blk.h |  1 -
 3 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 22a087529d..f131bd58a2 100644
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
index 656dbecbfc..6b434b8842 100644
--- a/hw/vmapple/virtio-blk.c
+++ b/hw/vmapple/virtio-blk.c
@@ -55,7 +55,7 @@ static bool vmapple_virtio_blk_handle_unknown_request(VirtIOBlockReq *req,
         qemu_log_mask(LOG_UNIMP, "%s: Barrier requests are currently no-ops\n",
                       __func__);
         virtio_blk_req_complete(req, VIRTIO_BLK_S_OK);
-        virtio_blk_free_request(req);
+        g_free(req);
         return true;
     default:
         return false;
diff --git a/include/hw/virtio/virtio-blk.h b/include/hw/virtio/virtio-blk.h
index 495edff1b7..3d8dee7ec1 100644
--- a/include/hw/virtio/virtio-blk.h
+++ b/include/hw/virtio/virtio-blk.h
@@ -109,7 +109,6 @@ typedef struct VirtIOBlkClass {
 } VirtIOBlkClass;
 
 void virtio_blk_handle_vq(VirtIOBlock *s, VirtQueue *vq);
-void virtio_blk_free_request(VirtIOBlockReq *req);
 void virtio_blk_req_complete(VirtIOBlockReq *req, unsigned char status);
 
 #endif
-- 
2.39.5 (Apple Git-154)

