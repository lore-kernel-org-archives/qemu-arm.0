Received: by 2002:a05:7022:2383:b0:6d:30c6:dd9e with SMTP id bz3csp1170856dlb;
        Fri, 13 Oct 2023 01:55:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcV+yrW5usj6OOsNuhGSdID854pPzQ/RvM1Gzm0U5bvPXsikzfAaFUUXAcoKr4gkk10qL6
X-Received: by 2002:a05:620a:4008:b0:775:92ac:a0af with SMTP id h8-20020a05620a400800b0077592aca0afmr32359884qko.13.1697187344795;
        Fri, 13 Oct 2023 01:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697187344; cv=none;
        d=google.com; s=arc-20160816;
        b=oc//IWzRDpb3MOHBbqIgGi35YtHPJ77h1zmf4Qn/LcEgLbImxRPRkyhm4FLsHAdiWu
         53ZGW4fU3RIjOSZAah6SmKRcF4Y29eCVRiUAEC0McFCK4LUQSBpLfmHQh/7Rpp6SQDnH
         M6ZBxPTprkFS8W/yd+P6L4RHAMvL5JEdP1FO+ycInIL4Gq1N2oUry8gkqJRGURF7oyqi
         3cnPpx939tuG20dZo89ayaV4NXTjD5QgCvhN2GfC97so2p5ss5a/snOJbbkzaHPpF+Eb
         p1gUHJOFnpKXlIpFVaURqZYbTcokrcNz0jpHOfmYGRNsyVh3TIMxdrBhxldkL4VpCzqp
         lwoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cl281DmBBuKIqdhIrNfrN36TM+jchj7MoFXFzERONDk=;
        fh=NzSBWYzWXvfcD56ZpOos1hg9h9wc7xIOoGtDTwjwQZk=;
        b=ZfpWrWSxVN+v4xe5zdqFcJ1HQdk9KV96GhK0J7kpt6L5KCu3OsurIMHyDAbOh8F5qJ
         s3vfcH/v85uY07j35vhsQJWpKsfoV65mn/1e4P0/0NpTvN1TWEJvv6cKS8BCJ2ayYuOE
         81h+Hw5Nem0b2dIJ8+26lOP8X9uz0LqKPkpYm7pPZDdtELyKpOQtvQhfpw2Rfbh9FtNc
         jyb0cdpa4AIuIyeQfQYWjzdMT1K6dko2bvHWXpDiqrOPvDQw7zMSdHAWbN6KvbN5i45d
         Q8K+XIpjtIRM4Qbe1mf2P2qYFAxB+p0soZpWLBXPqEZ7PmbBPIpYQ6NbiDObPKHfSF8G
         +8Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EzfGpCrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs30-20020a05620a471e00b00775902632ffsi867526qkb.279.2023.10.13.01.55.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Oct 2023 01:55:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EzfGpCrX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qrDsl-00078U-8q; Fri, 13 Oct 2023 04:50:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDsP-0006Eg-KO
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:50:34 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1qrDsN-0001YN-Qd
 for qemu-arm@nongnu.org; Fri, 13 Oct 2023 04:50:33 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32799639a2aso1707656f8f.3
 for <qemu-arm@nongnu.org>; Fri, 13 Oct 2023 01:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697187030; x=1697791830; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cl281DmBBuKIqdhIrNfrN36TM+jchj7MoFXFzERONDk=;
 b=EzfGpCrXelaxjgqm0DluPazW/CzyE+SgerwHk26LzH8J8GMGLnP2LgTHG0EQBHm1ug
 U9W2K2npuSlcdUNhAFA5fpDEOeEf6PUKl7lgE6buXSm/LbG3F63FvRyzfoMe6OqaPa7U
 9zXIAo/ZN2KVi/3AMdpbYlwCrGyXr4NAQdNEjTKAHaoyy9V42jhQ8IXh73ac4G/V9FTU
 d4/p9HPLITBtyj5xaMDEjrRie6jRdQi7DqsruuO6p6Q3x6KBFSBZuTRiLhGNrC+usVAc
 0ZFcCGHs4iO5WQ6fIbZsPxf0JgtEe+LLXvV+Da9m88wArGHzMm1dzqiRuhdbPZBtylQe
 DFHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697187030; x=1697791830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cl281DmBBuKIqdhIrNfrN36TM+jchj7MoFXFzERONDk=;
 b=cj4I6BcIVzEPYjSIYX7QyGz+lxO9NTBwvfKtrSqQDSSUumDPw4t0wNOm/DdYhPbzOL
 eTPTzTkSwmqwS6WAEskDZi5fNIRlx8G3iIpjK0YjfPoYQqI6NEIgsm3nCQTDBgsD60eW
 D2oVkRAIMGpYQ8EGCi9pMl0GxAjLfcIhsgKdxcms/hSbPTEOqlhbNz1DbUKdu98mSe0G
 R1fEsg9A9bkCYlLgwVJU6GCSTfmKW90kIKXj9twcXa9GotDc2MRgPMmAIwsRYkG0eNEg
 x5F+17Cj5ppzBdIUR2UCCxvJ2El9unnldswmrh/HdwkRdMPaP26xE5aZEA0ucXgaHPTe
 ID8g==
X-Gm-Message-State: AOJu0YylHxNRKz6kgVmxSJusn9smYS4SR2VQ1q9L2MobT1vBimAJRiNL
 fKowcpsGPNQf1NzkuM4kVBkV6ufZ+/uTTzPxCmw=
X-Received: by 2002:adf:f005:0:b0:321:52fb:5703 with SMTP id
 j5-20020adff005000000b0032152fb5703mr24008995wro.13.1697187030197; 
 Fri, 13 Oct 2023 01:50:30 -0700 (PDT)
Received: from localhost.localdomain (adsl-170.109.242.226.tellas.gr.
 [109.242.226.170]) by smtp.gmail.com with ESMTPSA id
 v10-20020a5d678a000000b0032d9f32b96csm569185wru.62.2023.10.13.01.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 01:50:29 -0700 (PDT)
From: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org
Cc: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:OMAP)
Subject: [RFC PATCH v3 62/78] hw/gpio: add fallthrough pseudo-keyword
Date: Fri, 13 Oct 2023 11:46:30 +0300
Message-Id: <0af2d84ed03108dc0ba318fd4125114605f71a27.1697186560.git.manos.pitsidianakis@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
References: <cover.1697186560.git.manos.pitsidianakis@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: nVAOVHoeBCNw

In preparation of raising -Wimplicit-fallthrough to 5, replace all
fall-through comments with the fallthrough attribute pseudo-keyword.

Signed-off-by: Emmanouil Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 hw/gpio/omap_gpio.c  | 2 +-
 hw/i2c/bitbang_i2c.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/gpio/omap_gpio.c b/hw/gpio/omap_gpio.c
index a3341d70f1..82a9ea4810 100644
--- a/hw/gpio/omap_gpio.c
+++ b/hw/gpio/omap_gpio.c
@@ -563,7 +563,7 @@ static void omap2_gpio_module_writep(void *opaque, hwaddr addr,
         cur = omap2_gpio_module_read(opaque, addr & ~3) &
                 ~(mask << ((addr & 3) << 3));
 
-        /* Fall through.  */
+        fallthrough;
     case 0x18:	/* GPIO_IRQSTATUS1 */
     case 0x28:	/* GPIO_IRQSTATUS2 */
     case 0x60:	/* GPIO_CLEARIRQENABLE1 */
diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index de5f5aacf5..3d768ae564 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -156,7 +156,7 @@ int bitbang_i2c_set(bitbang_i2c_interface *i2c, int line, int level)
     case RECEIVING_BIT7:
         i2c->buffer = i2c_recv(i2c->bus);
         trace_bitbang_i2c_recv(i2c->buffer);
-        /* Fall through... */
+        fallthrough;
     case RECEIVING_BIT6 ... RECEIVING_BIT0:
         data = i2c->buffer >> 7;
         /* will end up in SENDING_ACK */
-- 
2.39.2

