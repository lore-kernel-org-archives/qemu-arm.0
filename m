Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DD3C98328
	for <qemu-arm@archiver.kernel.org>; Sat, 26 Sep 2026 07:06:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xAMPT-0002Ap-R4; Sat, 26 Sep 2026 03:01:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPQ-00029Z-GR
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:21 -0400
Received: from mail-dy2-x2a.google.com ([2607:f8b0:4864:36::2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xAMPP-0000PW-07
 for qemu-arm@nongnu.org; Sat, 26 Sep 2026 03:01:20 -0400
Received: by mail-dy2-x2a.google.com with SMTP id
 5a478bee46e88-3437a48f386so61111eec.3
 for <qemu-arm@nongnu.org>; Sat, 26 Sep 2026 00:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790406077; x=1791010877; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WjKPIsB7XPfjiOJv/P7w8oTcFul76ata5y5bWuKERHA=;
 b=K41XgtDN1x3gaHo++yHEnC9AeaANzJKHb9w0mQ3b9KVLub18iGK9anbWA4/E6qUjqI
 AZJghq5mnB3vuqrPZV6wfNGlJzaGLkqq+X3UsL2JPva7yR7Rafi11ty3vRUHg5hSSyUN
 VpJR7VX1y8PDOGGcLQ+gbCu0zhxaZ+dEMmiTxjSfTfqW4/xIgdW3pnnjLy66w6nz81Mv
 LYHDvkBSsjB2pO7odrebpUIDht+ZVzsy/5DlM3jo3Bgsw25f/HVofKqeNEBmThFvbofQ
 KaY182ybWBoFwskqn8XkBNapwmBSA1coBVsACNbTRL1a3nuVFRTzgFszGfHD/9pe6qzj
 UtJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790406077; x=1791010877;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=WjKPIsB7XPfjiOJv/P7w8oTcFul76ata5y5bWuKERHA=;
 b=J2eiNyVhdDxZ6EchE3k1MZm22Mag9L4iNu1rmVIiNSGgOrZ3/UYW7MezXS0E12eCcl
 JgsA3tkFx/k5PJIoZ5DwY2SRyHlzFLx5VwoVWbMv0qNWBBMzrymoC9MkVFEy1NgtHLMg
 XcMhPljAxHi++ZBLIMpEy3oC2DjljfdiaPGOF1l6ChRynRJmyXxQRqxk/d5V3cdEzQZa
 5YbU/GB7a9XZUx+zoLtAPIQ8LLX4JtEwrUmfYxw2h/pes1oLNKso3S+93LZsxvZW0/8N
 7A5USWEeBwppKhB7Qt6TtoxU0lPdzNWwjIeNTdpEOlriZK99BjFTCuoFtzKWuAWWgqPQ
 XWOA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy/NajQXE7bbUJEfxy27orfSaYLtZY3nq+Z3mwze8LZ5fczrpgvV+TpduqFKtI9e64INvKK+iqEBw==@nongnu.org
X-Gm-Message-State: AFuF++mhetY43KKAQ8ly6pf5icC5sUO2kH4BHMaR9voKQoynaI9ncpKW
 eGHOfLhRGwKXqoAFz67SJQSM9hhPQ0fTdi8xg5JzJxV4Z/Tr1HnrcrVG
X-Gm-Gg: AYBFou0BbUEIWWTXPkTRYj6TTrAT7+WJ6sN3C1DjGPclxTaH0sw88UCn+oUirKDf0tj
 xKLc6m2jOKcP3NDVQhjSHKHbhH+/BEM5q9FGXAz/hkrm1T6acH8aZj/Tg7/SpIlqKeI/yAhGVW4
 8EaO0kuI3Msou4zyQaARAHH6D/PM/tVB984zONxS/7+qVz0nZierue3JPcTQ3so8q7Wkknl37Ln
 5lxTwHuT54CRJVltgThjBP9E6B2/MAgKY6hI5dYC4z/GiZWjcUK/hxiUzDmhpnxFb947SylYnSt
 Fzbiyn2vIN8rox4Mqze7WWRGBu55srZn59k95UURhRIzJ/HsahKByLpHMqKVEJcoPbdmc1dwzEe
 qYt+wKYqEFelK/Jtg7XidLiU5oIHSxncZEUvalvvyb+ymEIc7S105FZZ6F06mZjMdzvis/PB/kp
 U0K41ZlwK2HC33TbmwabyNAvp8ZWjYFZqnHiJFma/qR6hG+8jj2HILH1oJIeMikFZ2BxR91mWCc
 +vsqoIuEREK7jtLaKXWp1pOe0VuRJ4=
X-Received: by 2002:a05:7301:712:b0:32d:205e:31b1 with SMTP id
 5a478bee46e88-342705b8903mr2066052eec.3.1790406077527; 
 Sat, 26 Sep 2026 00:01:17 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-34145c166cfsm10615141eec.28.2026.09.26.00.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 00:01:16 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v4 03/55] target-info: rename target-info-stub.c in
 target-info-def.c
Date: Sat, 26 Sep 2026 15:00:02 +0800
Message-ID: <20260926070057.1234-4-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260926070057.1234-1-luoyonggang@gmail.com>
References: <20260926070057.1234-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::2a;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Now it's the only file left to define target info, we call it def to
make the intent more clear.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build                             | 2 +-
 target-info-stub.c => target-info-def.c | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename target-info-stub.c => target-info-def.c (100%)

diff --git a/meson.build b/meson.build
index 732f0a885ba..51bc0905294 100644
--- a/meson.build
+++ b/meson.build
@@ -4330,7 +4330,7 @@ foreach target : target_dirs
     endif
   endif
 
-  arch_srcs += files('target-info-stub.c')
+  arch_srcs += files('target-info-def.c')
 
   if target_base_arch in target_arch
     t = target_arch[target_base_arch].apply(config_target, strict: false)
diff --git a/target-info-stub.c b/target-info-def.c
similarity index 100%
rename from target-info-stub.c
rename to target-info-def.c
-- 
2.52.0.windows.1


