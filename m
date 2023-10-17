Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3941854ejc;
        Tue, 17 Oct 2023 07:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUw2BpKT8QXbapdMmGBBILgSjsv0H3GNalRnsE1JOESF0AfLWTc2BCpOeUJLRp0WIqTzP3
X-Received: by 2002:a1f:a101:0:b0:49a:6742:b176 with SMTP id k1-20020a1fa101000000b0049a6742b176mr2107172vke.16.1697551366629;
        Tue, 17 Oct 2023 07:02:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697551366; cv=none;
        d=google.com; s=arc-20160816;
        b=NBzduwB+sXmDCutiXWtf0lG8OD8gc7N0hARVpsVoQzD6Xv9NdzkAgPIHeua30l3LN2
         IZdIYW1xIjN7v5wBLcW+xnp91MMD14eLJeCg9pf00Z5+mdE+d1UuXauu7kIsWy0wmQ0J
         bE4qiqxXDarotpgKN3LqnClIuy31bl0LGAEl27S7T72YqJW9MXrbOriLYb6z9Fv3zm1a
         rXIOi1xMltT8nPZv7I27Bgc4+9DVqyU1axfDtNPknYRJ58Lyc+GBQGJZPybR1Qse5oib
         tMKVwpptE+26rOhUaRuCmTGnX4W39arxAI1gubWe/koadTmNnbtBTaFhvPgTjRd0Kvvu
         TJig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eu+I0Mxgw0c1e0TXhFwzYxAgC+Cbp6NkKlE9STdvd/w=;
        fh=PkQUf9c5shm23GEgSgwIjaGjrTFXVTBGToef+bFaIfM=;
        b=tmW36UbV/zQKV3rMqafI4qkW0cCU4Zm1hnEFMU/t3gwbAZof7NtDtiz09Kkq3fFbPl
         K0XhwpxZmrLPdJVIiNFEZVB/HT2d7zawehyTA7KwT4pYWJFEuXaAi+ONYIz1O9Vzs3KV
         o3vrft4Vaw7ALuqCSBtYMHppqyVTqybeaCRjWhoFHgZ3neV/ebaihEWTBpNiIKgqkFB1
         VfPo7SrHPp0Opun8Av6Y47z2ytIdzhLV1Fk1/jsFmtab4/IqvaRsKVNXbUxBDzwMC2vx
         dfV843EmDfZZabQz7nHc6QINIZpg888DaFDxORjxekNXYG+NoYDOiWkES8m7uaP2asXR
         eN0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lCj+YU0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i124-20020a1fea82000000b0049ab2287ffbsi144821vkh.220.2023.10.17.07.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 07:02:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lCj+YU0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qskeL-00046W-8y; Tue, 17 Oct 2023 10:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qskeJ-00045F-Kf
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 10:02:19 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qskeI-0008Nl-0Q
 for qemu-arm@nongnu.org; Tue, 17 Oct 2023 10:02:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-405417465aaso54726825e9.1
 for <qemu-arm@nongnu.org>; Tue, 17 Oct 2023 07:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697551336; x=1698156136; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eu+I0Mxgw0c1e0TXhFwzYxAgC+Cbp6NkKlE9STdvd/w=;
 b=lCj+YU0egaVlMJub5HB/y8z5CY5Tg2MEJNXVW+M7z2G1uH5XKkEInvV7u1iQrcjd92
 ydVktC3o3FoACsTBxYMy9cxx/LOCVALGBeyTKFF4vSE4MIGP0QD/bxxpiQGlRv4ow1As
 3Jp3gebZP3tb9rWr9NQnR689ufh6Fc4LdqON1nswhPcJNAMG61liN3+XNvSbHEJiUjnH
 Z8pr7Ch+PISFDCmzpKnh6F+Q9KBM0ZRWbteymLafcFrCUoGV9mTyAYo94QgSVXVz6/Cd
 E4FGfznYXtyPQacjHcI4jA8YKTXV7GApxDGfc7ZfAEEGzCDCo09Dmuq4p6Cakwr3TTkB
 hT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697551336; x=1698156136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eu+I0Mxgw0c1e0TXhFwzYxAgC+Cbp6NkKlE9STdvd/w=;
 b=Zyvk8q+5fWn9TUiZatY4jSzD5d1+d5Ft5s5h+Qjh4r9ApPHmWFO9lk53RFueZBxPCx
 qxwab3pJPoNA9W8TxS/k6WthihmGKFJy+wbu4+zdo4K4KXTWhtwoIrCDG0jgcktlxOFO
 cgjEvNhFOX2VkRy7VGE3RV1L62kq53pG3KJ/b9iUJnB/Sdhm6TAGvoTzhatePh3dkcUE
 k83PjOoEt+K9dOKq6h/Ni/eCHGglNyd9deIvJJL/2Uf4QLlyW5/ASQWeanWLdMmHBZlR
 XcaTVKtGtd+187ENY/XA5giKbnSCouVatrO4EuGi/viSvg8ecq82XKY20pUCSdSeBn6r
 nvcQ==
X-Gm-Message-State: AOJu0YzvZLHTad/uB3i5HYYzv7zG985hg6b4qo/t8zxAb6KcNEWKBMlw
 ijDGZNx27QZ7qUTdVqEp1Ee8UQ==
X-Received: by 2002:a05:600c:4708:b0:406:3fda:962c with SMTP id
 v8-20020a05600c470800b004063fda962cmr1977009wmo.31.1697551336464; 
 Tue, 17 Oct 2023 07:02:16 -0700 (PDT)
Received: from m1x-phil.lan ([176.172.118.33])
 by smtp.gmail.com with ESMTPSA id
 n35-20020a05600c502300b004064ac107cfsm2006747wmr.39.2023.10.17.07.02.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Oct 2023 07:02:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/7] hw/display/virtio-gpu: Use VIRTIO_DEVICE() macro
Date: Tue, 17 Oct 2023 16:01:46 +0200
Message-ID: <20231017140150.44995-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017140150.44995-1-philmd@linaro.org>
References: <20231017140150.44995-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Sga8iZvJ3m6+

Access QOM parent with the proper QOM VIRTIO_DEVICE() macro.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/virtio-gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 93857ad523..51cb517999 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1132,7 +1132,7 @@ static void virtio_gpu_ctrl_bh(void *opaque)
     VirtIOGPU *g = opaque;
     VirtIOGPUClass *vgc = VIRTIO_GPU_GET_CLASS(g);
 
-    vgc->handle_ctrl(&g->parent_obj.parent_obj, g->ctrl_vq);
+    vgc->handle_ctrl(VIRTIO_DEVICE(g), g->ctrl_vq);
 }
 
 static void virtio_gpu_handle_cursor(VirtIODevice *vdev, VirtQueue *vq)
-- 
2.41.0

