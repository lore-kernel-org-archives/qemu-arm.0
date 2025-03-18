Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp2913263njb;
        Tue, 18 Mar 2025 06:08:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXPFrT8Ue+w1K7GYxo78J9J25oTsKA2v1acJXlVYJV2sbAhmWF0oIgHGTK1iY6axbalAVbY/LN3LG0zIw==@linaro.org
X-Google-Smtp-Source: AGHT+IH+P8pcVuf1gAa097qRkQplFSjbYVeK9uWWzxTzzbzE2NDtwjvg3LoTU+DG30qBZwJvT1WI
X-Received: by 2002:a05:622a:354:b0:476:9847:7c6e with SMTP id d75a77b69052e-476c814a7aamr245941091cf.19.1742303338363;
        Tue, 18 Mar 2025 06:08:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742303338; cv=none;
        d=google.com; s=arc-20240605;
        b=jzICbbhysCV1HldSNWcyDUn/RTWJW++AMbh3tbW7IebEEByyEPkrAQrWpx88Kyv8Pt
         nPrXZIzXzsg/w2YIR1a3uyDGJ3GiaCiH1K/6KpkO6c4//gQE7hm2tMuRi1GYgOTqgCzR
         B1UtpcIwrg1HYql1iCwNfY5bCvF7yyzIGeI2M9GAAZNAmE8+NM8ZKDI+WafBaJACV0l5
         VTXbxZZowk5Jt/9iXA4MLN3pKn0JPgTIkBrJt0A00fSz/mSN9b7SgFH5tra0x+OFf5/x
         ELYG3rBC3pIyaSEUoSpC4dgHZvJP8EV4InAbg7bWToVYywSyypPxpXKiUK6cpAdkJT36
         oySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=g0yzrsHOZw8jJRUdrnkye8+q3BRXaAEp0577L+ULu0o=;
        fh=1CGXOPIhimEmnbIi9wTx4xasNMJu9ePayBjbMxWI0Nw=;
        b=fcliCXsSYGNfz8yRnMttE0I3u47HPhdDTDXdbKfCWtpEFeRu6TvO4ko0Stxjk7txcQ
         TuAK9XHxbZE4mlWvZxsu70hSC9H3IXBy8kGFTtF/k2z0mZgp3OSrJHzmLavT7bk7Wb0c
         uAJ8SOS9S3iQh7CUXKyl3t+3lZtwEjOCL00I24vObST9gVUvC0AjWb4ee/4iTUkk0TUR
         66Xlt/YkuYuYr055OtFHFqthkyDIlwOS0fP97Q3untnxc8errpj/UrE4qVowKxweCJXh
         6AfdaV0kS0/EoKElORKbMP/8K7b/TBlF+b35Okbu0JZ3RKq9gOkb5+0DLoWbBRt7vod9
         Zsww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YEOjWpSo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb81cd0csi114218931cf.425.2025.03.18.06.08.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 06:08:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=YEOjWpSo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tuWgO-000529-EJ; Tue, 18 Mar 2025 09:08:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1tuWfi-0004eS-6O; Tue, 18 Mar 2025 09:07:56 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1tuWfQ-0002wD-Va; Tue, 18 Mar 2025 09:07:39 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso864495366b.1; 
 Tue, 18 Mar 2025 06:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742303255; x=1742908055; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g0yzrsHOZw8jJRUdrnkye8+q3BRXaAEp0577L+ULu0o=;
 b=YEOjWpSoxd17swkc32xPAY0tH/FjW9A7P4Wb81Vx0pyT3gCAoobycsyCcxszjBuDTR
 nq0y0joXcmRG8PCPxRr/3YNQiIVSg5vKvuhKiaIVZP132m9SZktcA1PnTKAc2d3oHxL1
 zjFRxKBDp9uSKJxB60y3Mc5syVb1sixO9nnuBNRC4BIYvGxdLkeicj7avcPgvRnAetAp
 s4AaNhZ/+J2X6ApnXN9UxoiXeiVA3J8NjM3C2OCASWYmTFIgv3r0hdHWBXcesZG4VBrG
 JjSUeldLWQl38NGIOZs2X4l39rLOxSzRM6Lx+sv9bjnVTy0KRaIBly7kGFvw5JaAaiLO
 fmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742303255; x=1742908055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g0yzrsHOZw8jJRUdrnkye8+q3BRXaAEp0577L+ULu0o=;
 b=Nte0YQzQVNCfQhlWnyKgJjroyq40cGgH8jedbuKFKr3OKcNlW1+nWfaaxZa5k22PwU
 SsahRhAiI2/VDltHrzIeMe4IMYkDZkKWOdjETI4Wn4TO5AchUaUpdoktWuwtUwxFpZ4z
 RxGRMkUIoYZEGwWdofddb2V02P4b/Vp57hnNxxexxCpdoopRAsUMbgv6mw3ctGP8ASH3
 kgtEbqgGiSaTJ3gPIpjyUkEFjvTKbHjbkduII6qT+enwvZ9dSLH3ODHRzuWfW9IXbAo4
 cj8UgH5OUw2qmqPDJJLKG37KZ1otVIaJ5nOScLXFlAL6HeFCce90ZStAfo9V/Cd4J3qo
 Yq0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhmdOS3xcd+GKSrb2eY9iIqflHCKUyiJyjFOm5Y8L5PURkIDypcEp832aCJjVguBoMsZOJ1YOU/A==@nongnu.org
X-Gm-Message-State: AOJu0Yzrng1bDw6GKokFAcdWEQME6IPJejo43pRZm+ePqQn1skU5htYT
 YfejOD74/ujCLVOVI4qgQnayuywaMAoKlxtHBtMZmG3syM5KbJ6NFwuNIphr
X-Gm-Gg: ASbGncspPHj2sYaCVllZFnBPMHiWlKL1dYcIjGrgh50DxySgeh3xbm78rgb6au7tFDI
 pg+OrWLmrBLJMIYo+ek7epKtAa1YMc5D8KoQHX68E50bf7uPvCgXkCVaednJUWlEqpVIUBBJGAB
 fkKisE8nNI9fC9G+sTwdd3fsScV2izc4a0OWy19Aa/GkmkxVWaWwM+lLAoZzIkfquszPZqM7Mlc
 x/ErOx420xxSQOe90tV3VBbkkwBVpBYfcin4vl55EhDSDGyDnuRDBlKRwcEN9xRLurDhzyew3/U
 IGDb09KMxgbt8Rmt9Bf+S5FBUwJ9NoICTyvw0v00e3e+q8Z4PIvOBPWISGaP8ukUNsM=
X-Received: by 2002:a17:907:96a1:b0:ac1:effd:f2ea with SMTP id
 a640c23a62f3a-ac3302d1dc1mr1791269566b.24.1742303231356; 
 Tue, 18 Mar 2025 06:07:11 -0700 (PDT)
Received: from corvink-nb.beckhoff.com ([195.226.174.194])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3147f0ca7sm860607466b.60.2025.03.18.06.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 06:07:10 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 qemu-arm@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 00/21] Hi,
Date: Tue, 18 Mar 2025 14:06:42 +0100
Message-ID: <20250318130708.117888-1-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=corvin.koehne@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bv5DuRoh19J9

From: Corvin Köhne <c.koehne@beckhoff.com>

Beckhoff has build a board, called CX7200, based on the Xilinx Zynq A9
platform. This commit series adds the Beckhoff CX7200 as new board variant to
QEMU.

The emulation is able to successfully boot an CX7200 image. The image includes
some self tests executed on every boot. Only the cache self test fails due to
QEMU emulating the cache as always being coherent. The self tests include f.e.:

* Network
* Flash
* CCAT DMA + EEPROM [1]
* TwinCAT (Beckhoff's automation control software [2])

[1] https://github.com/beckhoff/ccat
[2] https://www.beckhoff.com/en-us/products/automation/

Corvin Köhne (1):
  MAINTAINERS: add myself as reviewer for Beckhoff devices

YannickV (20):
  hw/timer: Make frequency configurable
  hw/timer: Make PERIPHCLK period configurable
  hw/dma/zynq-devcfg: Handle bitstream loading via DMA to 0xffffffff
  hw/arm/zynq-devcfg: Prevent unintended unlock during initialization
  hw/dma/zynq: Notify devcfg on FPGA reset via SLCR control
  hw/dma/zynq-devcfg: Simulate dummy PL reset
  hw/dma/zynq-devcfg: Indicate power-up status of PL
  hw/dma/zynq-devcfg: Fix register memory
  hw/misc: Add dummy ZYNQ DDR controller
  hw/misc/zynq_slcr: Add logic for DCI configuration
  hw/misc: Add Beckhoff CCAT device
  hw/arm: Add new machine based on xilinx-zynq-a9 for Beckhoff CX7200
  hw/arm/beckhoff_CX7200: Remove second SD controller
  hw/arm/beckhoff_CX7200: Remove second GEM
  hw/arm/beckhoff_CX7200: Adjust Flashes and Busses
  hw/arm/beckhoff_CX7200: Remove usb interfaces
  hw/arm/beckhoff_CX7200: Remove unimplemented devices
  hw/arm/beckhoff_CX7200: Set CPU frequency and PERIPHCLK period
  hw/arm/beckhoff_CX7200: Add CCAT to CX7200
  hw/arm/beckhoff_CX7200: Add dummy DDR CTRL to CX7200

 MAINTAINERS                       |   7 +
 hw/arm/Kconfig                    |  18 ++
 hw/arm/beckhoff_CX7200.c          | 440 ++++++++++++++++++++++++++++++
 hw/arm/meson.build                |   1 +
 hw/dma/xlnx-zynq-devcfg.c         |  36 ++-
 hw/misc/Kconfig                   |   6 +
 hw/misc/beckhoff_ccat.c           | 365 +++++++++++++++++++++++++
 hw/misc/meson.build               |   2 +
 hw/misc/zynq_ddr-ctrl.c           | 331 ++++++++++++++++++++++
 hw/misc/zynq_slcr.c               |  47 ++++
 hw/timer/a9gtimer.c               |  25 +-
 hw/timer/arm_mptimer.c            |  33 ++-
 include/hw/dma/xlnx-zynq-devcfg.h |   3 +
 include/hw/timer/a9gtimer.h       |   2 +
 include/hw/timer/arm_mptimer.h    |   4 +
 15 files changed, 1309 insertions(+), 11 deletions(-)
 create mode 100644 hw/arm/beckhoff_CX7200.c
 create mode 100644 hw/misc/beckhoff_ccat.c
 create mode 100644 hw/misc/zynq_ddr-ctrl.c

-- 
2.49.0

