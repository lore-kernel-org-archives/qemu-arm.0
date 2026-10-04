Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6816ACA5FE6
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 12:28:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDLK1-0006dy-DJ; Sun, 04 Oct 2026 08:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLK0-0006dG-AM
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:28:04 -0400
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDLJy-0007Bq-Fm
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 08:28:03 -0400
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6350f89so400460f8f.3
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 05:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791116881; x=1791721681; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Y+NG5lh/ZEI7RJkZJ1VFVc+j0jqGg2BufqgyXfescg8=;
 b=P3+8bQ/6uTaum266LzcCu3PN5bhApVSfd3X5P5/+CPziMt+w1BYz4mfrOA0xVNyRgs
 q+gLJjqhqtUxkXxbranfMJ0Ak3WR6esnFsPnAQjA6+TjbJ0HDr/YdN1KUg0kL2YhMfP1
 t48X3wkJweIC5/+GRjIvOlxfq9pR6LGs1GAvWVq8RIvTUu9YmoocYHWir/u5HXzPG2sZ
 X2+f/m8Jjfba3bJXoPay7X0g4sjC+lv4Kanp3ziRMgOzD/7D0qOfUBEP32h8tUjhQmi5
 +Xn0hzWirAlgt/wA5CNB4apQtJRg7B7RE636YdkisvKsMD8rMaC2eLhdKdBPfvxS0Dft
 yi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791116881; x=1791721681;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Y+NG5lh/ZEI7RJkZJ1VFVc+j0jqGg2BufqgyXfescg8=;
 b=OCMnWaY5dpqMZ43j8EjoHRVocdOUOJGhmtm7f4b+n1H03WXP8WfFfvc6o/CL68eG6C
 VeCn+es/ohwBnMFSD93VwRtcBo7/OGTPTxZcOW8z45vIGsb+llbJ34OOwy5jdiUrQipN
 q0XENEMX/XHFst3f1VdVdCGjSM/q3UNNKM4GMrG83SmAuwEnFSGGX6e8cmdIgzusvhbj
 VzzamP68cyYB4QoG586DlIabvyXSAI/dbPswXzoF9nsYKuSHn7yyIa5km5ScnIMvoy3w
 iH4XOcgHpg2GrKkGXswfvF/t7NQZDWhMlqJZrQs2kzoP6CxW0DIzd2PmWVvD8gDpljwz
 JsFA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzcLl9bOiu8zLYMzAEDe4lMjoP/iqJwE/uqqohhtWzNl/2D6yC0QJTFot762s1D8wkXsk8kUo1FGQ==@nongnu.org
X-Gm-Message-State: AFuF++krMlYYaJSmg1/CsSUpsWA3mwwFtwXGDnPQcNwrVx2d/DPCB3xg
 fcl5Vm8z/6h4JdUNxybWycNHYLHzW8/Evic9bURjYxtusvYD/gO41dRv
X-Gm-Gg: AYBFou1BsbeHGT8eYNgm0nChLVx7HT8DnpVYnFAlyF/1H73Pzx117x4C0aVUaDa7d6O
 xsAI612MgTsfyX3mRLdHCctl6fVyPikQNrJkUO2eYsMXAg/6mqbhy7ygufSQi8ivhKz73sJDKGU
 i4/5gvKYwr2ybKDuw5QNVkgc1Bqfo3WMiKzB+oSh113CzCU8stopHfm8xaUju3MeUvdRB5D/ktR
 m1vfDT7uud9UMPw0WAaE/QRhy8+hCIF6DRT/Rah/73MY2KpxWydXz0Wy6FRag2pl0HNFQlTzBwV
 mieWif5RfXBF0XQEZBI5Z8e5kqMHUx9pNjeJgqffd7vJufGxKgUG7N11MG1ba1+yxsPEmVCcK3h
 RFyqY1USJGg/v/seOuK3TlSKkPI30D2/gNP6U9mr30qOu73Df3qdczqhhJiR2+o0llLcj6Wy4Mw
 ka1dD9lo1D7a2MZOaqcaNGjHj6H3VrH9r1l2t6K73NHGV+w0Jw+5Rp8tj56oJMvWurTl2lRpuwn
 fuI4JOhVwymHtyW8k0p40UVr83p8AJHbjzrfw==
X-Received: by 2002:a05:600c:3501:b0:49f:fd40:80fa with SMTP id
 5b1f17b1804b1-4a0276b78f7mr134566535e9.34.1791116880908; 
 Sun, 04 Oct 2026 05:28:00 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027698f13sm242319975e9.1.2026.10.04.05.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Oct 2026 05:28:00 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Alistair Francis <alistair@alistair23.me>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH v2 18/30] Kconfig: Extract config IMX_GPCV2 from config IMX
Date: Sun,  4 Oct 2026 14:26:34 +0200
Message-ID: <20261004122647.3913-19-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004122647.3913-1-shentey@gmail.com>
References: <20261004122647.3913-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:30::10;
 envelope-from=shentey@gmail.com; helo=mail-wr2-x10.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Over time, QEMU has grown a number of i.MX boards and the monolithic
config IMX drags in unneeded dependencies into each SoC model. Extract
config IMX_GPCV2 to eventually eliminate config IMX.

Reviewed-by: Philippe Mathieu-Daudé <philmd@oss.qualcomm.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/Kconfig      | 2 ++
 hw/intc/Kconfig     | 3 +++
 hw/intc/meson.build | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 030b218eb6..a33f5a46f9 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -581,6 +581,7 @@ config FSL_IMX7
     select PCI
     select IMX
     select IMX_FEC
+    select IMX_GPCV2
     select IMX_I2C
     select WDT_IMX2
     select PCI_EXPRESS_DESIGNWARE
@@ -661,6 +662,7 @@ config FSL_IMX6UL
     select IMX
     select IMX6UL_LCDIF
     select IMX_FEC
+    select IMX_GPCV2
     select IMX_I2C
     select IMX_USBPHY
     select WDT_IMX2
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index 97355f9df7..98dba7efb8 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -8,6 +8,9 @@ config I8259
 config IMX_AVIC
     bool
 
+config IMX_GPCV2
+    bool
+
 config PL190
     bool
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 74d84b8ddc..2ac575095f 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -24,7 +24,7 @@ system_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 system_ss.add(when: 'CONFIG_HEATHROW_PIC', if_true: files('heathrow_pic.c'))
 system_ss.add(when: 'CONFIG_I8259', if_true: files('i8259_common.c', 'i8259.c'))
 system_ss.add(when: 'CONFIG_IMX_AVIC', if_true: files('imx_avic.c'))
-system_ss.add(when: 'CONFIG_IMX', if_true: files('imx_gpcv2.c'))
+system_ss.add(when: 'CONFIG_IMX_GPCV2', if_true: files('imx_gpcv2.c'))
 system_ss.add(when: 'CONFIG_IOAPIC', if_true: files('ioapic_common.c'), if_false: files('ioapic-stub.c'))
 system_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 system_ss.add(when: 'CONFIG_OPENPIC', if_true: files('openpic.c'))
-- 
2.56.0


