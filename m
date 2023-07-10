Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp517130dle;
        Sun, 9 Jul 2023 23:39:36 -0700 (PDT)
X-Google-Smtp-Source: APBJJlESgo3EYiw90u0fsHtI23Q5dxYC90EXSKcjGRMi1s+9hhfS3s1yWZtLa3px4lfGXXAPbOYS
X-Received: by 2002:a05:620a:2a0c:b0:765:6524:8458 with SMTP id o12-20020a05620a2a0c00b0076565248458mr14318896qkp.36.1688971176167;
        Sun, 09 Jul 2023 23:39:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688971176; cv=none;
        d=google.com; s=arc-20160816;
        b=n7hdtWRLZN+0jp65RfPTj9e9z8VMy4KK6rgZJrFlSBGyaBofMlL983te7pdoVGnKN5
         JM0T3UW3EMHH9YSc85G0ULnaDKPfyQXXs7P7kSKDSYbq3ALiErcgDFQEuiOOUn/yo9xP
         qxvUSn7zhemShFj7/3nFrlGSDyhO+lldn4fqHRFPNj8VbV3wDKmBQdhOvw1wIPl24C8f
         LirnGYw6yq8K+yER5lANLCP/DOksgAKIdXJosYHmCHyDh0xnfBJnymzEibTYQmSEhGSW
         Hn20zR4r+MHrLtTPMTVdyC5Z8bTnS6o9YYKJOKpu3ZKGpdpS11csCeESES1HiAZtrlGH
         azCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=U9mkjWkLBRNIwjSR/NZZDVJTJUlngR2PCI4ZXcLj0eQ=;
        fh=m+atztmj45Qd/LkX8H0+FbRutNyItefegY+LOHd4Ly8=;
        b=SIV8xIGbZ6IcfQZ2fYB02JkQwDuwhzTBwzK3IaX/osWf2eHAuLRsGkKk6GKgU+0Qwz
         ZHsGoVo6nbI/TvDdGor9PLLU7fNWEZUkXMVpqkfCW74OYyjU0DQhdjh0fRnydgrkNYRR
         K0wL7NqXwbdm0xtiAS4Nbz/NuWiar6oHhRrEC+MJecXU/PwWX4oIgZ7rCFkQuIHnpNdN
         /M03pKKNaYogI8Tow8GiLgGOWoumvypGDKE/7w4pwzR21SHlRBURNifjJwjc7+eY3Tr5
         /12sXjPTD4i0p6ROAt/dCTS2Mo+QAkIIfvnR0Z31AZiDLLUnOq+e8Issr6NhZjdZVJlR
         JYOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id br18-20020a05620a461200b00767d49d0ff4si647224qkb.196.2023.07.09.23.39.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Jul 2023 23:39:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qIkY4-0008H8-Dx; Mon, 10 Jul 2023 02:39:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qIkY2-0008GO-SO; Mon, 10 Jul 2023 02:39:02 -0400
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1qIkY1-0000J3-4t; Mon, 10 Jul 2023 02:39:02 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-7 (Coremail) with SMTP id AQAAfwCnMGL8pqtk5U07Aw--.39508S2;
 Mon, 10 Jul 2023 14:36:44 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
 by mail (Coremail) with SMTP id AQAAfwBn0650p6tkw1kAAA--.693S3;
 Mon, 10 Jul 2023 14:38:45 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: rad@semihalf.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 chenbaozi@phytium.com.cn, Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH 0/1] hw/arm/sbsa-ref: set 'slots' property of xhci
Date: Mon, 10 Jul 2023 14:37:49 +0800
Message-Id: <20230710063750.473510-1-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwBn0650p6tkw1kAAA--.693S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQAQAWSrBqcBqwAEsQ
Authentication-Results: hzbj-icmmx-7; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
Received-SPF: pass client-ip=209.97.181.73;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmja5ljk3lje4ms43mwaa.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: RNdm4eOkXdIL

As the default xhci_sysbus just supports only one usb slot, it can not
meet the working requirement of this bord. Therefore, we extend the 
slots of xhci to 64.

Yuquan Wang (1):
  hw/arm/sbsa-ref: set 'slots' property of xhci

 hw/arm/sbsa-ref.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.34.1

