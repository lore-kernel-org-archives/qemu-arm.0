Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF171CA5FCE
	for <qemu-arm@archiver.kernel.org>; Mon,  5 Oct 2026 10:21:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDfok-0003X3-4X; Mon, 05 Oct 2026 06:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmL-0002HH-Ic
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:45 -0400
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xDfmI-0000wh-Hh
 for qemu-arm@nongnu.org; Mon, 05 Oct 2026 06:18:41 -0400
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-4a1722c37c9so5879395e9.3
 for <qemu-arm@nongnu.org>; Mon, 05 Oct 2026 03:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791195515; x=1791800315; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e8TB0ZtYp24WPs3mqNNFoiQRZJQqozvFbAYX81zZos4=;
 b=d9sCIUV8FzfeZnapR+lQZbYGG3iwZte3VtbcxUoWBuWf2VUU/xeb5vMfZiF39W5mhD
 S6juZYl+cXYnxQwTn7t85gDyISqQ4g45Lbior1UnyxrAa0y1rHl4sjF7C1PHSm5CxFgq
 vK0B8xnI+T5sCtdK9rf1H/yAWjz5GbX7OMRnQx/rpXjKWa8gsIXyb5XGx17Ni76CAPKg
 6/1w+yFrh1uHCT3fCNr5NERu7NyRDPvpzhsaKdD4Lgirrlukxzid4726G9Gr11qLquch
 g5kElZapyODzkGGJOkWzUjf4bJqK1gR+lL1DxzDWn29mAn74yVd63DFblKD00yc3coKj
 u5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791195515; x=1791800315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=e8TB0ZtYp24WPs3mqNNFoiQRZJQqozvFbAYX81zZos4=;
 b=OIbPK07d0nvZKpYyxRawMpKwa+yolOMeeH3+mbKzOzdIN7FYAR1SzajBFIgZr1U/zD
 CHOcQ4kjjGTbVWqpXBNvZHlO1/i7EugYowBdsKvstoL+NZDEgna6GAM0tDsRlIyyq0Zw
 H1yzLeiLf7+DWyQwEcGHdMHFibmrJCzv8Jl3C/YT8suB8X1Tgf1M5CoYUjVJ9NxxSVtx
 DuEzZbsSW+wq4CUqoRwDxH0ibZbS/JnxSQc3a9rIeQgCN67mJnKYdY0Dl/E2GXkBQ9h9
 zu3ong4/wY185bH+T5RcnDMfKJp2euYs4H/gJ21KYZoZVew9fZsnDpitUtRxffoo/2Wn
 AmEw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy59Pinp0GVYisDf5xjeEUr+BaiSaNXy24EvTAVqAdUzGI9T2BBdfDdL+4QaWoDdo7Og5G8OAq7lQ==@nongnu.org
X-Gm-Message-State: AFuF++lsXJyPqvStFvohKETalG3Avbe/DdyEjSs8+UXqJ+u9lQSKL3Ey
 RfGuyt1Qk0OYYfNrmuhAsEDhXWSWMSNBhPCkHVyeGWUx6C1WcDuhD/fs
X-Gm-Gg: AYBFou0hBGqDra0cVkOMUIS1a6qAY2+Deh3/XFeBmr0T+NLbt73LKdPplGlEj+aewIs
 5mOHW34fBXpi/ABn4USLjhEDXZje8X1YCaH99htJ8WfjEZ09NjNlz73dzLKrUxRK/7111ghlpda
 4ya/QY17Y2eCrJ1WzG3DPnxO5PANRW3ZHSVc8DG4TTWfQ4marRIiQ9Qsf/wfCLRSBw2CZqTdT8F
 Ytelz7OnIGWytnXJZXzmoUO8L00wGIEtJZ8FjBb0RvAEN6i7/hHrdYx1J6FAl9tu90ozWxus3t7
 41ezGw47lwN+y7pq+rqyzBePLCQ9IePUHJi0wqNi5xR1IGU+SNog2dwgZX/BQryEo+Q/rjgvBfx
 SZYy3nq1V1jOy9zjNZd4Cwe/FzWMVPQNFBl82a9sJUx6sXq1ZjMNaH7JvhE48ZmMVggZGVx4Lim
 CuKW2FH1HRI/mZOr8V6X2ywesTGphmR2HTAKSC7b9/DMGZEzS4O3ICU10fIk5nZI2zR2Dw9XosJ
 36d58dTgU80+VWxlAwo9jsc9kpzIC2VGsfQcw==
X-Received: by 2002:a05:600c:1551:b0:49d:1fa8:b266 with SMTP id
 5b1f17b1804b1-4a0275a229bmr192399055e9.26.1791195515277; 
 Mon, 05 Oct 2026 03:18:35 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c622ab7b5sm2742111f8f.37.2026.10.05.03.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 03:18:34 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 qemu-arm@nongnu.org, Bin Meng <bin.meng@processmission.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
Subject: [PATCH v3 09/31] hw/arm/mcimx6ul-evk: Have 512 MiB of RAM by default
Date: Mon,  5 Oct 2026 12:17:36 +0200
Message-ID: <20261005101800.10821-10-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261005101800.10821-1-shentey@gmail.com>
References: <20261005101800.10821-1-shentey@gmail.com>
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

Having 512 MiB of RAM matches real hardware. Fix the machine
default to make its use more ergonomic and less error-prone.

To reproduce the old default behavior for e.g. migration purposes,
`-m 128M` needs to be added to the command line.

Reviewed-by: Bin Meng <bin.meng@processmission.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/mcimx6ul-evk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/mcimx6ul-evk.c b/hw/arm/mcimx6ul-evk.c
index 40071d2c7b..4964cb9345 100644
--- a/hw/arm/mcimx6ul-evk.c
+++ b/hw/arm/mcimx6ul-evk.c
@@ -73,6 +73,7 @@ static void mcimx6ul_evk_machine_init(MachineClass *mc)
     mc->desc = "Freescale i.MX6UL Evaluation Kit (Cortex-A7)";
     mc->init = mcimx6ul_evk_init;
     mc->max_cpus = FSL_IMX6UL_NUM_CPUS;
+    mc->default_ram_size = 512 * MiB;
     mc->default_ram_id = "mcimx6ul-evk.ram";
     mc->auto_create_sdcard = true;
 }
-- 
2.56.0


