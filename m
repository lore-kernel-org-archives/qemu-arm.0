Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp708556lfo;
        Thu, 28 Jan 2021 17:06:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwDREY1Jn3O8NxJCxC3pe8RuRBDQb8xThfPn4pEnIIuojWDDIYG2mX8rLK56MBoY/aP0d9l
X-Received: by 2002:a25:b813:: with SMTP id v19mr2858555ybj.178.1611882367890;
        Thu, 28 Jan 2021 17:06:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611882367; cv=none;
        d=google.com; s=arc-20160816;
        b=UTYgLvxle4MP70c0xWko3T+d97BhcPDtJz/MmAA+EvI8REjcGHbzD4izkkegeBbPa4
         FV8HRguOEhGSmPtTkaUvoDVxp1Ct57sS6Y1FWJEoroP6D5yrbmVryS3lp1Pdsn2Ypkje
         wGPI6EMlACO2QkIKsfxyomTeF1+WVgIuThEvGXALDHqSSuVhq98jEihOkB2TeQcw8wo6
         kD+eyMqI81W2sFcYtRa9lPtnuSNiWOPbYm08HNYSqrQ/HcyrneKlCDivuzZSIQOqtvnA
         B1R6VGB2SHusT6KqfyAX5N33eJ16lNTvmdpMID22pGCuq0RqJjrT/RkZ7XVjKiN2wzZ7
         e8yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:mime-version:message-id:date:dkim-signature;
        bh=VL23Jq4zsCC8gbzhOtcPRl3gDc/bB4TFHM4RpZZGZ/0=;
        b=QZjA2qY2INY/NhUAsuq9S1OokEYPXG0YWArVnNI8HFDgxJ14Icb9ssS2XDpehrUEeM
         Ja0iVtbNoXYn+cWLCVJ78XCOOgOJTllVPTL8qVJzaKkFMH4iWctq3PdZWNeBzrE083uZ
         ZQ3O1dijxV8Clp/O3cvqjnAdOZU1ARG9qIY3Tyqrui9hoCVIkRRBP0XhohOzqwtugD/V
         se6jhu7FxvWA3JR7q/WapSWM0gzQPu6p4X0I6n58v2SQcwn6rw2kbsUOFNQdxFdlCtw3
         tHCXWrdJ7Zz5OoSyAOKB9X7TZxuO17jglMWP93o6nIN8X752APU4zQGYIvTaHPFZBd8L
         lRqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=hvpVBGAw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2si6948879ybr.94.2021.01.28.17.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 17:06:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=hvpVBGAw;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:49068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5IEh-0004Jo-9K
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 20:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3Bl8TYAgKChkLJ6zDIH65DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--wuhaotsh.bounces.google.com>)
 id 1l5ICr-00030d-8o
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 20:04:13 -0500
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a]:55318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3Bl8TYAgKChkLJ6zDIH65DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--wuhaotsh.bounces.google.com>)
 id 1l5ICn-0004Ue-8H
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 20:04:12 -0500
Received: by mail-pg1-x54a.google.com with SMTP id 18so5108377pgp.22
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 17:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=VL23Jq4zsCC8gbzhOtcPRl3gDc/bB4TFHM4RpZZGZ/0=;
 b=hvpVBGAwMg6vgYhLpyxt6wM5jLl39rhAoOxOsRvT8VAIAkgv99IIhBTaTvWK9Ruo9l
 q5L7uT67i5k/pdtbUCWDVwuFTFbDepwe0L1g/Y77hR2dOOzhVahCiyMEnKU+7u0ZTN/R
 tsgWT0OOfwsFfM8a0BtFxacTRwcSOoGheGex2XNyp1O2PUWCAiYrbRiP0IhrKbHwly5T
 gfaorIT364ScK4InuUGBgA03nkw6hIkwTAeGOvUgJgCrkO9RV4O0XJQOVIO9GVnG+ZxW
 8fbnWemPNTsdMVrOvTAmCQq236e/LCaIHjIihYKFWoy6CnLi03/NVjLy+DY0taoNLBPg
 pNcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=VL23Jq4zsCC8gbzhOtcPRl3gDc/bB4TFHM4RpZZGZ/0=;
 b=ZJ9xjXYiQaVimHNSVUmh8DtI72l/on0oqzX+hcPCtPB6Vco8Cyi84/BJIBKvMj/PQD
 2R1TBpQTBojv3PyjZ0LtF6w/b4x1ZPEBnMXURVKQ49K/jSwsZRyZxRRNyyZS+t+0I8+7
 YhAMJ4GZ4t9QpQEYT6leVcnWjNTkvqnx2gtOB7eK40izcEXl/Fn+G0DfDb1ZynV3xAFg
 d3DFeCxJckOSwzZ8FI36yjUd/sGzDRYmx+7/VvIFRhVLQsvAqLrlT2bCzlgg78hMYy/w
 fArqhlup8Y9Ebwot0rFLXZIJL07+Ik7wCYxKVFfPy5uhyL9Qr6Y8PPZP4yrsgwj27+QP
 nnHQ==
X-Gm-Message-State: AOAM530q5ELX1YAp76jo3mmWtfwNVPAY67kCDPSTTGebhaFE9L1jzbdF
 OqTk9lJ78Pip0yIt9WrisuZyKkzikiMSAQ==
X-Received: from mimik.c.googlers.com ([fda3:e722:ac3:10:7f:e700:c0a8:4e])
 (user=wuhaotsh job=sendgmr) by 2002:a17:902:7008:b029:df:fb48:8c3a with SMTP
 id y8-20020a1709027008b02900dffb488c3amr1975177plk.19.1611882246267; Thu, 28
 Jan 2021 17:04:06 -0800 (PST)
Date: Thu, 28 Jan 2021 16:58:39 -0800
Message-Id: <20210129005845.416272-1-wuhaotsh@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v2 0/6] hw/i2c: Add NPCM7XX SMBus Device
To: peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::54a;
 envelope-from=3Bl8TYAgKChkLJ6zDIH65DD5A3.1DBF3BJ-23K3ACDC5CJ.DG5@flex--wuhaotsh.bounces.google.com;
 helo=mail-pg1-x54a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
Cc: cminyard@mvista.com, venture@google.com, hskinnemoen@google.com,
 qemu-devel@nongnu.org, wuhaotsh@google.com, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, dje@google.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Hao Wu <wuhaotsh@google.com>
From: wuhaotsh--- via <qemu-devel@nongnu.org>
X-TUID: ym00+R9lM1Cm

This patch set implements the System manager bus (SMBus) module in NPCM7XX
SoC. Basically, it emulates the data transactions of the module, not the
SDA/SCL levels. We have also added a QTest which contains read and write
operations for both single-byte and FIFO mode, and added basic I2C devices
for npcm750-evb and quanta-gsj boards.

We also cleaned up the unimplemented GPIO devices in npcm7xx.c since they
are already implemented.

Changes since v1:
- Fix errors for i2c device addresses for temperature sensors in GSJ machine
- Use at24c device to emulate GSJ EEPROM. It supports more than 256 bytes.
- Fill in VMState in npcm7xx_smbus.c
- Change commit message in patch 3 and 4
- Fix order in npcm7xx.c IRQ list
- Add a few extra comments to make things clearer

Hao Wu (6):
  hw/arm: Remove GPIO from unimplemented NPCM7XX
  hw/i2c: Implement NPCM7XX SMBus Module Single Mode
  hw/arm: Add I2C sensors for NPCM750 eval board
  hw/arm: Add I2C sensors and EEPROM for GSJ machine
  hw/i2c: Add a QTest for NPCM7XX SMBus Device
  hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode

 default-configs/devices/arm-softmmu.mak |    1 +
 docs/system/arm/nuvoton.rst             |    2 +-
 hw/arm/npcm7xx.c                        |   76 +-
 hw/arm/npcm7xx_boards.c                 |   46 +
 hw/i2c/meson.build                      |    1 +
 hw/i2c/npcm7xx_smbus.c                  | 1097 +++++++++++++++++++++++
 hw/i2c/trace-events                     |   12 +
 include/hw/arm/npcm7xx.h                |    2 +
 include/hw/i2c/npcm7xx_smbus.h          |  113 +++
 tests/qtest/meson.build                 |    1 +
 tests/qtest/npcm7xx_smbus-test.c        |  495 ++++++++++
 11 files changed, 1821 insertions(+), 25 deletions(-)
 create mode 100644 hw/i2c/npcm7xx_smbus.c
 create mode 100644 include/hw/i2c/npcm7xx_smbus.h
 create mode 100644 tests/qtest/npcm7xx_smbus-test.c

-- 
2.30.0.365.g02bc693789-goog

