Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A9BFEDA02
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 18:22:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2Z2R-000134-U7; Tue, 17 Mar 2026 14:21:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2Z2P-00012h-Jy
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 14:21:05 -0400
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2Z2N-0002sR-Uf
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 14:21:05 -0400
Received: by mail-dy1-x1329.google.com with SMTP id
 5a478bee46e88-2c0c482e069so2144478eec.0
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 11:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773771662; x=1774376462; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GQQWpfCkfhdY6LwJcgzOBI0ARhYIsLB8CNzLDt0g+Qg=;
 b=hTnvDrt7W2yilqo7pHolCWe7iUkgobSNgHpJ1Qb0VJjd3COGH/pxJMyx8hIRhUM7Hg
 ueOO5ksklyF4kHYyr02uRFhhKoRCWFIeWALdXB4a72bAY5Djapi+0rW/NItKTKBvooFc
 kVXSVmgXYDCuLLq2b4PzDkZkVWqqGHOhXNzkQKfLPG3uyGqJg3OYpeNni+dXI978Oy1j
 ar0ChjACt0G8/BXC1290pf3zawPsrp1vxUDzITpuT0Ln0f7yMwaIsZ1MCoVgTZ0cPC2z
 Td0wy0m7lGzpYmcv8v7tP96pntGepJE84PtW+t5JVgNTAqjA4Buzxo8Rc1ZBtvmaioww
 9KPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773771662; x=1774376462;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GQQWpfCkfhdY6LwJcgzOBI0ARhYIsLB8CNzLDt0g+Qg=;
 b=Hok1Jz929diLy9xldFBqXtz81lviERdINquJZEBIQdjzlR1FNtBf43kqibHGwXzRVL
 Gm1dOZhLlEeblkz9SJU892NyG7mZIsYQsxB5dxUvzypXwGXnqSF7qClu8dk4Po1iGvuX
 F22lCxD/eV7atyAf04fy/Xl7DVims1K9y60XXjs7bctPzhtFyVeWUPjccmw/5q3W1lic
 vDmIsTe8c8pJJ9ALXcyvS16ffqOGtXLSsEBF6hSsYx5sHTyvL0dXK4yQDfs5DERT1aUW
 se+3gTpT5Nt95DGzG/79rUkeIPiCcKHSv26AZFWGEJh4z/DlIbSmB6IoA/PCjy7dwjkP
 R/hg==
X-Gm-Message-State: AOJu0Yx5DtJSgZTWq7k5IfuzydIf3lxDGDr4I4qQB91p62ETJxWbGgtO
 RcLaBS+lovMOvm6O766TJYZz9fECSRu+boYU7wTID5q4EgbWtNyys9Iao+DDvcuO
X-Gm-Gg: ATEYQzxwfpmtS4Za8Ze4Y0qB0feWVGL48+V7YkVb1+nufz2sH4Kx9GxiIDuvM2UkSAY
 PZrgkyU7MACRKMaj8Xym7RIriVdHOF9dnluuYhMgL68OuvCv6SSOci3XhtAESp+0i/wVXw888ls
 JpwT3lbb+9KCueqUOwyo9xieSRyDvJAUr6gZj2cY3hYajpWBw7AsJBKLQeq8bKHFbzOoZNoRsmq
 XShrA6GdbHQCtnGr2EUSFkGg8bESeH7IakG7ImfhMkVyLeQ09HZKeuFFG4WtoN+MG7XXh7X+3x1
 Kqq5a7CQkxlYHNm3Pb8wI6o6/+UWUNINze7N93M8ocpfcSI+S4mwN3mATDsd14Nt2C4SJPMklBZ
 m1i/g13rSQXA0ZdnYNdtyD+I+ar9IrMDDTSy9kgwLa/n33Jn9Hw/PzFM/CW5/uL+bl6lYepQErA
 gG12uVQljoxyyeF683pO8L0wAXRdiwPudDwcUoAvt+lk16arbsjrhu7WEkGVUDTB8=
X-Received: by 2002:a05:693c:2801:b0:2be:1f56:ed21 with SMTP id
 5a478bee46e88-2c0e4f9a462mr112365eec.7.1773771662491; 
 Tue, 17 Mar 2026 11:21:02 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.51])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e55a53fcsm457367eec.24.2026.03.17.11.20.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Mar 2026 11:21:02 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, dmitry.osipenko@collabora.com,
 marcandre.lureau@redhat.com, visitorckw@gmail.com,
 Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v5 2/4] virtio-gpu: add VIRTIO_GPU_F_BLOB_ALIGNMENT header
 definitions
Date: Tue, 17 Mar 2026 15:20:47 -0300
Message-ID: <20260317182049.33848-3-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317182049.33848-1-lucaaamaral@gmail.com>
References: <20260317182049.33848-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1329;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x1329.google.com
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

Define VIRTIO_GPU_F_BLOB_ALIGNMENT (feature bit 5) and the
blob_alignment field in virtio_gpu_config per the OASIS virtio
specification.

Signed-off-by: Lucas Amaral <lucaaamaral@gmail.com>
---
 include/standard-headers/linux/virtio_gpu.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/standard-headers/linux/virtio_gpu.h b/include/standard-headers/linux/virtio_gpu.h
index 00cd3f04..252704e7 100644
--- a/include/standard-headers/linux/virtio_gpu.h
+++ b/include/standard-headers/linux/virtio_gpu.h
@@ -64,6 +64,11 @@
  * context_init and multiple timelines
  */
 #define VIRTIO_GPU_F_CONTEXT_INIT        4
+/*
+ * VIRTIO_GPU_F_BLOB_ALIGNMENT: device advertises blob_alignment
+ * in virtio_gpu_config (OASIS virtio-spec feature bit 5)
+ */
+#define VIRTIO_GPU_F_BLOB_ALIGNMENT      5
 
 enum virtio_gpu_ctrl_type {
 	VIRTIO_GPU_UNDEFINED = 0,
@@ -365,6 +370,7 @@ struct virtio_gpu_config {
 	uint32_t events_clear;
 	uint32_t num_scanouts;
 	uint32_t num_capsets;
+	uint32_t blob_alignment;
 };
 
 /* simple formats for fbcon/X use */
-- 
2.52.0


