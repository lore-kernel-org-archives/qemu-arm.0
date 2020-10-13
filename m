Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2058467lfa;
        Tue, 13 Oct 2020 08:16:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqQrK/33UVUBfHW4JOoiBmysaGDn7DXhkau5cPMnf4+SKmsqmUiK5Oao4bdTlP2iH4ScIx
X-Received: by 2002:a25:6e87:: with SMTP id j129mr430762ybc.424.1602602210406;
        Tue, 13 Oct 2020 08:16:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602602210; cv=none;
        d=google.com; s=arc-20160816;
        b=lUSIaNdcesUinaDWDo6NCJ7vVpQ/aBxk0yvNu4r8IwPiVr7ax4IvESfF88XZH2UA/2
         KvRO7ZmpHOPvpcajeYQhrOsttHiTf9pe2Aeu3ssdpInmmbJt/HcItXhvyF4zn5UqZcBC
         qzZ8Pj01PhPR6COzaPHlituD/FLjy7FLbwzucSx209jBtUiOrg+omNhUpAJLsBkipBLf
         hb7ShKFmdnVIJE+oxP+9FXznNHLS1E4DoQKLjFJEjduZRWXaozq0UypFYbJ1kaJWxlQx
         UpfCMwZfCG1Asa/Vl9yBwxB0bMScJESNBBBj5IWIdVoK8n9dSaEbgDgwTqZO9asdz3W2
         SiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=hre4F+plBD5IZZTCSQVqpoMkNAABnjkZeqwM/SAcEeE=;
        b=ZN+c97L3LXqgHeYOMPMQSUjgcRDoWnFVhhUeOqHWMVCmbmVoNDZBc6xu6GkvEiq89B
         +0l2oXuX3g1Od8g/V8ms5XbzNYhAgX6aczskprkVuotDKJT/kt6M084oAQXB+3gzmdM9
         c8i73ag/nSfy12e4deDPSZ+/2uayOC4qj/D6EpYgTkadB/hQ2fA9MbR8FyEHwBE1gIDm
         UiuArfLsuX3zHHmN+p7Uy11D54Ph7VtC1a+Q1LOgTA20KW9emP1gUe7znpVXGr6dBhhK
         EbD/yQNghBku/6VP/KkxmOTnECfIm6NG7A52c7ppf7/lHoCo2U7HdvdEHffbLKZoccam
         SAng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HiERlVxa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3si227276ybk.22.2020.10.13.08.16.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 08:16:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HiERlVxa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSM2j-00067B-KD
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 11:16:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kSM2W-00065E-Pt
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 11:16:36 -0400
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743]:40344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shashi.mallela@linaro.org>)
 id 1kSM2V-0000Ag-1m
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 11:16:36 -0400
Received: by mail-qk1-x743.google.com with SMTP id s4so106635qkf.7
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 08:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=hre4F+plBD5IZZTCSQVqpoMkNAABnjkZeqwM/SAcEeE=;
 b=HiERlVxaRhCt2x5ForrpP+fhpHNqOqaVkHF7l3R8/Aj0UqsgG3RHxIukz5cXV4ekDd
 nb301uMy64A4V0HNEFJELDhb9G+AkA+SAKWiRlhrQ7AyeDxZ8K9chfRfIJEhHoYIuKpN
 TP1o+RSFJGSUsRNZnmrb5KOGcAADKpl336O6DYlJ25j/KdEwLcjaytJRLVXYqC3gu2MV
 jHapnSHsKnTjok1fgbRUhN83YAvBFWyvnkTtDjB6rhhfldPLEiLmp1vhFUeDz6qx3IvK
 6GF+POqnOpokWTBbJhjbcdUKJ7gFVzZ4Dspbv8Ad7sBNEtQp1Mfn8e1+j9t5N/EDr4BM
 XmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hre4F+plBD5IZZTCSQVqpoMkNAABnjkZeqwM/SAcEeE=;
 b=Hg+AKPfTpJFVPiWDxX8L7OHeJXm7wZz0ddDCt23NU9AGlBrb9F8EURTFjt25CBlFgE
 t0bEt7jD7lXVk66+zaDYrGPCveD3kDAch2GTYp9r0150qqHeJizIX152k8reCWoOcLU9
 Qx1jo0ZHTewR2wD73D6RJeTgtLuISLI/Q95EBhFnwUC/RXKMnUh/BejHlidTjyr15X+j
 kcAE3vetpuVX0iwbK+B3O7qsFiIbWv1F6zNAzFKyuo+0tjxTeoWkooNAw3KqgdyPySXt
 V4YavHsCo0kWz4ps3121zw9kmDJd4nphTzch62fOzZIXCLEIa7lDWWJmMjnSgIgRVF/b
 kJAg==
X-Gm-Message-State: AOAM532wlMHBaaABBqe2tWn7GFAmzmpOFOrGPGhhzIjiZD5mj9gRPy0Y
 /TVbnA2chwRCIOui19BIcj1HlQ==
X-Received: by 2002:a37:393:: with SMTP id 141mr367809qkd.427.1602602193620;
 Tue, 13 Oct 2020 08:16:33 -0700 (PDT)
Received: from master.ht.home ([2607:fea8:e2a0:e950::5917])
 by smtp.googlemail.com with ESMTPSA id g20sm55604qtq.51.2020.10.13.08.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 08:16:32 -0700 (PDT)
From: Shashi Mallela <shashi.mallela@linaro.org>
To: peter.maydell@linaro.org,
	leif@nuviainc.com,
	rad@semihalf.com
Subject: [PATCH v5 0/2] Add watchdog support for SbsaQemu
Date: Tue, 13 Oct 2020 11:16:29 -0400
Message-Id: <20201013151631.30678-1-shashi.mallela@linaro.org>
X-Mailer: git-send-email 2.18.4
Received-SPF: pass client-ip=2607:f8b0:4864:20::743;
 envelope-from=shashi.mallela@linaro.org; helo=mail-qk1-x743.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xofnjuHsD+vO

This patch series adds watchdog timer support for SbsaQemu platform.

The watchdog timer has been implemented first based on the generic
watchdog timer specifications from ARM BSA v0.9 and then used 
in the SbsaQemu reference platform

Changes in v5:
- updated irq number of gwdt in sbsa-ref since the same
  is being used by SMMU as per latest master merge
- addressed review comments

Shashi Mallela (2):
  hw/watchdog: Implement SBSA watchdog device
  hw/arm/sbsa-ref: add SBSA watchdog device

 hw/arm/Kconfig                      |   1 +
 hw/arm/sbsa-ref.c                   |  50 ++++
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/wdt_sbsa_gwdt.c         | 346 ++++++++++++++++++++++++++++
 include/hw/watchdog/wdt_sbsa_gwdt.h |  70 ++++++
 6 files changed, 472 insertions(+)
 create mode 100644 hw/watchdog/wdt_sbsa_gwdt.c
 create mode 100644 include/hw/watchdog/wdt_sbsa_gwdt.h

-- 
2.18.4

