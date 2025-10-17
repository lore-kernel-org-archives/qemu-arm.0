Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E94ECCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:18:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kE9-0005VY-B9; Fri, 17 Oct 2025 09:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kDc-0004FX-1V
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:10:04 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kDT-0004ge-Fb
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:10:03 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-426f1574a14so1113162f8f.3
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706593; x=1761311393; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eFKu1ozhaHpdAj12FHVUlzMeiE8N2MTuFr4PiE9GBwE=;
 b=FSxlvD60ueGTdvMx7njQyZ1LZEz/NL/+JxgKg6K70EN5sW20r7vdNBPwynqFL6TBe9
 JhnQcmU/Nz4S73STqGMSfGcWienGIS14ZatRloq/YC0wPvKw6MDUt/2rFcIy6P908TyG
 5XQ3ebbYEwUAqq8codJ8bErt3BFXdYTU5HREqnVHFMDLMjUNe/kL2B9hyPcKq7dUvPl/
 /rT1oLNsTmiHSmfloxf1Db+wXInF17eEZFj27cbk7EFdLWlMMJvxxJEL3qJCitYqzKOx
 mwK2lqvgTYcWS6ZBz4803gqc6NfQQE4V8vi2DrB1NVV5HCeeCmVvxSBtxBD6vH0y6ohZ
 DSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706593; x=1761311393;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eFKu1ozhaHpdAj12FHVUlzMeiE8N2MTuFr4PiE9GBwE=;
 b=vAUkBasQaZnKkawbfWKdxOBSGXlTW6q4/ImO7BaHqhiiR5R55iJHGcqKzBymWcJyVQ
 MwHFlDcdhjvSSlJamyOe0vuZ9qeX3GT2Bdyw6YmfelomdRIExp/MaMe13nFwtXGPGnBN
 rTK5wNq/1yYNoVdIx1LaL6dMC8wV4KJ6EuG68rF+GPLSYFwtJ68SViXcWiV2VG5SINWf
 3vNOOWC7klI+PrQXIBZaes2QG4K0O39J90PGP7O3MDpCZpfnbgW367HeHq9rRc0VqEuQ
 q8cTp5NnkwKdnD6Z929HeYzFpYIw4tf+jWvpe9gXIiYZdH8NJW5hZrIVgwqbZM9FXKgP
 LLrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnoWm+Ue8yP15/R7JDnCMCSN1hAsogfuGN9wBmvF5MTqeIH4BDkzcj7S+E0oYffoZ7UOoswjTslA==@nongnu.org
X-Gm-Message-State: AOJu0Yzd6uy93fnF7oAGsplIf/qnYrO2anljtpURqINMeqmGzwcl7C9C
 pd0MzeVgmSmJT/6xOCSJAGdEy7xJK2WyNliFGrsxrgSJlcqQF1tDV8L9wcmxAjAdJ3A9mXoL+K/
 TAsOxOu0=
X-Gm-Gg: ASbGncvtci9YCuOI3k9eDQnKxAvNbQj1xap9kX1LQj1+C7l3rj3VvUmj3G0l8/56TRw
 ystP4krq8dRV+kyD0IYKHtmHSEukifrwmikNQ+4dImL8fwtOV8uacnSOeY3GlvkGPByRj7557VQ
 S34hFRaKkGJVq+yJhlEbepZOaKz/tF4+Ubxf04jElev8IJ2o0gZz8nqbusUwGaJOOSYkjEfkhLf
 TjA39bauoHO3oXyANXr4w/mZyaaZzoDGMWKVZeqTAkHbf5XG7FaUS97F+gA7o2bdkKC3eNQiEgT
 /65VIRLl5yUMUkM9FPlzgx9ylgVAyFlENWyLPrMo3EylQjM2JSmcoRJAHDnr08HW6yLS7j81y1r
 N+gxfgRgcMv5fcvlgbprVpwN44bLR9wDP9P87jjpR6BOV2sZfQqWtGy7nSqDq2eFzR88t5mTPRn
 D2mxANM9iWpsZ4wPw9IvdrxtP+7EmW8DLO9gmTdjid88X0tzcBLn6x3LylgZnR
X-Google-Smtp-Source: AGHT+IE9D14EnEh6r5ayWynENo7rhlBVs5+9hx6WqNcyncvun2mxUnzMRjwkSa9cvdDzMC7LvF/GyA==
X-Received: by 2002:a5d:5d01:0:b0:427:7ac:528f with SMTP id
 ffacd0b85a97d-42707ac53b8mr1656002f8f.33.1760706591735; 
 Fri, 17 Oct 2025 06:09:51 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42700072619sm8986487f8f.46.2025.10.17.06.09.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Oct 2025 06:09:51 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 18/20] hw/arm/virt: Remove deprecated virt-7.1 machine
Date: Fri, 17 Oct 2025 15:08:17 +0200
Message-ID: <20251017130821.58388-19-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017130821.58388-1-philmd@linaro.org>
References: <20251017130821.58388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

This machine has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 7218badc8c7..4a8a2a91b07 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3586,14 +3586,3 @@ static void virt_machine_7_2_options(MachineClass *mc)
     compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
 }
 DEFINE_VIRT_MACHINE(7, 2)
-
-static void virt_machine_7_1_options(MachineClass *mc)
-{
-    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
-
-    virt_machine_7_2_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_7_1, hw_compat_7_1_len);
-    /* Compact layout for high memory regions was introduced with 7.2 */
-    vmc->no_highmem_compact = true;
-}
-DEFINE_VIRT_MACHINE(7, 1)
-- 
2.51.0


