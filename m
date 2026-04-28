Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B8FFF885D
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Apr 2026 09:35:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHepA-0003OI-NW; Tue, 28 Apr 2026 05:33:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHep9-0003NQ-Np
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 05:33:47 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wHep7-0007Ql-V9
 for qemu-arm@nongnu.org; Tue, 28 Apr 2026 05:33:47 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488d2079582so132091185e9.2
 for <qemu-arm@nongnu.org>; Tue, 28 Apr 2026 02:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777368824; x=1777973624; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WVC3itSIffFeC7Z8GlSjGgA9Tg3i0GpOS5eY/5lxrn4=;
 b=rj7zdTA8M/AZW7o8vRqn91sKKqoXjmGfBR0Pv3NXWQh4kjT5S1hNDBT9K8yhs9Quh8
 02+Xn0ZBMYwv12pcIjRVo4fN+T8fK4UisSRsBRowVX1tPMu50lzcccMQ6yE9T8UnWf6G
 FWNYThWxIWBW0E1FX4cPndl1eVfAnNo/TQQxqzLxcbdn6vNB4oU/CrgGwWhQOMxaJduT
 KwHcb604gg+ACBDtq4iAwA5BSVNKRUd86k1SngxYnXj0EIQ4Tc+2NqZj0eNPibG+Iq9O
 jw5uquvw+AVsZoEbOZg/By9WQRUmQE67f/krqDOC2jAIYpBFoAEAGOpJhS2HZ3PUqY9P
 b1ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777368824; x=1777973624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WVC3itSIffFeC7Z8GlSjGgA9Tg3i0GpOS5eY/5lxrn4=;
 b=rvny8S53FUJzPZ8brj2DClpNsEE+4O/detNUJPf2YtJkbgGJISgMH2FcHXH6Xf8H0G
 HZdjkxOukUh4Wh8icIa84sDb2r5vCasBn7SuU/PxrpUtrJDZGSArTmmkvM0YPEJbgX2D
 A/PZcBluRiflyXa595jRpr09SnmMSFXJxbeWbHisdSxNs4MC9K31B5Dxe56qMdTdAIqN
 5bo3xu3o3nfCvRP6nuPT8eJ6/WUybPn/xtdnNxLN5v2cKTkWlodUtYTo2ABYOVCLJuCi
 msEkZQWLb4j0rojlBdojsQaaeXsPArRtMkgl7UnyYRvS9W1RCjG3S7juTm5BPCpezzXK
 YYIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ+7omqfJO6+iREa4hNyzZ7TUBUCHoF9Sha9IV+K6aMVQOfKyk48jtZ5xd7NcPSa2W2eJLWaKsXy+g==@nongnu.org
X-Gm-Message-State: AOJu0Yz3yLiq7YaNK/Bmd/5zCj43QJRZ9frVFBhbnJCgKE1yhOLyBohD
 zFizBePQ458Bb/WfFlo5Z+5TvZYVtBy8GJnj56OwFIxZMuRQ2mvWanP1MXWGNoxa0Co=
X-Gm-Gg: AeBDievmoTC1woDLEgatQls6q6ixnl/fKH2qL3ZLQNGQjYtYvJXXHozDq7h2JvjnCct
 lADPK3oe56IT+6Tar5S7jGYzU0Hw+U9vOiiHomiW3P5jQp6RBcSsnwrIc/7tsowgjfPgeNTgBhc
 Hie40bp+9587joQOdVXalh5RJDM6OjS0xeslvcN80puJdxnCr+v5XDKHBTU0Ov2KP+LDVvApR8J
 LanYdKPTi00kcNLpON7NEyE85aExcNTi5Zz1SJGzntZXUgEm2L/+Bduts6wJ64qxghL5bMPEASA
 qk/RavGIOv5sjmjnbxQ0XGHoD/8irN2d+TFzl48bPk+gqLcDmg9XGYOWAKX71lEwSi5KBf5WzFZ
 hPcczH5bP02p5gNFjImN6+dsCULqvUypcnAqKx5JkILW7cRB88Z7cwxu7QR2BqrlSDm85hhza9/
 249TCWiTbr7f5qARC5O6W1QPbXJ5jDJUb5cq4zpz3X7SKzGXMP3Uz8dgSK+Rkv/yDAvgYA4B8df
 fGCQQlbmDCBXGebqZLOKxRBEAehQdGKhwppVyGoMw==
X-Received: by 2002:a05:600c:6995:b0:488:a2ac:a334 with SMTP id
 5b1f17b1804b1-48a77aee4a3mr37301045e9.3.1777368824444; 
 Tue, 28 Apr 2026 02:33:44 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48a774d7a1fsm19665595e9.4.2026.04.28.02.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2026 02:33:43 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>, Tyrone Ting <kfting@nuvoton.com>,
 Hao Wu <wuhaotsh@google.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org
Subject: [PATCH 2/4] hw/npcm7xx_fiu: Specify .impl for npcm7xx_fiu_flash_ops
Date: Tue, 28 Apr 2026 10:33:37 +0100
Message-ID: <20260428093339.2087081-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260428093339.2087081-1-peter.maydell@linaro.org>
References: <20260428093339.2087081-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Currently npcm7xx_fiu_flash_ops provides no .impl substruct; this
means that it gets the default of "implements 1, 2 and 4 byte aligned
accesses".  This is more constrained than the device permits in its
.valid substruct, and also narrower than the functions are written to
handle.

Add a .impl substruct matching the .valid substruct; this means that
all guest accesses are handled directly by the read and write
functions, and are never synthesized by the memory subsystem
performing multiple accesses to the device (which would not behave
correctly, as these read and write fucntions have side effects).

Based-on-a-patch-by: CJ Chen <cjchen@igel.co.jp>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/ssi/npcm7xx_fiu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
index 02707de350..2d5bed005a 100644
--- a/hw/ssi/npcm7xx_fiu.c
+++ b/hw/ssi/npcm7xx_fiu.c
@@ -250,6 +250,11 @@ static const MemoryRegionOps npcm7xx_fiu_flash_ops = {
     .read = npcm7xx_fiu_flash_read,
     .write = npcm7xx_fiu_flash_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
+    .impl = {
+        .min_access_size = 1,
+        .max_access_size = 8,
+        .unaligned = true,
+    },
     .valid = {
         .min_access_size = 1,
         .max_access_size = 8,
-- 
2.43.0


