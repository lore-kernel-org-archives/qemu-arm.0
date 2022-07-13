Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp368549lfp;
        Wed, 13 Jul 2022 13:46:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vEof2MP9W9GEkx7+t9xDtPDwJMOXjLCpEOoTPE0R6zB9dLHalDFDxZOaYZQQxuvgKzaUY/
X-Received: by 2002:ad4:5b83:0:b0:473:8ba5:b57f with SMTP id 3-20020ad45b83000000b004738ba5b57fmr4778693qvp.74.1657745188496;
        Wed, 13 Jul 2022 13:46:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657745188; cv=none;
        d=google.com; s=arc-20160816;
        b=KXvOAFVxFE2ch01MYQ3LNsTwgg3vCs0IgDKT2Ira859VkC5RdUspYjYBavSFgZyeD9
         L6ziBqzvS9f+ztf48AGcBGMd1mp26exAFAI7q4HR2LCLLAPVCVd9pHNpzSGF0j2z0U6r
         wQB1aC1i0nIZ297fKINOxER/e4R2OzfDSixNrxXcV8nEWp9hiye0h1N/LVTqRrLq5eK/
         AAWXbUmzIfetP/aVlpTNfuTV8le9+7ljWZOdNCN/LQoctBeAjLrozFyUdPHWbmzLcZHd
         OCBuhnErOCWk/0gv2tP8526PSJJJA/rYai5NIkMmI7vBBm+fXxusxhVdsA1FCmnRTEAF
         r5jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=yPXNydkjX/8U4i5olyu7YeqbBY4Be017zHzlMVKR1OI=;
        b=GVVQO4R7AAY1kVdTtlQgeg1j7ra9iYZkIIjZ5iii+mgfTMgOAcmCZyDn2jIHTuNjYe
         EZY9CZJAZ1gbq536Mi6HVsD/BaEztsMJFwx5k2fHGjvw0dabN+NE9FBEGCmP1R1jseki
         59TVKOhawpnQb1ZyiMYEgIBhPSkqRCka2zLeEnBCf1HRcqX7YHQNf/+xWA1OiZElFTIx
         jpDK/XKeZEQL4xxOhiL/xXzyTUSxGZxoVdiaHrbbycUY8NR3mWY180d08OVjo0M6JFDG
         l9gsD4AkuWqDDPxNWFNXrC/sda2BLEHYsAd4AthiRXL81z+UmNfSIbRy0EGnJfpeB6Jl
         emEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a68-20020a379847000000b006b24143b5e6si7925407qke.195.2022.07.13.13.46.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 13:46:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBjFc-0004sY-0N
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 16:46:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwN-0006ar-FU; Wed, 13 Jul 2022 13:14:23 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114]:38710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwL-0003BI-JB; Wed, 13 Jul 2022 13:14:22 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oBfdU-003M8n-0v; Wed, 13 Jul 2022 17:54:51 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
 (envelope-from <ben@rainbowdash>) id 1oBfdS-0009ke-1U;
 Wed, 13 Jul 2022 17:54:50 +0100
From: Ben Dooks <ben.dooks@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>
Subject: updates for designware pci-host
Date: Wed, 13 Jul 2022 17:54:42 +0100
Message-Id: <20220713165449.37433-1-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114; envelope-from=ben@codethink.co.uk;
 helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jul 2022 16:45:07 -0400
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cx8ULIcWee4F

As part of a project we have been looking at using the DesignWare
PCIe host. We found a few issues of missing features or small bugs
when using this with a recent Linux kernel (v5.17.x)

Whilst doing this we also made a start on some tracing events.


