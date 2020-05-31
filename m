Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2399558lfc;
        Sun, 31 May 2020 10:42:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8kWz0S8RI5Bsuz+h5DHyFUSvN3DWA1oOinLh5gzbjXIU1Re6O4prV+ltZw6ztxd+GX8a+
X-Received: by 2002:a5b:344:: with SMTP id q4mr28139365ybp.29.1590946947312;
        Sun, 31 May 2020 10:42:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590946947; cv=none;
        d=google.com; s=arc-20160816;
        b=qXxAQ5VC+0Gsv4Lqo4kVVIuJW5GFELHjcnamSq9i5svRkOVNH+0Hf2iXV/a3GGMXcJ
         Ss7ljd0TGjyk8dDARWuIGf7/X+uVkLgdhF55g+opVMryqIRfkbKkaPPTcyjGYaiXh4M3
         J+6WowK50nCHnCFFsgOp8hrbLusxIeBFxxIIIqZS7M181mdNCUSaKcx4LJnGrnzeMQvD
         oDNXKljqmJjD89I7cUKBju8akNe+w2d9ftcT5t6/NYTzm89pjHMiZsf7S2jklAY0SwYr
         hpVRy8xy9ndgGt5ABU5dLhqzQyo4SdCBomIe8h2koLfyzaJ7Y/6jHCdKC6VkwfubK4ZK
         69nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9Mxl/dNTcRwhkGe3G4jYrG/McOP5BFcH0HXoztP9CuE=;
        b=sOwfiUTG0FqldfoHwu92dZa9BZXeL1QKgFSGj7snvLRg6zhZFbRWTrfI4j1bWz666x
         RoYs3k1RqFXFFtpWbRzqYXyB+Sfof2K+E6BAGZKKdke5pUVA3xAj+xxSswb69uhmh5AH
         qw+G1N4t10Dm82/z3Tki/87MMvNMNwtinnHUZbtGPKn9Jp5FthZ1Cc5RZGdXurfe0gaK
         tIjqDUNwHb5ofERpWy/VOc4pI33clhYLf5pHdGG47/zyyYMf1oyc2jH9L+eFDDXPM7eV
         Cdc8SosFn/mxXebOJNpbyvf/OPk3986BzB2Bk/1P/nsq7/APXg3iPy4VLOynZ7SVxgvH
         Dj/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KN9foiNw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 203si12205279yba.85.2020.05.31.10.42.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 31 May 2020 10:42:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KN9foiNw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jfRyc-0001Aa-Ht
	for alex.bennee@linaro.org; Sun, 31 May 2020 13:42:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfRun-0004AJ-P9; Sun, 31 May 2020 13:38:29 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35624)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfRug-0004FE-3A; Sun, 31 May 2020 13:38:29 -0400
Received: by mail-wm1-x343.google.com with SMTP id q25so217634wmj.0;
 Sun, 31 May 2020 10:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Mxl/dNTcRwhkGe3G4jYrG/McOP5BFcH0HXoztP9CuE=;
 b=KN9foiNw1uNODlYLGsqkaiPFpDICcY39hhwQ0vwdyo0AGdI9BbCHCSkh+p4J9h4Laq
 DuJIwu3OpLHu4sHXUICkVbKQmAQmO+D8yyfjCtpGxkzofi4Igvfw3BC01Z7/GOK9kSfa
 /CHzYk/dCYbs+astQL+vk6kJZJNm3vCHZDeZsshhM7YKE/GswD1u2po1Hu0sHnTWODaV
 aw+XELKTPKtS86NcCcXXbY9Yd54eTLdGu3rk0hKXJbOXEaV87ip22Lyy/G35mPcBAnhe
 e4EhgrNgwMPPUSeRGMOLlO+3sZx1yyfRCuxcn0pMT9nWhIm8j0WbNSdQCQD9WVWhr+7/
 mH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9Mxl/dNTcRwhkGe3G4jYrG/McOP5BFcH0HXoztP9CuE=;
 b=T5U6i1oITdBY0nV2yaloG4HwpNqbcW8rgGCQTwZ0Gnzi/hazL6v2Sep/TQGmCPT+KC
 svx/iV68xqx/cl2eZG+alo1C6nAHY9dAnBbyPjA46HaS+q0GJYEodSW4zyoakJKgd6tG
 0E98/xXsZIppGAh4E3NDKJ5LdZ06wLq9HarkH8WqpBMPvbgoG/U5FLW/0pYiAYVml3W9
 sulJWdB4j/uDMnmxeauNp5aT0WKiWxIqhLlj5ksF+nGFxzQjsd1lJb30xQKMokh72p2w
 SX+JqJzLYiWx0SbV/lBiubTV2c4hfye0y1nXwhor/y9VmlvgciZeRq1DwS7NDHcTG2JA
 pk5Q==
X-Gm-Message-State: AOAM532uC0yNt6xwalknb7wC/LXiLhSrvmzbJf2fWTF40PIf1UvdFWm4
 /Lhzgts5QchmhARx9yqiSmh9Jcug
X-Received: by 2002:a1c:5606:: with SMTP id k6mr19052387wmb.10.1590946699366; 
 Sun, 31 May 2020 10:38:19 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/8] hw/arm/aspeed: Correct DRAM container region size
Date: Sun, 31 May 2020 19:38:07 +0200
Message-Id: <20200531173814.8734-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200531173814.8734-1-f4bug@amsat.org>
References: <20200531173814.8734-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 qemu-ppc@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lw759Y0ltX1H

memory_region_set_size() handle the 16 Exabytes limit by
special-casing the UINT64_MAX value. This is not a problem
for the 32-bit maximum, 4 GiB.
By using the UINT32_MAX value, the aspeed-ram-container
MemoryRegion ends up missing 1 byte:

 $ qemu-system-arm -M ast2600-evb -S -monitor stdio
 (qemu) info mtree

  address-space: aspeed.fmc-ast2600-dma-dram
    0000000080000000-000000017ffffffe (prio 0, i/o): aspeed-ram-container
      0000000080000000-00000000bfffffff (prio 0, ram): ram
      00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram

Fix by using the correct value. We now have:

  address-space: aspeed.fmc-ast2600-dma-dram
    0000000080000000-000000017fffffff (prio 0, i/o): aspeed-ram-container
      0000000080000000-00000000bfffffff (prio 0, ram): ram
      00000000c0000000-ffffffffffffffff (prio 0, i/o): max_ram

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 2c23297edf..62344ac6a3 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -262,7 +262,7 @@ static void aspeed_machine_init(MachineState *machine)
     bmc = g_new0(AspeedBoardState, 1);
 
     memory_region_init(&bmc->ram_container, NULL, "aspeed-ram-container",
-                       UINT32_MAX);
+                       4 * GiB);
     memory_region_add_subregion(&bmc->ram_container, 0, machine->ram);
 
     object_initialize_child(OBJECT(machine), "soc", &bmc->soc,
-- 
2.21.3

