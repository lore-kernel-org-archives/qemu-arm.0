Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30ED8FED9F6
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Mar 2026 17:51:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2YXl-0004kB-Nz; Tue, 17 Mar 2026 13:49:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YXj-0004d3-Ly
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:49:23 -0400
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lucaaamaral@gmail.com>)
 id 1w2YXi-000786-3B
 for qemu-arm@nongnu.org; Tue, 17 Mar 2026 13:49:23 -0400
Received: by mail-dl1-x122d.google.com with SMTP id
 a92af1059eb24-128d7db88b9so7296639c88.0
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2026 10:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773769761; x=1774374561; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CVb13IlLEU7TKn2JosjxQ7mvXY+2jkay+xSWdWBH5Zk=;
 b=CD5syXUmjgfY3nZw627NU+SfoYPFDi0sZQ34rioV5HYU6dBBVdwLIiKtpn59uup5YB
 wewmGa3cXeJ/tvBT9cxzSx7RBT0Vt/JDZ7Wkk2ICfQQUVvtrKhaRuK0fKTh+aA1ESmSa
 5m8NLKe5l3fGa9hJrdImXRYPSKndnfwljS+aSch+WJHytRpSn2Cfi8TiJgw3G7YL705C
 G/h8ZS28ga4dZInbRMoht4bVneGJNej3f7FWA4rkGqbGQhjytxalhUZrAc04AATkbC5n
 y3z0PuROMBY4qZHEJr41vrmg7VAaXXUjG2DU19weVtLHUKWj3451MXJFzfuHdVm/OC+q
 f+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773769761; x=1774374561;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CVb13IlLEU7TKn2JosjxQ7mvXY+2jkay+xSWdWBH5Zk=;
 b=DrbuTu1j2MjVbMvH9zOnBQsCSfYLxRN3LC55uaSJ4uaTdNpVgAbxAxyHY5h2TWK33J
 B+I2M7/om2sVoBg7/TfMH2K1CnOMwVqLQOnU3S8RpAYkqthg/iO7L+GvJsx4vmZ5jQOi
 bCAK9VyphiAyiYNXQVMd5SceohYv1dtjia9MxcDd6J0vhTDwzyZY5FmGVjcpujIcLL77
 iutij8Ugz1eV5Wy4/02rUdW+QmQbkmkzHxcsInSnqnIu/3YA0TYUtYrvt5fAiLMnfH9e
 BjEgf16D92bLQZZku7Zr0++QdcclLrJqilefxHnrnFMQXjnLQklwqbYZJw74arGKbuZk
 1AFw==
X-Gm-Message-State: AOJu0Ywd2lrosDQyMYSNbSLcpnhi2fudfywfC3CoSMhFNmtTjE9Z365Z
 o6m37jnnNYYQoeXY7mIEsN7QA4EX7QIG7XmSEYAed9PkFy77gbplezdBoRupD6SQ
X-Gm-Gg: ATEYQzyHgVlVgXN/orxYV7bhc7LAkx1Y9g7giWXbkIaPWABwE38Uf5Fj0U4luxbndnW
 AE4WYDdCPqIn6l8t1FEzocV33CG9qOPrBPciR8uMZC0l9xLawdefdzHbFTIxLDFPjG2OYU1NS7C
 ICE25AoNs1zK5/9m1zH6S6+tBZV1yWp6Fl/tb+iLS7zm8NsHz6SaXGx3glummhe3wyUKsajgodM
 IsNLv9gI9we0d9XjNmasBP4gf4WED4iIUzg90Ug0Q5jxvJ2P8E8kUOZ18y+vBbsOyz+Dg376ug2
 aHs62iCD/1e3xD+NptHvocq2cZbDKvQymV3WOB4/pxYZApPmyRjZsafwr88yvHUAHpeC9trZPbJ
 +yg8qG6whzuJmCEMORzubdKTCa6jcFSi8veOG3ahhOZyxMrA51uQMwjcbP7PSwhpqw/Yqktc2Qc
 zWMhD4kD9gUvgy9HtoC5U+8CnSjyr+qY7cqq821OF2eS9w2Pb+6RSDz8z758R0fgs=
X-Received: by 2002:a05:7301:168f:b0:2be:aa:9a4a with SMTP id
 5a478bee46e88-2c0e4e5c708mr167357eec.0.1773769760576; 
 Tue, 17 Mar 2026 10:49:20 -0700 (PDT)
Received: from localhost.localdomain ([143.54.78.51])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c0e536896csm282115eec.3.2026.03.17.10.49.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Mar 2026 10:49:20 -0700 (PDT)
From: Lucas Amaral <lucaaamaral@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, dmitry.osipenko@collabora.com,
 marcandre.lureau@redhat.com, Lucas Amaral <lucaaamaral@gmail.com>
Subject: [PATCH v4 0/4] virtio-gpu: enable Venus/Vulkan without OpenGL display
Date: Tue, 17 Mar 2026 14:49:11 -0300
Message-ID: <20260317174915.31829-1-lucaaamaral@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122d;
 envelope-from=lucaaamaral@gmail.com; helo=mail-dl1-x122d.google.com
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
  virtio-gpu: decouple Venus from CONFIG_OPENGL
  virtio-gpu: add VIRTIO_GPU_F_BLOB_ALIGNMENT header definitions
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


