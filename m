Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp2216580ejc;
        Wed, 24 Aug 2022 08:52:26 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4jGxsGBS8jf7TTU+Pt9vr7Fk36DuNe6jKlsXTT/SS5KniSejPItoRRh6N6L1cEOv6RUkTB
X-Received: by 2002:a05:622a:1486:b0:343:6d3f:2fce with SMTP id t6-20020a05622a148600b003436d3f2fcemr24766254qtx.171.1661356346553;
        Wed, 24 Aug 2022 08:52:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661356346; cv=none;
        d=google.com; s=arc-20160816;
        b=WDxxoCyt9wQBC0E2A+V4RIJ1z3/mAVHuSKIEdYMrQTCI+NBShP9/AB7PuGi2DBzrA0
         9E0OIl85E+o0wCvST7F/I0w/1drKOCjumfQWzaf/N6Bc3KGXFdBCmWk/t+sg1L0F+VBk
         UdGS4lutHQSLsY5W8rMUeciqEVM0O3Rrapz7YTMmXyYjQVKCiTSuE98qBfPjLaYYJUr5
         KrIgjdg1N1QIAdRb9vQFnKE7VXhQW1kFUWSMdna94oalmR9C28+LKrNj93lxZD6Gn8ZG
         W6bYEiGplh/OBecykobXGUqROgTpY7PjgDleHHBnb9jy3fgNMN1o00EuufnXdEfT3dzP
         RUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=NpegIO2Jl3sr8Km87JjPhZQlLX1Qk+YO5jDOzfLx2hw=;
        b=vacWcyF9GrHj4sYqMzWdHaq4Cw0Bn2ttM6fozFMeu46ZHYPQmivzaVPLKZbx1CcDnU
         A35wIHc4cuML+3lBSmw5Pnik8jHYLTHoh2rBa2HMJY3BqpHnuvKjIOLHvCwAldspBWxB
         PO9mtYzu83XnsVBBVPvTlm8vxEqhbL2qWGj7P644e9RiUwpNzo0HbkB4uRtuT5njYORP
         wvbX5nXYyYlz1omLLbL3cb+pIwXCwoGsDp3iDa20sCh7dUuaL0uF1TWzdcb3AJnndH9k
         Lol0syDfhcAei/0VHoeQIZA/Zw6+LtD4HcYaADiSBqbdS4hssjZQLBhs/0dT6UftDCSR
         L8kA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ImZHoHjz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bw25-20020a05622a099900b0034456277e31si8536765qtb.286.2022.08.24.08.52.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Aug 2022 08:52:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ImZHoHjz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQsg5-00027K-VF
	for alex.bennee@linaro.org; Wed, 24 Aug 2022 11:52:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf4-000272-4Y
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:22 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:37757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oQsf2-0002EO-8p
 for qemu-arm@nongnu.org; Wed, 24 Aug 2022 11:51:21 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso1169826wma.2
 for <qemu-arm@nongnu.org>; Wed, 24 Aug 2022 08:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=NpegIO2Jl3sr8Km87JjPhZQlLX1Qk+YO5jDOzfLx2hw=;
 b=ImZHoHjzOyzVyLeHhuEIRhHqG1E9uBUE1rKCUuNIadRsTuK6qQc2WlXEh6coAxlzEz
 mQVTJAjRW3ntRgRiHb0GZrP/mmGibcJ+vlNQ1WZyDPiy1dYovX2wyu+7FvDqy4JjXQ6I
 sLke2qEVNvl155+E2OWdZSQSvIryndGl7LZZ859jNR+eWcBhy0v1qlexTM+JoZ5FUlNh
 fXLHzYxSbYOgYFQjE/6Knyt3dyGwnbNcl2J8TqXNi86hqA2jeiEXN7YMLsnjhVwSDgRS
 qUWWKBkpTzQjyWAoYGEMTqxAgsOonngFMEkQ6tz4hrMLlpIlp6Z6+PYUtj8S4n4qUeTZ
 fS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=NpegIO2Jl3sr8Km87JjPhZQlLX1Qk+YO5jDOzfLx2hw=;
 b=u3nPxvChXIZ6oxQzP4O4dRJSFAgNegdQBoZzRVOsoFDZSWgM3Bj8cot9uxJyS1IzTi
 YshHkKv4qUdm4j1T10WGgGlJr1Wlp3RKywIgonrj3EXtceS2yY+aee464q22k781IH+K
 mPmgljN4jz4de7e6kniCIF/xMyqdsrgNRMIgNXQh4jJepZxbe4llLQk+HRKyOXiRpAtX
 sqY0vvoJzrj8h2kbO0L+Vy6C7UZIa/qDrFmrGQGqo+U4ivPp3Fdt/RAsgwtUREFdDGak
 AWWPk9NJ4uyAb69aRnpYa3+6agMOMxKJD8HcAsHYn5TT8BzE+PxbHMlo8HKXMi17cp9r
 EznQ==
X-Gm-Message-State: ACgBeo2KXAa3ltxwIajNucZIwwtCIkBTo+ud9QJx++fU+iOLWhtNGMtY
 K/L26OPBGHTT1VqMNMCbJ/y54w==
X-Received: by 2002:a05:600c:4f90:b0:3a6:2bda:dc19 with SMTP id
 n16-20020a05600c4f9000b003a62bdadc19mr5524308wmq.17.1661356278159; 
 Wed, 24 Aug 2022 08:51:18 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a5d61cb000000b00223b8168b15sm17236411wrv.66.2022.08.24.08.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 08:51:17 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com, Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [PATCH 00/10] hw/arm/virt: Fix dt-schema warnings
Date: Wed, 24 Aug 2022 16:51:04 +0100
Message-Id: <20220824155113.286730-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: BCWeUBGdQMQt

dt-validate throws a few warnings when checking the aarch64 virt DTB.
Ensure that the virt DTB conforms to devicetree schema.

Some schema changes were needed, and should be in next Linux version [1]

I'm testing by running various virt machine configurations with -M
dumpdtb=qemu.dtb, then running dt-validate [1] and dtc:

  dt-validate -s linux/Documentation/devicetree/bindings/ qemu.dtb
  dtc -O dts qemu.dtb -o qemu.dts

[1] https://lore.kernel.org/linux-devicetree/20220822152224.507497-1-jean-philippe@linaro.org/
[2] https://github.com/devicetree-org/dt-schema

Jean-Philippe Brucker (10):
  hw/arm/virt: Fix devicetree warning about the root node
  hw/arm/boot: Fix devicetree warning about the PSCI node
  hw/arm/virt: Fix devicetree warnings about the GIC node
  hw/arm/virt: Use "msi-map" devicetree property for PCI
  hw/arm/virt: Fix devicetree warning about the timer node
  hw/arm/virt: Fix devicetree warning about the gpio-key node
  hw/arm/virt: Fix devicetree warnings about node names
  hw/arm/virt: Fix devicetree warnings about the GPIO node
  hw/arm/virt: Fix devicetree warnings about the SMMU node
  hw/arm/virt: Fix devicetree warnings about the virtio-iommu node

 hw/arm/boot.c |  2 +-
 hw/arm/virt.c | 53 ++++++++++++++++++++++++++++-----------------------
 2 files changed, 30 insertions(+), 25 deletions(-)

-- 
2.37.1

