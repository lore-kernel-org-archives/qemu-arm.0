Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09390CD5BD1
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 20:40:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRyYC-0001W6-Vt; Tue, 26 May 2026 16:38:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRyXb-00011G-1A
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:38:22 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wRyXZ-0007Hg-DK
 for qemu-arm@nongnu.org; Tue, 26 May 2026 16:38:18 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-45ea19f412aso3349968f8f.3
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 13:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779827895; x=1780432695; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/2ukhcTbDGFuFPuVDeLKgkGB/+NaX2By6szsnTvhSc=;
 b=iw3Qy5jMMKRazGJc/q0TJwsjUf4DzafqVPYvotq2VKJqQkdLZ4uh2GmA1apR8LvOJ+
 g12hdWEbHYZkbXbDZtN6H7NAGnMaHAImobcipgtxNR+1ld9NN+95ZCkKxQjzdFihJ5sa
 qgCi80M3jl4teoF887+LsfZ4AARm5q/XmNKJv/Uv1XDjDPtuI1o+E/+Q6L149EVl9XwP
 0ZoBp3A5FLf5QzaLHQpfUIKqjiPnVhRmw1R1QsvkzNxE4uyJ3Eq6fJtERXG3ZR+faEGz
 vh7bXzIVM/r5ksh4SVKr1Do3Ghvu47vrlL+a8Df//lLQmTMmHuHxR1LxHkOS3S7l77ti
 Zfqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779827895; x=1780432695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I/2ukhcTbDGFuFPuVDeLKgkGB/+NaX2By6szsnTvhSc=;
 b=flohm4Yo+T2j/lpXC7bCriIgX7NbMbXiaVrAbskAYyBP/q8urvWrgAfcfdu3+ZYkIf
 gpioLgObfxk7tdEQNJu04nLiePxWjh1FTu+BXZChhYkBxq6OMXvEejEV2ve09Do5Gq1R
 VtE8Fas20+7drVubSpOl5+1TSa60JpDWxNg5yhyujjoE6TiY5ThnO1ghzCgoB21Ve/Cs
 Vud47k54NBXSqZOe1GNQjgZpYOdA2YA55VSUNVtcr56hRfGX51Sx3Rd8TxgrvJZKhGyr
 b2UJK+obJX8F1CIKR6Gb+bhem4KSA8mD5xCcyH1RO0XuUZfyCFVWKXVvpCMQgP51osMr
 7mfg==
X-Gm-Message-State: AOJu0Yz/CSvHwUDfNI1wsEcqnM/7R5Jz6rv+6yV2yOboQic1elLY62Ds
 3WvVsN/RZeCZGYMlO1/jeKqKo1mmEnvokl/ZZYj7kYf5NmdpUvdsa34405lXxvQ6O3U=
X-Gm-Gg: Acq92OHhp1k46qep9xkTy4UymlFkYPB/UshHqtjTFF8mVqEelxXs5BrfyEj/sPzbHkj
 J2st9+TnUTDSGmHtd4p94d+sWZoIqWx2aYUzBNgPzLvgiOuoQWp3mSwUspUMjeXKXYoQA/Cl9ta
 vdiAUilTzpZEBt6RANm/Tu/NQsXDtod/zgoQlfxk4/7QjGga5y6TtghBjGTyQHNDdKBMPyIRaKF
 GoVboTpM0ueqy7jOWBnzTnRMdEFzo8u7UfYEr/9tmL3VF7BeyqDjabOxPIbXranKJ30nRjTMj1t
 zzah/bvV4pkzLsRRZ735GImuvnDboNEad49E+oR+Y9EonQ29lz/exjGb+1FxyUY67tl3zdEZMd/
 FdM8VlcFKeyzFTuGaPK0d6FR75pejLWbhTUJ1/VaQEz6brFb++NugX2r9jfQdNx9ThLjO419Z2E
 zppZeNMj/sZ+A3d6AKKG1pZg0iO4aY82dXSK7mfG8ErUI+OTUjTjyCpiXVDXl0KH79dA==
X-Received: by 2002:a5d:6f10:0:b0:45e:a19f:22c1 with SMTP id
 ffacd0b85a97d-45eb38a28a8mr33737700f8f.15.1779827894788; 
 Tue, 26 May 2026 13:38:14 -0700 (PDT)
Received: from m17.home (88-187-86-199.subs.proxad.net. [88.187.86.199])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5b1a28sm732524f8f.26.2026.05.26.13.38.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 May 2026 13:38:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v9 07/17] target/arm: Build gdbstub64.o as common object
Date: Tue, 26 May 2026 22:37:12 +0200
Message-ID: <20260526203722.79463-8-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260526203722.79463-1-philmd@linaro.org>
References: <20260526203722.79463-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

While gdbstub64.o is already built once, build it as
common object, reducing target-specific set in arm_ss[].

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Acked-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/meson.build | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index e56fc943bdf..5376be2e3bc 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -11,7 +11,6 @@ arm_user_ss.add(files('gdbstub.c'))
 
 arm_ss.add(when: 'TARGET_AARCH64', if_true: files(
   'cpu64.c',
-  'gdbstub64.c'
 ))
 
 arm_common_ss.add(files(
@@ -24,6 +23,9 @@ arm_common_user_system_ss.add(files(
   'helper.c',
   'vfp_fpscr.c',
 ))
+arm_common_user_system_ss.add(when: 'TARGET_AARCH64', if_true: files(
+  'gdbstub64.c'
+))
 
 arm_common_system_ss.add(files(
   'arm-qmp-cmds.c',
-- 
2.53.0


