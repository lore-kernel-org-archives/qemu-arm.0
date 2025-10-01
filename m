Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 883F1CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Oct 2025 15:22:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v3yST-0004Qp-G4; Wed, 01 Oct 2025 11:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3ySM-0004HI-Dy
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:09:26 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v3yQO-0000rv-Kd
 for qemu-arm@nongnu.org; Wed, 01 Oct 2025 11:09:26 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-46e2826d5c6so57401665e9.1
 for <qemu-arm@nongnu.org>; Wed, 01 Oct 2025 08:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759331239; x=1759936039; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/C42/g+0ka3x6Y+pYcvJ/oLioyVbWee9ufrhd822gyA=;
 b=lxOxu10nX/5NAUsftF1fEfaP596+wwcyHADtf2Bg6g70woIu2/5ELd2Be9fQkDENes
 /kiaYkNmbx8iMp4zFg+42u4qvoYnV8/1PuRvwJ94K+KSe0vHdm041NhkRTaZaMbvHoxv
 YOcs9VgucT846875wVZItRioxuU64De9lhOWB/M4yC1eFcsJLL930rnMYb6h8BFnYMBT
 Wt177Q0ctn7+dI8HUv1JwniO+gmEd33gn3vQmPqD2+VAbpb3/gXpVDQlUByDXLjH1E3r
 GcEWzQ+mYQL40fV2j4xH+4LP/GtNzsgWxBze4Mm+vNtpIUh5/817RNTLGu5PF+q0cGXw
 /15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759331239; x=1759936039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/C42/g+0ka3x6Y+pYcvJ/oLioyVbWee9ufrhd822gyA=;
 b=ThQLwBb20UU725g2lTbC1RKhnVNN7jFOab/l8wZwFJqlPlJy8+tRMPIhLyiU43sN0u
 gT3ixRYqj5n0RNXhc86xgs5Jvt1ojHVFf7NxPDljirZDqdd5SRKrl0zsmlI5CXg+6/ii
 qXlJXoc9qNuu38gnU/D9a4oqNeJOXlsH6RxwacG1bLF4wOX1wO9ZgxNTLeBTOMcD1tJ+
 O5nImNos8mQifV9zmPknHTRXsP9g37F02oaWMAL188yyvILjtMfhE2lhGBvPJIUtww+D
 8051C8O+w911VwQJVhBircDEFK7h1wmAYJpGVDGnubVrjaxQQuTebYiyhSc3WQCkVr/0
 opAQ==
X-Gm-Message-State: AOJu0Yw6tHNJnT3SnEeThjnZkJZUr6IraZ9LoxBQ1ZZkiasGjmDUpfDS
 v07yDxRtOUIst8DxstNpEBDhDNIKc9wGhDOREUwEuB6OJItTwsBwgsaIS8IBaRIF2NdUIFbYKnM
 Ii4EugybZmQ==
X-Gm-Gg: ASbGncuz6cFOcPsYZB6fbxsqfq3ODb8pUk0dcrtGy1Yb8c4AxlYEJ33pa7GEdW07Q+1
 MCQYaJP7wVera90UIf6P6u6JIVD4rSB58NAhUu4yLM/iJCghxmqbf04JsVItYENCZ5TN1F5HVcA
 +aIApZ2W6VG5wd+t5bjus4DBQmtGyFcazTUP8ZKiURm8M502e2LUrO3H1HPjl9QtsvW2+PM14Jm
 B6NBW7SX+jvYEibTKvgqXXQ5u+TNRrPk7ZFqr4euUquRgvEWSUSV2mX/VVJHsh6ONHEo+jwYjCO
 5GhQSBlELbJoOeuPvDcnU6LVdGr2SwPtdzvGl0NJiYLP3u2hux4owagxjo5VyvTyhfeZs2kmCsk
 +pBPupufisNXcyB+TYt6NCbLYP+YbidTQSvS2Ic9vOoOsTKyGF8ggU5FQJCtGq92yAA3HwVSzpO
 u0ltrQB1c5W1ztW+6J3RtEYZyCcEPJxoY=
X-Google-Smtp-Source: AGHT+IF/75mknZcUFVld4k25ibBW5an9rIxlCHvWPhGUKdqmIQ2eXg+Qp+sCollNQ71J/V4FjW/XTw==
X-Received: by 2002:a05:600c:3b27:b0:46e:4784:cdf5 with SMTP id
 5b1f17b1804b1-46e61219f94mr32963235e9.15.1759331238590; 
 Wed, 01 Oct 2025 08:07:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46e675b557fsm17554035e9.0.2025.10.01.08.07.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 01 Oct 2025 08:07:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-riscv@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 21/22] exec/cpu: Declare cpu_memory_rw_debug() in
 'hw/core/cpu.h' and document
Date: Wed,  1 Oct 2025 17:05:26 +0200
Message-ID: <20251001150529.14122-22-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001150529.14122-1-philmd@linaro.org>
References: <20251001150529.14122-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

cpu_memory_rw_debug() dispatches to CPUClass::memory_rw_debug(),
move its declaration closer to the CPU API. Document.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/exec/cpu-common.h |  4 ----
 include/hw/core/cpu.h     | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index 910e1c2afb9..ce64a999035 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -150,10 +150,6 @@ typedef int (RAMBlockIterFunc)(RAMBlock *rb, void *opaque);
 
 int qemu_ram_foreach_block(RAMBlockIterFunc func, void *opaque);
 
-/* Returns: 0 on success, -1 on error */
-int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
-                        void *ptr, size_t len, bool is_write);
-
 /* vl.c */
 void list_cpus(void);
 
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 0f7eda1a10d..1e928f57c99 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -685,6 +685,26 @@ int cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cpu,
 int cpu_write_elf32_qemunote(WriteCoreDumpFunction f, CPUState *cpu,
                              void *opaque);
 
+/**
+ * cpu_memory_rw_debug:
+ * @cpu: The CPU whose memory is to be accessed
+ * @addr: guest virtual address
+ * @ptr: buffer with the data transferred
+ * @len: the number of bytes to read or write
+ * @is_write: indicates the transfer direction
+ *
+ * Take a virtual address, convert it to a physical address via
+ * an MMU lookup using the current settings of the specified CPU,
+ * and then perform the access (using address_space_rw() for
+ * reads or address_space_write_rom() for writes).
+ *
+ * This function is intended for use by the GDB stub and similar code.
+ *
+ * Returns: 0 on success, -1 on error
+ */
+int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
+                        void *ptr, size_t len, bool is_write);
+
 /**
  * cpu_get_crash_info:
  * @cpu: The CPU to get crash information for
-- 
2.51.0


