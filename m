Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp811679njk;
        Fri, 29 Nov 2024 07:26:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXuJCd2cy7RZdCG1D7zaAWLR2mCWVVv8UiOgc71tPDAbx/rOVw5pzQfVggkYDVyPdxcxS2aSReal608fw==@linaro.org
X-Google-Smtp-Source: AGHT+IGO8zK5cyupq+zAzIva8m9ksofpmaFOxvkBCs7XCtCFn/Z0n3hyenTWnjc0ls/biderIR3+
X-Received: by 2002:a05:6902:1b0e:b0:e39:8341:d5b7 with SMTP id 3f1490d57ef6-e398342700amr4842945276.15.1732894014373;
        Fri, 29 Nov 2024 07:26:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732894014; cv=none;
        d=google.com; s=arc-20240605;
        b=Rsg9EWjiYEJZvr5OeeM9+5EIUIeSQYD+T384tpKE0OuL3kLbkqf2OXt5mu6HN8j3Lg
         4d//4AsXhwvF5uSGgF7WI4orFIdcNlsw2ErK0dth6aPx3dFy617n38VgGida87j5wYK4
         LW8lVp9unpNpzyQxW6p0cQxokiBFRxzNrx3pXwq0E5VEJd+JElXYAmKXo3Jmc4Y54smP
         5/uoudOtCwy5y6arcBkvhwWX5QcPr7/eazwF27mI6jU3YNjRNwXkdBdnMawDvFgw5qIt
         Kjc+KJ4INFuW7FTVvJI6gf7FonM5HD21RzYh7RzN7BXqXfr/xmz283ulZNMfPIstbVAa
         bSCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=+KLl/U9SRrXWpu5Bd6j4KSXAwUgPPC0zC5446bBcsE8=;
        fh=LN0yc6md+q3vHcgav+nkDF5U1LeFRnJ1ce5wUEdK79o=;
        b=LvC8rRuC7hoABhu3dIdM5IO6kpHZHltpN5kvgN5kZWXnbIajj1lOA5UgWq1jRTZ+zt
         oVRn4IEuWEJqfunerSYAIuR+VG5l0vOOldST3nZsL65upfAGkLRuDs+muD2p5jJFwAQ9
         SErFy5RUkAh2p82lciIINwayK4n9Fxsh4VLp0zUEGk2jIpleai1RnT0FQdLJgaJonmRu
         knztjVKZLBBcUygWOtEIOBBbNV80erLI+pRClnrzajEby7umI2+QVOvdYWCMBZ4/he17
         0vbX2jNvLhIsafHeYuH2QGzRObzuK3IV6U7PsEBgzM7tB2Uvpgs0wCh7o0wiSLcGQa9G
         bimA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=gvYNFLVO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e3976d1c3ccsi3370226276.673.2024.11.29.07.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 07:26:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=gvYNFLVO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tH2sY-0000Nz-2A; Fri, 29 Nov 2024 10:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tH2sL-0000Al-Bf
 for qemu-arm@nongnu.org; Fri, 29 Nov 2024 10:25:45 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tH2sH-0002HZ-5n
 for qemu-arm@nongnu.org; Fri, 29 Nov 2024 10:25:44 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso284754f8f.2
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2024 07:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1732893939; x=1733498739;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+KLl/U9SRrXWpu5Bd6j4KSXAwUgPPC0zC5446bBcsE8=;
 b=gvYNFLVOPIdfavviCeY7tz/DuzIvsUr1z0YzUgGervwCKryjmnsaXYo++WfqEE4/1v
 dLEn6iUg6QmFnRaOzSmk2qJMvNclszsu5gTSQdItL63A4laXN5nLB81Bzpa1wkYq/H/Y
 UpkAQDPw16A6HLBLj+IxMn9pPU3gT2yAUTKBPMRvA2Ft7iCnjZokXP88/aikrF7zBsq0
 5o8Gf3O4IuJ3PGjCBejl0lKmb2z6D5Emo0BFM2LqqvoBO7gsnp3bo1mCAWK7ofAShm+p
 w+qWcZYBuy4U56BS0okMJCUcjzQ++eCCCBqF5+acSbQehIyyA/cFtH4HE68Qniq8fgPj
 lMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732893939; x=1733498739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+KLl/U9SRrXWpu5Bd6j4KSXAwUgPPC0zC5446bBcsE8=;
 b=SqeGRHmYJuIREhszj/iMB8vcTdtTBi5wGFUM1eWS1kiHtERTZRllh/gSf5vQMfXyZk
 +huJm7zTl0FXt2TVnTxsAGMTk3IgNfcD/UhXLHwtPF+ta7nIk3Ovc0vIJ2WPwCC0aI17
 UUTPY1GGqb70z0mpuVdttNWJMLr32AER2YmGc9OtRU3YBPCmQ1baJ6DsfZLkTTJwQmNH
 3eLj+kcT3ztaoog+3utu9JPRHPXd1M8SYvTa0cdA/fRZDYtlRWUuZAlPpovJeNBtP21q
 ywmNQ7oFp1aiY1kATTDI5zNvBbn3Q6tfBMu00EoEXzN3A72KfO7wOUwA2zDApGLbzP/O
 HQFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6TdEjVi42L9nuVrAPjG8EuVjpzaGQ+HtndET4xNbM2nnQJTOnsuRsej98HuW/1nAHCGg9CPJKXg==@nongnu.org
X-Gm-Message-State: AOJu0YyF5PXypiOrmMwQ71u7cqeucmv0QakuXT4DdyGU4UUeKn+ZPPTZ
 JbHKevj0FkrQInH/Uy+8ntwNRDbQOukyQ5HuP8wSmMOX0KBeoNeytZIGrNCu0A==
X-Gm-Gg: ASbGncuBPT5Fpz7KrwaeB/urywUMPpxyL7xpn9xm2+oyn6k3ZyBAKexWjLek3GPnuxw
 UvWx8nNlem60o4xtptLWVgf5/gLT4VpyByrjo9B2iSsEH9Bn4/BupjZ0bPxw6/WO8xlnhi+AN7A
 Npx8y7UOCYbmIkt1QrwenGddqLiyeAAkXA5LOWGDYbp6Kawj/4yq1YSjOfBQdXG+nbht7WKhknw
 5zvDVOmx35SOyQ/lKKapQRKEdur82h2X0Sm4eC4Orfzoj6rp4kAt1j79H4a9I7m8Q/ydAIPQUmn
 /y7d3zqUxW/19Iz754flBk3Weg==
X-Received: by 2002:a5d:5f88:0:b0:382:3c79:1f0a with SMTP id
 ffacd0b85a97d-385c6edc5a1mr7579426f8f.58.1732893939471; 
 Fri, 29 Nov 2024 07:25:39 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd2db2dsm4685119f8f.14.2024.11.29.07.25.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 29 Nov 2024 07:25:38 -0800 (PST)
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
Subject: [PATCH v12 14/15] hw/block/virtio-blk: Replaces request free function
 with g_free
Date: Fri, 29 Nov 2024 16:25:05 +0100
Message-Id: <20241129152506.59390-15-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241129152506.59390-1-phil@philjordan.eu>
References: <20241129152506.59390-1-phil@philjordan.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::42d;
 envelope-from=phil@philjordan.eu; helo=mail-wr1-x42d.google.com
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
X-TUID: iMIpzdQPc50m

The virtio_blk_free_request() function has been a 1-liner forwarding
to g_free() for a while now. We may as well call g_free on the request
pointer directly.

Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>
Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---

v4:

 * Use recommended object type declaration pattern.
 * Correctly log unimplemented code paths.
 * Most header code moved to .c, type name #defines moved to vmapple.h

v5:

 * Corrected handling of potentially unaligned writes to virtio config area.
 * Simplified passing through device variant type to subobject.

v9:

 * Correctly specify class_size for VMAppleVirtIOBlkClass

v10:

 * Folded v9 patch 16/16 into this one, changing the device type design to
   provide a single device type with a variant property instead of 2 different
   subtypes for aux and root volumes.
 * Tidied up error reporting for the variant property.

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

