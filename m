Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp3157286lfc;
        Mon, 1 Jun 2020 07:31:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE9DrEWd2U5Sa7AV2ZuyvL8YTmit0MzvKXfEBwEsSPP1HstkJDN+6bCnMTO3vN+utzcuOD
X-Received: by 2002:a25:c904:: with SMTP id z4mr36344046ybf.338.1591021879240;
        Mon, 01 Jun 2020 07:31:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591021879; cv=none;
        d=google.com; s=arc-20160816;
        b=0Wpt0RTxCGPrb3ka8XF7sWdLbaNVX+Np8haag8sIoBxTRUShvSeziAlEkjDDakdKhd
         jVTR0zFuPrGQ5mPYxKLZNOh4CP9mfokUbGOikVhKAn9sHpEsa4FP3pG3ER4FcJESAjfI
         3Ch+mDHS4RKkWT65Q1c9ashLqNDC7+3rcsCXOVeIRe47CRIUxkTY/bV6R0wZqNa3N3Xj
         eGnvF5BySAP+7jN26upTo8OmzaetpS1pkse/vGqlukOeDJt+B0tYop+D2LZOG1Ep04Dw
         IkTWn50pdYCuHv2lXbRqlhFKXxGPoWUWsmfnSJSm3zOYBElucSeG4d7CD2mkSTEIk2rt
         Zfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ZM7/znQriD0UhsswZg6MLv2Z3oBcZnpOAq0NEHbW664=;
        b=QeXdw4KnW69rVDiOJWFFvpKUVujMnwhwMWB1a5wJQt1zweaSJKS7h8kf/jUktTxeco
         Q07B0TczpUf7f0O+u/it6fFwE1J1R8RkscGxYz+rC/xmJRrtf9JVaBmQDCztcfOjY8/M
         AohQcIwA3L7ok50Kzujz56wVFhl4gnpOUcDkPXupbzNdINvuFyGi0Xjn5hEJTt+vL/U8
         Ib36rUv7GauMDVWxXH8R+DhD8vfRWhwuhVZ1UNsL3bTzekDANYfdXadE1XQR1JdXVCuK
         HiRaeEFK5nA/2i07Mka+4FV1eeGGyG6yEwm0lHdjtTZ/8u7ad8uTiB0zdYdz5l20MkUK
         nZcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GGgHYPRi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i81si5816251yba.193.2020.06.01.07.31.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jun 2020 07:31:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=GGgHYPRi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jflTC-0004YY-CP
	for alex.bennee@linaro.org; Mon, 01 Jun 2020 10:31:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRY-0002Jo-9P; Mon, 01 Jun 2020 10:29:36 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:37042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jflRX-0002aH-JJ; Mon, 01 Jun 2020 10:29:36 -0400
Received: by mail-wm1-x32d.google.com with SMTP id f5so11594846wmh.2;
 Mon, 01 Jun 2020 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZM7/znQriD0UhsswZg6MLv2Z3oBcZnpOAq0NEHbW664=;
 b=GGgHYPRiatHdFDW9BVH8eF+dSyAynNmKp7tCKjge/3dzd5/m4+sDYh6i+4CuC5eLnk
 d0K9s7FRYLtW94rL93bIkN/F7acb+khmY4E/jXZ1+TK0lKJF6DwpIBoGcy9+FjiVQ8J9
 7rFPUqqlrBtnqHcc5XCpn7TgT39xntNtLVatlVAThT01V8OoIhDmcEhbQwH+v9/vTefx
 QbSfJSl1P16H7ir6sCNJi5IW6OyYMHqgHYolpGT/KvNvl6YtjqK/ZBPCr7uPoowpHCVJ
 jwhp67uNSCvqURSdBp37Z4gJjZsIkxpb3v1DRn+Brn7MWWRG4OMLkp7HpEQbF9T+B8Xc
 fbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=ZM7/znQriD0UhsswZg6MLv2Z3oBcZnpOAq0NEHbW664=;
 b=bJrDCb60P3ddNJ4IuREcyn4qKrRQdSUOxdrHXv6eCY6nE4pF/UV7dTL9ubXxg0urmG
 qFVUVTZCZ9b5r+a57xcnxSPJLKd3Bg4Tisn/UhFkDX1sAuDqg0Cpc6+4toBV335VonsL
 aclyyseIjvYQhYxd0AdzKlcoCBzig0Ud4NybV9VLoFr9xFoymmAOWJuyE/5h+67LhDFC
 viaBJUr6ZGNAwN00HXOh3qLjVIP3rHjqUZkriaiuI+RgcPD3xJseVZw2ZrabfcNmQjRj
 OIZ8fh9WNfN8PfuXsYh5RKwgoZPODzLn2f8yCsB8xIT4Q2FD9Eerd7vo/2bOGL0i0Geh
 deDQ==
X-Gm-Message-State: AOAM531h0DkD9gSwlmdymy95A4GFmParaFGNxixMaQeO9kWAcHRbEenD
 ZqroOnvSI/TFbqL7gUaczyztWV0D
X-Received: by 2002:a1c:998c:: with SMTP id b134mr22850671wme.78.1591021773028; 
 Mon, 01 Jun 2020 07:29:33 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id u12sm6824954wrq.90.2020.06.01.07.29.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jun 2020 07:29:32 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/8] hw: Fix some incomplete memory region size
Date: Mon,  1 Jun 2020 16:29:22 +0200
Message-Id: <20200601142930.29408-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-trivial@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Richard Henderson <rth@twiddle.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tvKZOSisN9XQ

Series fully reviewed.

Since v1:
- Add parenthesis on the Xen patch (Paul Durrant)
- Add Peter's R-b tags

memory_region_set_size() handle the 16 Exabytes limit by
special-casing the UINT64_MAX value.
This is not a problem for the 32-bit maximum, 4 GiB, but
in some places we incorrectly use UINT32_MAX instead of
4 GiB, and end up missing 1 byte in the memory region.

This series fixes the cases I encountered.
Also included few patches while reviewing, I replaced some
magic values by the IEC binary prefix equivalent.

Regards,

Phil.

Philippe Mathieu-Daudé (8):
  hw/arm/aspeed: Correct DRAM container region size
  hw/pci-host/prep: Correct RAVEN bus bridge memory region size
  hw/pci/pci_bridge: Correct pci_bridge_io memory region size
  hw/pci/pci_bridge: Use the IEC binary prefix definitions
  hw/pci-host: Use the IEC binary prefix definitions
  hw/hppa/dino: Use the IEC binary prefix definitions
  hw/i386/xen/xen-hvm: Use the IEC binary prefix definitions
  target/i386/cpu: Use the IEC binary prefix definitions

 hw/arm/aspeed.c         | 2 +-
 hw/hppa/dino.c          | 4 ++--
 hw/i386/xen/xen-hvm.c   | 3 ++-
 hw/pci-host/i440fx.c    | 3 ++-
 hw/pci-host/prep.c      | 2 +-
 hw/pci-host/q35.c       | 2 +-
 hw/pci-host/versatile.c | 5 +++--
 hw/pci/pci_bridge.c     | 7 ++++---
 target/i386/cpu.c       | 2 +-
 9 files changed, 17 insertions(+), 13 deletions(-)

-- 
2.21.3

