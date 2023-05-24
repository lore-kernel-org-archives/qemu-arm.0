Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2470301ejb;
        Wed, 24 May 2023 04:16:04 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5sB7fJx1BMIvUOW5iHtp+b4kCCiMxyBTWu99KzqewsWD7IXYPp1g7NPDq1fGOCTSwJsIAa
X-Received: by 2002:ac8:5b95:0:b0:3f6:a807:c9b1 with SMTP id a21-20020ac85b95000000b003f6a807c9b1mr20138311qta.6.1684926964282;
        Wed, 24 May 2023 04:16:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684926964; cv=none;
        d=google.com; s=arc-20160816;
        b=kfNM4P7jEjSYVqzu428DW5op1dGkYFwrCgmlZlFj6tPdJrY04j0A1yu/7zy4iQ1cUy
         Qm1KeBRJBtmKN69qS0emBvmp3K7k3USUbE+p9Gp6W6neQfWoFgNpA0t0z2e7kkE8HQue
         P6wAZ/X+yzUWp0Akh1QxxILvszSxLmJOeUC8frth6R5bWlMH62JDQpWdXH1sEH7ZMn7v
         ZWGF/5UnPbNBmFV8BCxm7y5PAN+m4qFSPGyx4xJNa/VyAcJOeQl2ydqhm9WywWPHt5IX
         hWBnytS+YDgr1fmRH1w/OShBjkBxxFff+J/z9Vcp77Bng19bGrvYrN1s1IKN4lxcjarI
         y05A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=T8d9Wmvwb9pDr68eJ/mcJbc6aTuJ0+Mxmq01DPEIGN0=;
        b=nzUfBqoZm0wA6Cp9AW2oDQDOQKbAfrnfKmpLbHQOA5fjqkHWZMjIuH3S3AZGSVbpVX
         X2hvpm2ZrS9SfD2syIZU3UOEC7yUqfd1k2gLN+ZXpVIyHNnfNcjm7AJFQn3gADTmMuv7
         EWItB58cRJt8mmYaoIizXKcqXPajLkb91/YRmnesTtJCsohOTRUuvkoco1ed8mmlJjUA
         2HMPaS0zuCXLAQxmkvRseaHKGOesAYwpgM9m6lXzuAANoQkzodA+l39fonSWG19pWyEn
         YTEog2uxnyjEuGhyWGW8bbApebSg1Iw9TFFlevtVQSk1lLlTQ4ZJ17aOTAHDz6mlcV8r
         pbpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020ac8584b000000b003f68eb3bafesi6835831qth.174.2023.05.24.04.16.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 04:16:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1mS7-0006QV-6a; Wed, 24 May 2023 07:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mS4-0006MK-0b; Wed, 24 May 2023 07:14:44 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mS2-0003ve-1k; Wed, 24 May 2023 07:14:43 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 3738B260BC0;
 Wed, 24 May 2023 13:14:39 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J9lOKbQe7R3R; Wed, 24 May 2023 13:14:36 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 2053D260249;
 Wed, 24 May 2023 13:14:35 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v4 0/3] hw/arm/sbsa-ref: sort out graphics a bit
Date: Wed, 24 May 2023 13:14:10 +0200
Message-Id: <20230524111413.833912-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: iBxxbl+Oezta

Thomas Huth gave me some hints on how to improve sbsa-ref configuration
when it comes to graphics.

With this patchset we are able to start sbsa-ref if qemu is build with
"--without-default-devices" argument given to configure script.

Changes since v3:
- add Bochs display to pci_vga_init() list
- use pci_vga_init() to initialize graphics in sbsa-ref as this allows
  to run with other vga cards as well

Marcin Juszkiewicz (2):
  Add Bochs to list of vga_interfaces
  hw/arm/sbsa-ref: set default display to Bochs

Thomas Huth (1):
  hw/arm: Use MachineClass->default_nic in the sbsa-ref machine

 hw/arm/sbsa-ref.c       | 9 ++++++---
 hw/pci/pci.c            | 2 ++
 include/sysemu/sysemu.h | 2 +-
 softmmu/vl.c            | 6 ++++++
 4 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.40.1

