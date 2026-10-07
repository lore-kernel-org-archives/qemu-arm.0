Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E70CA5FFF
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 11:55:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xEQD8-0008RK-6F; Wed, 07 Oct 2026 07:53:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEQD6-0008PC-3z
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 07:53:24 -0400
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1xEQD3-0007xD-0A
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 07:53:23 -0400
Received: by mail-dl1-x122b.google.com with SMTP id
 a92af1059eb24-16079d54c17so678003c88.0
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 04:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791374000; x=1791978800; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Abt7nJgfsy9RgUBd+yxg0ugqnqkJvrdlXYCqWBP2u9k=;
 b=ovxGsKEy2ZUJvI6cVOxr8+MJNld6uEWaZ7WuU9BGfODLpmrEjHsgZQFOxyfsWQh49c
 I6ND/m868eJGWHPpBtyxH5uNRL/BbYWCXuaQKW2CTNcAisZM+mUfEmesWZnm2Mlg7CIk
 1O+R14f3733NWITOilxH7Xif4EfualsO2j9vEjMFHsXcsAQq3hE+b2mLsTCZMfN59qH1
 WY/xa80qOgTlAXe8yPtxU3jJBcGGvKeEECORlBAnOcUeuNv0wJEGNtla0f561xLYrz6a
 47Ncn43nTx1GjTeNxNBbUsogT+SKe3tjDtkgev/lc5DB+T+uj0OMUvlLlhsWrnhXVt7d
 1ydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791374000; x=1791978800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Abt7nJgfsy9RgUBd+yxg0ugqnqkJvrdlXYCqWBP2u9k=;
 b=ZDJbxakw+DXj/UVnrTsz0gFfSpOqsPAO7Y4UjWuThS6LF6N4gXp61FAwDAugdgY2qq
 Ynaws7wpa7KhpOyD/jNy9cSow60eTPTNaxX5cbAFXAkrbcmwVvqcpNXGdRtQOZPCei/x
 zjr8rbu9D5H5yLlLdogQxyhL7QzZ1xCvKYbb/9Ns4QtdRoTlKkdBmmvg0272iD15Y7yu
 EO2fYYDsVvoajvkgkQcl2fbryECOUV3QJGyOiyx1rGPeJ0J9DOY2fBo5YxbL/aKvDu2g
 zKSAoJ0atzGRWF9hfgn6Q8s9eBs3ZfUO0fuE1R2qUIBvEsEgEUaSXj4J+1x43cSTcl+e
 6/0w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzAzqaSqAI+5nGMthzkJe6JmsA7vIHiRdCeFPbOuQRzDUCG+mOIwXI9ZF7+/ut+SXaF17NFk2hdpw==@nongnu.org
X-Gm-Message-State: AFuF++k0Ryf64WprZA123YqEFkl6cOUyHqNh8qPCImTxNXF3mhiH6w9z
 rtMIEuCEnkiVUnu0u4+In+koF5cnhMh/91kHXH2F68vT5BmZ5oKCg88f
X-Gm-Gg: AYBFou2H4xAP848QfkHVWOiHPWNbimHsgJR0SbWbGQ6r3qZ5Mv+0fDxCCCIQ3sMoODW
 c93NIyN9TeKxG8h6FAXE7cMG0EOCQ62Ib8xR48h5lCO9zjrdOwJ4Vh1cdZf2eEFcRUJme9Z31Yk
 0xP2aSb9JSaBgZzJQM/OtyBl7rl2R1JAkEsFApRCc/y0zkVUd46wUft8ZwjDeCmFIVeVpIn/u5i
 midUVDIWQ2Gg2gVKKTFLvA+7wBbWmcfpAcUgaYyZ4mg/RL9c0NKPcnjZr2J0spNLjPq0lrPE17/
 m3PL6It9qw+GjnpH8+QngjAuEZ7mKD7/Wsr+v/q/nN8SkOr7f7rnD2BvrNzWzd2BSTmlfOuR8Kv
 jJOgzoR5vH0hGZMm3s3ZW+oEKox64G4ntKi1aaBl72Q+EmUbTmnqtuN/pYFMa+7Kw3Kfhkv9YHC
 Re6VtaG41tALEL93y905biN2OlAwN3DiLF5/AnX5vBaMb7bkwE8dKSkrsL4HlgbFnou0pHv2vyK
 WWPEfYCF1GRAWlyoQ==
X-Received: by 2002:a05:701b:4544:20b0:156:1d8:7026 with SMTP id
 a92af1059eb24-1620a1f04dbmr1998101c88.46.1791373999502; 
 Wed, 07 Oct 2026 04:53:19 -0700 (PDT)
Received: from DESKTOP-Q716RM7 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 a92af1059eb24-1616980c3b7sm6429520c88.16.2026.10.07.04.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2026 04:53:18 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Laurent Vivier <lvivier@redhat.com>, Zhao Liu <zhao1.liu@intel.com>,
 John Snow <jsnow@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Stafford Horne <shorne@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Alexander Bulekov <alxndr@bu.edu>,
 Darren Kenny <darren.kenny@oracle.com>
Subject: [PATCH 2/8] target-info: rename target-info-stub.c in
 target-info-def.c
Date: Wed,  7 Oct 2026 19:47:59 +0800
Message-ID: <20261007115253.328-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261007115253.328-1-luoyonggang@gmail.com>
References: <20261007115253.328-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::122b;
 envelope-from=luoyonggang@gmail.com; helo=mail-dl1-x122b.google.com
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

From: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>

Now it's the only file left to define target info, we call it def to
make the intent more clear.

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 include/hw/core/cpu.h                   | 2 +-
 meson.build                             | 2 +-
 target-info-stub.c => target-info-def.c | 0
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename target-info-stub.c => target-info-def.c (100%)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 328e30045ce..ae66f5e33e3 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -601,7 +601,7 @@ QEMU_BUILD_BUG_ON(offsetof(CPUState, neg) !=
  * Return the CPUArchState associated with the CPU.
  */
 #define cpu_env(cpu) _Generic(cpu, \
-    /* We validate that CPUArchState follows CPUState in target-info-stub.c */ \
+    /* We validate that CPUArchState follows CPUState in target-info-def.c */ \
     CPUState *: \
         (CPUArchState *)((cpu) + 1), \
     const CPUState *: \
diff --git a/meson.build b/meson.build
index 64d3f7675f7..ac78c58cb91 100644
--- a/meson.build
+++ b/meson.build
@@ -4345,7 +4345,7 @@ foreach target : target_dirs
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
2.55.0.windows.3


