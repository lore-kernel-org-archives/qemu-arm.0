Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE97C9830D
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 13:29:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9N00-00042Q-I3; Wed, 23 Sep 2026 09:27:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MvT-0003wJ-Nu
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:22:20 -0400
Received: from mail-dy2-x10.google.com ([2607:f8b0:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1x9MvR-0007gi-SE
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 09:22:19 -0400
Received: by mail-dy2-x10.google.com with SMTP id
 5a478bee46e88-32ba4885063so579757eec.0
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 06:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790169726; x=1790774526; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=4msTpp+vR3Q9A3d1BOVyjzK5nl0nVEODWOwLdHYYFFk=;
 b=oRShycYaQIBjNVeL1tE336Am0PG1OYDrYg9UQIgxlr4/HwFELCpXppIeAEI3uMyuc5
 244H7SLPslaCLLvIE1KfLWvYeQ5NkdcK2P1Wx6KhkDUwsDPPjcJRGXWDYaIIgqccZJwy
 TzzyqLj0Ia9Mnk2Y2MISK3qYNFTDfOygu65cjNC9SHNACoOoq8u3U1f2m8FSxJznFKqp
 zB6lzRjEFWTpVJy3UU10S01tgBZOcIA7YKm/L5OrwCCUJ1/Jx2DgrE8aywRUvSkhfdw+
 KXz1uFItxCIQCatdwfaKUWR52Cb4nE8vO2xrO8mNZl/vcmSvqDkahnF84ukn93oqTrWc
 QeQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790169726; x=1790774526;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4msTpp+vR3Q9A3d1BOVyjzK5nl0nVEODWOwLdHYYFFk=;
 b=oV5Hwj6sWAeNg9R/2F+HBufh93YnXtm1gyPbFIo6AKgm8lee21qZ1AR79MgBwImnjS
 0dikz3sDotbc4RSoDY6juTglz0bBxNPR00IYh28EbCj/Qycg1cP7RkjsNSLXWiF5zwRE
 Ayt9UQv/LJ+K+wZxAQ2n25Hq2IlEgDP8/CruhgVBnTeTNUPlh753Om9UXVXliSV9Gyk/
 y91lWoQaaSy3XQUTlPOLS6KVYeGo6BrPlAjI2fqKC/kE9IBj+NXGhGlr7qRFjYpUmR5K
 U1Ja3J2qByriC/P1r+ucsVfWUydeCk4mIXvnOEQUUUnz85ti1o3qJ+MMxLeg4uyUhL4N
 jsSw==
X-Forwarded-Encrypted: i=1;
 AKwUvBzSFFyPNMUAo1XTxA3+lINA52GEFEjy5uscbmX1cNtq0FBAE9KoOSMlaJerKNXsv1RKLwAMKX/m+A==@nongnu.org
X-Gm-Message-State: AFuF++nEDggDha25d66Cj1kqQAA3IDWECQjGNelZ+ViF+m7V9qRbPDop
 VOUYXySbePMZkbEwEKch4f8FmC923yMFuGwyBg5OrKE8mGOWHfobUbrA
X-Gm-Gg: AYBFou3NFYDcGWqvJLoZquiU7jK+Yel0mF2VWlCNNQQrrPEY7mcYZQR7IcXykUPUST0
 7vDfJ6RJIdjnHbXm3c885aXTwwCR8fuAPJUurDi4ulUPLlG0ngF0VwwsxrQy1HH1GG0o5LBc/Ia
 97YLM7aiQcEbPq1Smwcyfsg0LNWmIIRGuPjG5pbUDwM4cC9TQbIX8MhU7I+16EZqUwUn286bg0v
 P/ILJ811vlE+IQqqfJdtwPa8qeOTTdBZT2lScvVbm820YDGLnF9G/6n43DVMqFjtdrMfhZvkR/q
 3a1RMYyj65cG+gulMaQgd3qoav5Wa/7aRPyptAl+wpexO5oR3tZT5fc7ls6VMJM8CdiuX6Ev1jb
 2fzJLGcX+UmtWFCQllOsGSdl6N0jf0ITl2kduKe7emcW5szdGx2S5nI0JW1kIF/RlEzpEeydmr7
 W5qKfT0JgQUu2YSX/n2edFOFj4g57KruwkiLlDYhF2wezZnlkIRPGX7Vqhq2Cu7mYM7+HfLXEmt
 rgwjD74wuqHFKUkz8bOsDq6RHNEbRY=
X-Received: by 2002:a05:7301:d595:b0:33b:e55f:68c8 with SMTP id
 5a478bee46e88-33e8d8d21e3mr2659104eec.26.1790169725708; 
 Wed, 23 Sep 2026 06:22:05 -0700 (PDT)
Received: from WIN-BH9M8FJACR9 ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 5a478bee46e88-33e97236754sm5553695eec.29.2026.09.23.06.21.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2026 06:22:04 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, xen-devel@lists.xenproject.org,
 Chao Liu <chao.liu@processmission.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Peter Xu <peterx@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Fabiano Rosas <farosas@suse.de>, Xianglai Li <lixianglai@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bibo Mao <maobibo@loongson.cn>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 David Hildenbrand <david@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-riscv@nongnu.org,
 kvm@vger.kernel.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Song Gao <17746591750@163.com>, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Brian Cain <brian.cain@oss.qualcomm.com>
Subject: [PATCH v3 031/114] tcg: fix off-by-one in helper extend-free assert
Date: Wed, 23 Sep 2026 21:15:05 +0800
Message-ID: <20260923131635.1894-32-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.52.0.windows.1
In-Reply-To: <20260923131635.1894-1-luoyonggang@gmail.com>
References: <20260923131635.1894-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:36::10;
 envelope-from=luoyonggang@gmail.com; helo=mail-dy2-x10.google.com
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

- Allow n_extend == MAX_CALL_IARGS after filling extend_free.
- The old < check fired on a valid seven-argument extend.

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 tcg/tcg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index 489df0e7386..6d55cc284df 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -2599,7 +2599,7 @@ static void tcg_gen_callN(void *func, TCGHelperInfo *info,
         QTAILQ_INSERT_TAIL(&tcg_ctx->ops, op, link);
     }
 
-    tcg_debug_assert(n_extend < ARRAY_SIZE(extend_free));
+    tcg_debug_assert(n_extend <= ARRAY_SIZE(extend_free));
     for (i = 0; i < n_extend; ++i) {
         tcg_temp_free_i64(extend_free[i]);
     }
-- 
2.52.0.windows.1


