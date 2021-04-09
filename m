Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp1793674lfr;
        Fri, 9 Apr 2021 13:16:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMYQvx7pxkpKhrSR4K/YyiNIIRsYgcDBZdhwIr5ApOz4d2Xh8rh/M4Vr980higKfInsV4j
X-Received: by 2002:a92:c9d1:: with SMTP id k17mr13498280ilq.60.1617999399442;
        Fri, 09 Apr 2021 13:16:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617999399; cv=none;
        d=google.com; s=arc-20160816;
        b=nQGLGEVKdCKflORrERy2trOw0Zy+885BLIRupEiq6CpkjKsH5YrjRSU6ZIn051rNZ6
         wz/BSex0Wl7TLs0qtoGBLD8tnmYp19zaf6X//WT7ZUmvuONuY8K/vAbPObdD6pL1j0Lo
         bXX5qt3mW2/9/fcjPvAxJGeoJUBfojvjmXKZpUHXoYR5qHTdkpHQwM8OPmoGm4G+MdCD
         qWUo0S9u6Mu+Q/8Ox8VFvrT5ZrJRoJWAvl3pytZLHGlN3AK6BvezBP5JQVQRciwPvNak
         g/C8e1dYxJPbtFWEljkgxd3FPPvYharCADvKY8b6/aVYMSbTo/AJ7WFZu7VqAshS+Bar
         y8aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:mime-version
         :message-id:date:dkim-signature;
        bh=Fzzl4rCkNO9vRv+OpxpwcwxkFHE7+hBWsSGwCKZGktM=;
        b=pmx58kIqwDDdZZtJRN6mclB61tcRzuL15vsDAiRugeG98reLHtfUeBwoYLoE6gF7un
         6pS1dE6Dz3FKGkynThbRZi63xGKYe6Fr0zYptxMKi9pi1zUlo7moFGVW/uQC9YZ2deGe
         IIiB66jURVD2sfXiBVfeoZ8OIbFHW+ELFitc6sjFKEDUaJoHxqYvH9H8SooJ1IoiMK0J
         M+U5lfIlrA6LiYQatlOlxdtRLWFRGGlz58DDCDhS0Ef6D+/MfIQLNxddM+tVylDJWYV3
         qXrTf4HPLYB80MLToyxSTtowYGO8D1J/DiL/cvyjmFRchkvSYwZidhOc7aFILl3v4GWp
         ldFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=vr8lOFqx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14si3804174jao.83.2021.04.09.13.16.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Apr 2021 13:16:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=vr8lOFqx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:52550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUxYU-0008T2-Ch
	for alex.bennee@linaro.org; Fri, 09 Apr 2021 16:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3u7VwYAcKCPIpYhnolYaiiafY.WigkYgo-Ulghihaho.ila@flex--venture.bounces.google.com>)
 id 1lUxWu-0008OG-4S
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 16:15:00 -0400
Received: from mail-qk1-x749.google.com ([2607:f8b0:4864:20::749]:46935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3u7VwYAcKCPIpYhnolYaiiafY.WigkYgo-Ulghihaho.ila@flex--venture.bounces.google.com>)
 id 1lUxWq-0000ER-Mw
 for qemu-arm@nongnu.org; Fri, 09 Apr 2021 16:14:59 -0400
Received: by mail-qk1-x749.google.com with SMTP id b78so4067013qkg.13
 for <qemu-arm@nongnu.org>; Fri, 09 Apr 2021 13:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=Fzzl4rCkNO9vRv+OpxpwcwxkFHE7+hBWsSGwCKZGktM=;
 b=vr8lOFqxAx2TUDdnYEQljEPB2Ir44MLgO4/q/dh/SEQUeyLhNBQ2yEsNbBsEC0bsK0
 pfRd6ihYhdq3ny4uvsEEQipaYiR3OEnqq2fnBA8GmbJ8zEQw5g2B57oqffifq3L5nCPh
 ervFVjSEOZ+9q1vUosruUxFFpWQi0M7SQ2Z1o75vHECveZEOnv2s5N7A5S5n1lDAki3V
 m6eW+JGBh7JJn6/m5FYeoI7KP/FsHBhKgLPG80RrLZGWCaOPPt8C60cTClNDBAuEShnD
 pLac3APGmLfLKVfstOXL4QgKjRugFwHvBsI1fVD7c8Mo0hifM4wi/GosIbLCJfYqBTCJ
 Ppcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=Fzzl4rCkNO9vRv+OpxpwcwxkFHE7+hBWsSGwCKZGktM=;
 b=V/FLiAm8dT/aLzaKRcU8Uj6YNweAQ1ZZ3Lzsw/FShkGI5aI9JwW5Ekmq42CoHHObZv
 RO9NGwQjSy6csrP08gAJTjYH7MIWwbOgQsYAR0S3tpvD+3QtrZ9K7mGjGrZ39m3QiUjs
 XqUMcUqUtYEx2qBZjKJnsfqM8hKNkCKUQ877GocEHIIDyI1JwQgzZdyPg5pFkN2Bfd3O
 3RI5Mdx8hNfgHGFWW4xACGmmQFiON9XJlnM0MeJOjsodYAKHIOBHZo+Gux25EoWpaLmK
 2n542HYLaCQrqLQzdRYZFFS150rSw1eofTo/UIkDV7QzdLCzJOaSrWmj0bYZibWrOcFe
 PV4g==
X-Gm-Message-State: AOAM5305kiOFn+NhVqOFEKiOS/Nh34Agg4jRqkfIHTRzygXLJQeG+WwC
 oUwhhIeBK1JlS8oCABUDVrxwUl2hZ2/4
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:ec3:6619:183b:36d8])
 (user=venture job=sendgmr) by 2002:a0c:e88a:: with SMTP id
 b10mr15969844qvo.21.1617999291042; Fri, 09 Apr 2021 13:14:51 -0700 (PDT)
Date: Fri,  9 Apr 2021 13:14:39 -0700
Message-Id: <20210409201443.111197-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v3 0/4] hw/i2c: Adds pca954x i2c mux switch device
From: Patrick Venture <venture@google.com>
To: cminyard@mvista.com, wuhaotsh@google.com, hskinnemoen@google.com, 
 f4bug@amsat.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::749;
 envelope-from=3u7VwYAcKCPIpYhnolYaiiafY.WigkYgo-Ulghihaho.ila@flex--venture.bounces.google.com;
 helo=mail-qk1-x749.google.com
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
X-TUID: OHipZIXFvFJY

The i2c mux device pca954x implements two devices:
 - the pca9546 and pca9548.

v3:
 - fixup comment with missing end parenthesis.
 - removed superfluous object cast.

v2:
 - the core i2c bus now calls a match method on each i2c child, which
 by default will only check for a match against itself.
 - the pca954x device overrides the i2c device match method to search
 the children for each of its buses that are active.
 - the pca954x device now owns an i2c bus for each channel, allowing
 the normal device model to attach devices to the channels.

Patrick Venture (4):
  hw/i2c: name I2CNode list in I2CBus
  hw/i2c: add match method for device search
  hw/i2c: move search to i2c_scan_bus method
  hw/i2c: add pca954x i2c-mux switch

 MAINTAINERS                      |   6 +
 hw/i2c/Kconfig                   |   4 +
 hw/i2c/core.c                    |  55 ++++--
 hw/i2c/i2c_mux_pca954x.c         | 289 +++++++++++++++++++++++++++++++
 hw/i2c/meson.build               |   1 +
 hw/i2c/trace-events              |   5 +
 include/hw/i2c/i2c.h             |  16 +-
 include/hw/i2c/i2c_mux_pca954x.h |  19 ++
 8 files changed, 381 insertions(+), 14 deletions(-)
 create mode 100644 hw/i2c/i2c_mux_pca954x.c
 create mode 100644 include/hw/i2c/i2c_mux_pca954x.h

-- 
2.31.1.295.g9ea45b61b8-goog

