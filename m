Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3531AEA8546
	for <qemu-arm@archiver.kernel.org>; Sun,  8 Mar 2026 20:36:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vzKqb-0007HT-Tk; Sun, 08 Mar 2026 16:35:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqZ-0007Eh-Ph
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 16:35:31 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vzKqY-00044y-7Y
 for qemu-arm@nongnu.org; Sun, 08 Mar 2026 16:35:31 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-439af7d77f0so6901384f8f.0
 for <qemu-arm@nongnu.org>; Sun, 08 Mar 2026 13:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773002129; x=1773606929; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ht0en4g7BEiKReMa2mnsHtL6XNX6arYhl4MswHJxcl8=;
 b=T3A7DnVYpUPWKv8BLxTSpn2rKSbwjBUSn2DSsl/8hkOdJp2iHbP9bsbvnJaBaFuyED
 NukXIcMy3zVKFyHdKKGPzadPbdeCJWwSr4Wcel9vyG9jHocT8Idi8yfN5UhLTRYh3jIE
 gOumEg6jjl7VEsQqpe+h1ocvXoxasIBwEEdaKM4DXKb3z4mhxZ/EMAOe1e5Q8YBJiWnZ
 JFS8RJreryIqthrGEmfoxCPQlL5FviJNj7iGpTXMgEhKA4puuuAE8hoMH2hYq7ahX4Wo
 AlsQfIo6LTQp8mW076ZdLResI8XJsXRiqkNJV5zgPzz9wJGVHX0k91h6hKLcNDC0DmJq
 4tVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773002129; x=1773606929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ht0en4g7BEiKReMa2mnsHtL6XNX6arYhl4MswHJxcl8=;
 b=Eu4tb9Tdm5MWg1OS6zjaAeK29VU5/RvV4whVSAsqWaqWFyb9ktj/utyVZ14NR2NWmD
 dfJGAigBPpSe1rl8ll4yyiX8U7kef6DxqqY2i9F6cUu5Lu5AuKwEnXglk5UVRInNOT+l
 OkSEq3l55TxV1vHOh9ebiPiFkUnRyoduRxaqlJdYLyaANOHtrYVz38Ev/LjjBVanEOo9
 oe0WqWeOOr8LckeiH7n5ao4IllomVOU4YkZjBRc1hYYD1Dkm2aANIe6Qj/Veu1KsYXVO
 0GqQ6XftbgTTNpHgZjkVIOgV7lgsOLHo3fy3qLotCHyl/WhxeaaS/8B1uYdNuMpvI8LV
 l0qA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKr0cbZ4Gspm5dvKSAaQZBS7P4u9xoXERDWtIGHGotRv43/9vIqv63MKu/AbwcGWZTN6cB5sQ1Ag==@nongnu.org
X-Gm-Message-State: AOJu0YwWu2P7vdUa5cAA8dY/vuheFIfN2+O9Y4CbIvYbBNI/TSHw7UJu
 UBZvHrnh3PxqtBoVIEmtw1hXlAYLY0FBiQDvqZsNSah2GhgKh6qA05kD
X-Gm-Gg: ATEYQzwKkK2BsCC6hmuVnluLCCfv0U7znCTUoXfNnYMoKKlns4N6PVCoZ7yOXv2DyqY
 fe+04MCwotLhh5mC+IMDkXCvQ1X/u1zF7DVQCN2RrsZreWG4w/t3APR3F+bQFVnG0svIOhO6xFa
 3GPuOeFOm1oHZ0l0/z4QutOX4A3eyXYhkB7xA3zwyaCKGfg+YB6pJjlzKFD9iHsl2w2XpBlqPta
 W6IFXgZE/qMJQxRYGYNthgR/Tem4cnTXyC9548vmFM7OcJdklHjhYVE/WZzwOr7KvTYybE/X0AP
 seMwp/w0pfirSpvvGnAfaSXUvLFBtIccdxNWeRXbzYN36xe18vjyW3XttuJ59lrycXC42wCFitN
 pWgSR4uZpw3IEwJHmmqygWmJ8Y/9Ot2/rRYJN7jWtEb5g9c7q5XkjeKGCzp15Wsy3xnzJnfSU5D
 y5qBDT9NtVPPBEEindopNxiwXPiXYedC/aDh2Qs8ITmyOHTPGmTKsYnhPF9f2nJ4UlhjL4V4/BC
 Uu2D38aBSTLCbTiQeGg513Mrqt+HUE=
X-Received: by 2002:a05:6000:4210:b0:439:becb:6286 with SMTP id
 ffacd0b85a97d-439da87c5a7mr15185221f8f.54.1773002128422; 
 Sun, 08 Mar 2026 13:35:28 -0700 (PDT)
Received: from Provence
 (dynamic-2a02-3100-25c6-8f00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:25c6:8f00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae2bdf8sm20995508f8f.25.2026.03.08.13.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 13:35:28 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>
Subject: [PATCH 3/5] hw/arm/imx8mp-evk: Fix reference count of SoC object
Date: Sun,  8 Mar 2026 21:35:14 +0100
Message-ID: <20260308203516.160103-4-shentey@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260308203516.160103-1-shentey@gmail.com>
References: <20260308203516.160103-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

object_new() leaves a reference count of one, and object_property_add_child()
then leaves it at two. This would leak the SoC object if the machine object was
destroyed since the machine is the SoC's sole owner. Fix this by converting to
object_new_with_props() which gets the parenting and reference count right in
one go.

Fixes: a4eefc69b237 ("hw/arm: Add i.MX 8M Plus EVK board")
cc: Gaurav Sharma <gaurav.sharma_7@nxp.com>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/imx8mp-evk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
index b84ac91a17..cfc3038c36 100644
--- a/hw/arm/imx8mp-evk.c
+++ b/hw/arm/imx8mp-evk.c
@@ -74,8 +74,8 @@ static void imx8mp_evk_init(MachineState *machine)
         .modify_dtb = imx8mp_evk_modify_dtb,
     };
 
-    s = FSL_IMX8MP(object_new(TYPE_FSL_IMX8MP));
-    object_property_add_child(OBJECT(machine), "soc", OBJECT(s));
+    s = FSL_IMX8MP(object_new_with_props(TYPE_FSL_IMX8MP, OBJECT(machine),
+                                         "soc", &error_fatal, NULL));
     object_property_set_uint(OBJECT(s), "fec1-phy-num", 1, &error_fatal);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(s), &error_fatal);
 
-- 
2.53.0


