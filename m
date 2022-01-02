Received: by 2002:a05:6512:15a3:0:0:0:0 with SMTP id bp35csp9951378lfb;
        Sun, 2 Jan 2022 14:04:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgqaX9cpECP5R49lO2zxr4FiIUd1yXciKzafD45996IUlD1dUUx8zSBqtMTG2ZlaU7FfBT
X-Received: by 2002:a25:4dd4:: with SMTP id a203mr16376992ybb.580.1641161078156;
        Sun, 02 Jan 2022 14:04:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641161078; cv=none;
        d=google.com; s=arc-20160816;
        b=h7R0w4f4Wqjv4DaiWk1VhwvQ32wrEHpHtlmO5Lm6Xrv6UjPqjXPgI2YA3ZI5w+ruoT
         Oh6y1miRw5pE6TeeT4MNZtylOBe5zKAtpJCv6675PWGBpesVl73RRiwdT4/IRAwldMBO
         Ze4VSZ0n/rKW/sNVeofRK+kIn4mUXOZYSHMFuvS8rFHLlxwbJvO++Zos6lYwBVp10nWR
         TVRr9cT9hJMJuZIB6jX1WdhgFq16+C+4l7ltgQNQYO2629rho7/Wgs17VFoaYsY6JK2N
         FT/plX3F2q/wQGkTllSg0d2/aoSsygPWPwotaF8wJG2S7g/IA+BexHnQnkfZerJi8MOE
         UbsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=dqiWh61Ltx0KweLLwdv+Yg6cUqnUGT6QGn0gQRY0MJU=;
        b=NNX2b/VvQHy+bWjk6RTuv/p5ViGEQYIig2Y26nXAYVOrexD1lJfoCBCG/AobcjlUju
         VhEgr64PlDun3Ffw2HBehV1F7ARggIm6hBF9zuGtrpQFKV3z1GGBUTncn5m9SiAzvkXE
         7E8UqP7FDvdGEHDV1TylrZN+leVF2jhVgdmFt1algZrqd98MDbhbWXGkpwXIpoeTAsI4
         D9JOcihYKoC93TLQMQoOXUi2I27/qLgY5uzwP/li2gAa6+z1sV4bo11DP+l8345z8/mE
         DypgfUMXL9wt8ltt62bho53/7RZD0lR5a5Yh+57x5kCwE4VfhTXJV+iDpqUvhvKEVCGW
         zsnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=EY7SMYbm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o3si6071506ybu.158.2022.01.02.14.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Jan 2022 14:04:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=EY7SMYbm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:45996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1n48xx-0000Ol-KP
	for alex.bennee@linaro.org; Sun, 02 Jan 2022 17:04:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3HCDSYQcKCLkudmstqdfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--venture.bounces.google.com>)
 id 1n48xg-0000OX-SI
 for qemu-arm@nongnu.org; Sun, 02 Jan 2022 17:04:20 -0500
Received: from [2607:f8b0:4864:20::94a] (port=42736
 helo=mail-ua1-x94a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3HCDSYQcKCLkudmstqdfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--venture.bounces.google.com>)
 id 1n48xf-00059V-7l
 for qemu-arm@nongnu.org; Sun, 02 Jan 2022 17:04:20 -0500
Received: by mail-ua1-x94a.google.com with SMTP id
 x4-20020ab05ac4000000b002f713d873c4so17030948uae.9
 for <qemu-arm@nongnu.org>; Sun, 02 Jan 2022 14:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=dqiWh61Ltx0KweLLwdv+Yg6cUqnUGT6QGn0gQRY0MJU=;
 b=EY7SMYbmHdqMCbk6sL8wzaeuNZuuyHnPL5twbplZeQ95nMe02ab0qyTydcOj4grlyJ
 +48P3IjIX+iyNhCPQBoUsYkaJh4E5r7KC+rDikafoiBeQ/0h+CUFO7SuxPR7vyz7DjPz
 i8XeZeqlOM3AL+2S4EYY3lTqZlp4qRSRDN370s9ZRZ5RIQOw1T6+e/FRraJZrkp6FtAX
 5FXyyeX9oDuYbG4sfNsjgdzdO8wGR1DtQ6qt+bY4QobyZXCrs7JgVoFSBws6wqBEuIwn
 jTi975yGOuprUCPLckXl/sG9XCkqkjXyF8Fm/VLvzqoUemlKCUDvV9fBb0r3quQlC8Z4
 pq7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=dqiWh61Ltx0KweLLwdv+Yg6cUqnUGT6QGn0gQRY0MJU=;
 b=in0XlYnFLQnzd+rWJ9xxI1IE4scYmFgXrO3nJHZpYXbJnI6MTyiw0jCwwabJuQgOKo
 e9Y24lQBmgeZWxKGnZlfueBsG+NG8cRX8BVzUktlpLURwOuDGHxV4lOUKsBXYStSwXXG
 gJlIILCOLYal166I7QTT+LjZSTPTT3wa9ITcfwjiPjnJ4f+2CujTBcS+dyhgpJ28ihNM
 JsqAFcXgKTZjUo7Zu0wj77rR4esYI8XIvkCgbwq/F4XSVsmU7e4TgV1yekMqC6NNeumf
 goFksgiorjnbqDwHblNobnHG+DQuNp3LHBD/QE5dvGlhBLMBpatzhggPk4EEFY7lPHvH
 afSg==
X-Gm-Message-State: AOAM5323GD+x/RgC5PoNYYQlrYEZbS0h+0FjKPsfuAuKVC4p5bc31y/E
 DDs+1e7u/n9GT16thHw11dOxhmF0uFX4
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9adc:6d14:2e33:8585])
 (user=venture job=sendgmr) by 2002:a25:b081:: with SMTP id
 f1mr42622516ybj.409.1641160732500; Sun, 02 Jan 2022 13:58:52 -0800 (PST)
Date: Sun,  2 Jan 2022 13:58:40 -0800
Message-Id: <20220102215844.2888833-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH 0/4] hw/arm: Add more devices to kudo-bmc
From: Patrick Venture <venture@google.com>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, crauer@google.com, 
 wuhaotsh@google.com, titusr@google.com, Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::94a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::94a;
 envelope-from=3HCDSYQcKCLkudmstqdfnnfkd.bnlpdlt-Zqlmnmfmt.nqf@flex--venture.bounces.google.com;
 helo=mail-ua1-x94a.google.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) DKIMWL_WL_MED=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I0umiXsOP3IE

This series of patches adds various devices that are defined in the device-tree for this board.

Chris Rauer (1):
  hw/arm: Add kudo i2c eeproms.

Patrick Venture (2):
  hw/arm: add i2c muxes to kudo-bmc
  hw/arm: kudo add lm75s on bus 13

Shengtan Mao (1):
  hw/arm: attach MMC to kudo-bmc

 hw/arm/npcm7xx_boards.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

-- 
2.34.1.448.ga2b2bfdf31-goog

