Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3065244lfb;
        Mon, 18 May 2020 07:03:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzgd/UdSKkn3Lxv+Ul8kD+XyXwJfD+BJoWasP3dxag1bcfq5MgotK+bVeV+xzlBDMs9xmN
X-Received: by 2002:a37:a342:: with SMTP id m63mr15500011qke.360.1589810605246;
        Mon, 18 May 2020 07:03:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589810605; cv=none;
        d=google.com; s=arc-20160816;
        b=k+wAgF8oC6aQElZrKbNKyAmrdabwIcSOfAghiExdgPxFZRdfwXqm2B8GYarQB5Ak8m
         118Zltkse60mzSO4C2ONAIIs4v8NRQYMEGfwYV1cCHHuqcW+PBhBNDDEPZi5UavlWNaV
         1eOe/F5WzIXjTyw0jaM3+PCBE31SS/ZUGFlssUaAr67Aq01TqraiE8uQdBl+xuC9doST
         Bg26udukA7CP2MUoUfOGaULp/3dbXmiz0qO0PwbHXKRz5ZUN6tcuIEUw8cjHR8g0KjFc
         vKsOtmiYb2uwNm8Sy0mJevfEKoXS8wIPAXH749IynvpNviQlfdGwG+oobgahxwGbKTF5
         4jzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=vfnYOQleJQ6IdyBYvfI24RwcBQWp/agghDF79thh7b4=;
        b=g6Dk/kzjFim1cFoUzLErecHCt/qXlzPdGunDQPiDpV2xeCCFeX2GvDSw9mEpBvF4Vi
         3OssHcu3xNK6Hh1pG4AejMm9wzB2aLJagFxyAVITOsOxeezqJ106tP4NMZ76zevqeeR8
         Pv24Vbwi7j8WcKcOrbTNyGYhnZf5XA88PDWV/k9itObNXjkR2tSX7JNgv5ByDLsl7e36
         yMza3NCwIgxhz/HMbdw/rz3yuGQSW+2E/KEqpeGSdv4gr2HBMg2TQ+wBD/6gEmyIGLpN
         KQfJm4fy7jsxZCkYZswoWZ6FKS/CDgqyvvs/7lRjMdrFTx5CvzZGiJI5Y0H+IcW5dvD2
         C/aQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="g+c5Hz/p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si7180228qtp.330.2020.05.18.07.03.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 07:03:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="g+c5Hz/p";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jagMW-00046y-Js
	for alex.bennee@linaro.org; Mon, 18 May 2020 10:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jagMN-00045t-Od; Mon, 18 May 2020 10:03:15 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:38560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jagMM-00018T-63; Mon, 18 May 2020 10:03:15 -0400
Received: by mail-wm1-x344.google.com with SMTP id m185so5690294wme.3;
 Mon, 18 May 2020 07:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vfnYOQleJQ6IdyBYvfI24RwcBQWp/agghDF79thh7b4=;
 b=g+c5Hz/pQuLeXvRxlsm+c6ul3Cq+rs+dR3r4d6YCdyyDU0MnlKI0txWzzn8fnoiXlQ
 Tl86scie3/Sf8Rq2fxV78KMe8tahnGnWDRskDjj+Eh3i83HCPVx/FmUnhjd/49km33iM
 mnUWUJ35rg7qJkukGIJO91YKgRiRZ3sySWe+eI5FR5VY91JHlircUXTPYUNeW1VlguQ2
 0HcVnPWVQRclcpzGL8/HrL0iPdHH2DNEr6TdD+Ls7LDIURTSs87Paro2rMGYp5emnb0P
 HYDW/hWVzzRIKrNsXu+QoATjKHP0zDwUad/v6MqvkAstpc0OVLk8IVB9/SxF6Y6/6isW
 HDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=vfnYOQleJQ6IdyBYvfI24RwcBQWp/agghDF79thh7b4=;
 b=YxYZ+BQEhRTHU9CBlI4RzKi7u3mopsuEFedK91JmmFYq3GKhu8y4TghckymddGWxnr
 EWiazE5X4EBGL/6ACMFAAfsrBV+Imlx74oHNOP6nm+4NZbES+5leEku5L4IpT3twOUS9
 yx12kE5cEQ8w9M+dNq2n9b0cDRXKxRwGocjJlUeljAgAAnK3+bewdZarX+wBWB8xD2pQ
 rp2/S35rug6rcciVcYuUKgniLkG+JerdTjEb3Oh64VnEaEcpdqOo49o5pa4GwV+SlGij
 DqF8KnElABc5hTIZDN0Yli0m9zhzWTeNjRfd0ElZF4O8V/RH14jLrcnbtfatyPJSISwz
 mDuQ==
X-Gm-Message-State: AOAM530wBJRHyQMPaU6avasx3/uQmwjLlVpuHRMxmjs9VVz4JEfAo9iS
 3kfPe6h8ww7EbB89gLMJ0a+qaDtU+10=
X-Received: by 2002:a05:600c:1403:: with SMTP id
 g3mr20554009wmi.51.1589810591816; 
 Mon, 18 May 2020 07:03:11 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id s67sm16611946wmf.3.2020.05.18.07.03.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:03:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] hw/arm: Replace hw_error() by qemu_log_mask()
Date: Mon, 18 May 2020 16:03:05 +0200
Message-Id: <20200518140309.5220-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BX/OVXsXsFqI

When fuzzing the devices, we don't want the whole process to
exit calling hw_error().
Replace these calls by qemu_log_mask LOG_GUEST_ERROR/LOG_UNIMP
when possible.

Since v1: Fixed uninitialized variable

Philippe Mathieu-Daudé (4):
  hw/arm/integratorcp: Replace hw_error() by qemu_log_mask()
  hw/arm/pxa2xx: Replace hw_error() by qemu_log_mask()
  hw/char/xilinx_uartlite: Replace hw_error() by qemu_log_mask()
  hw/timer/exynos4210_mct: Replace hw_error() by qemu_log_mask()

 hw/arm/integratorcp.c     | 23 +++++++++++++++--------
 hw/arm/pxa2xx_gpio.c      |  7 ++++---
 hw/char/xilinx_uartlite.c |  5 +++--
 hw/display/pxa2xx_lcd.c   |  8 +++++---
 hw/dma/pxa2xx_dma.c       | 14 +++++++++-----
 hw/timer/exynos4210_mct.c | 12 +++++-------
 6 files changed, 41 insertions(+), 28 deletions(-)

-- 
2.21.3

