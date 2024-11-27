Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp851875njb;
        Wed, 27 Nov 2024 07:08:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUYqw/43fVgPo5XOMKlVAwb2C5TYObzIXX7sLpVomGMeGHeVV5rvmIMVoBhiI0rSpv25Zyuz64Q2n4tHg==@linaro.org
X-Google-Smtp-Source: AGHT+IG/OSLqyELD37+tSV5SW9tMTVjOpfBXIhUA+ofnySBpdM8L/EpK9jh9cH8AFuFgMXbmgmT7
X-Received: by 2002:a05:622a:44c:b0:466:9d0e:1920 with SMTP id d75a77b69052e-466b352bcaamr41825531cf.24.1732720133354;
        Wed, 27 Nov 2024 07:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732720133; cv=none;
        d=google.com; s=arc-20240605;
        b=KGX4BLz+cOjJ+eUzJuZF1rEXhTXv540wXEXFOUCIyS6OoC1Ql6J6GlHAhUFZMJkGXU
         uI/iF+3AGNTgXQ7ayox7VxH8AwhSd4aU/1vsHRsm+bkmoCeIe2zK8pKXXqh4KrF41ULJ
         BYlXaDeIpSLVGIRNecjiSAisNhE9U7YwVJOFHIuEmK2VhRdNs2UxUf2cD9Si2ma64oDp
         0hvmo+SignxHZJtrGxNfCYku7s9A4KWaYn7YOwBVq6vDlDSgjHlyD8wIsgIAIjl5IRe5
         oiitv2w9opDPcJX6ksEhg4iHhS9CZEAvb4Ps5dHB5NqUsLSM/rCaHWtzk0ixdkqxQ7xy
         LpiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u4PftIaJY5WW8m9G2Hj2qdFNIE2AjQ7TTMvwTvxzsTM=;
        fh=jMlQ0IyNbsp8K+AokAnQ8SinjN0UXtFzEnB3wtOdIC4=;
        b=l0lcFJxOUAmFaxzublw13WVCKg8PA1BP++nMRXl5w0wfUrlNOAlERgoICjeGlr2cbT
         KwUBpJcaD0JRm0pS+XDy4maEzTcBFMenGBGFY4CKRJkdbtuciM7jEuJc8YtLXmI6mqIC
         OidK02IjMxWzoABa/K6dfxRp9vC4c7hRzQE2ldMIUI3Ub5r9OWejZgda8bZRaRsA+rMh
         GRR1vidzD5v4vFra2NqcTrRj0XSXPVJzNNcs0y5uIXYoJDustUHlNzIh6wY11FLJJMZ8
         UO1A+vsGnD6mNplN0kLj6zVFVT5zlY0RKrYl9ivcDx5Vn2kOY+6nbicnBvbvchfVAGrl
         AQmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="eL/K/BLY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466af717eb9si30451341cf.570.2024.11.27.07.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 07:08:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b="eL/K/BLY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGJe5-0003xI-Qo; Wed, 27 Nov 2024 10:08:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJcy-0002Lz-62
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 10:06:56 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tGJcu-0000DT-3l
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 10:06:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-434a45f05feso26084975e9.3
 for <qemu-arm@nongnu.org>; Wed, 27 Nov 2024 07:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732720006; x=1733324806;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u4PftIaJY5WW8m9G2Hj2qdFNIE2AjQ7TTMvwTvxzsTM=;
 b=eL/K/BLYSA8fNam6YzherN6wVVZK1zqLzpUhioRMa0H00RtPUGOvB2JkqBCKmU372Q
 ueU31Dk9Ll9pNGx/CncKaHsAtSkgVhIg9SNcCKfDLd8klKJa2P8bvYXzaF+1HqSmyiOL
 V9TfajvuLSAEsoupJxotdHZ7BUcqTZL0xYqxDOH2MrNVN22ab7RetI2cJ4YgPS71/6sM
 UMjYwi/9/bQy/ldLtUr95dZsfgbZ39mJQvccHMIb7YslYz3yTX5XZyw+JyMekyoDtgka
 RPrtSSH5juroTYGPuSxDtygl9KEI3K2l1C7uazErZXpSN8/gaNbvtS6LdGf4CgOu96v5
 4FVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732720006; x=1733324806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u4PftIaJY5WW8m9G2Hj2qdFNIE2AjQ7TTMvwTvxzsTM=;
 b=BFwaa660HYMhb9vYN1ePuFynNT20RtQ+eaq5V3M8V8L/2gSj63QhEXAAIBHuoCnft7
 BTITqElBArWq7XJOV7TlXkjb0OI7GYf2lZQbaNNLZJ+y6pQd+VwNnjcUZuagB4TLyh/j
 WVJ6seQNcfeXhl4wJuyHwPsuUhHDNgKZH4+/EZZT5M4VVrNBvDkVaPsEOw8xM79fe8Ac
 al7a02DRf+qEBMX4ggKi8ZNK3iqfspMnFu82VNiuuESPpc3NtVifnYSziuZS6U5XQ1Kn
 FaeNWKJv/E164arWU/pgZFyFapJrcuy57r+84RCSqSMvLpVbJriAJi4yzV23nl2nvrkD
 invQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDe38dZo0sRFqZFCeVy1VnsE11S+okZdb/waPWjjMuhiP08eY3dhOhv4+hKY/+zPmvRpJTKWBI9w==@nongnu.org
X-Gm-Message-State: AOJu0YwcoXQGQrpGjKbTm6svWvRHuuoqlBnpFpdtUvWwYy0Ds/gfoaWz
 HvKziSBZSd4obpwwOc59DWjBZnUAl7cot5sRW85g4+G2n3GVltebwwcgKsaVRA==
X-Gm-Gg: ASbGnctwffndbCSWpjKVKHZcTYqCabUC41MUiyhvjQL/39wLvQT6cCx2PMI7gAMrizd
 s0IwXtkt+sqCcnj7lZY7fEsqNN0OF8rPCKbsmcDbcS5dDfh1MtFfjaeuw6XNNjAIGzCeGXYKjm9
 NIwu2LcCQL9ASJFmr/2QMo/8iYXD52TTEkCLNxTNM8dlQXiMf2jg2cqnmhsm4uo5oX+iNHCyUHZ
 NXBZdk1KXU+VzUvi3+WBoyJvqKpAO/2ivkKLy7QJbaBmxGgGZ68bHR3HUliPBf+/K07W1Wt29tL
 wgKi9HgJeuM4B7GBdjO/etzOkw==
X-Received: by 2002:a05:600c:4f85:b0:431:4f29:9539 with SMTP id
 5b1f17b1804b1-434a9dfbb05mr31606715e9.32.1732719999501; 
 Wed, 27 Nov 2024 07:06:39 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7e256esm23339155e9.32.2024.11.27.07.06.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 Nov 2024 07:06:39 -0800 (PST)
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
Subject: [PATCH v11 14/15] hw/block/virtio-blk: Replaces request free function
 with g_free
Date: Wed, 27 Nov 2024 16:02:48 +0100
Message-Id: <20241127150249.50767-15-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241127150249.50767-1-phil@philjordan.eu>
References: <20241127150249.50767-1-phil@philjordan.eu>
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
X-TUID: +3Gm/9c/s2tN

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
index 9aeb2931922..52d857166bd 100644
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
2.39.5 (Apple Git-154)

