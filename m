Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E026BCA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 03:37:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEIT1-00046U-NP; Tue, 06 Oct 2026 23:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEFaV-0003mg-JR
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 20:33:35 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1xEFaJ-0004Cj-W4
 for qemu-arm@nongnu.org; Tue, 06 Oct 2026 20:32:47 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-5bcbeafb07dso1014915e87.2
 for <qemu-arm@nongnu.org>; Tue, 06 Oct 2026 17:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791332914; x=1791937714; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=e8TB0ZtYp24WPs3mqNNFoiQRZJQqozvFbAYX81zZos4=;
 b=EJUH5t8pEfYPx/ptcBnoLRIKF29WtQcMgYm1NdO4rTad+NZaxK3s65U2lxfslIa3+z
 61+l66FEUg8lzbtLxi+pK/fjRpBiYHxR2JGYQMm1S2KLkLbmHhpXp7P+H5Vluspm1ZMV
 XoclycfZ3TeUOgsTGGmE8dH0aziNE6YOFSkmM59RZ6b/rjDSTmCzlMPRJ2++nOiA7iR2
 p+h124NYR3Grn/49TaQ857tKGLxySNp04SP67LUxl4vqX8WuL709DeWaypPKTqjnlTHu
 1NwnvH8ra6ngKOMaPL1fJrcUioqvPI4KPU8yNka7PIdY00puw+ZsiGVG9PErnG56FB2l
 XL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791332914; x=1791937714;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=e8TB0ZtYp24WPs3mqNNFoiQRZJQqozvFbAYX81zZos4=;
 b=r1+VljBhKNAauSwOoFyT8UmL8cBH28ExaLoGnySKcr5ETFdxzsiNSu8QUUvbjbjYN7
 LfB85i9eiArXd0TjCq+2sigrDxVMS6dCeQ2tnb3meJV5tDEHcG87ycvh134r+NTp2/3Z
 8bZ+p8ZNNlpAYO8S6MILgZ/w4vyZqUfRhsLozltZvkHv0XpdOwphrLPInIJ93MBfxLO2
 TZhGfxWrmSaqVlPOh7ZDzCmzsFVjivN9z19KQInfzBMCGmJ9X+NDNensedt/j6UfpjSv
 4ehIkTSlZT8rELLEYj+Z8SzXr5jAdNtCJ0bXjqe9Brn08DAJJsI/wdP7f4hY393jlubI
 uflw==
X-Forwarded-Encrypted: i=1;
 AKwUvBy+NQojrmhido763CkwBML3bTUwFsBrYotC6bLoFREqEqX1pFgf9rHcpTlHMzGfjt5S9BnPtiQxqA==@nongnu.org
X-Gm-Message-State: AFq9FYKigKD481ePHFPOnXz6X6PgB7JtwsuBLErQq6Tmt+7S388qJVJG
 sJvEibvTc+y3GuOcfaenZ31BbO6ixVwyy/hwOvGxyGz1efYwaxW0zC0f0r+XcQ==
X-Gm-Gg: AYBFou0f7fgJhEH57FjgGrkxJvKzxS/X44Q29snPgtbDb7ytn+5zfwI6HrLm30NdFKh
 5QM1kgZ9dWstEzqWHqMAFzHqQ17seFoaRiwaZu3G8JBDlQpOnqI+PkciVS5Y/py+XOxRTz7/ucG
 JaknoZCg2GmlNiKKJNbkIKnoAUCXQ2YRn9mr9p/LvXQpjECsjJbsoWScp7emOFBudyaw/C2MAmj
 ow8/cQFMAePQZHcPFdgOMYgeUbN1iwd7L7YZjvrCCwtP1ys2RfcwC3JJPpvisUWZX4EGs5F5wq9
 6XthF3QUwZlkNT89yApAa/0ZCLHCB4nVBzhSzxRuJoGw8Zfi+AcG/gHRjkagfjzRWk9qaXl/rfB
 SqDN++f3/u3PfPUqbgTysMSogZNWVx127PufDRVQRlxEiforN3R4fBCNeW2cmRktOOTedQdzBWr
 tG2uIQTG92kTiLBLkQHRWu9u6o4XAGJO5eKjSM4d9bVTVyW+RbWZspNz357wufPupGSHDfxHuB/
 5vBbto/LSNC6DNhwEfxyOtUQe8bT7Poj85s2L2ZZJpLew52
X-Received: by 2002:a05:6000:1844:b0:48c:4eea:4712 with SMTP id
 ffacd0b85a97d-48c6d1b01a7mr1215793f8f.53.1791275730611; 
 Tue, 06 Oct 2026 01:35:30 -0700 (PDT)
Received: from archlinux (pd95eda80.dip0.t-ipconnect.de. [217.94.218.128])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c6cdb281csm1566764f8f.55.2026.10.06.01.35.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 01:35:30 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>,
 Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Jason Wang <jasowangio@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Subject: [PATCH v4 09/31] hw/arm/mcimx6ul-evk: Have 512 MiB of RAM by default
Date: Tue,  6 Oct 2026 10:34:21 +0200
Message-ID: <20261006083445.30362-10-shentey@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261006083445.30362-1-shentey@gmail.com>
References: <20261006083445.30362-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=shentey@gmail.com; helo=mail-lf1-x12c.google.com
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


