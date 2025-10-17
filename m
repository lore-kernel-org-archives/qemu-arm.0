Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA71CCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:13:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kFA-0006x4-HS; Fri, 17 Oct 2025 09:11:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kDr-00052V-1v
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:10:24 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kDk-0004kI-0R
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:10:17 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46e6ba26c50so14181295e9.2
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760706603; x=1761311403; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F98Bt2rqPIwW1cb5a6h+iFYD8TVHtD6ORETYRyTMwr4=;
 b=hm1x+1I4RpDvod0tT87sPziTFSjsWIVsxq1ldExDZcunkt7mzBy3CaPLgkpkXvNq5G
 o0XERnFFg0mpnaO++4HPwRfiVlTf+A/ffh4tpx3wv6RP4mpzdMC1sFGIyhEUbm735rYt
 1AntdijEvQGoCerzA67zpDXyRePJSjM5TJevWfxYZMR+Vc1S8qZI/7Gp8Gv8lJfy6Mc7
 VxAAX5vNgmYUsHCchLFLnkvbggci/jf2SsYQ7X6ggBEueMtPxzKXONK8JKlSmYEhxC0S
 b78QOFJZ5Oi08y4/LhCF652gqea6o0McaNPxjicr+GaEb2U1jQa/OWjk4CSuKyOJOwTf
 rr9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760706603; x=1761311403;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F98Bt2rqPIwW1cb5a6h+iFYD8TVHtD6ORETYRyTMwr4=;
 b=A/pJbs2rCSSe3Du4yZuahb1HMJOdkzfaNJMct8MXroFE3V0oPsMJJs/qBnrfi5GKW6
 KDPvj4EI8Ici3j7W9CYQJPGmnDQHTQR+Pi0RcIW0GSdKb6ugHh1+CnMFtST6cW2mSYqf
 KaDtsiU0Q9GcVKVAg9q2iZGvjFrXad46mtld2oaKnoSZaClDTDSEcer1yUm2t4yCSRly
 g551HBG2RUxRqlwvQ8JKIOoq9vzitgjakBuhJAj9gSF6sK8HpYsbkIE4HFr5/gb7mwyt
 eV9YFBM3XooomYXq9odY2dcmzOT+zKvRVMtdmrJWwNJ6YtQxlv1j6/xIt2JixE8SxPFd
 CmEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjMR67QFtMg7jjKsmY77u4fdeR+VY6tLoJWb2JtSb96TNoZeT81b5yovjiK1gskx9rqQCTE3rFdw==@nongnu.org
X-Gm-Message-State: AOJu0YxIuWytGPD24RxYqpZnvWQTi/NK4Yv+S2CX0s2N9DuKhe5o63wJ
 P486JnBtiBf59aSLWu0yuB0/jtyzAd0ZfzvpzGKyVTTctPvYEVT/HTxh4GQsy9WlQRA=
X-Gm-Gg: ASbGncsV234Yym3rHTNpnZelr8Eh94a+hl+pUVqsPTPRbgDaAXdEzApDJpS6FFgTWMu
 amOoouMvHC5kZAdCga/Nz5qSH4RlB/XU0XtxYmvZtbWZg+fVQk5EnnOMQIyNPAhIZ4QrPl0LDYy
 n2hHobb1Zg91X9NyWHFbhGDvQe7hl5HCXURRLDX9BQ7s4wvEqgIKkiZ8cs8pdaqcHn+kjwSmK0d
 FbQSiTQMxaw4yfNY7X9/ZzVc7hdCI0phyh+BtUS+yE6H0fcRzgGPIr99xTEt7JPZm8GD079Hhwx
 bYR/7jNxThe/Babo3WOvgwqgOCvfZGCroeYY1IyGD8knMHhwrImI9sRuJx0H5fxjpn7gul5+o+x
 SnzRKZn5h5jf4OanUoZzzMgXFvhpg+QnqY0XGbsRsU+YmyuaniXHj7c3ZkWoyDREMmRipF+JXwB
 j9qJt3DJq4L83CYxzLRiLspl1mwruw1Qq1KHBPqimXlIqqZ0cBjG7BaMzHE/0H
X-Google-Smtp-Source: AGHT+IHj5kg7CiAB80xNILUWMc7LhMJpdmAGuhndYdMKCshtKKCQaTbnfURb421hvCqfP0DtPNL+uw==
X-Received: by 2002:a05:600c:8509:b0:471:16e5:6d7a with SMTP id
 5b1f17b1804b1-4711787dca0mr23062475e9.13.1760706603322; 
 Fri, 17 Oct 2025 06:10:03 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5833dcsm40216776f8f.19.2025.10.17.06.10.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 17 Oct 2025 06:10:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Andrew Jones <ajones@ventanamicro.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 20/20] hw/arm/virt: Remove deprecated virt-7.2 machine
Date: Fri, 17 Oct 2025 15:08:19 +0200
Message-ID: <20251017130821.58388-21-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017130821.58388-1-philmd@linaro.org>
References: <20251017130821.58388-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This machine has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/virt.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 651ad4b5f63..2da5b014e2a 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3578,10 +3578,3 @@ static void virt_machine_8_0_options(MachineClass *mc)
     compat_props_add(mc->compat_props, hw_compat_8_0, hw_compat_8_0_len);
 }
 DEFINE_VIRT_MACHINE(8, 0)
-
-static void virt_machine_7_2_options(MachineClass *mc)
-{
-    virt_machine_8_0_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_7_2, hw_compat_7_2_len);
-}
-DEFINE_VIRT_MACHINE(7, 2)
-- 
2.51.0


