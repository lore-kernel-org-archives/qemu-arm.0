Received: by 2002:a19:f24a:0:0:0:0:0 with SMTP id d10csp587921lfk;
        Fri, 13 Aug 2021 16:39:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIUjC4JQvhVH+duPI/wRkfL0ecMllwa3Q/8w3PLBCiiwIqVYh/zeWItgYaJ9X+6FFzmNPR
X-Received: by 2002:a25:30c:: with SMTP id 12mr6289632ybd.212.1628897993299;
        Fri, 13 Aug 2021 16:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628897993; cv=none;
        d=google.com; s=arc-20160816;
        b=TOCL6bPULnlQnaE+1IVRnp9y7qRclYn/E9qvLmjiyF+R9oUEMHTiNyB5uwe/C/j2w0
         PJ3dYRTE9PFTrBQxMpBbwPOWqtSIDPVG+GtJ2pYfYdtHr1ubLjuHrgCk3uMiF8a9gvgb
         MrnaaJBtpQOC/tbCdkOkqA8U/uO1VbPgBGPbBDC61tTqoa/+Gi1ivxsOkOy/7YsAcIm/
         qqIbs1K/BFbfC5jMesM+p3PXp9iiO6/K3rMyqv7Guxze/ozeqWQQUBCFT1qR2dbhPxFF
         vrkO9twKFCZ3+QsOSB6BCTWfsvDBy1X8vmRL+HITH/diWLUogljCK2cVKJIhr2cCjQ19
         RBcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:references
         :mime-version:message-id:in-reply-to:date:dkim-signature;
        bh=HCer6SUjEvJWKpa23gzyoBaF+8xg8ld+2vS1BH0nzD0=;
        b=moD0fP9fkXHcF+d3BxmMzjYmwo1fvIi1uA1/2RRkFuX997QZDVuOSCTeRK7Fnl6nfC
         r614KYRrh2dAOAvsBPyyUyJXAGpE29ncElIIR5ld9zaNJkR4XuCNZJaUxWZecLoj02HT
         aj2CpJrdqhPd1w51Ow+/scHbHANMl+3B57mqG0DXYnLABPJVa0znQ7ifl4z24yAqtt1i
         oOXZgvEl096imj0ccQydfYe44b0fYvWvNY07hYOEwRbK9Ca+N/VquTKVuPjQ8nOh0JKo
         wp7xm18A5+tLi24AsEsnzUZExO5Y4fisBlwn5HA/Rf5Hh4t2Ta5hfm1ZBadlIoEYC2cU
         arSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Ots1skqg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si2596539ybh.469.2021.08.13.16.39.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Aug 2021 16:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Ots1skqg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:48164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mEgmG-00045K-LT
	for alex.bennee@linaro.org; Fri, 13 Aug 2021 19:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3jgEXYQgKCPszxkdrwvkjrrjoh.frpthpx-dupqrqjqx.ruj@flex--wuhaotsh.bounces.google.com>)
 id 1mEghH-0004AD-Jf
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 19:34:44 -0400
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a]:56905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3jgEXYQgKCPszxkdrwvkjrrjoh.frpthpx-dupqrqjqx.ruj@flex--wuhaotsh.bounces.google.com>)
 id 1mEghE-00060p-Rr
 for qemu-arm@nongnu.org; Fri, 13 Aug 2021 19:34:43 -0400
Received: by mail-pl1-x64a.google.com with SMTP id
 f17-20020a170902ab91b029012c3bac8d81so7034436plr.23
 for <qemu-arm@nongnu.org>; Fri, 13 Aug 2021 16:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=HCer6SUjEvJWKpa23gzyoBaF+8xg8ld+2vS1BH0nzD0=;
 b=Ots1skqgoef9hQjYDtOPzzzXqYKeShZ8tuflMa2TGcONsgjdEhV4xOniYbwf62FigP
 wLzOaKav0NhXUsUwYoTq3etQKdlZJnaF98Wh1bmdknE0iQGEWpPieO87TRSkNe1YCMtI
 7oU+4qjMTdtLU7x1PU9XmX7J8ZJUFsTSPIUUHyaykkAJ0Hl+N9wVb9gOVKXefTwu/u+f
 gePVFrcLTcY0IJFYhgkzuAXAr52qlpjHRd5tC9T2WyxGUfTKnY93x77uF7fB5TKVIV8C
 h3Hkqd2SV0IlHg1OKy7EIWWiC2T554N44BC8Y2ukb+ClW0Etjxgb6u705nIjLc+fBbxh
 gz9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=HCer6SUjEvJWKpa23gzyoBaF+8xg8ld+2vS1BH0nzD0=;
 b=dwf49fltPfkD7cUUWvairP7uapkbhcPU5ipG0jNanvDPmF74CeElTzozI1eJ/TSuuy
 /vFIgPag2Dbvd/BRQhaGz0Djp8tMhMOtJKEjrDa7e0w0ycEhuYHZYZLq/NtMLptAc6FI
 L5Kj8ChJaaSkmvJtnws16N4ZaNniEHBaMa3W5BpP5YAXXanvpZLZcAO+qR/98SZsPLOi
 TrTbXA2c9BRiCmisA/4Mnd9Z7YRPFqE4NP69v65nuOX/8Ru7aD5NoFhJBFiFmOzUXZQW
 +DuF6cWD+LJBspxOmmynlHtr6+wGf/w1i/tje1R0saa5A2W+X5KyjHpVCWb3ieCgRDEg
 n5IQ==
X-Gm-Message-State: AOAM532MV29HGUIsV1aaD5qvsHpYj9qO+j1wdbtEeT74hyVoQ4hrbmM+
 rDW3HG5xGNJCuzwD/GNkLTmd4EcEVgFWoA==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:aa7:8683:0:b029:3e0:9a61:b505 with SMTP
 id d3-20020aa786830000b02903e09a61b505mr4856689pfo.10.1628897678747; Fri, 13
 Aug 2021 16:34:38 -0700 (PDT)
Date: Fri, 13 Aug 2021 16:33:53 -0700
In-Reply-To: <20210813233353.2099459-1-wuhaotsh@google.com>
Message-Id: <20210813233353.2099459-8-wuhaotsh@google.com>
Mime-Version: 1.0
References: <20210813233353.2099459-1-wuhaotsh@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 7/7] hw/arm: Use unit number in quanta-gsj eeprom files
From: Hao Wu <wuhaotsh@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org, 
 wuhaotsh@google.com, titusr@google.com, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::64a;
 envelope-from=3jgEXYQgKCPszxkdrwvkjrrjoh.frpthpx-dupqrqjqx.ruj@flex--wuhaotsh.bounces.google.com;
 helo=mail-pl1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: 7S1RheHeysW7

Use unique unit numbers in quanta-gsj eeprom files.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture<venture@google.com>
---
 hw/arm/npcm7xx_boards.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 54cf9785ec..be6c81b29d 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -107,17 +107,6 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
     return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
 }
 
-static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
-                              uint32_t rsize)
-{
-    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
-    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
-    DeviceState *dev = DEVICE(i2c_dev);
-
-    qdev_prop_set_uint32(dev, "rom-size", rsize);
-    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
-}
-
 static void npcm7xx_init_pwm_splitter(NPCM7xxMachine *machine,
                                       NPCM7xxState *soc, const int *fan_counts)
 {
@@ -220,8 +209,8 @@ static void quanta_gsj_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
 
-    at24c_eeprom_init(soc, 9, 0x55, 8192);
-    at24c_eeprom_init(soc, 10, 0x55, 8192);
+    at24c_eeprom_init_one(npcm7xx_i2c_get_bus(soc, 9), 9, 0x55, 8192, 0);
+    at24c_eeprom_init_one(npcm7xx_i2c_get_bus(soc, 10), 10, 0x55, 8192, 1);
 
     /*
      * i2c-11:
-- 
2.33.0.rc1.237.g0d66db33f3-goog

