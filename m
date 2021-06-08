Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4737935lfa;
        Tue, 8 Jun 2021 12:36:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZgtBys67r4vyPY388iQjEBkt0AeCFtv057W4XVeK1DcTfeaCXBXgLrRfhEVRFSFIA7HJd
X-Received: by 2002:a67:ed4a:: with SMTP id m10mr1981872vsp.56.1623181017324;
        Tue, 08 Jun 2021 12:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623181017; cv=none;
        d=google.com; s=arc-20160816;
        b=XqjfqiDlY4BNmM7Mt8VYQJY7uPZNUCJpuFTafMs/ukgtAj6VbVTU8V7PvoKme3X+gd
         RZrhZgRqBeP04XIPW1OjzFrE59x5eIQyrDeAj5lKZis9hoNVQsVw328U7jg58/64LrYQ
         ZmwIpAduoT9cePwONNA/sV+dcQn4jZ2yV+M5LlyMPX1S0GkEwXkw8SXk7UmyZQ+pe181
         Ukmd0qkKldr5aYNTuBCvBfe8KvgovnjNS1GA1t+pwhPtaalJ78s54OD9fPgAz/I8eymK
         fX0RQ25pxxaQ8PepQM69t8s25eGsVGeLaapiJz4gj9szC1ooH4WGo9aN1mJCdTl5bIUO
         ffGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=1R4OqYgXALabVeS1jjyB5oy/+6Sj3iQ62rsKQF+LgxI=;
        b=PsIghrIxGE3Pz3pvRsLnSHezO4j1gSBWyvvQ8YvF61NHKaEEe8IvqRSwllOtxrHSCf
         KyNzBqWIdG3LYiVLrLm36jhvHk52DgNUar5eFf4pbAPkojYt+V8tX0SG9dROzj5JlumX
         OPOjW0Z4k7SzZle5t8gQhqPgzCG7LotXMV8kzG7YVQ9F69XaB7ZOf5/WN/EFhv73T8Qg
         a6LKUK0LA7L+/o0wmDM7XkoNz/wFXPyAtSRKcS3Ksl5By+NHtL2gaQIYpKIs9PS0vVH3
         GrPhsgwYCem2M0Mr+prGLIAMcqzuFp2DumeY+72RLGHUQ8RCq227xcV+zuml7xCZC55l
         IC9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=RkXqrjRg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p3si7275857vse.65.2021.06.08.12.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 12:36:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=RkXqrjRg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:59388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqhWy-0008JK-Iq
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 15:36:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3x8a_YAcKCGATCLRSPCEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--venture.bounces.google.com>)
 id 1lqhWk-0007zu-Ll
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 15:36:42 -0400
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a]:47063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3x8a_YAcKCGATCLRSPCEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--venture.bounces.google.com>)
 id 1lqhWi-0002D6-Uq
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 15:36:42 -0400
Received: by mail-yb1-xb4a.google.com with SMTP id
 p2-20020a2599820000b02905394c6727easo28205947ybo.13
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 12:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=1R4OqYgXALabVeS1jjyB5oy/+6Sj3iQ62rsKQF+LgxI=;
 b=RkXqrjRgekzr5CjQOQBkgmrLWRpqPqTkRdb3fHTNCKCnK7D95oydx+fSVJNA8yAko8
 vBp6mGnI7PBNUxAqIQZ54XINY+weyY7vOrDPI6eHcO6BuRKUle1Wzc3+RDTFoL8Q5dpA
 nZw1iUmCRGFoWtIYX7mIy5qsbeqLi8FI5scl0eOBVNdPP14dK/88tEiFJncr4kJxPNOI
 dRy94eoDFOEG1oTr3xRrXWMHwEfPylbmCBd38BFczFQdyEVTYXxnmtOmJX+yJgx13NCd
 lWfHwTekF1wYYkgMAD1GyXQJZXXiyP/6KUvkDe+DfEDLl5XvYlOeWVTqEnDOPZdtBFzt
 flAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=1R4OqYgXALabVeS1jjyB5oy/+6Sj3iQ62rsKQF+LgxI=;
 b=M6Sj4kpJIFev0o3TGNaZiJ55j8t4MU4RhL9ZP7HoGOdCtvqOGxxW1L4fvet2C9RBZS
 I1B4cchp1fqihTFt7QdMDvJyoXQVkYF/Z1CWEj4hW2SGmyG61cHLPoLnzI3RAjy4QHNH
 OGHxP1kCkeveBoRkVo3AttTHFyu8wch46x1L5GL9YdpbxkCDf+jeGjftc1G2bHHoJKvt
 Okfdcm7ln22fzwerb96+Yv3d1jopDuANZeujld8h8VVvl9wkmcBEZ5jqJLmIg/El9rvQ
 2Cd4wow79rq/BVzNXwcCXauDh5+qKzSEeIJ7/kB6q9QLevb0AH2Q8Kj/e+6LIHIFQw/+
 NO4w==
X-Gm-Message-State: AOAM531M8naqrY/3Axt42X8DNUWr80Cy/vf1DyWtgy0k5WIGlQ9Wuvvb
 BAEoasmWYX9jFOXWpbOMWp55HqTwRuvL
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:f886:41e8:7e16:711b])
 (user=venture job=sendgmr) by 2002:a25:5015:: with SMTP id
 e21mr9691309ybb.166.1623180999359; Tue, 08 Jun 2021 12:36:39 -0700 (PDT)
Date: Tue,  8 Jun 2021 12:36:05 -0700
In-Reply-To: <20210608193605.2611114-1-venture@google.com>
Message-Id: <20210608193605.2611114-3-venture@google.com>
Mime-Version: 1.0
References: <20210608193605.2611114-1-venture@google.com>
X-Mailer: git-send-email 2.32.0.rc1.229.g3e70b5a671-goog
Subject: [PATCH v2 2/2] hw/arm: quanta-gbs-bmc add i2c comments
From: Patrick Venture <venture@google.com>
To: hskinnemoen@google.com, kfting@nuvoton.com, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Patrick Venture <venture@google.com>, Brandon Kim <brandonkim@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3x8a_YAcKCGATCLRSPCEMMEJC.AMKOCKS-8PKLMLELS.MPE@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zAqmrfHGBhZt

Add a comment and i2c method that describes the board layout.

Tested: firmware booted to userspace.
Signed-off-by: Patrick Venture <venture@google.com>
Reviewed-by: Brandon Kim <brandonkim@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
---
 hw/arm/npcm7xx_boards.c | 60 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 34a214fe79..d9de375826 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -238,6 +238,65 @@ static void quanta_gsj_fan_init(NPCM7xxMachine *machine, NPCM7xxState *soc)
     npcm7xx_connect_pwm_fan(soc, &splitter[2], 0x05, 1);
 }
 
+static void quanta_gbs_i2c_init(NPCM7xxState *soc)
+{
+    /*
+     * i2c-0:
+     *     pca9546@71
+     *
+     * i2c-1:
+     *     pca9535@24
+     *     pca9535@20
+     *     pca9535@21
+     *     pca9535@22
+     *     pca9535@23
+     *     pca9535@25
+     *     pca9535@26
+     *
+     * i2c-2:
+     *     sbtsi@4c
+     *
+     * i2c-5:
+     *     atmel,24c64@50 mb_fru
+     *     pca9546@71
+     *         - channel 0: max31725@54
+     *         - channel 1: max31725@55
+     *         - channel 2: max31725@5d
+     *                      atmel,24c64@51 fan_fru
+     *         - channel 3: atmel,24c64@52 hsbp_fru
+     *
+     * i2c-6:
+     *     pca9545@73
+     *
+     * i2c-7:
+     *     pca9545@72
+     *
+     * i2c-8:
+     *     adi,adm1272@10
+     *
+     * i2c-9:
+     *     pca9546@71
+     *         - channel 0: isil,isl68137@60
+     *         - channel 1: isil,isl68137@61
+     *         - channel 2: isil,isl68137@63
+     *         - channel 3: isil,isl68137@45
+     *
+     * i2c-10:
+     *     pca9545@71
+     *
+     * i2c-11:
+     *     pca9545@76
+     *
+     * i2c-12:
+     *     maxim,max34451@4e
+     *     isil,isl68137@5d
+     *     isil,isl68137@5e
+     *
+     * i2c-14:
+     *     pca9545@70
+     */
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -282,6 +341,7 @@ static void quanta_gbs_init(MachineState *machine)
     npcm7xx_connect_flash(&soc->fiu[0], 0, "mx66u51235f",
                           drive_get(IF_MTD, 0, 0));
 
+    quanta_gbs_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
-- 
2.31.1.751.gd2f1c929bd-goog

