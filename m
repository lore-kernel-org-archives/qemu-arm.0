Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CD7D6AB16
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 22:02:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8Q2Z-00006n-Mc; Thu, 02 Apr 2026 17:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2S-0008V1-SB
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:20 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2R-0007BP-5k
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:20 -0400
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-b982d56dac4so234025466b.3
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 14:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775167037; x=1775771837; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52Rc446xe2dQaFht4UOxDu+6HVWFzHT4d7x+yDo+hRs=;
 b=ROkzD9I2olfsjVwIZpqRDwZgui1OjDq/j+qsOYl5PENVBOgndcBPXEgJNPDtaZ9r1G
 b3++fQ2AYhfbFFsoKVQi0kcugeqRqaFv90GoUs/ycYJ9hQ6/D4K3zwFy+Gk/iv6xEmkh
 kIjv6oGGwn/dS8zL5pMkyrJy6SP3XcBJIZgAZdY6ZTHC70namrvInW9hDUF0HeL6IU1V
 xtIYRRweQ0twM83In+lBgkt1I0LdLWxhCAMRKWHNIgTnqK2rtNY59tsZM4DdBOIF6jg1
 k545HkYnuxy3UZwV3JXm4pRFNL4+CDs8EoPn93fBcUbdgTefEl3eDOZ7qlWerBAhKFHV
 XhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775167037; x=1775771837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=52Rc446xe2dQaFht4UOxDu+6HVWFzHT4d7x+yDo+hRs=;
 b=OwClC5qo89qeSVDH8cN5uC41CyB/QLFhs5HuVv0JFq+ZxaHvk1R2fcNM3xVfTx/lZ/
 HjOnFJaoXDgHm5BjTBJDTvIxaQ/jTNlP/jPYxmzHeLxFyMXsx5j8i3Qxa+HNKQddgEhK
 sP/8tWImUUcmWkNWkBl+DDbkpDE/qco9CZkZM9q53+0B+pZgKR1kwpCAk4dw1HSKOfwK
 B0jnqBEscPQTatVwjNpZDxfdnJhmaGxs2k6/FGhxrZhmfJCcCyuFyIfp65pBZv07zU+z
 /C5NWr/pvuganE8sTv4j4Dgin1QW/STa7XwkSjWsVohhuvhmH3T6kDmjSB0vVN3EGB4o
 OrCw==
X-Gm-Message-State: AOJu0YyfRusAmWE7jrdOlC0GYomSc4bm+LKrxfbfiyWSQMB1YpG1Vi8D
 QdRln/8oRy3mCC2CXZfUzLilUDUoRvRJ70PFSg/TAn7lCTpBtvtDnm/l
X-Gm-Gg: ATEYQzyeXCh6HsyNwSFwpxQeFQUbkO4T9ZcgqTAGR38ueSsZ/AochxAsDkYCCDZjaEk
 bXFjCH243sdkJNrfV1XlK7Okg5k2NxJBcqlx8uqYrGmKaCqGh/Osr47V8Hnjy932C1z/lMXeG3x
 Ff61nG7IbVzBurLw7QiEAZBTJLoiB4wbmPbTgTZYU1KPITwvFznLloZR4m7GFeAq+2ACLw4UwuK
 HrT8KpfbEb4e989ZM7uL4Ho7wBxw4oVag4zlB5WnqE4pVgSY2M3foF++DmnoKvmZpjbUjpo+pjt
 I1y6tGkImEwawVLJZ/W4iGYkczFj7/Z3aTh14rKskmhl6uve75rAladPo83u8Al9vfM7hN+UcR6
 /gIu4/K2A54brYXwLZhM327/efE51fliYhg5eWskD5W6JnyOsNpcbfuPfzsUkKUezYpjHyFTPU0
 wKtz9IhBOrjx8WUm+KzVwk8WL4Hk2mxeTV+kooXOQ29iPXvjJBF2x4mM2Rta+UmD78ERq8Sg==
X-Received: by 2002:a17:907:1807:b0:b98:28d3:7cec with SMTP id
 a640c23a62f3a-b9c67b47d8amr30530066b.43.1775167036860; 
 Thu, 02 Apr 2026 14:57:16 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-182-244.adsl.net.t-com.hr.
 [93.143.182.244]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b9c3cac0e1asm134009166b.27.2026.04.02.14.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 14:57:16 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 19/33] hw/core: add fdt_generic to the build
Date: Thu,  2 Apr 2026 23:56:04 +0200
Message-ID: <20260402215629.745866-20-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402215629.745866-1-ruslichenko.r@gmail.com>
References: <20260402215629.745866-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ej1-x631.google.com
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

Add `fdt_generic.c` and `fdt_generic_util.c` to build
by default.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/core/meson.build b/hw/core/meson.build
index 8a96567de8..b5ba8160e6 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -29,6 +29,8 @@ system_ss.add(when: 'CONFIG_EIF', if_true: [files('eif.c'), zlib, libcbor, gnutl
 
 system_ss.add(files(
   'cpu-system.c',
+  'fdt_generic.c',
+  'fdt_generic_util.c',
   'fw-path-provider.c',
   'hotplug.c',
   'loader.c',
-- 
2.43.0


