Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp970717ejb;
        Mon, 19 Feb 2024 15:02:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXEN2aFGBANwZtXJhJMwZGJzJSjMw/Q4REb6J+ZHvZBAd7qXVsd9lvR4ZLFxeVWShyhTPaR07zfG/iHMNmU8KeEdHVvZdiV
X-Google-Smtp-Source: AGHT+IGwGxMexE2ujN+OjcnWf4ohgqVXANyBMg+eECWTS5463J68FijSBek//WCgz2cfyDuDFLsm
X-Received: by 2002:a05:620a:40c1:b0:787:73a6:bc82 with SMTP id g1-20020a05620a40c100b0078773a6bc82mr1483714qko.6.1708383753251;
        Mon, 19 Feb 2024 15:02:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708383753; cv=none;
        d=google.com; s=arc-20160816;
        b=bJ39N9KgopMvBBSY4gvmiXYEY0eJw7/fGFS559ibcKZLE92zodRVwCQpMhb8aWJCxH
         Zn1Ss9t9D3BAcYOjGTGOr0xlqTU60oz8I0sOJrOQyAsXW6cEcBws0QJc2s1wWeJjw1kL
         URpMUxQBA8sKZHm2wG8dBSWWYyhLh50Rqrfob/7kkGMEiKWUEMO61rjYpnDAHq6l1+rG
         k8Xsg9dG54A7i0ZurrP21SV1l/iU46karg/st+X19PyWWI6czcLn2IkUXVV9aktDHwzH
         OKiKEtQsa3x4+hFP7C90yxnUYcqSNyC22LdKVLiKMpCjkanoHhtBk51Aol5zK34BvhzH
         rQhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=hfWqgvNo3KgIoNH0dwckl7DaqUjC10wh4x4jZEDgMQ8=;
        fh=6KrY4CKvS320/wRFhMawFBiHvssNybDBjUnWO9kOkws=;
        b=JUmoPgMZ6Q2mVU7ocBn+SKVKWJ0xXA7fPfyj5yszlEF3G5L2QZAqrHm3A8xXX4rmtM
         rwwNpYPWxhNu4SV3d2G4AaDLgtXyiSY2VJcvmyuvA8kqSv2FxjAyBbIRBRz7v68yjZxp
         B4F696fdoplNEl/CDjDBBTpfI25QU35tZDkwpsrythQ7XyYQyoL8CleNtLExWTNZG9MH
         HqIzj1FI5luhVUuQ7XrtHhtgWhf3Du8K+b9SHiEc0SizMgu24wn5KGAq8Gibpb1EesvZ
         IsvKpBWuSPSpM/gT2ilLS6xrkK8iLYsksmk8sq7GS9Wc6adGItznBMcG9fHta2Q612Zr
         fnyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=RcTpCJVb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12-20020ae9f40c000000b007871b8aed2fsi7127380qkl.715.2024.02.19.15.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Feb 2024 15:02:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=RcTpCJVb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcCdv-0001VC-AH; Mon, 19 Feb 2024 18:01:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rcCdr-0001UC-H2; Mon, 19 Feb 2024 18:01:45 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1rcCdn-0003zs-Cf; Mon, 19 Feb 2024 18:01:43 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-412698ac6f9so6063615e9.0; 
 Mon, 19 Feb 2024 15:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708383697; x=1708988497; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hfWqgvNo3KgIoNH0dwckl7DaqUjC10wh4x4jZEDgMQ8=;
 b=RcTpCJVbtTKYyrq5rxRTNS7PT+lZFEGE1Z91hsla/KgLYgaeveCMQHwNJx/H1eB1/a
 V2i4PUxFiHPLF0T+/ZinJct9L4UrQ+bd5SlJ6o79MdchnTaLiVdjwvkJ9UCofIKOnr5s
 M85J+m+w+73lc2HN/mFXawPDiLZyCHGPW1RPl7LODBrw97OLgrVVIS080sFpgvjNea5H
 65DsiGtMIs7SpHNifXhjqUlvFzY4njPK9jRmlvKvqCHIsHxc5OwnRBNDDL/vpdtY7P//
 U9wtSRH9k3lJZJBoRmptbxzTGdC4WZR3U1odORZXfNqYzpRTPaEccgYBN8bIffn5mUeO
 qAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708383697; x=1708988497;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hfWqgvNo3KgIoNH0dwckl7DaqUjC10wh4x4jZEDgMQ8=;
 b=DrkHv2pyUdTsJIkmDlZVEq1irpYeg3BSNfQnJ67M1eaQzwwtOX2raftQMiXCQumibY
 rkk416nZPWIinsvpOwVcK8w0SvtZlxWLjytHVu5PbzR8gadnHjGVePSd91zvYQIR673D
 nhWoxvIeU5wQCxYyiMwK1TR2iT9xVE3cJkHaxhqrpM3vuZmNYvXEPdm8cc/Y2Pou0v2S
 A3klJlqn1v2ewi4B7Xc+2OEvSvQh979BXnzTFvVtr1rPafGVheqc9AcRXP6q/bQOTf0G
 XjKytMUS3DaPl8II8xyC5UgNqsZqbfy02beU32syx7LffqbrlRZNQGZnQsXJ3D1dxP0M
 6DLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkjABTap4zBEmRe27WNpAJez2lRwS0+KZjvSb725FwIywy9XWWZ8hiq4oeI7ax5Hiu1g/XKhGvfAx0L2ruZpg0xaFx
X-Gm-Message-State: AOJu0YyOR1SQ21dO0YzqxldaoZ4MpDuwUSVvdkXFeQOpVtFkyg06ERng
 Mh526ZkCVZmqiMMOeAeODpZVrbckArBQJb7hXfG8d0syfYsxn93WzEZ94YMa6r8=
X-Received: by 2002:adf:f991:0:b0:33d:5985:5137 with SMTP id
 f17-20020adff991000000b0033d59855137mr2832565wrr.13.1708383696946; 
 Mon, 19 Feb 2024 15:01:36 -0800 (PST)
Received: from localhost.localdomain ([37.186.51.232])
 by smtp.gmail.com with ESMTPSA id
 13-20020a05600c020d00b00410dd253008sm12508206wmi.42.2024.02.19.15.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 15:01:36 -0800 (PST)
From: Rayhan Faizel <rayhan.faizel@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, philmd@linaro.org, pbonzini@redhat.com,
 qemu-arm@nongnu.org, Rayhan Faizel <rayhan.faizel@gmail.com>
Subject: [PATCH v2 0/3] Add support for I2C in BCM2835 boards
Date: Tue, 20 Feb 2024 04:29:55 +0530
Message-Id: <20240219225958.2421873-1-rayhan.faizel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=rayhan.faizel@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ln1Qv9/tqwiD

This patch series implements support for the Broadcom Serial Controller used
by BCM2835 based boards for I2C.

[Changes in v2]

- Fixed and simplified writing to status register

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/481
Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>

Rayhan Faizel (3):
  hw/i2c: Implement Broadcom Serial Controller (BSC)
  hw/arm: Connect BSC to BCM2835 board as I2C0, I2C1 and I2C2
  tests/qtest: Add testcase for BCM2835 BSC

 docs/system/arm/raspi.rst            |   1 +
 hw/arm/Kconfig                       |   1 +
 hw/arm/bcm2835_peripherals.c         |  32 +++-
 hw/i2c/Kconfig                       |   4 +
 hw/i2c/bcm2835_i2c.c                 | 274 +++++++++++++++++++++++++++
 hw/i2c/meson.build                   |   1 +
 include/hw/arm/bcm2835_peripherals.h |   3 +-
 include/hw/i2c/bcm2835_i2c.h         |  78 ++++++++
 tests/qtest/bcm2835-i2c-test.c       | 105 ++++++++++
 tests/qtest/meson.build              |   2 +-
 10 files changed, 496 insertions(+), 5 deletions(-)
 create mode 100644 hw/i2c/bcm2835_i2c.c
 create mode 100644 include/hw/i2c/bcm2835_i2c.h
 create mode 100644 tests/qtest/bcm2835-i2c-test.c

-- 
2.34.1

