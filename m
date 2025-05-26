Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4063257njc;
        Mon, 26 May 2025 01:56:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvX/P2uKigqSO9lXk1T5B0khbHarz5wdtXIEq91qv7vLrRUrHoo4/vIq4RORkygX1K8tjjdHwPok0FhA==@linaro.org
X-Google-Smtp-Source: AGHT+IGLoLrnRcCpoep0PF44NnaPQCkavMHc96G5e/enOhhNo7thuH1i5uVO3aZ+yYQY1nzuGAVT
X-Received: by 2002:a05:6602:360b:b0:85b:4310:a91c with SMTP id ca18e2360f4ac-86cbb5eedc9mr945138239f.1.1748249795863;
        Mon, 26 May 2025 01:56:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748249795; cv=none;
        d=google.com; s=arc-20240605;
        b=DZu3I3ZFQAIS0xutujBoejfOYaKbze9oOiNsXikC9bOLEaLlQJZKip3vDVdzZykcY+
         F/hsl3UYC5Q3ypmJCoZ2lXcCgi/qJYAK7J0G5BBrhOYAYdDCp8wfWR/QgcTH3Ugio8qV
         qtjFio+n1OeLrQ1y+eG9qOP4iJ69O6yzGEjClqAq+HYAdPJe/4XJwMoSINFXVWAmX+iJ
         ePQitejLxZ4d4F3OhopEGGB+oi/r1WF+fv9huGx8N55ZTaoYgmQm+tp/5eK6Rcu1Kru3
         lU+YuJ3VAbshNPCADHhfqOEjMCWU5ddTqVqIE7+QmTinfJRhiq6/0WS26OCwAqrAeyxE
         9Qkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZepsipKrTHKMZ/Hf+3FKIyyQF/voSTVlZvQ7yPeFvjE=;
        fh=ZZwLt5H82yHLOWpnvJwJfXwO1u4fGNY7kNtWC/UDUJc=;
        b=GA2U1H8UxKOPZVX4Ll0G3ujmRjsMA2EKWhe7VTqXJxF5ChfXxdFBxdixHLx8gSeGae
         12Ro1WIh/XP95jtR947siPR0ZFMOxftrZ8yU2r76jafprepacuvHMWg73rtGAXkP9t9c
         b/n0R6Uld9xUwRGUPh4JS72G0cfO7P6VxEpnpmmpaoeTlugZVi67vgv04KXZJ/uDXHIX
         ywZCO8G86m8eBGZYeA9RwsgNeYgskQp5UWzSUD+1QBqkfA7slDjJwVzDy6FiYLobE1tV
         dHhkvjC8LA4JG12z/RQxUHJVIuBz6MuWOwflUVNLOCqDGFKSN0j3bB4ZFnNLuzrDiNXP
         JyXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=X0n+E8No;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca18e2360f4ac-86a2376e344si2217069439f.123.2025.05.26.01.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 01:56:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@adacore.com header.s=google header.b=X0n+E8No;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=adacore.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJTcf-0004UK-9y; Mon, 26 May 2025 04:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uJTcM-0004Sa-Ms
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:55:34 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chigot@adacore.com>)
 id 1uJTcK-00083C-DW
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:55:34 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43ede096d73so14975745e9.2
 for <qemu-arm@nongnu.org>; Mon, 26 May 2025 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=adacore.com; s=google; t=1748249730; x=1748854530; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZepsipKrTHKMZ/Hf+3FKIyyQF/voSTVlZvQ7yPeFvjE=;
 b=X0n+E8NoDhkKGrWo2lvVFghtDYHPSEY1dm0njTiEVpTwcKjQP+W10yDrQPXKAAOkOE
 1O6LzdKNemwpYKvxuU+FrEJ86hyQD0LWSetks16Iii13WOZFlJ1f4kJgVaCK2nK/2KdC
 4d0KRiz/KColCC7yfbEHttXR0g6VS6EcGgY/Vs6WnZtrcmNS7oTzvc3UPXL+H/55fNWA
 S4nXkad9ov9kTTLn/VepIjtZOGou/8hJPPC7m3jgMQlsKN9ZjkYDkzU3L7oZKIQWepey
 y13pX/Z7GKVkLPKqCxk2m7Knq4mMi71j8Fq5Akyd6ouNNmTVlcXCfA4vrokSy9hj32iT
 TEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748249730; x=1748854530;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZepsipKrTHKMZ/Hf+3FKIyyQF/voSTVlZvQ7yPeFvjE=;
 b=TLwoxrPwXZcedn1uvgg6Rx7hrybWS/BNI12sumG+t526sI2vsCXSV+1fnqKx+hQfVH
 fdvBvCRzr19A9asWBLNhnmgdDAOD5H1j7jaKTMidLcOrLeryKATPy+83lPdKXYpJ+0Js
 hH8pcd5QQa2zaCiCR3PonGBQgoWY3gGng6w5exi62I9HxDB02byRuB4D8BCDXW3NyLNp
 Hhf4NocS0TYLDo0bnM9263y9H0ZWgB0fidCss/Y4ds7yD/8fbzqZUTTz6/lg9QuI0XMH
 LXO0lp6MaZmMmQ5CinJ3yrgxKmgDjHotSOklgBswThu6g8L3FTuxebHAcUXq38Qdr4cv
 uNCw==
X-Gm-Message-State: AOJu0YxnECUtxdRxEevlxuLWhoPBOUceYlKYbHJ9z4+jE0avW2jAdjmd
 hJUyXiXjXt6UrlFzTLJl7a/AGjEFQBTufjEzH72EVUsApBRpGoProV9cHyLyamooeg==
X-Gm-Gg: ASbGncsgpVbJ1OsBert2g/DBd3BeS/wenAbFvfvrzk4QLgyRQpxTgXpYiLhhMePxiqb
 FfQJtYRpcazE4m9VqDMym+ghWSpRU94alMiJ9amiU2zOCt3EuZO7dHdeM46wx1yaQbU0VWdpBsr
 A0awZxKLfjbULEtEoRjM+k9WZPAU4dYaUQ/enM25lti3Hf2SBkGDyZ72f1LrudZ1sJ/Q8PmBgJl
 vjf9aSTkKRrYuREACj+ohuz775GSOpA/jTWhVtuktz0mIGwWEHBDpBzP8fMpccSGUT9ItOQzt5O
 Z4EE7LCEI5Q9UhqchFwuaCpsux2B0TkLEZ4UchNUENVnA+fsOqGfNWmpTwFGHY4Ot9mBKEReiJL
 DmysXOyOJvMImfdqtEe7u/qzpQu6dKfEXdclUr0MOzDv5b6lN
X-Received: by 2002:a05:600c:3b90:b0:43d:77c5:9c1a with SMTP id
 5b1f17b1804b1-44c9141a950mr78217825e9.4.1748249730513; 
 Mon, 26 May 2025 01:55:30 -0700 (PDT)
Received: from chigot-Dell.telnowedge.local
 (lmontsouris-659-1-24-67.w81-250.abo.wanadoo.fr. [81.250.175.67])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f23bfd54sm238911675e9.17.2025.05.26.01.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 01:55:30 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>
Subject: [PATCH v2 4/4] hw/arm/xlnx-zynqmp: adapt cluster-id based on the boot
 cpu
Date: Mon, 26 May 2025 10:55:23 +0200
Message-Id: <20250526085523.809003-5-chigot@adacore.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250526085523.809003-1-chigot@adacore.com>
References: <20250526085523.809003-1-chigot@adacore.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=chigot@adacore.com; helo=mail-wm1-x332.google.com
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
X-TUID: imzaA6IJF5Y2

When gdb is being connected to QEMU, it will be attached to the first
CPU cluster. However, the ZynqMP board has two clusters, those being of
two different architectures.
Therefore, when gdb is connecting to the ZynqMP, it receives the target
descriptor of the first CPU cluster. Up to now, it was always the APU
cluster, which is AARCH64.

When booting on a RPU, gdb will still connect to the APU. If gdb is
supporting only ARM32, it will receive the APU target descriptor,
resulting in:
  | (gdb) target remote :1234
  | warning: while parsing target description (at line 1): Target
  | description specified unknown architecture "aarch64"

Adjust the cluster-id based on the boot cpu will resolve the above
issue; allowing a pure ARM32 toolchain to debug programs running on
RPUs.

Signed-off-by: Clément Chigot <chigot@adacore.com>
---
 hw/arm/xlnx-zynqmp.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index be33669f87..f23ace6446 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -221,7 +221,13 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
 
     object_initialize_child(OBJECT(s), "rpu-cluster", &s->rpu_cluster,
                             TYPE_CPU_CLUSTER);
-    qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
+
+    /* In order to connect gdb to the boot cpu, adjust the cluster-id.  */
+    if (!strncmp(boot_cpu, "rpu-cpu", 7)) {
+        qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 0);
+    } else {
+        qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
+    }
 
     for (i = 0; i < num_rpus; i++) {
         const char *name;
@@ -380,7 +386,6 @@ static void xlnx_zynqmp_init(Object *obj)
 
     object_initialize_child(obj, "apu-cluster", &s->apu_cluster,
                             TYPE_CPU_CLUSTER);
-    qdev_prop_set_uint32(DEVICE(&s->apu_cluster), "cluster-id", 0);
 
     for (i = 0; i < num_apus; i++) {
         object_initialize_child(OBJECT(&s->apu_cluster), "apu-cpu[*]",
@@ -475,6 +480,13 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     ram_size = memory_region_size(s->ddr_ram);
 
+    /* In order to connect gdb to the boot cpu, adjust the cluster-id.  */
+    if (!strncmp(boot_cpu, "apu-cpu", 7)) {
+        qdev_prop_set_uint32(DEVICE(&s->apu_cluster), "cluster-id", 0);
+    } else {
+        qdev_prop_set_uint32(DEVICE(&s->apu_cluster), "cluster-id", 1);
+    }
+
     /*
      * Create the DDR Memory Regions. User friendly checks should happen at
      * the board level
-- 
2.34.1

