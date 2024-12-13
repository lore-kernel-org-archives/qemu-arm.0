Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp442787njb;
        Fri, 13 Dec 2024 05:35:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXGLpZaukhuXlNGqk5SnWQenMCBndpoQOUtA84nrFJNy+bOAqdb4oaHjt7NE/f0GpBaD7BtHeWMmvLm2w==@linaro.org
X-Google-Smtp-Source: AGHT+IFyvdCvSyr2H4/qGkc/moCMqzSkmshk4HjcvdOvZHm/m2xnRqq8GjrfJ/qlx3ZpvS1Z5/en
X-Received: by 2002:ac8:7d0c:0:b0:467:5eb6:5153 with SMTP id d75a77b69052e-467a577e5b7mr41097401cf.19.1734096915804;
        Fri, 13 Dec 2024 05:35:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734096915; cv=none;
        d=google.com; s=arc-20240605;
        b=gVdeaKOpc3BY6RgKxr2f2Wy07muVawipWm2QK/lSjTtP4dND23GEZy9Bw0LS22zFyX
         4bdv3O11cE9TdSHm484O9gIgPhGVUmTW2f0ZAP8Ryilr06Wir7vBGZc+0Y8BBaGs1SSd
         X2/HQYrQbkJ85Pd+bhV/rnygUyY13V/cirkb+3xr1U66on0qDWqnJ+ArZaHZytlFANk6
         MjlmtesyDeh0o8lFWLdNf85ngNtsGEtzt3A3tiLJHECd5a1rrJvra4xM+bCGL9XR4JJy
         1u+N76gpVRNlYie6EfwIPeQFXI28nv0K9rsNf4wx30pTUxAtz0K3svH9u/qg/NR8/rTO
         UJhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=KiX5mmq4vCwE1JaaWuCTD5vC1dSPpb7XgZTnnxB1/+8=;
        fh=5/bEEfneXpYiCSLu1RRtIdWOVpk1SgQYYFlk2zFRZHo=;
        b=dZR3/k5bpfSci4XfwZ17FIzGS3FRGHttdV0Fh/zohcP6d4RdtlOvznoCFs+vhvUWkt
         wDHw8ZxAQuzDkzHP8V45aB84IPkNLy1dibHJp4wz0jAkpTW7kS5WlPzgbAGJGouv5R+R
         NBTKTAjAp+/Wyt6dsWbS1TlxTUb4eoPN2573Ru7p7YmQ6lrC705o3SmzFh9XoFqTW6nZ
         5nAY+XV+jfmDmgmmC60nQ/MZRdpVBdNcoUA7rdAtY4MagLMNvSEAVxiA0y036I+gOpRM
         /jRmdE7eGUzJptQh471iYQw/KfBEUqiSRf6v7VKPZlJ61ivIIlwi9En7P+GLB/tVsDwo
         t1mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JWpx8Txo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a468dfsi1874884085a.23.2024.12.13.05.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Dec 2024 05:35:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JWpx8Txo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tM5od-0005PX-3Z; Fri, 13 Dec 2024 08:34:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM5o1-0005Af-I7
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:34:13 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tM5nt-00014M-58
 for qemu-arm@nongnu.org; Fri, 13 Dec 2024 08:34:08 -0500
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-385e0e224cbso930343f8f.2
 for <qemu-arm@nongnu.org>; Fri, 13 Dec 2024 05:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734096835; x=1734701635; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KiX5mmq4vCwE1JaaWuCTD5vC1dSPpb7XgZTnnxB1/+8=;
 b=JWpx8Txo4yV0xfb+CcmVIuM0cs2NVD2zEZhVGQ3MWUQ/GcyZpi2kj/DRhenwcsjtpB
 YRiHBzCY3zrBdD08AdQY2WGAuJ47U2mjze6DpX8fdFJn4k6grm34NQ25T+0+py1pta3n
 NDP1/h+ctsRCNme1NSUopcvnpoYXgT66APT/SKdyQFwIjlTdZpcV29sZi6MucZNtJR5Q
 BQ1qAPeP/j7DNSW4u1WrsepvUYj9V42nGaf+XIfLg+SCLkocT+v7e4IAiJYgKoImYeN6
 SMyr2+0GBvbAPzKQIu5rtMCnQJzgILlz+QVZPWxAnK/E9+w8o+IJDH7Sg1esxNZ6uyoc
 ZHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734096835; x=1734701635;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KiX5mmq4vCwE1JaaWuCTD5vC1dSPpb7XgZTnnxB1/+8=;
 b=DN5R+x0S+Jd6Yi+MpLj318PKsDo8V1m8aTS/5mww5Fhn4o8fTQbuTxQ30jmPbprmdF
 lqBb8d7zEX/TLJg4L8bdKMzQdhZbhab+dvLbR5mZytPRr/BcHmwzq9AodemZj8WCVFP9
 +YLhIKnU1u5fV8/Mlyauot4rRdhZVBHraUpiKyPJKmxyoMu2UUR67YXNOyAMeHDpHW6l
 xA3dN/jN2J+9A5H7HWF+YVS3mdhN/Rr7GJhk3bDlR86GqGkfN2GTXKhSKxl5NM+hOWCE
 Yw3QkVcP7jYnZHH6e0yhzD448BLMFmtIhu4jpF5+XAh4BtYa1RYRjXuzJhEiS/cPkXzT
 swyw==
X-Gm-Message-State: AOJu0YzuLnoxRHQxV4PigXcM7AQMgMZHeikRGzM39Cku95R52QNOPX3r
 1WHiQVHxLe5KMi5TG6GseC1iYju1AGC+Pky8mi22qzoCNMbor+StxtgIqFN9rAE=
X-Gm-Gg: ASbGncuQ+/4KlLx1l6S8aXATMGVafiC/su3/wZC2DJZcBuHt3cgDB5jYSH38p9cGV+p
 JKYf9HglD8mEjc0ojWH5UjzilKdHDzvFcY9+OsC8igTYo4TcE4/dqD3cXDqC4MSE9ba9y8RITX0
 U9D3BA1cQ1kIKTOVYuPENfUrlpjQ1lLhjaRN+efhijddkoRUHqEgq5RX8nv/Sv/bAhK2olfc3nK
 mTaD+U9hbXbCMmn/OT/qQ6DQ3uQuC9MsqMyoZu7i8ceg6q85Vr+sR+sR8H0l5FAUD6W9exRpjrj
 SyDtz/SkO7udkm9kL1lJZlFllFvFte/YNqid
X-Received: by 2002:a05:6000:1fae:b0:386:366d:5d03 with SMTP id
 ffacd0b85a97d-38880ad88dcmr1988971f8f.16.1734096834521; 
 Fri, 13 Dec 2024 05:33:54 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3878248f440sm7089595f8f.17.2024.12.13.05.33.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Dec 2024 05:33:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/7] hw/nvram/fw_cfg: Move PCI bus methods out
Date: Fri, 13 Dec 2024 14:33:45 +0100
Message-ID: <20241213133352.10915-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: HMgZDFaNfRDl

Missing review: 3 & 4

Since v1:
- Patch 3 is new
- Added danpb R-b tags

In order to keep fw_cfg device model clean, remove the PCI
bus specific code. Instead, the equivalent functionality is
implemented within the PCI_BUS object in hw/pci/,
implementing TYPE_FW_CFG_DATA_GENERATOR_INTERFACE.

Philippe Mathieu-Daudé (7):
  hw/nvram/fw_cfg: Rename fw_cfg_add_[file]_from_generator()
  hw/nvram/fw_cfg: Pass QOM parent to fw_cfg_add_file_from_generator()
  hw/nvram/fw_cfg: Skip FW_CFG_DATA_GENERATOR when no data to generate
  hw/pci: Have PCI_BUS implement TYPE_FW_CFG_DATA_GENERATOR_INTERFACE
  hw/pci: Add pci_bus_add_fw_cfg_extra_pci_roots() helper
  hw: Use pci_bus_add_fw_cfg_extra_pci_roots()
  hw/nvram/fw_cfg: Remove fw_cfg_add_extra_pci_roots()

 include/hw/nvram/fw_cfg.h | 32 +++++++++++------------
 include/hw/pci/pci.h      |  3 +++
 hw/arm/virt.c             |  3 ++-
 hw/hppa/machine.c         |  2 +-
 hw/i386/pc.c              |  3 ++-
 hw/nvram/fw_cfg.c         | 44 +++++++++-----------------------
 hw/pci/pci.c              | 53 +++++++++++++++++++++++++++++++++++++++
 system/vl.c               |  3 ++-
 8 files changed, 89 insertions(+), 54 deletions(-)

-- 
2.45.2

