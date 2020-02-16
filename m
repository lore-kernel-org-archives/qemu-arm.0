Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4309707lfp;
        Sun, 16 Feb 2020 11:43:57 -0800 (PST)
X-Google-Smtp-Source: APXvYqxIrslEcWt/4fRNWD2zVbu9Qm15BwNmVUFkDq2RFqbb1EzlkPG6uK/B1D7FooZuisrnISFJ
X-Received: by 2002:a05:6214:1267:: with SMTP id r7mr10216108qvv.160.1581882237455;
        Sun, 16 Feb 2020 11:43:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581882237; cv=none;
        d=google.com; s=arc-20160816;
        b=jqoTTYolZh1IN0wxeW4g+r1+SS7SyjvuFQj1cDKX5P8S5LyEzMg2tf76baP8qe4f0B
         JkSQqodwt2ErfeF6IB6e3moXhSKt7wk+PFJJ/7AR7OhK/Lu8itHJtvivUioJvGvJVj2r
         FqdS9iENekwPGVQolZgLZMsTzcWO00XlB3nOva17Qi2j9fCJ1AUMKWcRF3t9To90mlXm
         6F9u+z9cVntAoGVshHnPgV3YgGchAVEO0g+4ErYWe7wldx5UkCg8GstNa9ABPBINU388
         rcjylQkrvGZHZkO4p58u5xSzChtV1/lbGTr+HVyZlcty1IxD88o7mvKUydxLBCMR2p2+
         BV4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=2Ox+v/I0pqLjSZRLVIm2ELpIo1rl7PcWPrh50XcU3n0=;
        b=BWRAqA9zPGhFsrrof0d+4pF6Q4jG1u7vo0Twl8pDE+8PtCCF6HTa2Ye//J9HtPntMF
         CDEjhlbWXoPa8FO5DJhffCnjerTqDaGZIhKWiSgh+Bzenza31GIbM199Bn3BT0jYNEhf
         tqQdcCLrBU73WwHGYUToAobwxpzKC4GTPBu1/9dIBUraOLqtCI3FW7/ZNN6zycOCVjFF
         Jfpr6sRUwn+KA4Trt79r4Z5iFeT7fa4iaKM+VG3pDaWkL+K9ZgcGZFDFDqETLGauKmCQ
         6qBCWpCFFWH9I6CyJRDWUKmb9NAfvNJqtagk04JNpB1G2FFpbbBJI6IQsbL5D7tdABuK
         +Bvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C5W/HF0Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si5704704qtn.1.2020.02.16.11.43.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 11:43:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="C5W/HF0Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3Ppc-0003ce-Rm
	for alex.bennee@linaro.org; Sun, 16 Feb 2020 14:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34659)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3PpT-0003aX-Hy
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 14:43:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3PpS-0005St-CI
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 14:43:47 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:43809)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3PpS-0005RF-6B
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 14:43:46 -0500
Received: by mail-pg1-x534.google.com with SMTP id u12so7531942pgb.10
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2020 11:43:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2Ox+v/I0pqLjSZRLVIm2ELpIo1rl7PcWPrh50XcU3n0=;
 b=C5W/HF0QbLRqYmpwkA9ZL+VCbhMUDiMRfYlviLRrwXyJrFZ0KsPpNPbG8Z3jM8QSUo
 p9TEA/eFRJnBFCaUG0wGRBSrMDYc6dYRj/KfUUBhfZcSfaIDFju4SvBDnPJHdJf9JHak
 V9+GPZ79MAO+gExD2wqDYdH5TFeqpWtNp8dW4ZbYyhMq8PtDt7oe9z6FsETH7WUn93N7
 bxz37VE0m/dAFWTkB0obNDFOLPd7l4TcpC1gr/W3Gr8ELnQzwKZM9qcvHBwJ3eMS9kS6
 Xiw9+FByobRoLbag23Xf3oYPbhq2Z5no/LIZVm1wViQ7LqmMFBHpZB1kEyXa6tcSBuvL
 Ut/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2Ox+v/I0pqLjSZRLVIm2ELpIo1rl7PcWPrh50XcU3n0=;
 b=LSgfYsZYjwnKQxjd6Mn34f3i78UkymOaI35nq21TxPsZqiYZ4WjVOgIt7F9ngiSdoS
 qZwUe5c8ebeujr+1MkJRvYvZKomy+mfnnp/+ymnlcaxZ15z8ogesw6eo5k8+wiMatWzj
 551cP4gJU6DvJQmNJS//kThrPl2mr2eGVXICcTy29q5eQ5LE+C2/HfdeCNtMWOVPK37Y
 k/+wzKbpWz8I3q3C9SfhFSUOWgxgAWL1j9VXPFCIz6lnbDEA9CtT99h7QTlGWTVLFXIZ
 OJF8LjNJ08J1YYDXyCNaBpcDXo/q82CR+qu1VfUgQHqGz4gZv34GcBMsJvZC+uc+7zDr
 jEGg==
X-Gm-Message-State: APjAAAUcyTLwuGVGYAdPENFuQp+Yivpo0DnCPdegaNHG5GB+K1k64UXk
 zU7xWGdY0s8YpcuFYAt5Uxopjg==
X-Received: by 2002:a63:f54c:: with SMTP id e12mr13873617pgk.181.1581882225018; 
 Sun, 16 Feb 2020 11:43:45 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id y127sm13945188pfg.22.2020.02.16.11.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 11:43:44 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/4] target/arm: Reduce aa64_va_parameter overhead
Date: Sun, 16 Feb 2020 11:43:39 -0800
Message-Id: <20200216194343.21331-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::534
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8WwgAEizI5kY

Something I noticed while developing and testing VHE.

For v2, fix select as a separate patch.
For v3, adjust pauth to use bit 55 explicitly, and remove a
now duplicate test within get_phys_addr_lpae.


r~


Richard Henderson (4):
  target/arm: Use bit 55 explicitly for pauth
  target/arm: Fix select for aa64_va_parameters_both
  target/arm: Remove ttbr1_valid check from get_phys_addr_lpae
  target/arm: Split out aa64_va_parameter_tbi, aa64_va_parameter_tbid

 target/arm/internals.h    |   3 -
 target/arm/helper.c       | 144 ++++++++++++++++++++------------------
 target/arm/pauth_helper.c |   3 +-
 3 files changed, 76 insertions(+), 74 deletions(-)

-- 
2.20.1

