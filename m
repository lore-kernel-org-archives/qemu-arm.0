Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2673058lfc;
        Mon, 25 May 2020 23:23:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvW6kjUpQ++yenQcv09hbsItZNMyYXpAM4tV/dTLrl0x9fdutJUykDm5h7eQaiYHJqbzZS
X-Received: by 2002:a25:9d0e:: with SMTP id i14mr46754662ybp.64.1590474197880;
        Mon, 25 May 2020 23:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590474197; cv=none;
        d=google.com; s=arc-20160816;
        b=O39Gb2oJyd/BoFg14RrCuLxp3CY5S2jgNtfbeUiGPmWc0MHq839HBV064nL11SKVVO
         fiu+VMQngQjuuFu9LoNwK6/V9425eIcz6RxWwIN66TioVzDb7a6AzpxArRITuxI5Wx7T
         4BwcKeYi2Rx23GfUKrD8GMgvJ515MJ5vO7RVHvkcKTs6PR0le91AQS3zxxA0GcVvk6R7
         c/YX3Y1+EuWH7EZ2Zz2dDnVUmJGZYM23AXFbdSagrmRoJ5cXmCd5YGdhusO2D6EDLPnB
         pCP4Ee1kg/oZHLYKqTb43cibyQqQgpDCwnQvvYOcYds20Gcz85yRVaKrWfSsasSwyU/w
         pYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=avhE6gBkKAagMNQwah93PXvXm+qCCybJNaChmafxJlE=;
        b=gmmmpNdUNEscqbYyTdfpmX6F3YJumIul2RTzRWJfe2Zsr23/oDJOCSR9norIbtSHku
         K/dnvxc+31P4abNcqLgFWgKG3/Xq9M5cagQtFcXW/QER9jPtSf2DjKqz/De98f41E1ET
         O6E+b+hgSlorA3EaBk5tWz7q+PrlPyrAC15DyQc07zdpKSpQ49ye0Ir1npXmz9s1cOGH
         g7GrNZAlo1Wq905NgiSA2YaCvvtoMLVhjKuQawfcgP9tdOHFRWucVXuqLXqXSuMTczaM
         vIv/NzPWoFAVW2V+uWulLAg4J9JyUrbmUdUGeeBNDLyzj54lHcvzt41HIjI0JH6xrqrQ
         biwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="ta/vaGFr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s70si18341239ybc.43.2020.05.25.23.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 23:23:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="ta/vaGFr";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:48384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jdSzd-0006sX-77
	for alex.bennee@linaro.org; Tue, 26 May 2020 02:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSzK-0006QF-Ce; Tue, 26 May 2020 02:22:58 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:36172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdSzJ-0002SZ-G4; Tue, 26 May 2020 02:22:58 -0400
Received: by mail-wm1-x342.google.com with SMTP id u188so2074415wmu.1;
 Mon, 25 May 2020 23:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=avhE6gBkKAagMNQwah93PXvXm+qCCybJNaChmafxJlE=;
 b=ta/vaGFr7PG4JnNYRXOhieU1dgVy64h71choukCvtW+fFr2AtnKo+Gt7Jpt9mo0OhQ
 KSYTa8L0AzrxafMe9wcIbrt21Fepckh/nDfE+II7zXC91yHBmnYhYzBhBZG/QQMLg7K5
 SLTvsH1FjbgwOSQRTFuOtcOCI/M1BP8w7rDCmmvIRx9z0F5b+aSblb9lhdpG10t0h7A2
 D9XX17grFIzlV3/gxeUJAnn0rBBHbmJKFfvFi45rpTitjADVEuDEvF2i7YsfDsxc2Jt0
 0uAbi851W3/7SplCjmpvMOqJvUHOKfHYe0PY6diavvpBCpprhmVl0QHG9ky0RQQK8wPU
 8E9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=avhE6gBkKAagMNQwah93PXvXm+qCCybJNaChmafxJlE=;
 b=itqOWk2CB18HcpnZmrSKQHnoA8NMH9mo3OT/GhXsWvQCjcqRNtBNax0faQA4RmaOgi
 sAt+wk8nK5h1rfjnAOhYaC30W092ASofFwedOB0VZvi8NkMhsfTLRa5EiMdqSWII8Hyr
 A16tphS/vsHXPpt7tNz37LhS7W0D+227LisOGEok7OiHMKxlUEDdzHKYs17Jb54CwoPx
 AvCRONhaodXy3qrr4i9buCfMGrgjacsIkc+Tv6IBpgIH9BjgKV+G7A6lVfl6gaQZfYH5
 quysnaF9VgoI0cGMg3tcz9H6WS4oBcmCmT0gp5yrt213rwQ/IF5pVAFECAt0SdaDbNur
 ar6g==
X-Gm-Message-State: AOAM531oZqmB6JZ3g/zWahByNEpzugvHbEgJzT23Q8ygVPJA2CDp/Z/g
 Ga+zOP9dRvgdV+nM5EuVBQg=
X-Received: by 2002:a1c:a905:: with SMTP id s5mr6431547wme.120.1590474175000; 
 Mon, 25 May 2020 23:22:55 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id a16sm5764745wrx.8.2020.05.25.23.22.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 23:22:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 00/14] hw/display: Omnibus cleanups
Date: Tue, 26 May 2020 08:22:38 +0200
Message-Id: <20200526062252.19852-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm@nongnu.org,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zHK+j0CDtHdz

Hi Gerd, for your convenience I joined all the hw/display/
patches I sent recently altogether in a series.

Regards,

Phil.

Philippe Mathieu-Daudé (14):
  hw/display/edid: Add missing 'qdev-properties.h' header
  hw/display/cg3: Convert debug printf()s to trace events
  hw/display/cirrus_vga: Convert debug printf() to trace event
  hw/display/cirrus_vga: Use qemu_log_mask(UNIMP) instead of debug
    printf
  hw/display/cirrus_vga: Use qemu_log_mask(ERROR) instead of debug
    printf
  hw/display/cirrus_vga: Convert debug printf() to trace event
  hw/display/dpcd: Fix memory region size
  hw/display/dpcd: Convert debug printf()s to trace events
  hw/display/xlnx_dp: Replace disabled DPRINTF() by error_report()
  hw/display/vmware_vga: Replace printf() calls by qemu_log_mask(ERROR)
  hw/display/vmware_vga: Let the PCI device own its I/O MemoryRegion
  hw/display/exynos4210_fimd: Use qemu_log_mask(GUEST_ERROR)
  hw/display/omap_dss: Replace fprintf() call by
    qemu_log_mask(LOG_UNIMP)
  hw/display/pxa2xx_lcd: Replace printf() call by qemu_log_mask()

 include/hw/display/edid.h    |   1 +
 hw/display/cg3.c             |  14 ++---
 hw/display/cirrus_vga.c      | 119 +++++++++++++++--------------------
 hw/display/dpcd.c            |  20 ++----
 hw/display/exynos4210_fimd.c |  46 +++++++++-----
 hw/display/omap_dss.c        |   2 +-
 hw/display/pxa2xx_lcd.c      |  26 ++++----
 hw/display/vmware_vga.c      |  18 ++++--
 hw/display/xlnx_dp.c         |  14 +++--
 hw/display/trace-events      |  10 +++
 10 files changed, 136 insertions(+), 134 deletions(-)

-- 
2.21.3

