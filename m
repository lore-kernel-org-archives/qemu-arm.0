Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05CCFF8867
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Apr 2026 23:23:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wHVHX-0000Vh-AC; Mon, 27 Apr 2026 19:22:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wHVHW-0000VS-2G
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 19:22:26 -0400
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <scottjgo@gmail.com>)
 id 1wHVHU-0004er-JH
 for qemu-arm@nongnu.org; Mon, 27 Apr 2026 19:22:25 -0400
Received: by mail-dl1-x1232.google.com with SMTP id
 a92af1059eb24-12dbd0f8063so1491608c88.0
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2026 16:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777332143; x=1777936943; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b6xf/kF/rSSXc9pPyWscRobbFDLcz+Fus8ef/OByOuc=;
 b=B2bcS9d5fhocVTN9g7O5EghScVxcF+ahaZiGDLwlYDBRQQsFjkPA/e5vjPykwRhlHh
 vklGSmOArl160eco+u4HmGo7HtrhCy3IlJ6RPuCr3YppVm/fWhXCLCGKS77uvPwWtfjJ
 P3TpMa8P5Vx/0seaVvfOlH9mrNqLTKJq3Lur2nIkHSGuOS5tf35bDHbKUDRVAcwCW+NN
 XZJBRMfDeY1+U2viljZetp9WLGRuGu0kYl/lc/DIhudaJhUjAHf9VcPqv5DEP/aguvwp
 NFDu4oMobUoTd/XOetI9WX3rOtuhpPCpzoiANYJ2GWGRf2Qa1UIi9PfY+Iu3Fj3TxNjX
 RRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777332143; x=1777936943;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b6xf/kF/rSSXc9pPyWscRobbFDLcz+Fus8ef/OByOuc=;
 b=itaYf/wLEBiiklBbzCM8euJiDhbFz1gK1wPbShGMd9Qgbzap/l/nPkn2eRIfftm2nF
 leNMuP+UJiPgq5WGpawam5NgJaPBzArj0+j/eBXHNRR35IQTxT/4ZMyV6czmu6fKoh1e
 69cEx3sLwtV8jrb6f2iQXTU7noYh0YX9qoWjbdYH0wVrzqmcVvat79U0nmPIBUDFyJF5
 m9M2eFjK4fsBPG1Cpsdax/JLaQdWYDS+H/KQ0XMA4up0sDpDlzADFpHKnROvLcmhpL7j
 NJt0+BAHL/kPdEW3TU1bEhxNwY1sV3u2g2SJJ0wsWisUXDDnqHH+ROuBs7in++W82n5G
 5urQ==
X-Gm-Message-State: AOJu0Yxf06CgjNY+b8WyutGw2cQjf0Q37wptVu3CIQ38EINecSWWxFHd
 boMgvmusa7KYDawI/lyXhrpX7c/9pnFBcHLyusxGaCsxh3IYF2PzlP7+
X-Gm-Gg: AeBDies+k26iRE0X7829nR1WCWnSul2Qyv/ALAdTGF/fVX3QXibeRbhbvbJdeqXccst
 I6Ak4/mradWX47HqzkXHjXZxyTzXBUctD947uGbIk/BRamRo10CH6bzMdp57tDovJ8IwxpdqvWz
 ca26nnLTEfqZn147Sp6FGHIthQB7iWf+uN1liXFLOty8CZPW2j1AYVolhkipbJzK2UgKqVtlmg3
 4xyzFdzfr9NQEd5fvqXfAKNd5/EIkuu+4ZBKJO48Nwi7me97PC18L17Xey+UMOHVHUUcO63W0wL
 ZI9y52n346n4ZEOk7ZzDouphPkiNbqkyzvpC5chzxjADj2Rxo7ZdreV19Ykf6OyWGkM9bN3vBas
 zUlcWhrqepePFtYQa+CLs6MEeDm0F7eagUhNc6R+y6jlZVitEcRF0xlNYwawMoy4ksKNYI5fM7T
 O51lrY/caBXt6jVStBRBrbuDDF8zQUHCVhbJyMzABqU/F3l/R/grARbY1QX1fVVvhUmrAQqMu6x
 YTvFXhSlhJulMBy55CN8tk1193SPMLY2Qgcww==
X-Received: by 2002:a05:693c:2c97:b0:2ea:5057:a32b with SMTP id
 5a478bee46e88-2ed0a11fd4emr512035eec.17.1777332142510; 
 Mon, 27 Apr 2026 16:22:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:645:8200:47:f4a5:bd04:3ca7:5727])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ed0a0ce710sm849973eec.19.2026.04.27.16.22.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Apr 2026 16:22:21 -0700 (PDT)
From: "Scott J. Goldman" <scottjgo@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, "Scott J. Goldman" <scottjg@umich.edu>
Subject: [PATCH 0/2] target/{arm,i386}/hvf: Fix HVF migration
Date: Mon, 27 Apr 2026 16:21:14 -0700
Message-ID: <20260427232116.50586-1-scottjgo@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1232;
 envelope-from=scottjgo@gmail.com; helo=mail-dl1-x1232.google.com
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

From: "Scott J. Goldman" <scottjg@umich.edu>

I've included two small HVF fixes that allow migration to work again.
I've only tested on ARM, but beforehand, starting the migration would
segfault immediately and now it works.

Scott J. Goldman (2):
  target/arm/hvf, target/i386/hvf: Pass MR-relative offset to
    memory_region_set_dirty()
  target/arm/hvf: Stop pre-allocating cpreg_vmstate arrays

 target/arm/hvf/hvf.c  | 9 +--------
 target/i386/hvf/hvf.c | 2 +-
 2 files changed, 2 insertions(+), 9 deletions(-)

-- 
2.50.1 (Apple Git-155)


