Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6535992lfc;
        Tue, 16 Feb 2021 07:02:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmRjjb+g9V/wd6B17RtYrwTAf1v5RqbF1SZo7jo1Z8+nmLKsabcPVtOA8QW8pbq801hdhx
X-Received: by 2002:a5b:2cb:: with SMTP id h11mr31395178ybp.428.1613487733735;
        Tue, 16 Feb 2021 07:02:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613487733; cv=none;
        d=google.com; s=arc-20160816;
        b=mNtrGE/ciObtOdKG6lLukhrMn3wxJ7vvSAU6c7suTKp40JIDrs9Ki9+8tjtt1zrF7b
         bEqrJHrH95Nr6f41E3qik5+p3dgR+SyRmBkdqIOlhhqnXkd19nquhQSpwBg6vDAgSPA2
         ITlGkXHWIwPvEImANjr3DZKx8Qg/3L7uQhLkeCjiY/AXHBw1Bd91NK1PIEfpV63+urMy
         XR83uFL7hN6vSMUGWM1mMAgVseXaavHHXbBZOdXGhidTflJ/uVhIFBsmi8XsGY7CgcFQ
         TZlCye31AgCRw+xAWhOkp6IjkNckMaON6lPYJbD9bbCt2PO+naojkxl/f4Pi0Xj9zs0z
         gqPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=sLxu4SIqFTZnGgsuvN1WLm5qUeLpsMafa/Gzt/uyMKQ=;
        b=QifYtpLBeqKm5bWdjNPx06ThYn3Wlh4vuzGvUfFCw65sUHjoToWz0zmAZ9ofH2FR98
         tuWoNCiLVioOH6zlVwOd8kfx5v6x24bsGCRScdnStWJe1MqElKBBRSeJJcDzW8597Y9N
         SoSePjaN2hKkERDMP45ADooIdKvOrnZW+uNgq7RwKoeNoQas3Dan008ob8zvH5u54yMf
         gmQpbUfr+RD9psExx+cCd5NSpoM5H6jyZ2KnGvYv5PP5k3GsF2QmQOXNwVcYOl2j07UH
         dGvChzMnBMDPrfJDBmFBghJVzfObDdDfKB6dO3FFCFM8kaMPcpmwYjE0IVBbsvxnUD6g
         tllA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si8354776ybk.63.2021.02.16.07.02.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 07:02:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lC1rg-0002b1-Ns
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 10:02:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lC1rF-0002ZD-JU; Tue, 16 Feb 2021 10:01:45 -0500
Received: from muminek.juszkiewicz.com.pl ([2001:41d0:1:43dd::1]:48912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lC1rD-00068i-Oo; Tue, 16 Feb 2021 10:01:45 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 981EB2606BA;
 Tue, 16 Feb 2021 16:01:39 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fl2vFTSPBcea; Tue, 16 Feb 2021 16:01:37 +0100 (CET)
Received: from puchatek.com (89-67-26-161.dynamic.chello.pl [89.67.26.161])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 9D0B3260131;
 Tue, 16 Feb 2021 16:01:35 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 0/2] sbsa-ref: update list of supported cpus
Date: Tue, 16 Feb 2021 16:01:20 +0100
Message-Id: <20210216150122.3830863-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2001:41d0:1:43dd::1;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Leif Lindholm <leif@nuviainc.com>,
 =?UTF-8?q?Rados=C5=82aw=20Biernacki?= <rad@semihalf.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4GSOuWlgiD24

Cortex-A53 goes away due to 40-bit address space (so below sbsa-ref
default memory map) and 'max' goes in as we want to be able to test SVE
support.

Marcin Juszkiewicz (2):
  sbsa-ref: remove cortex-a53 from list of supported cpus
  sbsa-ref: add 'max' to list of allowed cpus

 hw/arm/sbsa-ref.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

