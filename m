Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DCDFEDA02
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 18:21:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2Z2Y-0001BR-UA; Tue, 17 Mar 2026 14:21:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2Z2W-000192-Dz
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 14:21:13 -0400
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2Z2U-0002tA-MV
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 14:21:12 -0400
Received: by mail-dy1-x132d.google.com with SMTP id
 5a478bee46e88-2beab594d8eso723818eec.0
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 11:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773771669; x=1774376469; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MzRVprj61Gyv11VqdvdVphNrBFaUcy37KCZX6QpUas=;
 b=hq+XcBb2uLGD8fOVHzmgy1ly4FD1TwlBaf2WA7Z7WE8F/NUYyWv4LqHfpJR4SNwkuA
 bFmD7jbmoEiHsyHwrgZNr5NApohTEC3Pd0s10vEAtkNmTvLiuHTTwFgEvxLTHcBQ/45Z
 1O6mTOsgDhcl7FfSHTUHj1fOzqP5ZrDz3CRbn2d+UdKyM3OkK/e4375++9oeyJWIu7bN
 I38WaUmL1jEOvhHqIcEqsVYFRzg7dWjuFnZKdYHCedznvlH8OIF9jZFcC5xpA26DylPF
 evaS0t29kCr4Ma1a4yqEo+SlY81I2K34flnfBmkwq2PTFnsXxqh5qUMf6+HkwBOiUHIx
 6E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773771669; x=1774376469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5MzRVprj61Gyv11VqdvdVphNrBFaUcy37KCZX6QpUas=;
 b=kZ8abDFVS45X/VB97Q3pwxgSYCQXZdkY96RvhJeQfvB9yu5Vlmf4zJFfbsGRd5F/Vq
 47P8NLcszmqCwqvgqrkNbyIlmWDFm0BCSnYpKRzoY39YYnxGLJCVLwx+3QGnUa53XhXS
 yi+S/AYdHXw1lXNEKm4zS3uprsMfhM4gzrNHeXK9ljsrfFrTSdgeLT+i41UHUZrGMKLw
 KOTxv/xx0fZFM+hifwo/7LKWccUgdNlrvFHAC7L2zWkot5ecVuMMffty6YcuMhkZV1/W
 gEke5THJcbthqwUoQdZk/ofzJ6OspUYBbS7p1MdxqmIYCLGIHJBY3uuGAirHvjqjuqUD
 yk5A==
X-Gm-Message-State: AOJu0YxoTC4l4fYPaHljNevhmCrui/j2Co2aqWvcAffK5GououiFx9db
 wJT6mcVtqU/mSiknY4TA4Mk3vY9KRD07cGdRNhZHppWMJEaTyCFZCHUd
X-Gm-Gg: ATEYQzxzAp0YvNcd+4ba3Rd1SZNYk5L7YuooPcqDhccCKoZJ0+FigH+f8GO5uVyskuP
 MwBJgqiHUd88XMFiNdQjd578x+yKNg+TbiHoJ7m5uqUV2fLeoydcBgbh378rO+plpWbSbstn4Vl
 65du8o3Zla/U3mo1xFtAQK3GnnSav2dN921MRV5nfXbBR8W7DTKLIEP5k4GbhAfpN5QO263rr8B
 Ne8ZEc8/yLNvZZNXSilutoIMK10nr2MYJMn4WWTDQqiBeFq1+mw2NZAPEr/g3ZIxl9ZdNxdxj1+
 a03NWCX301g3bKVpHZ4DehxMygLRXzIrJOOacISCiQKR2Ky8Ub9siQs5dtByOCSL5+9NFpaLHBm
 tSm3//mg1joriNGNeb7CJQReIljeQ+dYRMXrT+GHujsAyV02m+X3/juA/FbZng3vrmuHm6/5USr
 /Dy5EGBG9EQtEvjmVOh0Wi6M6TlwcO7xCH7sCDn5jqWvll5warwbEo
X-Received: by 2002:a05:7300:1496:b0:2be:142f:d499 with SMTP id
 5a478bee46e88-2c0e50206damr253935eec.16.1773771668840; 
 Tue, 17 Mar 2026 11:21:08 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.51])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e55a53fcsm457367eec.24.2026.03.17.11.21.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Mar 2026 11:21:08 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, dmitry.osipenko@collabora.com,
 marcandre.lureau@redhat.com, visitorckw@gmail.com,
 Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v5 4/4] virtio-gpu: advertise VIRTIO_GPU_F_BLOB_ALIGNMENT
Date: Tue, 17 Mar 2026 15:20:49 -0300
Message-ID: <20260317182049.33848-5-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317182049.33848-1-lucaaamaral@gmail.com>
References: <20260317182049.33848-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::132d;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x132d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Set blob_alignment to the host page size so the guest kernel can
align blob BAR offsets accordingly, avoiding alignment mismatches
with the VMM's memory mapping API (e.g., hv_vm_map on macOS).

Guest-side kernel support (drm_mm alignment) is pending upstream
Linux merge.

Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
---
 hw/display/virtio-gpu.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index de7a86a7..44ae5034 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1532,6 +1532,14 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
 #endif
     }
 
+    /*
+     * TODO: guest-side F_BLOB_ALIGNMENT support pending upstream Linux merge
+     * (Sergio Lopez's patches, Nov 2025). Until merged, the guest won't
+     * negotiate this feature. The host advertises it per OASIS virtio spec.
+     */
+    g->parent_obj.virtio_config.blob_alignment =
+        cpu_to_le32(qemu_real_host_page_size());
+
     if (!virtio_gpu_base_device_realize(qdev,
                                         virtio_gpu_handle_ctrl_cb,
                                         virtio_gpu_handle_cursor_cb,
-- 
2.52.0


