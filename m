Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp1218818lfb;
        Fri, 22 Jan 2021 13:52:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz27x1Vlamdk4nbuuTu3qkzDJXlnadRPZwNCwJBe8BUSO+gvPWL6nx00AFxDHOzsiwN0g7b
X-Received: by 2002:a25:9882:: with SMTP id l2mr8755295ybo.425.1611352372203;
        Fri, 22 Jan 2021 13:52:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611352372; cv=none;
        d=google.com; s=arc-20160816;
        b=CHQB1x+Um2dQI25iW96m+qAU0+nTMYIWP8+jx1NU4YwWP6c3cpyLIG2/UjsDxTs5pS
         Ae7vibv8aXGkdRKS47+M0bajP+Pt9EWgAdhnHUu01Zm+81999k4gp1zxBXI+oMGuXnxb
         gOZ3j5vnpPLs6SpEEHk8CniXJ/rLB8SLM9aBSjvjvGxnUT4KOj0jNmNhPGk9CWIBpvXX
         2k2T7alRcBGVCLW6W+W72E8/05YezI7Zn2UN3S3oDI04xKVAYm54yVch4wVpAKw7kFyC
         nSmnIp8Kwwji9ToM9zEeX4HjQE87mSkAzmyHiRu02dGJ6fOMt9a+vh7b/kvRgfUhi/JM
         TGUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=F3NmXY82AVsBjMLhUcX3GeVAxWcAOFNsrsf94y63Cq0=;
        b=CStSMo/LuL3R2MAfrnOUwiovX3eZ3hDfgTrI+10RNJunZxe2LdtnTpoKi2nJo94Op1
         H+8W/iksHI4l966NwWzS+Q/dGjQHtfvgfs116xXXTETx2UtU4sdGGCHOf8LCCuOSIRW+
         9MHIEuauASn23BPa4Vihvl6xQpyKxWUr7R9stBiya/k5GHdwLy4cqdXVBJ5gWGiRKz4W
         rUIlL26qjaEcC3gs3AQ+OryZb4PxqYs6iObrmE1Ylvw6DR4ipqFvxRB2awxH+nhue+8C
         CSf0z6k4mctEBU0LlEqNzM3oHMzQP2PowHeOJenUo2ZENz6sPqB5pxDQwZNf7tfoivzJ
         9OZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pRFYWlBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si3567799ybr.119.2021.01.22.13.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 13:52:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pRFYWlBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l34MN-0000Tt-Ky
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 16:52:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l34M4-0000Sd-Nn
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 16:52:33 -0500
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:44316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l34M2-0007GY-8s
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 16:52:32 -0500
Received: by mail-lj1-x230.google.com with SMTP id f2so3009011ljp.11
 for <qemu-arm@nongnu.org>; Fri, 22 Jan 2021 13:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F3NmXY82AVsBjMLhUcX3GeVAxWcAOFNsrsf94y63Cq0=;
 b=pRFYWlBCZbepop+QMXe9sLJGi2YLCVzJ2inK2+C0xo8fpz5ZEMHKbGgtSK0sN0KUC3
 WYf5UqV+6HW5fX9RQMnQt+ryXl8zAriZx57RgrXXqy7my92f/CQtx/lVpokQhF+gbfOo
 FL7ROmgPh+SM48wMuAf+NJwOnyPS7Aj/IeN7apxNmtRR3yGLeoxVD3K9DEUha4QSpsiX
 aMNVswN5ApqFeAMDppx77/QO7yk02KrEEwU1Cw964dplfy/jCGzCddrbyIWJD+P+r0dH
 ooXBCAMrevPFUXFGMpHffJ/LetDzUYkoY90hATKU2O3a3bcy6jN9Bhtn6HOryTGtdLY8
 32sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F3NmXY82AVsBjMLhUcX3GeVAxWcAOFNsrsf94y63Cq0=;
 b=uDIiXPflGoKZk8kANIWjjp2y/h76KB7buL9hnDvk2v73noJdgLZLgFSqq6Z8NprwjG
 w5U7+Jb/+KxSQrsPoPXPSgJ40q3RJ9nNKnV0zXkpuINCGsslkJm845IMdhzyDStrnWgz
 Pa79QxoPmH8SIHjPaiPH9ptnDeqvBvV/8OEdYrLqr1TTo+6nYoD4V/F5inJuN/rlDz/8
 mhb088fm46/l3qWCD1MSGdDca7Jl0iCXS1oCDkCbmCvIsJ73Uh1pkIRdpB2cycBn7hZQ
 NFw1dt55y7zQWR1RHvlbkUUxlNeIv03xlDti+LmJfnQjKsZ/pUM7eGGcAnobMaWee7jm
 dEjg==
X-Gm-Message-State: AOAM531iiMXYTvplQOlXJeHGYXSNk3SF6N27bgM7iSKOoM95TGyZEaoE
 ZrqxjLy7/WgyMKiIDJpjg1q9K7pN9znM0g==
X-Received: by 2002:a2e:96d8:: with SMTP id d24mr1586288ljj.62.1611352346168; 
 Fri, 22 Jan 2021 13:52:26 -0800 (PST)
Received: from localhost.localdomain ([176.59.42.245])
 by smtp.gmail.com with ESMTPSA id a11sm1019890lfl.22.2021.01.22.13.52.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jan 2021 13:52:25 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv9 0/3] arm-virt: add secure pl061 for reset/power down
Date: Sat, 23 Jan 2021 00:52:19 +0300
Message-Id: <20210122215222.8320-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::230;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x230.google.com
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
X-TUID: UR/GVaNwaeuX

 v9: - cosmetic changes (move if from patch2 to patch3, rename function name
       and define).
 v8: - use gpio 0 and 1, align dtb with kernel gpio-restart, gpio-poweroff,
       change define names, trigger on upper front. (Peter Maydell).
 v7: - same as v6, but resplit patches: patch 2 no function changes and refactor
	gpio setup for virt platfrom and patch 3 adds secure gpio.
 v6: - 64k align gpio memory region (Andrew Jones)
     - adjusted memory region to map this address in the corresponding atf patch
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
	https://github.com/muvarov/arm-trusted-firmware/commit/886965bddb0624bdf85103efb2b39fd4eb73d89b

Maxim Uvarov (3):
  hw: gpio: implement gpio-pwr driver for qemu reset/poweroff
  arm-virt: refactor gpios creation
  arm-virt: add secure pl061 for reset/power down

 hw/arm/Kconfig        |   1 +
 hw/arm/virt.c         | 111 ++++++++++++++++++++++++++++++++++--------
 hw/gpio/Kconfig       |   3 ++
 hw/gpio/gpio_pwr.c    |  70 ++++++++++++++++++++++++++
 hw/gpio/meson.build   |   1 +
 include/hw/arm/virt.h |   2 +
 6 files changed, 167 insertions(+), 21 deletions(-)
 create mode 100644 hw/gpio/gpio_pwr.c

-- 
2.17.1

