Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC07DCCD193
	for <qemu-arm@archiver.kernel.org>; Mon, 20 Oct 2025 09:42:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vAmNm-0002hK-OA; Mon, 20 Oct 2025 05:40:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAmNf-0002eZ-V3
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 05:40:45 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vAmNd-0000QE-KK
 for qemu-arm@nongnu.org; Mon, 20 Oct 2025 05:40:43 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3f0ae439bc3so2087048f8f.1
 for <qemu-arm@nongnu.org>; Mon, 20 Oct 2025 02:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760953239; x=1761558039; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HhXctmaGs+38JQZVNJ1bF9+hCN6zeVUF0eyaD2DT6Kg=;
 b=Xqk6z/kas9vKKHsaU8Dun8vkspyt3RtNtDrK9za5p6yVF4oc84Su8lGIZfrSwArW0M
 hpCquuygBqPP59rDizaLo3Lv/Zrq6j9PjNebsUOPborAfb+9rm6zmrxpzEPOmB6dLJRV
 VKnoke/MzpdLtTHCXEGlcZB8alxUvg7tVa6ol6vVJwB40FqYxseW2aE4KSRhpTN8L+wQ
 SYA8jHmsRXadFtfgEVs0oRSOzshMtzb05w1L4c1oaQPwH07lmuz53mBvD1Ua6wnKpfce
 f9+PX52roQJ0Y1Ktslre1SKifD1xRYbKr5d3iyMcXo45d4qnbxHE8PpJDOQI2dWnFsqK
 eTdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760953239; x=1761558039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HhXctmaGs+38JQZVNJ1bF9+hCN6zeVUF0eyaD2DT6Kg=;
 b=U+cPxKbys/MiFYuQFWGzaNuMbUhLRD1nOjQ1hoPffNNq4WCuhZl6peVnRnldFH94nu
 dbhNCibuG8mZXUpPK1Yx7j18lZxYedYr9k8bc5YzPmNCKhjBHYKEjN0KFz7cNmMk7l5l
 7n8eWpaGwBDarlypCTZeeogl+WxkDR1Res05PKTvFaX1wuy15SyFZTEGeegy/fcxLUpn
 metbZALmhsyYjxStgOVScx6pA9LaxPEIN+mN/b1bEQLIl5Y0qiiWp/kZebalnLIBQlyc
 NMpKsECjMNt3PoqOYVvkX+x+8Qo85xQID6LlfiYliy8+47yaaAuLdplgrQCjIw7DMMfI
 WW7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTo4prIChUshwV3lyD5tMpiIwMpUQdQwc2cmni6vU6fr9jrLYl3NzXxSSuT9kGsD0kGnChxzbTgQ==@nongnu.org
X-Gm-Message-State: AOJu0YyznIHlx1bwRkX9BKl+IG1nFmec0Cyjeuk+meapilfVBQlsZQH0
 TtHjgvm64wvGicg3pm9yi/Krhx5ISxcz4GInV19Q9wog3Ajq1RNCa8mcHcepyk9zCMA=
X-Gm-Gg: ASbGncs4Mr6PHsby2Bz9miFdYQ7JP+1wmpN+Qk84ifjo2VVzLlatIFdyzn0UrT4iEwF
 bMRlENN+JJsEEpQre3uHl7zvUis+oiwdSyrOAwZnaZFUY6kzQ8ziCluEGkmJESMsNORfVuXLKzK
 UiikR9diwH6kZWNz09gRuV5u/UEOcTOiUzXlttREbPir4FHHqD0T7jrDB1F6+htBnZBLNyZ0cBh
 ilFtkfsoRZmukwyK6ISIRpbY5nKnNfHeGgLDBI5jxz/HoMQve9Se+BOnJXgQWFSuC2ykq2CIVa5
 xSjmF5hSLqXr5ErqgPGbc3bjyoRXJ1abtMXPl3HV89gx57jEnHD1gzUHPFYrh0/0KFSHBa1fqJC
 IqHjR35zsnvWydmaZSqaskiiNav2baVXPlLOdLljLSRgBe+YIQ+OS0nkWzbF4f33BLkbsDDvq48
 JZ0yZOOi7z9cWx+k5i+XidzUcTctOEOEQ1QbPjxT7ZSFdn+U4fNKBR3YFqCFQG
X-Google-Smtp-Source: AGHT+IE4NSMVLmGu4k7pVvWuQNyk4Nxhg18lTq9s4W8+u5RtD14bIYkuJnnUJYOrWhnEmWRcBFfROg==
X-Received: by 2002:a05:6000:2884:b0:428:3f70:4b2 with SMTP id
 ffacd0b85a97d-4283f70078cmr4394571f8f.63.1760953238673; 
 Mon, 20 Oct 2025 02:40:38 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f00b9f71sm14388375f8f.37.2025.10.20.02.40.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Oct 2025 02:40:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Ani Sinha <anisinha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 3/4] hw/arm/virt: Remove deprecated virt-4.2 machine
Date: Mon, 20 Oct 2025 11:40:20 +0200
Message-ID: <20251020094022.68768-4-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251020094022.68768-1-philmd@linaro.org>
References: <20251020094022.68768-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
 hw/arm/virt.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2eda2d43974..b781a218019 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3690,13 +3690,3 @@ static void virt_machine_5_0_options(MachineClass *mc)
     mc->auto_enable_numa_with_memdev = false;
 }
 DEFINE_VIRT_MACHINE(5, 0)
-
-static void virt_machine_4_2_options(MachineClass *mc)
-{
-    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
-
-    virt_machine_5_0_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_4_2, hw_compat_4_2_len);
-    vmc->kvm_no_adjvtime = true;
-}
-DEFINE_VIRT_MACHINE(4, 2)
-- 
2.51.0


