Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13BDFCAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 09:41:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0d0q-0004f8-5U; Mon, 22 Sep 2025 05:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czj-0002UV-Pv
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:38:08 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1v0czB-0000g0-8n
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 05:38:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-45de56a042dso26099485e9.3
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 02:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758533845; x=1759138645; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FpyzDIWQ5ZoXKAzqSyc2elMY1EE9GCHDwM8UA7OBlS8=;
 b=f06tm7k3NwPN0zO9Gi1LFZpDdHj2DeuJr5L8ry/USP25GeLiQC1e9+SOGQemQoc2U3
 qAm37dwy4tkjEhwPfJ5A83SBx+YX10yC+Iby1OcwNsfddnDyqyq5g6Ql2tPZh8L8h2z4
 OccjcjoL+blmj83PdxCsOfzSQ2f65imjibvOr/d5s1czkeV0THVMCghwUQBa6kewCoIc
 5n5gxbrpfvdmAGh+sliuVcTJELsaiLgNGLE557eh+xEsE01PoYKlXVH7nbq5cfXxlDTC
 hO85x/LcrSjbZM4VHWCRRJyOs0qFMkuWG9V/QcRALkC9mvkaNuY7n2RxO7PC32hizND7
 oxHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758533845; x=1759138645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FpyzDIWQ5ZoXKAzqSyc2elMY1EE9GCHDwM8UA7OBlS8=;
 b=iAK7ouzRdS9vHyX185C2FN+DFEuOxg3Rkt05lxKlaFXb0bte3xpzBp5HTYd/OecIpW
 9hrZm6R6JHc4gDkipI6lmKAgleqZa5EpyzuoI9ucvyOkwiF2ZGnqI0NKQ7/u5SfY8TNM
 BSDBUT6YA3Oh2qxJO37uujPL0L/TAG9JJOh/BV/n1FkE03dV7nP5RfnxIUIBRXvnNrW6
 SMsjS9xpl7woAF0hsVucdfYGIVSx0v59LiygtP+ao97vvjBQglrNej3d9PoJvUAwklAm
 eTb3do45Xghpi//lbqesr4Eb57acmNwnM/Kt5xQiYSRi4X8oTkDV/+iFyHgwGbL0Tb+q
 h1cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHr32eo2L7Bu6pzte0elDThjBki6E4qryuuoPUYpHoIT5zGyB/soXYgBeoofz+JslD1u6/X8n62A==@nongnu.org
X-Gm-Message-State: AOJu0Yzv+g4U54DD/mXm0nlHUwhjWseMPNvqCHsPsZAe7Dswx0E4XK6n
 cATVh59iLEH4NhafH1/elOCMvug86XXaiROiXUOFfyvPI3TgFR+RhuBcjXx9wt1Gbeg=
X-Gm-Gg: ASbGnctrXa21mSBjOcpOTvjiC9LQ+yQF0H7nJW6Tx2clBTqe/fZ15Ovr7ERK/89vXti
 tNm01r63eQ95yq/x6t2NCvJ0BpE0oGX8s6Q/WjqDDiQHshhENusYccE4I0OcicLsrGzx+uVTSbo
 ZvxpTkk/SQnXbWMTEbEEuB/r6WK9Man276Q85r/PGaleH6YaA8O1xezCk/WpWI7Cwdo4VpRhK8T
 T3356o9B4NIfrMj8ME1AytR0Tk/3kYASTLGXIb++jVDIeJ/oec3RV8cW0b+oPFXg04SK49D8/SP
 ps4mIF6/QwmLgkBnHzKZw4YLX3vLj7+xu6Q44CbqRCKBV9COUCDS+N5J0uTwnF9QsmGjawGi0Hj
 jOSYohZd3CI5BMaGubi6clKNIHXA4XIwXWQ==
X-Google-Smtp-Source: AGHT+IETT8Vq/rVcS+uTMt32M+EaHEz3SHHsDUWgNHeMwBTMpLOGts4+upLnLj8sq+C7fMc28zMlxA==
X-Received: by 2002:a05:600c:198b:b0:46d:996b:826d with SMTP id
 5b1f17b1804b1-46d996b8a43mr12581515e9.34.1758533845258; 
 Mon, 22 Sep 2025 02:37:25 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4613dccb5e2sm233400715e9.17.2025.09.22.02.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 02:37:24 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F23A45FA18;
 Mon, 22 Sep 2025 10:37:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH 15/25] semihosting/arm-compat-semi: compile once in system and
 per target for user mode
Date: Mon, 22 Sep 2025 10:37:00 +0100
Message-ID: <20250922093711.2768983-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250922093711.2768983-1-alex.bennee@linaro.org>
References: <20250922093711.2768983-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

From: Pierrick Bouvier <pierrick.bouvier@linaro.org>

We don't have any target dependency left in system mode, so we can
compile once.

User mode depends on qemu.h, which is duplicated between linux and bsd,
so we can't easily compile it once.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Message-ID: <20250822150058.18692-13-pierrick.bouvier@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 semihosting/meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/semihosting/meson.build b/semihosting/meson.build
index bb0db323937..99f10e2e2bb 100644
--- a/semihosting/meson.build
+++ b/semihosting/meson.build
@@ -12,9 +12,10 @@ system_ss.add(when: 'CONFIG_SEMIHOSTING', if_true: files(
   'stubs-system.c',
 ))
 system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
+  if_true: files('arm-compat-semi.c'),
   if_false: files('arm-compat-semi-stub.c'))
 
 specific_ss.add(when: ['CONFIG_SEMIHOSTING', 'CONFIG_USER_ONLY'],
                 if_true: files('syscalls.c'))
-specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING'],
+specific_ss.add(when: ['CONFIG_ARM_COMPATIBLE_SEMIHOSTING', 'CONFIG_USER_ONLY'],
 		if_true: files('arm-compat-semi.c'))
-- 
2.47.3


