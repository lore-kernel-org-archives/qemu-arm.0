Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5809DD6AB17
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 21:58:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8Q2Y-00005u-13; Thu, 02 Apr 2026 17:57:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2R-0008UB-CZ
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:19 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w8Q2P-0007Av-2w
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 17:57:18 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6634bb959a2so1886488a12.1
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 14:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775167035; x=1775771835; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WLJlPZb4J5z4IvDnwriqBPXyQNO+ITQ2oYN4FJS7gQA=;
 b=hof/Qxwtl643jA228xoUw7Y/NCHknBchTrkKyQ4j5+oY7tZx+2XjBtXywQ0idBPPW7
 7PWURKxJuz6tA/ZOx4TD4bYBUGZZQ6YNjUElt8nzNXkntHjb7jOHRvnba2HBQAIFBBrD
 Pb9OWuGr5DdVsFfe5jk2KRl9Cmju8roF6tRzrGJ4ze1KlPzDgx9qe9XTJ2lL6m2I6aqz
 CxD35M3jxOLia3tVBEfr3OzjqNrFbMRUhU9pILJY6htlHyLwNTBmulvCsbmUXa7mX3gv
 AmBCaHEcuxMRhSY697psAmNvRxcwPwA58czx/FH41043egO4B+eqkcu5lzLDZB3ybLIV
 ySAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775167035; x=1775771835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=WLJlPZb4J5z4IvDnwriqBPXyQNO+ITQ2oYN4FJS7gQA=;
 b=HPaew8KejmYOMZkMtO4D+1o6C1SJfPRt0sZxN0S4VvWsImOjulW3W/eP/4JMlf50HY
 KohwCUZ5FILEBDXY3q1/yMjfLvVcDlgjbmwzyH0heVEy9v4437+6I5OvX69OmfRrjXX6
 WfY4xCT75rbFMReBrI8buN9FdqABxyd3Iey7hKH2BuZfoOh+iWOecB3kp/T7M7Cjgyjz
 U1OBWDcYfbMrIZKeQoNBOT0VloDqFChyeFa/lZSux2T/QESMqYfgnXxZDRmOvEDG5UFb
 A3OSNciI6Zwsbd57XlLfK3HYpikQ6rZUepbjVs/zwqIfLDkYJmAsAXzQ7SbPV2EQJZH8
 evUg==
X-Gm-Message-State: AOJu0YzAnATUf9c3QB83vUUp48L9tHpFLLF/6hvVEMOmvsYxks7FEt0F
 349cVxAdBH8eXtOxQ0VyYznWuqcWKiSJ6DSgd1Z79aF4YdCWIDMHnZEQ
X-Gm-Gg: ATEYQzw0/tB3IaE4zv0GaZhxD/D2izAqm9e8SbBL7Fin/U8uCp+HlzKJCrLTeBqAQvt
 G/TvRX1p1ApKgx/llPIpV4462JcDi/hhir/3LSi/8ZIDmaVoqJPzsoNOdam0L+AcC0dAjCugn84
 QkDk2NVLE9baH59f9yD/K+9Gp68jgCuWu0kFtHKuP0eF1eO7fptTMZi3av9toZQoQrXZZwxuw+b
 U/Gjw96yR8CZ1F4OMpF68tiInRkRRendu5PPzOxTbwE2rDLBtgI+bXlU5iOUHwSlTi0Xq3oIvEh
 ea08tE2JFUyulTAYQOWmKAI9c9HSe+L4EbcE0kOL1ILh3UEebUFTYCNi2Ld/JTOVAz5SPrq+yaT
 TLo+YsGF6eQ4flZv1lk9xiICl0ghww31Rxs+Lx1oWYkmqriyQgubTcrsUeoo+AjER5cqmUquhxT
 er6Xu8/lCo1aPw9Zi63WJbszg4O1hTN5j+E/1oIXi3e0q2pZ3FWU0okAxk9Vy3rl1VD4ab8A==
X-Received: by 2002:a17:907:e107:b0:b93:56a4:d6bc with SMTP id
 a640c23a62f3a-b9c6798d3a2mr16784266b.49.1775167035121; 
 Thu, 02 Apr 2026 14:57:15 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-182-244.adsl.net.t-com.hr.
 [93.143.182.244]) by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-b9c3cac0e1asm134009166b.27.2026.04.02.14.57.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 14:57:14 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v3 18/33] hw/core/fdt_generic_util: realize cpu clusters
Date: Thu,  2 Apr 2026 23:56:03 +0200
Message-ID: <20260402215629.745866-19-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260402215629.745866-1-ruslichenko.r@gmail.com>
References: <20260402215629.745866-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-ed1-x52e.google.com
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

Realize cpu clusters at the end of fdt machine creation
process, as they need to be created after cpu's nodes
are realized.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/fdt_generic_util.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/core/fdt_generic_util.c b/hw/core/fdt_generic_util.c
index b0e26e11bc..f3a47cbafe 100644
--- a/hw/core/fdt_generic_util.c
+++ b/hw/core/fdt_generic_util.c
@@ -151,6 +151,16 @@ static void fdt_init_all_irqs(FDTMachineInfo *fdti)
     }
 }
 
+static void fdt_init_cpu_clusters(FDTMachineInfo *fdti)
+{
+    FDTCPUCluster *cl = fdti->clusters;
+
+    while (cl) {
+        qdev_realize(DEVICE(cl->cpu_cluster), NULL, &error_fatal);
+        cl = cl->next;
+    }
+}
+
 FDTMachineInfo *fdt_generic_create_machine(void *fdt, qemu_irq *cpu_irq)
 {
     FDTMachineInfo *fdti = fdt_init_new_fdti(fdt);
@@ -164,6 +174,7 @@ FDTMachineInfo *fdt_generic_create_machine(void *fdt, qemu_irq *cpu_irq)
     while (qemu_co_enter_next(fdti->cq, NULL)) {
         ;
     }
+    fdt_init_cpu_clusters(fdti);
     fdt_init_all_irqs(fdti);
     memory_region_transaction_commit();
 
-- 
2.43.0


