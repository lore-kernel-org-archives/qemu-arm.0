Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0096CC5DF94
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Aug 2026 15:25:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wyWXw-0005W2-4Z; Mon, 24 Aug 2026 11:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wyWXt-0005IH-44
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 11:25:09 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wyWXq-0007Ai-D8
 for qemu-arm@nongnu.org; Mon, 24 Aug 2026 11:25:08 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-c20e70a0962so546242266b.2
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2026 08:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787585104; x=1788189904; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=pc/GOaaPlMM8Rx6IwwNSVab3AJ0ESXz+I20bcOy9tBo=;
 b=jEnYjZ4PTL191QLfr721KUEkIoooDsPk+No4e7QmOL6Na6YS8pLtBt4zUNxcU/zgLR
 RKprX9aVEy8MR2H1/XaM4YTb+hcz0XFDc1+8gqohdp+XFLsVYG9wocOkmzA0my9YlwuU
 rlhh0oPVhJd24Ox94juXl4/AvBz+OqUtpXne/wbL+wddwDltXPLNcmUqPU1ATmp8j5tU
 l+tM/IcJDaslmEaLz7YbJw+HRlsyrIWAdoSbcmhtwc6gpYHS3cphK52Ylw90cLbNggal
 0JPdXOhce1MNhvo17IRfS03OsuHrnKitVFIpt5cYpMsFAh8wy4SYtqDfbTrucbu/0UEW
 PIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787585104; x=1788189904;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=pc/GOaaPlMM8Rx6IwwNSVab3AJ0ESXz+I20bcOy9tBo=;
 b=SXD706Gy2AeSNQ1vy2UINaRJ0BFbokiNpkenZJ4IKZJx2fO4IvrxZ/Lr0zYuSviN4B
 AdOk4iD3qchJ0MUVTomu64nkTAtt1z2s5ajGo/spVRWluE6attsFhvkIYszRhrkAc4Nn
 6khelOObvXwxRgYoY+2UGnb9D7GMasElHMLz3NiQgtcDkj6p8tlxQuB4kJrGsxO0KkQQ
 UEyc8vtVg2CkHATNdN9L5L9kR0Jmo9oTivhVZPx6QDxGyPM4FP2D4N7cheQ4RDDIhyRX
 vuEW7RJ9SJ3A/V5R1FQp9kgiYDt2WTi3mT9smy/Cn/tAHPJZbB8xV7QIKUVtF8rcKFzT
 3w6g==
X-Forwarded-Encrypted: i=1;
 AHgh+RpJRNDfpgGOhJ+cm3AOS0a0d5Ufghr0O9TBsJjFM3IXhgEwW7dKUsHdGUQ6LphiT9E0NPlsFQS5Cg==@nongnu.org
X-Gm-Message-State: AFuF++kB4fsS1YxXSO3nUuA7z/6UorHnyTNJpOh0DOTxBtfFl3DAhDIJ
 9pU48jT8gWIrNfwqq353Mzh+RtsGofQhl4OF7q0sFqAZWL6FxWUcQnqOC/3oxzhVMng=
X-Gm-Gg: AR+sD10r7ZcORv5rDSbv93rPbpV+albsk31p8QbNBsBCL5UMtQ0QoCejtul3ga3Asny
 ivactLQvU13CNf5H991nmHZ0BaIhuv0WfxfahRzNG5IOrgYaLSM6Do0BzAIA2gK5r4PJS/Lu69v
 XihjatQ6WpQSe+IWoEyiMN+kbqr4duUtaN/SV1eDmW4z46Q3lM8ZuATxGXoJzB4iDJaWO11x25I
 7K7btiJICNaHAXwlmsPcn6wWTEyndM0lDlDXWeInG2bXYWbi5rEjpqlRfkDydG3UBq7K083z79G
 ZsEx5I8p1jGJXIbwqKnbsPiXSY8cQJZNrZR41LdHuSwOQfR4TDUKdZBmymaHQfibPQFF0H5kEJ7
 P6WoWvyrtqr3t0WLci5Y2VSjQiMyX2/sMGcX6JvQEzIowdDeHo0VvHcFrGJt6LE1we7vPMZUP8F
 X4od0E/XYTPpljpXCkqZ0l1eW2ry2YJHCt2OJwJVlVjT01Y0KUlSrNBq7j+U+t
X-Received: by 2002:a17:906:6a25:b0:c16:12ff:dc8d with SMTP id
 a640c23a62f3a-c246a69a22fmr3123468166b.14.1787585104127; 
 Mon, 24 Aug 2026 08:25:04 -0700 (PDT)
Received: from draig.lan ([185.124.0.156]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c249606a8fasm1465132966b.8.2026.08.24.08.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 08:25:03 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 608875F8FD;
 Mon, 24 Aug 2026 16:25:02 +0100 (BST)
From: =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Mon, 24 Aug 2026 16:24:49 +0100
Subject: [PATCH v2 2/8] tests/arm: add explicit CFLAGS for system build
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260824-fixes-for-11-2-v2-2-352c6b890402@linaro.org>
References: <20260824-fixes-for-11-2-v2-0-352c6b890402@linaro.org>
In-Reply-To: <20260824-fixes-for-11-2-v2-0-352c6b890402@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, 
 zhenwei pi <zhenwei.pi@linux.dev>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Amit Shah <amit@kernel.org>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>, 
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, 
 qemu-block@nongnu.org, devel@lists.libvirt.org, 
 =?utf-8?q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1369;
 i=alex.bennee@linaro.org; h=from:subject:message-id;
 bh=MJWvive3XIw267cYiTNdmu4ac2myJrVPkfmdAGEdR0E=;
 b=owEBbQGS/pANAwAKAfvQ2wlanipEAcsmYgBqjGJNIbE5WMJ4v7LnQtMv6FVYwlBxKdGD0QOOr
 x5YJTvxZAKJATMEAAEKAB0WIQRmha6Z51FnvK/I3zX70NsJWp4qRAUCaoxiTQAKCRD70NsJWp4q
 RBChB/4jlOMnCgcSpBlSGkJ8E2S+1E4zQgaNj9Dp9pVaknv9fjSpt4gEPBwdPiMppN5Q/4ownut
 0nmoS6j2OkprCTeJ8J389Fbi7D7GhNumamKmg9hoTXLHY0h6RCQc7tOyMozOkYbOPmWidfuOGaj
 HxBo5UmWCHFNT0MkjNhQdOykjSbm0xiXGxkUJNuR+rdpH6yEa6FMp0iZv3RVlQOBL3kfUjmGXd+
 DZb5FlsY4+SKeEzobakfTvblv9rdONx0ZcwRwZfTXa4EOubjCtOfiB9YIoxI478TSjdEkP8Oz2S
 1jTTnMLav2My3A2UbToPtIfySi4+oN/lEYfJA+Urmzp5qnsM
X-Developer-Key: i=alex.bennee@linaro.org; a=openpgp;
 fpr=6685AE99E75167BCAFC8DF35FBD0DB095A9E2A44
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The brew toolchain on macOS (arm-none-eabi-gcc) is a little different
from the default on Debian (arm-linux-gnueabihf-gcc) as a result it
defaults to an older architectural baseline (without isb's), assumes
softfloat and will get confused by including stdint.h without being
told it is compiling freestanding code.

Make these all explicit so we can build arm-softmmu tests on macOS.
The test-armv6m-undef is unaffected as it has it's very own build
stanza.

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Message-ID: <20260723200904.224413-3-alex.bennee@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/tcg/arm/Makefile.softmmu-target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index b66074b0b43..3e8a9b4073e 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -29,7 +29,7 @@ ARM_TESTS+=$(patsubst $(ARM_SRC)/%.c, %, $(ARM_TEST_SRCS))
 CRT_PATH=$(ARM_SRC)
 LINK_SCRIPT=$(ARM_SRC)/kernel.ld
 LDFLAGS=-Wl,-T$(LINK_SCRIPT)
-CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
+CFLAGS+=-march=armv7-a+fp -ffreestanding -nostdlib -ggdb -O0 $(MINILIB_INC)
 LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 
 # building head blobs

-- 
2.47.3


