Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3204905njb;
        Tue, 18 Mar 2025 13:59:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDLudI7EXulXVqaRO5hD3FUMvQrKf6888Xsq3UL6llCK6cMQ9FoU4Bxtn0F4F2MSkKkt/RzmA/N3KVcg==@linaro.org
X-Google-Smtp-Source: AGHT+IEDuxE8bW/1qY0DaR074kOGz3y8wM0xyq9Pl1hBO50AlQVSs59bhUKCXUirb7KsUY2lqqeL
X-Received: by 2002:a05:622a:17c4:b0:474:e033:3efb with SMTP id d75a77b69052e-476fced9f45mr80220051cf.24.1742331548768;
        Tue, 18 Mar 2025 13:59:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742331548; cv=none;
        d=google.com; s=arc-20240605;
        b=Ze0e2WASWrplGmTaR/rCTCbsMM1me9f35c2RUs6JG3xlOu9RFG9eGTV/ap8u0EHCk/
         2WgGgUMM7PPPQOaNgBsY4sHM9wgRsG3SyGHEs7zLBsCOBxwoWvmWXSzMb2ghtOFCQaQd
         MYtcNzMIqY99IAL/yiNLvMv9GYR3GSqyNRwr5avLtRU44xP6bvIfCjILOlNLG4taKxR+
         Pmmhw7XNMTI5H2bZ6U5RYMvJWFaWoviX0Na3jWmI87ilpUnUwiOF28jqWFMu/kNF/dbi
         sT5vnpfmtAE8qdZuzlI9nmKPAAvZKdxIqfNc1uvOYOK6HSIoEHc5lrzC1VAhRAYQ0rp3
         WexQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=W+m/MM6yhH7CW9/u/Bw86g2b2P0pk0zVcocYDACn2/8=;
        fh=Ib2d1WqeRAwRl8D2AKxsbm48yfAkZx3UXmaEkuwYgF0=;
        b=Zee7DQSXLGI88FXPqbISClRNzZlGhMEbTSKQn1/7mJENRvuAy/+UstWwlur+EvA6Cu
         zGq1VxaPZ8ETIMly+GOmLps5AakrTuQ0zAX2C06zhWWeUWeldJWOlpVu9MB2FtwP1hcM
         YdAMJ8bkkdkHzFkrGgJWHkoMBvZ9sR2A7XOQaUNsxO8+fLB2jSijQ8P8jz6J7uQ9GW6e
         x/ATB5zAxD6pFrNYxW7gkKvuiVoi78YL2UjS1UZF/KlXS1eB3KZMM3nxQI1YAdeCp4kO
         iKTlzAeWP0vskDfz2SNHVwyiOzbvnwj5PsnHgImVu9mO0LfsMTNpZ6JDf2Iym92V0lPO
         RB2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDvGjTy3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476bb7df362si131163071cf.286.2025.03.18.13.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Mar 2025 13:59:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jDvGjTy3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tue0Y-0007Mv-5O; Tue, 18 Mar 2025 16:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tue02-0007Hv-9P; Tue, 18 Mar 2025 16:57:23 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1tudzz-0005lH-SQ; Tue, 18 Mar 2025 16:57:21 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5e5e63162a0so9057461a12.3; 
 Tue, 18 Mar 2025 13:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742331436; x=1742936236; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W+m/MM6yhH7CW9/u/Bw86g2b2P0pk0zVcocYDACn2/8=;
 b=jDvGjTy3yO01g4DZ/o3p9fgK2/a4P43TPiDMN+G6s2mS9oMu5T7iWr9J+mPEL0jwEM
 stSeQCpdO8Ca1WZ6yzmBpfv5HJ90T8RPkTQPj567tDcpE7/rHwAy/1wIViUc7PeRvvvK
 V9Tlx4XZ0/rOPRBCeYGjd0FE5LHx3KRK0gFNl1uY0OnL7y21EJymzkDdcI5kX8WhVUqf
 PitTx/kV/Fe7/+7dUSs+Knzu5sY9ixhloo6LOpY7ACcyUW+2ZRKCjNRgtVpzrCa5OO5m
 Aqq4L21DoI5EbyQuXLJ1rGn8Dku/4yrLf2Z1/89xHXUz6jmUUAtseA3NBy0gKwdZaihA
 11Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742331436; x=1742936236;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W+m/MM6yhH7CW9/u/Bw86g2b2P0pk0zVcocYDACn2/8=;
 b=kFLmIAb2yisCGr/MiTN+GBI/pJxAlO7npivf8AJ9O8hgV8tNdbqdlhdM6ahC8wMK1f
 qwLEb1UVPcAZvqlgblYOpbTQs/aeSqrjhuHdkzAHpAzkHy5r/cpO2hAUx3jM/f63LvO3
 DDX4kddxreER2BFydWPny789GHUXWN1LjMxdOPONCUpICe+s6QbYDx8dC9NWUUvzphFE
 rFgMW3ETmflDW+H2xTIHt4Wg5zcJcW0dL8SGZEiiG4bJ0qyB2gfoHRrECG5/qFqiSvV7
 /HiR6qPQSIpD0He27ihhmkDQWhz0RgPUQpmh4XEwjPKK2fR/zykDZJks4EWFNxBNDJ4m
 3zGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6m7KcLKzIKXJ9wsGt9VWTYpxiRiXwcYrDzuzGpgJ/+ev4EGRZ7RRhp7F22y4hMJdGcurYAqWmBw==@nongnu.org
X-Gm-Message-State: AOJu0YwgopnCM5V+2K+9TSz9BYG2n+zz/lfDUAUHs4ymmKmS3msPiH5I
 uR65K1icuN9Hw9q4Ef3c75n3HFqOYa2SHCu8ohWRRk/x+fvvzVRnAMRdqw==
X-Gm-Gg: ASbGncuFfPenodequIfbnf2X+7edGtn3EX+uEcSUCAno3OpENsWiHOo+UgZv3oFNEO+
 CKKJsCSL0TaqLLgngqzfM52w6+8NEAbXfOvDER1xNjGHLmXgZL0xoje4Ynju4hwBxeihUizNzAC
 6OibouarjsuaFbPEHU4tb6RbFn0OUcNfJLn2UNY6NOeqJZDzaQQINRhbC73qH8V01ajUclm1C0S
 v8jD9cV6kqi5Ek7tnZu4qKztKkAYLOk0a4ZnQGYGQmIGHcHkfoOgqUHv9qbMY8Qj4zSslps4dA2
 cEJwtxlqnI+cB0fEExLsqNC9iXU1BU3Ky/qbuU1dk5mRNNbO2cc75LC/+XfkNsaK1rGsgJy4cVl
 yyMPkpozld57nTdWnX1h4+PfWXS1L3eLxyPHe0+14Mv90TTCH3FnhFzemEABLKgc=
X-Received: by 2002:a17:907:2d0e:b0:ac3:3e43:3b2b with SMTP id
 a640c23a62f3a-ac3b7d9469bmr8124866b.18.1742331436377; 
 Tue, 18 Mar 2025 13:57:16 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-2a02-3100-19c6-0d00-0219-99ff-feb2-2458.310.pool.telefonica.de.
 [2a02:3100:19c6:d00:219:99ff:feb2:2458])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac3146aed4fsm895944266b.26.2025.03.18.13.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 13:57:15 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 0/3] i.MX 8M Plus EVK Fixes
Date: Tue, 18 Mar 2025 21:57:06 +0100
Message-ID: <20250318205709.28862-1-shentey@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: R4CWvQs6pqRe

As discussed in [1], this series modifies the SoC class be derived from=0D
TYPE_SYS_BUS_DEVICE to fix the reset mechanism and to prevent it from being=
=0D
user-creatable. It also removes an unused define.=0D
=0D
v3:=0D
* Fix reference counting in separate commit (Peter)=0D
=0D
v2:=0D
* Do not set user_creatable =3D false; (Zoltan, Peter)=0D
=0D
[1] https://lore.kernel.org/qemu-devel/1cdb6643-8fcc-4bd8-93fc-fcc93589c9a3=
@redhat.com/=0D
=0D
Bernhard Beschow (3):=0D
  hw/arm/imx8mp-evk: Fix reference count of SoC object=0D
  hw/arm/fsl-imx8mp: Derive struct FslImx8mpState from=0D
    TYPE_SYS_BUS_DEVICE=0D
  hw/arm/fsl-imx8mp: Remove unused define=0D
=0D
 include/hw/arm/fsl-imx8mp.h | 4 ++--=0D
 hw/arm/fsl-imx8mp.c         | 2 +-=0D
 hw/arm/imx8mp-evk.c         | 2 +-=0D
 3 files changed, 4 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.49.0=0D
=0D
