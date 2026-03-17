Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEC1FED9F6
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 17:50:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2YYk-0005rj-7C; Tue, 17 Mar 2026 13:50:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YXw-0004zx-0p
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:49:36 -0400
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YXu-0007A6-Jt
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:49:35 -0400
Received: by mail-dy1-x1330.google.com with SMTP id
 5a478bee46e88-2c0c1e03405so82872eec.0
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 10:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773769773; x=1774374573; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5MzRVprj61Gyv11VqdvdVphNrBFaUcy37KCZX6QpUas=;
 b=i7B5wQ3KU2T3Y3YFx/bvTaVtG6kjTHYgprJHTquQuynMis0JeRf9Hxg2plSrBVP0Mk
 U4bKmUdron1GUHE2EQ0RZ0SG7zPLkV4YIcgZhvESv/9oyr2LYhldBQljHjF5MUR4xxOI
 4nfXMRS9N75rpE+DqcpQaZg9KEfOzCskq5lSCIj5hkMBtg4BYiKss/cDBerXrhgYVNxM
 1RKle0qgxo86AoMOkgNOphA0KX2mpM5MTVlwMHRihUk2Rtnjg0lZZ7sndTXA2jpHjvIY
 QHjV/4J5S8VHfWvgMpzCkOl6hMFC6F0ERugjiE8ELjD8+VzlYmEPeGEB93VYeN20LnU5
 yOwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773769773; x=1774374573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5MzRVprj61Gyv11VqdvdVphNrBFaUcy37KCZX6QpUas=;
 b=ZzSJEAK8VTLtMO9GGJkwy5ydTn8PArbEeZJ+jXLXMMiTTu43+FQYLLPl2FqI+rm6Y2
 QMbfA0N4cQfT3kWe9jZ17ddFD0FgavfDUEW2gavwSzvavroyubZKE1V5vo997OPdXqIV
 aBAlz+EOxRR2Oxj0QytKUVlSliVwH8afSHYAMaiTt2O4yNd1AGFj/W4NE0EtKXexBkHK
 Lqv0iM20VvniJGuAs31c1kepWnQNFWUdsUhk//ubziET3kfziGGzU0xhnxWMeskrkXW3
 MQDg5Vnni8Hl4Q+PhFp5W2UV8An9BKv6M2ZMoItRhg5Rathjq6CcsRHXdegEQa5gDMRj
 IyHQ==
X-Gm-Message-State: AOJu0YyPT2UgoJVerXl+HT3Q4jLZTGkSj5FLEnb0bD0PWsO+Y1QjIIX7
 gaBcqR2cDfen1a/t5phBNsVKl9c2j2KNo3qlw6ehppybuAoHo5DXOfSY
X-Gm-Gg: ATEYQzxhkVrSAMoRCWhyQV3ICr3jG9VeVC3w2spOeJn3HPsdPbt9hCTAGZ+uLyZOObL
 iz17JlR9v4J7drxhdzN/ULh7dZdcRTAPYclYRUxYJFoRWfWQURNotVe4dpChama66tVpp4jpm1D
 X18stsRL8awVQu4dV/e8IImRRlNBVfGJt63flCfsxsVsiQuBJBTSRyExo1083taZOtXNfoGQinl
 7H6X+CU1IENWZ1r8xBr/aHEfwZNoAwDIonzSudr9FRdZdpSZS3utgK4vhwi7Q8GfZR8SMETuk1g
 AJ5dKaT4IXo7TqRXbiHS2NEbqPfo8yy/MfatYuzASP2llDNgd6GIw9ZGmoerxx4vAIPtdZyn8w5
 K9HMeE2+FmQasHXQcnkKKuewST57KCNAjBefa0L57IJK8tuy3iZ/z02sD9oesh7potR9TNY6S6T
 hd8N393ubbtyGovcg4ic6xkgqnu2VIkV6HOa3k64pAzYc6XCfjwUQt
X-Received: by 2002:a05:7300:7fa8:b0:2c0:ca48:3107 with SMTP id
 5a478bee46e88-2c0d5248965mr1601952eec.15.1773769773222; 
 Tue, 17 Mar 2026 10:49:33 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.51])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e536896csm282115eec.3.2026.03.17.10.49.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Mar 2026 10:49:33 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, dmitry.osipenko@collabora.com,
 marcandre.lureau@redhat.com, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v4 4/4] virtio-gpu: advertise VIRTIO_GPU_F_BLOB_ALIGNMENT
Date: Tue, 17 Mar 2026 14:49:15 -0300
Message-ID: <20260317174915.31829-5-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260317174915.31829-1-lucaaamaral@gmail.com>
References: <20260317174915.31829-1-lucaaamaral@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1330;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x1330.google.com
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


