Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC5D4E9A03B
	for <qemu-arm@archiver.kernel.org>; Tue, 17 Feb 2026 21:08:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vsSJ6-00008Y-Ap; Tue, 17 Feb 2026 16:08:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osama.abdelkader@gmail.com>)
 id 1vsSJ5-00008D-F1
 for qemu-arm@nongnu.org; Tue, 17 Feb 2026 16:08:31 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osama.abdelkader@gmail.com>)
 id 1vsSJ3-00041o-Un
 for qemu-arm@nongnu.org; Tue, 17 Feb 2026 16:08:31 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso37616225e9.1
 for <qemu-arm@nongnu.org>; Tue, 17 Feb 2026 13:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771362508; x=1771967308; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kYhMRYHEkus5Vnp4myfoo273KT7fzWxarZWFB8zJFeQ=;
 b=aB+YmapVIh5AsBdmLbEZrx5+0osR4T5QQzhhW1GP4g1CRKgCY+EVWXgQeVLijzAD20
 cCqlF8yj7pnbkNMElvUP6D5oGwEqDnKBdiiT+K2oAcBTCV3dJcrxezBD0CNBhPF3gLG+
 QCZGaMv55escGxz0GIdFEKZ4aI+uMNruiWR8+8LMclmtRHQu7x256NAB2rgfI0gGpOio
 t9RqPSNq25e948EspszrtH8Q0lMWNVoh9MiopFkFDE1wqCa4vXTGq1saVltfu5OT5dOF
 8Oz2noWgVauasc7223hh81b22S4bTR5Z4LWYLUHmIDOeoXttssL5SJMx5nMzhwdG3anT
 aWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771362508; x=1771967308;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kYhMRYHEkus5Vnp4myfoo273KT7fzWxarZWFB8zJFeQ=;
 b=OGjeG8Z3zt7qZ9KDHzF9pZjzE5SIZiQUD7W4fBBvvyhB69SGWDMu2EKWbKLYZocBoe
 3qjMZcPOM1qxsMH/aq255hyqChtnNhBXb4jM+VxNBhNaI05dMFcyXGbnu7wsRSw3+Z74
 5SWdyQVKyfgiQ495phAWnvfHVGFb5SMdOsa39W51wzKTkLQDmJ87VpQEvEEOAr8zL/cn
 faxYN0c61UsKsbfMuS065MTomECOJ3n6+RFVSmmlR6P5ChtgEiQ68xg2v3jDBqJEw7ve
 JJK09J/TYlODQ8qh+hX9hMuFkLxEbbuWD9HJv8lVlQjebLcoMCdLYGwVsSPg/hdz8Mbh
 ZKVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXH+D4/jAjO1XmvgTGOHgUtLVfjW2bjQH7QTgo2IxR4mlVbyO3x/+kVQhdsfLoCda8tFv+pPR+LtA==@nongnu.org
X-Gm-Message-State: AOJu0Yw/xEhKodPVobMNozKPTaWtdfWz2Dz+9eaxxjEwXWk+bQa3aEe6
 g6UxTgRc9NGGLrcQdJAKMb1rNdLddg9OJelh5Fi8PF4TZ88XCCUCb3/t
X-Gm-Gg: AZuq6aJZKQjJQ6mBgBvZabhoRPaQcLZaN6BOE35CNLn9zXSAKpJOqnP1plfi2J96iW8
 lsxgxXqfoNL5esMfTCWoWdh6kxCPbCaXnGahkK2t3XFVTBDTljHCONtX//olva4n6Q0axHWFwh/
 7afsg5hX0DbrSbKlmf1o/rcez/jCC4fcLgUTjNSz8GMZEIVWQ8R/qakUJPLG1tzh36lx6dj+jvD
 nfCi3e4qAdPWQi/JjLc9RYAZ0Vn/1hdT8w4Zp7qAK1Nughdmmsu9xfZgKFlEr5Xd3VMndPiJ5Gj
 NH2A7+eCW4kpk9bsTx9baxNQzvJKo1H4Ap+4UAF+gfaIpfdoJSuzTmTBjtI19ogW21aSY+pvNQQ
 fPu16Nqaubgd6F4H9+VzmGYRttXoC1M0lBLTZkI3KgpZWDNZFNM3BUWKxSGUtf9JL1kx4iSXWIg
 9TqHG5KtP4MPd4hDKv7jr2wv850J5tLyRBMjiEFC8GDt3NhXr/qPfdGDo=
X-Received: by 2002:a05:600c:a10d:b0:483:7783:5382 with SMTP id
 5b1f17b1804b1-483778355e0mr194749525e9.27.1771362508215; 
 Tue, 17 Feb 2026 13:08:28 -0800 (PST)
Received: from osama.. ([41.46.249.95]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835dcfafcdsm828454955e9.9.2026.02.17.13.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Feb 2026 13:08:27 -0800 (PST)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH] whpx: fix FP register loop
Date: Tue, 17 Feb 2026 22:08:04 +0100
Message-ID: <20260217210805.104427-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=osama.abdelkader@gmail.com; helo=mail-wm1-x334.google.com
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

In whpx_get_registers and whpx_set_registers the loops over FP registers
were using whpx_reg_match[i].reg instead of whpx_fpreg_match[i].reg

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 target/arm/whpx/whpx-all.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/arm/whpx/whpx-all.c b/target/arm/whpx/whpx-all.c
index b0602266af..40ada2d5b6 100644
--- a/target/arm/whpx/whpx-all.c
+++ b/target/arm/whpx/whpx-all.c
@@ -554,7 +554,7 @@ void whpx_get_registers(CPUState *cpu)
     }
 
     for (i = 0; i < ARRAY_SIZE(whpx_fpreg_match); i++) {
-        whpx_get_reg(cpu, whpx_reg_match[i].reg, &val);
+        whpx_get_reg(cpu, whpx_fpreg_match[i].reg, &val);
         memcpy((char *)env + whpx_fpreg_match[i].offset, &val, sizeof(val.Reg128));
     }
 
@@ -605,7 +605,7 @@ void whpx_set_registers(CPUState *cpu, int level)
 
     for (i = 0; i < ARRAY_SIZE(whpx_fpreg_match); i++) {
         memcpy(&val.Reg128, (char *)env + whpx_fpreg_match[i].offset, sizeof(val.Reg128));
-        whpx_set_reg(cpu, whpx_reg_match[i].reg, val);
+        whpx_set_reg(cpu, whpx_fpreg_match[i].reg, val);
     }
 
     clean_whv_register_value(&val);
-- 
2.43.0


