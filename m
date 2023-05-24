Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2447499ejb;
        Wed, 24 May 2023 03:28:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7QzstnTh5qJOvE7Tqo4mJtRI5EdnyrfFvAgRkgwJWcwyyBm7MocDZZFvb+ob/HEWc1rqhZ
X-Received: by 2002:a37:a802:0:b0:75b:23a1:3617 with SMTP id r2-20020a37a802000000b0075b23a13617mr6178370qke.40.1684924100596;
        Wed, 24 May 2023 03:28:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684924100; cv=none;
        d=google.com; s=arc-20160816;
        b=tmX2DhE3MVOQnvc1Tj8oInnZ/+8jAm8DFSe6Eo8p98ZLZfT5opmzheQqyAxLLqiEnM
         kcKrt3dgTXn77JK85fqW4XJjt3bpsyhFtH42DjBoabs88ISfXYDUqsOni6g6EFE17/ms
         WN2+IPHIRCzItnf4BbmHPM8TB+UKRJyWCFCv+a3e1NapynHhmqlOAsm5VgQyKPTJ3/Qa
         4zRD5uWmx+lXIN/6Ow7WuhK6/ZgdxHdbvWs/QnOsulFc2ovIPvajzcZmRjuTt7jRePZc
         Mn2t4jTG8Nvq+BAXP2b3Umc6ycOAwIGo+mG+gzlPw80bVO6q/TXm7zsuy6Z5ZXGckSeN
         k97g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=m0vnoAedM3ACmNzGh243NipRZFiFDvlodBFWphvhLPI=;
        b=oLaKQWGhMOPUWb091DZa1YVvk25NByBkiIcvZawAy2NST9khNjxFnJ9HpCJlBc1HZH
         E1/CnlUiKppMBut9nBZ+mlgBtTU0+gkWVEawlGGoHmeIxyVa/lRUMhgI9F4AmXZo+ONq
         fro/5XIn+4oAKjYQ3D3El+SP3SsHhu88HKFemTlZNCqmNLaSwiexFX8le6uMGuNZKBuq
         j/WN77uA4Ba7/gYJP+TORfdWDWawGjNy7vBT1ZEULfC9Sjc2Nsu/h3SO8bX47DLw2fUY
         HfoVUMIbWxxe0SQr8b2CPwDVzBdNlcTvFqmB/7NoL1yAuivE7ugACfprwKZTTGoU1Rnr
         jubw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h24-20020a37de18000000b007577c53de4bsi6121007qkj.780.2023.05.24.03.28.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 03:28:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1lid-0007ti-Cf; Wed, 24 May 2023 06:27:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1liX-0007pk-Cb; Wed, 24 May 2023 06:27:42 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1liU-0000OC-RR; Wed, 24 May 2023 06:27:41 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 608C7260C32;
 Wed, 24 May 2023 12:27:36 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7nvkcb2TaNJL; Wed, 24 May 2023 12:27:34 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id CBB31260249;
 Wed, 24 May 2023 12:27:33 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3 0/5] hw/arm/sbsa-ref: sort out graphics a bit
Date: Wed, 24 May 2023 12:27:24 +0200
Message-Id: <20230524102729.810892-1-marcin.juszkiewicz@linaro.org>
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
X-TUID: MGJzzloiMqNI

Thomas Huth gave me some hints on how to improve sbsa-ref configuration
when it comes to graphics.

With this patchset we are able to start sbsa-ref if qemu is build with
"--without-default-devices" argument given to configure script.

Marcin Juszkiewicz (4):
  Add Bochs to list of vga_interfaces
  hw/arm/sbsa-ref: honor "-vga none" argument
  hw/arm/sbsa-ref: add gfx card only if we have pci
  hw/arm/sbsa-ref: use MachineClass->default_display

Thomas Huth (1):
  hw/arm: Use MachineClass->default_nic in the sbsa-ref machine

 hw/arm/sbsa-ref.c       | 11 ++++++++---
 include/sysemu/sysemu.h |  2 +-
 softmmu/vl.c            |  6 ++++++
 3 files changed, 15 insertions(+), 4 deletions(-)

-- 
2.40.1

