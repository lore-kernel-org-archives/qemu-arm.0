Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp560862lfq;
        Wed, 9 Sep 2020 09:22:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZrTXIlhnMkCpjVLz8rMw4Uz2RwYLgL1rdoINv151SaR1Wh1eljt+dhRVB9evFgu9GE+7i
X-Received: by 2002:a25:5887:: with SMTP id m129mr7433440ybb.11.1599668540448;
        Wed, 09 Sep 2020 09:22:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599668540; cv=none;
        d=google.com; s=arc-20160816;
        b=rtVZLhVz1/Eu68w4iP+anr8qKlIaKbz/M9N9RGHaHblCKnFAe+XFzrfNVRH/QpnfNZ
         vmPFtnpqaCgJFVvnvdywoGWNMxn7Ze3r2aIJ7eUCZFCCeSRNTADoNtPv4iR1WT/d5cGx
         89GXJuRcoVS+VTCd8Asn4iCkeNgIt209fr9qFeBQSFiMytdqc05qTIJvan72v0EcJZYf
         ypE6wi7p8qpYMkl8MTXxdL40Jcjve/L1AHCbQdLZ0HxFbhL+60hPSJ2uESIfRtQZySdn
         sNMkwtTuqbndxz84ljE32StdDSWTHLca5qXd3KRpKpFqMdubryY0ont8ajwMIBNFILVK
         DO4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=6/NYwDNd+IA/YDq3B0TD+rKGxUyX1pBK+vG8qzvYuPM=;
        b=G/2++HdC24m5s420KK9d21Tnbe8z5vFT75OM1Z39Vh/PZrBN3MGhckACIxggTvGUIq
         5H7xv/j9Gq00rhrzq15VffuY/67/DFUc3d9ZGHzoWkoDvtd8zvMUjan7kn3UBAOw5Q3P
         5B8lXb88kG7/PRqRKui4eJjqWMZpkINf+dpUVbYWi2rgmnxdTHuux3vEPzkBNl8vwzQX
         lQhTJwLMR7jmn14YwtXH4ARhMJD+PofvFw2ddjjpw2pMW6fCztybpJo5u6tzkFifmM0P
         r1admaC/6u9tBN12Yml3TNaoyAhQkBft6/INrB7i1X2XQaHzYue/lOPXkvxA4E4ivfQz
         /NRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FhfCty2Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2si3041117ybg.304.2020.09.09.09.22.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 09:22:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=FhfCty2Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kG2rT-0001bi-S7
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 12:22:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kG2ki-0000gK-2n; Wed, 09 Sep 2020 12:15:20 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:46108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1kG2kg-0006YW-OC; Wed, 09 Sep 2020 12:15:19 -0400
Received: by mail-lj1-x243.google.com with SMTP id a22so4268201ljp.13;
 Wed, 09 Sep 2020 09:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6/NYwDNd+IA/YDq3B0TD+rKGxUyX1pBK+vG8qzvYuPM=;
 b=FhfCty2ZHr0zp75cdnJt4Mky/XEhYKNK2gcryrVt+74OLGS9ZLONQnrN1Pcqx4XAvA
 KumvRmFHfUogniMgO+PEDO3CmZD5AxzXEPQ5TabtX1qHMF8LjmcJz+EagrfGfYkQBrBl
 fTp9hHRzbiGAst63YhFsiKZ9Bf5kXMzmgY1PC4JhYTwBDO86EL6lPS2OCj9OieA/fN7F
 MCYadV96fFwAEKLtYq1DtENCkEo1ixMEesNoBDaPt+j9y7/Ms5mbicInzbVSyWhdVeDt
 to/wha2t0XdB5sC7cXwSmj+byBayrKVSl6JDkcADcd5NBDfSxIovzEraPpY+vu+nokHe
 xH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6/NYwDNd+IA/YDq3B0TD+rKGxUyX1pBK+vG8qzvYuPM=;
 b=Z15CfSNo83aAlTUk043P21RWlSA8l1q9WmxOTthX8BugydI/sImiDU2peeJf62nG4/
 y1hsMMNVErUgkTWG3SsZitH+FI36XqjHCrutnWinRa/nkvKKbn8wdzGmTDoFpUGkYSR7
 sx0vq4deFIP7UdScNeDETHuRBvtRApDUz8rvqAvW+2/6XXWtyMRpknn/NA6MdL1AOMZ/
 w2jXkoavgamGzpSkT2emtMMQtmNdZe7oP2FKKbIeYBtKojRqyTuhqDy8eY8+WUmpT2fx
 ELSPOuVpMj7Xvf9GadmTHqgedjt0smeKz2b3z+NiVPPcDPB1VlrQ5WrfR0/bwZFImd1r
 0ozg==
X-Gm-Message-State: AOAM532t5s/uyBxN5shPXRvxxKcgFkXbjmxO7tbEMNVnOrjmugoFTpmU
 Qc8qohVWzR3m53m1SH1dxZacL8AgdhI=
X-Received: by 2002:a2e:818b:: with SMTP id e11mr2383129ljg.0.1599668115493;
 Wed, 09 Sep 2020 09:15:15 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id z15sm845518lji.78.2020.09.09.09.15.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 09:15:14 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/1] hw/arm: versal-virt: Correct the tx/rx GEM clocks
Date: Wed,  9 Sep 2020 18:15:13 +0200
Message-Id: <20200909161514.622998-1-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x243.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=1.8, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zfZ4V5PQGAZC

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

This corrects the Ethernet tx/rx clocks in the generated DTB.
Avoids a Linux kernel warning.

Cheers,
Edgar

Edgar E. Iglesias (1):
  hw/arm: versal-virt: Correct the tx/rx GEM clocks

 hw/arm/xlnx-versal-virt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.25.1

