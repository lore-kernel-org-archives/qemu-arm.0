Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC3CFC982E6
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:51:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lsP-00071M-1D; Mon, 21 Sep 2026 17:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8lsA-0006hg-VM
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:26 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8ls9-0000Pa-5K
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:26 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e71cdb22bso25999065e9.2
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027294; x=1790632094; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=zV++aD4uHP4QG4HyYObNt6nmUUhVFuY4aARPX6yJf7c=;
 b=ktuXPZqbxt9NjMfjypF9IAPDFm5c+jsaaYxeNdVMlb+Gy9dXGga76ATIwgiVevQiFW
 KroRSDR3YGbQyMIBYGRrau20PgzXBvLwukdS15PeeAvFO+MK71ELD7QUXm8buLw50xGK
 rDCyZRU/tVUWuQuIgrXwWo2K8a2EhUN8SsztTAqsWwDou6eOly+7MpHOy/w9PmxwJ2UL
 k6/JXsRf4nTpqI6jsdtccCypcjgJsquwwcK6nOVXWxKt903tPdZbzHIYftPx9+FTEe70
 n7V6JdP4yHzRkyG/9BuQHQu+vYhgSr3yNLDssJDeyGVoZIvarVccbkYRoiz61Ll8Wu1s
 N9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027294; x=1790632094;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=zV++aD4uHP4QG4HyYObNt6nmUUhVFuY4aARPX6yJf7c=;
 b=xHHDx40nH37W61pZnoCZCATaT/6/f53K1PeakmGXPewVFoDge5uEWQlBQIxC9bg+PO
 n2vsiiuDTP1wD5Ur3RNZwtNnMf7a4LSsPI6iQ0sHUKGyJlHLHxBc6wzA+dkZXrhOrskc
 sRCRggLR+fQdN7QVxLa0Jdqg70zXf3j2d2nTEcwT+EKxRJVUyRsR48lHsvA+q92mjPzB
 /Z9wpXKFy2DbJx6cg1jSQ+me5ZhAvZ3N3oBKQLKBNlsghZHyZyeXRcgh7MDw8KLFsd8x
 7LWcILbNqz+fxskznquh7uZ7Kiqq13hM//WUag5XBsz91Xou0aq5dFFNbrMCQazvl6DB
 58Zg==
X-Forwarded-Encrypted: i=1;
 AKwUvBwQJnZSssQovlajrVWSzg2GsWNrw/Q+51cfBAZ7IDSpG20buL/HNAgTTtKpk9ZY8D5l1BwE3XM07g==@nongnu.org
X-Gm-Message-State: AFuF++lkHKhF1W9OPTKkzE5pkgbeu3PTHPGJJkyLbSS54SiNApYZzNR2
 ejHUk63hLRF1SoJdk7yqQko7srn0asrzslzQ7TI7kmYvsrtPMqlzKOX1
X-Gm-Gg: AYBFou0pZOHYLCfEGd6mFtYiRw4xsRmFPOARWAJdDYQZbQx0AylIQuBnZEW5cxxBdso
 hNsATeXU17ocd9dgH0c7X97n3YnyCw4hXnvvjikXBR+15azc/UF9rt5ktNaOPEXJ2MUAxgVgziC
 7cw7U62bSfJdUieTMg0nWSmym0K0zDB/r6cxp0URLW+JJAjhL9odlk36SPxep0Z/9BQe/vI1Q+Q
 ho6CaNI/+hlIqL7hyd8DEvwhhVwIb2Ugyat7bBmo4JUAycPEwMsXpoOaIMax9FNUXVW4m+aw+fe
 bBMr9XnhB5zkdoB7/LrXg/JH3+ne+ZtzAqGA0MyfEuMzeiOcsXOznYiXTSK1P/WPXqC1SY9LOYI
 1MWZ4uwPjsa0jyacqp4X8EQ9Nd/+vtjtjivWP1DBvAkPuCjmjhHVvKu0yRRAnE2qynJWL8fEYnr
 S+oWyjTS1l6pZjz6QmLFs3uGOwqrs0XhuRbNgA8qZVoyr0hCP/pSe17ySW5wnUrtxNITsK2dIxC
 o31H9Q8S85uqgv2UNq6FcFSGgtu6Y1leFrypiEH0nXkhDRv8++CPXk5GRNRfdUrvMGTmRCPGtim
 Sjs=
X-Received: by 2002:a05:600c:468d:b0:49e:69f8:e846 with SMTP id
 5b1f17b1804b1-49fc56862b6mr179989325e9.9.1790027293712; 
 Mon, 21 Sep 2026 14:48:13 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:48:13 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Phil Dennis-Jordan <phil@philjordan.eu>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>,
 Jason Wang <jasowangio@gmail.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 35/42] hw/misc/imx6_src: Avoid casting from void *
Date: Mon, 21 Sep 2026 23:47:03 +0200
Message-ID: <20260921214710.29422-36-shentey@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921214710.29422-1-shentey@gmail.com>
References: <20260921214710.29422-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:31::11;
 envelope-from=shentey@gmail.com; helo=mail-wm2-x11.google.com
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

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/misc/imx6_src.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/misc/imx6_src.c b/hw/misc/imx6_src.c
index 8d2c4175e4..5bc1318f9d 100644
--- a/hw/misc/imx6_src.c
+++ b/hw/misc/imx6_src.c
@@ -89,7 +89,7 @@ static void imx6_src_reset(DeviceState *dev)
 static uint64_t imx6_src_read(void *opaque, hwaddr offset, unsigned size)
 {
     uint32_t value = 0;
-    IMX6SRCState *s = (IMX6SRCState *)opaque;
+    IMX6SRCState *s = opaque;
     uint32_t index = offset >> 2;
 
     if (index < SRC_MAX) {
@@ -150,7 +150,7 @@ static void imx6_defer_clear_reset_bit(int cpuid,
 static void imx6_src_write(void *opaque, hwaddr offset, uint64_t value,
                            unsigned size)
 {
-    IMX6SRCState *s = (IMX6SRCState *)opaque;
+    IMX6SRCState *s = opaque;
     uint32_t index = offset >> 2;
     unsigned long change_mask;
     unsigned long current_value = value;
-- 
2.55.0


