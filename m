Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E784C98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 08:17:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xANa9-0008Du-QO; Sat, 26 Sep 2026 04:16:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANa6-0008C6-Qr
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 04:16:26 -0400
Received: from mail-dy2-x0e.google.com ([2607:f8b0:4864:36::e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xANa5-0006oS-9S
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 04:16:26 -0400
Received: by mail-dy2-x0e.google.com with SMTP id
 5a478bee46e88-3427493501eso520694eec.1
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 01:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790410584; x=1791015384; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=dGcjkcxYt8eZEjWK6mpDvnDtPiferHjEtlr90RuU0eI=;
 b=GhY45SZTYPb0XGwu4MkKSEpJ6U16TBOjaJQeZx9N64CL20BoEpJ2x7330p4pP1SuyR
 kRFve7hnbZoW14xM8Ex3iVc/Cg22invFc1xgvrS5LAixlWsJmHlu0SqUSyZVRIRWoHHC
 gvAigC1Q4OnRbMHLH10I3pJJgSl/Old7O2yDZw5rnbNfadTndOy5TUw0rGjx6pkye3HQ
 m8mtpl3P4GXLSPcJ+A8UyLjUBwYC3M0Rd3XeoPxAzIyXkSaGvhg8DLtfEUI2mudpv3ny
 Pi/2TjdLYZHv3Ur7h4RKjUVNy1EIpqOKrf7d8FHknKbbUop/bvDEopM0YgjkJrE9AoqD
 5OrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790410584; x=1791015384;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=dGcjkcxYt8eZEjWK6mpDvnDtPiferHjEtlr90RuU0eI=;
 b=WNphuHti0mTP/oKxxt07I4LnA0xECTNdl7x/qV2xjh/hzIjivIa/xUTm+gPO+D8dWI
 Jwkq50AYpx3vkpmcc623lnipCeNCRjbPOiun4o9dyBpne8Yh1v3RnpUcUJ/3OQNgBBBj
 nJZVv4xO05f0w+ZHoMHnMzt1lHF7ANYoojnoLBiXNLVJ0gGNV/L5U1s+39IAGwBrzqVH
 sy/Df/uenk8QkGsWYTpDPEo9L6bjAD49faz9oa7Ih9/cFq9N/INYBjn3eaIGlxu5Z5wp
 I91KdQ+7JfBwvZTH1cbNUfTU1cKmKZpHGV7ci79CjlkiZhlb7scsC/eCkJBRWRGdrBw4
 6KAg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzHrHgzn9SdybhWrdFTrhKnCTRaJ6+43cWcO6n7aNwMcAbqnMWb628OGUN0qRIixypWv/dAfnxgpw==@nongnu.org
X-Gm-Message-State: AFuF++nCpGrhbTd1ne9DRKiKLo49h1xTgvMNPvd68ow/48URpgdzZZDd
 CphF1oLpMLnLF/YgKBF5QvnFruBmgOx8FC+lO7t9IweIvR1nNcdh3o9x
X-Gm-Gg: AYBFou3UJQLudDPi8jFHTObosfHM3kul0U5i0MmzvDwx1EqXMt+s8TVl+MJnuEiyDpn
 AToekZHlZuCq5IBHkScCGw9mVSpBhGl03OXqV0vYKGzwxFX8xxtPIucZ4BDDkp2F6eArMNokNeX
 Fu/GQJbSNYG4U1ophb30oJ7XqzrkE4rwcTlpnaC6STlJ6pLu+eHPGZEg5SOpntvJOEc4h2R99a1
 BuxTLjXUAhOWIax/M3uECRRUZMH89l49znacYGNB45hIIgoM6EZJ/stgZYul1dzXsF4fDDI4g/6
 zb2cNSN6pIgVwZHPr0IObgd/2XhSJP70/PA6v6WcKABc3htlrktfKKq6QG2fGkyErPzR8mgipz8
 TDXn5/o3NTAiEzmoAFJcX5gpiE60ljsHoiUPs0pRPQtiDIai7q/8Lot7fgSOH3LaM9imQCeUlN1
 6WiXO54VcvrRl2YOrlXMfCdXhIgB6UGAawKif/ffnX8IHaSqUx/q6cZfldVjSutvg05y3QgG4uD
 ZRYg8RfwH0q7E8I4fWGLwS51fyEGtM0
X-Received: by 2002:a05:7301:f10:b0:33b:c69b:7074 with SMTP id
 5a478bee46e88-342700be120mr2169607eec.4.1790410583789; 
 Sat, 26 Sep 2026 01:16:23 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34144f4eb9esm11970568eec.19.2026.09.26.01.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 01:16:22 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Chao Liu <chao.liu@processmission.com>, Eric Blake <eblake@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Brian Cain <brian.cain@oss.qualcomm.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Fabiano Rosas <farosas@suse.de>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-riscv@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Song Gao <17746591750@163.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Laurent Vivier <laurent@vivier.eu>,
 Weiwei Li <liwei1518@gmail.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v3 04/10] hw/or1k/virt: use unique QOM name
Date: Sat, 26 Sep 2026 16:15:44 +0800
Message-ID: <20260926081551.29-5-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926081551.29-1-luoyonggang@gmail.com>
References: <20260926081551.29-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::e;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x0e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Set TYPE_VIRT_MACHINE to MACHINE_TYPE_NAME("or1k-virt") so OpenRISC
virt no longer collides with other virt-machine types in one process.
Keep the -M / help / migration name as virt via
machine_class_set_name().

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/or1k/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/or1k/virt.c b/hw/or1k/virt.c
index 2ff5c084a2b..35884252379 100644
--- a/hw/or1k/virt.c
+++ b/hw/or1k/virt.c
@@ -34,7 +34,7 @@
 #define VIRT_CPUS_MAX 4
 #define VIRT_CLK_MHZ 20000000
 
-#define TYPE_VIRT_MACHINE MACHINE_TYPE_NAME("virt")
+#define TYPE_VIRT_MACHINE MACHINE_TYPE_NAME("or1k-virt")
 #define VIRT_MACHINE(obj) \
     OBJECT_CHECK(OR1KVirtState, (obj), TYPE_VIRT_MACHINE)
 
@@ -548,6 +548,7 @@ static void openrisc_virt_machine_init(ObjectClass *oc, const void *data)
     MachineClass *mc = MACHINE_CLASS(oc);
 
     mc->desc = "or1k virtual machine";
+    machine_class_set_name(mc, "virt");
     mc->init = openrisc_virt_init;
     mc->max_cpus = VIRT_CPUS_MAX;
     mc->is_default = false;
-- 
2.52.0.windows.1


