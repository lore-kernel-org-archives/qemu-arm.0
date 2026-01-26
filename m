Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABA7D1950F
	for <qemu-arm@archiver.kernel.org>; Mon, 26 Jan 2026 17:49:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkQd8-0001eQ-Jw; Mon, 26 Jan 2026 12:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQcq-0001QF-Sm
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:45 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1vkQco-00008O-7Q
 for qemu-arm@nongnu.org; Mon, 26 Jan 2026 12:43:44 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4359a316d89so3553899f8f.0
 for <qemu-arm@nongnu.org>; Mon, 26 Jan 2026 09:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769449421; x=1770054221; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wFBy+jh5YBiZ6vn3keOL2UaLzu0U6mepC8EFxBaBwtg=;
 b=F9VjDdDtdq2HvE9ucXsvSBNV9dGoIF8X3sJQQ2mu4sLWWGEhtmR4iAOwv3IRd/gw/Y
 xzQyTUvrxaPK+NpnB295k3KN5+7zgRivD3xupMtqOrQtAd6i2TnG6KIsJV6yKQXAU24P
 fIHWCChCPmd0Q9VYO8AAgYiZVDaiayxczhVFzzygm9DZZC5IGpgVHLvWjH2rwAZj7HxV
 PbH2ccJFkcuPSbc39Nq7dLBn1aevG950A5WPxG7JSzconcLMcjN+JkswEB1dEkMDJwP4
 h+17iZncfA2ftMHdcnOv5BSI0Ipm1uzzLvV9dSl3uw5HpsVOYWciuVp07S66V+tUVAaG
 saQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769449421; x=1770054221;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wFBy+jh5YBiZ6vn3keOL2UaLzu0U6mepC8EFxBaBwtg=;
 b=GEm9k9uR6mT8yEzKr/8ioah9rtmSqPC4JG94J2q3g9nJ9ljfs4AROGGNCYtyxXGmkC
 s+FUulkb7JB+oANkK5PKN5bdNpx/jMpL5R1g2Pvc4NeSymQXX22eZ16VrfV/1pK2zmmg
 JaoxLoHwHNZZYQGj02pYXPcORM7Ni02RnzPdfD3siNIi/DIjy+MZarrH9sWbz9Z+3VG2
 ZYHbm74M5IcI/qbLBqREkiMg277bCX3kcn6AHOb4VcfNd/EUSP3Wjb+HXNYN6+WOCzPn
 FOqV5aJH+pcV27EPVT5M5A1wJbaKwP7Oh7U+vALtP6H93khJgZqq9JleuOjmGKmtI2pw
 oATQ==
X-Gm-Message-State: AOJu0YwG/s6vkQyty5tgdJutKVkWYq2pYgVXRFJm6kxEyMWEyNOEK0IV
 oULYybB+lq+Bn/V+x5kveobx592TmJnY7UT+ze7LVUu1PEAVvI6+jNHQ
X-Gm-Gg: AZuq6aKpf8CRzFrSgj0lCOjV9lzVCT0PQ+bGs8R1PEE+XiyD2RSh5BRwmtxZSRJiU0h
 x0xF1U0AgoOTKCvqrdofgkaPQ2OA/9c8/2vugw2LCbxYP0TNEDynsrXzrFVSbfuadjuFF/fZS+P
 x3mw7gGRshM46tNV70eAA9mWzsmY/VT+ACBopZokAHfsUc414gMZ71FEy3z6GY8U0QFX7W807vp
 801ABYTG729ECaZ19cTgrXqtdlb7fGOpmvYj7WkDi2BuWRA53vFsSRIr4Knb86e3PuXGd5aZhSR
 9vlSDGzYHIboXuYHPric9UkQWwMuWsyTMPL1ThAUHdw9X5M3ob0KbwEmtHNBdYyygGhzO2X0vxU
 ezoqaExNjU/7LxwVjXcstDc6V/qMKFbzhvvPcBrNvYbyjauOUdlNBVQoG6wTYUY2s0bHyAxf2Ic
 GJAGaZOgOPzY1BD8MOzoa1OonHMeOPaFqGN5XsE2t3z9sCGcuoy1AzbA==
X-Received: by 2002:a05:6000:2905:b0:435:a48a:123f with SMTP id
 ffacd0b85a97d-435ca13646bmr8352236f8f.42.1769449420697; 
 Mon, 26 Jan 2026 09:43:40 -0800 (PST)
Received: from thinkpad-t470s.. (93-143-71-105.adsl.net.t-com.hr.
 [93.143.71.105]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-435b1e71730sm34199603f8f.26.2026.01.26.09.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:43:40 -0800 (PST)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, artem_mygaiev@epam.com,
 volodymyr_babchuk@epam.com, takahiro.nakata.wr@renesas.com,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Ruslan_Ruslichenko@epam.com
Subject: [PATCH 17/27] hw/core: add fdt_generic to the build
Date: Mon, 26 Jan 2026 18:43:03 +0100
Message-ID: <20260126174313.1418150-18-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
References: <20260126174313.1418150-1-ruslichenko.r@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wr1-x434.google.com
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

Add `fdt_generic.c` and `fdt_generic_util.c` to build
by default.

Signed-off-by: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>
---
 hw/core/meson.build | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/core/meson.build b/hw/core/meson.build
index b5a545a0ed..6d6434b570 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -28,6 +28,8 @@ system_ss.add(when: 'CONFIG_EIF', if_true: [files('eif.c'), zlib, libcbor, gnutl
 
 system_ss.add(files(
   'cpu-system.c',
+  'fdt_generic.c',
+  'fdt_generic_util.c',
   'fw-path-provider.c',
   'gpio.c',
   'hotplug.c',
-- 
2.43.0


