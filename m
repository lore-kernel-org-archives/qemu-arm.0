Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10681D1D462
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 14:36:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdr5z-00075M-AZ; Thu, 08 Jan 2026 09:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5p-00070j-Gh
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:30 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5n-0000gJ-TA
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:29 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47d63594f7eso20127745e9.0
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 06:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767882866; x=1768487666; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/KVOlUvDlycuELIbU/nTcJH/sre0/0JiNhQLMY+dTJQ=;
 b=Y0G/a6s9bVo8awMVDkA/4gEmiSGYAYwEiw5uLNqsYQKRABJ/1u+cgLdbdXpeDgyBj9
 ui439s1DAwjhoKbCsxBCCdZwiNsXhSmLUfW3IrD64oLGwydK6Ye84P+tmr2lAZ1vpHVM
 uAJcXlKole2GP+/gb8HP5R3TRMQ8fp5Ic3XJOYOlhGyg1IvBRsOrG+bdm1bK5Pt0AJCd
 uXxxjQP9ujtjowymT2NdxxhE2dNqlfD5dR6q7QM0DMNqc0fTpeejhPic73ifvf49Ciwt
 jFw+jNjhjW3pAk3lAT3w+e/d4BBvktcHTn5gQkFmjHqyz+AO5TXjJKQvbHXQ85S6DWct
 qibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767882866; x=1768487666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/KVOlUvDlycuELIbU/nTcJH/sre0/0JiNhQLMY+dTJQ=;
 b=PY1jPJ/Zc4xHrWIeZNKXDfnSi5Xogxe3CawF7xK50H7Z6KwJc7CZYxWeverfz09hbl
 ujxariy5gZUAWic/jlf/zyEk0NVnuhutHyPagzO2XPuYkdU/prBq2ndXFXdjELcq/Z68
 Q5nkBi8C0w5rNGEskgS4zHh/DfLV0puLI7t+i75lO63O2aXjKbAc3cuFtQn2uniZnPvb
 i4ZPJcO9dnI9UK4+XnF0z5gBOf+YFtZWeRekCIHaRzyhrOcb1vl8F21zQCNU13tvUXAb
 yKwT1lEfnr1HBdlolLDz1xDbWU6gipeWKU9ZK46Cc/SEIjpzC93aKVYIvFroGKHoZTQj
 z3EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9kdusUlqTzKgasHsJ/BjIGaVOvXiSUNjxxrH0IhZLDwaggYpn0M3rW31lQL5qP1Ri2zK4842G0Q==@nongnu.org
X-Gm-Message-State: AOJu0YyLvibhmNkcywDvmNMW58DR32hkV4/q+U9cO+GK4wBZB4+vsjxe
 lPHkBBX8C0CTytMM71BcbDZgi3BnhZghs4HUrWvARjQg1fi+bfVxf1Z3FK2wUwRcfJ0=
X-Gm-Gg: AY/fxX5qsMakI4Gnjb9200H48jlWtu+rKKo0aZDtY1W5P+rF4tqfMYbuQzkRP/M6Lyf
 tj/m/wPLzCpfbR8OrINA/ghPzDa5irLzQJoFsG3KOc0gFoee2vT8BAHJagyJcc9y/Eg5ti3fpim
 uzTl1a4iCqJwAQUtM+p1ezgbiSZm8Loa5+edckIha87xA9JrjrOeQnHdiVs9xrFB90DgPzZaWIS
 InxdKuEb1jfbe7R0uQDW8DHN8S9YCFbw8kSUXWpu+t4VHeuCbad0veBrvmKMD2+p5PsX6Pi8qJz
 2eDAKn3xlWvjizNBI6kSdPQF9EtM4CLQqDQL4kMiSVNsAy+dtaXtcXZXi/1Ok+GcrHFC8mYQwd9
 T9niyuAF5z9AKpP39Of5RXYdZsPD6IsMDw4iUWMu/RzE5B4TAglR7WPuC0ItS9WIIDbnhnwV2Jf
 FAaVbXuIL5GSw=
X-Google-Smtp-Source: AGHT+IFrigIMRj1Fu7UQDZqoA4+G8mVP/VMqzMDX7eqsu7W3FCGzgFfrtVM8wmwRw8nFA5cmiRpzNA==
X-Received: by 2002:a05:6000:4284:b0:432:bc90:2cfa with SMTP id
 ffacd0b85a97d-432c374f5b2mr8866039f8f.33.1767882865561; 
 Thu, 08 Jan 2026 06:34:25 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5feaf8sm16663691f8f.39.2026.01.08.06.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:34:24 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 0C5A15F8DF;
 Thu, 08 Jan 2026 14:34:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Yanan Wang <wangyanan55@huawei.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 02/12] target/m68k: introduce env->reset_pc
Date: Thu,  8 Jan 2026 14:34:13 +0000
Message-ID: <20260108143423.1378674-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108143423.1378674-1-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
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

To transition CPUs to use the multi-phase resettable logic we need to
stash some information for the reset handlers. Arm does this with
arm_boot_info but for m68k all we really need is the PC we should
reset to.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/m68k/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index d9db6a486a8..fda015c4b7b 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -155,6 +155,7 @@ typedef struct CPUArchState {
 
     /* Fields from here on are preserved across CPU reset. */
     uint64_t features;
+    uint32_t reset_pc;
 } CPUM68KState;
 
 /*
-- 
2.47.3


