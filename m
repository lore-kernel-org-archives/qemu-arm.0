Received: by 2002:a17:906:641:b0:a6f:1bf6:7fc1 with SMTP id t1csp31592ejb;
        Wed, 12 Jun 2024 18:30:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVvSqP6stVGSdWTA2dWWmzIVKBuNjppvoItLbq0sbP1jDouVItpi4oM62qlK2GwuzFnheq1+k62/adxDjSk+4AK6XtdVvS9
X-Google-Smtp-Source: AGHT+IFSsXFR1nPSqD8VwlfX4xA5niobERBi+fOWHhpBSKdLQIICnjqNTe14ey5zM4EfY/g/Opm+
X-Received: by 2002:ac8:57d2:0:b0:440:f0be:4bd3 with SMTP id d75a77b69052e-4415ac6a766mr35214351cf.58.1718242209408;
        Wed, 12 Jun 2024 18:30:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718242209; cv=none;
        d=google.com; s=arc-20160816;
        b=WSshQTYakXY4H1epfEE78Fa/4mbCVD3G7iEaWkrQA8QNMi5PJ+oAu/A98fyFh/maAz
         JXt1/Ml2QvOLFWagEShBLmdIwHkvj3g4rfGNZHtwGFLHknSgUjTuJ3N3woCT4Q46X5OD
         eGp5nQ3ld6Fv0dJgHFvynrB93hTQVfnaIeFGCP8+eKo8oaIClvIOXdffpFHF2sEOkyy2
         nx64eZkfQ/bV6LVoCa8Guac9a3NVUaX8ZuVt7W2zIkmoadBzOFrhAbGLmscg1cycHEuq
         AwTpHpx7nsdBzyVIcbk0muc2pvp/9x2ht1czUW2213r7uz+t+5Bbkp7dZ3ZRMeE9dWFM
         lZKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=pUxeVtXFywMjJ65TgYZqpczOCAAoUYi5WukUsqHRsHg=;
        fh=u2QIFsjlk3akKQ3BZ3Oogt4Ta/Nj2fo+GUwgtE1bKa0=;
        b=NtwwNyyluaNdZG1wdg0krsEWBHpj8P9biDYgmbhSXa5VMfQxF6hlbe5pAgT1SRMMyO
         Q+L8g5Pomkmu7Y+MDuQXs+yNk56KYk9zzon1xhP3YoMiZGc5Q3l1bKANEzgWgWu8EFZ5
         RU1jkG1hgOTmUzknBCJvd7NuXXsTMYBFjSbfwmGiJFlKyAuKkqdEfMWjyYUXPbzgpdZ1
         Nr/FYZC/ZipNvB+k8EjViS6QUtThhISlFivhSgO4ja309fVwEawkirZbFtn5XB+6K51R
         ZXBKXi40Izm99ogNs0LgnwhW50YIHQGj4G16gp78MD/+Bs/p4G0hMld4dP4rzehKtdZh
         QYCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=GBAu9FhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-441ff29417asi3116571cf.592.2024.06.12.18.30.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 18:30:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=GBAu9FhC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHZHo-0001qo-PD; Wed, 12 Jun 2024 21:29:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZHo-0001qU-1G
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 21:29:56 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <fea.wang@sifive.com>)
 id 1sHZHm-00088q-JG
 for qemu-arm@nongnu.org; Wed, 12 Jun 2024 21:29:55 -0400
Received: by mail-pg1-x52b.google.com with SMTP id
 41be03b00d2f7-6e57506bb2dso416663a12.0
 for <qemu-arm@nongnu.org>; Wed, 12 Jun 2024 18:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1718242193; x=1718846993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pUxeVtXFywMjJ65TgYZqpczOCAAoUYi5WukUsqHRsHg=;
 b=GBAu9FhCfUdSdB7O7zgjUFuIWknEUDALYXwLFlLV5/vfuKXkHibJ3HUOSP670jzNZ9
 UcqCgmKvnvD3a1ucnF0hY+Z/e38V9oO3QByVUfPHKEI4P261TqhOOurmJ0wOESOuwgh4
 a0T6Pah7Czh2FnpDcz7IdvTTyT49s1iR6loImipZZ+AVgiWfiyO3Fd3rpVOYig+MtmTp
 KjUNaobzUoaXIdxflhLicUEh3e+sf1tjYbgC7S4Q6bx5U5ntOWyDULqxu9ZJ+Vc9oqZZ
 q7Azm9+WTR5JVcLUPZ3i1GhdsjSuJuSpEigQDhXQlO4PqP1AqjW3//FfGwV8jW0TtZbi
 z59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718242193; x=1718846993;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pUxeVtXFywMjJ65TgYZqpczOCAAoUYi5WukUsqHRsHg=;
 b=PSmAIGdL1PqIumk86i2fWqCtr6a8JKg9eUnIjHADPg2bx6IEJ7njIZBlLb4eT78Pyz
 9jw59uPcdX5JH32KSANY+oG4nKZIIrqmUMg8OU+WExStHA+zNONH95io1GPiCIV5mGah
 o1v9itHdNRQceAlQAUVeFBguMbjH8CcYZT+7s4ME3YMl0w5squs0eqX7KUraXxwClG4H
 tS3N9qbHDQsnM9+5qJxN407WI8sNksbyZaJOF9y4vm3FK2SZ4f9SbpUDJZsYvjPDxFW7
 CpA6vkq4hCJd+v8unYgSPHlJcukqRX/orie+yUBaielp6ZCou2dDCpcWvKxKNj1ZvXdn
 b0yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKyS7BhArZSzRVfGuYyJuOMZu7Rry7bO1eVrdrmuKICPII4a6NQC9w8E37aXZ+NowAeRawoHfaat/0+CON3RtO3b5Y
X-Gm-Message-State: AOJu0YzPSvBV6U+tbKgL6sTBr3mV4ivwvMK79JsRhQIFtjLRarXpRJbN
 iIwKZpIJ/xylW2MX33NPs36oOcEiT6J3u8znadhtz4XQ049ISTG7TmrYMlBKXnE=
X-Received: by 2002:a05:6a20:daa2:b0:1b8:3ddc:913b with SMTP id
 adf61e73a8af0-1b8a8dfb0ecmr3813796637.0.1718242192896; 
 Wed, 12 Jun 2024 18:29:52 -0700 (PDT)
Received: from hsinchu36-syssw02.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855e723fasm1264155ad.97.2024.06.12.18.29.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 18:29:52 -0700 (PDT)
From: "Fea.Wang" <fea.wang@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq),
 "Fea.Wang" <fea.wang@sifive.com>
Subject: [PATCH v3 0/3] hw/dma: Add error handling for loading descriptions
 failing
Date: Thu, 13 Jun 2024 09:34:58 +0800
Message-Id: <20240613013501.426905-1-fea.wang@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=fea.wang@sifive.com; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DUB9K1uhl+fO

The original code assumes that memory transmission is always successful,
but in some cases, it gets bus-error.

Add error handling for DMA reading description failures. Do some
reasonable settings, and return the corrected transmission size.
Finally, return the error status.

* Fix the trace format for an unsigned variable

base-commit: d82f37faf5643897b2e61abb229499d64a51aa26

[v2]
* Add DMASR_DECERR case
* Squash the two commits to one

base-commit: 915758c537b5fe09575291f4acd87e2d377a93de


[v1]
base-commit: 1806da76cb81088ea026ca3441551782b850e393

Fea.Wang (3):
  hw/dma: Enhance error handling in loading description
  hw/dma: Add a trace log for a description loading failure
  hw/net: Fix the transmission return size

Fea.Wang (3):
  hw/dma: Enhance error handling in loading description
  hw/dma: Add a trace log for a description loading failure
  hw/net: Fix the transmission return size

 hw/dma/trace-events     |  3 +++
 hw/dma/xilinx_axidma.c  | 33 +++++++++++++++++++++++++++++----
 hw/net/xilinx_axienet.c |  2 +-
 3 files changed, 33 insertions(+), 5 deletions(-)

-- 
2.34.1

