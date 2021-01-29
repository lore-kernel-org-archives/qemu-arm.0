Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp707135lfo;
        Thu, 28 Jan 2021 17:04:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxXM5hhUiegAVkRFXxrhICsCGCKlW/MN1mF5+VCZTpl33AfPgBjEqMDK97Tf4TPUTTaPzaR
X-Received: by 2002:a25:397:: with SMTP id 145mr2808987ybd.293.1611882262201;
        Thu, 28 Jan 2021 17:04:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611882262; cv=none;
        d=google.com; s=arc-20160816;
        b=kKoNGbrJ/L0S/xp8/55OY3EKfJhgkFLxP9Ja9JnBvAz0Q2J47vx0i1k5RK8EWIFrJc
         5G2Du17nvKXvFpT9ucxnVM4HoTdMdgsND0tut27K5Cov8nSlGsrLp/A1SPjlSnDonxQH
         iBs5tqSox8kNIT5DhWSCMhei6r6DJjLHJPqUem6uq/2UUgIfiOdS40NWTLQ2g0u/CC01
         TO6/1k3A4cyYuszsDojiwd9t8xHmSLVqlKhKXYoPQ5cFYwKLcK3rq3FzX3BDxi7mQJaG
         79wtB91ldNn+7Pg51Y94PySTrqy0wuM8GOpheSiXQmUqiY+RahdCpUTUYjaTisVsBwlG
         0nxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:references:mime-version:message-id:in-reply-to:date
         :dkim-signature;
        bh=MXpYq4rGrYnKEV9MTkJ+FJRm52fVhSZVjQB4Boy0H48=;
        b=VDf5891bBwOWxaGvm4PfQQvgZNhekVukPIDTJRv3NxvMt0PHqLI8AkvHb4Bbwraq8J
         HHxC0IPnJ9wjh0KFyyKNptNT+366hn226xepWnJKzcVmjdzls3jBB4TYvrdFVXugnkop
         X380vZyEwjAxCz8LuaOz4gs150czS1MByl5lveg7pSInVHHrKi92IrzC+LfY/ZDql7o2
         awO2/i1YUy+LYxUpwvCoaBkC6EWQMFTgIpL9VTIgZj/T+RgepdPtz8rIYa4iaJpW8qkE
         8EuA5bOBErkOOUm2zjkKziNFIqbk1hfl7AThwIT11Mjg5Fl+Ou2X+/ISrrdx9IWb/h7l
         lb9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=CcaFOYbh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n9si8527100ybn.170.2021.01.28.17.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 17:04:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=CcaFOYbh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:46096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5ICz-00030x-Iw
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 20:04:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3CF8TYAgKCBsNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1l5ICr-00030j-Ey
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 20:04:13 -0500
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:41619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3CF8TYAgKCBsNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com>)
 id 1l5ICo-0004Up-Nb
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 20:04:13 -0500
Received: by mail-pl1-x64a.google.com with SMTP id c18so4225924pls.8
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 17:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=MXpYq4rGrYnKEV9MTkJ+FJRm52fVhSZVjQB4Boy0H48=;
 b=CcaFOYbh8D6CEG6AS96j0pzXFdNjXI4VrwnGuCmYzu90YDYxKvjs+F/eSLcv3kaGBK
 9jLViZefuaHKqrtrYsvN7hvHCSeR/F8efy2G5dWHYKcLPFvHlTevRkO3RR/R6G4F1pj2
 4ZM6GLHtnyeolUM3cOyP74SL68gPK16hc9Wt/0p7FcfeocbZzO3eqd/ETCO/fq462idI
 r29xZx2t7TBibdZFA3XeKNMIzxoDpuk6vNLdWEjm7sbOZId5W/sCGM5d75LewpaZVDBk
 e3qg5FDcalO3JrNWOnUHUfoeeRP27U8hJQT1CdbodfOLV/sLWYuhxvcVxDDKFdtuglgf
 ArFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=MXpYq4rGrYnKEV9MTkJ+FJRm52fVhSZVjQB4Boy0H48=;
 b=bHjonPyovh2kZyJCN6Q7KKr88pKm4JxEn+Y5wVZVGZLmWWCrNTyaQukTQt8WylK1gs
 Im8AFctuyYo5x4ck0q5fxM0GlWA8zSIZfgbkqS14yp9sJOSmKPz0QzcWlMcz7cWct4pO
 scTmJMTfi9N/5zvwl/UN3KjcgKkQSgN4r8Gtk4c8joV7OP8gv3WTnI7wwE7lkTtzlVPP
 xs55robK1L9/UT0TNmV0IBGzG4rz0Cc8Ddq66CPx3TyYkA83MhRh5Q7IamlQXn4NklM3
 cxcNj2+djID2XFqQ98O9uf38Br6nIPMKEqfsjDAIWfvIqcZqMiURPOabGaJCBWu0yJfi
 PcqQ==
X-Gm-Message-State: AOAM531luGTvMVrZ3iQMVNEABaSZratBfnLHrp2Ih7cKUKV9XosW9r/d
 sbZZY7eUQ3Qq97PFtLGQtb1ceKRxJcREdA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:90a:4088:: with SMTP id
 l8mr2019690pjg.106.1611882248047; Thu, 28 Jan 2021 17:04:08 -0800 (PST)
Date: Thu, 28 Jan 2021 16:58:40 -0800
In-Reply-To: <20210129005845.416272-1-wuhaotsh@google.com>
Message-Id: <20210129005845.416272-2-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210129005845.416272-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 1/6] hw/arm: Remove GPIO from unimplemented NPCM7XX
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3CF8TYAgKCBsNL81FKJ87FF7C5.3FDH5DL-1IDEFE7EL.FI7@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
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
Cc: cminyard@mvista.com, venture@google.com, hskinnemoen@google.com,
 qemu-devel@nongnu.org, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-arm@nongnu.org>
X-TUID: bhYpyX/qoJT2

NPCM7XX GPIO devices have been implemented in hw/gpio/npcm7xx-gpio.c. So
we removed them from the unimplemented devices list.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu<wuhaotsh@google.com>
---
 hw/arm/npcm7xx.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 72040d4079..d1fe9bd1df 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -576,14 +576,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.pcierc",       0xe1000000,  64 * KiB);
     create_unimplemented_device("npcm7xx.kcs",          0xf0007000,   4 * KiB);
     create_unimplemented_device("npcm7xx.gfxi",         0xf000e000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[0]",      0xf0010000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[1]",      0xf0011000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[2]",      0xf0012000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[3]",      0xf0013000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[4]",      0xf0014000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[5]",      0xf0015000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[6]",      0xf0016000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.gpio[7]",      0xf0017000,   4 * KiB);
     create_unimplemented_device("npcm7xx.smbus[0]",     0xf0080000,   4 * KiB);
     create_unimplemented_device("npcm7xx.smbus[1]",     0xf0081000,   4 * KiB);
     create_unimplemented_device("npcm7xx.smbus[2]",     0xf0082000,   4 * KiB);
-- 
2.30.0.365.g02bc693789-goog

