Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82402C982FA
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:52:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lrX-0006Ca-D0; Mon, 21 Sep 2026 17:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrL-00065p-J5
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:40 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lrK-00005L-2A
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:47:35 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b965f447cso29546585e9.3
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027252; x=1790632052; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=soONDTbI+WRsqyuEHUC9+h7GsBIKaNJo3PQ06bbqgp8=;
 b=nHEvOdB07TeeFwE14Vw1tLGSAEim4jAPSFskYVXoQWfTm5rcc+ZsxrY8uA+TQ3BAgQ
 qDYRzAhkWl3fwqNGcBQXXqOR/mhEuUkFqeWWvJDeposOVj5zkbr4Pls9Uli0nRy2sbRQ
 OxogC1hf8+sdMqAaHmwkViSfeld39PGa2XqjihOEoPtD7vef9b38xlKGthuCByunHBXA
 i9jHUkHk4H7C0YE4JX6qKP+bbTh6+LHq3YU7A0Li+ze5pJvgg6FOVl1iDmKUZQxf2gLM
 G0MhDv9820VVnbJXvpy6YStM9biK3Ez6fhmPVIwpumt8ZpIWK0jDTYhmiI9pnL7TNRUD
 G4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027252; x=1790632052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=soONDTbI+WRsqyuEHUC9+h7GsBIKaNJo3PQ06bbqgp8=;
 b=muUo5oU44NMO5pIwlutPzRQFfcLZwi4Uu3w7fEOI6NNqmMJKbo/CjYP+uGBb9BSga5
 vqAJcQyjw0dvsjLEMK5zX7ocRTCTWwWDqEqz6BuT6UGDAhncAhnYa4Ka6btUUvqUz8xf
 /IOFfQ4e8rUlp/dEbSQVBWI2wFCmmFf9ULVDP+oxJgO0F7vdwMlcA+ETnp9zrwf1Hpdk
 Yc2NXLNp5QMdN36pLjtN12abj75ubko3kRkJebjLSL05clMYANqa1gyUaaj57Q2yHT2b
 OYjk4JU+GfCeBr81w1HTOuwBdYEHUFMG8HOz5090AsmUsl2yVtUJ7xRpiRq5DMOU+80Y
 8bTA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx9HpdnJmQRzxdffa3ICWOllNxmOmMjm95yoora4Kvov7eNDvcNCvrjk1NxVaj1/kJ2am3RgXyo/A==@nongnu.org
X-Gm-Message-State: AFuF++n5qixApJLWnmxOADn6OlxyMSdioPHLYIyXPAm1shmQfBs1YdTv
 kXdH2iLQe33jqK3FyYwNyzxRte/vqz6AyDTiYMKJgunOepKmQlmOo8+O
X-Gm-Gg: AYBFou0L5MBkXLM6HAZgngbKq/J8myItM6UznLDpyRZzDHv3A6WTyuEs50oNyIYxhzt
 ZBmCSv0KxkDiEUQplZ0v8PutwYZU0/l+6f7XO5YmEmS0nYd5wrw/6lrUk7qf9yFkBl50JSTJnKP
 V+3gfTiDjRkNZi7AVHKHfn/7r2oY5c+OH8TVFw31MA3tjN9HBv0c7DMa4klPVdP8N7WLxkw23DZ
 6/VCSARaogYzxLgxcKna3uwdy+C/TBSmmdeKEy7nxEBUa8o34tjNVlmuzKTEgChi89B4tSsGnr2
 k0rGgy+d1UqpIxOJO2Tv13bYJMolua17zYomdzlKpqjit9BiLLGcugSxxTjbQ42dcGV0WswW/ir
 xxB2yEo63FhGz4MNTv9NV+dA117Z50vfEuosiWyeaMuGT7R+jC9cbv6hkEL6ONSfkp+s3I67A/A
 CAcSFcFbE92ZpCjcD+tblOuYNoHer5+L1u8fsWWa/mk7bOa5huOsLQd/U3tW5Ri6dDY1jAp1Qkn
 +jtJwMCJsEQgDy1SPg8RkgRA/3fbVVLXq9femmTURH3UhQAtRzzVsp0OSGaCENF9I+AZ975H6U9
 BSx5
X-Received: by 2002:a05:600c:5492:b0:49d:39:90ba with SMTP id
 5b1f17b1804b1-49fc5669330mr170281785e9.3.1790027252430; 
 Mon, 21 Sep 2026 14:47:32 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:47:31 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 04/42] hw/arm/mcimx7d-sabre: Ignore memory transaction failures
Date: Mon, 21 Sep 2026 23:46:32 +0200
Message-ID: <20260921214710.29422-5-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::10;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x10.google.com
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

When using mcimx7d-sabre with newer Linux versions such as 7.0, the
machine fails to boot. This happens due to memory transaction failures
since the address space is not fully covered with unimp devices. Fix
booting by ignoring memory transaction failures in the machine.

cc: qemu-stable
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/mcimx7d-sabre.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/mcimx7d-sabre.c b/hw/arm/mcimx7d-sabre.c
index 65fdb19c06..8d223fca6c 100644
--- a/hw/arm/mcimx7d-sabre.c
+++ b/hw/arm/mcimx7d-sabre.c
@@ -83,6 +83,7 @@ static void mcimx7d_sabre_machine_init(MachineClass *mc)
     mc->max_cpus = FSL_IMX7_NUM_CPUS;
     mc->default_ram_id = "mcimx7d-sabre.ram";
     mc->auto_create_sdcard = true;
+    mc->ignore_memory_transaction_failures = true;
 }
 
 DEFINE_MACHINE_EXTENDED("mcimx7d-sabre", MACHINE, Mcimx7dSabreMachineState,
-- 
2.55.0


