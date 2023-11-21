Received: by 2002:a17:906:b00f:b0:9d0:bf65:29fa with SMTP id v15csp647607ejy;
        Tue, 21 Nov 2023 09:42:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0keWFz4c+jW5kQzWkKCulaPGE3ObyX7fG9AlqCcGSQ7lFxDT4Xq/m3sLY8Ob8mfMYN/k8
X-Received: by 2002:a05:6102:c4:b0:460:b726:bb3c with SMTP id u4-20020a05610200c400b00460b726bb3cmr10620783vsp.14.1700588522014;
        Tue, 21 Nov 2023 09:42:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700588522; cv=none;
        d=google.com; s=arc-20160816;
        b=VPexucoEmvKGlhCp2EHYwq/P0bTjKgguI6bTYJZcThROyQ7l+hYFAkrZzS7blDOBaI
         N6w9BcDtX7f+m7+ZvhbE//A5nfvsNgO8Q3SE6+chVjNexXVye3H7kyRNQS6Cl37uP3l+
         YeNdLLFn4o71cgGH2Nb6O66fLcdY9oOaWw+rKFzLNxrvG5Nm48kEjGQuHCOa5Bo32d1S
         HSt97tT07zpJ6E88pm1nQTGOyXZf6n3CNyIeKoBkDCv7D5CWubb+7HKuPymGKw6AvXiI
         U7ngmEaXJQL9KM4LVnXvp/T3BpwEdzao/BLSVA/Rc0CCRtib3alOD/YtafvR9noNjSRQ
         MpFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=oSzcSfZwgHqAqG/jf8MlqCJk5iiUJb969eq9bTdsPE4=;
        fh=m9pdibqEaBwE4nbZ1bdBlX5QKqVA9BdvTndDUPs5mJs=;
        b=VTe0RgEHoMb5ynLfe0b/dpYgM9o4A7NwlpdT2xg/xOkDQVPn6bzHW4+aGDQF6yzamy
         nh1ciSiou05DlXFpPIie8XBYO+UXDLscTtFZaeVLs4YmK/ntdasBg+bYIx+AJ8bW1Ojo
         Y6ATcrEMvh+mvNWKF7EZaOeFvwiUn4lL1crGDwdTRruYrYDTJO3HTNh/QVVdqj2keDNk
         gOC0ABUARmVup7bXmgcarh8ZYE9gCwYLx7Xmbo3zNN7ttz2aagAyESHql2h6Xp+XjqxT
         CZx7llZ0GPBe+CeATe/l+qtpLG6LQdCg2fJ1YBoWnvrjaHDA6uIM54kwtOeer/BakS11
         0ImA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GFuKUxhx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o25-20020a67f499000000b00457c0280fb7si2354771vsn.809.2023.11.21.09.42.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 09:42:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GFuKUxhx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r5UkG-0008B4-9e; Tue, 21 Nov 2023 12:41:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5UkE-0008A6-0m
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 12:41:06 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r5UkA-0001ER-Eg
 for qemu-devel@nongnu.org; Tue, 21 Nov 2023 12:41:05 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32f78dcf036so3359f8f.0
 for <qemu-devel@nongnu.org>; Tue, 21 Nov 2023 09:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700588460; x=1701193260; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oSzcSfZwgHqAqG/jf8MlqCJk5iiUJb969eq9bTdsPE4=;
 b=GFuKUxhxONE592zXAIqk4Os/oFfLk/w1jFlA69hJqdsFDSQoaPe9ew1fZFihv/wfnI
 My0L3boIgY7ipzt2hcnXn2JcU055Z2AG7etvYWnR8hvghLghGvWmZGU3T8RGy6CR5RJe
 YYXuiG7ItI8hpv0HIIVcKptuT1tn+YO2e72I5zBu1ZqCEJdyGNFdHWeWwS8KGGdtXA4A
 1LoMpAMwuEx4W2w/n5F4H1ccbYjYLj2HEbl3D8PeO3y4kYE1o1fVyu35HSqpYObLaQf9
 /F+Ghw/kPBmR/5zBpPy4vA6AcMcKAaEUX2/oaiQRg23xYp0eY5h/VPA5I3MT1Sbx5R3Y
 74iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700588460; x=1701193260;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oSzcSfZwgHqAqG/jf8MlqCJk5iiUJb969eq9bTdsPE4=;
 b=ssVWmvb1qo8MTHxAHx/D7MoICtuPCtdc6JbOF12Lrqld9h5+2+8i7HPjpNzsdggM6u
 sTqnPQDdu/YT89GZALepgNaHN4fDOlXiR3fL2RY8hXdwYDOrQrHHbDnB34Gt9d36HWmn
 7d3xDTMAOaWJG6K+QZXZqEI7nP5xZeec6X1i/IOJTdlzZmLElRRklpEGNl6jpJp7Bg34
 PdqhSOdTBtT7gDjGv9ARaex48Txo2tOOiF5TiosuqYbUBjZWc3R/ebyE72CUd9ZfvUa8
 F0DG0kSD46M0ZsIP+C5e+dSbde7f4jjFVjFtYlrJeBMG1R3tYMcwkoAKfpUunIP2zzib
 s3Bw==
X-Gm-Message-State: AOJu0YxUXmCo9datIrhSYa8AwD4EnBFKM8+Q5/bTjeueu3NCjMY2F+xg
 qqP+qHO03FHmOpLzc9M2r4LsQ4e7PQRdtuKDRoI=
X-Received: by 2002:a5d:6dad:0:b0:332:c593:16e with SMTP id
 u13-20020a5d6dad000000b00332c593016emr60270wrs.18.1700588460255; 
 Tue, 21 Nov 2023 09:41:00 -0800 (PST)
Received: from m1x-phil.lan (lgp44-h02-176-184-8-219.dsl.sta.abo.bbox.fr.
 [176.184.8.219]) by smtp.gmail.com with ESMTPSA id
 x5-20020adfffc5000000b0032fb17c65desm14961264wrs.19.2023.11.21.09.40.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 21 Nov 2023 09:40:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Eric Auger <eric.auger@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.2? 1/6] hw/virtio: Add
 VirtioPCIDeviceTypeInfo::instance_finalize field
Date: Tue, 21 Nov 2023 18:40:46 +0100
Message-ID: <20231121174051.63038-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231121174051.63038-1-philmd@linaro.org>
References: <20231121174051.63038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: kGjvLVNgfY/U

The VirtioPCIDeviceTypeInfo structure, added in commit a4ee4c8baa
("virtio: Helper for registering virtio device types") got extended
in commit 8ea90ee690 ("virtio: add class_size") with the @class_size
field. Do similarly with the @instance_finalize field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/virtio/virtio-pci.h | 1 +
 hw/virtio/virtio-pci.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index 5a3f182f99..59d88018c1 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -246,6 +246,7 @@ typedef struct VirtioPCIDeviceTypeInfo {
     size_t instance_size;
     size_t class_size;
     void (*instance_init)(Object *obj);
+    void (*instance_finalize)(Object *obj);
     void (*class_init)(ObjectClass *klass, void *data);
     InterfaceInfo *interfaces;
 } VirtioPCIDeviceTypeInfo;
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 205dbf24fb..e433879542 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -2391,6 +2391,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t)
         .parent        = t->parent ? t->parent : TYPE_VIRTIO_PCI,
         .instance_size = t->instance_size,
         .instance_init = t->instance_init,
+        .instance_finalize = t->instance_finalize,
         .class_size    = t->class_size,
         .abstract      = true,
         .interfaces    = t->interfaces,
-- 
2.41.0

