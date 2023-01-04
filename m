Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp8319195ejb;
        Wed, 4 Jan 2023 14:27:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsneOWpOHd38gtlFviz3ox75pgpHT5Is5hshsKelqITpRzGcKwxFZ2O2Moz/Q85crBaIzwX
X-Received: by 2002:ad4:4819:0:b0:532:ae2:9059 with SMTP id qd25-20020ad44819000000b005320ae29059mr4718218qvb.33.1672871244604;
        Wed, 04 Jan 2023 14:27:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672871244; cv=none;
        d=google.com; s=arc-20160816;
        b=fUWcs4ui9Az6RdTKKSQ/oYyKJrtXG/XJ6vSxHhmQ9ipUsv0s0u4VXePmaJY7o3hfN6
         mF4VVxMS542qqbAc91jmTFWobJL9LuR3QGbkUHT81VTdfwPDEBXnwzanyMyCm7i4TxZB
         ORe+0wgoWoDxQgw9mbrfoZzqs9gQILnjZPMbK2ztxM3ZsgCYMKf/nUYdbmoK8Vbh+dnz
         CaDdc8UFa7oSlEkAhePqkpZkHlXmJYigd0nnq4OT0wzYmCxwdhF413AFplhWrMrE1nEU
         ZzKCfyZCt/QUAVWnD36VuAuEb+CHcf62K0umj+LljG8/0e199S5vV4jp7EpNsrWKNoI+
         ZDNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=aSPCaBssOqcI16x2eeMpiNddAyoEtVRJPGPKXdjNpIQ=;
        b=nGFA5RbRvkIYR/pKdWk48Za1DZZP3Vfr0m7cYh5BulIcOMFVRo+pibCP8YJs+ZMD0t
         QfHBD11RVwtq94803PrN/CEVJcWeUlP/jb7s81OeXe9vKWJgAASBoJY2imQ99r7QjzhK
         RsMzWU1DH4d0SfzhZVLl38ac8KevIpXUsr27LPJZ+C6vxnkrmrw4e1B5mDfspV+M4GMz
         JNF0ZincEKwjeEQEMsnr+Ia1oq3UjUoUJuqT6M3zZ9xOPbj7iV5dtut4ZbplcHdTVwIh
         IbMaoLk1rafEzMG2assg8pNi151C/mGfoVbFZgC6rUG8D2fdIef7yH9k1la51nwwRasf
         vohA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aCZaH0vh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 145-20020a370897000000b006fec4421824si17902195qki.667.2023.01.04.14.27.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jan 2023 14:27:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aCZaH0vh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDBvB-0002A9-Ue; Wed, 04 Jan 2023 17:07:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBun-0001zd-U2
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:07:19 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDBue-0007iD-Jy
 for qemu-arm@nongnu.org; Wed, 04 Jan 2023 17:07:11 -0500
Received: by mail-ej1-x631.google.com with SMTP id t17so85842073eju.1
 for <qemu-arm@nongnu.org>; Wed, 04 Jan 2023 14:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aSPCaBssOqcI16x2eeMpiNddAyoEtVRJPGPKXdjNpIQ=;
 b=aCZaH0vh5oj1E5E4InNiTNoAmKmy+457xeL73gS5nxOTrGV20hoWJXGVDlyusBzKe2
 8pfl7iNSDuNn54XFnBajK1L5Qg8oUqJEN4fba74ENRvxdJ0DnKUsoWCE5dwKz2e1SJzg
 10qmJeWfd8vmN4s3mqMMfnHSHhWx4M4ukd0MCYh7eTCGf80Nv5HrHD/fqmRAJAALfS5m
 6IBpYTuRvgSWTp5S6+e/DT1jTZYAsCMns9oWvoQl16iKXNATL0ej2vQdPpIAplKG/3qd
 hl2z9qeh9oLUjGVjbkn8g2ZX05MMFG0+FavRmbzVZpikeaafVImNvPdEoGJ1GojPfYhH
 TOxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aSPCaBssOqcI16x2eeMpiNddAyoEtVRJPGPKXdjNpIQ=;
 b=z6TEp/WGKzijv2TlrmuZcQHLAZMNs9If1yD5ALfk2Hg3T9fUEQY1KGMWWtje1SMKBn
 WDjdRdxYFUR3Yfau5DcKlCaqnztnYppajvIHl+ByPQjzKL8PPpL18THHWAnEz4HyB6Nr
 8EcYINQc2rHYuU9zZ91dzfZ3u166lNeyrxcAYhi7PkzWkOxmFAo1zMIbJA3dOdTxwrmr
 2PJ69gNwv1KdrbR2vagYquARWu530IxySWwTALLi8Zk8hNUL7MkI9Mru30huNVcxgyKP
 /k6yR6Yf+uFlEkygHM/sgcLpskdrpu0iqgxcKrKW1RwKMAXRtQyvSnJ7Vdjk2I+JS3OJ
 70zA==
X-Gm-Message-State: AFqh2ko2hhkYdAYB6IiE37jIHuszGJTMYjlb7Kr8kBoZgr6TfBrLWL1e
 wy1C7BQXb6Mag8GgrvoJirUDSw==
X-Received: by 2002:a17:906:279a:b0:7c1:10b4:4742 with SMTP id
 j26-20020a170906279a00b007c110b44742mr40854672ejc.55.1672870021716; 
 Wed, 04 Jan 2023 14:07:01 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a17090623e200b007add62dafbasm15551057ejg.157.2023.01.04.14.06.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 14:07:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>, Antony Pavlov <antonynpavlov@gmail.com>,
 Jan Kiszka <jan.kiszka@web.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Hanna Reitz <hreitz@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Palmer Dabbelt <palmer@dabbelt.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>, Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 15/20] hw/block: Make PFlashCFI01 QOM declaration internal
Date: Wed,  4 Jan 2023 23:04:44 +0100
Message-Id: <20230104220449.41337-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104220449.41337-1-philmd@linaro.org>
References: <20230104220449.41337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: fbviIlQfFvkz

Convert the QOM PFlashCFI01 to a forward/opaque pointer declaration.
Only pflash_cfi01.c is able to poke at the internal fields.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/block/pflash_cfi01.c  | 2 ++
 include/hw/block/flash.h | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 9df79b102b..2af9273fc1 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -59,6 +59,8 @@
 #define PFLASH_BE          0
 #define PFLASH_SECURE      1
 
+OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI01, PFLASH_CFI01)
+
 struct PFlashCFI01 {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/include/hw/block/flash.h b/include/hw/block/flash.h
index 858c0a1b6e..321aede8ef 100644
--- a/include/hw/block/flash.h
+++ b/include/hw/block/flash.h
@@ -9,7 +9,6 @@
 /* pflash_cfi01.c */
 
 #define TYPE_PFLASH_CFI01 "cfi.pflash01"
-OBJECT_DECLARE_SIMPLE_TYPE(PFlashCFI01, PFLASH_CFI01)
 
 /**
  * Create and realize a parallel NOR flash (CFI type 1) on the heap.
-- 
2.38.1

