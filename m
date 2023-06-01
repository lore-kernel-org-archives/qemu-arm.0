Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp214644ejb;
        Wed, 31 May 2023 23:39:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4y37JSCVL8oJnrc2ohH6g5Rdrfb2DNqTaLC6iW3LWIITwEN/oczZ27sN9jOynRgnu//41q
X-Received: by 2002:a05:620a:24ca:b0:75b:23a1:8353 with SMTP id m10-20020a05620a24ca00b0075b23a18353mr9874758qkn.78.1685601548327;
        Wed, 31 May 2023 23:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685601548; cv=none;
        d=google.com; s=arc-20160816;
        b=fNueYrfVRGk2fxfGwynSABBLkTriUK0Q8+yRytuWofCR95QY0f/Lkc+qkr8kGJM93R
         dWBVAB/x0V3q2gTJPGtDkagzOg1WlXphF0EQuHzsw1063ltx6vAXX437xq/zxe5+c0kn
         qUACe3Ov3Ewv6E9TV2dyfezhv5eAMeUT/24OEkluixlcoVHrNoCou0cKLO6WsP/7wN/D
         x3HyN2Yl+ShgodBnYIXssrsIzQ3MBL2Pfwy/o2r9/q1t1wDG8wukVdLwR3oUJFOmfGzv
         cL47gn7MRSd4W1ZqzfpKFquAOYf0cq/tljaUf/8qPaZO+CAkb7tm/GEIky9HHR/sSVDc
         Zddg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=WOUOB/NcoTVYwPENWjowRIDXezkMGh1tmTL1bY1jsrY=;
        b=GnuQGV0RvfDnqbv9PQaLExhGBh69awh2tkmHo9hZ7VJaQh9fz7YxVdkBRB14qx4BlR
         SzsFNmL6myrXOJJcY+N31yxWMvoTcxUkDlXaN9mWw2szrl8fwatM9g65/gJORiP833yq
         cfQv9JvAlcHCdDFnj5Yj7j8QlCVTFfrMRQ6tTEEwJJtvpZqttNEJgmYzbbd86f5wbBE6
         rDpEovwcf615oXDEDq38yxw9HYqeo18CrmZyUvYZ8pE6e1IksYu8EHLSbp5wDVyLJ0kO
         bYWdUyc/BBYsY5UcTM+ORK4MsmxvEe5BUYlnkQzpNnLuLkEZ8BTSH+nv+Bx/QX6B0mov
         U8DQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d21-20020a05620a167500b0075783b0d4f6si9167904qko.442.2023.05.31.23.39.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 23:39:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4bxQ-0002ZQ-UY; Thu, 01 Jun 2023 02:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q4bxK-0002Ka-QD; Thu, 01 Jun 2023 02:38:43 -0400
Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net ([162.243.164.118])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wangyuquan1236@phytium.com.cn>)
 id 1q4bxD-0004g8-QL; Thu, 01 Jun 2023 02:38:39 -0400
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwCXYNbfPXhkisA8AQ--.47883S2;
 Thu, 01 Jun 2023 14:42:39 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
 by mail (Coremail) with SMTP id AQAAfwD3JV_iPHhkoIgAAA--.5009S3;
 Thu, 01 Jun 2023 14:38:27 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: rad@semihalf.com,
	peter.maydell@linaro.org
Cc: quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 chenbaozi@phytium.com.cn, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Yuquan Wang <wangyuquan1236@phytium.com.cn>
Subject: [PATCH v2 0/1] hw/arm/sbsa-ref: add XHCI controller on PCIe
Date: Thu,  1 Jun 2023 14:37:36 +0800
Message-Id: <20230601063737.464751-1-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAfwD3JV_iPHhkoIgAAA--.5009S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQARAWR3nCkBFgACsi
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
 1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
 nUUI43ZEXa7xR_UUUUUUUUU==
Received-SPF: pass client-ip=162.243.164.118;
 envelope-from=wangyuquan1236@phytium.com.cn;
 helo=zg8tmtyylji0my4xnjqumte4.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: G/S9XKaAROm4

Please review the change.
 - sbsa-ref: Add an XHCI on PCIe bus to provide an availiable
             usb controller.

Yuquan Wang (1):
  hw/arm/sbsa-ref: add XHCI controller on PCIe

 hw/arm/sbsa-ref.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.34.1

