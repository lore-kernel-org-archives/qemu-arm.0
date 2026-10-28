Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B41606A335
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Oct 2026 20:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pqA0BJ36
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMA53-0005H7-Rn; Wed, 28 Oct 2026 16:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA50-0005GD-Io
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:17:02 -0400
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xMA4x-0002Jv-T9
 for qemu-arm@nongnu.org; Wed, 28 Oct 2026 16:17:02 -0400
Received: by mail-dy1-x1331.google.com with SMTP id
 5a478bee46e88-369f33df08eso2611477eec.0
 for <qemu-arm@nongnu.org>; Wed, 28 Oct 2026 13:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793218618; x=1793823418; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=+9DnP+gTwSEOX7zrI2haaQoi28yWED+v2p12ws9Ei1k=;
 b=pqA0BJ369esX7TW4TefNW9h7r0U9jonXkHfaoDAbrgk6+VMitcMtnqoNjuvn3Gb3fS
 Hl5Ro948xAH2ka/Wa13sYeL37k4R+rtENYSUYWuqbGFg5SVufYlOqWSfLNu8v1WGT29I
 Cu/qEfZGAunMpHORyB1FFJq0fZobx5OgnaZOo/t2jnaeO+phWjABhXSwmZZKyCzlLrIW
 Eu0qnQCVPcF/0d+mBARIOgeqpkSJ819YwOEXuX8UOckVRpa5dnq9CGvDaIUc807A75Uz
 rHyB9MyFP2Rj7NW/zMtQ+lDnypwQKhnfJT+wZ3y55AjroDHNJBWN4mhN5XzgO7YcUpQN
 9lTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793218618; x=1793823418;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=+9DnP+gTwSEOX7zrI2haaQoi28yWED+v2p12ws9Ei1k=;
 b=jl0e2zfsmF/GnTz4yAlplGh4Xx0ONTxmvV/zctaDbDXbFkQiCU0zMS9fcdhmoNnAf5
 cg7SzzzDhIp8/gJMAaB1Gs6P18HcZ7GC7d/zIyf5C1IV9xe2d+jD/G2KvUbVhIWO80q8
 k0vVgfeWNyjeIwJGYvIR1DxvmLlhJd+xpE95HZgxx+8lwIBK+ZmRjWn448RD9Kfw/xjh
 foM/qTWL3TKk1QXwmQtBYxL354cVsfvSRB9Di38l6Li/TTzOJ7q+4Obb8n0Y/FcTZrN/
 /NRSgddC6vQrT4OvOk4bk3/zXH6u3Fu5NR5Z09/rJgq7Lg1pYQKc2DogHYcQPUPASZm7
 pH/g==
X-Forwarded-Encrypted: i=1;
 AKwUvBwc1tv0/3BdkisjuML/LEU5xC4D6dYpyrYhidq3wdGahs1UolUSsECHGgr6nnZFWSwW2acY+UeXhQ==@nongnu.org
X-Gm-Message-State: AFq9FYJbsoLJhM0XpctFHAF+0B99DRy/+KNQXBAkcXFkZ7dzyelzONJp
 dhbWcRhSIUuajZF76nazeMcyEl2a2Ugk3qs1sED7uQYx+iRxzPFGihTr
X-Gm-Gg: AYBFou0erMi3Vi7jFN0HsKG8t6/UihPQaoLjv/zis/o4s4YyFf4ewdl3jCCH1XrM8Xa
 BxkDSp6GInoQHK0HHnVDQX4EVrfChaJvUJEI35axALH9mWAyYTsDCsX/usBQCDqB9N3tz4O57Yg
 Sw/clq5QaVx1cvj08mqEN7TuqlIvkRmw1o3vLDs7b11BrS1IgGV+5KSwjdFXXYVdTrf0/QmModV
 mhlcbeZDAYgumkxdWnmmh70VyiuH7o4rPTmgNyc73eVCqMSVR1QFZGGa2MdxnGqu8kOWuTUhImH
 EHuxCWHbLiNrUt+UbK+uMGxIR1c1WIcuyilwM2td0/28abbgzvRbnn5Mpp6cuFoQkutfUi0sj5g
 PQcUwYhj93bt/E6FnPjbpGz4lJrFdLXXVMRdq5rnVckhOFhWs19nv2bYRAakMEqa6v+Nuc8tF9o
 s2cnUnv2+FiTSGeFnALSrt8JDeISyFtnRW+wI/CDhDJu1OhVZ2VS4gqw0NbSXFUCV+zYfXoSXeQ
 JXcEPUATovZ0GRKBYk6ezDEkAvjPnOkeSb2bz1M4jjFY5/OhoxjtvmX/9FKTmwKJvsnDFvSYv+7
 Tn2fHDiDEZUWT2e/uHmL0K5hXQsxkBVBQtam792Vdg+0P34czQW3sCWQz5SlOubRHQBPTg==
X-Received: by 2002:a05:7300:fe43:b0:36a:1bd4:627f with SMTP id
 5a478bee46e88-36a200b7256mr4740544eec.14.1793218618082; 
 Wed, 28 Oct 2026 13:16:58 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-36a23951e00sm12016896eec.20.2026.10.28.13.16.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 13:16:56 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@kernel.org>, qemu-s390x@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Eric Farman <farman@linux.ibm.com>, Song Gao <17746591750@163.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>, qemu-arm@nongnu.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 08/12] hw/virtio/virtio-pci: pass is_available through
 VirtioPCIDeviceTypeInfo
Date: Thu, 29 Oct 2026 04:15:52 +0800
Message-ID: <20261028201557.2688-9-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261028201557.2688-1-luoyonggang@gmail.com>
References: <20261028201557.2688-1-luoyonggang@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1331;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy1-x1331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

virtio_pci_types_register() builds the base, generic, transitional
and non-transitional TypeInfos for one virtio-pci device. Copy an
is_available callback onto each of them so a device can register
target-specific variants of the same names.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 hw/virtio/virtio-pci.c         | 4 ++++
 include/hw/virtio/virtio-pci.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index c73f1f546cb..1ce39e92e9d 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -2522,11 +2522,13 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t)
         .class_size    = t->class_size,
         .abstract      = true,
         .interfaces    = t->interfaces,
+        .is_available  = t->is_available,
     };
     TypeInfo generic_type_info = {
         .name = t->generic_name,
         .parent = base_type_info.name,
         .class_init = virtio_pci_generic_class_init,
+        .is_available = t->is_available,
         .interfaces = (const InterfaceInfo[]) {
             { INTERFACE_PCIE_DEVICE },
             { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -2562,6 +2564,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t)
             .name          = t->non_transitional_name,
             .parent        = base_type_info.name,
             .instance_init = virtio_pci_non_transitional_instance_init,
+            .is_available  = t->is_available,
             .interfaces = (const InterfaceInfo[]) {
                 { INTERFACE_PCIE_DEVICE },
                 { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -2576,6 +2579,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t)
             .name          = t->transitional_name,
             .parent        = base_type_info.name,
             .instance_init = virtio_pci_transitional_instance_init,
+            .is_available  = t->is_available,
             .interfaces = (const InterfaceInfo[]) {
                 /*
                  * Transitional virtio devices work only as Conventional PCI
diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pci.h
index ee50fb0d551..6c3561d319a 100644
--- a/include/hw/virtio/virtio-pci.h
+++ b/include/hw/virtio/virtio-pci.h
@@ -236,6 +236,7 @@ typedef struct VirtioPCIDeviceTypeInfo {
     void (*instance_init)(Object *obj);
     void (*instance_finalize)(Object *obj);
     void (*class_init)(ObjectClass *klass, const void *data);
+    bool (*is_available)(void);
     const InterfaceInfo *interfaces;
 } VirtioPCIDeviceTypeInfo;
 
-- 
2.55.0.windows.3


