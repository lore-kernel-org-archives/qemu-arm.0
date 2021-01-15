Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp130546lfq;
        Fri, 15 Jan 2021 02:11:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4FASHQS6NC+5Aua2jTAZ4ol0NCY6nkkE+W1q4k1f4pMq1fuOBUrq26zLxD9uOurudbV5H
X-Received: by 2002:a25:5e42:: with SMTP id s63mr18337244ybb.202.1610705502553;
        Fri, 15 Jan 2021 02:11:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610705502; cv=none;
        d=google.com; s=arc-20160816;
        b=Bv1JBpISIX/qAPL64bEem3z/5+tJLQfs6dWKcwqjQEL/wIsKCY/LL2JO2QPzU4qtOr
         0M4/QuahjnmkMjLRJWs2agygxM2qDTBTizGmOUl9v14Y6E+4VFLGxLhGiPYDMqBoQ61i
         7QERM9REYzy1buhB9aRERHD2ny2EITJDwlR/Z72wAAC9x5exW57SUFjW7QJMRs7GYfUY
         +3GbdfK1WB4nNcTuKMksn5YnZ3v3cygistGGL4+E2OW517h01UKfVvIbfRHU7f/9j3XV
         gP2Ch7sXKiKM172WB5dKUfz1WROENrnMaELGi+fxj3XBLCxCe3WYNHAvPm9VokujvghF
         Ai3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=dI3m5apsFpRzkZoJU0PtHodMAshsYUKsXH+0XXCFfFM=;
        b=1AUtJeUHrZR4GyYEC4pvCnm4k9q3Kc6NpZOm0Nh45LnIsWPwW7GF8+phqPIrOOVCyt
         NbKay1G8bkjTr02JwAqaugekbNEHhzJABQ2HmCOnCw9qkoEYKnoJ+/cfcqFtV6eh4Vw0
         6Mdcp5Kcdwi8i/N36Op5OAs8rvabzDyhuruBEgQ6vpexr7ph1esdareSE+FBhGosSxZ5
         84i4mRJj0/G3xF4U5nOf8hDAeGTNIJ+9N2j5xxKawX8nfhWFgVfyrldpTjH0G1HaG+Uc
         wl+ivDaIKX2LRaqs4HzRBRIHXahNGlbk7Zs1HIcJv/XwtkzL9x6TZWnoC18aHX75+bnl
         89oQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MHyD8mGn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f132si8175413ybg.39.2021.01.15.02.11.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 02:11:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MHyD8mGn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0M4z-000441-Ut
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 05:11:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l0M4r-00043o-UU
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 05:11:33 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:35646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l0M4q-0001xs-6o
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 05:11:33 -0500
Received: by mail-lj1-x22b.google.com with SMTP id p13so9811185ljg.2
 for <qemu-arm@nongnu.org>; Fri, 15 Jan 2021 02:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dI3m5apsFpRzkZoJU0PtHodMAshsYUKsXH+0XXCFfFM=;
 b=MHyD8mGnSVVB1d36yaC+ardXR4WaRHkCgqUNiOafXFgC1UMzHzoMkQ+OOaTNkw43v1
 TljI25K/B/u9lfjL7iV04wpADD6sWCk3SORQ0c5uLxk26jf+4SX51m5jqdZNegtcw9gX
 UZhlQ/1itisx7/+05hAiI2w0EJkvRivfkL+fcJD63DrKEeIO/2RLyv451erS1niumvRb
 QY9N4B1pMtYRk1KLB885Qzbo2q7jn9sKo/7zXzyf1pAocszo5pqDPstz14qs4FfvtBYI
 57d5CuGSyqRt2WidoSqoU5jcq1asaT+42PORfVi+zzTLvHOq/G4Fjd4/2RzIaEs11UTb
 gk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dI3m5apsFpRzkZoJU0PtHodMAshsYUKsXH+0XXCFfFM=;
 b=dgg7hwmRetCSFSsIn18w9aIM635FdoxS0PP4L79VpaPHpENlPIup8eLNmMT873oO4h
 3FDnH89l3Y3WMvNlmWyVImS3nxDu8NNDkhsvlGMNaEwP2dG2qMLxpCxSTtN0nbXiPa+b
 0qMp6ivdN6Aw69eSHO0bnTSOyQSdl4141I5ONJ/kLLyZH2OfIhxDicI//qIM3Lh5cOW/
 sQu8eqKAWaEJaau+fCiU92Fcf48JgcZAOP9zHCjYi8twtp/DRCnjDl6nwG3tWIvvKGPx
 qrFyUUEpazDsK1LJRqfOdRjjuob5DwAjhh//PI2OPZX1yJTwdRwGqiGK5WY7kLf/UtG9
 QHJw==
X-Gm-Message-State: AOAM532ShtJsY4LzKtD+YLiHtEnj7P2qM1WwddAavOUDBV1hVeM0jgaJ
 y1AXvbsL+Ac2kPbH/AR72jkvHQ10iJS2tg==
X-Received: by 2002:a2e:95d5:: with SMTP id y21mr5262677ljh.477.1610705489942; 
 Fri, 15 Jan 2021 02:11:29 -0800 (PST)
Received: from localhost.localdomain ([91.193.178.207])
 by smtp.gmail.com with ESMTPSA id a15sm731886lji.105.2021.01.15.02.11.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 02:11:29 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv7 0/3] arm-virt: add secure pl061 for reset/power down
Date: Fri, 15 Jan 2021 13:11:23 +0300
Message-Id: <20210115101126.4259-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: LFJ+42Cz2Y21

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
	https://github.com/muvarov/arm-trusted-firmware/commit/7556d07e87f755c602cd9d90359341bdd14d9d57

Previus discussion for reboot issue was here:
     https://www.mail-archive.com/qemu-devel@nongnu.org/msg757705.html
Maxim Uvarov (3):
  hw: gpio: implement gpio-pwr driver for qemu reset/poweroff
  arm-virt: refactor gpios creation
  arm-virt: add secure pl061 for reset/power down

 hw/arm/Kconfig        |   1 +
 hw/arm/virt.c         | 117 ++++++++++++++++++++++++++++++++++--------
 hw/gpio/Kconfig       |   3 ++
 hw/gpio/gpio_pwr.c    |  70 +++++++++++++++++++++++++
 hw/gpio/meson.build   |   1 +
 include/hw/arm/virt.h |   2 +
 6 files changed, 174 insertions(+), 20 deletions(-)
 create mode 100644 hw/gpio/gpio_pwr.c

-- 
2.17.1

