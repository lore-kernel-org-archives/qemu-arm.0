Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4918911lfg;
        Tue, 29 Jun 2021 06:03:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyI8neicY9Bqvh641nn1NAIUYuszCnoTyL4i9du/QR8Fljcb7kY2HjFXTyxAP5DHRtlNdCL
X-Received: by 2002:a25:a365:: with SMTP id d92mr39070047ybi.462.1624971792695;
        Tue, 29 Jun 2021 06:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624971792; cv=none;
        d=google.com; s=arc-20160816;
        b=j5ejRC9f7lF/EyLyneYKzrwT9l9ml2nQJJVFzs2njrr2CnY54B5nR46Fc+68TVRhWO
         VGyncTC8MPafsbBXbzYwGIQW4cfN3/PfqNNRXToUEgEFS5O9xOL+4zNHH+sHd0T6183p
         LCDxcqh/wvIEv0SE3wPhatTmDLU8j2y1xSafahAXJ17M6binDVQb6glQ2ThOvjCDPgMq
         A3/hMJGn95d9kgU9rovHe6y/Opx61Bly7ShXj4xid2ABaZN0m1TsYZP9W+AWbTPci+g7
         bMwV3DRun7NhB/Vy5WAnieHLT41loWoE7FynVhHRcF3YM2pL+nXULNylJxBad+kJQrVX
         p0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=Qmw7DXLBFbKAKoRSrQc7hb8uiBfnsz6TQqBBIpswfKU=;
        b=K1sTK1xJZUMZJ6dZ4M2l3vXxkwn5xSNt0WvkpaWpIvuXLbOOK47JXiOC/i53JtHdF3
         BJ9LUBidR5AWYjh/libwrnlzmntZvNcQsRgXRQ/j+xgicgJqF1Hy5fyDnMpmy9jXYlD+
         TCqZyM+SNzag5ven3ip9r7pULvUfWjoAkMQE1TOx89YcGm0KTZan5qrxf1y2b087SayW
         0+YKxOax4mPuJTtHT8mREdy3UV3fTya5YoWJiqjgiHSrcTi3tUoWaOiQxX0zq/t1p+af
         YxbS2XQ6l3aGvo6Dfu3E3gDotVj4GtY3RDPtVWZtjqFbP6i/VE6Sg1E/4UtV+Iy7Ynir
         WZ8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vmware.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h96si19114459ybi.320.2021.06.29.06.03.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 06:03:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vmware.com
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyDOR-0001Ot-Tb
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 09:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hnick@hnick-a01.vmware.com>)
 id 1ly9Ys-0000Qy-9J; Tue, 29 Jun 2021 04:57:42 -0400
Received: from host5-81-53-87.range5-81.btcentralplus.com ([5.81.53.87]:64269
 helo=hnick-a01.vmware.com) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hnick@hnick-a01.vmware.com>)
 id 1ly9Yq-0007xP-Nq; Tue, 29 Jun 2021 04:57:42 -0400
Received: by hnick-a01.vmware.com (Postfix, from userid 501)
 id 00C0CBDE2ED; Tue, 29 Jun 2021 09:15:51 +0100 (BST)
From: Nick Hudson <hnick@vmware.com>
To: 
Subject: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
Date: Tue, 29 Jun 2021 09:15:51 +0100
Message-Id: <20210629081551.14133-1-hnick@vmware.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=5.81.53.87;
 envelope-from=hnick@hnick-a01.vmware.com; helo=hnick-a01.vmware.com
X-Spam_score_int: 27
X-Spam_score: 2.7
X-Spam_bar: ++
X-Spam_report: (2.7 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.301,
 RCVD_IN_PBL=3.335, RDNS_DYNAMIC=0.982, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Jun 2021 08:59:14 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Nick Hudson <hnick@vmware.com>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BOaKzbduACmF

Signed-off-by: Nick Hudson <hnick@vmware.com>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a66c1f0b9e..7267af7924 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6330,7 +6330,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
      * We don't implement the configurable EL0 access.
      */
     { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
-      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
+      .cp = 14, .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
       .type = ARM_CP_ALIAS,
       .access = PL1_R, .accessfn = access_tda,
       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
-- 
2.31.1

