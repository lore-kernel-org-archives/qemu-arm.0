Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp347736lfq;
        Thu, 14 Jan 2021 06:52:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHURWGFHNurYmoLkuBpVrHnMx1+0/pi7JBzAsx8LwQlGXa1M98NAFkhYbuhXp5WrCRoPMi
X-Received: by 2002:a25:9b84:: with SMTP id v4mr12100235ybo.83.1610635935883;
        Thu, 14 Jan 2021 06:52:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610635935; cv=none;
        d=google.com; s=arc-20160816;
        b=zcNperLmdCNzZ/J/KlevasNJk+7TMniFhkvKafHiDExeZG11aC7Z0GC/9YHlBhg3Al
         3HjVn6Cx2b9LPAzKK6GoKPw0W4hpRkBSWCiq9fgmsJPQa8+bWcelEx4rcWR/6Y3eVM+h
         bi+4ZRzZDCnMSdT56pmt0JSW4v4suezQJUotp8J/XqGpRN7aqJX7ehGZdvH3+mzejPbD
         inRNdyivXU5UBKNbX7kJ8W7B1hn9B2DR5xZtDxsmB1bKxEBDcPypzi/5JLmesXRinX7U
         OFmULd9deHVv7yCVNqbHHa/QTXe9EPXpkAnOlI/kgVbNZZV2myNIHxwEMzKP9ghl09gc
         8mIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=7anoKwBP87vLAvWcBLk7AZTOLxScckMQEoD5/U1zE7o=;
        b=0k6KoLUU1679onFo1V9jgdsr/CGJ4F2FNOoa9NyGAjMEpyhqt/MRHzDI99ltA/howY
         9Tlcg1/K1CbO3y8DrtWPCfo0Z9FMUGdQIi215ohBRRpYlFWy+1OVc51Py3d+pv1IGBcu
         MV2yyVtLjh7rwP0hAeW6e/VV6RywyVTTq6/CuUptOSKK53QgbQG3o4+YC77IilslB6We
         8fVFda5OoXqPXTO4kkfhFc0kU5P/ETD6POD3c0XEaj4vgqk5UJ5GY7DWAX7YTiEOoA+2
         Pmw1UvoMPr3jscDW69Orn89jC+XqcxWtH6LeYdlzNdy2rXp9AB+iJOvJLkY85Mg9WOca
         CcNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dlsC61WJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t4si5198876ybq.1.2021.01.14.06.52.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 06:52:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dlsC61WJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l03yx-0001U0-99
	for alex.bennee@linaro.org; Thu, 14 Jan 2021 09:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l03xQ-0008GH-S4
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:50:40 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:33910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.uvarov@linaro.org>)
 id 1l03xO-0003wY-PQ
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:50:40 -0500
Received: by mail-lf1-x130.google.com with SMTP id o19so8409711lfo.1
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 06:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7anoKwBP87vLAvWcBLk7AZTOLxScckMQEoD5/U1zE7o=;
 b=dlsC61WJ6SmTN5scCL5r1LmlzI7M8vjlbgRFHSwngVPZMWwfK+CPH+YEA0nYQM7QIB
 N5Dxa70Ajnx21OedAMrvm1oVjuqDGrG/tV9wGHhwlQtt2SRHi7JS6IEkvAUhZqbhTmpJ
 LMLpmL2NZCzKWeB+oqbaUtRt1C7iaTten64LQ+I3kuUo7dSw6v3sqTHAET47zGsFgCAD
 DAERmnqJC/lAFTlH4vMsBbtG/MGQhy/8cUws5iZtPpivLf4xKmODCZxmNnSBsHCtVVIv
 jKwM8qbAzBGxtB8UqJ7rwIOM9vNCCeZbUdmHfx3J98IvPL/mEwPDRSsp62XWgF9Uuq0U
 nKGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7anoKwBP87vLAvWcBLk7AZTOLxScckMQEoD5/U1zE7o=;
 b=c+Jx1VYjGDlGzpn/XpHUqohr8A01Co0drn7DKMmKjX+KL44KHb6bWFi+UM8HxMNh4r
 dBLDKf7wfXQ89koVJyOcJ1zRyp8J8G5fJN5vOFtEF6cThLxphvJ4gGh1xvK5juF0pGi3
 LcUvKiCSk48QtfQJILMvm9CZ8RfAqRGh0xHLxNtk+amS1AwRmQOGI+rAsB2aBIMmtjGW
 16rN56dfPxmw1mO6Vsq+yXfGqCi81+NX6KYFgObw/e8TZx2wwYmGkYwTvxrzMoIctQtp
 g+Krsuxo7vB+Y+NXi0QXKR1jNwYW3RQF/MjChM3wUnXCMdsMnplNkuE76urScu0oT4Qu
 l3hg==
X-Gm-Message-State: AOAM532+Rv+1O+7iKacVYwOJbUFl32l8ATEqgLDSwQ9jPVm6S6gpIUpT
 f4LJc3FS0y0f+E1y7uRUjjV9Aw==
X-Received: by 2002:a19:500a:: with SMTP id e10mr3420221lfb.193.1610635835331; 
 Thu, 14 Jan 2021 06:50:35 -0800 (PST)
Received: from localhost.localdomain ([2.92.195.184])
 by smtp.gmail.com with ESMTPSA id p5sm567229lfj.295.2021.01.14.06.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 06:50:34 -0800 (PST)
From: Maxim Uvarov <maxim.uvarov@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCHv6 0/3] arm-virt: add secure pl061 for reset/power down
Date: Thu, 14 Jan 2021 17:50:29 +0300
Message-Id: <20210114145032.8457-1-maxim.uvarov@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=maxim.uvarov@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 Maxim Uvarov <maxim.uvarov@linaro.org>, Jose.Marinho@arm.com, f4bug@amsat.org,
 tf-a@lists.trustedfirmware.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7gbNvfPP7v6N

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

