Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48B8E9A04A
	for <qemu-arm@archiver.kernel.org>; Thu, 19 Feb 2026 14:37:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vt57i-0000PJ-P3; Thu, 19 Feb 2026 09:35:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt57g-0000O1-Ib
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:35:21 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vt57c-00035d-E8
 for qemu-arm@nongnu.org; Thu, 19 Feb 2026 09:35:20 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-436263e31abso951999f8f.1
 for <qemu-arm@nongnu.org>; Thu, 19 Feb 2026 06:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771511702; x=1772116502; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=52Rc446xe2dQaFht4UOxDu+6HVWFzHT4d7x+yDo+hRs=;
 b=PaBeCJeAwKUCuByZcsVmOrrvpXLslSybGu6GW402Krdy5eQiNEaZfOWDvU94+3xUYA
 sYDIrxBKqVvu6lteVqCREq2taTx27uVQM0iQPRf5AzYfNlvf3GLhszfQ5vrrvK15csPY
 k1C1w7VR0DxkalGbJUfqLF3Za1LtWpip5SjSjkWEJ9j0DwtQ2BHrqjvrPCa6q8cBxlXt
 5UdyEjUULy2PtVhMGogLaz5mIWtpd0FSklJfnip+/yvcgznqKaG2LemNm4t8j24gLTaY
 JyepHV2Np/KRf95MvpqaZtmcALwZi+Islp2afpul/YyTpSvVfxNI9ym0/3Et1GSfNIbd
 OajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771511702; x=1772116502;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=52Rc446xe2dQaFht4UOxDu+6HVWFzHT4d7x+yDo+hRs=;
 b=e4KpB6TSOstcfg9gXo3x2ugAm6ERsBmMX/Lpz2b/6nFuE39j2AUJTdSv60FYaAC1/7
 1wtfnBqaAcXKLGgVH66oN72Zs2iVYqCNWwhd2h+06gbTWj6dynu1JYiviVsbkvZ255Fb
 EOEfRjt7+J3gFfCLdTgvM3GgdJIrWkgRpIHqlWzI8GW8Tfst1nxXe0XDo5Ylo/aNOlPH
 Pjzb2/cbc34f0wyho1rF0jtngMk6m7mnOQEcyB4zdW/sncn3LJvgLmKf2tY+tH+vRw3w
 dcD2bQY+zvEJHazhv4zcOKBrOAYr1QmMtvd9kr3LbWolr6/p+kdRkEW5rpDO7lNOkPfu
 3T/A==
X-Gm-Message-State: AOJu0YwIM09RZ192+5rrsbUjHyjln3HHbCmJAsrhiY0G4hVI1fsE6lnI
 VlntB0Jwlx5EoReLAGj+xBOA9tRnSukmJNsZ8FNolc5cAG4IyXcPACBt
X-Gm-Gg: AZuq6aJ+v8hc+WUMK4I0rTFB/tyR2AUnJmKPPUEhVytScNjTuqFgZgW4seBafKgag8Y
 KCluN6iFFKuowtMTFk9z+gUhVLSA7kiBQTMP3QSps78KUOJoVA4f/EDkiW3BWm3n7bHJQ1vupa1
 qS1y2dRh1OjeI6U9+JENFgZSluzf9tjRAibmz+gz1G0qEHlkxRl58mIn0c8KdwulweJnVWdVoiT
 85tFP1s/NEYlcdX2ahlHw4I5/Ti6h9bop60Q3XvLadMYyyN/wKlXC7nouBGkiqUQmGriFW9AoYe
 RQBld5nifY5qKP+jwvJAxhyFpniMfDDBXDtY9w6XFLeaSftzNI0Kv4hVztHH6In5FHANxkYPcxZ
 HCo0afGFkP9SycMK/psG7W7WA0PWn71QpeCbPrFv6LdklQMxUuAipv4GIZurY/1ezT14NxXqMg+
 Bme9oelkqB/37S7iLWMdabUK+UIr/JFRTaAL5SD/JZl45h9y8geN0rVR29mhFh+tFrX0QwKu/Cr
 7wW7Do=
X-Received: by 2002:a05:6000:40cd:b0:42b:55a1:2158 with SMTP id
 ffacd0b85a97d-437978d4f1emr35148042f8f.17.1771511702220; 
 Thu, 19 Feb 2026 06:35:02 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-129-182.adsl.net.t-com.hr.
 [93.143.129.182]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-43796abd259sm52022770f8f.24.2026.02.19.06.35.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Feb 2026 06:35:01 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, peter.maydell@linaro.org,
 artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com, balaton@eik.bme.hu
Subject: [PATCH v2 18/33] hw/core: add fdt_generic to the build
Date: Thu, 19 Feb 2026 15:33:17 +0100
Message-ID: <20260219143332.3316679-19-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
References: <20260219143332.3316679-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x42a.google.com
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


