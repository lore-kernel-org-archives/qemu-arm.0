Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C21EC982FA
	for <qemu-arm@archiver.kernel.org>; Mon, 21 Sep 2026 21:49:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x8lsB-0006jC-W3; Mon, 21 Sep 2026 17:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8ls8-0006bk-Fj
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:24 -0400
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1x8ls7-0000P2-0k
 for qemu-arm@nongnu.org; Mon, 21 Sep 2026 17:48:24 -0400
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49d097b4939so18382015e9.0
 for <qemu-arm@nongnu.org>; Mon, 21 Sep 2026 14:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790027292; x=1790632092; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mFfNlCTxXkztwKYCkDn6NKboOwUdQfG0bLFi45cKBWE=;
 b=d9jC9s1AJUVbCq2ZPQO4wB0As3g5gAABZHGcrNr57IWe9sYk9odKHSRmF1haiCdSy7
 q3HeCFjEcb11p5P33kywqXplfCtZsooMpyGn9S+lg+hzjEZrJ/6NgLEL+dsqYHG0o5wV
 UpnQ50+ptCvhN3VEbP1pia41LNl9DhFIQxL3A+pkA6dUVVGbBTO687KBMAAVF+zqFdML
 00OaRO1jZsW/6NHuTl8BVWhwqbsNTd94TFGnur7xbDPP0T4HWaTqSpifR8sLjHIdiD18
 behyaDA+SDsFm8b9t8AfW25r3t9LH7kkzagOuzvtGxsnJxVrHUPEj3D7r3BWlubHfGX1
 s8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790027292; x=1790632092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mFfNlCTxXkztwKYCkDn6NKboOwUdQfG0bLFi45cKBWE=;
 b=HDSAUH5X8LLm3Tp9bBu4bKXzBE13KxTHPjZhC1gIqsnGw39qPzWs5AnF2aETD6zGZ9
 3Zgf+Z/tDLXTAumpdOFFIvaX9yvicDfDnzrf4xmVn1yjdm0I6+rb/S2JmF6FOZi1BI8o
 wQxxcuQyWZDXuPIYB0ktu2aHOSZVMx0sCqWQxiTPlF3gDqiT66U8vn9jTmh0fHz3qWuy
 oyMOlraBQ7ErfonYXlZqxak6BoH9po9m5RCFBzm9UUN/srh/0YLj2859oLUGfyiiaEIy
 oZDhGRGFKiRVT5CMleYAImpz1PVuPd1d+mlqMD7hvdnZ8sXB//JA2tdCBkKxFzbhN2Xg
 S+yA==
X-Forwarded-Encrypted: i=1;
 AKwUvBy7PJVvnxW/idxbbXZ7wGpla/GvkjEBVEciCvWljHPF+YQOErkOdem7TQpAMQ1qTdHfbGCGgnTyCw==@nongnu.org
X-Gm-Message-State: AFuF++n1rUF+xEPX0pEV53Ih3ZcjKn67gnKW6YN0LvV7CivrhdFdvGKp
 9kscha2jnDj0rx7J+K8AFGemnHcv7hec5BO66bF0Zf91Gpa+8IrSBVK4
X-Gm-Gg: AYBFou0hpKgRZFI9tcM2gUvtOTigxR3EjF8NMmnBYTcNaeBcjZDdIMSyaHftH6DsXuj
 iju1mOcqrV/Q9djFJh8mV7cf5h2bUxcqM43uB4aZZQm4iy6NMxn8GzlY7wCbyzMJIp+GI8w+WQR
 h+05NGYBGgy7z7XuwLH/KQoF9L7wqhbrS88Q3v41rV8ZbUXYJIbEv0Duuy7kNKXz/1b1d5RF2m1
 o8cp6wlpErBuKM4Kii9/nuUKiwHWWta+01t0BNFVBkQnKiTnL4bCoNfl6nMex16jcZVf8mZKCqm
 ql+KZmY1mYxmw9/Dc3XkxQg9xnLjueRajVw/s0AM64R5hyZw2Cs03jh5pi/FMrdz7hY7ubRkPjB
 1Bh65D+65qY0L571R+TqsV3fIAgp3iMuiC6cLiFEFbVtiJASzLwvXgHHwbvMQOfXIpReumm2DTN
 6EC5b+sGTK5jWnFvzzLViyEwSPQdcbQjT9G+Llg3U6C71I25zzK8PyzFun9xHC7DjnMH/zMoK3U
 DxRdTNdkk9+xHPZc7Ii0mQwar+YzmQc9dz2z6118f4BEWI/KSfeMo+NVV9Xptqm8Z5uewWNcOvG
 vR4=
X-Received: by 2002:a05:600c:34d0:b0:495:6e68:5df2 with SMTP id
 5b1f17b1804b1-49fc56ef520mr167751315e9.12.1790027291544; 
 Mon, 21 Sep 2026 14:48:11 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-1c91-bf00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:1c91:bf00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fda0ce29fsm4986905e9.6.2026.09.21.14.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2026 14:48:11 -0700 (PDT)
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
Subject: [PATCH 33/42] hw/vmapple/Kconfig: Remove unused GPIO_PWR dependency
Date: Mon, 21 Sep 2026 23:47:01 +0200
Message-ID: <20260921214710.29422-34-shentey@gmail.com>
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

The config option GPIO_PWR provides the "gpio-pwr" type which is
currently only used by the ARM virt machine. Remove this unused
dependency from config VMAPPLE.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/vmapple/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/vmapple/Kconfig b/hw/vmapple/Kconfig
index 2382b29767..b8aa7d8eb0 100644
--- a/hw/vmapple/Kconfig
+++ b/hw/vmapple/Kconfig
@@ -25,7 +25,6 @@ config VMAPPLE
     select PL011 # UART
     select PL031 # RTC
     select PL061 # GPIO
-    select GPIO_PWR
     select PVPANIC_MMIO
     select VMAPPLE_AES
     select VMAPPLE_BDIF
-- 
2.55.0


