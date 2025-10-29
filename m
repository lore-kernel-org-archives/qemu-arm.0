Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458D7CCF9E9
	for <qemu-arm@archiver.kernel.org>; Wed, 29 Oct 2025 14:24:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vE75m-00069O-Kq; Wed, 29 Oct 2025 10:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vE75c-00067T-20
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 10:23:53 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vE75N-0008Kj-8P
 for qemu-arm@nongnu.org; Wed, 29 Oct 2025 10:23:47 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso100367985e9.3
 for <qemu-arm@nongnu.org>; Wed, 29 Oct 2025 07:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761747810; x=1762352610; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+k2zjMvB10MLJYg+WaiVjaqJZ5hHFGUGTiYqjjtMNNI=;
 b=Eu5Ehj8Px0nNVlOOUI24qg8hd67WgThEcHE3fBcluyejTzEB5mpZtFmiZ8z5oR7Z4Y
 Eb8zPLYxG3SRJQVOennll+Fm9VPIJVin78cpYUfFPHrJ86oT2UljjLZOVvX+9BBLkvjA
 UcGo9XtuP/ty0S2+lIfQPxgG0rUPPOBiHzD6yb/9TjCp/gfPQsKpUQwlaeGdrYhe0m87
 77as2cjHTAYCKxxj5MgKQxUgU24osp7H58mfZHSUsHHadaxm+DJozzTUlv3v7SEmbZ4P
 RPHoyZpEidWgEqNtCwHHgMrApGlz0bbY2ekfmLNKZ4VFEktgX8TAu/WC9jLwh6m05VyK
 +Hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761747810; x=1762352610;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+k2zjMvB10MLJYg+WaiVjaqJZ5hHFGUGTiYqjjtMNNI=;
 b=SOPQi3QvyzNRNPzh8CR+la5tqTkuaDeQZuh5a5QcWjbTeo7hUI+zxCi25Aig3Wnuhx
 LGN/ANR+8d3oMD57ndvCxLeHATkHW1lFdzumkVj/gTZM9deKt0bvOy8pn4KBFpcYCPa1
 H3MlCJxgfvHHDIB+VNmHHXwsURJu5LuVbFVQ0j2UxPRvhc+qxeZ3WP1ArydD5pxBErOl
 NiKf3oyB8UcksToe9vNXxVG4knIRQ+0h0Gur/sIZ9iW+FzAuBkswv05G6e5HnBGPanuW
 Brd5rBrZnJgtRpw/1DCo/vlHqe7jkyRJBUSG8/HF80JT5bQ7v9sPkMNcqTTLzfT8tEdj
 V2fQ==
X-Gm-Message-State: AOJu0Yx0HPm8SXA+YRB/cbiRLDgSRUR9SOD9KsZDgJBWdWdwo/aqfIh0
 P9bi44Mpb1JiZ8039eUy0fBD+QdocBEgZnp48asFhq8PmFYQPZ+f5HFh
X-Gm-Gg: ASbGnctglPKc8t0iJXiHN9U/E9N7pRxCg+tcKJW3ssZyqjmA5mqZBrACBqg3BnmoRCx
 zQRfzYLyRkxYBOiEU1PPrDqruMr6uqvUdh76i7m4ujsVotWTCzFO8dwFnOjMv27oqCCcE+E0S5E
 /R4WQJEyqG1j6JraKJBUMlOxXzTKMeDicvSi8OnCwswood3yogoAUqNKrfaX432lh4/wu7bzzh0
 v+PBvEPaDusIWsWbvLFkHtYYzlmFlBH1sZotwdo84l8FjR58BPaoLFxEM7RQkbykzgImmyKPHVX
 +WODgMmZrxoG0qSTXCf3BksSP/YD3CWxMkm0AzUMg6L5yOOqBQKwFD4lcn9rMmnWdtHmOtOu4+Q
 1YmKvLG+j/aYA6jOYjGAJR0xHYcB9usAHRC33BoT7lZsedp1A3tSOgqGRNQan4rh9M7ec5sQvLw
 YTbXhotUZ/LZQJQilfHWmHG9q2boLV5taf
X-Google-Smtp-Source: AGHT+IGkbXq8YLYTlrHU3Y/qlQuki8pLt80vcv9+30feu/MLXI59AP0oNkd7Jspqd0uFC6XDgb3Thw==
X-Received: by 2002:a05:600c:46c4:b0:476:84e9:b571 with SMTP id
 5b1f17b1804b1-4771e183b35mr33153625e9.14.1761747810039; 
 Wed, 29 Oct 2025 07:23:30 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952ca569sm26038747f8f.12.2025.10.29.07.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 07:23:29 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 2/2] hw/arm/imx8mp-evk: Fix guest time in KVM mode
Date: Wed, 29 Oct 2025 15:23:11 +0100
Message-ID: <20251029142311.2986-3-shentey@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251029142311.2986-1-shentey@gmail.com>
References: <20251029142311.2986-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

The imx8mp DTB hardcodes the clock frequency of the system counter to 8MHz.
In KVM mode, the host CPU is used whose system counter runs at a different
frequency, resulting in the guest clock running slower or faster. Fix this
by not hardcoding the clock frequency which makes the Linux driver read
the real clock frequency from the register.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/imx8mp-evk.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
index 80036f8589..e26c62aee1 100644
--- a/hw/arm/imx8mp-evk.c
+++ b/hw/arm/imx8mp-evk.c
@@ -43,6 +43,15 @@ static void imx8mp_evk_modify_dtb(const struct arm_boot_info *info, void *fdt)
         fdt_nop_property(fdt, offset, "cpu-idle-states");
         offset = fdt_node_offset_by_compatible(fdt, offset, "arm,cortex-a53");
     }
+
+    if (kvm_enabled()) {
+        /* Use system counter frequency from host CPU to fix time in guest */
+        offset = fdt_node_offset_by_compatible(fdt, -1, "arm,armv8-timer");
+        while (offset >= 0) {
+            fdt_nop_property(fdt, offset, "clock-frequency");
+            offset = fdt_node_offset_by_compatible(fdt, offset, "arm,armv8-timer");
+        }
+    }
 }
 
 static void imx8mp_evk_init(MachineState *machine)
-- 
2.51.2


