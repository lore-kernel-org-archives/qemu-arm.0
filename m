Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2678151ejb;
        Mon, 5 Jun 2023 02:57:10 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7Jmf6XzVIKhuGaFVeYDqhu+hBNamV8yEafnZlX0G9ibxSUMdvx73VJXSk/ck8CdcCbLtbt
X-Received: by 2002:a05:620a:47a7:b0:75b:23a1:47b with SMTP id dt39-20020a05620a47a700b0075b23a1047bmr20725463qkb.65.1685959029999;
        Mon, 05 Jun 2023 02:57:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685959029; cv=none;
        d=google.com; s=arc-20160816;
        b=ELOtm0xxi2vs3+rW0gGMfCjkytZRBvbhoDEGqTFis6091cMCxBuJr887CS6pSSdilH
         kFTgaH+3YYKNhlej7x0WI/vtdNEX6wLA14nRQSnS/ZHfY09MzYvtjxP6XxP2PqL/JBIN
         cp9aPWmwp3xgn6T1Ve8YvMXswMEKhW9d6Er60FrEB8n4L2q4Zf4feLdPEjt+0YlKnHSb
         Mp8P0F7yzsrrdkSs3iQUJuVgGNm/4pPSMISCTDqGPSOaL1sFgGZ7FspgJZWnwLy+TYHt
         eArAT0MqW/UEYsIx0m5qh366rHOvlW35A7D3+z9gKvgEf0nL3CbmT5/yrLJed6C3AMYq
         flPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=RAn17BJeVf/5M6TAaE9eKM5nt29ipIRHy+sKsEGAA7o=;
        b=ut5zoo+SAlGdHTHk58pNVgYEa/XVviMGJfw+EBM8KIuUAY054uLeCbmKGmqHvYIRYU
         FqHJj34/Zcg60394QDQtShtwB4vFLSiNHxakBs0Rx2R1aUPtyVdbxmegQEqoaEKCbgnH
         sY4IrotzQedu/PZkrP7qeyOv0cHU+roscE1F7LRNY/i2JuGJx5yR/bxRzyRdgbxzKVQf
         9Xue16Fje8cV0g382Lkk1Zq2I1pZY/jZs35amei1u3wv/+7gc0g4a+CTxK2o6r331Kq7
         rI4SjTVWQ9fX1cDoqlQoimQQulhBraIEGOR9PUKEFiGb4B8xvZ0Zv93TH0V4Q2RBWx50
         NLnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12-20020ac858cc000000b003f8698c94edsi2539555qta.211.2023.06.05.02.57.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 02:57:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q66xS-0001XH-5S; Mon, 05 Jun 2023 05:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q66ww-0001TA-7U; Mon, 05 Jun 2023 05:56:32 -0400
Received: from sgoci-sdnproxy-4.icoremail.net ([129.150.39.64])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q66wt-0007cR-OD; Mon, 05 Jun 2023 05:56:29 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwD32pXbsH1kv55LAg--.18348S2;
 Mon, 05 Jun 2023 17:54:35 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
 by mail (Coremail) with SMTP id AQAAfwBnkiIwsX1k8YwAAA--.784S3;
 Mon, 05 Jun 2023 17:56:01 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: rad@semihalf.com,
	peter.maydell@linaro.org
Cc: quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH v3 0/1] use XHCI to replace EHCI
Date: Mon,  5 Jun 2023 17:55:35 +0800
Message-Id: <20230605095536.117384-1-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwBnkiIwsX1k8YwAAA--.784S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQABAWR84icD5wAIsw
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
Received-SPF: pass client-ip=129.150.39.64;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=sgoci-sdnproxy-4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: FUF1UMAWhkBL

Please review the change.
 - sbsa-ref: Replace EHCI with XHCI on sysbus.

Yuquan Wang (1):
  hw/arm/sbsa-ref: use XHCI to replace EHCI

 hw/arm/sbsa-ref.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

-- 
2.34.1

