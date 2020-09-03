Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp725921lfc;
        Thu, 3 Sep 2020 10:29:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIWJbSHZIXxSHijiUxYv7P4mZrLjWocMa5Nepvr4TLzzRFjkgdM6AdIa5J07atLA3Lk9ob
X-Received: by 2002:a25:c694:: with SMTP id k142mr2118809ybf.124.1599154147541;
        Thu, 03 Sep 2020 10:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599154147; cv=none;
        d=google.com; s=arc-20160816;
        b=adm7xugT2h5PeXyJlIhiKyo4gob07m9FPtJUyHygiA3OTMlP4t1sb9tQfrDmBTP/Sv
         n2suhsHNjUqDdsCMCUiHtHHb3tXZ3XNxnHw7d3CSinFJaPdwzQAUKJxvRo/u1QjwOYmR
         Pakj0rvg/WVMJmZijFeP4WHOmBQ9q1qMvg2g0wnl7N1gNaYvBhIhIkuaeyx18qqYUIeX
         0d1bj0EtO8yyNCFTUDG3us7lE3fLEKRrW8GoWqmqENAAEVbT1S6gTB6vgVi+M0WhW67Q
         ZlM1/k1aTi6PHQiWbqKSdJhBrKEZd+KqIUAWS7yuLCrotm+qQLQQhsZLES/RCJVqY61R
         hl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=MaYvDpYA/q1gHW4bD3RmC39zVROC6oAwV/mFF935mOk=;
        b=A1iEECGpihUwd6jSc+VdPwcSouU8bzQ+l7+8Bweu0eVt1328QSe4gVOgPBOmBbeI4H
         IrlglkhOOrfRL6EOwCpDti49kCfZxFAiIJAX4Lt/i49uxhaPtZUHA1qLBILUB67m6vt7
         QD5312lEGpiJ1n/TuXVDl2BhDqo5mm7cO7Ad6qU1faDltaCsAYHx7zovD7v2TffZVV+k
         5+qPph7pWpcz8iFj4Y2LLMxnb24lPnYo2+/loRYdqHPs38RizHO0Dv5UJJyLXki+rH0N
         dbPryTBAMfrnq9MqOWTRNlB3DyEVaGJffwje4YeWYc1NdFmyyjnAkenajUBo7/+FzqHW
         q6Ug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A4R1ADeV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 84si4310602ybs.20.2020.09.03.10.29.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Sep 2020 10:29:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=A4R1ADeV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:57012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDt2o-0002Pc-Uh
	for alex.bennee@linaro.org; Thu, 03 Sep 2020 13:29:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kDt1x-0000p2-Gy; Thu, 03 Sep 2020 13:28:13 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:42742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kDt1v-0002V5-KF; Thu, 03 Sep 2020 13:28:13 -0400
Received: by mail-wr1-x444.google.com with SMTP id c18so4068752wrm.9;
 Thu, 03 Sep 2020 10:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MaYvDpYA/q1gHW4bD3RmC39zVROC6oAwV/mFF935mOk=;
 b=A4R1ADeVqpDDM6cYNxZfbffyJcUga2yXAfFk0JhtGCPzRjJ22uVpFCfE8zDbQ3ETc9
 NMGjg1P0ZrPRfiYybGTYrdYUTXBvIe+0+9biwOgVJg9nV0lyU+LuqZxBg3BD2sNllryU
 kP6rhep2jcEEajTQfvJcqyKoHzqszqdHLTQBDJuWDazruJX6IubE8Q2CURdfpWbScIol
 22rFQRJ+VhftqKc1HJMN6YLZv9A/cdldlTrmez4w4Jtx9KoAb3P30srdFww2At8+Gbpz
 6ks5dSrD3cEGOuFmHgljCsCQh9nQe1VXyNqVaE5aFHYjq9xtPgJxchEs5Or1JQOJvQXS
 uhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=MaYvDpYA/q1gHW4bD3RmC39zVROC6oAwV/mFF935mOk=;
 b=InIjcoCI9OpwlbrqdusRKWlawAiYn2l5gSkMsEjRfQbVr0T1gX2/yLELsd0JnLkTKf
 ZZqhlFQhPDRy95dzf5mJ3FewfK9SJMXf+AC1ZEzO/K7rjalKlAXsujsJzUemI/fmJDrU
 T7Pwp5JblckPsRQ2X7rxv3j9A5/RjH2MmPyyfzgPZ/iYW8CIZuCicAVjl5D1jBEjQlJ0
 qT1I1j6OWfCEcRSDO4IYYUGddGprxeUXFRdPyVZMuIh+huUZp1Im6cLT3l7BZbzBZgdk
 v/oCCVViPY/UIYbJfJwT615ntIgj55b/K0/ePNAFkHlCP3vVJcVtbUUlBlwJG50Onco6
 rfdw==
X-Gm-Message-State: AOAM530hoXu2jqvgsu0syBlOUjmuJYuNQcoCgaZ9KniHoWnaLck2JMtP
 PN4no/1Q//7HE/bN5eM7uASxd2KNVsI=
X-Received: by 2002:adf:f011:: with SMTP id j17mr3376770wro.335.1599154088909; 
 Thu, 03 Sep 2020 10:28:08 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id b2sm5325802wmh.47.2020.09.03.10.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 10:28:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] hw/sd/sdhci: Strengthen multiple DMA transfers
Date: Thu,  3 Sep 2020 19:28:02 +0200
Message-Id: <20200903172806.489710-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Ruhr-University <bugs-syssec@rub.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kj9Q5s8WaEZ6

Still trying to fix the bugs reported by Aleksander...

- Do not send 0 block count
- Reduce DMA to MMIO re-entrancy by yielding when pending IRQ

Based-on: <20200901140411.112150-1-f4bug@amsat.org>

Philippe Mathieu-Daudé (4):
  hw/sd/sdhci: Stop multiple transfers when block count is cleared
  hw/sd/sdhci: Resume pending DMA transfers on MMIO accesses
  hw/sd/sdhci: Let sdhci_update_irq() return if IRQ was delivered
  hw/sd/sdhci: Yield if interrupt delivered during multiple transfer

 hw/sd/sdhci.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

-- 
2.26.2

