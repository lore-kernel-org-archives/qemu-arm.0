Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CFBFED9F6
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 18:21:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2Z2K-000117-T3; Tue, 17 Mar 2026 14:21:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2Z2J-00010f-Ci
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 14:20:59 -0400
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2Z2H-0002r5-RI
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 14:20:59 -0400
Received: by mail-dy1-x1331.google.com with SMTP id
 5a478bee46e88-2c0c955a481so408820eec.1
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 11:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773771656; x=1774376456; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1cs50hPDAwmrC0euzS8VUJtwzGSW5bsaYhh3jdDi+v8=;
 b=aa2RZfd5PNmw8HiLiI9hd6jwChJ1nrKINoH6wSOspJRrZR6EZ2Rqs433sAIto622Vu
 0QkjKo2UKVFhmYWZ4nuascmwdQ7D9zg2NU/978+RYwGv9WqT7q3JJKQH4Ox/i/X63zl6
 uW0hSr+A7tgLxldX1Orx7ACeNcMs1NSiktBbSPGlfnrdyFRRptQ2bd3PStpVbPA1RO3V
 cmxfejj4PR+weo67RMAp2feECAk2fO0UndGGEb7fx+2UzqOO7kyIP5JGpoHb65StPtbn
 id/CapHUNxKNAOrfUQ13QvE3ezDfVY606OM7ZlObXEWYRucR2S19PBfc4nr1ZtLO9/98
 jh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773771656; x=1774376456;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1cs50hPDAwmrC0euzS8VUJtwzGSW5bsaYhh3jdDi+v8=;
 b=Gsd6doUuVHC74cNwX8zg4K93099oeqpzbqREOG5Kz92+NrmKr4RAB57fIBLKo4hOEa
 ryJrBTdKoiDJXOb4sXRrs0d5p1pBULQN6ndzg32rutHvKW8jJOPTxwJdN4K3jNFeH9fA
 Ld6Uk50JSJ008HFM0Nltlexdlox0BNfQYM992J149+VpMe481fBYquFNc6DVzvbOGnhu
 3GyJ4CxHsHAI3gIft0J2SEVpfgRIJuhhni3JD2ThSvXW2fnjLy8OPwDlqdBaG0BD4NNJ
 u5FrSQD/7pwk3AD2uIOEzzbFAZreQ5EfeBiyVDrTA5VXREsJhfjz7pHyrXqQLOPCzK9a
 0n1A==
X-Gm-Message-State: AOJu0Yy4eU03LGuC4BAHwNK6OGGb4PW9fGiV1cFegQtxFiH3DTHLoukY
 IWJvSxqdovKUeWuiD8FunLk3vxLuEMuT1c4MGol7U4699eJOSE2Ijfhn
X-Gm-Gg: ATEYQzwWaeiY+o5nwqCoxWlusHXbMY1wZUxqSm7gtJuM1tgnYv1FwooO9CyIi496bNS
 7o+PZWgcvtPGLbbjZ3yGfqImIaZrRMfCdWBjjdepaeQtHEtP++yraOPn58+8ImuZEnUxDJGPj5V
 8p0N7xMUWpdmPB8tHP35+O5yoWcEIlYMQ/SyIpUopcdh4OHskQkABgbuWM1QmzrMQ9jcIfOAiVB
 SXupmEzSmDz4ofxiGbAQvEId0XOJglvJd3XcodAPz6TXhw6kmEz3AxlFdGGK0gXgLtAXzGGLZOZ
 5bGLTmDooxACaD+vuFQKbMhkiKNs60LOXWjE+pHrC5/NhSwtu6w5650tGkwN81Vyl53ahibrQQ6
 OX7eVLWvUwnAGRozvBO4Kij2IoaDr7oijmhdXSSPpKN/+/TKhl2BcQfjqZnHb7jX/vdU7Z++Wau
 2X9spDzytAeUW7ikWCG6Gj9JjTF2T93T0VxYYAcKbJIhrd/EOOg49B
X-Received: by 2002:a05:7301:1285:b0:2be:837d:cc4d with SMTP id
 5a478bee46e88-2c0e5008008mr228514eec.5.1773771655950; 
 Tue, 17 Mar 2026 11:20:55 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.51])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e55a53fcsm457367eec.24.2026.03.17.11.20.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Mar 2026 11:20:55 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, dmitry.osipenko@collabora.com,
 marcandre.lureau@redhat.com, visitorckw@gmail.com,
 Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v5 0/4] virtio-gpu: enable Venus/Vulkan without OpenGL display
Date: Tue, 17 Mar 2026 15:20:45 -0300
Message-ID: <20260317182049.33848-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1331;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dy1-x1331.google.com
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

Decouple Venus from CONFIG_OPENGL so it works on hosts with no GL
display (e.g. macOS with MoltenVK). 2D display commands fall back to
pixman; 3D/Vulkan goes through the render server as usual.

v4 -> v5:
  - Reorder patches: move header definitions (patch 2) before
    Venus decouple (patch 3) to fix bisect breakage (Kuan-Wei Chiu)

v3 -> v4:
  - Rebased onto current master (conflict resolved in virtio-gpu.c
    with new upstream drm feature check)
  - Split Linux header changes into dedicated patch (checkpatch)
  - Fix line-over-80 warnings
  - Resent as new top-level thread (Alex Bennée)

v2 -> v3:
  - Rebased onto current master
  - Fixed line-over-80 warnings

v1 -> v2:
  - Remove hvf_get_map_granule() safety check (moved to hvf-map-granule)
  - Extract GRAPHIC_FLAGS_VK into its own patch
  - Fold standard-headers addition into blob_alignment patch

Lucas Amaral (4):
  ui: introduce GRAPHIC_FLAGS_VK for Vulkan scanout
  virtio-gpu: add VIRTIO_GPU_F_BLOB_ALIGNMENT header definitions
  virtio-gpu: decouple Venus from CONFIG_OPENGL
  virtio-gpu: advertise VIRTIO_GPU_F_BLOB_ALIGNMENT

 hw/display/meson.build                      |  8 +-
 hw/display/virtio-gpu-base.c                | 15 +++-
 hw/display/virtio-gpu-gl.c                  |  6 +-
 hw/display/virtio-gpu-virgl.c               | 85 ++++++++++++++++++---
 hw/display/virtio-gpu.c                     |  8 ++
 include/standard-headers/linux/virtio_gpu.h |  6 ++
 include/ui/console.h                        |  2 +
 ui/console.c                                |  7 ++
 8 files changed, 121 insertions(+), 16 deletions(-)

-- 
2.52.0


