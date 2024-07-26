Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp271641njb;
        Thu, 25 Jul 2024 22:59:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUiZcb4Hp9DfxKgKVbg7/y9A/CvZ2QoMwsAT3NGRNkjnLQbKmf6T3vmBTm8zT09btQRLnUpGgvSZPHaMxhgSb0cWp/lwDf8
X-Google-Smtp-Source: AGHT+IGLrA+zJfPEWqeiW3bC/471/9j4zoPk7BYEOVX2n8KSVG6CbwaoB9uJfp3CdMMS96QgmHnG
X-Received: by 2002:a05:6102:f8b:b0:493:c803:815 with SMTP id ada2fe7eead31-493d9a82c66mr6071918137.1.1721973590281;
        Thu, 25 Jul 2024 22:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721973590; cv=none;
        d=google.com; s=arc-20160816;
        b=fyVEyg5O7e8otx7lcjAUeXfzzOA9KeHZ0/aWUweGTSVe7LomeC1+agNcasqdwMpmc4
         K+Gy3/7fkF4vZW8V1ItQUVnK/4l1C/WQwmkga55eep9cSqLFDg1VN0tMEQEi/thJOjfz
         gQ6itMCgQh/dKRUahcrEKEi99Yv3zwavc9zPdRyk6wrA1EYTpYJZSw66cKUt1n64Tzo7
         mY/Yc222WkUFxmd/OcKarvflzzqBe0O97s38JHDCoPk9CRnPnoT5rnkpqV+U/vMffReF
         /GfBC5aueuiYgUVIHDA4iaS+mZPK7TIfRuGzE0Kc77NTqEBJxy/fhPMHAYlfnGaL1V8E
         kVVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cDXUV1ROupA6i8xkgh2rjOo8lmNHwSBtTD7KktWSLk0=;
        fh=nBl4PKo23cFU4xaHJ8v3VT8t2NrP9BI+qqlF529zD/g=;
        b=1F0bBO5kJJV3HSbwbWg3W0eEx5xSgySQWYaExp7zTQClfNxESM7lVkzKqKEFK4NBug
         ZzCynH8Ok2lZvdDHrHVIZ/zEVVfErOOQwNyqLDDREMZDcb+kpPWWin9Jtc1ELb4Qe5HQ
         QEbPrigmrSOzRU04o2ZZml0QVDtan9r8kPu+E3C1ZArmhlJOQTvjnTDOHH1Kh4fQftDK
         RJXwQKGr5DEQiazOjUPxRuZxWNbrmgJLvIkRxtJXqV6FQTbMBqTHcUFqskFIVqCq5nTD
         Gts2zVtsZm3zN6BStaqb8sKID1ozXuwRn2S/nnSWy0/iIzFFYo0zW6ICejDxyEUejMN9
         pefw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=ObPDuLDz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d744692esi341565585a.259.2024.07.25.22.59.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2024 22:59:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=ObPDuLDz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sXDzV-0000y9-EG; Fri, 26 Jul 2024 01:59:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sXDzT-0000wz-Nh
 for qemu-arm@nongnu.org; Fri, 26 Jul 2024 01:59:44 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.shu@sifive.com>)
 id 1sXDzR-0006Ww-Sa
 for qemu-arm@nongnu.org; Fri, 26 Jul 2024 01:59:43 -0400
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-7037a208ff5so410114a34.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jul 2024 22:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1721973580; x=1722578380; darn=nongnu.org;
 h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cDXUV1ROupA6i8xkgh2rjOo8lmNHwSBtTD7KktWSLk0=;
 b=ObPDuLDz8C6pd71QZDQ/OcbcrpKOC4r2nDAPgDdJjcWGKzSr6Su/bPMosTZd2JJk7l
 MxDwWv9wQiL4yVqdH3gFMRdL8Y8bAFZZlgLiyz448Dpp9DPw1Vc5imR1Z66/iGwq7ZPG
 iiS687z3CVv36pNs6TOnjXL0tpxq8HIwJJskLQonzQyIJ1rHSifqasoypZDRJH8tqKOj
 msSj2Iy88NjiIwH5DLvHm0FZcfCaiuxJ2JOGH4vLZkyeRnYYqlnycr1QVVtWKfQUxd39
 JKqNWxDsi48yi8SMhwH+touUm1w9LVC/tlwjBDjxzu4ert3xLDtwEtQS4VlUPwJTLDjJ
 7jGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721973580; x=1722578380;
 h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cDXUV1ROupA6i8xkgh2rjOo8lmNHwSBtTD7KktWSLk0=;
 b=IX+6w+UFdbulfaNAa97WUlYW7vgLOP77mkpj7y5Gye7fohRjaQ0hqaLsXJ/ujEJko0
 chhDw7ZKlCYGXfzwo4PUxmYh/cNNEyPbw80bi9PkItR2/z8QvvTEQjAIXLV6Hna+7WvD
 mprdKoatmj0zh9i8M/GvYqUJQ+LjFjeMol+ZqssjJ2psdNh8CfeuJDkCl3YslfPHWESp
 tDhiTHpoDJ/TZmax3Z8zviMDfrkF1BKn8NHQLmSILnhdLHimQ29rKevFuRkmAZBf9QWi
 bwYwkOgpz3Vb1UejjyPXP6FsNL8z+RNQ4hGB5FTXVcD2m4gdZGwZeL8Z1/gA/gnJEm4L
 CM7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlnBxTsetjx3K7U1W0uNRIi383kMw0rrdCN1hEpFduFNVyr9honTEiUw/W7pETHczdxbpen7GDH1CV2C+sg0/lz47P
X-Gm-Message-State: AOJu0YyV4UcP/vsn45jcl44hODcSLbKgqkhU5Tivczpw0kODIXqfRYsN
 sgo9+Hzd72mZQHmFXjgkqQTkxI2JRgoPqtCdOjBGGyaQF1Fy+sYLQnTUI28Wrjs=
X-Received: by 2002:a05:6830:6318:b0:703:654f:9e9c with SMTP id
 46e09a7af769-7093210ed03mr5834622a34.3.1721973580434; 
 Thu, 25 Jul 2024 22:59:40 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead6e1a4bsm2002128b3a.5.2024.07.25.22.59.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 22:59:39 -0700 (PDT)
From: Jim Shu <jim.shu@sifive.com>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org (open list:Xilinx Zynq), Jim Shu <jim.shu@sifive.com>
Subject: [PATCH 0/4] Several fixes of AXI-ethernet/DMA
Date: Fri, 26 Jul 2024 13:59:29 +0800
Message-Id: <20240726055933.817-1-jim.shu@sifive.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=jim.shu@sifive.com; helo=mail-ot1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: qWxZposPIDIs

Fix txlen value in the descriptor status field, DMA error handling,
and ethernet/DMA reset flow.

*** BLURB HERE ***

Jim Shu (4):
  hw/dma: xilinx_axidma: Correct the txlen value in the descriptor
  hw/dma: xilinx_axidma: Send DMA error IRQ if any memory access is
    failed
  hw/dma: xilinx_axidma: Reset qemu_irq when DMA/Stream is reset
  hw/net: xilinx_axienet: Fix DMA RX IRQ if ethernet disable RX

 hw/dma/trace-events     |  1 +
 hw/dma/xilinx_axidma.c  | 97 +++++++++++++++++++++++++++--------------
 hw/net/xilinx_axienet.c | 71 ++++++++++++++++++------------
 3 files changed, 107 insertions(+), 62 deletions(-)

-- 
2.17.1

