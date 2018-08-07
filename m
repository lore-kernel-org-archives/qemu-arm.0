Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3918444wru;
        Tue, 7 Aug 2018 01:01:12 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeB6Rri6WF56oDUhw5+moqYRUAPMhT7UatvjpDUL9ayXHw7hxgHMdTVShKB1DP09bXcR9YT
X-Received: by 2002:a37:5742:: with SMTP id l63-v6mr16439918qkb.246.1533628872170;
        Tue, 07 Aug 2018 01:01:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533628872; cv=none;
        d=google.com; s=arc-20160816;
        b=HSgy5XA1Y5ozSlXSSOrOal2oimaa+xn/6ub08kF+WZ8pLB6XPGTTg/Tt5Z7RhWmfFC
         yAzAtVy5KsBLLvxVUNI5XgJ1Te9+clfbDucJr508acOoD32BGj5z1zIRsqq38RkeH9zw
         CvXRFc9VCofaNXVzaFwnfq2R4BA367bLHazVL1ISDbxaRvYxlN0RjZCpnRF0sFC+hK5b
         Xtt31RT/N8anXwcCuHUBqgH1Va/WwloGviFpxUJKMbTM4QDAoHhAOAplFERHl4bOx/B4
         z/nogUKc1g7X19e/0iHstwEXR1z5kdghucEC92UuIvT/2rKqNyJJwT2sl3orp9PWr7ge
         eRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=u8DAb17wNI/xayU+USr02m8Zx4LCPxglib3dKDzYGdw=;
        b=u0bat4Y4kaC5Dkk8d5tnmMsjW0pq8no0Z4U8oKbOtCJV5USTk/YwC0dU29ZpDQR9Uk
         CpgQzgGd28Bwi3XuDBtKo10c104gVLIQQwp1/+0Y22opD1HRV2ztDNXDqt9OddTPUqsg
         89GdmNSVll6eCWkwF7bkMLDMuPG25pAmpHz8zqDHTzXmnRD76pe4SI5Yf9AyXFI0fGDx
         4cFst/Z+4qnxVzczzWQxKUMElK0o+KsHLuTlqAn0hP4QW0jnRQUB/oYeAhYIgb/ngcKy
         aqqLJQKHks95+ldHZ86PCxpIgs74ZYRtNIJULtHnRbN+WF7YEwKpE3rahtwKbtQroZV7
         fEPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pdAUsIzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 5-v6si657663qvq.156.2018.08.07.01.01.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 01:01:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pdAUsIzp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmwvX-00057A-Ls
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 04:01:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwsr-0002dJ-Eh
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwsm-0005WF-Jw
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:25 -0400
Received: from mail-pl0-x242.google.com ([2607:f8b0:400e:c01::242]:36392)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fmwsm-0005W6-Bz; Tue, 07 Aug 2018 03:58:20 -0400
Received: by mail-pl0-x242.google.com with SMTP id e11-v6so6783317plb.3;
	Tue, 07 Aug 2018 00:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=u8DAb17wNI/xayU+USr02m8Zx4LCPxglib3dKDzYGdw=;
	b=pdAUsIzpd/NthsyolVXQY3oTMo/9S+AcPZHBzyvU11MNU3fvU5JDHjimjiiiMDMbIt
	eSOotaAWt/bSR1ZCzp5TwVbSbqUeo8uq0CXtHI3/DE1ev1bVgCiTu9yUobnldLsFbgGi
	H0lkW4hxqMidVOIbaHfY/zgylHU4PAl9hr8gNi+IFSTifO5MYnFoADp/1LvBv+LmP7fN
	hNuiNKRhJp808ybyg6GPhuXCjmo591LhY/J/UCUMYB+Q7OdHsHTAGZnPobb4Z4QF6xrS
	KfG3uIPr+B1UNQrCA53F63KQsODIbvJLLBObC1iGkkU+goHZF69v6RLBw1O1rmr45ukg
	eJqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=u8DAb17wNI/xayU+USr02m8Zx4LCPxglib3dKDzYGdw=;
	b=iPEdZDtd2hpcwvoWp0Z06zboS/PHvfemagq6NdOaJ6lKCZ7eAjsloBOSYdhqJ5YQOh
	/3rt53Icl5mJTtA3TEm9evbvXxmVT1HiZptLkI6vIp8Tn5EVTH+Q0gkxW8ZfstsPIAnP
	1Tl5HIenjcJUPd1Sv4nD1zqNuS+Nzs2fyh/ezZK7EWf4wBIG1LXM4u1S31XcfPMWrsng
	4hThTgdgb6Wz5ZL/dJ8p9N4NWNLQa8K9Txib4z9BUhJie6XexQ1ZYOSL4ptaMvsca8p7
	5XsV3RezpIHuAj5HocJq1bbEGaNwkwXhGWxs4F79RjfPcOMgk/aEDjtTOGRDDKqQq5Qq
	R+6g==
X-Gm-Message-State: AOUpUlFJBVJ3OAfYFb5bmDd1FxCaRmDc78OsDLKS3QF7FPgQCVFbXov3
	wOg1GzCl+lKw/grFFSg48HY=
X-Received: by 2002:a17:902:b08a:: with SMTP id
	p10-v6mr16608034plr.217.1533628699315; 
	Tue, 07 Aug 2018 00:58:19 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	l85-v6sm1726016pfk.34.2018.08.07.00.58.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Aug 2018 00:58:18 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 07 Aug 2018 17:28:12 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Tue,  7 Aug 2018 17:27:52 +0930
Message-Id: <20180807075757.7242-3-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180807075757.7242-1-joel@jms.id.au>
References: <20180807075757.7242-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::242
Subject: [Qemu-arm] [PATCH 2/7] aspeed_sdmc: Fix saved values
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OZgcNjZzN08d

This fixes the intended protection of read-only values in the
configuration register. They were being always set to zero by mistake.

The read-only fields depend on the configured memory size of the system,
so they cannot be fixed at compile time. The most straight forward
option was to store them in the state structure.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_sdmc.c         | 27 ++++++++-------------------
 include/hw/misc/aspeed_sdmc.h |  1 +
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 0df008e52a18..24fd4aee2d82 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -126,10 +126,12 @@ static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
         case AST2400_A0_SILICON_REV:
         case AST2400_A1_SILICON_REV:
             data &= ~ASPEED_SDMC_READONLY_MASK;
+            data |= s->fixed_conf;
             break;
         case AST2500_A0_SILICON_REV:
         case AST2500_A1_SILICON_REV:
             data &= ~ASPEED_SDMC_AST2500_READONLY_MASK;
+            data |= s->fixed_conf;
             break;
         default:
             g_assert_not_reached();
@@ -198,25 +200,7 @@ static void aspeed_sdmc_reset(DeviceState *dev)
     memset(s->regs, 0, sizeof(s->regs));
 
     /* Set ram size bit and defaults values */
-    switch (s->silicon_rev) {
-    case AST2400_A0_SILICON_REV:
-    case AST2400_A1_SILICON_REV:
-        s->regs[R_CONF] |=
-            ASPEED_SDMC_VGA_COMPAT |
-            ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
-        break;
-
-    case AST2500_A0_SILICON_REV:
-    case AST2500_A1_SILICON_REV:
-        s->regs[R_CONF] |=
-            ASPEED_SDMC_HW_VERSION(1) |
-            ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
-            ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
-        break;
-
-    default:
-        g_assert_not_reached();
-    }
+    s->regs[R_CONF] = s->fixed_conf;
 }
 
 static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
@@ -234,10 +218,15 @@ static void aspeed_sdmc_realize(DeviceState *dev, Error **errp)
     case AST2400_A0_SILICON_REV:
     case AST2400_A1_SILICON_REV:
         s->ram_bits = ast2400_rambits(s);
+        s->fixed_conf = ASPEED_SDMC_VGA_COMPAT |
+            ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
         break;
     case AST2500_A0_SILICON_REV:
     case AST2500_A1_SILICON_REV:
         s->ram_bits = ast2500_rambits(s);
+        s->fixed_conf = ASPEED_SDMC_HW_VERSION(1) |
+            ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
+            ASPEED_SDMC_DRAM_SIZE(s->ram_bits);
         break;
     default:
         g_assert_not_reached();
diff --git a/include/hw/misc/aspeed_sdmc.h b/include/hw/misc/aspeed_sdmc.h
index 682f0f5d56dc..e079c66a7d73 100644
--- a/include/hw/misc/aspeed_sdmc.h
+++ b/include/hw/misc/aspeed_sdmc.h
@@ -27,6 +27,7 @@ typedef struct AspeedSDMCState {
     uint32_t silicon_rev;
     uint32_t ram_bits;
     uint64_t ram_size;
+    uint32_t fixed_conf;
 
 } AspeedSDMCState;
 
-- 
2.17.1

