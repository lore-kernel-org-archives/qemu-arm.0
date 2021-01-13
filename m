Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp280718lfq;
        Wed, 13 Jan 2021 01:40:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxxNKAZH4Kgh9ujwfao9afwPkZoe5DAqFR2ElEuzFmr6gx/cry7WIcB1YOl/ZEQsEhtUQh
X-Received: by 2002:a25:9b88:: with SMTP id v8mr2145005ybo.338.1610530803280;
        Wed, 13 Jan 2021 01:40:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610530803; cv=none;
        d=google.com; s=arc-20160816;
        b=UZWp3lFQSz0VWertr+Lzc7RAzdiq5zUYR6PBQNYMbz2NQZhzleBS4JtPH1/DQPMYmI
         gdZjjxlWAE8MAAYG7k9b7S9bxsnsfCjpF5nkGh5SSZsRpCWkiPl6XvPDpRIfGF0aiGtR
         kmJgzgb3hHXGhgiDzHC+ldtLUGcxGrajbYpAzkEeglpKHJndall3TIuJP9bcNRLrK0hU
         V6QXhmcmfKIo7KPhj5EOJXxZfpsrooWcIbfh3LRyzrJ2wnYoIS3MaEbKn+EYPKqNrtK3
         Yoabjym+GxTBN493xFPqP8X/CcHcefrUxeSw1ZNAyXA7UkikaC+fLAz4OGP+Xzj9qQUk
         3bmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=hBDRE3qynYwWfAy+Mm1zpl50/3ms5+CYx7IEUQMytFI=;
        b=oIgFGPxHIeFBMjm7PIZ/WUXsksulPyyO2qD2k6agSfKU4KxwBUYHCh22HPKEdMsufK
         0ANO4wKb+iNPHetPk60e+l7apA0Z3KIgoOP/Q05zbYvHy68dVcisl3Zr6rHlAdeoLtKu
         Slxj/nHG2OUuEMR8nGfjwV8hVXWDxWGwz3IMK4VuLy2Rt737zNmh5yIVUhyy5wgBbZFT
         deUZhmScYnMwx5OaQK9HOF6LcK+hOKfEukXjfeD7lX7Oxr8oOSpNoJbckDTYwSBT3LIE
         21GghNN5FSxfpzPFRqULI+ER/Bx1BpEtT9Ps3ybYfEhySxrp3klstM5NguezJ4XU96Qq
         Wk6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CzDb30v0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1si1658111ybq.405.2021.01.13.01.40.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jan 2021 01:40:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CzDb30v0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kzcdG-00088Z-M1
	for alex.bennee@linaro.org; Wed, 13 Jan 2021 04:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzcXp-0001BB-Lf
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 04:34:27 -0500
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1kzcXo-0004G1-1O
 for qemu-arm@nongnu.org; Wed, 13 Jan 2021 04:34:25 -0500
Received: by mail-lf1-x12f.google.com with SMTP id o10so1730442lfl.13
 for <qemu-arm@nongnu.org>; Wed, 13 Jan 2021 01:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hBDRE3qynYwWfAy+Mm1zpl50/3ms5+CYx7IEUQMytFI=;
 b=CzDb30v0TBSF3EyHcPdyAVckpdAIvTBD2uPxeSLBVWyngh3EL8ZeZLPn7igdB3tLq7
 rWqNkg4EoJgIRUro5oPxeEPLmmVb9pAEowsV+3TAVpXFmgTBXrEIITSpUBedMpYpkNPr
 O1X2zBUFOujqMECGRWV4NvjLp2lLxI47qRyp6dz9y36ezjUqkvzzTJopjlxMO+FZQuGf
 NzRPG2o7rI7baJxMi+frk2Wu7LVyzjUXNy6KgtpZ7iThvUUCzPDVPsMJSTFtR3zp0suD
 iwlWn2fXCstbmNg0386d6E1F4x58b22a1qaQPZlzAc6ulWk4Tx+uP+USdgeC5PcKfX6h
 gtJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hBDRE3qynYwWfAy+Mm1zpl50/3ms5+CYx7IEUQMytFI=;
 b=VYkhC5R4EOcNEi4tjNxo1Oor1+OttMrmAoiOoaKz4IfiuAaycPXyQ9dCmDUBrmKlO2
 a/xo5keCXPjBJJ/wUkPE9oyjflWUtx0gMXj83FRLd4i35oNZAzi2xBYdVQfrQufFplUU
 vHLbuiGyIEmXnCSX9NJFPbj2g05mbC0ZCOJY36NRQmGjLsLLoIPTTCyAErxigRep2Jix
 8yDB79JgOoYafnPf3MmGl7I+dWZR6na2c+Qr/PycE5iIj4Tx4/eCrWDbzUM8FJkDnsl8
 NGh+22kQFpi6BsDYOSSreajZ95ag67CdlUM8sekpmjJ7PAKqnoPQAHZG/ord6HylybdW
 F3Mw==
X-Gm-Message-State: AOAM533BRg7m1NItjyJpAfb0Iv0BBvA1DCDme0wDlQgPpacr8NN2lJga
 shz5ZP68rFR93PPweaLkX5Jq6cpCRJb1Jw==
X-Received: by 2002:a05:6512:788:: with SMTP id
 x8mr531622lfr.250.1610530461551; 
 Wed, 13 Jan 2021 01:34:21 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id c3sm127472ljk.88.2021.01.13.01.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 01:34:20 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv5 0/3] arm-virt: add secure pl061 for reset/power down
Date: Wed, 13 Jan 2021 12:34:14 +0300
Message-Id: <20210113093417.11606-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 Maxim Uvarov <maxim.uvarov@linaro.org>, Jose.Marinho@arm.com, f4bug@amsat.org,
 tf-a@lists.trustedfirmware.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xXSC4cgyEQTp

 v5: - removed vms flag, added fdt  (Andrew Jones)
     - added patch3 to combine secure and non secure pl061. It has to be
       more easy to review if this changes are in the separate patch.
 v4: rework patches accodring to Peter Maydells comments:
	- split patches on gpio-pwr driver and arm-virt integration.
	- start secure gpio only from virt-6.0.
	- rework qemu interface for gpio-pwr to use 2 named gpio.
	- put secure gpio to secure name space.
 v3: added missed include qemu/log.h for qemu_log(.. 
 v2: replace printf with qemu_log (Philippe Mathieu-Daudé)

This patch works together with ATF patch:
     https://github.com/muvarov/arm-trusted-firmware/commit/dd4401d8eb8e0f3018b335b81ce7a96d6cb16d0f 

Previus discussion for reboot issue was here:
     https://www.mail-archive.com/qemu-devel@nongnu.org/msg757705.html
Maxim Uvarov (3):
  hw: gpio: implement gpio-pwr driver for qemu reset/poweroff
  arm-virt: add secure pl061 for reset/power down
  arm-virt: combine code for secure and non secure pl061

 hw/arm/Kconfig        |   1 +
 hw/arm/virt.c         | 118 +++++++++++++++++++++++++++++++++++-------
 hw/gpio/Kconfig       |   3 ++
 hw/gpio/gpio_pwr.c    |  70 +++++++++++++++++++++++++
 hw/gpio/meson.build   |   1 +
 include/hw/arm/virt.h |   2 +
 6 files changed, 175 insertions(+), 20 deletions(-)
 create mode 100644 hw/gpio/gpio_pwr.c

-- 
2.17.1

