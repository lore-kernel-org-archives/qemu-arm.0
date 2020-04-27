Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4438033lfm;
        Mon, 27 Apr 2020 11:17:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypIO7FLuu66Q7h1esvgfsKUmHoSWoRymmp1kJaA4PjVa/Mb60/SU0E5ul2ifg8nJQjtd/IBB
X-Received: by 2002:a37:b887:: with SMTP id i129mr23056236qkf.462.1588011439995;
        Mon, 27 Apr 2020 11:17:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588011439; cv=none;
        d=google.com; s=arc-20160816;
        b=jsFUacw3P/jmkpZ1WUOevwOM+sps6F53OIlVFQmF5Co6omwuGZulmi7INm27YaPowb
         Qk7LMbdSqF67Jyvw6TnJdb2abPytbKS/BTQGOvjC0194XyInWOId2ivqwLHSM2RXetCp
         t22Tu2u38hI0tjIM2Th5LS07UMaS7xHO/SZsI9MN64EdxYvWwOQxWAEKc7N5BxWDjeFG
         H6n/dy+nkykOfNthfJqWgP0pNb3/28B1MPGVaRsKoCZkghYRPMJaHP3SQzC+S4mbDozE
         APS2p0sRMMIbg1dB6BfHm3Ujrq7Qlqw9ZwrNACmoFTuy2jzpmf9jLsBOUiC+ZFmVgS49
         9/rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=jjhg4QYAOWYZwZu11uVJpfLsdLA4NrQAXKFJHCI6aYg=;
        b=bDdDC0hXRPuKXuDY+qcqibGNdxa/mup+WOOW2sHQIJ23VfwxZrh8x08BzlblBQ8a4v
         SiI+SZqJbBn+7D45BKyk3DdkWZZZAmck6DBelE3ljy2JjxYqnwnJb8uau8JSnzpxwwVZ
         W9BCEv5yv6SakFCtmFRu0LiAdndrjist2CEYgcTzb9CS/oSz1LphxJdH0zUEf4RawuG+
         8U3CoEJpqd0FK6S5GE0kwLc7pZqzk0jcPwoGkQqoms/BbgCwgA3m+WEW02V6RGhl/nSJ
         JDXG+ueHfbe6qobhnxLZsksBLjRzBDUE/iJ6uWrQ3pf0Vi1tInnRNuVpwSa8aw8cnH+B
         w1DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JU8gbfCS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15si8602314qkk.174.2020.04.27.11.17.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 11:17:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JU8gbfCS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT8Jj-0000DQ-8N
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 14:17:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34864)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jT8JP-0000C7-2M
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 14:16:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <edgar.iglesias@gmail.com>) id 1jT8JO-0005Gu-Ln
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 14:16:58 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:36724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1jT8JJ-0005Do-83; Mon, 27 Apr 2020 14:16:53 -0400
Received: by mail-lj1-x22b.google.com with SMTP id u15so18650890ljd.3;
 Mon, 27 Apr 2020 11:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jjhg4QYAOWYZwZu11uVJpfLsdLA4NrQAXKFJHCI6aYg=;
 b=JU8gbfCSPVgJGF8xDacinxmrzn7CPt4jZeYg5uKL2icxVPasSj009lm6t03+3mwMou
 IXBLmmESdRxP9h10cSR5eVCVmcqXLkfORxNhfymsTuNe91o02XFNEJcxNO82ghtWUEmd
 yMSF31FzWXyWOggMFxXpzuFYZ0IQIn+VuJxbhQb25xjAMDTPUfWduw2yEMjnmRy6RfeD
 /M/DInxRk822ogTCmkOIICvBysotu9Gf85jCmtB2V/Hb73QoX77VDaUsigBWioxvFYTa
 aaI2OoL7aZIivXkIsQN2dQEsIjDWlyviVpRU6WoxOsREWm8vF54zI7N7CzJ+Y3BPanqY
 ptCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jjhg4QYAOWYZwZu11uVJpfLsdLA4NrQAXKFJHCI6aYg=;
 b=nIRTZS6Px4z3ECza62hBsSVIGMPC+dKmjeD5TpHY7cjsNR7ppX7jZR26V7mAxHQpYw
 9oITsCby5YTvIWteX4FnNsNSr6iw7nWF9j0SjWI/Hiq+in0vdMa+sM8TZXOSqQ1rneGB
 FEANzoB1TXot5YoHpEFy0RtK7v5EuJ/12lShTnbGUxGyfxruz/svKBr6E/UdtM6L7f8s
 xQA6OJglXpml62kKdLr9H7A0id/6r6tMSDVoLTgkRfzQAeCBVs6qsI+2+JNUnBM4YbiG
 fuhrE4isgFdu3ClUN9hwxdq0pMijt+PhmNjbWC5D7TG+a3ENA6AWUI+iuUXkqVnzi0KO
 V7wA==
X-Gm-Message-State: AGi0PubQ08yQYFIYD1TTJ6dj2fRnt/CkKnQhl9h8D6drg70GP2FTk85E
 GHxm/QqxxdoG1mAYEWTulvMAJUmJnhE=
X-Received: by 2002:a2e:8083:: with SMTP id i3mr14893506ljg.175.1588011410829; 
 Mon, 27 Apr 2020 11:16:50 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id 130sm11857486lfo.42.2020.04.27.11.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Apr 2020 11:16:50 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 00/11] hw/arm: versal: Add SD and the RTC
Date: Mon, 27 Apr 2020 20:16:38 +0200
Message-Id: <20200427181649.26851-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22b.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::22b
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c9YJ4Kbe+06B

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This series starts with some basic cleaning, continues with embedding
devices into the Versal SoC (as suggested by Peter in another review).
We then connect SD and the RTC to the Versal SoC and hook it all up
into the Versal Virt board.

Cheers,
Edgar

Edgar E. Iglesias (11):
  hw/arm: versal: Remove inclusion of arm_gicv3_common.h
  hw/arm: versal: Move misplaced comment
  hw/arm: versal-virt: Fix typo xlnx-ve -> xlnx-versal
  hw/arm: versal: Embedd the UARTs into the SoC type
  hw/arm: versal: Embedd the GEMs into the SoC type
  hw/arm: versal: Embedd the ADMAs into the SoC type
  hw/arm: versal: Embedd the APUs into the SoC type
  hw/arm: versal: Add support for SD
  hw/arm: versal: Add support for the RTC
  hw/arm: versal-virt: Add support for SD
  hw/arm: versal-virt: Add support for the RTC

 hw/arm/xlnx-versal-virt.c    |  74 +++++++++++++++++++++-
 hw/arm/xlnx-versal.c         | 115 ++++++++++++++++++++++++-----------
 include/hw/arm/xlnx-versal.h |  31 ++++++++--
 3 files changed, 177 insertions(+), 43 deletions(-)

-- 
2.20.1

